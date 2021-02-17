#!/bin/sh

sudo dnf config-manager --add-repo https://download.opensuse.org/repositories/shells:fish:nightly:master/Fedora_33/shells:fish:nightly:master.repo

echo "Upgrading system..."
sudo dnf upgrade -y

echo "Installing development tools..."
sudo dnf groupinstall -y "Development Tools"

echo "Installing user packages..."
sudo dnf install -y aria2 curl fish git golang npm openssl-devel pandoc texlive-scheme-full tmux

mkdir -p ~/.local/bin

sudo npm install -g yarn

echo "Installing chezmoi..."
curl -sfL https://git.io/chezmoi | sh
mv ~/bin/chezmoi ~/.local/bin
rm -rf ~/bin

echo "Setting up dotfiles..."
~/bin/chezmoi init git@github.com:gnuyent/notes.git

echo "Installing rust..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs -o /tmp/rustup.sh
sh /tmp/rustup.sh -y

~/.cargo/bin/cargo install exa bat

echo "Installing rust-analyzer..."
curl -L https://github.com/rust-analyzer/rust-analyzer/releases/latest/download/rust-analyzer-linux -o ~/.local/bin/rust-analyzer
chmod +x ~/.local/bin/rust-analyzer

echo "Cleaning up..."
rm /tmp/rustup.sh

echo "Done!"
