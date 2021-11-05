# dotfiles

Mike Guterl's dotfiles, managed with [`chezmoi`](https://github.com/twpayne/chezmoi).

## Prerequisites

### Install homebrew

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

### Install dependencies

1password-cli was not working for me unless I also installed 1password itself.

    brew tap homebrew/cask-versions # this is unnecessary once I'm off 1password-beta
    brew install 1password-beta 1password-cli chezmoi

## Installation

### Initialize the dotfiles repo

    chezmoi init mguterl

### 1password

Secrets are stored in [1Password](https://1password.com/), and you'll need
the [1Password CLI](https://support.1password.com/command-line-getting-started/) installed.

Login to 1Password for the first time with:

    eval $(op signin <subdomain>.1password.com <email>)

Then, to login afterwards, run:

    eval $(op signin)

### Apply changes

    chezmoi apply
