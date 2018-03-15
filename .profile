#
# ~/.profile
#
#

[[ "$XDG_CURRENT_DESKTOP" == "KDE" ]] || export QT_QPA_PLATFORMTHEME="qt5ct"

[[ -f ~/.extend.profile ]] && . ~/.extend.profile

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/anaconda3/bin:$PATH"
export PATH="$HOME/code/bin:$PATH"
#export PATH="$HOME/.gem/ruby/2.5.0/bin:$PATH"
export EDITOR=em

#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib64/openmpi/
export CC=clang
export CXX=clang++
export TERMINAL=termite
