FROM jenkins/inbound-agent:jdk17-preview

USER root
RUN apt-get update && \
    apt-get install -y make docker.io curl && \
    rm -rf /var/lib/apt/lists/* \
RUN apt-get update && \
    apt-get install -y curl && \
    curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.23.1/bin/linux/amd64/kubectl && \
    chmod +x ./kubectl && \
    mv ./kubectl /usr/local/bin/kubectl && \
    apt-get remove -y curl && \
    rm -rf /var/lib/apt/lists/* \

USER jenkins
ENTRYPOINT ["/usr/local/bin/jenkins-agent"]