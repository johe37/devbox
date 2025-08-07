# devbox

bash and ansible scripts for setting up development environment.

## Get started

```shell
./init.bash <os>

source venv/bin/activate

# Ansible playbook for installing packages
ansible-playbook ansible/install-packages.yml --ask-become-pass

# Ansible playbook for configuring shell
ansible-playbook ansible/configure-shell.yml --ask-become-pass

# Ansible playbook for configuring GIT (sudo not needed)
ansible-playbook ansible/configure-git.yml

# Ansible playbook for configuring vim (sudo not needed)
ansible-playbook ansible/configure-vim.yml

# Want to run everything? Run
ansible-playbook ansible/converge.yml --ask-become-pass
```

After  playbook `configure-shell.yml` have run, you need to log in and out
to apply the changes to the default shell.

## Test code locally

```
docker build -t johe37-devbox:$(git describe --tags --abbrev=0) .
```
