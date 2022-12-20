#!/bin/bash
#
# This is an basic example to control a bunch of shelly devices

param1=$(cut -d ' ' -f 1 <<< $*)
param2=$(cut -d ' ' -f 2 <<< $*)

if [ "$param2" == "on" ]
then 
    _switch="true"
elif [ "$param2" == "off" ]
then
    _switch="false"
else
    echo "unkown switch \"$param2\" given" >> /home/dave/pimenu/pimenu.log
    exit 1;
fi

case $param1 in
    officeepoxylight)
        _ip="192.168.55.213";
        ;;
    officeshop)
        _ip="192.168.55.112";
        ;;
    officedesk)
        _ip="aaa.bbb.ccc.ddd";
        exit 0;
        ;;
    officedesklight)
        _ip="192.168.55.231";
        ;;
    officevideolight)
        _ip="aaa.bbb.ccc.ddd";
        exit 0;
        ;;
    office3dprinter)
        _ip="192.168.55.151";
        ;;
    officelaser)
        _ip="aaa.bbb.ccc.ddd";
        exit 0;
        ;;
    *)
        echo "unkown device \"$param1\" given" >> /home/dave/pimenu/pimenu.log
        exit 1
        ;;
esac

echo "send curl to http://$_ip/rpc/Switch.Set?id=0&on=$_switch" >> /home/dave/pimenu/pimenu.log
curl "http://$_ip/rpc/Switch.Set?id=0&on=$_switch"