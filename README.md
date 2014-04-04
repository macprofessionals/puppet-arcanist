# arcanist

## What is it?

A [Puppet][1] module to install and manage [Arcanist][6], which is a
command-line interface to [Phabricator][2].

## How do I use it...

### ...to provision a machine with Puppet?

Include this in your manifest:

    class { 'arcanist': }

This module will download and install the [latest Arcanist from GitHub][3], as
well as all dependencies.

### ...to make a development VM?

Install [Vagrant][5]. Then,

    vagrant up

Now you have a VM with all the modules installed. Maybe you will do something like

    vagrant ssh    # ssh into the VM
    puppet apply -e 'include arcanist'

to run the manifests.

### ...to run the tests?

    rake spec

This will make a VM with Vagrant, run the manifests in it, then assert that
they worked. It also leaves the VM running, so this can be a good way to
bootstrap a development environment. If you want to be sure to run the tests on
a clean VM, and you want to destroy the VM afterwards, then do

    rake spec:clean

## Supported platforms

  Tested just on Ubuntu 13.10 (Saucy Salamander). Probably works accidentally
  on similarly flavored OSs. Someday, multi-platform support will be more
  robust.

## Patches, bug reports, etc.

Please [submit through GitHub][4].


  [1]: http://puppetlabs.com/
  [2]: http://phabricator.org/
  [3]: https://github.com/facebook/arcanist
  [4]: https://github.com/macprofessionals/puppet-arcanist
  [5]: http://www.vagrantup.com/
  [6]: https://secure.phabricator.com/book/phabricator/article/arcanist/
