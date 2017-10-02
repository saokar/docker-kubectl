# About

This is a minimal image containing (effectively) just [kubectl](http://kubernetes.io/docs/user-guide/kubectl-overview/) 

# Usage

Since `ENTRYPOINT` is set to `kubectl` you just need to run the container as if it's the `kubectl` executable:

    docker run returnpath/kubectl

However you haven't specified `--server` so it'll default to `localhost:8080`: If kubernetes is running on `localhost:8080` just call docker with `--net=host`:

    docker run --rm --net=host returnpath/kubectl

If kubernetes isn't on `localhost:8080` you can use `--server` like normal, or, if you have `~/.kube/config` volume mount that into the container:

    docker run --rm -v ~/.kube:/root/.kube returnpath/kubectl

If you're going to be using this regularly you should create a shell alias so all the docker configuration is obfuscated and you can really think of the container just like you would the local executable:

    alias kubectl='docker run --rm -v ~/.kube:/root/.kube returnpath/kubectl'

This allows you to use `kubectl` as if it were installed locally, so to list running pods it's simply:

    kubectl get pods

Note the `--rm` in the above commands: This removes the container after the command exits and prevents old containers from collecting each time you run `kubectl`.

The commands above will use the latest version of `kubectl` that's been pushed up, but you can specify which version by tage. To run `kubectl` version `1.2.3` it's:

    docker run --rm returnpath/kubectl:1.2.3

The image tags are created from the github tags.
