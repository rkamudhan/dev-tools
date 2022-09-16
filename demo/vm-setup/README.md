## Dev-tools

This tool offers a means for deploying a Kubernetes cluster

## Virtual Machines

This project uses [Vagrant tool][1] for provisioning Virtual Machines
automatically. The [setup](setup.sh) bash script contains the
Linux instructions to install dependencies and plugins required for
its usage. This script supports two Virtualization technologies
(Libvirt and VirtualBox).

```
    $ pushd demo/vm-setup
    $ ./setup.sh -p libvirt
```

There is a `default.yml` in the `./config` directory which creates multiple vm.
Once Vagrant is installed, it's possible to provision a vm using
the following instructions:

```
    $ vagrant up
    $ popd
```
In-depth documentation and use cases of various Vagrant commands [Vagrant commands][2]
is available on the Vagrant site.

## License

Apache-2.0

[1]: https://www.vagrantup.com/
[2]: https://www.vagrantup.com/docs/cli/
