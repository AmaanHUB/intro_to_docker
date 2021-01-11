# Introduction To Containerisation And Docker

## What Is Docker?

* Open source (to an extent) platform
* Helps enable one to separate applications from the infrastructure running them
* Used to allow one to deliver software faster
* Written in Go language

### Why Docker?

* Docker is highly used within the industry, especially with the big players such as Netflix etc.

### Containers vs VMs

* Containers share the resources with the host OS as opposed to the VM creates new resources that is segregated from the host system

![](https://www.sdxcentral.com/wp-content/uploads/2019/05/ContainersvsVMs_Image.jpg)

### Demand And Future Of Docker

### Docker API

* Install using the relevant package manager
* Enable the service with:
```
systemctl enable docker.service --now
```

* You may also need to add the user to the `docker` group so that `sudo` is not needed for all the docker commands. This can be done using the following commands (in a Linux environment):
```
# create the docker group
sudo groupadd docker

# add the current user to this group
sudo usermod -aG docker $USER

# activate the changes to the groups (or can log in and out)
newgrp docker
```

* Some simple docker commands:
```
# pull a simple image
docker pull <image_name>

# pull and immediately run the image, will run if already downloaded
docker run <image_name>

# check running containers
docker ps

# check all containers (stopped, exited, running etc)
docker ps -a
```
