###############################################################################
# Dockerfile is used to build an headles vnc image based on Ubuntu
# build SCRIMMAGE dependencies
# build scrimmage core
###############################################################################

FROM ubuntu:18.04

LABEL maintainer="GTRI DFO MASS Project"

# Scrimmage Core
ARG SCRIM_COMMIT=HEAD
ENV CI_CORES=4

ENV DEBIAN_FRONTEND noninteractive
SHELL ["/bin/bash", "-c"]

USER 0

# Install custom scrimmage PPA dependencies and ubuntu dependencies
# hadolint ignore=DL3008
RUN apt-get update && apt-get install -y --no-install-recommends iputils-ping \
  python3 python3-software-properties software-properties-common \
  git ninja-build build-essential python3-pip python3-dev tcl-vtk6 \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*
# hadolint ignore=DL3008
RUN add-apt-repository ppa:kevin-demarco/scrimmage \
  && apt-get update \
  && apt-get install -y --no-install-recommends \
  scrimmage-dependencies \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# upgrade global pip
# hadolint ignore=DL3013
RUN pip3 install --upgrade pip

# Add runtime user
RUN useradd -u 1000 -ms /bin/bash scrimmage

# Clone scrimmage master and set reset to COMMIT_CORE
ENV HOME=/home/scrimmage
USER 1000
WORKDIR $HOME
RUN git clone https://github.com/gtri/scrimmage.git
WORKDIR $HOME/scrimmage/
RUN git reset --hard $SCRIM_COMMIT

# Install binary dependencies
USER 0
RUN setup/install-binaries.sh -e 0 -p a \
  && apt-get clean -y \
  && rm -rf /var/lib/apt/lists/*

# Run scrimmage setup
# Build scrimmage core
USER 1000
RUN mkdir -p $HOME/scrimmage/build
WORKDIR $HOME/scrimmage/build/
RUN source /opt/scrimmage/*/setup.sh && cmake .. \
  && make -j $CI_CORES
#USER 0
#RUN make install

# Install Python Bindings
RUN pip3 install protobuf==3.3.0 grpcio==1.2.1
WORKDIR /home/scrimmage/scrimmage/python/
RUN pip3 install -e .

# Install PyTorch
WORKDIR $HOME/scrimmage
RUN pip install torch==1.4.0+cpu torchvision==0.5.0+cpu -f https://download.pytorch.org/whl/torch_stable.html

# setup entrypoint script
COPY ./src/scripts/wrapper.sh /usr/local/bin/
ENTRYPOINT ["/usr/local/bin/wrapper.sh"]

#default executable container will run scrimmage with a demo no-gui mission
CMD ["scrimmage", "missions/straight-no-gui.xml"]
