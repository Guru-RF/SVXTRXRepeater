# SVXLink install for the RF.Guru TRXrptr HAT ([TRXrptr](https://rf.guru/2023-k-300))

HAT has been tested on a Raspberry Pi ZeroW and a Raspberry PI 4, should work on others to!

The board has an audio card, an audio and ptt bypass (default)<br>
PTT is end via small relay (NC and NO contacts are both available)<br>
PTT bypass is doen via relay (NC and NO contacts arre both available)<br>
COS detection from 3v till 24v via GPIO 12<br>
PTT send is via GPIO 16<br>

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



### Picture's ###

ON0AND<br>![ON0AND](https://github.com/Guru-RF/SVXTRXRepeater/assets/1251767/ae8500d2-dcf4-4cf3-8188-8b11269a3f90)<br>
ON0HAL<br>![ON0HAL](https://github.com/Guru-RF/SVXTRXRepeater/assets/1251767/7f9c5074-71b5-40aa-8375-b926f5b23b90)<br>
ON0ORA<br>![ON0ORA](https://github.com/Guru-RF/SVXTRXRepeater/assets/1251767/10086ad7-3edd-46fc-9fe0-11c2d8879e82)<br>

