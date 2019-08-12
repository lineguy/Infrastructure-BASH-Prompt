#!/bin/bash

STRING="$(hostname --fqdn)"

# EXAMPLE HOSTNAME
#STRING="gs1-dev-gw01"

# BREAK DOWN HOSTNAME INTO SECTIONS

DATACENTRE=`echo $STRING | cut -d- -f1`
ENVIROMENT=`echo $STRING | cut -d- -f2`
HOSTPART=`echo $STRING | cut -d- -f3`

# COLORS:

RED_1="41"
RED_2="31"
YELLOW_1="43"
YELLOW_2="33"
GREEN_1="42"
GREEN_2="32"
WHITE_1="39"
WHITE_2="49"

# COLORISE THE ENVIROMENT PART OF THE PROMPT

case $ENVIROMENT in
"prod")
 _ROOT_ENVIRONMENT_COLOR="$RED_2"
 _USER_ENVIRONMENT_COLOR="$RED_2"
 ;;
"qa")
  _ROOT_ENVIRONMENT_COLOR="$YELLOW_2"
  _USER_ENVIRONMENT_COLOR="$YELLOW_2"
 ;;
"dev")
 _ROOT_ENVIRONMENT_COLOR="$GREEN_2"
 _USER_ENVIRONMENT_COLOR="$GREEN_2"
 ;;
*)
  _ROOT_ENVIRONMENT_COLOR="$WHITE_2"
  _USER_ENVIRONMENT_COLOR="$WHITE_2"
esac

# COLORISE THE DATACENTER PART OF THE PROMPT

case $DATACENTRE in
"gs1")
  _ROOT_DATACENTRE_COLOR="$WHITE_1"
  _USER_DATACENTRE_COLOR="$WHITE_1"
  ;;
"aws")
  _ROOT_DATACENTRE_COLOR="$WHITE_1"
  _USER_DATACENTRE_COLOR="$WHITE_1"
  ;;
*)
  _ROOT_DATACENTRE_COLOR="$WHITE_1"
  _USER_DATACENTRE_COLOR="$WHITE_1"
  ;;
esac

# COLORISE THE HOST PART OF THE PROMPT

case $HOSTPART in
gw*)
    _ROOT_HOSTPART_COLOR="$RED_1"
    _USER_HOSTPART_COLOR="${_USER_ENVIRONMENT_COLOR}"
    ;;
*)
    _ROOT_HOSTPART_COLOR="$YELLOW_1"
    _USER_HOSTPART_COLOR="${_USER_ENVIRONMENT_COLOR}"
    ;;
esac

# SETUP ROOT USER

DATACENTRE_ROOT="\[\033[01;${_ROOT_DATACENTRE_COLOR}m\]$DATACENTRE\[\033[00m\]"
ENVIROMENT_ROOT="\[\033[01;${_ROOT_ENVIRONMENT_COLOR}m\]$ENVIROMENT\[\033[00m\]"
HOSTPART_ROOT="\[\033[01;${_ROOT_HOSTPART_COLOR}m\]\u@$HOSTPART\[\033[00m\]"

# SETUP OTHER USERS

DATACENTRE_USER="\[\033[01;${_USER_DATECENTRE_COLOR}m\]$DATACENTRE\[\033[00m\]"
ENVIROMENT_USER="\[\033[01;${_USER_ENVIRONMENT_COLOR}m\]$ENVIROMENT\[\033[00m\]"
HOSTPART_USER="\[\033[01;${_USER_HOSTPART_COLOR}m\]\u@$HOSTPART\[\033[00m\]"

# SET PROMPTS

if [ "`id -u`" -eq 0 ]; then
  PS1="(${DATACENTRE_ROOT} ${ENVIROMENT_ROOT}) ${HOSTPART_ROOT}\[\033[01;34m\] \w #\[\033[00m\] "
else
  PS1="(${DATACENTRE_USER} ${ENVIROMENT_USER}) ${HOSTPART_USER}\[\033[01;34m\] \w $\[\033[00m\] "
fi