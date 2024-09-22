FROM ghcr.io/linuxserver/baseimage-kasmvnc:arch

# RUN echo 'Server = https://mirror.sjtu.edu.cn/archlinux/$repo/os/$arch' > /etc/pacman.d/mirrorlist

USER abc
RUN sudo mkdir /tmp_home &&\
    sudo chown abc:abc /tmp_home &&\
    cd /tmp_home &&\
    sudo pacman -Syyu --noconfirm &&\
    sudo pacman -S --noconfirm git &&\
    git clone https://aur.archlinux.org/corplink-bin.git &&\
    cd corplink-bin &&\
    makepkg -srci --noconfirm &&\
    cd .. && rm -rf corplink-bin &&\
    sudo pacman -Rsu --noconfirm git &&\
    yes | sudo pacman -Scc

USER root
COPY /root /
