##############################################################
# Update system node path to nvm default node path
##############################################################
#SYSTEM_NODE_PATH="/usr/bin/node"
#NVM_DEFAULT_NODE_PATH="$(nvm which default)"
#ln -Ffsv "$NVM_DEFAULT_NODE_PATH" "$SYSTEM_NODE_PATH"


# Other version
#!/usr/bin/env zsh

rm -f /usr/bin/node
rm -f /usr/bin/npm
ln -s $(which node) /usr/bin/node
ln -s $(which npm) /usr/bin/npm