#!/bin/bash

# Thanks to http://blog.yohanliyanage.com/2015/05/docker-clean-up-after-yourself/

docker ps -a -q -f status=exited | xargs docker rm -v

docker images -q -f dangling=true | xargs docker rmi

docker run -v /var/run/docker.sock:/var/run/docker.sock -v /var/lib/docker:/var/lib/docker --rm martin/docker-cleanup-volumes


