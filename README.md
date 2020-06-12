dotfiles
========

My dotfiles and other things for WSL 1.0 on a Windows machine.

Create SSH keys
---------------

Generate [Ed25519 SSK keys](https://medium.com/risan/upgrade-your-ssh-key-to-ed25519-c6e8d60d3c54) for authenticating secure services (e.g. GitHub, AWS DevOps, etc.):

```Shell    
$ ssh-keygen -o -a 100 -t ed25519 -f ~/.ssh/id_ed25519 -C "username@domain.com"
$ eval "$(ssh-agent -s)"
$ ssh-add ~/.ssh/id_ed25519
```

Add the generated public key to [GitHub](https://github.com/settings/ssh/new) and other auth services:

```Shell
$ cat ~/.ssh/id_ed25519.pub
```

Install Oh My Zsh
-----------------

In case you have not heard of [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh), read this ... 🙃

> **Oh My Zsh will not make you a 10x developer...but you may feel like one.**
>
> Once installed, your terminal shell will become the talk of the town or your money back! With each keystroke in your command prompt, you'll take advantage of the hundreds of powerful plugins and beautiful themes. Strangers will come up to you in cafés and ask you, "that is amazing! are you some sort of genius?"
>
>Finally, you'll begin to get the sort of attention that you have always felt you deserved. ...or maybe you'll use the time that you're saving to start flossing more often. 😬
> 

First install [Zsh](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH):

```Shell
$ sudo apt update
$ sudo apt upgrade
$ sudo apt install zsh
```

Then install [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh):

**via curl**
```Shell
$ sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

**via wget**
```Shell
$ sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

There are many themes available for Oh My Zsh. I have included the [Powerlevel10k theme](https://github.com/romkatv/powerlevel10k) with these dotfiles as well as configuration for this theme. You can re-configure the Powerlevel10k theme at the end of the dotfiles installation by deleting the `.p10k.zsh` dotfile and restarting your terminal.

If you would like to use another theme, such as the [Bullet Train theme](https://github.com/caiogondim/bullet-train.zsh), consult the [Oh My Zsh documentation](https://github.com/ohmyzsh/ohmyzsh#themes) for guidance on selecting themes.

Install a powerline compatible font
-----------------------------------

Powerline adds visual magic to your terminals. To make this work, you need to install a powerline font and configure your WSL terminal to use this font.

[Nerd fonts](https://www.nerdfonts.com/) work great with powerline. You can also install [powerline fonts](https://github.com/powerline/fonts), but these fonts are not maintained with as many glyphs and do not work as well with themes like Powerlevel10k.

I like working with the **Meslo Nerd Font** ([see preview](https://www.programmingfonts.org/#meslo)), a customized version of Apple's Menlo. In particular, I use the [Meslo Nerd Font patched for Powerlevel10k](https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k).

**Font installation**

Download these four ttf files:

- [MesloLGS NF Regular.ttf](https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf)
- [MesloLGS NF Bold.ttf](https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf)
- [MesloLGS NF Italic.ttf](https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf)
- [MesloLGS NF Bold Italic.ttf](https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf)

Double click each of the `.ttf` files and select `"Install"` on the top left of the *Windows Font Viewer*. The `MesloLGS NF` will be available to all application on your system.

In your favorite terminal (mine is the [Fluent Terminal](https://github.com/felixse/FluentTerminal)), locate the settings dialog and set the terminal font family to `MesloLGS NF` or whichever powerline compatible font you choose to install.

Install tmux (optional)
-----------------------

I use [tmux](https://github.com/tmux/tmux/wiki) for managing terminal sessions. If you use tmux, install it now and start managing your sessions:

```Shell
$ sudo apt install tmux
```

I have included a [.tmux configuration file](https://github.com/gpakosz/.tmux) with the dotfiles to make tmux pretty and fun to use. 

Install pyenv (optional)
-------------

[pyenv](https://github.com/pyenv/pyenv) is a simple and useful tool for Python version management. This allows you to develop, test, and run applications in multiple versions of Python. In particular, it helps you avoid using the Python provided with the system (looking at you `python3`). The reason for this is that Python is used by the Linux OS itself and so you might want to avoid breaking it.

I have included pyenv with the dotfiles. If you plan to use it and install one or more Python versions, first install the Python build dependencies:

```Shell
$ sudo apt-get update
$ sudo apt-get install --no-install-recommends make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
```

After the dotfiles installation, you can install multiple python versions with pyenv. For example, download and install Python 3.7.7:

```Shell
$ pyenv install 3.7.7
```

See [here](https://github.com/pyenv/pyenv/blob/master/COMMANDS.md) for more information on how to use the pyenv commands.

Install Yadm
------------

[Yet Another Dotfiles Manager](https://yadm.io/) (yadm) will manage our dotfiles:

```Shell
$ git clone https://github.com/TheLocehiliosan/yadm.git ~/.yadm-project
$ sudo ln -s ~/.yadm-project/yadm /usr/local/bin/yadm
```

Now install our dotfiles with yadm:

```Shell
$ yadm clone https://github.com/rpeloff/WSL-dotfiles.git
```

You will be prompted to execute a bootstrap program. This is recommended if you use any of the following:

- Powerlevel10k theme for Oh My Zsh
- tmux
- pyenv
- TODO virtualenv

The bootstrap program can be executed at a later stage with `yadm bootstrap`.

Finally, restart your terminal for changes to take effect.
