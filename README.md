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

Install Yadm
------------

[Yet Another Dotfiled Manager](https://yadm.io/) (Yadm) will manage our dotfiles:

```
sudo apt install yadm
```

