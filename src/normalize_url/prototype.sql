CREATE OR REPLACE FUNCTION udf.normalize_url(url STRING, options_json STRING)
RETURNS STRING
LANGUAGE js
AS
"""%s

const options = options_json ? JSON.parse(options_json) : undefined;
return rollup(url, options);
""";