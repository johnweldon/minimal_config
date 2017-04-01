#!/bin/bash

export TZ='America/Los_Angeles'

export GOROOT=/usr/local/go
export PATH=${GOROOT}/bin:${PATH}

export GOPATH=$(go env GOPATH)
export CDPATH=.:${GOPATH//://src:}/src:${CDPATH}
export PATH=${GOPATH//://bin:}/bin:${PATH}

export GIT_CEILING_DIRECTORIES=${HOME}
