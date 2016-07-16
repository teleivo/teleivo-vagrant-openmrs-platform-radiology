<img src="https://cloud.githubusercontent.com/assets/668093/12567089/0ac42774-c372-11e5-97eb-00baf0fccc37.jpg" alt="OpenMRS"/>

# Vagrant OpenMRS Platform Radiology

> Vagrant+Packer+Docker Compose setup for [OpenMRS](http://openmrs.org) Platform 2.0 with the [OpenMRS Radiology Module](https://github.com/openmrs/openmrs-module-radiology)

This repository contains the necessary infrastructure code and related resources
required to run OpenMRS Platform 2.0 using Docker containers that start an instance
of the OpenMRS Platform 2.0 and deploys the OpenMRS Radiology Module.

NOTE: deployment of radiology module is still in progress :) be patient!

For more information about the OpenMRS Platform visit [openmrs.org](http://www.openmrs.org/).

## Prerequisites

Make sure you have [Vagrant](https://docs.docker.com/) and [Packer](https://www.packer.io/) installed.

## Setup

Start by cloning this repository:

```
git clone https://github.com/teleivo/vagrant-openmrs-platform-radiology
```

### Packer
Enter the directory and build a virtual machine image of your choosing

* Virtualbox
* Digital Ocean

using Packer.

```
cd vagrant-openmrs-platform-radiology
packer build -only=digitalocean packer.json
```

NOTE: make sure to export your digital ocean api token as environment variable `DO_API_TOKEN` (see packer.json to double check).

this will create a droplet and run a simple provisioning script, then create a
snapshot out of the image and delete the droplet again. From now on you can use
the image to create droplets.

To see what images are avaiable do

```
vagrant digitalocean-list images <YOUR_API_TOKEN>
```

The image id is what needs to be exported as environment variable `DO_PROVIDER_IMAGE` (see Vagrantfile to double check).

## License

[MPL 2.0 w/ HD](http://openmrs.org/license/) © [OpenMRS Inc.](http://www.openmrs.org/)
