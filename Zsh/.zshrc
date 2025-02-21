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
	  you-should-use
    wd
)

source $ZSH/oh-my-zsh.sh

# ----------------------------------------- User Configs ----------------------------------------- #

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=5'
setopt globdots
zstyle ':completion:*' special-dirs false

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib:/usr/local/lib64:$HOME/lib
export PKG_CONFIG_PATH=PKG_CONFIG_PATH:/usr/local/lib64/pkgconfig
export GRIM_DEFAULT_DIR="$HOME/media/screenshots"


export EDITOR=micro
export VISUAL="$EDITOR"
export LC_ALL="en_US.UTF-8"

alias paths="echo $PATH | tr : '\n'"
alias ls="lsd --long --human-readable --almost-all --total-size --group-dirs first"


# Void Linux aliases
if (($+commands[xbps-install])); then
    alias xbpi="sudo xbps-install"
    alias xbps="xbps-query -Rs"
    alias xbpq="xbps-query"
    alias xbpr="sudo xbps-remove"
    alias xbpu="sudo xbps-install -Syu"
fi

# openSUSE aliases
if (($+commands[zypper])); then
    alias zyp="sudo zypper"
fi

# Home directories setup
mydirs=(
    "$HOME/apps"
    "$HOME/bin"
    "$HOME/desk"
    "$HOME/dev"
    "$HOME/docs"
    "$HOME/lib"
    "$HOME/media"
    "$HOME/media/music"
    "$HOME/media/pics"
    "$HOME/media/screenshots"
    "$HOME/media/videos"
    "$HOME/media/wallpapers"
    "$HOME/scripts"
    "$HOME/share"
    "$HOME/share/public"
    "$HOME/share/templates"
    "$HOME/tmp"
    "$HOME/tmp/downloads"
)

for dir in $mydirs; do
    if [[ ! -d "$dir" ]]; then
        echo "$dir does not exist. Creating it..."
        mkdir -p "$dir"
    fi
done

if [[ ":$PATH:" != *":$HOME/bin:"* ]]; then
    path+="$HOME/bin:"
fi


path+=($HOME/.local/bin)

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
