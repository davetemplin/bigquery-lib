CREATE OR REPLACE FUNCTION udf.validate_url(url STRING)
RETURNS BOOLEAN
AS
(
  REGEXP_CONTAINS(TRIM(url), r"(?i)^(?:(?:https?|ftp)://)(?:\S+(?::\S*)?@)?(?:(?:[1-9]\d?|1\d\d|2[01]\d|22[0-3])(?:\.(?:1?\d{1,2}|2[0-4]\d|25[0-5])){2}(?:\.(?:[1-9]\d?|1\d\d|2[0-4]\d|25[0-4]))|(?:(?:[a-z\x{00a1}-\x{ffff}0-9_]+-*)*[a-z\x{00a1}-\x{ffff}0-9]+)(?:\.(?:[a-z\x{00a1}-\x{ffff}0-9_]+-*)*[a-z\x{00a1}-\x{ffff}0-9]+)*(?:\.(?:[a-z\x{00a1}-\x{ffff}0-9-]{2,})))(?::\d{2,5})?(?:/[^/?#]*)*(?:\?[^#]*)?(?:#.*)?$")
);