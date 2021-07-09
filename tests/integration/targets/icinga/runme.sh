#!/usr/bin/env bash

set -eux

ansible-playbook icinga_agent.yml
#ansible-playbook icinga_plugins.yml
