CREATE OR REPLACE FUNCTION udf.parse_useragent(useragent STRING)
RETURNS STRUCT<
    ua STRING,
    browser STRUCT<
        name STRING,
        version STRING
    >,
    engine STRUCT<
        name STRING,
        version STRING
    >,
    os STRUCT<
        name STRING,
        version STRING
    >,
    device STRUCT<
        model STRING,
        type STRING,
        vendor STRING
    >,
    cpu STRUCT<
        architecture STRING
    >
>
LANGUAGE js
AS
"""%s
return rollup(useragent);
""";