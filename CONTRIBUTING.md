# Contributing

Thanks for your interest in contributing! Please read carefully through our guidelines below to ensure that your contribution adheres to our project's standards.

## Issue Tracking

We use [GitHub Issues](https://github.com/T-Systems-MMS/ansible-collection-icinga/issues) to track all tasks related to this project.

## Contribute your changes

There are three steps to set up a working environment:

1. [Fork the repository](#fork-the-repository)
2. [Clone your fork](#clone-your-fork)
3. [Add your changes](#add-your-changes)


### Fork the repository

A *fork* is a copy of a repository. Forking a repository lets you to make changes to your copy without affecting any of the original code.

Click **Fork** (in the top-right corner of the page) to copy this repository to your GitHub account.

### Clone your fork

A *clone* is a downloaded version of a repository. Cloning our fork lets you download a copy of the repository to your computer.

Use `git` to clone your fork

```
$ git clone https://github.com/T-Systems-MMS/ansible-collection-icinga.git
```

### Add your changes

If you followed the steps from above, you now have the repo on your computer. Now go into the repository folder and add your changes.

For example, if you are working in the `~/dev` directory:

```
cd ~/dev

vim /file/you/want/to/change

save your changes
```

You can find more information in the [developer guide for collections](https://docs.ansible.com/ansible/devel/dev_guide/developing_collections.html#contributing-to-collections), and in the [Ansible Community Guide](https://docs.ansible.com/ansible/latest/community/index.html).


## Submit a Pull Request

Remember how making changes on a *fork* doesn't affect the original code? Well, in order to fix an issue in the main project, you *want* to change the original code. A *pull request* is a GitHub feature that lets you do just that!

There are three steps to submitting a pull request:
1. [Save your changes locally](#save-your-changes-locally)
2. [Send your changes to your fork](#send-your-changes-to-your-fork)
3. [Open a Pull Request](#open-a-pull-request)

### Save your changes locally

First, get a list of all the files you have changed.
```
$ git status
```

Next, *stage* the file you want to save. This will add the file to a new list that is ready to be saved.
```
$ git add /files/you/changed
```

Save your staged files.
```
$ git commit -m "improved feature X for ansible-icinga-collection"
```

### Send your changes to your fork

Use the `git push` command to add your local made changes to your remote fork

```
$ git push origin master
```

### Open a Pull Request



## License
By contributing, you agree that your contributions will be licensed under its GPLv3 license.
