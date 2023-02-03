ansible-icinga-downtimes
=========

This role manages Icinga downtimes with Ansible via the REST API.
You can add a downtime for a group or a single host, both included or excluded their running services.
Or you can set a downtime for a dedicated service of a group or single host.
Additionally current downtimes set by Ansible can be removed.


Requirements
------------

- The name of the ansible hosts inside the inventory has to be exactly the same as the icinga objects, due to using the ansible hostname as icinga target filter.

...

Role Variables
--------------

- mandatory: target                   (String), define icinga-host-objects as target (must be idendically in ansibles inventory)
- mandatory: icinga_action            [add_downtimes | remove_downtimes]
- mandatory: icinga_api_uri           (String), could be "https://<hostname>.<domain>)
- mandatory: icinga_api_user          (String), icinga-REST-API-user)
- mandatory: icinga_api_pwd           (String), should be encrypted e.g. with ansible-vault
- optional : icinga_api_port          (default: "5665")
- optional : duration                 (default: "2")
- optional : duration_unit            (default: "hours")
- optional : author                   (default: "Ansible") 
- optional : comment                  (default: "Downtime set by automation")
- optional : host_downtime            (default: true)
- optional : service_downtime         (default: true)
- optional : single_service_downtime  (default: false)
- optional : host_service_downtime    (default: false)
- optional : service_filter           (default: "")

Dependencies
------------

- no dependencies


Example Playbooks
----------------

-- playbook for a hostgroup
\---
- name: Manage Icinga Downtimes with Ansible
  hosts: localhost
  connection: local
  gather_facts: false
  roles:
    - roles/icinga-downtime



Example CLI commands
-------

- command template
ansible-playbook <path_to_playbooks/playbook.yml> -i <path_to_inventory/hosts> -e target="<groupname>" -e icinga_action="<icinga_action>"

- add downtime for all hosts in group devhosts and all of it's services
ansible-playbook ./playbooks/playbook.yml -i inventories/inventory/hosts -e target="devhosts" -e icinga_action="add_downtimes"

- remove downtime for all hosts in group devhosts and all of it's services
ansible-playbook ./playbooks/playbook.yml -i inventories/inventory/hosts -e target="devhosts" -e icinga_action="remove_downtimes"

- add downtime for load-check of all hosts in group devhosts
ansible-playbook ./playbooks/playbook.yml -i inventories/inventory/hosts -e target="devhosts" -e icinga_action="add_downtimes" -e single_service_downtime="true" -e service_filter="load"

- add downtime for single host "hostname1" and all it's services
ansible-playbook ./playbooks/playbook.yml -i inventories/inventory/hosts -e target="hostname1" -e icinga_action="add_downtimes" -e single_host_downtime="true"

License
-------

Apache


Author Information
------------------

This role was created by @FABI
with support from @FLiPp3r90
