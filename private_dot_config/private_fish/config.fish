set --export SHELL /usr/bin/fish
set --export EDITOR nvim
set --export BAT_THEME "gruvbox"

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
abbr --add gcl 'git clone'
abbr --add gcm 'git commit -m'

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
	abbr --add cvim 'chezmoi edit --apply'
end

# tmux
if type -q tmux
	alias tmux='tmux -f $HOME/.config/tmux/tmux.conf'
end

# ifconfig
abbr --add ifconfig 'ip -c addr'

# DNF upgrade
abbr --add up 'sudo dnf upgrade --refresh --assumeyes'
abbr --add upra 'rust_analyzer_check_update'

# Get current ip
abbr --add ip 'curl https://ipecho.net/plain ; echo'

# Clear
abbr --add c 'clear'

# Chezmoi add+commit
abbr --add cpush 'chezmoi git add . && chezmoi git commit && chezmoi git push'
