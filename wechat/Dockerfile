FROM ghcr.io/linuxserver/baseimage-kasmvnc:arch

USER abc
RUN sudo mkdir /tmp_home &&\
    chown abc:abc /tmp_home &&\
    cd /tmp_home &&\
    sudo pacman -Syu --noconfirm &&\
    sudo pacman -S --noconfirm git noto-fonts-cjk &&\
    git clone https://aur.archlinux.org/electron19-bin.git &&\
    cd electron19-bin &&\
    makepkg -srci --noconfirm &&\
    cd .. &&\
    git clone https://aur.archlinux.org/wechat-uos.git &&\
    cd wechat-uos &&\
    makepkg -srci --noconfirm &&\
    cd /&&\
    sudo rm -rf /tmp_home &&\
    sudo pacman -Rsu --noconfirm git &&\
    sudo pacman -Scc

USER root
COPY /root /
RUN grep -- '-geometry 1024x768' /etc/s6-overlay/s6-rc.d/svc-kasmvnc/run &&\
    sed -i 's/-geometry 1024x768/-geometry 2560x1440/' /etc/s6-overlay/s6-rc.d/svc-kasmvnc/run

