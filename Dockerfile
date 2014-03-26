FROM linux/kali
MAINTAINER Yijun Yu <y.yu@open.ac.uk>
RUN echo deb http://http.kali.org/kali/ kali main non-free contrib > /etc/apt/sources.list
RUN echo deb http://security.kali.org/kali-security/ kali/updates main contrib non-free >> /etc/apt/sources.list
RUN echo deb http://repo.kali.org/kali/ kali-bleeding-edge main >> /etc/apt/sources.list
ENV DEBIAN_FRONTEND noninteractive
ENV INITRD No
RUN echo 'force-unsafe-io' | tee /etc/dpkg/dpkg.cfg.d/02apt-speedup
RUN echo 'DPkg::Post-Invoke {"/bin/rm -f /var/cache/apt/archives/*.deb || true";};' | tee /etc/apt/apt.conf.d/no-cache
RUN apt-get update
RUN apt-get install -y kali-linux-forensic
RUN apt-get install -y kali-linux-full
RUN apt-get install -y kali-root-login
RUN apt-get install -y kali-defaults
RUN apt-get install -y kali-menu
RUN apt-get install -y kali-debtags
RUN apt-get install -y kali-archive-keyring
RUN apt-get install -y debian-installer-launcher
RUN apt-get install -y alsa-tools

RUN apt-get install -y locales-all

RUN apt-get install -y firmware-b43legacy-installer
RUN apt-get install -y firmware-b43-installer
RUN apt-get install -y guymager

RUN apt-get install -y gnome-core
RUN apt-get install -y gnome-brave-icon-theme
RUN apt-get install -y gnome-shell-extensions
RUN apt-get install -y nautilus-open-terminal
RUN apt-get install -y gnome-orca

RUN apt-get install -y desktop-base

RUN apt-get install -y ssh
RUN apt-get install -y openoffice.org
RUN apt-get install -y dkms linux-headers-3.12-kali1-all
RUN apt-get install -y fpc
RUN git clone https://git.gitorious.org/canaima-gnu-linux/dumphive.git
RUN cd dumphive/src; make; cp dumphive /usr/local/bin
RUN apt-get install -y e2undel rsakeyfind aeskeyfind gzrt shed
RUN cd /usr/local/bin; wget http://www.jwz.org/hacks/mork.pl; chmod +x mork.pl
RUN apt-get install -y kmail

