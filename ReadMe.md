# OpenHPC 3.x with Slurm running Rocky9 in a container

This is a simple single-user container environment for learning Slurm on OpenHPC 3.x with Rocky9.  If you want a full virtual cluster with provisioning checkout my other project https://github.com/MiddelkoopT/ohpc-jetstream2.

The cluster contains a head node, login node, and 8 compute nodes as separate containers with a shared docker network and shared docker storage.  Shared storage is in /project and /scratch.  The /home directory is not shared.

## Run the cluster

If you want to use podman or another container system with the same syntax as Docker, set the `CONTAINER` environment variable as follows:

```bash
export CONTAINER=podman
```

Run with
```bash
./run.sh
```

This will build the containers, create a Docker network and shared storage and start the cluster with 8 nodes and connect to the login node.  Exiting the shell will shutdown the cluster cleanly.

To connect to the cluster as if you were using `ssh` use 
```bash
./ssh.sh
```

When you are done
```bash
./delete.sh
```

This will remove the container cluster network, storage, and container images.  You may want to prune the container images as well.

## Examples

Copy examples to project folder
```bash
docker cp examples login:/project/$USER/
```
