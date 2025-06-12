# OpenHPC 3.x with Slurm running Rocky9 in a container

This is a simple single-user container environment for learning Slurm on OpenHPC 3.x with Rocky9.  If you want a full virtual cluster with provisioning checkout https://github.com/MiddelkoopT/ohpc-jetstream2.

The cluster contains a head node, login node, and 8 compute nodes as separate containers with a shared docker network and shared docker storage.  Shared storage is in /project and /scratch.  The /home directory is not shared.

## Run the cluster

If you want to use podman or another container system with the same syntax as Docker, set the `CONTAINER` environment variable as follows:

```bash
export CONTAINER=podman
```

Build the containers with the following:
```bash
./build.sh
```

Run with the following:
```bash
./run.sh
```

This will create a Docker network and shared storage and start the cluster with 8 nodes and connect to the login node.  Exiting the shell will shutdown the cluster cleanly.

To connect to the cluster as if you were using `ssh` use the following in a new terminal:
```bash
./ssh.sh
```

To login to the head node as root run the following in a separate terminal (everything will be lost when exiting from `./run.sh`):
```bash
USER=root ./ssh.sh
```

When you are done run the following:
```bash
./delete.sh
```

This will remove the container cluster network, storage, and container images.  You may want to prune the container images as well.

## Examples

Copy examples to project folder

If you have rsync installed locally (look at ./rsync.sh for details), run in a new local terminal:
```bash
./rsync.sh -av ./examples head:/project/$USER/
```

If you don't have rsync
```bash
docker cp examples login:/project/$USER/
docker exec -i login chown -R $USER:$USER /project/$USER
```

And run the MPI example
```bash
cd /project/$USER/examples/mpi
bash run.sh
```

Check the results in the `slurm-*.out` file
