# Icinga Collection for Ansible

This Ansible collection contains:

  1. A [role](roles/icinga_agent) to manage the Installation for your Icinga agents

  2. A [role](roles/icinga_plugins) to deploy your custom check scripts to your Icinga agents
  
  3. A [role](roles/icinga_downtime) to manage downtimes in your Icinga

  3. The [collection](https://github.com/telekom-mms/ansible-collection-icinga-director) to deploy your Icinga master via the Icinga Director module

  4. An extra [collection](https://github.com/telekom-mms/ansible-collection-icinga-business-process) to use the [Business Process module](https://github.com/Icinga/icingaweb2-module-businessprocess)

  5. Ansible playbooks to create various objects in Icinga 2 using the director API

## Requirements

- Ansible version: 2.9.10
- Icinga package repository configured
- Note: for Redhat based Distributions you need to have install epel package repository too

## Installation

If you use an older version, you can install it with Ansible Galaxy:
```
ansible-galaxy collection install telekom_mms.ansible_collection_icinga
```

Alternatively put the collection into a `requirements.yml` file:
```
---
collections:
  - telekom_mms.ansible_collection_icinga
```

## Documentation

**icinga_agent role:**

Examples on how to use the role can be found [here](roles/icinga_agent/README.md)

**icinga_plugins role:**

Examples on how to use the role can be found [here](roles/icinga_plugins/README.md)


**icinga_director collection:**

Check out the 'Documentation' part for the modules [here](https://github.com/telekom-mms/ansible-collection-icinga-director#documentation)

**icinga_business_process collection:**

Check out the 'Documentation' part for this collection [here](https://github.com/telekom-mms/ansible-collection-icinga-business-process/blob/master/roles/ansible_icinga_business_process/README.md)

**icinga playbooks:**

| playbook| description | Requirements
|------------|-----------------------------------------------------------------------|-------------
| mms_standard.yml | create a timeperiod and service template to use for other checks | -
| azure_oauth_token.yml | get azure oauth token to use in other checks | [azure_oauth_token.py](https://gist.github.com/rndmh3ro/e9abbca17a4d39597443176f99d585ae) needs to exist in the [PluginDir](https://icinga.com/docs/icinga-2/latest/doc/04-configuration/#constants-conf) on your Icinga Server or Agent
| check_gitlab_scheduler.yml | check gitlab scheduled pipelines | [check_gitlab_scheduler](https://github.com/telekom-mms/check_gitlab_scheduler/) needs to exist in the [PluginDir](https://icinga.com/docs/icinga-2/latest/doc/04-configuration/#constants-conf) on your Icinga Server or Agent
| check_https.yml | check https reachability and certificates | - 
| check_json_azure_restapi_resourcehealth.yml | check state of azure resourcehealth | [check_json.pl](https://github.com/c-kr/check_json) needs to exist in the [PluginDir](https://icinga.com/docs/icinga-2/latest/doc/04-configuration/#constants-conf) on your Icinga Server or Agent
| check_json_azure_restapi.yml | do a json check against azure restapi (with oauth_token) | [check_json.pl](https://github.com/c-kr/check_json) needs to exist in the [PluginDir](https://icinga.com/docs/icinga-2/latest/doc/04-configuration/#constants-conf) on your Icinga Server or Agent
| check_json.yml | do a json check | [check_json.pl](https://github.com/c-kr/check_json) needs to exist in the [PluginDir](https://icinga.com/docs/icinga-2/latest/doc/04-configuration/#constants-conf) on your Icinga Server or Agent
| template_empty_host.yml | create a host template for an empty host | - 

You can use these playbooks in your playbook like this:

```
- name: Import mms standard playbook to create services that other checks depend on
  import-playbook: telekom_mms.ansible_collection_icinga.mms_standard

- name: Import playbook to create azure oauth token check
  import-playbook: telekom_mms.ansible_collection_icinga.check_azure_oauth_token

- name: Import playbook to create gitlab_scheduler check
  import-playbook: telekom_mms.ansible_collection_icinga.check_gitlab_scheduler

- name: Import playbook to create check_https checks
  import-playbook: telekom_mms.ansible_collection_icinga.check_https

```

Or call them from the command line:
```
ansible-playbook telekom_mms.ansible_collection_icinga.mms_standard
ansible-playbook telekom_mms.ansible_collection_icinga.check_azure_oauth_token
ansible-playbook telekom_mms.ansible_collection_icinga.check_gitlab_scheduler
ansible-playbook telekom_mms.ansible_collection_icinga.check_https
ansible-playbook telekom_mms.ansible_collection_icinga.check_json
ansible-playbook telekom_mms.ansible_collection_icinga.check_json_azure_restapi
ansible-playbook telekom_mms.ansible_collection_icinga.check_json_azure_restapi_resourcehealth
ansible-playbook telekom_mms.ansible_collection_icinga.template_empty_host
```

## License

GPLv3

## Author Information

* Christopher Grau
* Daniel Uhlmann
* Contributors from [ansible-collection-icinga-director ](https://github.com/telekom-mms/ansible-collection-icinga-director/graphs/contributors)
* Contributors from [ansible-collection-icinga-business-process](https://github.com/telekom-mms/ansible-collection-icinga-business-process/graphs/contributors)
