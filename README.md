[![Build Status on Travis](https://travis-ci.org/shazChaudhry/docker-jenkins.svg?branch=master "CI build on Travis")](https://travis-ci.org/shazChaudhry/docker-jenkins)
[![Docker Repository on Quay](https://quay.io/repository/shazchaudhry/docker-jenkins/status "Docker Repository on Quay")](https://quay.io/repository/shazchaudhry/docker-jenkins)

This image extends the latest version of [Jenkins Continuous Integration and Delivery server](https://hub.docker.com/r/jenkins/jenkins/). Additionally, it comes with the latest stable version of Docker engine and the following plugins pre-installed:
- [blueocean](https://wiki.jenkins-ci.org/display/JENKINS/Blue+Ocean+Plugin "Blue Ocean")
- [keycloak](https://wiki.jenkins-ci.org/display/JENKINS/keycloak-plugin "Keycloak Authentication")
- [role-strategy](https://plugins.jenkins.io/role-strategy "Role-based Authorization Strategy")

Use the following command to build the image from source:
```
docker image build \
--rm --no-cache \
--tag quay.io/shazchaudhry/docker-jenkins .
```
Use the following commands to run the image: <br/>
`echo "admin" | docker secret create jenkins-user -`
<br/>
`echo "admin" | docker secret create jenkins-pass -`
<br/>
`docker stack deploy -c docker-compose.yml jenkins`

Test
- In your favorite web browser, navigate to `http://node1:8080` and follow the getting started wizard to setup Jenkins
- Create a pipeline using blueocean editor
