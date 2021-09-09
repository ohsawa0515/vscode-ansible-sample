# vscode-ansible-sample

This is a example repository for building development and execution environment of Ansible with VSCode.

By building an environment for developing and executing Ansible in a container with [VSCode Remote Container](https://code.visualstudio.com/docs/remote/containers), anyone can use it regardless of the local environment.

## Environment

```console
$ ansible --version
ansible [core 2.11.4] 
  config file = /home/ansible/workspace/ansible.cfg
  configured module search path = ['/home/ansible/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/local/lib/python3.8/site-packages/ansible
  ansible collection location = /home/ansible/.ansible/collections:/usr/share/ansible/collections
  executable location = /usr/local/bin/ansible
  python version = 3.8.12 (default, Sep  3 2021, 02:24:44) [GCC 10.2.1 20210110]
  jinja version = 3.0.1
  libyaml = True
```

```console
$ aws --version
aws-cli/1.20.38 Python/3.8.12 Linux/4.19.128-microsoft-standard botocore/1.21.38
```

```console
$ gcloud --version
Google Cloud SDK 356.0.0
alpha 2021.09.03
beta 2021.09.03
bq 2.0.71
core 2021.09.03
gsutil 4.67
```

## Ansible Collection

The following Ansible collections are installed. You can edit `requirement.yml` to change it.

- [amazon.aws](https://galaxy.ansible.com/amazon/aws)
- [google.cloud](https://galaxy.ansible.com/google/cloud)

