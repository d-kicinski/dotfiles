#
# ~/.profile
#
#

[[ "$XDG_CURRENT_DESKTOP" == "KDE" ]] || export QT_QPA_PLATFORMTHEME="qt5ct"

[[ -f ~/.extend.profile ]] && . ~/.extend.profile

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/anaconda3/bin:$PATH"
export PATH="$HOME/code/bin:$PATH"
export EDITOR=em
