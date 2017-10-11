FROM alpine:3.3

ENTRYPOINT ["/bin/kubectl"]

RUN set -x                  && \
    apk --update upgrade    && \
    apk add ca-certificates wget && \
    update-ca-certificates && \
    apk add --update curl && \
    rm -rf /var/cache/apk/*
    
CMD ["bash"]

ENV K8S_VERSION 1.2.3

RUN set -x  && \                                                                                               
    curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && \
    chmod +x ./kubectl && \
    mv ./kubectl /bin/kubectl


    

