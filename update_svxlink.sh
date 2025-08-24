#!/bin/bash

if [ "$EUID" -ne 0 ]; then
    printf "\x1b[38;5;196mThis script must be run as root. Exiting...\x1b[39m\n"
    exit 1
fi

run() {
    exec=$1
    printf "\x1b[38;5;104m --> ${exec}\x1b[39m\n"
    eval ${exec}
}

say() {
    say=$1
    printf "\x1b[38;5;220m${say}\x1b[38;5;255m\n"
}

if [ "$EUID" -ne 0 ]; then
    say "Please run as root"
    exit
fi

MYPATH=${PWD}

cd /tmp

say "Stop svxlink"
run "systemctl stop svxlink"

say "Installing SVXLink Prerequisites"
run "apt install libssl-dev ladspa-sdk moreutils build-essential g++ make cmake libsigc++-2.0-dev php libgsm1-dev libudev-dev libpopt-dev tcl-dev libgpiod-dev gpiod libgcrypt20-dev libspeex-dev libasound2-dev alsa-utils libjsoncpp-dev libopus-dev rtl-sdr libcurl4-openssl-dev libogg-dev librtlsdr-dev groff doxygen graphviz python3-serial toilet sox bc avahi-daemon avahi-utils -y"

say "Installing/Compiling SVXLink"
run "git clone --branch maint https://github.com/sm0svx/svxlink.git"
run "mkdir svxlink/src/build"
run "cd svxlink/src/build/"
run "cmake -DUSE_QT=OFF -DCMAKE_INSTALL_PREFIX=/usr -DSYSCONF_INSTALL_DIR=/etc -DLOCAL_STATE_DIR=/var -DWITH_SYSTEMD=ON  .."
run "make -j1"
run "make doc"
run "make install"

say "Cleanup"
run "cd /tmp && rm -fr svxlink"

say "Restart svxlink"
say "Stop svxlink & apache"
run "systemctl daemon-reload"
run "systemctl restart svxlink"

say "Update /etc/svxlink/sxvlink.conf"
say "remove AUTH_KEY it's depricated"
say "ADD: DNS_DOMAIN=be.svx.link"
say "ADD: CERT_EMAIL=youremailaddress"

cd ${MYPATH}
