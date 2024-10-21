#!/bin/bash

timestamp="$(date +"%Y-%m-%d_%H:%M")"

# function to create and open a file in the specified directory
open_file() {

    # Cd into the directory
    cd "$1" || exit
    # Create the file in the specified directory
    touch "$1/$filename.md"

    # create unique identifier and links section

    # format the file
    {
        echo "# "
    } >>"$1/$filename.md"

    # Open the file in Neovim
    nvim '+ normal ggzzi' "$1/$filename.md"
}

# Prompt the user if no filename is provided
if [[ $# -eq 0 ]]; then
    filename=$timestamp
fi

# if more than one argument is given, print error message and stop script
if [[ $# -gt 1 ]]; then
    echo "Please provide only one filename separated by dashes, without .md extension."
    echo "Example: zet my-new-note"
    exit 1
fi

# set filename to the argument given to the script
if [[ $# -eq 1 ]]; then
    filename=$1
fi

VAULT_NOTES=$HOME/Library/CloudStorage/Dropbox/vault
open_file "$VAULT_NOTES/_inbox"
