# Ansible Role - t_systems_mms.ansible_collection_icinga.ansible_icinga_agent

This role installs and configures the icinga agent
## Variables

| Variable                                   | Required | Default                | Description
|--------------------------------------------|----------|------------------------|------------
| **defaults**
| icinga_agent_package                | yes      | icinga2 | installs icinga2 package
| icinga_agent_registration          | yes       |     false                   | needs to be true if you want to register your icinga agent against your icinga master
| icinga_agent_enable_features | no | api.conf and notification.conf | config files for extra features you can use along with icinga. If you add for example api.conf to the variable the feature will be active in your icinga instance
| icinga_agent_ca_host | yes | | your master intance (f.e: master0-example.de)
| icinga_agent_ca_host_icinga_port | yes | 5665 | Icinga agent port
| icinga_agent_salt | yes | | used to hash password
| icinga_agent_registration | yes | false | used to register your installed icinga agent against your icinga master
| icinga_agent_custom_features_template_path |
| |
