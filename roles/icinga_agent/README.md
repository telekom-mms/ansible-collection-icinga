# Ansible Role - t_systems_mms.ansible_collection_icinga.icinga_agent

This role installs and configures the icinga agent.
## Variables

| Variable                                   | Required | Default                | Description
|--------------------------------------------|----------|------------------------|------------
| icinga_agent_package | yes | icinga2 | installs icinga2 package
| icinga_agent_registration | yes | false | used to register your installed icinga agent against your icinga master
| icinga_agent_enable_features | no | | config files for extra features you can use along with icinga. If you add for example api.conf to the variable the feature will be active in your icinga instance
| icinga_agent_ca_host | no | | your master intance (f.e: master0-example.de)
| icinga_agent_ca_host_icinga_port | no | 5665 | Icinga agent port
| icinga_agent_salt | no | | used to hash password
| icinga_agent_custom_features_template_path | no | | define custom feature file (f.e. {{ playbook_dir }}/icinga_custom_templates/*)
| icinga_agent_constants_conf | yes | const PluginDir = "/usr/lib64/nagios/plugins"<br> const PluginContribDir = "/usr/lib64/nagios/plugins"<br> const ManubulonPluginDir = "/usr/lib64/nagios/plugins"<br> const ZoneName = "{{ ansible_hostname }}"<br> const NodeName = "{{ ansible_hostname }}"<br> const TicketSalt = "" | define content for config file constants.conf |
| icinga_agent_api_conf | yes | accept_config = true<br>accept_commands = true | define content for feature file api.conf |
| icinga_agent_endpoints | yes | | define icinga agent endpoint in zones.conf
| icinga_agent_zones | yes | | define zones in zones.conf


# Examples
## defintion endpoints and zones

related links:
* [Icinga 2 zones.conf](https://icinga.com/docs/icinga-2/latest/doc/04-configuration/#zonesconf)

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
      endpoints:
        - "icinga2-master1.localdomain"
  - zone:
      name: "satellite"
      endpoints:
        - "icinga2-satellite1.localdomain"
      parent: "master"
```

## defintion icinga2 agent features

related links:
* [Icinga 2 Features](https://icinga.com/docs/icinga-2/latest/doc/14-features/)

standard features available with agent installation

```bash
ls -l /etc/icinga2/features-available/
total 68
-rw-r-----. 1 icinga icinga 183 May 27 12:45 api.conf
-rw-r-----. 1 icinga icinga 112 May 27 12:45 checker.conf
-rw-r-----. 1 icinga icinga 140 May 27 12:45 command.conf
-rw-r-----. 1 icinga icinga 159 May 27 12:45 compatlog.conf
-rw-r-----. 1 icinga icinga 235 May 27 12:45 debuglog.conf
-rw-r-----. 1 icinga icinga 193 May 27 12:45 elasticsearch.conf
-rw-r-----. 1 icinga icinga 206 May 27 12:45 gelf.conf
-rw-r-----. 1 icinga icinga 190 May 27 12:45 graphite.conf
-rw-r-----. 1 icinga icinga  91 May 27 12:45 icingadb.conf
-rw-r-----. 1 icinga icinga 560 May 27 12:45 influxdb.conf
-rw-r-----. 1 icinga icinga 127 May 27 12:45 livestatus.conf
-rw-r-----. 1 icinga icinga 159 May 27 12:45 mainlog.conf
-rw-r-----. 1 icinga icinga 129 May 27 12:45 notification.conf
-rw-r-----. 1 icinga icinga 564 May 27 12:45 opentsdb.conf
-rw-r-----. 1 icinga icinga 146 May 27 12:45 perfdata.conf
-rw-r-----. 1 icinga icinga 225 May 27 12:45 statusdata.conf
-rw-r-----. 1 icinga icinga 127 May 27 12:45 syslog.conf
```

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
  gather_facts: true
  collections:
    - t_systems_mms.ansible_collection_icinga
  vars:
    icinga_agent_endpoints:
      - name: "icinga2-master1.localdomain"
        host: "192.154.44.101"
      - name: "icinga2-satellite1.localdomain"
        host: "192.154.44.107"
    icinga_agent_zones:
      - name: "master"
        endpoints:
          - "icinga2-master1.localdomain"
      - name: "satellite"
        endpoints:
          - "icinga2-satellite1.localdomain"
        parent: "master"
  roles:
    - icinga_agent

```
## playbook with agent registration
```yaml
---
- hosts: localhost
  gather_facts: true
  collections:
    - t_systems_mms.ansible_collection_icinga
  vars:
    icinga_agent_registration: true
    icinga_agent_endpoints:
      - name: "icinga2-master1.localdomain"
        host: "192.154.44.101"
      - name: "icinga2-satellite1.localdomain"
        host: "192.154.44.107"
    icinga_agent_zones:
      - name: "master"
        endpoints:
          - "icinga2-master1.localdomain"
      - name: "satellite"
        endpoints:
          - "icinga2-satellite1.localdomain"
        parent: "master"
    icinga_agent_ca_host: "icinga2-master1.localdomain"
    icinga_agent_salt: "thisisasalt"
    icinga_agent_enable_features:
      - api.conf
      - notification.conf
  roles:
    - icinga_agent

```
