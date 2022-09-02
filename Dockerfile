FROM ubuntu:20.04

RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    apt-get install -y git gcc make wget kmod net-tools iproute2
  
RUN DEBIAN_FRONTEND=noninteractive apt install linux-headers-$(uname -r) -y

RUN git clone https://github.com/luigirizzo/netmap
RUN cd netmap && \
    ./configure --no-drivers && \
    make && \
    make install
