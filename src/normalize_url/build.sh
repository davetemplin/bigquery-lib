#!/bin/bash
npx rollup -c
node ../common/build a.out prototype.sql > ../../udf/normalize_url.sql
