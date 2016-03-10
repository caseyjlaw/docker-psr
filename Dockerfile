FROM ubuntu:14.04.4
MAINTAINER caseyjlaw@gmail.com

WORKDIR /home

RUN echo 'deb http://us.archive.ubuntu.com/ubuntu trusty main multiverse' >> /etc/apt/sources.list
RUN apt-get update -y && apt-get install -y emacs libcfitsio3 libcfitsio3-dev pgplot5 wget libgsl0-dev \
    python python-pip python-numpy python-scipy

RUN cd /usr/local && wget https://storage.googleapis.com/student_tools/pulsar64.tar.gz && tar xvfz pulsar64.tar.gz
RUN ln -s /usr/lib/x86_64-linux-gnu/libcfitsio.so /usr/lib/x86_64-linux-gnu/libcfitsio.so.0

ENV PSR64 /usr/local/pulsar64
ENV PYTHONBASE /usr/lib/local
ENV PYTHONVER 2.7
ENV PGPLOT_DIR /usr/lib64/pgplot
ENV PRESTO $PSR64/src/presto
ENV TEMPO $PSR64/src/tempo
ENV TEMPO2 $PSR64/share/tempo2
ENV PATH $PSR64/bin:$PRESTO/bin:$PYTHONBASE/bin:$PATH
ENV PYTHONPATH $PSR64/lib/python$PYTHONVER/site-packages:$PRESTO/lib/python:$PYTHONBASE/lib/python$PYTHONVER:$PYTHONBASE/lib/python$PYTHONVER/site-packages
ENV LD_LIBRARY_PATH $PSR64/lib:$PRESTO/lib:$TEMPO2/lib:$PYTHONBASE/lib
ENV LIBRARY_PATH $PSR64/lib:$PRESTO/lib:$TEMPO2/lib:$PYTHONBASE/lib
ENV CPATH /usr/local/include

ENTRYPOINT /bin/bash