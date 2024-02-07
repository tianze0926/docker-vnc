FROM ghcr.io/linuxserver/baseimage-kasmvnc:arch

USER abc
RUN sudo mkdir /tmp_home &&\
    sudo chown abc:abc /tmp_home &&\
    cd /tmp_home &&\
    sudo pacman -Syu --noconfirm &&\
    sudo pacman -S --noconfirm git &&\
    git clone https://aur.archlinux.org/paru-bin.git &&\
    cd paru-bin &&\
    makepkg -srci --noconfirm &&\
    cd .. &&\
    export HOME=/tmp_home &&\
    sudo pacman -S --noconfirm qt5-svg &&\
    paru -S --noconfirm wemeet-bin &&\
    paru -Sc --delete &&\
    cd / &&\
    sudo rm -rf /tmp_home &&\
    sudo pacman -Rsu --noconfirm git paru-bin &&\
    yes | sudo pacman -Scc

USER root
COPY /root /
