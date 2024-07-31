FROM openhpc:3
LABEL maintainer="tmiddelkoop@internet2.edu"

## Base compute node
RUN dnf install -y ohpc-base-compute ohpc-slurm-client lmod-ohpc \
    git patch file zstd bzip2 xz \
    python3 python3-pip \
    gcc-c++ gcc-gfortran \
    ohpc-gnu12-runtimes gnu12-compilers-ohpc \ 
    openmpi4-gnu12-ohpc openblas-gnu12-ohpc netcdf-gnu12-openmpi4-ohpc

CMD sudo -u munge /usr/sbin/munged -f && while ! /usr/sbin/slurmd -D -s --conf-server head ; do sleep 2 ; done
