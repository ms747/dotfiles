set -e fish_user_paths
# export ANDROID_HOME=/tank0/Projects/Android/Sdk
set -U fish_user_paths /home/ms/.cargo/bin $fish_user_paths
set -U fish_user_paths /home/ms/tank/Projects/golang/go/bin $fish_user_paths
set -U fish_user_paths /home/ms/.local/bin $fish_user_paths
set -U fish_user_paths /home/ms/.deno/bin $fish_user_paths
set -U fish_user_paths /home/ms/tank/Projects/qemu-6.0.0/build $fish_user_paths
# set -U fish_user_paths /home/ms/.opam/default/bin $fish_user_paths
#export PATH={$PATH}:/tank0/Projects/Android/Sdk/platform-tools
alias s "please"
alias sudoedit "pleaseedit"
alias l "exa -alh"
alias v "nvim"
alias d "cd ~/tank/Downloads"
alias p "cd ~/tank/Projects"
alias pp "python3"
alias pr "cd ~/tank/Programming"
alias vc "nvim ~/.config/nvim/init.vim"
alias ic "nvim ~/.config/i3/config"
alias fc "nvim ~/.config/fish/config.fish"
alias xc "nvim ~/.xmonad/xmonad.hs"
alias bsc "nvim ~/.config/bspwm/bspwmrc"
alias sxc "nvim ~/.config/sxhkd/sxhkdrc"
alias ac "nvim ~/.config/alacritty/alacritty.yml"
alias kc "nvim ~/.config/kitty/kitty.conf"
alias g "lazygit"
alias pc "nvim ~/.config/polybar/config.ini"
alias t "bash ~/myscripts/ide.sh"
alias tk "tmux kill-session -t work"
alias tc "nvim ~/myscripts/.tmux.conf"
alias up "apt update; apt upgrade -y; rustup update"
alias serve "python3 -m http.server"
set -U fish_greeting ""
set -x EDITIOR nvim
set --erase fish_greeting
if test -f /home/ms/.autojump/share/autojump/autojump.fish; . /home/ms/.autojump/share/autojump/autojump.fish; end

# OPAM configuration
# source /home/ms/.opam/opam-init/init.fish > /dev/null 2> /dev/null or true
# Set Starfish
# starship init fish | source

set -gx WASMTIME_HOME "$HOME/.wasmtime"

string match -r ".wasmtime" "$PATH" > /dev/null; or set -gx PATH "$WASMTIME_HOME/bin" $PATH