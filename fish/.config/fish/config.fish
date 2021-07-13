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
set paths
# Custom homedir bin
set --append paths $HOME/.local/bin
# Luarocks
set --append paths $HOME/.luarocks/bin
# Rust
set --append paths $HOME/.cargo/bin
# Go
set --append paths $HOME/go/bin
# .NET
set --append paths $HOME/.dotnet
# Doom Emacs
set --append paths $HOME/.config/emacs/bin

for dir in $paths
	if test -e $dir
	    set PATH $dir $PATH
	end
end

set -e paths

##### File Sourcing
# asdf
if test -e $HOME/.asdf
	source $HOME/.asdf/asdf.fish
end
# Work
if test -e $HOME/.config/fish/work.fish
	source $HOME/.config/fish/work.fish
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
	abbr --global ga 'git add'
	abbr --global gcl 'git clone'
	abbr --global gcm 'git commit -m'
	abbr --global gst 'git status'
	abbr --global gco 'git checkout'
	abbr --global glog 'git log'
	abbr --global gcob 'git checkout -b'
	abbr --global gdel 'git branch -D'
	abbr --global greb 'git rebase -i'
	abbr --global hotedit 'git log --pretty=format: --name-only | sort | uniq -c | sort -rg | head -10'
end

# Docker
if type -q docker
	abbr --global dup 'docker compose up --detach'
	abbr --global ddown 'docker compose down'
	abbr --global dstart 'docker compose start'
	abbr --global dstop 'docker compose stop'
	abbr --global dlogs 'docker compose logs --follow --timestamps'
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
	abbr --global scanos 'sudo nmap -T5 -O -v'
	abbr --global scanintensetcp 'nmap -p 1-65535 -T5 -A -v'
	abbr --global scanintenseall 'sudo nmap -p 1-65535 -sS -sU -T5 -A -v'
	abbr --global scanquick 'sudo nmap -sV -T4 -O -F -version-light -v'
end

# ifconfig
if type -q ip
	alias ip='ip -c'
end

# Hash check helpers
if type -q sha256sum
	alias sha256='echo "$argv[1] $argv[2]" | sha256sum --check'
end

if type -q md5sum
	alias md5='echo "$argv[1] $argv[2]" | md5sum --check'
end

##### Abbreviations
# dnf upgrade
abbr --global up 'sudo dnf upgrade --refresh --assumeyes'

# Get current ip
abbr --global myip 'curl https://ipecho.net/plain ; echo'

# Clear
abbr --global c 'clear'

# Git shorter
abbr --global g 'git'

##### Functions
# ctrl+z
function fish_user_key_bindings
    bind \cz 'fg 2>/dev/null; commandline -f repaint'
end

# Terminal greeting
function fish_greeting
	clear
	if type -q fortune && type -q cowsay
		fortune | cowsay
	end
	# Go $HOME since WSL starts in windows "home" dir
	cd $HOME
end
