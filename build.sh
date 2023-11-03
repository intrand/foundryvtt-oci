#!/bin/bash

if [ -z "${1:+set}" ]; then
	printf "Specify a version as the first argument. eg: ${BASH_SOURCE[0]} 11.314\n" 1>&2;
	exit 1;
fi;

if ! command -v 7za &>/dev/null; then
	printf "Could not locate command 7za. Make sure p7zip is installed and try again.\n" 1>&2;
	exit 1;
fi;

if ! command -v docker &>/dev/null; then
	printf "Could not locate command docker. Make sure docker.io is installed and try again.\n" 1>&2;
	exit 1;
fi;

version="${1}";
dir="${BASH_SOURCE[0]%/*}";
dist="${dir}/dist";

rm -rf "${dist}" &&
7za x "${dir}/FoundryVTT-${version}.zip" -o"${dist}" &&
docker image rm "foundryvtt:${version}";
docker build -t "foundryvtt:${version}" .;
exit ${?};
