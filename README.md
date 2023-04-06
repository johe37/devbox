# fix-my-devstation
bash/ansible scripts för att preppa min arbetsstation

## Installation

```shell
./install-ansible <os>

source venv/bin/activate

# Titta igenom configure-devstation om det är några variabler som borde ändras.
# Kör sedan:
ansible-playbook ansible/configure-devstation.yml --ask-become-pass
```

Efter att playbooken har körts så kan man behöva logga in och ut.

Dessutom om man vill få Powerlevel10k riktigt läkert så behöver man:

- Ändra fontinställningarna för applikationer du vill ska kunna köra Powerlevel10k. T.ex. VScode och terminalen.
