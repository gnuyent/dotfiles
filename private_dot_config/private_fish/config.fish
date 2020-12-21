set --export SHELL /usr/bin/fish
set --export EDITOR nvim
set --export BAT_THEME "Oceanic Next"

# Custom bin
if test -e $HOME/.local/bin
    set PATH $HOME/.local/bin $PATH
end

# Rust
if test -e $HOME/.cargo/bin
    set PATH $HOME/.cargo/bin $PATH
end

# Dotbare
if test -e $HOME/.dotbare
    set PATH $HOME/.dotbare $PATH
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
alias vi='nvim'
alias vim='nvim'

# tmux
alias tmux='tmux -f $HOME/.config/tmux/tmux.conf'

# ifconfig
alias ifconfig='ip -c addr'

# nvim nightly
alias nvim-upgrade='bash $HOME/.local/bin/nvim_build_script.sh'
