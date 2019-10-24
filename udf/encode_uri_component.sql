CREATE OR REPLACE FUNCTION udf.encode_uri_component(uri STRING)
RETURNS STRING
LANGUAGE js
AS
"""
return encodeURIComponent(uri);
""";