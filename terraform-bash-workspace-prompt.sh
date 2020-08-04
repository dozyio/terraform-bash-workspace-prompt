#/bin/bash

TFPURPLE="$(echo -e "\001\033[35m\002(TF:\001\033[0m\002")"
TFPURPLECB="$(echo -e "\001\033[35m\002)\001\033[0m\002")"

function terraform_workspace_prompt()
{
    if [ -d .terraform ]; then
        terraform_workspace="$(command terraform workspace show 2>/dev/null)"
        if [[ $terraform_workspace == "prod"* ]] || [[ $terraform_workspace == "PROD"* ]] || [[ $terraform_workspace == "Prod"* ]]; then
            echo -e " $TFPURPLE\001\033[1;41;97m\002${terraform_workspace}\001\033[0m\002$TFPURPLECB"
        elif [[ $terraform_workspace == "dev"* ]] || [[ $terraform_workspace == "DEV"* ]] || [[ $terraform_workspace == "Dev"* ]]; then
            echo -e " $TFPURPLE\001\033[32;1m\002${terraform_workspace}\001\033[0m\002$TFPURPLECB"
        else
            echo -e " $TFPURPLE\001\033[1m\002${terraform_workspace}\001\033[0m\002$TFPURPLECB"
        fi
    fi
}

export PS1=${PS1/ \\\u\\\$/\$(terraform_workspace_prompt) \\\u\\\$}
