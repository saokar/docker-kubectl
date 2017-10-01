FROM alpine:3.3

ENTRYPOINT ["/bin/kubectl"]

RUN set -x                  && \
    apk --update upgrade    && \
    apk add ca-certificates && \
    apk add --update curl && \
    rm -rf /var/cache/apk/*
    
CMD ["bash"]

ENV K8S_VERSION 1.2.3

RUN set -x  && \                                                                                               
    curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && \
    chmod +x ./kubectl && \
    mv ./kubectl /bin/kubectl

RUN set -x  && \  
    wget https://coreupdate.central.arubanetworks.com/packages/acp-cluster-monitoring-ae.3.0.2-24.tar && \
    tar -xvf acp-cluster-monitoring-ae.3.0.2-24.tar && \
    kubectl create -f alertmanager-rc.yaml --namespace acp-system
