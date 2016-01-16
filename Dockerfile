FROM debian:jessie
RUN DEBIAN_FRONTEND=noninteractive apt-get update -q \
    && DEBIAN_FRONTEND=noninteractive apt-get dist-upgrade -y \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y wget unzip libvirt-bin qemu-kvm bridge-utils \
    && cd / \
    && wget 'https://releases.hashicorp.com/nomad/0.2.3/nomad_0.2.3_linux_amd64.zip' \
    && echo "0f3a7083d160893a291b5f8b4359683c2df7991fa0a3e969f8785ddb40332a8c  nomad_0.2.3_linux_amd64.zip"|shasum -c \
    && unzip nomad_0.2.3_linux_amd64.zip \
    && rm nomad_0.2.3_linux_amd64.zip \
    && chmod +x nomad \
    && DEBIAN_FRONTEND=noninteractive apt-get autoremove -y curl unzip \
    && rm -Rf /var/lib/apt /var/cache/apt
