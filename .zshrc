export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH=$HOME/.oh-my-zsh
export QT_QPA_PLATFORMTHEME="qt5ct"
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

plugins=(
    git
    colorize
    vi-mode
    colored-man-pages
    )

source $ZSH/oh-my-zsh.sh
#source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# User configuration

alias ohmyzsh="mate ~/.oh-my-zsh"

ZSH_THEME=""

export VISUAL="vim"
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
alias v='vim'
alias e='emacsclient -c'
alias uu='udiskie-umount --detach'
alias gm='cd /run/media && ls -1'
alias t='tree'
alias rr='ranger ~/inbox'
alias calc='bc -l'
alias autoremove='sudo pacman -Rns $(pacman -Qqdt)'
alias bckup-ext='rsync -avh --delete /home/ctznfive/ /run/media/ctznfive/BACKUP/HOME/pc_arch/'
alias moshphone='mosh --ssh="ssh -p 8022" 192.168.0.125'
#alias gtdmosh="rsync -av -e 'ssh -p 8022' 192.168.0.125:/sdcard/gtd ~/inbox/"
#alias gtdup='adb pull /sdcard/gtd ~/inbox/'
alias mus='mpv --shuffle --no-video ~/MEGA/music'
alias off='systemctl poweroff'
alias timer='sleep 3000 && zathura &'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

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
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --multi --border'
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# VeraCrypt
crypt() { 
	if [ -z "$2" ]
    then veracrypt -t -k "" --pim=0 --protect-hidden=no --mount-options=timestamp "$1" /mnt/veracrypt1 && cd /mnt/veracrypt1 && ls -1
	else veracrypt -t -k "" --pim=0 --protect-hidden=no --mount-options=timestamp "$1" /mnt/veracrypt$2 && cd /mnt/veracrypt$2 && ls -1
	fi
}

