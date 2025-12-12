#!/usr/bin/env bash

# ./tf.sh apply > >(tee -a stdout.log) 2> >(tee -a stderr.log >&2)

# copy or rename sample.tfrc.example and adjust it
TERRAFORM_CONFIG=$(pwd)/sample.tfrc
export TERRAFORM_CONFIG

while getopts 'l' flag; do
  case "${flag}" in
    l)  TF_LOG=TRACE
        export TF_LOG
      ;;
    *) echo "only flag 'l' is known"
       exit 1 ;;
  esac
done

terraform "$1"
