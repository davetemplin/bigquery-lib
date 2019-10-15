CREATE OR REPLACE FUNCTION udf.parse_url(url STRING)
RETURNS STRUCT<
  scheme STRING,
  authority STRING,
  domain STRING,
  username STRING,
  password STRING,
  port STRING,
  path STRING,
  query STRING,
  fragment STRING
>
LANGUAGE js
AS
"""%s
const result = rollup.parse(url, true);
return {
    scheme: result.protocol ? result.protocol.slice(0, -1) : undefined,
    authority: result.host,
    domain: result.hostname,
    username: result.auth ? result.auth.split(':')[0] : undefined,
    password: result.auth ? result.auth.split(':')[1] : undefined,
    port: result.port,
    path: result.pathname,
    query: result.search,
    fragment: result.hash
};
""";