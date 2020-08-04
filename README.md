# Terraform Workspace Prompt for Bash

Show which workspace you are using within your bash prompt. Colour coded for dev, production & other workspaces - easy to extend to other environments.

[![asciicast](https://asciinema.org/a/351587.svg)](https://asciinema.org/a/351587?autoplay=1)

# Install
```sh
mkdir ~/.bash_scripts
cd ~/.bash_scripts
wget https://raw.githubusercontent.com/dozyio/terraform-bash-workspace-prompt/master/terraform-bash-workspace-prompt.sh

echo "[[ -r \"~/.bash_scripts/terraform-bash-workspace-prompt.sh\" ]] && . \"~/.bash_scripts/terraform-bash-workspace-prompt.sh\"" >> ~/.bash_profile
```
