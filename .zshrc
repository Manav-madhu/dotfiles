# History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt HIST_IGNORE_DUPS
setopt SHARE_HISTORY

# Completion
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select

# Plugins
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Starship prompt
eval "$(starship init zsh)"

# Aliases
alias ls='ls --color=auto'
alias ll='ls -alFh'
alias la='ls -A'
alias grep='grep --color=auto'
alias diff='diff --color=auto'
alias ip='ip --color=auto'
alias ..='cd ..'
alias ...='cd ../..'
# git track dotfiles
alias dot='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Exports
export EDITOR=nvim
export VISUAL=nvim
export PAGER=less
export LESS='-R --use-color'
export PATH="$HOME/.local/bin:$PATH"



# Start ssh-agent only if not running
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
  eval "$(ssh-agent -s)"
fi

# Add key if not already added
ssh-add -l | grep -q "$(ssh-keygen -lf ~/.ssh/github.pub | awk '{print $2}')" 2>/dev/null
if [ $? -ne 0 ]; then
  ssh-add ~/.ssh/github
fi
