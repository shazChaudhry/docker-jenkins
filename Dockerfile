FROM jenkinsci/jenkins

# Configure Jenkins
COPY config/*.xml $JENKINS_HOME/
COPY config/executors.groovy /usr/share/jenkins/ref/init.groovy.d/executors.groovy

# Install plugins
RUN /usr/local/bin/install-plugins.sh \
    purge-job-history \
    global-build-stats \
    keycloak \
    blueocean

USER root

# Install Docker from official repo
RUN apt-get update -qq && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get install -qqy apt-transport-https ca-certificates && \
    apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 \
        --recv-keys 58118E89F3A912897C070ADBF76221572C52609D && \
    echo deb https://apt.dockerproject.org/repo debian-jessie main > /etc/apt/sources.list.d/docker.list && \
    apt-get update -qq && \
    apt-get install -qqy docker-engine && \
    usermod -aG docker jenkins && \
    chown -R jenkins:jenkins $JENKINS_HOME/

USER jenkins

VOLUME [$JENKINS_HOME, "/var/run/docker.sock"]
