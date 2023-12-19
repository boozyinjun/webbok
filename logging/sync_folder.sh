#! /bin/env bash
export DOCKER_HOST="158.160.55.184"
export SYNC_FOLDER=$(basename "`pwd`")
export MACHINE_USER="levelup"
export ROOT_DIR="/mnt/c/Users/RAS-8/myProjects/levelup/2023-09-example"

CWD="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
red="$( echo -e '\033[0;31m' )" # Red
grn="$( echo -e '\033[0;32m' )" # Green
rst="$( echo -e '\033[0m' )"    # Reset Color format

echo -e $grn"\nSynchronizing folder $SYNC_FOLDER..."$rst
cd ..
scp -r ./"$SYNC_FOLDER/" "$MACHINE_USER"@"$DOCKER_HOST":"/home/$MACHINE_USER"
cd "$CWD"