# get current directory
CURRENT_DIR=$(pwd)
apt-get update
apt update

# NVIM
# install nvim
echo "\ninstalling & initializing neovim & neovim config"
apt-get install neovim -y

# init config file for nvim & source to .vimrc
mkdir -p ~/.config/nvim

# backup .vimrc if file already exists
if [ -f ~/.vimrc ]; then
    mv ~/.vimrc ~/.vimrc.bak
fi
ln -s $CURRENT_DIR/.vimrc ~/.vimrc
echo "source ${CURRENT_DIR}/.vimrc" > ~/.config/nvim/init.vim

# TMUX
# install tmux
echo "\ninstalling & initializing tmux & tmux config"
apt install tmux -y

# backup .tmux.conf if file already exists
if [ -f ~/.tmux.conf ]; then
    mv ~/.tmux.conf ~/.tmux.conf.bak
fi
ln -s $CURRENT_DIR/.tmux.conf ~/.tmux.conf

# add sourcing config file to current .bashrc
echo "\nsetting up alice bash"
echo -e "\nif [ -f ~/alice_config/.bashrc ]; then\n    source ~/alice_config/.bashrc\nfi" >> ~/.bashrc

