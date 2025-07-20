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

# setup nvim packages folder
echo "\nsetting up nvim package directory"
mkdir -p $CURRENT_DIR/nvim/{lua,lua/lsp,plugin}
touch $CURRENT_DIR/nvim/init.lua
echo 'vim.cmd("source ${CURRENT_DIR}/.vimrc")' >> $CURRENT_DIR/nvim/.vimrc
mkdir -p ~/.local/share/nvim/site/pack/mine/start

# setup vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
echo "local Plug = vim.fn['plug#']
vim.call('plug#begin')

-- List of plugins go here


vim.call('plug#end')" >> $CURRENT_DIR/nvim/.vimrc
