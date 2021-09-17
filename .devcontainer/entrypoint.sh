#!/bin/bash

set -e

export COLLECTIONS_PATHS=/home/ansible/.ansible/collections
export ANSIBLE_ROLES_PATH=/home/ansible/.ansible/roles
USERNAME="ansible"
HOME_DIR="/home/${USERNAME}"
WORK_DIR="${HOME_DIR}/workspace"

ansible-galaxy role install -r ${WORK_DIR}/requirements.yml
ansible-galaxy collection install -r ${WORK_DIR}/requirements.yml
chown ${USERNAME}:${USERNAME} -R ${HOME_DIR}/.ansible/

set +e
exec "$@"
