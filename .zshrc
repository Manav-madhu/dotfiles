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
# Ensure SSH agent is running and connected
if [ -z "$SSH_AUTH_SOCK" ]; then
  eval "$(ssh-agent -s)" > /dev/null 2>&1
fi

# Add key if not already added
if ! ssh-add -l 2>/dev/null | grep -q "$(ssh-keygen -lf ~/.ssh/github.pub | awk '{print $2}')"; then
  ssh-add ~/.ssh/github > /dev/null
fi
