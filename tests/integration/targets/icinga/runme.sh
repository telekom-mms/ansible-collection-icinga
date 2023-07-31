#!/usr/bin/env bash

set -eux

ansible-playbook t_systems_mms.ansible_collection_icinga.domon_standard -e "@../../integration_config.yml" "$@"
ansible-playbook t_systems_mms.ansible_collection_icinga.check_azure_oauth_token -e "@../../integration_config.yml" "$@"
ansible-playbook t_systems_mms.ansible_collection_icinga.check_gitlab_scheduler -e "@../../integration_config.yml" "$@"
ansible-playbook t_systems_mms.ansible_collection_icinga.check_https -e "@../../integration_config.yml" "$@"
ansible-playbook t_systems_mms.ansible_collection_icinga.check_json -e "@../../integration_config.yml" "$@"
ansible-playbook t_systems_mms.ansible_collection_icinga.check_json_azure_restapi -e "@../../integration_config.yml" "$@"
ansible-playbook t_systems_mms.ansible_collection_icinga.check_json_azure_restapi_resourcehealth -e "@../../integration_config.yml" "$@"
ansible-playbook t_systems_mms.ansible_collection_icinga.template_empty_host -e "@../../integration_config.yml" "$@"

