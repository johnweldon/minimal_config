#!/bin/bash

# ensure folders
for d in $(find home/ -type d ); do
	v="${HOME}/${d#home/}"
	mkdir -p ${v}
done

# copy files
for f in $(find home/ -type f ); do
	src=${f}
	dst="${HOME}/${f#home/}"
	diff $src $dst
	changed=$?
	if [ $changed -ne 0 ]; then
		cp -b -i $src $dst
	fi
done


# Secure secrets
for d in .ssh .gnupg ; do
	dir="${HOME}/${d}"
	[ -d ${dir} ] && chmod 700 ${dir} && echo "secured ${dir}"
	for f in $(find ${dir} -type f); do
		chmod 600 ${f} && echo "secured ${f}"
	done
done
