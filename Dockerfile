FROM library/ubuntu:xenial

LABEL maintainer="Chris Diehl <cultclassik@gmail.com>"

ENV AMD_GPU_ID=0
ENV AMD_DRIVER="https://s3-us-west-1.amazonaws.com/mastermine/minebox/amdgpu-pro-17.50-511655.tar.xz"
ENV CMREL="https://s3-us-west-1.amazonaws.com/mastermine/minebox/claymore_Ethereum%2BDecred_Siacoin_Lbry_Pascal_gpu_v10.2_LINUX.tar.gz"
ENV EPOOL1="us2.ethermine.org:4444"
ENV EPOOL2="us1.ethermine.org:4444"
ENV EWALL="eth_acct.eth_worker"
ENV ETHI=8
ENV DPOOL="stratum+tcp://lbry.suprnova.cc:6256"
ENV DWALL="lbc_acct.lbc_worker"
ENV DCRI=8

RUN apt-get update && apt-get install -y \
    libcurl3 wget xz-utils &&\
    wget ${AMD_DRIVER} && \
    unxz amdgpu-pro-17.50-511655.tar.xz &&\
    tar -xvf *.tar &&\
    rm *.tar &&\
    ./amdgpu-pro-17.50-511655/amdgpu-pro-install --opencl=legacy,rocm --headless -y &&\
    mkdir /claymore &&\
    wget ${CMREL} && \
    tar -xvf claymore_Ethereum+Decred_Siacoin_Lbry_Pascal_gpu_v10.2_LINUX.tar.gz -C /claymore --strip-components 1 &&\
    rm claymore_Ethereum+Decred_Siacoin_Lbry_Pascal_gpu_v10.2_LINUX.tar.gz && \
    rm -rf /var/lib/apt/lists/*


ADD script/miner.sh /claymore/

RUN chmod +x /claymore/miner.sh

EXPOSE 3333/tcp

ENTRYPOINT /claymore/miner.sh