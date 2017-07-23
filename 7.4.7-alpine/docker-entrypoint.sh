#!/bin/ash
set -e

if ! [ -d /run/apache2 ];then
    mkdir /run/apache2
    chown apache:apache /run/apache2
fi

if ! [ -d /etc/bacula ];then
    mkdir /etc/bacula
fi

if ! [ -f /usr/share/baculum/protected/Data/baculum.users ];then

    [[ ! -z $BACULUM_USER ]] || BACULUM_USER=admin
    [[ ! -z $BACULUM_PASSWD ]] || BACULUM_PASSWD=admin
    
    echo $BACULUM_PASSWD | htpasswd -i -c /usr/share/baculum/protected/Data/baculum.users $BACULUM_USER
    
    chown apache:apache /usr/share/baculum/protected/Data/baculum.users
fi

httpd -DFOREGROUND "$@"
