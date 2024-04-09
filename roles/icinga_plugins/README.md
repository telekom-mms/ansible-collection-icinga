# Ansible Role - telekom_mms.ansible_collection_icinga.icinga_plugins

This role copies custom checks to the wished icinga-agent node.

## Limitations

The users nagios (Debian) or icinga (Redhat) are not created by this Role you need to create these user by yourself or by the role icinga_agent.

Unfortunately, we are currently unable to remove the exclude for the nagion-plugins installation under RHEL8 (or higher)

```yaml
- name: Install icinga and nagios plugins except for the mysql-plugins on el8
  ansible.builtin.yum:
    name: "{{ item }}"
    exclude:
      - nagios-plugins-all
      - nagios-plugins-mysql
      - nagios-plugins-2.3.3-3.el8.x86_64
```
for various reasons:

- `nagios-plugins-all` needs the package `nagios-plugins-ssl_validity` as a dependency which is currently unavailable:

  ```bash
  Error:
  Problem: package nagios-plugins-all-2.3.3-6.el8.x86_64 from epel requires nagios-plugins-ssl_validity, but none of the providers can be installed
  - conflicting requests
  - nothing provides perl(LWP::Simple) needed by nagios-plugins-ssl_validity-2.3.3-6.el8.x86_64 from epel
  - nothing provides perl(Date::Parse) needed by nagios-plugins-ssl_validity-2.3.3-6.el8.x86_64 from epel
  - nothing provides perl(Date::Format) needed by nagios-plugins-ssl_validity-2.3.3-6.el8.x86_64 from epel
  - nothing provides perl(Text::Glob) needed by nagios-plugins-ssl_validity-2.3.3-6.el8.x86_64 from epel
  ```
- `nagios-plugins-mysql` needs the MariaDB repository to be present which is not in scope for this Ansible role

You can however add a `pre-task` to your ansible-playbook which should configure the MariaDB repository. For example:

```yaml
  pre_tasks:
    - name: Install MariaDB repository
      ansible.builtin.yum_repository:
        name: MariaDB
        description: MariaDB
        baseurl: https://mirror.mariadb.org/yum/11.4.1/rhel8-amd64/
        gpgkey: https://mirror.mariadb.org/yum/RPM-GPG-KEY-MariaDB
        gpgcheck: true
        enabled: true

    - name: Install nagios-plugins-mysql
      ansible.builtin.package:
        name: nagios-plugins-mysql
        state: present
```

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
