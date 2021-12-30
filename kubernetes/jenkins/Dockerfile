FROM jenkins/inbound-agent:jdk17-preview

USER root
RUN apt-get update && \
    apt-get install -y \
    make \
    docker.io && \
    rm -rf /var/lib/apt/lists/*
USER jenkins

ENTRYPOINT ["/usr/local/bin/jenkins-agent"]