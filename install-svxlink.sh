#!/bin/bash

run() {
  exec=$1
  printf "\x1b[38;5;104m --> ${exec}\x1b[39m\n"
  eval ${exec}
}

say () {
  say=$1
  printf "\x1b[38;5;220m${say}\x1b[38;5;255m\n"
}

MYPATH=${PWD}

say "Installing SVXLink Prerequisites"
run "apt install moreutils build-essential g++ make cmake libsigc++-2.0-dev php libgsm1-dev libudev-dev libpopt-dev tcl-dev libgpiod-dev gpiod libgcrypt20-dev libspeex-dev libasound2-dev alsa-utils libjsoncpp-dev libopus-dev rtl-sdr libcurl4-openssl-dev libogg-dev librtlsdr-dev groff doxygen graphviz python3-serial toilet sox bc avahi-daemon avahi-utils -y"

say "Disabling apache"
run "systemctl disable apache2"
run "systemctl disable apache-htcacheclean"

say "Adding svxlink user and groups"
run "groupadd svxlink"
run "useradd -g svxlink -d /etc/svxlink svxlink"
run "usermod -aG audio,nogroup,svxlink,plugdev svxlink"
run "usermod -aG gpio svxlink"

say "Installing/Compiling SVXLink"
run "git clone https://github.com/sm0svx/svxlink.git"
run "mkdir svxlink/src/build"
run "cd svxlink/src/build/"
run "cmake -DUSE_QT=OFF -DCMAKE_INSTALL_PREFIX=/usr -DSYSCONF_INSTALL_DIR=/etc \ -DLOCAL_STATE_DIR=/var -DWITH_SYSTEMD=ON  .."
run "make -j4"
run "make -j4 doc"
run "make -j4 install"
cd ${MYPATH}

say "Creating events.d symlink"	
run "cd /usr/share/svxlink/events.d"
run "ln -s . local"
cd ${MYPATH}

say "Updating LD"
run "ldconfig"

say "Installing svxlink sounds"
run "cd /usr/share/svxlink/sounds"
run 'git clone "https://github.com/sm0svx/svxlink-sounds-en_US-heather"'
run "${MYPATH}/svxlink/src/svxlink/scripts/filter_sounds.sh -r 16000 svxlink-sounds-en_US-heather en_US"
run "rm -fr svxlink-sounds-en_US-heather"
run "rm -f svxlink-sounds-en_US.tar.bz2"

cd ${MYPATH}
say "Install svxlink_rotate"
run "cp svxlink_rotate /usr/sbin"
run "chmod a+x /usr/sbin/svxlink_rotate"
run "ln -s /usr/sbin/svxlink_rotate /etc/cron.daily/svxlink_rotate"

say "Install svxlink_checkalsa"
run "cp svxlink_checkalsa /usr/sbin"
run "chmod a+x /usr/sbin/svxlink_checkalsa"

say "Updating svxlink.service"
run "cp svxlink.service /lib/systemd/system/svxlink.service"

say "Installing default configurations"
run "cat gpio.conf > /etc/svxlink/gpio.conf"
run "cat svxlink.conf > /etc/svxlink/svxlink.conf.new"
run "cat svxlink_gpio_up > /usr/sbin/svxlink_gpio_up"

say "Installing systemd services"
run "systemctl enable svxlink_gpio_setup"
run "systemctl enable svxlink"
run "systemctl start svxlink_gpio_setup.service"
run "systemctl start svxlink.service"

say "Sysctl UDP tuning parameters"
run "cp 97-rfguru.conf /etc/sysctl.d/97-rfguru.conf"

say "Initial GPIO settings"
run "/usr/sbin/repeater"

say "Svxlink config is in here: /etc/svxlink/svxlink.conf.new" 
say "Copy it to /etc/svxlink/svxlink.conf if this is a blank install !"




