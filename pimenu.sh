#!/bin/bash
# Split input parameter in 2 parts
param1=$(cut -d ' ' -f 2 <<< $*)
param2=$(cut -d ' ' -f 3 <<< $*)

# Transform on to true and off to false
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

# Set IP address for the given device
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

# Send API request to shelly device
echo "send curl to http://$_ip/rpc/Switch.Set?id=0&on=$_switch" >> /home/dave/pimenu/pimenu.log
curl "http://$_ip/rpc/Switch.Set?id=0&on=$_switch"