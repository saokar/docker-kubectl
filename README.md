# About

This is a minimal image containing (effectively) just [kubectl](http://kubernetes.io/docs/user-guide/kubectl-overview/) designed to be used as `kubectl`.

# Usage

Since `ENTRYPOINT` is set to `kubectl` you just need to run the container, however since `kubectl` works over the network the easiest thing to do is just run the container on your machine's network (as if the binary were installed locally):

    docker run --net=host returnpath/kubectl

Because of this it's recommended that you simply crete an alias to the above:

    alias kubectl='docker run --net=host returnpath/kubectl'

This allows you to use `kubectl` as if it were installed locally, so to list running pods it's simply:

    kubectl get pods

The commands above will use the latest version of `kubectl` that's been pushed up, but you can specify which version by tage. To run `kubectl` version `1.2.3` it's:

    docker run --net=host returnpath/kubectl:1.2.3

The image tags are created from the github tags.
