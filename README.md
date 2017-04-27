This image extends the latest version of jenkinsci/jenkins. Additionally, it comes with the latest version of Docker engine and the following plugins pre-installed:
- [keycloak](https://wiki.jenkins-ci.org/display/JENKINS/keycloak-plugin)
- [blueocean](https://wiki.jenkins-ci.org/display/JENKINS/Blue+Ocean+Plugin)
- [global-build-stats](https://wiki.jenkins-ci.org/display/JENKINS/Global+Build+Stats+Plugin)
- [purge-job-history](https://wiki.jenkins-ci.org/display/JENKINS/Purge+Job+History+Plugin)

Use the following command to build the image:
```
docker build \
--rm --no-cache \
--tag shazchaudhry/docker-jenkins .
```

Use the following command to run this image:
```
docker run -d --rm \
--name jenkins \
-p 8080:8080 \
-v jenkins_home:/var/jenkins_home \
-v /var/run/docker.sock:/var/run/docker.sock \
shazchaudhry/docker-jenkins
```
