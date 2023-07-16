FROM ubuntu:latest

RUN apt update -y
RUN DEBIAN_FRONTEND=noninteractive apt install tzdata -y
RUN apt install -y git-all build-essential cmake libuv1-dev libssl-dev libhwloc-dev
RUN rm -rf /var/lib/apt/lists/* && apt-get autoremove -y
RUN git clone https://github.com/xmrig/xmrig.git
RUN mkdir xmrig/build && cd xmrig/build
WORKDIR /xmrig/build/
RUN cmake ..
RUN make -j$(nproc)
RUN chmod +x /xmrig/build/xmrig
RUN ln -s /xmrig/build/xmrig /bin/xmrig
