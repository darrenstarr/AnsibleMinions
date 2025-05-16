#!/bin/bash

# Update the package list and install prerequisites
sudo apt update -y
sudo apt install -y software-properties-common python3-pip python3-venv

# Add the Ansible repository
sudo add-apt-repository --yes --update ppa:ansible/ansible

# Install the latest version of Ansible
sudo apt install -y ansible

# Create a virtual environment for ansible-generator
python3 -m venv ~/.ansible-env
source ~/.ansible-env/bin/activate

# Install ansible-generator in the virtual environment
pip install ansible-generator

# Install ansible-lint
pip install ansible-lint

# Deactivate the virtual environment
deactivate

# Add ansible-generate to PATH if not already present
if ! grep -q "~/.ansible-env/bin" ~/.bashrc; then
  echo 'export PATH="~/.ansible-env/bin:$PATH"' >> ~/.bashrc
fi

# Verify installation
ansible --version
ansible-galaxy --help
~/.ansible-env/bin/ansible-generate --help
ansible-lint --version