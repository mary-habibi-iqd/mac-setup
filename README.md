# Setup macOS using zsh

This is a collection of scripts to setup your macOS.


## Instructions

You should have the latest macOS installed. To make sure, click on the apple logo at the top left, go to "About this Mac" and click "Software Update". Install any missing updates.

Find and run the program "Terminal". This is a program that allows you to run commands on your computer. You can press <kbd>⌘</kbd><kbd>Space</kbd> to open Spotlight. Type in the program's name and press <kbd>Enter</kbd>.

Copy the command you want to run and paste it into the Terminal.  
Run it by pressing <kbd>Enter</kbd>.

> 💡 In case of any errors, carefully read the error text. You can run the scripts again at any time, steps that already worked will be skipped.

### Which commands should I run?

Begin with the [_General Setup_](#-general-setup).

The [_Setting up git and GitHub_](#-setting-up-git-and-github) script will be used once you'll need to work with git in the command line.

> 💡 You can check the "What does this do?" sections to learn what each script does in detail.

## 💻 General Setup

Installs desktop applications, command line tools and sets up the shell.

> 💡 Enter your macOS users password if you're asked for it and confirm with <kbd>Enter</kbd>. You won't see any characters while typing, but it's still working.
>
> Your old `~/.zshrc` is saved as `~/.zshrc.backup-<date>` before it is replaced.

```sh
zsh <(curl -fsSL https://raw.githubusercontent.com/mary-habibi-iqd/mac-setup/main/setup)
```

<details>
<summary>What does this do?</summary>

This command will download the [`setup` script](/setup) from GitHub and run it on your computer.

The script will install [Homebrew](https://brew.sh/) which is a package manager for macOS.

Using Homebrew it will install the following command line tools:

- [git](https://git-scm.com/) is a version control system
- [gh](https://cli.github.com/) is a command line tool for GitHub
- [fnm](https://github.com/Schniz/fnm#readme) is a fast and simple Node.js version manager
- [fzf](https://github.com/junegunn/fzf#readme) is a fuzzy finder (search your command history with <kbd>ctrl</kbd><kbd>R</kbd>)
- [eza](https://eza.rocks/) is a modern replacement for ls (list files)
- [tree](https://oldmanprogrammer.net/source.php?dir=projects/tree) lists the contents of folders as a tree
- [zoxide](https://github.com/ajeetdsouza/zoxide#readme) lets you jump to folders you used before with `z <name>`
- [zsh-completions](https://github.com/zsh-users/zsh-completions#readme), [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions#readme), [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting#readme) and [zsh-history-substring-search](https://github.com/zsh-users/zsh-history-substring-search#readme) make the shell nicer to use
- [Powerlevel10k](https://github.com/romkatv/powerlevel10k#readme) is a theme for the shell prompt

It will also install the following desktop applications using Homebrew:

- [iTerm2](https://iterm2.com/) is a terminal emulator for macOS
- [Visual Studio Code](https://code.visualstudio.com/) is a code editor
- [Rectangle](https://rectangleapp.com/) is a window manager for macOS
- [Firefox Developer Edition](https://www.mozilla.org/en-US/firefox/developer/) is a web browser
- [MesloLG Nerd Font](https://github.com/ryanoasis/nerd-fonts) is a font with icons used by the prompt

Using fnm the script will install the latest [LTS](https://github.com/nodejs/release#release-schedule) version of [Node.js](https://nodejs.org/en/) a JavaScript runtime.

The script will copy the [zsh configuration files](/configs) from this repository to configure zsh. It will also setup [shell-integration for iTerm](https://iterm2.com/documentation-shell-integration.html).

> 💡 If the prompt shows broken icons, run `p10k configure` in iTerm. It installs the right font for you.

</details>

## 🐙 Setting up git and GitHub

_This script will be used once you'll need to work with git in the command line._

Sets up git and connects it to GitHub.

> 💡 Please enter your name and email address and confirm each with <kbd>Enter</kbd>.
>
> Confirm the defaults by pressing <kbd>Enter</kbd> when asked about which file to save key and your passphrase.
>
> Choose **`ssh`** as your preferred connection method. Login and authenticate to GitHub using the browser. (The device code is found in the Terminal.)

```sh
zsh <(curl -fsSL https://raw.githubusercontent.com/mary-habibi-iqd/mac-setup/main/setup-git)
```

<details>
<summary>What does this do?</summary>

This command will download the [`setup-git` script](/setup-git) from GitHub and run it on your computer.

The script will setup git and create a new ssh key for GitHub (an existing key is reused). It will also add the key to your GitHub account using the GitHub CLI and test the connection.

</details>

## ⚙️ Nicer macOS settings (optional)

```sh
zsh <(curl -fsSL https://raw.githubusercontent.com/mary-habibi-iqd/mac-setup/main/setup-macos)
```

See the [`setup-macos` script](/setup-macos) for the list of changes.

## Setting up VS Code

Follow [these instructions](./vscode-setup.md) to prepare VS Code.
