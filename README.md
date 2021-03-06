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

### Docker Commands And API

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
# pull an image
docker pull <image_name>

# see images that are available on host
docker images

# pull and immediately run the image, will run if already downloaded
docker run <image_name>

# run an image and name the container something (not the randomised name)
docker run <image_name> -n chicken

# rename a container
docker rename container_name new_container_name

# with -p, it is localhost_port:docker_container_port
# the -d signifies that it is running in detached mode .i.e. we get the terminal given back to us
docker run -d -p 81:80 <image_name>

# build an image from a Dockerfile
docker build -t <image_name>

# create a new image from a container's image
docker commit <image_name>/container_id

# start a container
docker start container_id

# stop a container
docker stop container_id/name

# remove a container
docker rm container_id/name

# check running containers
docker ps

# check all containers (stopped, exited,picture running etc)
docker ps -a

# logging into a running container with bash
docker exec -it container_name bash

# logging into a running container with bash AS ROOT
docker exec -u 0 -it container_name bash
```

* One can also make the docker documentation available on our local host (in entirety):
```
docker run -d -p 4000:4000 docs/docker.github.into
```
* Simple copying something to a docker container:
```
docker cp /path/to/file/on/host container_name:/path/in/container
```
* How docker communicates can be explained simply in this image below:
![](https://docs.docker.com/engine/images/architecture.svg)

* Logging and history:
```
# check docker container logs
docker logs <container_id>

# check commit history of image
docker history <image_id>
```

## DockerHub

* Before committing or pushing to DockerHub, you need to login within the terminal with:
```
docker login
# add details

# if the above does not work, do
docker logout
docker login
```

* Commiting a docker container to an image:
```
docker commit container_id docker_user_id/repo_name
```

* Pushing to a DockerHub repo:
	* The tag name can be anything, but without the tagname, defaults to the `latest`
```
docker push user_id/repo_name:tagname
```

* Removing the local image to ensure when we pull from dockerhub, it is the most recent:
```
# may need -f at the end
docker rmi <image_name>
```

* Pulling from DockerHub repo:
	* Then run as normal
```
# tagname is optional, defaults to latest
docker pull user_id/repo_name:tagname
```

### Volumes In Docker

* Can be used for persistent data and sharing across containers
* Usually chosen at creation of container .e.g.
```
docker run --name=<name> -d -v path_of_host:/something/in/container -p <port>:<port> <image>
```

## Building An Image With Dockerfile (Automation)

* One needs to create a `Dockerfile`:
	* Automates the tasks that one would normally do within the container .e.g.
		- `apt update -y`
		- Install vim
		- etc
	* Wraps up all the dependencies and instructs the execution of some commands

### Syntax And Keywords In A Dockerfile

* `FROM` is used to tell docker which base image to use to build our image .e.g. nginx
* `LABEL MAINTAINER=<creator_email>`
* `COPY` used to copy files/directories from host to container
* `EXPOSE` to tell which ports to use (same as `-p 81:80` in `docker run`)
* `CMD`, execute commands within the container .e.g.
	- ["nginx", "-g", "daemon off;"]
	- **N.B. `;` is needed at the end of the command within the `"`**

* Running the Dockerfile:
```
# . refers to Dockerfile in directory
docker build -t <chosen_name_of_image> .
```

## Dev Environment
```
# from the nodejs one
FROM node:current-alpine3.10

# maintainer
LABEL maintainer=ahashmi-ubhi@spartaglobal.com

# copy the app folder from the localhost to the container
COPY ./app /

# set the work directory, need to double check this bit and see if there is a fix
WORKDIR /app/


# expose port 3000, since the app uses this
EXPOSE 3000

# run the commands that will set up the app

# update the package cache
CMD ["apk", "update", "-y;"]

# install npm for installing dependencies
# CMD ["apk", "add", "npm;"]

# install the app, have to specify the directory for some reason
CMD ["npm", "install", "/app/;"]

# run the app, have to specify the directory for some reason
CMD ["npm", "start", "/app/;"]
```

## Multi-Stage Environment

```
# from the nodejs one, can refer to it as app
FROM node:current-alpine3.10 as APP

# maintainer
LABEL maintainer=ahashmi-ubhi@spartaglobal.com

# copy the app folder from the localhost to the container
COPY ./app /

# set the work directory, need to double check this bit and see if there is a fix
WORKDIR /app/

# run the commands that will set up the app

# update the package cache
CMD ["apk", "update", "-y;"]

# install npm for installing dependencies
# CMD ["apk", "add", "npm;"]

# install the app, have to specify the directory for some reason
CMD ["npm", "install", "/app/;"]


# creating a multi-stage layer, in theory would create a smaller image, but since mine is already small it is fine, the first stage is for testing, this stage is for compressing
FROM node:current-alpine-3.10

COPY --from=app /app /app

WORKDIR /app/

# expose port 3000, since the app uses this
EXPOSE 3000

# run the app, have to specify the directory for some reason
CMD ["npm", "start", "/app/;"]
```
# Microservices

* What?
	* Split application into a set of a smaller, inter-connected services
* Why?
	* Highly maintainable
	* Loosely coupled
	* Independently deployable
	* Organised around business capabilities
	* Owned by small teams
* When and when not to use?
	* Lot of resources needed to manage and maintain it, so small projects likely do not need it
		* Should use Monolithic architecture (everything is in a stack, see picture below)

![](https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Francher.com%2Fimg%2Fblog%2F2019%2Fmicroservices-vs-monolithic-architectures%2Fmicroservices-and-monolithic-architectures.jpg&f=1&nofb=1)
:chicken:
