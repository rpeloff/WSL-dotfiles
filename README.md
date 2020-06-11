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

Install Oh My Zsh
-----------------

In case you have not heard of it, read [this](https://github.com/ohmyzsh/ohmyzsh) 🙃

> **Oh My Zsh will not make you a 10x developer...but you may feel like one.**
>
> Once installed, your terminal shell will become the talk of the town or your money back! With each keystroke in your command prompt, you'll take advantage of the hundreds of powerful plugins and beautiful themes. Strangers will come up to you in cafés and ask you, "that is amazing! are you some sort of genius?"
>
>Finally, you'll begin to get the sort of attention that you have always felt you deserved. ...or maybe you'll use the time that you're saving to start flossing more often. 😬
> 

First install [Zsh](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH):

``` 
sudo apt update
sudo apt upgrade
sudo apt install zsh
```

Then install [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh):

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

Install pyenv (optional)
-------------

```
sudo apt-get update; sudo apt-get install --no-install-recommends make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
```

Install Yadm
------------

[Yet Another Dotfiles Manager](https://yadm.io/) (yadm) will manage our dotfiles:

```
git clone https://github.com/TheLocehiliosan/yadm.git ~/.yadm-project
sudo ln -s ~/.yadm-project/yadm /usr/local/bin/yadm
```

Now install our dotfiles with yadm:

```
yadm clone https://github.com/rpeloff/WSL-dotfiles.git
```

You will be prompted to execute a bootstrap program. This is recommended if you use tmux.

Skip the bootstrap program if you do not use any of the following:

- tmux
- pyenv
- virtualenvwrapper (TODO)

The bootstrap program can be executed at a later stage with `yadm bootstrap`.
