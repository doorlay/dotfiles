### Setup
```
mkdir ~/.dotfiles && cd ~/.dotfiles
git clone https://github.com/doorlay/dotfiles.git
./install.sh
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

then run `:PlugInstall` within vim.

#### Notes
- Make desired updates to this repo, not your local dotfiles.
- `install.sh` is idempotent, so don't worry about running it multiple times.
