#!/bin/fish

# APT packages to install.
set APT_PACKAGES \
	"aria2" \
	"curl" \
	"fish" \
	"git" \
	"tmux"

# DNF repositories to use.
set DNF_REPOS \
	"https://download.opensuse.org/repositories/shells:fish:nightly:master/Fedora_33/shells:fish:nightly:master.repo"

# DNF packages to install.
set DNF_PACKAGES \
	"aria2" \
	"curl" \
	"fish" \
	"git" \
	"golang" \
	"npm" \
	"openssl-devel" \
	"pandoc" \
	"texlive-scheme-full" \
	"tmux"

# NPM packages to install.
set NPM_PACKAGES \
	"bash-language-server" \
	"yarn"

# Rust (cargo) packages to install.
set RUST_PACKAGES \
	"bat" \
	"exa"

#################################################
# Setup
#################################################
# Checks if SSH key exists. Needed for git work.
if not test -e ~/.ssh/id_rsa
	echo "SSH key not found. Make sure it is in the correct location!"
	exit 1
end

function os_check --description "Determine OS."
	if type -q awk; and test -e /etc/os-release
		set UNAME (awk -F= '/^NAME/{print $2}' /etc/os-release)
	else
		echo "Unable to determine OS. Exiting."
		exit 1
	end

	# Replace beginning quotation mark in UNAME
	set --global UNAME (string replace \" "" (echo $UNAME | awk '{print $1;}'))
end

# Pre-run tasks.
function pre_run --description "Pre installation preparation."
	mkdir -p ~/.local/bin
end

#################################################
# Fedora Setup
#################################################
# Install and configure DNF repositories.
function fedora_configure_repositories "Install and configure DNF repositories."
	for repo in $DNF_REPOS
		sudo dnf config-manager $repo --assumeyes --add-repo
	end
end

# Upgrade and install packages on a Fedora system.
function fedora_upgrade_and_install --description "Upgrade and install packages on a Fedora system."
	echo "Upgrading system..."
	sudo dnf upgrade -y

	echo "Installing development tools..."
	sudo dnf groupinstall -y "Development Tools"

	echo "Installing user packages..."
	sudo dnf install $DNF_PACKAGES --assumeyes --refresh
end

#################################################
# Miscellaneous Package Setup/Install
#################################################
function chezmoi_install --description "Install chezmoi."
	echo "Installing chezmoi..."
	curl -sfL https://git.io/chezmoi | sh
	mv ~/bin/chezmoi ~/.local/bin
	rm -rf ~/bin
end

function chezmoi_setup --description "Setup chezmoi."
	echo "Setting up dotfiles..."
	~/.local/bin/chezmoi init git@github.com:gnuyent/notes.git
end

function npm_install --description "Install NPM packages."
	sudo npm install -g npm
	sudo npm install -g $NPM_PACKAGES
end

function rust_install --description "Install Rust (cargo)."
	echo "Installing rust..."
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs -o /tmp/rustup.sh
	sh /tmp/rustup.sh -y
	echo "Cleaning up rust installation files..."
	rm /tmp/rustup.sh
end

function rust_install_packages --description "Install rust-related packages."
	~/.cargo/bin/cargo install exa bat
	echo "Installing rust-analyzer..."
	curl -L https://github.com/rust-analyzer/rust-analyzer/releases/latest/download/rust-analyzer-linux -o ~/.local/bin/rust-analyzer
	chmod +x ~/.local/bin/rust-analyzer
end

#################################################
# Script runner
#################################################
function main
	os_check
	switch $UNAME
		case Fedora
			fedora_configure_repositories
			fedora_upgrade_and_install
		case Ubuntu
			echo "Not implemented yet."
	end
	pre_run

	chezmoi_install
	chezmoi_setup
	npm_install
	rust_install
	rust_install_packages
end

main

echo "Restart highly recommended."
echo "Done!"
