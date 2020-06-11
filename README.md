dotfiles
========

My dotfiles and other things for WSL 1.0 on a Windows machine.

Create SSH keys
---------------

Generate [Ed25519 SSK keys](https://medium.com/risan/upgrade-your-ssh-key-to-ed25519-c6e8d60d3c54) for authenticating secure services (e.g. GitHub, AWS DevOps, etc.):

```
ssh-keygen -o -a 100 -t ed25519 -f ~/.ssh/id_ed25519 -C "username@domain.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
```

Add the generated public key to [GitHub](https://github.com/settings/ssh/new) and other auth services:

```
cat ~/.ssh/id_ed25519.pub
```

Setup [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh)
-------------

First install [Zsh](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH):

``` 
sudo apt update
sudo apt upgrade
sudo apt install zsh
```

Install Oh My Zsh:

**via curl**
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

**via wget**
```
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

See the documentation for more information and a guide to switching themes. By default I have selected the [Bullet Train theme](https://github.com/caiogondim/bullet-train.zsh).

Install a Powerline font
------------------------

Powerline adds visual magic to your terminals. To make this work, you need to install a Powerline font that will work with WSL.

I like working with the [Menlo patched font for Powerline](https://github.com/abertsch/Menlo-for-Powerline) which can be downloaded [here](https://github.com/abertsch/Menlo-for-Powerline/archive/master.zip). You can install any Powerline compatible font (for example, you might prefer [Ubuntu Mono for Powerline](https://github.com/powerline/fonts/tree/master/UbuntuMono)).

Unzip the archive and install the extracted fonts (double click each of the `.ttf` files and select `"install"` on the top left of the *Windows Font Viewer*).

In your favorite terminal (mine is the [Fluent Terminal](https://github.com/felixse/FluentTerminal)), locate the settings dialog and set the terminal font family to `"Menlo for Powerline"` or whichever Powerline font you choose to install.

Install tmux (optional)
------------

I use [tmux](https://github.com/tmux/tmux/wiki) for managing terminal sessions. I also use a [.tmux configuration file](https://github.com/gpakosz/.tmux) to make my tmux pretty and fun to use. Install tmux:

``` 
sudo apt install tmux
```

If you do not use tmux, do not execute the yadm bootstrap (explained below).  

Install Yadm
------------

[Yet Another Dotfiles Manager](https://yadm.io/) (yadm) will manage our dotfiles:

```
sudo apt install yadm
```

Now install our dotfiles with yadm:

```
yadm clone https://github.com/rpeloff/WSL-dotfiles.git
```

You will be prompted to execute a bootstrap program. This is recommended if you use tmux.
