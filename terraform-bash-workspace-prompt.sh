#/bin/bash

TFPURPLE="$(echo -e "\033[35m(TF:\033[m")"
TFPURPLECB="$(echo -e "\033[35m)\033[m\033")"

function terraform_workspace_prompt()
{
    if [ -d .terraform ]; then
        terraform_workspace="$(command terraform workspace show 2>/dev/null)"
        if [[ $terraform_workspace == "prod"* ]] || [[ $terraform_workspace == "PROD"* ]] || [[ $terraform_workspace == "Prod"* ]]; then
            echo -e " $TFPURPLE\033[1;41;97m${terraform_workspace}\033[m$TFPURPLECB"
        elif [[ $terraform_workspace == "dev"* ]] || [[ $terraform_workspace == "DEV"* ]] || [[ $terraform_workspace == "Dev"* ]]; then
            echo -e " $TFPURPLE\033[32;1m${terraform_workspace}\033[m$TFPURPLECB"
        else
            echo -e " $TFPURPLE\033[1m${terraform_workspace}\033[m$TFPURPLECB"
        fi
    fi
}

echo $PS1
export PS1=${PS1/ \\\u\\\$/\$(terraform_workspace_prompt) \\\u\\\$}
echo $PS1
