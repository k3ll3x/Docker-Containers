FROM debian:latest

# Install QEMU and binfmt-support
RUN apt-get update && apt-get install -y ca-certificates
RUN apt-get install -y fish
RUN apt-get install -y qemu-kvm qemu-system qemu-utils
RUN apt-get install -y qemu-user-static binfmt-support

#RUN apt-get install -y gcc-arm-linux-gnueabi # Example for ARM

#Copy your configuration inside
COPY . /app

WORKDIR /app
CMD ["/usr/bin/fish"]
