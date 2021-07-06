# Ansible Role - t_systems_mms.ansible_collection_icinga.ansible_icinga_agent

This role installs and configures the icinga agent
## Variables

| Variable                                   | Required | Default                | Description
|--------------------------------------------|----------|------------------------|------------
| **defaults**
| icinga_agent_package | yes | icinga2 | installs icinga2 package
| icinga_agent_registration | yes | false | used to register your installed icinga agent against your icinga master
| icinga_agent_enable_features | no | | config files for extra features you can use along with icinga. If you add for example api.conf to the variable the feature will be active in your icinga instance
| icinga_agent_ca_host | yes | | your master intance (f.e: master0-example.de)
| icinga_agent_ca_host_icinga_port | yes | 5665 | Icinga agent port
| icinga_agent_salt | yes | | used to hash password
| icinga_agent_custom_features_template_path | | | define custom feature file (f.e. {{ playbook_dir }}/icinga_custom_templates/*)
| icinga_agent_constants_conf | yes | const PluginDir = "/usr/lib64/nagios/plugins"<br> const PluginContribDir = "/usr/lib64/nagios/plugins"<br> const ManubulonPluginDir = "/usr/lib64/nagios/plugins"<br> const ZoneName = "{{ ansible_hostname }}"<br> const NodeName = "{{ ansible_hostname }}"<br> const TicketSalt = "" | define content for config file constants.conf |
| icinga_agent_api_conf | yes | accept_config = true<br>accept_commands = true | define content for feature file api.conf |
| icinga_agent_endpoints | yes | | define icinga agent endpoint in zones.conf
| icinga_agent_zones | yes | | define zones in zones.conf


# Examples
## defintion endpoints and zones
```yaml
---

icinga_agent_endpoints:
  - endpoint:
      name: "icinga2-master1.localdomain"
      host: "192.154.44.101"
  - endpoint:
      name: "icinga2-satellite1.localdomain"
      host: "192.154.44.107"

icinga_agent_zones:
  - zone:
      name: "master"
      endpoints: "icinga2-master1.localdomain"
  - zone:
      name: "satellite"
      endpoints: "icinga2-satellite1.localdomain"
      parent: "master"
```

## defintion icinga2 agent features
```yaml
---
icinga_agent_enable_features:
  - api.conf
  - notification.conf

```

## playbook without agent registration
```yaml
---
- hosts: localhost
  collections:
    t_systems_mms.icinga_agent
  vars:
    icinga_agent_endpoints:
      - endpoint:
          name: "icinga2-master1.localdomain"
          host: "192.154.44.101"
      - endpoint:
          name: "icinga2-satellite1.localdomain"
          host: "192.154.44.107"
    icinga_agent_zones:
      - zone:
          name: "master"
          endpoints: "icinga2-master1.localdomain"
      - zone:
          name: "satellite"
          endpoints: "icinga2-satellite1.localdomain"
          parent: "master"
    icinga_agent_enable_features:
      - api.conf
      - notification.conf
  roles:
    - icinga_agent

```
