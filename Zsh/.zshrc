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

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=5'

# export XDG_SCREENSHOTS_DIR="$HOME/media/screenshots"
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib:/usr/local/lib64:$HOME/lib
export PKG_CONFIG_PATH=PKG_CONFIG_PATH:/usr/local/lib64/pkgconfig

export GRIM_DEFAULT_DIR="$HOME/media/screenshots"

path+=$HOME/.local/go/bin
path+=$HOME/.local/bin
path+=$HOME/.miniconda/bin
path+=$HOME/miniconda3/bin
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

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/sam/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/sam/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/sam/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/sam/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

