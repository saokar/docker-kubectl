FROM alpine:3.3

ENTRYPOINT ["/bin/kubectl"]

RUN set -x                  && \
    apk --update upgrade    && \
    apk add ca-certificates && \
    rm -rf /var/cache/apk/*
    
RUN apt-get install -y curl


CMD ["bash"]

ENV K8S_VERSION 1.2.3

RUN set -x  && \                                                                                               
    curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && \
    chmod +x ./kubectl && \
    sudo mv ./kubectl /usr/local/bin/kubectl && \
    source <(kubectl completion bash)

