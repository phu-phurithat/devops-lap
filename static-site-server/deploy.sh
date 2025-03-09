#!/bin/bash

# Define the remote server details
SERVER_USER="ubuntu"
SERVER_IP="3.25.7.188"
REMOTE_DIR="/var/www/html"   # Default Nginx directory
SSH_KEY_PATH="~/.ssh/id_rsa_1"

# Sync local files to the remote server
rsync -avz -e "ssh -i $SSH_KEY_PATH" --delete ./ $SERVER_USER@$SERVER_IP:$REMOTE_DIR

# Print message indicating successful deployment
echo "Deployment complete!"
