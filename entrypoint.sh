#!/bin/sh
if [[ -f ${config_path} ]];
    then
        /opt/mumble/murmur.x86 -fg -ini ${config_path}
    else
        cp -vr /opt/mumble/config.ini ${config_path}
        /opt/mumble/murmur.x86 -fg -ini ${config_path}
fi