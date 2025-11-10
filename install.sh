#!/bin/bash

# Exit if any errors
set -e

shell_name=${SHELL##*/}
echo "Detected shell: $shell_name"

if [[ $shell_name == "bash" ]]; then
    rcfile="$HOME/.bashrc"
elif [[ $shell_name == "zsh" ]]; then
    rcfile="$HOME/.zshrc"
else
    rcfile="$HOME/.profile"
fi

arch=$(uname -m)
case "$arch" in
    x86_64|i*86)
        file="nvim-linux-x86_64.tar.gz"
        opt_dir="/opt/nvim-linux-x86_64"
        ;;
    aarch64|arm*)
        file="nvim-linux-arm64.tar.gz"
        opt_dir="/opt/nvim-linux-arm64"
        ;;
    *)
        echo "Unknown architecture: $arch"
        exit 1
        ;;
esac

echo "Installing Neovim for $arch..."
sudo apt remove -y neovim || true
curl -LO "https://github.com/neovim/neovim/releases/latest/download/$file"
sudo rm -rf "$opt_dir"
sudo tar -C /opt -xzf "$file"
rm "$file"

if ! grep -q "$opt_dir/bin" "$rcfile"; then
    echo "export PATH=\"\$PATH:$opt_dir/bin\"" >> "$rcfile"
    echo "Added Neovim to PATH in $rcfile"
else
    echo "Neovim already exists in PATH."
fi

echo "Neovim installation complete!"
echo "Run 'source $rcfile' or restart your terminal to use it."
