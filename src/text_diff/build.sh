#!/bin/bash
npx rollup -c
node ../common/build a.out prototype.sql > ../../udf/text_diff.sql
