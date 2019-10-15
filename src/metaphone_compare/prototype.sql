CREATE OR REPLACE FUNCTION udf.metaphone_compare(source STRING, target STRING)
RETURNS BOOLEAN
LANGUAGE js
AS
"""%s

if (!source || !target)
    return false;
const x = rollup(source);
const y = rollup(target);
return x[0] === y[0] || x[0] === y[1] || x[1] === y[1];
""";