export PATH="/opt/homebrew/bin:$PATH"
export PATH="/Users/doorlay/Library/Python/3.9/bin:$PATH"

# Created by `pipx` on 2024-06-23 06:18:47
export PATH="$PATH:/Users/doorlay/.local/bin"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pnpm
export PNPM_HOME="/Users/doorlay/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# Make bash history more useful 
export HISTSIZE=100000000
export HISTFILESIZE=100000000
shopt -s histappend
export PROMPT_COMMAND="history -a; history -n"
export HISTTIMEFORMAT="[%F %T] "

# My aliases
alias pi="ssh admin@192.168.50.236"
