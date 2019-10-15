#!/bin/bash
npx rollup -c
node ../common/build a.out prototype.sql > ../../udf/metaphone_compare.sql
