scp -i C:\Users\david\.ssh\homenet_dave.key C:\Users\david\Documents\Development\private\HomeNet-PISwitch-Office\pimenu.yaml dave@192.168.55.130:/home/dave/pimenu/pimenu.yaml
scp -i C:\Users\david\.ssh\homenet_dave.key C:\Users\david\Documents\Development\private\HomeNet-PISwitch-Office\pimenu.sh dave@192.168.55.130:/home/dave/pimenu/pimenu.sh
ssh dave@192.168.55.130 -i C:\Users\david\.ssh\homenet_dave.key 'kill $(pidof python2)'
ssh dave@192.168.55.130 -i C:\Users\david\.ssh\homenet_dave.key 'export DISPLAY=:0.0;python2 /home/dave/pimenu/pimenu.py fs'