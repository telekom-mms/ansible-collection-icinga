# Ansible Role - telekom_mms.ansible_collection_icinga.icinga_downtime

This role manages Icinga downtimes with Ansible via the REST API.
You can add a downtime for a group or a single host, both included or excluded their running services.
Or you can set a downtime for a dedicated service of a group or single host.
Additionally current downtimes set by Ansible can be removed.


## Requirements

- The name of the ansible hosts inside the inventory has to be exactly the same as the icinga objects, due to using the ansible hostname as icinga target filter.

## Role Variables

| Variable                 | Required    | Default                        | Description
|-|-|-|-|
| target                   | mandatory   | ""                             | define icinga-host-objects as target (must be identically in ansibles inventory)
| icinga_action            | mandatory   | ""                             | "add_downtimes" or "remove_downtimes"
| icinga_api_uri           | mandatory   | ""                             | URL of the Icinga instance could be "https://<hostname>.<domain>
| icinga_api_user          | mandatory   | ""                             | User with access to the REST-API
| icinga_api_pwd           | mandatory   | ""                             | Password of the User, should be encrypted e.g. with ansible-vault
| icinga_api_port          | optional    | "5665"                         | Icinga API port
| duration                 | optional    | "2"                            | Duration of the downtime
| duration_unit            | optional    | "hours"                        | Unit of the duration
| author                   | optional    | "Ansible"                      | Author of the downtime
| comment                  | optional    | "Downtime set by automation"   | Comment to be added to the downtime
| host_downtime            | optional    | true                           | Also set a downtime for the host
| service_downtime         | optional    | true                           | Also set a downtime for the services
| single_service_downtime  | optional    | false                          | Only set a downtime for a single service
| host_service_downtime    | optional    | false                          | Only set a downtime for a single host
| service_filter           | optional    | ""                             | Add a service filter to the downtime

## Dependencies

- no dependencies


## Examples

```
- name: Manage Icinga Downtimes with Ansible
  hosts: localhost
  connection: local
  gather_facts: false
  collections:
    - telekom_mms.ansible_collection_icinga
  roles:
    - icinga_downtime
```

```
# command template
ansible-playbook <path_to_playbooks/playbook.yml> -i <path_to_inventory/hosts> -e target="<groupname>" -e icinga_action="<icinga_action>"

# add downtime for all hosts in group devhosts and all of its services
ansible-playbook ./playbooks/playbook.yml -i inventories/inventory/hosts -e target="devhosts" -e icinga_action="add_downtimes"

# remove downtime for all hosts in group devhosts and all of its services
ansible-playbook ./playbooks/playbook.yml -i inventories/inventory/hosts -e target="devhosts" -e icinga_action="remove_downtimes"

# add downtime for load-check of all hosts in group devhosts
ansible-playbook ./playbooks/playbook.yml -i inventories/inventory/hosts -e target="devhosts" -e icinga_action="add_downtimes" -e single_service_downtime="true" -e service_filter="load"

# add downtime for single host "hostname1" and all its services
ansible-playbook ./playbooks/playbook.yml -i inventories/inventory/hosts -e target="hostname1" -e icinga_action="add_downtimes" -e single_host_downtime="true"
```

## Author Information

This role was created by @FABI with support from @FLiPp3r90.
