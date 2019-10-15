#!/bin/bash
npx rollup -c
node ../common/build a.out prototype.sql > ../../udf/levenshtein.sql
