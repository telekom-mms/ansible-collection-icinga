# Ansible Role - t_systems_mms.ansible_collection_icinga.icinga_plugins

This role copies custom checks to the wished icinga-agent node.

## Dependencies

Some checks might have dependencies, define `dependency_packages` as variable to install them.

```yaml
dependency_packages:
  - "perl-Switch"
  - "python-requests"
```

## Variables

| Variable                                   | Required | Default                | Description
|--------------------------------------------|----------|------------------------|------------
| dependency_packages | no | [] | install dependency packages
| icinga_install_plugins | yes | | list of plugins that should be installed
| icinga2_plugins_pluginsdir | yes | {{ icinga2_plugins_basedir }}/plugins | directory for icinga plugins
| icinga2_plugins_basedir | yes | /usr/lib64/nagios | base directory for your icinga plugins
| icinga_plugins_path | yes | | path with your plugins for example {{ playbook_dir }}/../files

# Examples

```yaml
---
- hosts: localhost
  gather_facts: true
  collections:
    - t_systems_mms.ansible_collection_icinga
  vars:
    icinga_plugins_path: "{{ playbook_dir }}/../files"
  roles:
    - icinga_plugins
```
