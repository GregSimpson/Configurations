# !/bin/bash

env|grep MON; env|grep POST; env|grep RUNTIME; env|grep DEBUG

## This script copies things back to localhost
./CopyAndCommit_noderedFiles.sh

## This script replaces mongo and postgres references with TOKENS to be replaced
./Prepare_Flows_File.sh

