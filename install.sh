#!/bin/bash
RED='\033[0;31m'
NC='\033[0m'
echo "Welcome to kubemail! This installer will assist you in getting configuration done for a reasonable mail server"
echo "If you want to go ahead and poke around the yml files & containers yourself you can and won't need this installer"

if ! command -v kubectwl &> /dev/null
then
    echo -e "${RED}!! kubectl could not be found! Ensure you have kubernetes installed !!${NC}"
    echo "Installer will continue and configure the files, but will not be able to install the system for you"
    echo ""
    NOKUBE=1
fi

read -p "Enter mail root domain (example.com): " mailroot
read -p "Enter mail domain (mail.example.com): " maildomain
read -p "Enter data directory (/data): " datadir
read -p "Enter initial email (bob@example.com): " username
echo -n "Enter initial password: "
while IFS= read -p "$prompt" -r -s -n 1 char
do
    # Enter - accept password
    if [[ $char == $'\0' ]] ; then
        break
    fi
    # Backspace
    if [[ $char == $'\177' ]] ; then
        prompt=$'\b \b'
        password="${password%?}"
    else
        prompt='*'
        password+="$char"
    fi
done

read -p "Would you like to enable relaying? (If you do not know what this is or don't have it set up, enter N) " -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    # do dangerous stuff
fi