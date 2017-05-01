This image extends the latest version of [Jenkins Continuous Integration and Delivery server](https://hub.docker.com/r/jenkinsci/jenkins/). Additionally, it comes with the latest version of Docker engine and the following plugins pre-installed:
- [blueocean](https://wiki.jenkins-ci.org/display/JENKINS/Blue+Ocean+Plugin)
- [global-build-stats](https://wiki.jenkins-ci.org/display/JENKINS/Global+Build+Stats+Plugin)
- [junit](https://wiki.jenkins-ci.org/display/JENKINS/JUnit+Plugin)
- [keycloak](https://wiki.jenkins-ci.org/display/JENKINS/keycloak-plugin)
- [purge-job-history](https://wiki.jenkins-ci.org/display/JENKINS/Purge+Job+History+Plugin)

Use the following command to build the image from source:
```
docker build \
--rm --no-cache \
--tag shazchaudhry/docker-jenkins .
```

Use the following command to run this image from docker hub:
```
docker run -d --rm \
--name jenkins \
-p 8080:8080 \
-v jenkins_home:/var/jenkins_home \
-v /var/run/docker.sock:/var/run/docker.sock \
shazchaudhry/docker-jenkins
```

Test
- In your favorite web browser, navigate to `http://<IP_ADDRESS>:8080` and follow the getting started wizard to setup Jenkins
