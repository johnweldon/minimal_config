#!/bin/bash

tfile=$(mktemp)

for gp in $(echo ${GOPATH} | tr ':' ' '); do
	echo -e "\nGOPATH ${gp}/src/\n"
	for root in ${gp}/src/*; do
		pth="${root#$gp/src/}/..."
		echo -e "\n getting ${pth}\n"
		go get -v -u ${pth} 2>&1 | tee ${tfile}
		for bb in $(grep 'ff-only' ${tfile} | sed -e "s/^# cd \(.*\); git pull --ff-only.*$/\1/gp;d"); do
			pushd ${bb}
			git co master
			git pull
			popd
		done
	done
done

rm ${tfile}

