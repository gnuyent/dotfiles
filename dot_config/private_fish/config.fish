##### Environment Variables
if test -e /opt/homebrew/bin/fish
	set --export SHELL /opt/homebrew/bin/fish
else
	set --export SHELL /usr/sbin/fish
end
set --export BAT_THEME ansi
set --export EDITOR nvim
set --export VISUAL nvim
set --export MANPAGER "sh -c 'col -bx | bat -l man -p'"
set --export MANROFFOPT "-c"
set --export FZF_DEFAULT_COMMAND "fd"

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
set --append paths $HOME/.emacs.d/bin
# Homebrew
set --append paths /opt/homebrew/bin
# asdf
set --append paths $HOME/.asdf/shims

for dir in $paths
	if test -e $dir
	    set PATH $dir $PATH
	end
end

set -e paths

zoxide init fish | source

##### File Sourcing
# asdf
if test -e $HOME/.asdf/asdf.fish
	source $HOME/.asdf/asdf.fish
end

if test -e /opt/asdf-vm/asdf.fish
	source /opt/asdf-vm/asdf.fish
end

# Work
if test -e $HOME/.config/fish/work.fish
	source $HOME/.config/fish/work.fish
end

##### Command Abbreviations
# navi
if type -q navi
	navi widget fish | source
end

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
	alias cat='bat --paging=never'
end

# vim
if type -q nvim
	alias vi='nvim --noplugin'
	alias vim='nvim'
end

# nnn
if type -q nnn
	alias nnn='nnn -e'
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

# Chezmoi
if type -q chezmoi
	alias czm='chezmoi'
	abbr --global ccd 'chezmoi cd' 
end

# LazyGit
if type -q lazygit
	alias lg='lazygit'
end

##### Abbreviations
# Get current ip
abbr --global myip 'curl https://ipecho.net/plain ; echo'

# Clear
abbr --global c 'clear'

# Git shorter
abbr --global g 'git'

# Use vi-like bindings
fish_vi_key_bindings

##### Functions
function fish_user_key_bindings
# ctrl+z - quick bg and fg
    bind -M insert \cz 'fg 2>/dev/null; commandline -f repaint'
    bind -M insert \cp 'up-or-search'
    bind -M insert \cn 'down-or-search'
    bind -M insert \ca 'beginning-of-line'
    bind -M insert \ce 'end-of-line'
end

# Terminal greeting
function fish_greeting
	clear
	if type -q fortune && type -q cowsay
		fortune | cowsay
	end
end
