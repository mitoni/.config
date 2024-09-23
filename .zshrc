# Path to your oh-my-zsh installation.
# export ZSH="$HOME/.oh-my-zsh"

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

export XDG_CONFIG_HOME="$HOME/.config"

# ZSH_THEME="obraun"

HIST_STAMPS="mm/dd/yyyy"

# plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

# source $ZSH/oh-my-zsh.sh

export GOPATH=$HOME/go
export GOBIN=$HOME/go/bin
export PATH=$PATH:$GOPATH/bin

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

PATH=$PATH:/opt/homebrew/bin
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/micheletonizzo/dev/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/micheletonizzo/dev/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/micheletonizzo/dev/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/micheletonizzo/dev/google-cloud-sdk/completion.zsh.inc'; fi

# Generated for envman. Do not edit.
# [ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"export PATH="/opt/homebrew/opt/openssl@1.1/bin:$PATH"

# bun completions
[ -s "/Users/micheletonizzo/.bun/_bun" ] && source "/Users/micheletonizzo/.bun/_bun"

# air
alias air='$(go env GOPATH)/bin/air'

# bombarier
alias bombardier='$(go env GOPATH)/bin/bombardier'

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS='--layout=reverse --exact'

# mac setup for pomo
alias work="timer 60m && terminal-notifier -message 'Pomodoro'\
        -title 'Work Timer is up! Take a Break 😊'\
        -appIcon '~/Pictures/pumpkin.png'\
        -sound Crystal"
        
alias rest="timer 10m && terminal-notifier -message 'Pomodoro'\
        -title 'Break is over! Get back to work 😬'\
        -appIcon '~/Pictures/pumpkin.png'\
        -sound Crystal"

# scripts folder
PATH="$PATH":"$HOME/.config/scripts/"

# tmux sessionizer
bindkey -s ^f "tmux-sessionizer\n"

# starship config file location 
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"

# tmux alias
alias td="tmux detach"
alias ta="tmux attach"
alias tk="tmux kill-server"

alias code="vim"
function vim() {
    if [[ $# -eq 0 ]]; then
        nvim .
    else
        nvim "$@"
    fi
}

# lazygit alias
alias lg="lazygit"

# nix
if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
    . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
 fi

defaults write -g InitialKeyRepeat -int 11
defaults write -g KeyRepeat -int 2

eval "$(starship init zsh)"
