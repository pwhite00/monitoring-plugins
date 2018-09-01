#!/usr/bin/env bash
#
# - use snmp to get system uptime on a host
#
#
############################################

function usage() {
cat << HERE
  Usage: $0 [target host or IP]

  displays snmp uptime data for targeted device
HERE
}

function pre_flight() {
  # just some basic checks to ensure we have the data we need to continue

  if [[ -z ${TARGET_HOST} ]]; then
    echo "Missing target host"
    exit 3
  fi

  if [[ -z ${SNMP_COMMUNITY} ]]; then
    echo "Missing SNMP Community string"
    exit 3
  fi
}


function get_uptime() {
  # call the target host and return uptime. send error if exit is not 0
 snmpwalk -v 2c -c "${SNMP_COMMUNITY}" "${TARGET_HOST}" sysUpTimeInstance | cut -d '=' -f 2 |sed -e 's/^[[:space:]]*//'
  if [[ $? != 0 ]]; then
    exit 2
  else
    exit 0
  fi
}




while getopts ht:s: OPTION
do
  case ${OPTION} in
    h) usage; exit 0 ;;
    t) TARGET_HOST=${OPTARG} ;;
    s) SNMP_COMMUNITY=${OPTARG} ;;
    *) echo "invalid flag"; usage; exit 3 ;;
  esac
done


pre_flight
get_uptime