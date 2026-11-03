# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export LANG=en_US.UTF-8

# Homebrew (in case ~/.zprofile was not loaded)
if [[ -z "$HOMEBREW_PREFIX" ]]; then
  if [[ -x /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  elif [[ -x /usr/local/bin/brew ]]; then
    eval "$(/usr/local/bin/brew shellenv)"
  fi
fi

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# History
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt share_history hist_ignore_all_dups hist_reduce_blanks

# Turn on extended globbing
setopt extendedglob

# Completions
FPATH="$HOMEBREW_PREFIX/share/zsh-completions:$FPATH"
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Theme and plugins (installed with Homebrew)
for plugin in \
  powerlevel10k/powerlevel10k.zsh-theme \
  zsh-autosuggestions/zsh-autosuggestions.zsh \
  zsh-syntax-highlighting/zsh-syntax-highlighting.zsh \
  zsh-history-substring-search/zsh-history-substring-search.zsh
do
  [[ -r "$HOMEBREW_PREFIX/share/$plugin" ]] && source "$HOMEBREW_PREFIX/share/$plugin"
done
unset plugin

# Search history with arrow up / down
if (( $+functions[history-substring-search-up] )); then
  bindkey '^[[A' history-substring-search-up
  bindkey '^[[B' history-substring-search-down
fi

# Enable fuzzy backwards search (ctrl + r)
command -v fzf &>/dev/null && source <(fzf --zsh)

# Jump to frequently used folders with `z <name>`
command -v zoxide &>/dev/null && eval "$(zoxide init zsh)"

# Setup fnm (fast node manager), switches node version on cd when a .nvmrc / .node-version exists
command -v fnm &>/dev/null && eval "$(fnm env --use-on-cd --shell zsh)"

# Aliases
if command -v eza &>/dev/null; then
  alias ls="eza"
  alias ll="eza -la --git"
  alias tree="eza --tree"
fi
alias ..="cd .."
alias ...="cd ../.."

# Load custom aliases
[[ -s "$HOME/.aliases" ]] && source "$HOME/.aliases"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
