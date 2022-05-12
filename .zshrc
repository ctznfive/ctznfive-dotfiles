export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    colorize
    vi-mode
    colored-man-pages
    )


fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
source $ZSH/oh-my-zsh.sh
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=4'

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


# ~~~~~ User configuration ~~~~~

export VISUAL="nvim"
export EDITOR="$VISUAL"

# Disable % eof
unsetopt prompt_cr prompt_sp

# History
HISTSIZE=20000
SAVEHIST=20000
setopt hist_ignore_dups
setopt extended_history

# Prompt
autoload -U colors && colors
PROMPT='%B%F{250}[%1~] %f%b'
RPROMPT=''

# Vi-Mode
VI_MODE_SET_CURSOR=true
bindkey -M viins '\e.' insert-last-word # for alt+.
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# Colorize
zstyle ":completion:*:default" list-colors ${(s.:.)LS_COLORS} "ma=48;5;238;1"
less_termcap[so]="${fg_bold[cyan]}"

# my personal alias
alias ls='ls --group-directories-first --color=auto'
alias ll='ls -Fhl --group-directories-first --color=auto'
alias i='cd ~/inbox && ls -1'
alias s='cd ~/support && ls -1'
alias r='cd ~/reference && ls -1'
alias m='cd ~/MEGA && ls -1'
alias gtd='cd ~/Dropbox && ls -1'
alias grep='grep --color=auto'
alias v='nvim'
alias e='emacsclient -c'
alias uu='udiskie-umount --detach'
alias gm='cd /run/media && ls -1'
alias t='tree'
alias rr='ranger ~/inbox'
alias calc='bc -l'
alias bckup-ext='rsync -avh --delete /home/ctznfive/ /run/media/ctznfive/BACKUP/HOME/t480s/'
alias mus='mpv --shuffle --no-video ~/MEGA/music'
alias off='systemctl poweroff'
alias config='/usr/bin/git --git-dir=$HOME/.mycfg/ --work-tree=$HOME'

# use "c" for ls after cd
c() { cd "$1" && ls -1; }

# follow copied and moved files to destination directory
cpd() { cp "$1" "$2" && c "$2"; }
mvd() { mv "$1" "$2" && c "$2"; }

# press "o" to open files in default apps
function o () {
  xdg-open "$@">/dev/null 2>&1 & disown
}

# Fzf
#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --multi --border'
source /usr/share/fzf/shell/key-bindings.zsh
#source /usr/share/fzf/completion.zsh

# VeraCrypt
crypt() { 
	if [ -z "$2" ]
    then veracrypt -t -k "" --pim=0 --protect-hidden=no --mount-options=timestamp "$1" /media/veracrypt1 && cd /media/veracrypt1 && ls -1
	else veracrypt -t -k "" --pim=0 --protect-hidden=no --mount-options=timestamp "$1" /media/veracrypt$2 && cd /media/veracrypt$2 && ls -1
	fi
}

