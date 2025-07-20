CURRENT_DIR=$(pwd)

# Setup fonts folder if not exists, and unzip all fonts zip to it
mkdir -p ~/.local/share/fonts/
unzip $CURRENT_DIR/assets/fonts/*.zip -d ~/.local/share/fonts/
fc-cache -fv
