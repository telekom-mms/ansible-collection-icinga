#!/usr/bin/env bash

set -eux

ansible-playbook icinga_agent.yml
ansible-playbook icinga_agent.yml --check --diff
ansible-playbook icinga_plugins.yml
ansible-playbook icinga_plugins.yml --check --diff
