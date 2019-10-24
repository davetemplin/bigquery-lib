CREATE OR REPLACE FUNCTION udf.decode_uri(uri STRING)
RETURNS STRING
LANGUAGE js
AS
"""
return decodeURI(uri);
""";