# devbox
bash/ansible scripts för att preppa min arbetsstation

## Installation

Innan du kör scripten nedan kan du kolla igenom `ansible/vars/devstation.yml` om
du vill ändra några variabler.

```shell
./install-ansible <os>

source venv/bin/activate

ansible-playbook ansible/configure.yml --ask-become-pass
```

Vill du skippa något i `ansible/configure.yml`?

```
ansible-playbook ansible/configure.yml --ask-become-pass --skip-tags=git,ssh
```

Efter att playbooken har körts så kan man behöva logga in och ut.

Dessutom om man vill få Powerlevel10k riktigt läkert så behöver man:

- Ändra fontinställningarna för applikationer du vill ska kunna köra Powerlevel10k. T.ex. VScode och terminalen.

### Övrigt

Gör din Linux Workstation coolare med https://www.youtube.com/watch?v=7JJmCAJs9pM.
Kräver GNOME >=43.

## Bygg container

```
docker build -t devbox:0.1.0 .
```

Knuff:

```
docker login
docker push containers/hellnet.se/devbox:0.1.0
```

