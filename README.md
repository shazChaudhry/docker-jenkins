[![Build Status on Travis](https://travis-ci.org/shazChaudhry/docker-jenkins.svg?branch=master "CI build on Travis")](https://travis-ci.org/shazChaudhry/docker-jenkins)

This image extends the latest version of [Jenkins Continuous Integration and Delivery server](https://hub.docker.com/r/jenkins/jenkins/). Additionally, it comes with the latest stable version of Docker engine and the following plugins are pre-installed:
- [blueocean](https://wiki.jenkins-ci.org/display/JENKINS/Blue+Ocean+Plugin "Blue Ocean")
- [keycloak](https://wiki.jenkins-ci.org/display/JENKINS/keycloak-plugin "Keycloak Authentication")
- [role-strategy](https://plugins.jenkins.io/role-strategy "Role-based Authorization Strategy")


### Create local environment
- Clone this repository: `git clone https://github.com/shazChaudhry/docker-jenkins.git`
- Change directory: `cd docker-jenkins`
- Run provided vagrantfile: `vagrant up`
- ssh to the vagrant box: `vagrant ssh`
- Change to synched folder: `cd /vagrant`

### play-with-docker environment
- Navigate to http://play-with-docker.com/ and create docker swarm environment
- Clone this repository: `git clone https://github.com/shazChaudhry/docker-jenkins.git && cd docker-jenkins`

### Instructions to run Jenkins
1) Execute this step if building the image from source. Otherwise skip to step 2
Use the following command to build the image from source:
```
    docker image build --no-cache \
    --tag shazchaudhry/docker-jenkins:latest \
    --build-arg GIT_COMMIT=$(git log -1 --format=%H) .

    Run this command to confirm git commit:-
    docker image inspect shazchaudhry/docker-jenkins:latest | jq '.[].ContainerConfig.Labels'
```
2) Use the following commands to run the image:
```
    echo "admin" | docker secret create jenkins-user -
    echo "admin" | docker secret create jenkins-pass -
    docker stack deploy --compose-file=docker-compose.yml jenkins
    docker stack services jenkins
```

### Test
- If provided vagrantfile is being used, in your favorite web browser, navigate to [http://node1/jenkins](http://node1/jenkins)
  - username = `admin`
  - password = `admin`

### Visualization
- ```docker stack deploy --compose-file=docker-compose.portainer.yml portainer``` Use Portainer agent setup to deploy inside a Swarm cluster
- Portainer is available at [http://node1:9000](http://node1:9000). Portainer documentation is [here](https://hub.docker.com/r/portainer/portainer/) on github

### Clean up:
- ```vagrant destroy --force``` destroy all VMs that were created above
