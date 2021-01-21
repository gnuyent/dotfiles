#!/bin/sh

sudo dnf config-manager --add-repo https://download.opensuse.org/repositories/shells:fish:nightly:master/Fedora_33/shells:fish:nightly:master.repo

echo "Upgrading system..."
sudo dnf upgrade -y

echo "Installing development tools..."
sudo dnf groupinstall -y @development-tools

echo "Installing user packages..."
sudo dnf install -y aria2c curl fish git golang npm openssl-devel ssh texlive-scheme-full tmux

echo "Installing chezmoi..."
curl -sfL https://git.io/chezmoi | sh

echo "Setting up dotfiles..."
~/bin/chezmoi init git@github.com:gnuyent/notes.git

echo "Installing rust..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs -o /tmp/rustup.sh
sh /tmp/rustup.sh -y

~/.cargo/bin/cargo install exa bat

~/.cargo/bin/bat cache build

echo "Cleaning up..."
rm /tmp/rustup.sh

echo "Done!"
