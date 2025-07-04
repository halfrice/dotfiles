# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Change / make / delete dirs (oh-my-zsh functionality)
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus

# Prevent closing the shell session (CTRL+d closing Wezterm and iterm2) 
setopt ignore_eof

# Webdev OCD <HTML lang="en"><meta charset="utf-8">
export LANG=en_US.UTF-8

# Default editor
export EDITOR=/usr/local/bin/nvim

# VI mode
bindkey jj vi-cmd-mode

# List directory contents
alias l='ls -lah'
alias ll='ls -lh'
alias la='ls -lAh'

# Starship
eval "$(starship init zsh)"

# NVM
export NVM_DIR="$HOME/.nvm"
  # This loads nvm
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"
  # This loads nvm bash_completion
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"

# zsh autosuggestions
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# zsh syntax highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
