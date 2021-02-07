set --export SHELL /usr/bin/fish
set --export EDITOR nvim
# TODO: Update bat theme
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
	if type -q fortune && type -q cowsay
		fortune | cowsay
	end
end

# ctrl+z
function fish_user_key_bindings
    bind \cz 'fg 2>/dev/null; commandline -f repaint'
end

# Rebind z plugin key
set --export Z_CMD "j"

# ls
if type -q exa
	alias ls='exa --icons'
	alias la='exa -a --icons'
	alias ll='exa -l --icons'
	alias lal='exa -l -a --icons'
end

# git
alias gcl='git clone'
alias gcm='git commit -m'

# grep
if type -q rg
	alias grep='rg'
end

# cat
if type -q bat
	alias cat='bat -p'
end

# vim
if type -q nvim
	alias vi='nvim --noplugin'
	alias vim='nvim'
end
# c(hezmoi)vim
if type -q chezmoi
	alias cvim='chezmoi edit --apply'
end

# tmux
if type -q tmux
	alias tmux='tmux -f $HOME/.config/tmux/tmux.conf'
end

# ifconfig
alias ifconfig='ip -c addr'

# DNF upgrade
abbr --add up 'sudo dnf upgrade --refresh --assumeyes'

function rust_analyzer_check_update
	if not type -q rg
		echo "ripgrep is not installed. Not installing rust-analyzer."
		return 1
	end
	set latest_version (curl -sL https://github.com/rust-analyzer/rust-analyzer/releases/latest | grep -o -P -m 1 '(?<=<code>).*(?=</code>)')
	if type -q rust-analyzer
		set local_version (rust-analyzer --version | grep -o --pcre2 '(?<= )(.*)')
		set text "Updat"
	else
		set local_version ""
		set text "Install"
	end

	if test $latest_version = $local_version
		echo "Latest version of rust-analyzer ($local_version) is up to date."
	else
		echo $text"ing rust-analyzer..."
		mkdir -p ~/.local/bin/
		curl -sL https://github.com/rust-analyzer/rust-analyzer/releases/latest/download/rust-analyzer-linux -o ~/.local/bin/rust-analyzer
		chmod +x ~/.local/bin/rust-analyzer
		if test $text = "Install"
			echo "Installed rust-analyzer ($latest_version)!"
		else
			echo "Updated rust-analyzer from $local_version to $latest_version!"
		end
	end

	set -e local_version
	set -e latest_version
	set -e text
end
alias upra='rust_analyzer_check_update'

# Get current ip
alias myip='curl https://ipecho.net/plain ; echo'
