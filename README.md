## Dotfiles 

To install dotfiles on a new device:
```
git clone https://github.com/doorlay/dotfiles.git
cd dotfiles
./install.sh
```

#### Notes
- `install.sh` is idempotent, so is safe to run many times
- all local dotfiles are symlinked to this repository, which serves as the source of truth
