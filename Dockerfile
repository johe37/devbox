FROM debian:bookworm-20230919-slim

# Set the shell to bash for all subsequent RUN instructions
SHELL ["/bin/bash", "-c"]

RUN apt update && apt install -y \
    sudo

RUN useradd -s /bin/bash -m devuser
RUN echo 'devuser ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/devuser
USER devuser

COPY --chown=devuser:devuser . /home/devuser/devbox

WORKDIR /home/devuser/devbox

RUN ./install-ansible.sh debian

RUN source ./venv/bin/activate && \
    ansible-playbook ./ansible/configure.yml \
    -e dev_user=devuser
