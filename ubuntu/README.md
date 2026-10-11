# Ubuntu Dotfiles Setup

This folder contains Ubuntu-specific dotfiles managed with GNU Stow.

## 1. Install GNU Stow

```bash
sudo apt update
sudo apt install stow
```

## 2. Create package folders

```bash
mkdir -p ~/dotfiles/ubuntu/{eza,nvim,starship,tmux,yazi,zsh,logo}
mkdir -p ~/dotfiles/ubuntu/{eza,nvim,starship,yazi,logo}/.config
```

## 3. Move existing configs

```bash
mv ~/.config/nvim ~/dotfiles/ubuntu/nvim/.config/nvim
mv ~/.config/yazi ~/dotfiles/ubuntu/yazi/.config/yazi
mv ~/.config/starship.toml ~/dotfiles/ubuntu/starship/.config/starship.toml
mv ~/.config/eza ~/dotfiles/ubuntu/eza/.config/eza
mv ~/.config/logo.txt ~/dotfiles/ubuntu/logo/.config/logo.txt
mv ~/.zshrc ~/dotfiles/ubuntu/zsh/.zshrc
mv ~/.config/tmux ~/dotfiles/ubuntu/tmux/.config/tmux
```

## 4. Create symlinks with Stow

```bash
cd ~/dotfiles/ubuntu
stow --no-folding -t ~ eza tmux nvim starship yazi zsh logo
source ~/.zshrc
```

## 5. Install tmux plugins

```bash
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
tmux
```

Press `Ctrl-s`, then `I` to install the plugins.

## 6. Verify

```bash
ls -la ~/.config
ls -la ~/.zshrc
ls -la ~/.config/tmux/tmux.conf
```

## Update dotfiles

```bash
cd ~/dotfiles
git add .
git commit -m "Update Ubuntu dotfiles"
git push
```

## Restore on a new Ubuntu machine

```bash
git clone https://github.com/nguyen-tuan-hiep/dotfiles.git ~/dotfiles
cd ~/dotfiles/ubuntu
stow --no-folding -t ~ eza tmux nvim starship yazi zsh logo
```
