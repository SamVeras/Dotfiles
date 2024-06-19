if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Standard plugins:  $ZSH/plugins/
# Custom plugins:    $ZSH_CUSTOM/plugins/
plugins=(
		git
		zsh-autosuggestions
		zsh-syntax-highlighting
		colored-man-pages
		fzf-tab
	    #you-should-use
)

source $ZSH/oh-my-zsh.sh

# User configs

if [[ ! -d "$HOME/Screenshots" ]]; then
	mkdir -p "$HOME/Screenshots"
fi
export XDG_SCREENSHOTS_DIR="$HOME/Screenshots"
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib:/usr/local/lib64
export PKG_CONFIG_PATH=PKG_CONFIG_PATH:/usr/local/lib64/pkgconfig

path+=$HOME/.local/go/bin
export EDITOR=micro
export VISUAL="$EDITOR"
alias paths="echo $PATH | tr : '\n'"
setopt globdots
zstyle ':completion:*' special-dirs false

# Aliases para o Void Linux
if (($+commands[xbps-install])); then
  alias xbpi="sudo xbps-install"
  alias xbps="xbps-query -Rs"
  alias xbpq="xbps-query"
  alias xbpr="sudo xbps-remove"
  alias xbpu="sudo xbps-install -Syu"
fi

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
