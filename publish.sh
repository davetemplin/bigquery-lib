#!/bin/bash
if [[ $# -eq 0 ]] ; then
    echo 'function name not specified'
    exit 1
fi
cat udf/$1.sql | bq query --use_legacy_sql=false --project_id=bigquery-lib
