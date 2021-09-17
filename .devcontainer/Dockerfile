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

# for docker in docker(dind)
RUN sudo apt-get -y install --no-install-recommends lsb-release && \
  curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg && \
  echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null && \
  apt-get update && apt-get -y install --no-install-recommends docker-ce-cli

ARG USERNAME=ansible
ARG USER_UID=1000
ARG USER_GID=$USER_UID
RUN groupadd --gid $USER_GID $USERNAME && \
  useradd --uid $USER_UID --gid $USER_GID -m -s /bin/bash $USERNAME && \
  mkdir -p /home/${USERNAME}/workspace && \
  mkdir -p /home/${USERNAME}/.ansible && \
  chown -R $USERNAME /home/${USERNAME}/workspace && \
  chown -R $USERNAME /home/${USERNAME}/.ansible && \
  echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME && \
  chmod 0440 /etc/sudoers.d/${USERNAME}

ADD entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh && \
  chown ansible:root /usr/local/bin/entrypoint.sh
ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]
CMD [ "sleep", "infinity" ]
