#!/bin/bash

# Check to see if there is a need to install Visual Studio Code extensions,
if [ ! -d $HOME/.vscode/extensions ]; then
    echo "Installing default Visual Studio Code extensions."

    echo "Install vscode-markdown"
    code --install-extension yzhang.markdown-all-in-one

    echo "Install vscode-gitlens"
    code --install-extension eamodio.gitlens

    echo "Install vscode-trailingspaces"
    code --install-extension shardulm94.trailing-spaces

    echo "Install vscode-icons"
    code --install-extension robertohuertasm.vscode-icons

    echo "Install Code Spell Checker"
    code --install-extension streetsidesoftware.code-spell-checker

    echo "Install markdownlint"
    code --install-extension DavidAnson.vscode-markdownlint

    echo "Install Text Marker"
    code --install-extension ryu1kn.text-marker

    echo "Install Vim"
    code --install-extension vscodevim.vim
fi

# Check to see if the Visual Studio Code configuration file exists.
if [ ! -f $HOME/.config/Code/User/settings.json ]; then
    echo "Installing default Visual Studio Code configuration file."
	mkdir -p $HOME/.config/Code/User
	cp /tmp/vscode-config.json $HOME/.config/Code/User/settings.json
fi