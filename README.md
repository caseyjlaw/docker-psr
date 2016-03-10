# docker-psr
Building a docker image for standard pulsar analysis software. 
Currently limited to building an image based on binaries from an existing successful build.
Intent is to properly build from source to allow triggered docker builds from github repo changes.

# Goal
Like most applied software, pulsar software is heterogeneous and challenging to build.
Docker can ease the introduction of new users and allow new use cases, like cloud computing.

# Includes
- tempo
- tempo2
- dspsr
- presto
- psrchive
- and all their dependencies (pgplot5, fftw, etc)

# Using
    docker run -it caseyjlaw/docker-psr

This will drop you in to an ubuntu os with bash shell. 
Most pulsar software is located in /usr/local/pulsar64 and environment variables as typical.

# Issues
Report problems to caseyjlaw@gmail.com. 
