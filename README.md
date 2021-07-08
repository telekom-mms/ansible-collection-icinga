# Icinga Collection for Ansible

This Ansible collection contains:

  1. A [role](roles/icinga_agent) to manage the Installation for your Icinga agents

  2. A [role](roles/icinga_plugins) to deploy your custom check scripts to your Icinga agents

  3. The [collection](https://github.com/T-Systems-MMS/ansible-collection-icinga-director) to deploy your Icinga master via the Icinga Director module

  4. An extra [collection](https://github.com/T-Systems-MMS/ansible-collection-icinga-business-process) to use the [Business Process module](https://github.com/Icinga/icingaweb2-module-businessprocess)

## Requirements

- Ansible version: 2.9.10
- Icinga package repository configured
- Note: for Redhat based Distributions you need to have install epel package repository too

## Installation

If you use an older version, you can install it with Ansible Galaxy:
```
ansible-galaxy collection install t_systems_mms.ansible_collection_icinga
```

Alternatively put the collection into a `requirements.yml` file:
```
---
collections:
  - t_systems_mms.ansible_collection_icinga
```

## Documentation

## License

GPLv3

## Author Information

* Christopher Grau
* Daniel Uhlmann
* Contributors from [ansible-collection-icinga-director ](https://github.com/T-Systems-MMS/ansible-collection-icinga-director/graphs/contributors)
* Contributors from [ansible-collection-icinga-business-process](https://github.com/T-Systems-MMS/ansible-collection-icinga-business-process/graphs/contributors)
