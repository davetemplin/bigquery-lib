CREATE OR REPLACE FUNCTION udf.encode_uri(uri STRING)
RETURNS STRING
LANGUAGE js
AS
"""
return encodeURI(uri);
""";