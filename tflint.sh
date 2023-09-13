#!/bin/bash

set -e
set -x

tflint --init
tflint --recursive --config "$(pwd)/.tflint.hcl"