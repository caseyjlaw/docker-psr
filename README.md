# docker-psr (a.k.a. "pulsar-stack")
Builds a docker image for a standard set of pulsar analysis packages. Currently, this is mostly taken from an existing set of binaries built on ubuntu and bundled into a tar file. At the end, presto is rebuilt to include some recent modifcations. Ultimately, we'd like to properly build from source for all packages and trigger docker builds from github pushes.

# Goal
Like most applied software, pulsar software is heterogeneous and challenging to build. Docker can ease the introduction of new users and allow new use cases, like cloud computing.

# Includes
- tempo
- tempo2
- psrchive
- dspsr
- presto
- and all their dependencies (pgplot5, fftw, etc)

You'll find most pulsar software in /usr/local/pulsar64 and environment variables as typical.

# Using
To build:
    docker build -t caseyjlaw/pulsar-stack .

To run image available in docker hub:
    docker run -it caseyjlaw/pulsar-stack bash

You can mount your data directory into the docker container with the -v flag, so:
    docker run -it -v /data:/data caseyjlaw/pulsar-stack bash

This will drop you in to an ubuntu os with bash shell with all data in /data. 

New users may also find "docker do" useful to run pulsar tools without interactively running bash in a container. See https://github.com/deepgram/sidomo for more info.

# Issues
Report problems to caseyjlaw@gmail.com. 
