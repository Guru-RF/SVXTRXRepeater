### SVXLink install for the RF.Guru TRXrptr HAT ([TRXrptr](https://shop.rf.guru/products/2023-p-300))

# SVXLink Bookworm Image #

[Bookworm 64Bit Lite 2024-02-01 Image](https://storage.googleapis.com/rf-guru/rpi-images/trxrepeater-2024-02-01.img.gz)

Utilize PI-Imager to write the image to your MicroSD card! **Don't use svxlink, root as a username, these are system usernames, using them will result in a broken installation !**

Use the latest release of PI-Imager [Github](https://github.com/raspberrypi/rpi-imager/releases)

[Youtube demonstration of how to use PI-Imager on Windows 11](https://www.youtube.com/watch?v=mOqekYMIBgU)

[Youtube demonstration of how to use PI-Imager on MacOS X](https://www.youtube.com/watch?v=UeiBUUef2c0)

It appears that the Raspberry Pi freezes after resizing the file system. Currently, after the initial boot, wait for 10 minutes, disconnect the power, and then restart. We suspect this issue is a bug and anticipate it will likely be resolved in a future release of pi-shrink.

To complete the final configuration step, SSH is required. For Linux/Mac, SSH is installed by default. Open a terminal and type ssh username@ip. However, for Windows, you'll need an additional application, such as Putty.

[Youtube how to install putty on Windows 11](https://www.youtube.com/watch?v=ljL4Wvv8XwI)

Ensure that you download Putty for the correct architecture; for the majority, it will be x86 64-bit.

# Manual Install #
HAT has been successfully trialed on both a Raspberry Pi Zero 2 W and a Raspberry Pi 4, and it is anticipated to be compatible with other models as well.

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
Initiating the parrot function commences upon transmitting a D1# DTMF signal.

### GPIO Pins
Description of the GPIO pins
```text
GPIO 7: Configured as an output. Set it to a high signal to deactivate the audio bypass (the audio is in bypass mode by default).
GPIO 8: Configured as an output. This pin is used for optional PTT bypass (refer to the breakout for details).
GPIO 16: Configured as an output. Utilize this pin to activate PTT for any type of PTT operation, such as using a relay.
GPIO 12: Configured as an input. This pin is used for COS (Carrier Operated Squelch) detection. Depending on your transceiver, the logic voltage can vary within the range of 3.3V to 24V.
```

### AUDIO Pins
Description of the AUDIO pins
```text
AUDIOOUT/RMIC corresponds to transmitting audio, which signifies audio going from the board to the repeater.
AUDIOIN/RAF corresponds to receiving audio, indicating audio traveling from the repeater to the board.
GND this is common ground, also needed for the audio in and output
```

### PTT Pins
Description of the GPIO pins
```text
PTTGND -> PTT Ground
PTTNO -> PTT Normaly Open
PTTNC -> PTT Normaly Closed
```

### Custom Bypass Pins
Description of the GPIO pins
```text
BPGND -> Bypass Ground
BPNO -> Bypass Normaly Open
BPNC -> Bypass Normaly Closed
```

### Modify volume
Modify repeater_volume to your needs ...
```text
/usr/sbin/repeater_volume
```
You can use arecord to fine tune the audio in and output levels
```text
systemctl stop svxlink
/sbin/hotspot_volume
arecord -V stereo -r 44100 -f S16_LE -c 2 /dev/null
```

### New version !!! With Breackout board !!!
Main PCB<br>
![2023-P-300](https://github.com/Guru-RF/SVXTRXRepeater/assets/1251767/e0743816-b0c8-4d0a-b733-5f92b0fabddf)

Breakout PCB<br>
![2023-P-701](https://github.com/Guru-RF/SVXTRXRepeater/assets/1251767/e74a9b6c-e917-4b19-8878-a2fa0503e364)

### Picture's ###

ON0AND<br>![ON0AND](https://github.com/Guru-RF/SVXTRXRepeater/assets/1251767/ae8500d2-dcf4-4cf3-8188-8b11269a3f90)<br>
ON0HAL<br>![ON0HAL](https://github.com/Guru-RF/SVXTRXRepeater/assets/1251767/7f9c5074-71b5-40aa-8375-b926f5b23b90)<br>
ON0ORA<br>![ON0ORA](https://github.com/Guru-RF/SVXTRXRepeater/assets/1251767/10086ad7-3edd-46fc-9fe0-11c2d8879e82)<br>
ON7FQ<br>![2023-09-30 08_25_03](https://github.com/Guru-RF/SVXTRXRepeater/assets/1251767/eabed06b-c7f1-4acc-a168-5d68c663fa6c)<br>

