CREATE OR REPLACE FUNCTION udf.levenshtein(source STRING, target STRING)
RETURNS INT64
LANGUAGE js
AS
"""%s
return rollup(source||'', target||'');
""";