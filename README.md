# dotfiles

My [dotfiles](https://en.wikipedia.org/wiki/Hidden_file_and_hidden_directory#Unix_and_Unix-like_environments) and other setup things for [WSL 1.0](https://docs.microsoft.com/en-us/windows/wsl/) on a Windows machine.

> **dotfile**\
> *noun* \
> plural noun: **dotfiles**
> 
> 1. Dotfiles are plain text configuration files on Unix-y systems for things like our shell, `~/.zshrc`, our editor in `~/.vimrc`, and many others. They are called "dotfiles" as they typically are named with a leading `.` making them hidden files on your system, although this is not a strict requirement.
> [[source](https://thoughtbot.com/upcase/videos/intro-to-dotfiles#:~:text=Dotfiles%20are%20plain%20text%20configuration,although%20this%20is%20not%20a%20strict%20requirement.)]

This guide will take you through my basic setup for software development and data science work (mostly in Python) on WSL. We start by setting up and installing a few useful tools, followed by the configuration of these tools by installing the dotfiles in this repository.

## Table of Contents

- [dotfiles](#dotfiles)
  - [Table of Contents](#table-of-contents)
  - [Create SSH keys](#create-ssh-keys)
  - [Install Oh My Zsh](#install-oh-my-zsh)
      - [via curl](#via-curl)
      - [via wget](#via-wget)
    - [Powerlevel10k theme for Oh My Zsh](#powerlevel10k-theme-for-oh-my-zsh)
  - [Install a powerline compatible font](#install-a-powerline-compatible-font)
      - [Font installation](#font-installation)
  - [Install tmux](#install-tmux)
    - [.tmux configuration](#tmux-configuration)
  - [Install pyenv](#install-pyenv)
    - [pyenv-virtualenv](#pyenv-virtualenv)
  - [Install Poetry](#install-poetry)
  - [Install Yadm and clone the dotfiles](#install-yadm-and-clone-the-dotfiles)
    - [Yadm bootstrap program: install additional tools](#yadm-bootstrap-program-install-additional-tools)

## Create SSH keys

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

## Install Oh My Zsh

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

#### via curl
```Shell
$ sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

#### via wget
```Shell
$ sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Change your default shell to zsh when prompted.

### Powerlevel10k theme for Oh My Zsh

There are many themes available for Oh My Zsh. I have included the [Powerlevel10k theme](https://github.com/romkatv/powerlevel10k) as a git submodule that can be installed along with the dotfiles (see the [Yadm bootstrap program](#Yadm-bootstrap-program-install-additional-tools) for installation). 

I have also included a configuration for this theme. You can re-configure the Powerlevel10k theme at the end of the dotfiles installation by deleting the `.p10k.zsh` dotfile and restarting your terminal.

Consult the [Oh My Zsh documentation](https://github.com/ohmyzsh/ohmyzsh#themes) for guidance if you would like to select another theme (such as the [Bullet Train theme](https://github.com/caiogondim/bullet-train.zsh)).

## Install a powerline compatible font

Powerline adds visual magic to your terminals. To make this work, you need to install a powerline font and configure your WSL terminal to use this font.

[Nerd fonts](https://www.nerdfonts.com/) work great with powerline. You can also install [powerline fonts](https://github.com/powerline/fonts), but these fonts are not maintained with as many glyphs and do not work as well with themes like Powerlevel10k.

I like working with the **Meslo Nerd Font** ([see preview](https://www.programmingfonts.org/#meslo)), a customized version of Apple's Menlo. In particular, I use the [Meslo Nerd Font patched for Powerlevel10k](https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k).

#### Font installation

Download these four ttf files:

- [MesloLGS NF Regular.ttf](https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf)
- [MesloLGS NF Bold.ttf](https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf)
- [MesloLGS NF Italic.ttf](https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf)
- [MesloLGS NF Bold Italic.ttf](https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf)

Double click each of the `.ttf` files and select `"Install"` on the top left of the *Windows Font Viewer*. The `MesloLGS NF` will be available to all application on your system.

In your favorite terminal (mine is the [Fluent Terminal](https://github.com/felixse/FluentTerminal), find it in the Microsoft Store), locate the settings dialog and set the terminal font family to `MesloLGS NF` or whichever powerline compatible font you choose to install.

## Install tmux

I use [tmux](https://github.com/tmux/tmux/wiki) for managing terminal sessions. If you use tmux, install it now and start managing your sessions the smart way:

```Shell
$ sudo apt install tmux
```

### .tmux configuration

I have included a [.tmux configuration file](https://github.com/gpakosz/.tmux) as a git submodule that can be installed along with the dotfiles (see the [Yadm bootstrap program](#Yadm-bootstrap-program-install-additional-tools) for installation). This makes tmux fun and easier to use.

## Install pyenv

[pyenv](https://github.com/pyenv/pyenv) is a simple and useful tool for Python version management. This allows you to develop, test, and run applications in multiple versions of Python. In particular, it helps you avoid using the Python provided with the system (looking at you `python3`). The reason for this is that Python is used by the Linux OS itself and so you might want to avoid breaking it.

I have included pyenv as a git submodule that can be installed along with the dotfiles (see the [Yadm bootstrap program](#Yadm-bootstrap-program-install-additional-tools) for installation). If you plan to use it and install one or more Python versions, first install the Python build dependencies:

```Shell
$ sudo apt-get update
$ sudo apt-get install --no-install-recommends make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
```

After the [dotfiles installation](#Install-Yadm-and-clone-the-dotfiles), you can install and manage multiple Python versions with pyenv. For example, download and install Python 3.7.7:

```Shell
$ pyenv install 3.7.7
```

See [here](https://github.com/pyenv/pyenv/blob/master/COMMANDS.md) for more information on how to use the pyenv commands.

### pyenv-virtualenv

I have also included [pyenv-virtualenv](https://github.com/pyenv/pyenv-virtualenv) as a git submodule that can be installed along with the dotfiles (see the [Yadm bootstrap program](#Yadm-bootstrap-program-install-additional-tools) for installation). This is a plugin for pyenv, enabling features to conveniently manage [virtualenvs](https://virtualenv.pypa.io/en/latest/).

This helps keep your Python installations clean and manage your project dependencies. **Isolate your development environments in virtualenvs!**

## Install Poetry

[Poetry](https://python-poetry.org/) is an elegant tool that make Python packaging and dependency management a breeze. Many are switching from pipenv to Poetry (for example, see this [Python dev environment](https://jacobian.org/2019/nov/11/python-environment-2020/)).

Install Poetry with the [recommended installer](https://python-poetry.org/docs/#osx-linux-bashonwindows-install-instructions):

```Shell
$ curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python3
```

Note: I have tried using the pipx installation and had trouble getting pyenv and Poetry to co-operate. The recommended installer works best for me.

Poetry supports completion scripts. Enable this for Oh My Zsh as follows:

```Shell
mkdir $ZSH_CUSTOM/plugins/poetry
poetry completions zsh > $ZSH_CUSTOM/plugins/poetry/_poetry
```

## Install Yadm and clone the dotfiles

I use [yadm](https://yadm.io/) (Yet Another Dotfiles Manager) to manage my dotfiles. Yadm is based on git and greatly simplifies the process of storing dotfiles in a single repository, while making sure that they are installed into the right locations.

Install yadm:

```Shell
$ git clone https://github.com/TheLocehiliosan/yadm.git ~/.yadm-project
$ sudo ln -s ~/.yadm-project/yadm /usr/local/bin/yadm
```

Now clone (i.e. install) the dotfiles with yadm:

```Shell
$ yadm clone https://github.com/rpeloff/WSL-dotfiles.git
```

### Yadm bootstrap program: install additional tools

You will be prompted to execute a yadm bootstrap program when cloning the dotfiles. This is recommended and will install the following tools/themes:

- [Powerlevel10k theme for Oh My Zsh](#Powerlevel10k-theme-for-Oh-My-Zsh)
- [.tmux configuration](#tmux-configuration)
- [pyenv](#Install-pyenv)
- [pyenv-virtualenv](#pyenv-virtualenv)

Alternatively, the bootstrap program can be executed at a later stage with `yadm bootstrap`.

Finally, restart your terminal for changes to take effect.
