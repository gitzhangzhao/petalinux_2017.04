FROM ubuntu:16.04

RUN dpkg --add-architecture i386
RUN apt update \
        && apt install -y sudo libssl-dev flex bison chrpath socat autoconf libtool texinfo gcc-multilib libsdl1.2-dev libglib2.0-dev screen pax net-tools wget diffstat xterm gawk xvfb git make libncurses5-dev tftpd zlib1g libssl-dev gnupg tar unzip build-essential libtool-bin dialog cpio lsb-release zlib1g:i386 zlib1g-dev:i386 locales openjdk-8-jdk

RUN useradd --system --create-home --no-log-init zhangzh \
        && adduser zhangzh sudo \
        && echo 'zhangzh:zhangzh' | chpasswd
WORKDIR /home/zhangzh

USER zhangzh
RUN echo 'cd $HOME \n\
export LANG=en_US.UTF-8 \n\
source /home/zhangzh/petalinux/settings.sh \n\
alias h="history|grep petalinux" \n\
alias c="history|grep petalinux-creat" \n\
alias p="history|grep petalinux-pa" \n\
alias ..="cd .." \n\
alias ...="cd .. && cd .." \n\
alias cd..="cd .." \n\
function creat(){ \n\
    petalinux-create --type project --template zynq --name $1 \n\
} \n\
function config(){ \n\
    petalinux-config --get-hw-description /mnt/vivado/test$1/test$1.sdk \n\
} \n\
function configk(){ \n\
    petalinux-config -c kernel \n\
} \n\
function configr(){ \n\
    petalinux-config  -c rootfs \n\
} \n\
function build(){ \n\
    petalinux-build \n\
} \n\
function package(){ \n\
    petalinux-package --boot --fsbl ./images/linux/zynq_fsbl.elf --fpga --u-boot --force \n\
}' >> .bashrc

RUN export LANG=en_US.UTF-8
