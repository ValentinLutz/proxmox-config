FROM jenkins/inbound-agent:jdk11

USER root
RUN apt-get update && \
    apt-get install -y \
    make && \
    rm -rf /var/lib/apt/lists/*
USER ${user}

ENTRYPOINT ["/usr/local/bin/jenkins-agent"]