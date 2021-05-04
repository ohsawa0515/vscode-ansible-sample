# vscode-ansible-sample

This is a example repository for building development and execution environment of Ansible with VSCode.

By building an environment for developing and executing Ansible in a container with [VSCode's Remote Container](https://code.visualstudio.com/docs/remote/containers), anyone can use it regardless of the local environment.

## Environment

```console
$ ansible --version
ansible 2.10.8
  config file = /home/ansible/workspace/ansible.cfg
  configured module search path = ['/home/ansible/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/local/lib/python3.8/site-packages/ansible
  executable location = /usr/local/bin/ansible
  python version = 3.8.9 (default, Apr 10 2021, 15:55:09) [GCC 8.3.0]
```

```console
$ pip list
Package           Version
----------------- ---------
ansible           3.2.0
ansible-base      2.10.8
ansible-lint      5.0.7
awscli            1.19.62
boto              2.49.0
boto3             1.17.62
botocore          1.20.62
google-auth       1.30.0
```

```console
$ gcloud --version
Google Cloud SDK 338.0.0
alpha 2021.04.23
beta 2021.04.23
bq 2.0.67
core 2021.04.23
gsutil 4.61
```

## Ansible Collection

The following Ansible collections are installed. You can edit `requirement.yml` to change it.

- [amazon.aws](https://galaxy.ansible.com/amazon/aws)
- [google.cloud](https://galaxy.ansible.com/google/cloud)

