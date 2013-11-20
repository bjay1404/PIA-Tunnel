#!/bin/bash
# support script for pia-setup
# this script will add missing settings to the config file
LANG=en_US.UTF-8
export LANG
source '/pia/settings.conf'



#check if settings exist in settings.conf and add their default


if [ -z "${DAEMON_ENABLED}" ]; then
  echo '# pia-daemon settings' >> '/pia/settings.conf'
  echo '#####' >> '/pia/settings.conf'
  echo 'DAEMON_ENABLED="no"' >> '/pia/settings.conf'
  echo '# set action when VPN fails: terminate | failover' >> '/pia/settings.conf'
  echo 'FAIL_ACTION="failover"' >> '/pia/settings.conf'
  echo 'FAIL_RETRY_VPN=4' >> '/pia/settings.conf'
  echo 'FAIL_RETRY_INTERNET=3' >> '/pia/settings.conf'
  echo 'FAIL_RETRY_DELAY=1' >> '/pia/settings.conf'
fi

if [ ! ${NAMESERVERS[0]+abc} ]; then
  echo '# list of VPN connections to use, the first is awlays the primary' >> '/pia/settings.conf'
  echo 'MYVPN[0]="CA Toronto"' >> '/pia/settings.conf'
  echo 'MYVPN[1]="Switzerland"' >> '/pia/settings.conf'
  echo 'MYVPN[2]="Sweden"' >> '/pia/settings.conf'
  echo 'MYVPN[3]="Romania"' >> '/pia/settings.conf'
  echo 'MYVPN[4]="Germany"' >> '/pia/settings.conf'
  echo 'MYVPN[5]="France"' >> '/pia/settings.conf'
  echo 'MYVPN[6]="Netherlands"' >> '/pia/settings.conf'
fi

if [ -z "${SLEEP_INTERNET_DOWN}" ]; then
  echo '# General Time and Delay Settings' >> '/pia/settings.conf'
  echo '#####' >> '/pia/settings.conf'
  echo '# time in seconds to wait before rechecking a down Internet connection' >> '/pia/settings.conf'
  echo "# each run takes a few seconds to complete so don't go too low!" >> '/pia/settings.conf'
  echo '# default 320 (5 minutes)' >> '/pia/settings.conf'
  echo 'SLEEP_INTERNET_DOWN=320' >> '/pia/settings.conf'
  echo '# time in seconds to wait before attempting to ping a resource again' >> '/pia/settings.conf'
  echo '# default 4' >> '/pia/settings.conf'
  echo 'SLEEP_PING_RETEST=4' >> '/pia/settings.conf'
  echo '# time in seconds between retries when none of the PIA Gateways can be reached' >> '/pia/settings.conf'
  echo '# default 320 (5 minutes)' >> '/pia/settings.conf'
  echo 'SLEEP_RECONNECT_ERROR=320' >> '/pia/settings.conf'
  echo '# time (seconds) in between "uptime" checks. every check will send a few pings' >> '/pia/settings.conf'
  echo "# to some server so please don't flood them or they may block you" >> '/pia/settings.conf'
  echo '# default 30' >> '/pia/settings.conf'
  echo 'SLEEP_MAIN_LOOP=30' >> '/pia/settings.conf'
fi

if [ -z "${VERBOSE}" ]; then
  echo '# output level and debug settings' >> '/pia/settings.conf'
  echo '#####' >> '/pia/settings.conf'
  echo '# setting verbose to yes will print status notification after each check. any other settings for "background mode"' >> '/pia/settings.conf'
  echo 'VERBOSE="no"' >> '/pia/settings.conf'
  echo 'VERBOSE_DEBUG="no"' >> '/pia/settings.conf'

fi

ret=`grep -c 'bold=' /pia/settings.conf`
if [ $ret = 0 ]; then
  echo '#for pretty print' >> '/pia/settings.conf'
  echo '#####' >> '/pia/settings.conf'
  echo 'bold=`tput bold`' >> '/pia/settings.conf'
  echo 'normal=`tput sgr0`' >> '/pia/settings.conf'
fi

if [ -z "${FORWARD_IP}" ]; then
  echo '# IP of target computer for port forwarding - if supported by location' >> '/pia/settings.conf'
  echo 'FORWARD_IP="192.168.10.101"' >> '/pia/settings.conf'
fi

if [ -z "${FORWARD_PORT_ENABLED}" ]; then
  echo '# Enable/Disable forwarding yes/no' >> '/pia/settings.conf'
  echo 'FORWARD_PORT_ENABLED="yes"' >> '/pia/settings.conf'
fi

if [ -z "${DAEMON_ENABLED}" ]; then
  echo '# Enable/Disable pia-daemon yes/no' >> '/pia/settings.conf'
  echo 'DAEMON_ENABLED="no"' >> '/pia/settings.conf'
fi

if [ -z "${FORWARD_VM_LAN}" ]; then
  echo '# Enable/Disable forwarding for private VM LAN yes/no' >> '/pia/settings.conf'
  echo 'FORWARD_VM_LAN="yes"' >> '/pia/settings.conf'
fi

if [ -z "${FORWARD_PUBLIC_LAN}" ]; then
  echo '# Enable/Disable forwarding for public LAN yes/no' >> '/pia/settings.conf'
  echo 'FORWARD_PUBLIC_LAN="no"' >> '/pia/settings.conf'
fi

if [ ! ${FIREWALL_IF_SSH[0]+abc} ]; then
  echo '# Enable ssh on the following interfaces' >> '/pia/settings.conf'
  echo 'FIREWALL_IF_SSH[0]="eth0"' >> '/pia/settings.conf'
  echo 'FIREWALL_IF_SSH[1]="eth1"' >> '/pia/settings.conf'
fi

if [ ! ${FIREWALL_IF_WEB[0]+abc} ]; then
  echo '# Enable web UI on the following interfaces' >> '/pia/settings.conf'
  echo 'FIREWALL_IF_WEB[0]="eth0"' >> '/pia/settings.conf'
  echo 'FIREWALL_IF_WEB[1]="eth1"' >> '/pia/settings.conf'
fi

if [ ! ${NAMESERVERS[0]+abc} ]; then
  echo '# DNS Servers to use' >> '/pia/settings.conf'
  echo 'NAMESERVERS[0]="8.8.8.8"' >> '/pia/settings.conf'
  echo 'NAMESERVERS[1]="208.67.222.222"' >> '/pia/settings.conf'
  echo 'NAMESERVERS[2]="8.8.4.4"' >> '/pia/settings.conf'
  echo 'NAMESERVERS[3]="208.67.220.220"' >> '/pia/settings.conf'
fi

if [ -z "${IF_ETH0_DHCP}" ]; then
  echo '# Interface settings' >> '/pia/settings.conf'
  echo 'IF_ETH0_DHCP="yes"' >> '/pia/settings.conf'
  echo 'IF_ETH0_IP=""' >> '/pia/settings.conf'
  echo 'IF_ETH0_SUB=""' >> '/pia/settings.conf'
  echo 'IF_ETH0_GW=""' >> '/pia/settings.conf'
fi

if [ -z "${IF_ETH1_DHCP}" ]; then
  echo '# Interface settings' >> '/pia/settings.conf'
  echo 'IF_ETH1_DHCP="no"' >> '/pia/settings.conf'
  echo 'IF_ETH1_IP="192.168.10.1"' >> '/pia/settings.conf'
  echo 'IF_ETH1_SUB="255.255.255.0"' >> '/pia/settings.conf'
  echo 'IF_ETH1_GW=""' >> '/pia/settings.conf'
fi

if [ -z "${DHCPD_ENABLED1}" ]; then
  echo '# Range for dynamic IPs' >> '/pia/settings.conf'
  echo 'DHCPD_ENABLED1="yes"' >> '/pia/settings.conf'
  echo 'DHCPD_RANGE1="192.168.10.101 192.168.10.151"' >> '/pia/settings.conf'
  echo 'DHCPD_BROADCAST1="192.168.10.255"' >> '/pia/settings.conf'
  echo 'DHCPD_ROUTER1="192.168.10.1"' >> '/pia/settings.conf'
  echo 'DHCPD_SUBNET1="192.168.10.0"' >> '/pia/settings.conf'
  echo 'DHCPD_MASK1="255.255.255.0"' >> '/pia/settings.conf'
fi

if [ -z "${DHCPD_ENABLED2}" ]; then
  echo '# Range for dynamic IPs' >> '/pia/settings.conf'
  echo 'DHCPD_ENABLED2="no"' >> '/pia/settings.conf'
  echo 'DHCPD_RANGE2=""' >> '/pia/settings.conf'
  echo 'DHCPD_BROADCAST2=""' >> '/pia/settings.conf'
  echo 'DHCPD_ROUTER2=""' >> '/pia/settings.conf'
  echo 'DHCPD_SUBNET2=""' >> '/pia/settings.conf'
  echo 'DHCPD_MASK2=""' >> '/pia/settings.conf'
fi

#add HAS_BEEN_RESET for the setup wizard
if [ -z "${HAS_BEEN_RESET}" ]; then
  echo 'HAS_BEEN_RESET="no"' >> '/pia/settings.conf'
fi


# in BASH DHCPD_STATIC_MAC="" then -z fails
ret=`grep -c "DHCPD_STATIC_MAC" /pia/settings.conf`
if [ $ret = 0 ]; then
  echo 'DHCPD_STATIC_MAC=""' >> '/pia/settings.conf'
fi
ret=`grep -c "DHCPD_STATIC_IP" /pia/settings.conf`
if [ $ret = 0 ]; then
  echo 'DHCPD_STATIC_IP=""' >> '/pia/settings.conf'
fi

#add web UI user info
ret=`grep -c "WEB_UI_USER" /pia/settings.conf`
if [ $ret = 0 ]; then
  echo 'WEB_UI_USER=""' >> '/pia/settings.conf'
fi
ret=`grep -c "WEB_UI_PASSWORD" /pia/settings.conf`
if [ $ret = 0 ]; then
  echo 'WEB_UI_PASSWORD=""' >> '/pia/settings.conf'
fi
ret=`grep -c "WEB_UI_NAMESPACE" /pia/settings.conf`
if [ $ret = 0 ]; then
  echo 'WEB_UI_NAMESPACE="3DApa2ezdm"' >> '/pia/settings.conf'
fi
ret=`grep -c "WEB_UI_COOKIE" /pia/settings.conf`
if [ $ret = 0 ]; then
  echo 'WEB_UI_COOKIE=""' >> '/pia/settings.conf'
fi
ret=`grep -c "WEB_UI_COOKIE_LIFETIME" /pia/settings.conf`
if [ $ret = 0 ]; then
  echo 'WEB_UI_COOKIE_LIFETIME="120"' >> '/pia/settings.conf'
fi

#ping failure
ret=`grep -c "PING_MAX_LOSS" /pia/settings.conf`
if [ $ret = 0 ]; then
  echo 'PING_MAX_LOSS="20"' >> '/pia/settings.conf'
fi