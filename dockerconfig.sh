#!/bin/bash
# Postgres Config
# https://stackoverflow.com/questions/3466166/how-to-check-if-running-in-cygwin-mac-or-linux
unameOut="$(uname -s)"
case "${unameOut}" in
	Linux*)     export DOCKERHOSTIP="$(ifconfig eth0 | grep 'inet ' | awk -F'[: ]+' '{ print $4 }')";;
	Darwin*)    export DOCKERHOSTIP="$(ifconfig en0 | grep 'inet ' | awk -F'[: ]+' '{ print $2 }')";;
esac
printf "HOST: %s\n" "${DOCKERHOSTIP}"
