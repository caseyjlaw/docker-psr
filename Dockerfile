FROM ubuntu:14.04.4
MAINTAINER caseyjlaw@gmail.com

WORKDIR /home

RUN echo 'deb http://us.archive.ubuntu.com/ubuntu trusty main multiverse' >> /etc/apt/sources.list
RUN apt-get update -y && apt-get install -y emacs libcfitsio3 libcfitsio3-dev pgplot5 wget libgsl0-dev \
    python python-pip python-numpy python-scipy python-matplotlib ipython x11-apps

RUN cd /usr/local && wget https://storage.googleapis.com/student_tools/pulsar64.tar.gz && tar xvfz pulsar64.tar.gz
RUN cd / && wget https://storage.googleapis.com/student_tools/sigproc.tar.gz && tar xvfz sigproc.tar.gz
RUN ln -s /usr/lib/x86_64-linux-gnu/libcfitsio.so /usr/lib/x86_64-linux-gnu/libcfitsio.so.0
RUN wget http://www.atnf.csiro.au/people/pulsar/psrcat/downloads/psrcat_pkg.tar.gz && tar xvfz psrcat_pkg.tar.gz && cd psrcat_tar && bash makeit 
RUN cp /home/psrcat_tar/psrcat /usr/local/pulsar64/bin/psrcat && cp /home/psrcat_tar/psrcat.db /usr/local/pulsar64/include/psrcat.db

ENV PSR64 /usr/local/pulsar64
ENV PYTHONBASE /usr/lib/local
ENV PYTHONVER 2.7
ENV PGPLOT_DIR /usr/lib64/pgplot
ENV PRESTO $PSR64/src/presto
ENV TEMPO $PSR64/src/tempo
ENV TEMPO2 $PSR64/share/tempo2
ENV PATH $PSR64/bin:$PRESTO/bin:$PYTHONBASE/bin:/usr/local/sigproc/bin:$PATH
ENV PYTHONPATH $PSR64/lib/python$PYTHONVER/site-packages:$PRESTO/lib/python:$PYTHONBASE/lib/python$PYTHONVER:$PYTHONBASE/lib/python$PYTHONVER/site-packages
ENV LD_LIBRARY_PATH $PSR64/lib:$PRESTO/lib:$TEMPO2/lib:$PYTHONBASE/lib
ENV LIBRARY_PATH $PSR64/lib:$PRESTO/lib:$TEMPO2/lib:$PYTHONBASE/lib
ENV CPATH /usr/local/include
ENV PSRCAT_FILE /usr/local/pulsar64/include/psrcat.db 

ENTRYPOINT /bin/bash