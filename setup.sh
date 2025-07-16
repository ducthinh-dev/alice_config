# get current directory
CURRENT_DIR=$(pwd)

# install nvim
echo "installing & initializing neovim & neovim config"
apt-get install nvim

# init config file for nvim & source to .vimrc
mkdir -p ~/.config/nvim
ln -s $CURRENT_DIR/.vimrc ~/.vimrc
echo "source ${CURRENT_DIR}/.vimrc" > ~/.config/nvim/init.vim

# install tmux
echo "installing & initializing tmux & tmux config"
apt install tmux
ln -s $CURRENT_DIR/.tmux.conf ~/.tmux.conf

# add sourcing config file to current .bashrci
echo "setting up alice bash"
echo -e "\nif [ -f ~/alice_config/.bashrc ]; then\n    source ~/alice_config/.bashrc\nfi" > ~/.bashrc

