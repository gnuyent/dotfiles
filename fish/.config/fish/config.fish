##### Environment Variables
set --export SHELL /usr/bin/fish
set --export EDITOR nvim
set --export MANPAGER "sh -c 'col -bx | bat -l man -p'"
set --export MANROFFOPT "-c"
set --export FZF_DEFAULT_COMMAND "fd"
set --export EMACSDIR $HOME/.config/emacs
set --export DOOMDIR $HOME/.config/doom
set --export DOOMLOCALDIR $HOME/.config/emacs/.local
# Rebind z plugin key
set --export Z_CMD "j"

##### Path Sourcing
# Custom home bin
if test -e $HOME/.local/bin
    set PATH $HOME/.local/bin $PATH
end

# Luarocks
if test -e $HOME/.luarocks/bin
    set PATH $HOME/.luarocks/bin $PATH
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

# Doom emacs
if test -e $HOME/.config/emacs/bin
    set PATH $HOME/.config/emacs/bin $PATH
end

# asdf
if test -e $HOME/.asdf
    source $HOME/.asdf/asdf.fish
end

##### Command Abbreviations
# ls
if type -q exa
	alias ls='exa --icons'
	alias la='exa -a --icons'
	alias ll='exa -l --icons'
	alias lla='exa -l -a --icons'
end

# git
if type -q git
	abbr ga 'git add'
	abbr gcl 'git clone'
	abbr gcm 'git commit -m'
	abbr gst 'git status'
	abbr gco 'git checkout'
	abbr glog 'git log'
	abbr gcob 'git checkout -b'
	abbr gdel 'git branch -D'
	abbr greb 'git rebase -i'
	abbr hotedit 'git log --pretty=format: --name-only | sort | uniq -c | sort -rg | head -10'
end

# Docker
if type -q docker
	abbr dup 'docker compose up --detach'
	abbr ddown 'docker compose down'
	abbr dstart 'docker compose start'
	abbr dstop 'docker compose stop'
	abbr dlogs 'docker compose logs --follow --timestamps'
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
	# FIXME: remove when tmux gets native XDG support
	alias tmux='tmux -f $HOME/.config/tmux/tmux.conf'
end

# nmap
if type -q nmap
	abbr --add nmapos 'sudo nmap -T5 -O -v'
	abbr --add nmapintensetcp 'nmap -p 1-65535 -T5 -A -v'
	abbr --add nmapintenseall 'sudo nmap -p 1-65535 -sS -sU -T5 -A -v'
	abbr --add nmapquick 'sudo nmap -sV -T4 -O -F -version-light -v'
end

# ifconfig
if type -q ip
	alias ip='ip -c'
end

# Hash check helpers
if type -q sha256sum
	abbr --add sha256 'echo "$argv[1] $argv[2]" | sha256sum --check'
end

if type -q md5sum
	abbr --add sha256 'echo "$argv[1] $argv[2]" | md5sum --check'
end

##### Abbreviations
# dnf upgrade
abbr --add up 'sudo dnf upgrade --refresh --assumeyes'

# Get current ip
abbr --add myip 'curl https://ipecho.net/plain ; echo'

# Clear
abbr --add c 'clear'

abbr -- - 'cd -'

##### Functions
# ctrl+z
function fish_user_key_bindings
    bind \cz 'fg 2>/dev/null; commandline -f repaint'
end

# cowsay
function fish_greeting
	if type -q fortune && type -q cowsay
		fortune | cowsay
	end
	# Go $HOME since WSL goes to the 'windows' home directory instead
	cd $HOME
end
