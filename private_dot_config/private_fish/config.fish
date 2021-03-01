set --export SHELL /usr/bin/fish
set --export EDITOR nvim
set --export BAT_THEME "ayu-dark"
set --export MANPAGER "sh -c 'col -bx | bat -l man -p'"
set --export MANROFFOPT "-c"

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
	alias lla='exa -l -a --icons'
end

# git
if type -q git
	abbr --add ga 'git add'
	abbr --add gcl 'git clone'
	abbr --add gcm 'git commit -m'
end

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

# tmux
if type -q tmux
	alias tmux='tmux -f $HOME/.config/tmux/tmux.conf'
end

# ifconfig
abbr --add ifconfig 'ip -c addr'

# DNF upgrade
abbr --add up 'sudo dnf upgrade --refresh --assumeyes'
abbr --add upra 'update_rust_analyzer'
abbr --add upnv 'update_neovim'

# Get current ip
abbr --add ip 'curl https://ipecho.net/plain ; echo'

# Clear
abbr --add c 'clear'

if type -q chezmoi
	# c(hezmoi)vim
	abbr --add cvim 'chezmoi edit --apply'
	# Chezmoi git add+commit+push
	abbr --add cpush 'chezmoi git add . && chezmoi git commit && chezmoi git push'
	# Chezmoi add file
	abbr --add cadd 'chezmoi add'
end

# Hash check helpers
if type -q sha256sum
	abbr --add sha256 'hash_check_sha256'
end

if type -q md5sum
	abbr --add md5 'hash_check_md5'
end

