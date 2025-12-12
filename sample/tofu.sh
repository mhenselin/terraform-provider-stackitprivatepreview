#!/usr/bin/env bash

# ./tofu.sh apply > >(tee -a stdout.log) 2> >(tee -a stderr.log >&2)

# copy or rename sample.tfrc.example and adjust it
TERRAFORM_CONFIG=$(pwd)/sample.tfrc
export TERRAFORM_CONFIG

TF_LOG=TRACE
export TF_LOG

tofu "$1"
