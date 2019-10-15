#!/bin/bash
npx rollup -c
node ../common/build a.out prototype.sql > ../../udf/parse_url.sql
