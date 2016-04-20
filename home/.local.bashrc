#!/bin/bash

export GOPATH=${HOME}
export CDPATH=.:${GOPATH//://src:}/src:$CDPATH
export PATH=${GOROOT}/bin:${GOPATH//://bin:}/bin:$PATH

export GIT_CEILING_DIRECTORIES=${HOME}/src:${HOME}/build

