#############
####ZINIT####
#############
### Plugin Manager
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

#Download Zinit, if its not already.
if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

#Source/load Zinit
source "${ZINIT_HOME}/zinit.zsh"

########### Plugins ###########
#Add zsh syntax-highlighting
zinit light zsh-users/zsh-syntax-highlighting

#Add zsh completions
zinit light zsh-users/zsh-completions

#Add zsh auto-complete
zinit light zsh-users/zsh-autosuggestions

#Add fzf-tab
zinit light Aloxaf/fzf-tab

#Oh My Zsh Plugins
#URL: https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::dnf
zinit snippet OMZP::command-not-found


#Load completions
autoload -U compinit && compinit
zinit cdreplay -q
########### Plugins ###########

############################
###General Configurations###
############################

#Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

#History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

#Completion Styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "{(s.:.)LS_COLORS}"
zstyle ':compeltion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle 'fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

#Aliases
alias ls='ls -a --color -h --group-directories-first'
alias ln='ls -ln --color -h --group-directories-first'

#Shell Intergrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
#for more themes: https://github.com/JanDeDobbeleer/oh-my-posh/tree/main/themes
eval "$(oh-my-posh init zsh --config $HOME/dotfiles/themes/catppuccin_mocha.omp.json)"
