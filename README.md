# fix-my-devstation
bash/ansible scripts for setting up my devstation

## Installation

```shell
./install-ansible <os>

source venv/bin/activate

# Titta igenom configure-devstation om det är några variabler som borde ändras
ansible-playbook configure-devstation.yml
```

Efter att playbooken har körts så kan man behöva logga in och ut.

Dessutom om man vill få Powerlevel10k riktigt läkert så behöver man:

- Ladda ner och installera fonterna https://github.com/romkatv/powerlevel10k#manual-font-installation.
- Använd fonterna i terminalen och editorn man använder.
