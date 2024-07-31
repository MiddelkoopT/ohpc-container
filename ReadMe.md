# OpenHPC 3.x with Slurm running Rocky9 on Docker

This is a simple single-user container environment for learning Slurm on OpenHPC 3.x with Rocky9.

The cluster contains a head node, login node, and 8 compute nodes as separate containers with a shared docker network and shared docker storage.  Shared storage is in /data.

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

This will remove the Docker cluster network, storage, and container images.  Run `docker image prune` to reclaim space.
