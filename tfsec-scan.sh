#!/bin/bash

set +e

tfsec -f junit,default --out tfsec --config-file tfsec.yaml --no-color --include-passed

echo $? > tfsecstatus.txt


