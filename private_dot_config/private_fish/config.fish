set --export SHELL /usr/bin/fish
set --export EDITOR nvim
set --export BAT_THEME "ForestNightItalics"

# Custom bin
if test -e $HOME/.local/bin
    set PATH $HOME/.local/bin $PATH
end

# Rust
if test -e $HOME/.cargo/bin
    set PATH $HOME/.cargo/bin $PATH
end

# Go
if test -e $HOME/go/bin
    set PATH $HOME/go/bin $PATH
end

# Dotnet
if test -e $HOME/.dotnet
    set PATH $HOME/.dotnet $PATH
end

# cowsay
function fish_greeting
    fortune | cowsay
end

# ctrl+z
function fish_user_key_bindings
    bind \cz 'fg 2>/dev/null; commandline -f repaint'
end

# Rebind z plugin key
set --export Z_CMD "j"

# ls
alias ls='exa --icons'
alias la='exa -a --icons'
alias ll='exa -l --icons'
alias lal='exa -l -a --icons'

# git
alias gcl='git clone'
alias gcm='git commit -m'

# grep
alias grep='rg'

# cat
alias cat='bat -p'

# vim
alias vi='nvim --noplugin'
alias vim='nvim'
# c(hezmoi)vim
alias cvim='chezmoi edit --apply'

# tmux
alias tmux='tmux -f $HOME/.config/tmux/tmux.conf'

# ifconfig
alias ifconfig='ip -c addr'

# DNF upgrade
abbr --add up 'sudo dnf upgrade --refresh --assumeyes'

function rust_analyzer_check_update
	set latest_version (curl -sL https://github.com/rust-analyzer/rust-analyzer/releases/latest | grep -o -P -m 1 '(?<=<code>).*(?=</code>)')
	set local_version (rust-analyzer --version | grep -o --pcre2 '(?<= )(.*)')

	if test $latest_version = $local_version
		echo "Latest version of rust-analyzer ($local_version) is up to date."
	else
		echo "Updating rust-analyzer..."
		wget https://github.com/rust-analyzer/rust-analyzer/releases/latest/download/rust-analyzer-linux -O ~/.local/bin/rust-analyzer --quiet
		chmod +x ~/.local/bin/rust-analyzer
		echo "Updated rust-analyzer from $local_version to $latest_version!"
	end

	set -e local_version
	set -e latest_version
end
alias upra='rust_analyzer_check_update'

# Get current ip
alias myip='curl https://ipecho.net/plain ; echo'
