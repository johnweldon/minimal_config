#!/bin/bash

tfile=$(mktemp)

go get -u -insecure ... 2>&1 | tee ${tfile}
for bb in $(grep 'ff-only' ${tfile} | sed -e "s/^# cd \(.*\); git pull --ff-only.*$/\1/gp;d"); do
  pushd ${bb}
  git co master
  git pull
  popd
done

rm ${tfile}

