# SVXLink install for the RF.Guru TRXrptr HAT ([RF.Guru TRXrptr](https://rf.guru/2023-k-300))

HAT has been tested on a Raspberry Pi ZeroW and a Raspberry PI 4, should work on others to!

The board has an audio card, an audio and ptt bypass (default)

PTT is end via small relay (NC and NO contacts are both available)

PTT bypass is doen via relay (NC and NO contacts arre both available)

COS detection from 3v till 24v via GPIO 12

PTT send is via GPIO 16
Prepare your sd-card with Raspberry PI OS Lite ! ([Youtube](https://www.youtube.com/watch?v=vxmO_a5WNI8))

Login to your system with ssh add run following commands:

### Install GIT  ###
```console
sudo apt -y install git
```

### Clone repostory ###
```console
git clone https://github.com/Guru-RF/SVXTRXRepeater.git
```

### Audio and Radio module installation script ###
```console
cd SVXTRXRepeater
sudo bash install-trxrptr.sh 
```

### SVXLink installation script ###
```console
cd SVXRepeater
sudo bash install-svxlink.sh
```

### Simple Test ###
Sending D1# dtmf on the configured frequency starts the parrot.

### SVXLink Hotspot in action ###
https://github.com/Guru-RF/SVXSpot/assets/1251767/50dd4366-8439-4067-83b5-5866d0adca77
