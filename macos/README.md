# macOS Dotfiles Setup

Manage macOS tools with:

- `Brewfile` for packages
- `GNU Stow` for configs
- Git for backup/sync

## 1. Create Brewfile

```bash
brew bundle dump --file=~/dotfiles/macos/Brewfile --no-vscode --no-npm
```

Restore packages later with:

```bash
brew bundle --file=~/dotfiles/macos/Brewfile
```

## 2. Create package folders

```bash
mkdir -p ~/dotfiles/macos/{bat,eza,iterm2,nvim,starship,yazi,zsh,logo}
mkdir -p ~/dotfiles/macos/{bat,eza,iterm2,nvim,starship,yazi,logo}/.config
```

## 3. Move existing configs

```bash
mv ~/.config/nvim ~/dotfiles/macos/nvim/.config/nvim
mv ~/.config/yazi ~/dotfiles/macos/yazi/.config/yazi
mv ~/.config/starship.toml ~/dotfiles/macos/starship/.config/starship.toml
mv ~/.config/bat ~/dotfiles/macos/bat/.config/bat
mv ~/.config/eza ~/dotfiles/macos/eza/.config/eza
mv ~/.config/logo.txt ~/dotfiles/macos/logo/.config/logo.txt
mv ~/.config/iterm2 ~/dotfiles/macos/iterm2/.config/iterm2
mv ~/.zshrc ~/dotfiles/macos/zsh/.zshrc
```

Remove macOS metadata:

```bash
find ~/dotfiles -name '.DS_Store' -delete
```

Add to `~/dotfiles/.gitignore`:

```gitignore
.DS_Store
*.log
```

## 4. Stow configs

```bash
cd ~/dotfiles/macos
stow --no-folding -t ~ bat eza iterm2 nvim starship yazi zsh logo
source ~/.zshrc
```

## 5. Git

```bash
cd ~/dotfiles
git add .
git commit -m "Update macOS dotfiles"
git push
```

## 6. Setup on a New Mac

After installing Homebrew:

```bash
git clone git@github.com:USERNAME/dotfiles.git ~/dotfiles
brew bundle --file=~/dotfiles/macos/Brewfile
cd ~/dotfiles/macos
stow --no-folding -t ~ bat eza iterm2 nvim starship yazi zsh logo
exec zsh
```

No `mv` commands are needed on a new Mac because the configs are already stored in the repository.
