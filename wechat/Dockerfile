FROM ghcr.io/linuxserver/baseimage-kasmvnc:arch

USER abc
RUN sudo mkdir /tmp_home &&\
    sudo chown abc:abc /tmp_home &&\
    cd /tmp_home &&\
    printf '[multilib]\nInclude = /etc/pacman.d/mirrorlist\n' | sudo tee -a /etc/pacman.conf &&\
    printf '[archlinuxcn]\nServer = https://repo.archlinuxcn.org/$arch\n' | sudo tee -a /etc/pacman.conf &&\
    sudo pacman -Syyu --noconfirm &&\
    sudo pacman-key --lsign farseerfc@archlinux.org &&\
    sudo pacman -S --noconfirm archlinuxcn-keyring &&\
    sudo pacman -S --noconfirm git &&\
    git clone https://aur.archlinux.org/paru-bin.git &&\
    cd paru-bin &&\
    makepkg -srci --noconfirm &&\
    cd .. &&\
    sudo pacman -S --noconfirm wine-for-wechat wqy-microhei &&\
    sudo pacman -S --noconfirm wine-mono &&\
    export HOME=/tmp_home &&\
    paru -S --noconfirm com.qq.weixin.spark &&\
    paru -Sc --delete &&\
    cd / &&\
    sudo rm -rf /tmp_home &&\
    sudo pacman -Rsu --noconfirm git paru-bin &&\
    yes | sudo pacman -Scc

USER root
COPY /root /
