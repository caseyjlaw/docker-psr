FROM ubuntu:latest
MAINTAINER Casey Law <caseyjlaw@gmail.com>

RUN apt-get update -y && \
    apt-get install -y wget python make gcc gfortran git \
    xorg xorg-dev gpp g++ libxml2 libxml2-dev tcsh
# dh-autoreconf


WORKDIR /home
RUN git clone https://github.com/SixByNine/psrsoft.git

# build psrsoft stuff
ENV PSRSOFT_USR /usr/local
#? ENV LD_LIBRARY_PATH /usr/local/lib

RUN grep -v "export PSRSOFT_USR" /home/psrsoft/config/profile.example > /home/psrsoft/config/profile
RUN /home/psrsoft/bin/psrsoft world --yes

RUN ${PSRSOFT_DIR}/bin/psrsoft tempo --yes # then type 1

RUN git clone https://bitbucket.org/mkeith/tempo2.git
RUN cd tempo2 && ./update && ./bootstrap && ./configure --prefix /usr/local/
RUN make && make install

RUN git clone git://git.code.sf.net/p/psrchive/code psrchive

# RUN ${PSRSOFT_DIR}/bin/psrsoft tempo2 --yes # then type 1
# RUN ${PSRSOFT_DIR}/bin/psrsoft tempo2-plugins --yes

#...psrchive failing...
# RUN ${PSRSOFT_DIR}/bin/psrsoft psrchive

# RUN ${PSRSOFT_DIR}/bin/psrsoft dspsr --yes

# build presto
#RUN cd /home
#RUN git clone git://github.com/scottransom/presto.git


# set up
#EXPOSE 8888  # for jupyter notebook
#RUN ["/bin/bash", "/setup.sh"]
#ENTRYPOINT ["/entrypoint.sh"]
#CMD ["help"]
