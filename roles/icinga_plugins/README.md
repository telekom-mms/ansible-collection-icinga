# Ansible Role - telekom_mms.ansible_collection_icinga.icinga_plugins

This role copies custom checks to the wished icinga-agent node.

## Limitations

The users nagios (Debian) or icinga (Redhat) are not created by this Role you need to create these user by yourself or by the role icinga_agent.

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
| icinga2_plugins_basedir | yes | Debian: /usr/lib/nagios Redhat: /usr/lib64/nagios | base directory for your icinga plugins
| icinga_plugins_path | yes | | path with your plugins for example {{ playbook_dir }}/../files
| icinga_plugins_git_repo_url | no | | directory for icinga plugins
| icinga_plugins_git_repo_dest_path | no | {{ icinga2_plugins_pluginsdir }}/git | base directory for your icinga plugins pulled from git repo
| icinga_plugins_git_repo_version | no | HEAD | what version of the repository to check out

# Examples

```yaml
---
- hosts: localhost
  gather_facts: true
  collections:
    - telekom_mms.ansible_collection_icinga
  vars:
    icinga_plugins_path: "{{ playbook_dir }}/../files"
  roles:
    - icinga_plugins
```

```yaml
---
- hosts: localhost
  gather_facts: true
  collections:
    - telekom_mms.ansible_collection_icinga
  vars:
    icinga_plugins_git_repo_url: https://github.com/example/my-public-plugins.git
  roles:
    - icinga_plugins
```

```yaml
---
- hosts: localhost
  gather_facts: true
  collections:
    - telekom_mms.ansible_collection_icinga
  vars:
    icinga_plugins_git_repo_url: https://<username>:<token>@github.com/example/my-private-plugins.git
  roles:
    - icinga_plugins
```
