[![Build Status on Travis](https://travis-ci.org/shazChaudhry/docker-jenkins.svg?branch=master "CI build on Travis")](https://travis-ci.org/shazChaudhry/docker-jenkins)
[![Docker Repository on Quay](https://quay.io/repository/shazchaudhry/docker-jenkins/status "Docker Repository on Quay")](https://quay.io/repository/shazchaudhry/docker-jenkins)

This image extends the latest version of [Jenkins Continuous Integration and Delivery server](https://hub.docker.com/r/jenkinsci/jenkins/). Additionally, it comes with the latest version of Docker engine and the following plugins pre-installed:
- [blueocean](https://wiki.jenkins-ci.org/display/JENKINS/Blue+Ocean+Plugin "Blue Ocean")
- [global-build-stats](https://wiki.jenkins-ci.org/display/JENKINS/Global+Build+Stats+Plugin "Global build stats")
- [junit](https://wiki.jenkins-ci.org/display/JENKINS/JUnit+Plugin "JUnit")
- [keycloak](https://wiki.jenkins-ci.org/display/JENKINS/keycloak-plugin "Keycloak Authentication")
- [purge-job-history](https://wiki.jenkins-ci.org/display/JENKINS/Purge+Job+History+Plugin "Purge Job History")
- [role-strategy](https://plugins.jenkins.io/role-strategy "Role-based Authorization Strategy")

Use the following command to build the image from source:
```
docker build \
--rm --no-cache \
--tag quay.io/shazchaudhry/docker-jenkins .
```

Use the following command to run this image from docker hub:
```
docker run -d --rm \
--name jenkins \
-p 8080:8080 \
-v jenkins_home:/var/jenkins_home \
-v /var/run/docker.sock:/var/run/docker.sock \
quay.io/shazchaudhry/docker-jenkins
```

Test
- In your favorite web browser, navigate to `http://<IP_ADDRESS>:8080` and follow the getting started wizard to setup Jenkins
