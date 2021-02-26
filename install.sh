#!/bin/bash

# APT packages to install.
APT_PACKAGES=(
	"aria2"
	"curl"
	"fish"
	"git"
	"tmux"
)

# DNF copr repositories to use.
DNF_COPR=()

# DNF repositories to use.
DNF_REPOS=(
	"https://download.opensuse.org/repositories/shells:fish:nightly:master/Fedora_33/shells:fish:nightly:master.repo"
)

# DNF packages to install.
DNF_PACKAGES=(
	"aria2"
	"curl"
	"fish"
	"git"
	"golang"
	"npm"
	"openssl-devel"
	"pandoc"
	"ripgrep"
	"texlive-scheme-full"
	"tmux"
	"util-linux-user"
)

# NPM packages to install.
NPM_PACKAGES=(
	"bash-language-server"
	"yarn"
)

# Rust (cargo) packages to install.
RUST_PACKAGES=(
	"bat"
	"exa"
	"hyperfine"
)

RED=$(tput setaf 1)
YELLOW=$(tput setaf 3)
CYAN=$(tput setaf 6)
WHITE=$(tput setaf 7)
NC=$(tput sgr0) # No Color

ERROR="    [${RED}!${NC}]"
INFO="    [${CYAN}i${NC}]"
QUESTION="    [${YELLOW}?${NC}]"
COMMAND="     ${WHITE}>${NC} "

clear
echo
echo "        gnuyent dotfile installation script"
echo
sleep 2

#################################################
# Setup
#################################################
if ! [[ "${EUID}" = 0 ]]; then
	echo "${INFO} Requesting sudo password..."
	sudo -k # ask for password on next sudo
	if sudo true; then
		true
	else
		echo "${ERROR} Wrong sudo password."
		exit 1
	fi
	echo
fi


# Copy SSH keys to SSH user directory.
copy_ssh () {
	# See if given directory exists and SSH keys are present
	if [ $# -eq 1 ] && [ -d "$1" ] && [ -f "${1}/id_rsa" ] && [ -f "${1}/id_rsa.pub" ]; then
		SSH_DIR="{$1}"
		LOCAL_SSH_DIR=~/.ssh

		# If we already have SSH keys, ask to overwrite.
		if [ -e "${LOCAL_SSH_DIR}" ] && [ -f "${1}/id_rsa" ] && [ -f "${1}/id_rsa.pub" ]; then
			#if not read_confirm "Overwrite SSH keys?"
			read -p "${QUESTION} Overwrite SSH keys (y/n)? " -r choice
			case "${choice}" in
				y|Y ) :;;
				* ) return 1;;
			esac

			# Copy files over
			mkdir --parents "${LOCAL_SSH_DIR}"
			cp "$SSH_DIR/id_rsa" "${LOCAL_SSH_DIR}/id_rsa"
			cp "$SSH_DIR/id_rsa.pub" "${LOCAL_SSH_DIR}/id_rsa.pub"

			# Set SSH key permissions
			chmod 700 "${LOCAL_SSH_DIR}"
			chmod 600 "${LOCAL_SSH_DIR}/id_rsa"
			chmod 644 "${LOCAL_SSH_DIR}/id_rsa.pub"

			echo "${INFO} Copied SSH keys to ${LOCAL_SSH_DIR}."
		fi

	elif [ $# -eq 0 ]; then
		return 0
	else
		echo "${ERROR} Invalid SSH directory specified."
		echo "${INFO} Not copying SSH keys."
		echo
	fi
}

copy_ssh "$@"

# Checks if SSH key exists. Needed for git work.
if ! [ -f ~/.ssh/id_rsa ]; then
	echo "${ERROR} SSH key not found. Make sure it is in the correct location."
	echo
	exit 1
fi

# Pre-installation preparation.
pre_run () {
	echo "${INFO} Preparing system..."
	mkdir -p ~/.local/bin
	echo
}

##################################################
## Fedora Setup
##################################################
fedora_configure_repositories () {
	echo "${INFO} Configuring DNF repositories..."
	sleep 1
	for repo in $DNF_REPOS
	do
		echo "    ${COMMAND} dnf config-manager --add-repo ${repo}"
		sudo dnf config-manager --assumeyes --add-repo $repo --quiet
	done

	echo
	echo "${INFO} Configuring DNF COPR repositories..."
	sleep 1
	for copr in $DNF_COPR
	do
		echo "    ${COMMAND} dnf copr enable ${copr}"
		sudo dnf copr enable $copr --assumeyes --quiet
	done
	echo
}


fedora_upgrade_and_install () {
	echo "${INFO} Upgrading system..."
	echo "    ${COMMAND} dnf upgrade"

	sleep 1
	sudo dnf upgrade --assumeyes --quiet

	echo
	echo "${INFO} Installing development tools..."
	echo "    ${COMMAND} dnf groupinstall 'Development Tools'"

	sleep 1
	sudo dnf groupinstall "Development Tools" --assumeyes --quiet

	echo
	echo "${INFO} Installing DNF packages..."
	echo "    ${COMMAND} dnf install ${DNF_PACKAGES[*]}"

	sleep 1
	sudo dnf install ${DNF_PACKAGES[*]} --assumeyes --refresh --quiet

	echo
}

##################################################
## Miscellaneous Package Setup/Install
##################################################
chezmoi_install () {
	echo "${INFO} Installing chezmoi..."
	if hash chezmoi 2>/dev/null; then
		echo "    ${INFO} Chezmoi was already installed."
		echo
	else

		echo "    ${COMMAND} curl-sfL https://git.io/chezmoi | sh"
		cd ~
		curl -sfL https://git.io/chezmoi | sh
		mv ~/bin/chezmoi ~/.local/bin
		rm -rf ~/bin
		echo "    ${INFO} Setting up dotfiles..."
		~/.local/bin/chezmoi init git@github.com:gnuyent/dotfiles.git
		~/.local/bin/chezmoi apply
		echo
	fi
}

npm_install () {
	echo "${INFO} Upgrading npm..."
	echo "    ${COMMAND} npm install -g npm"
	sudo npm install -g npm --silent
	sleep 1

	echo
	echo "${INFO} Installing npm packages..."
	echo "    ${COMMAND} npm install -g ${NPM_PACKAGES[*]}"
	sudo npm install -g ${NPM_PACKAGES[*]} --silent
	echo
}

poetry_install () {
	echo "${INFO} Installing Poetry..."
	if hash poetry 2>/dev/null; then
		echo "    ${INFO} Poetry was already installed."
		echo
	else
		echo "    ${COMMAND} curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python -"
		curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python - 2>/dev/null
		echo
	fi
}

rust_install () {
	echo "${INFO} Installing Rust..."
	if hash cargo 2>/dev/null; then
		echo "    ${INFO} Rust toolchain was already installed."
		echo
	else
		echo "    ${COMMAND} curl -sSf https://sh.rustup.rs"
		curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs -o /tmp/rustup.sh
		sh /tmp/rustup.sh -y --quiet
		rm /tmp/rustup.sh
		echo
	fi
}
#
rust_install_packages () {
	echo "${INFO} Installing Rust packages..."
	echo "    ${COMMAND} cargo install ${RUST_PACKAGES[*]}"
	~/.cargo/bin/cargo install ${RUST_PACKAGES[*]} --quiet
	echo
}

rust_analyzer_install () {
	echo "${INFO} Installing rust-analyzer..."
	if ! hash rg 2>/dev/null; then
		echo "    ${ERROR} ripgrep is not installed. Not installing rust-analyzer."
		echo
	else
		latest_version=$(curl -sL https://github.com/rust-analyzer/rust-analyzer/releases/latest | rg -o -P -m 1 '(?<=<code>).*(?=</code>)')
		if hash rust-analyzer 2>/dev/null; then
			local_version=$(rust-analyzer --version | rg -o --pcre2 '(?<= )(.*)')
			text="Install"
		else
			local_version=""
		fi

		if [[ $latest_version == $local_version ]]; then
			echo "    ${INFO} Installed version of rust-analyzer (${local_version}) is up to date."
		else
			mkdir -p ~/.local/bin/
			echo "    ${COMMAND} curl -sL https://github.com/rust-analyzer/rust-analyzer/releases/latest/download/rust-analyzer-linux"
			curl -sL https://github.com/rust-analyzer/rust-analyzer/releases/latest/download/rust-analyzer-linux -o ~/.local/bin/rust-analyzer
			chmod +x ~/.local/bin/rust-analyzer
		fi
		echo
	fi
}

##################################################
## Script runner
##################################################
main () {
	if hash dnf 2>/dev/null; then
		echo "${INFO} Running Fedora installation..."
		echo
		fedora_configure_repositories
		sleep 1
		fedora_upgrade_and_install
		sleep 1
	elif hash apt 2>/dev/null; then
		echo "${INFO} Computer is running Ubuntu."
		echo "${ERROR} Not implemented yet."
		exit 1
	else
		echo "${ERROR} Unable to detect OS."
		exit 1
	fi

	pre_run
	sleep 1

	chezmoi_install
	sleep 1
	npm_install
	sleep 1
	poetry_install
	sleep 1
	rust_install
	sleep 1
	rust_install_packages
	sleep 1
	rust_analyzer_install
	sleep 1
}

main

echo "${INFO} Done!"
echo
