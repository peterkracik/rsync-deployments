#!/bin/sh

set -eu

BLUE='\033[0;34m'
NORMAL='\033[0m'

# Set deploy key
SSH_PATH="$HOME/.ssh"
mkdir "$SSH_PATH"
#echo "${INPUT_PRIVATEKEY}" > ~/.ssh/id_rsa
echo "${INPUT_PRIVATEKEY}" > "$SSH_PATH/deploy_key"
chmod 600 "$SSH_PATH/deploy_key"


# Do deployment
#sh -c "rsync $1 -e 'ssh -i $SSH_PATH/deploy_key -o StrictHostKeyChecking=no' $2 $GITHUB_WORKSPACE/ $3"
for cmd in ${INPUT_COMMAND}; do
  echo -e "${BLUE}Syncinc: ${cmd}"
  sh -c "${cmd}"
  echo ""
done
