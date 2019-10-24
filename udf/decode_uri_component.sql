CREATE OR REPLACE FUNCTION udf.decode_uri_component(uri STRING)
RETURNS STRING
LANGUAGE js
AS
"""
return decodeURIComponent(uri);
""";