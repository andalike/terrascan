#!/bin/bash

set +e
chmod +x ${WORKSPACE}/tools/tfsec
# Full path to tfsec executable
TFSEC_EXECUTABLE="${WORKSPACE}/tools/tfsec"

# Run tfsec using the full path
$TFSEC_EXECUTABLE --format junit --out tfsec-junit.xml --config-file tfsec.yaml --no-color --include-passed

# Capture the exit status code
echo $? > tfsecstatus.txt
