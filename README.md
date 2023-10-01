# SVXLink install for the RF.Guru TRXrptr HAT ([TRXrptr](https://rf.guru/2023-k-300))

HAT has been successfully trialed on both a Raspberry Pi ZeroW and a Raspberry Pi 4, and it is anticipated to be compatible with other models as well.

The board includes an audio card and offers the option for audio and PTT bypass functionality.<br> 
PTT operation is achieved using a compact relay with both NC and NO contacts available.<br>
Additionally, PTT/COS-COR bypass functionality is also facilitated through a small relay with both NC and NO contacts accessible.<br>
COS detection can be optionally configured within the voltage range of 3V to 24V.<br>

To begin, make sure to prepare your SD card with the Raspberry Pi OS Lite as demonstrated in this ([YouTube](https://www.youtube.com/watch?v=vxmO_a5WNI8)) video.

Next, access your system through SSH and execute the following commands:

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
cd SVXTRXRepeater
sudo bash install-svxlink.sh
```

### Simple Test ###
Sending D1# dtmf on the configured frequency starts the parrot.


### GPIO Pins
Description of the GPIO pins
```text
GPIO 7 -> output ... Drive High for disabling the audio bypass (audio is in bypass by default)
GPIO 8 -> output ... Optional PTT bypss (see breakout)
GPIO 16 -> output ... Drive PTT (for any type of PTT (relay)
GPIO 12 -> input ... COS ... depending on your tranceiver ... logic voltage can be between 3.3v and 24v
```

### AUDIO Pins
Description of the GPIO pins
```text
RMIC -> TX audio (Audio from the board to the repeater)
RAF -> RX audio (Audio from the repeater to the board)
```

### Custom Bypass Pins
Description of the GPIO pins
```text
BPGND -> Bypass Ground
BPNO -> Bypass Normaly Open
BPNC -> Bypass Normaly Closed
```

### New version !!! With Breackout board !!!
Main PCB<br>
![2023-P-300](https://github.com/Guru-RF/SVXTRXRepeater/assets/1251767/348cf2b0-6107-4a90-9719-5b729cbd78da)<br>
Breakout PCB<br>
![2023-P-701](https://github.com/Guru-RF/SVXTRXRepeater/assets/1251767/f0934b06-4ec9-4cef-84e8-26a5313f08b8)<br>

### Picture's ###

ON0AND<br>![ON0AND](https://github.com/Guru-RF/SVXTRXRepeater/assets/1251767/ae8500d2-dcf4-4cf3-8188-8b11269a3f90)<br>
ON0HAL<br>![ON0HAL](https://github.com/Guru-RF/SVXTRXRepeater/assets/1251767/7f9c5074-71b5-40aa-8375-b926f5b23b90)<br>
ON0ORA<br>![ON0ORA](https://github.com/Guru-RF/SVXTRXRepeater/assets/1251767/10086ad7-3edd-46fc-9fe0-11c2d8879e82)<br>
ON7FQ<br>![2023-09-30 08_25_03](https://github.com/Guru-RF/SVXTRXRepeater/assets/1251767/eabed06b-c7f1-4acc-a168-5d68c663fa6c)<br>

