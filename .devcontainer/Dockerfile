# Refer https://github.com/microsoft/vscode-dev-containers/blob/v0.134.0/containers/python-3/.devcontainer/Dockerfile
FROM python:3.8-slim

COPY requirements.txt /tmp/pip-tmp/
RUN pip3 install -r /tmp/pip-tmp/requirements.txt && \
  rm -rf /tmp/pip-tmp

RUN apt-get -y update && \
  export DEBIAN_FRONTEND=noninteractive && \
  apt-get -y install --no-install-recommends git peco vim sudo curl ssh

# AWS SSM Session Manager plugin
RUN curl "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/ubuntu_64bit/session-manager-plugin.deb" -o "session-manager-plugin.deb" && \
  dpkg -i session-manager-plugin.deb

# for gcloud Cloud SDK
RUN apt-get install -y --no-install-recommends apt-transport-https ca-certificates gnupg && \
  echo "deb https://packages.cloud.google.com/apt cloud-sdk main" > /etc/apt/sources.list.d/google-cloud-sdk.list && \
  curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \
  apt-get update -y && apt-get install -y google-cloud-sdk

ARG USERNAME=ansible
ARG USER_UID=1000
ARG USER_GID=$USER_UID
RUN groupadd --gid $USER_GID $USERNAME && \
  useradd --uid $USER_UID --gid $USER_GID -m -s /bin/bash $USERNAME && \
  mkdir -p /home/${USERNAME}/workspace && \
  chown -R $USERNAME /home/${USERNAME}/workspace && \
  echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME && \
  chmod 0440 /etc/sudoers.d/${USERNAME}

# Download JSON Schemas for Ansible
RUN mkdir -p /home/${USERNAME}/schemas && \
  curl https://json.schemastore.org/ansible-playbook.json -o /home/${USERNAME}/schemas/ansible-playbook.json && \
  curl https://json.schemastore.org/ansible-role-2.9.json -o /home/${USERNAME}/schemas/ansible-role.json && \
  sed -i"" -e "s#https://json.schemastore.org/ansible-role-2.9#./ansible-role.json#g" /home/${USERNAME}/schemas/ansible-playbook.json && \
  chown -R $USERNAME /home/${USERNAME}/schemas
