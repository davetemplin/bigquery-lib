# parse_useragent

Parses web-browser user-agent strings, breaking them down into components of browser, engine, OS, CPU, and device type/model.


## ``` `bigquery-lib.udf.parse_useragent`(useragent) ```

## Example
```
SELECT `bigquery-lib.udf.parse_useragent`(ua) result
FROM UNNEST([
  'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36 Edge/12.246',
  'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_2) AppleWebKit/601.3.9 (KHTML, like Gecko) Version/9.0.2 Safari/601.3.9',
  'Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1'
]) ua;
```

Row | `result.ua` | `result.browser.name` | `result.browser.version` | `result.engine.name` | `result.engine.version` | `result.os.name` | `result.os.version` | `result.device.model` | `result.device.type` | `result.device.vendor` | `result.cpu.architecture`
--- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | ---
1 | Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36 Edge/12.246 | Edge | 12.246 | EdgeHTML | 12.246 | Windows | 10 | *null* | *null* | *null* | amd64
2 | Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_2) AppleWebKit/601.3.9 (KHTML, like Gecko) Version/9.0.2 Safari/601.3.9 | Safari | 9.0.2 | WebKit | 601.3.9 | Mac OS | 10.11.2 | *null* | *null* | *null* | *null*
3 | Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1 | Mobile Safari | 11.0 | WebKit | 604.1.38 | iOS | 11.0 | iPhone | mobile | Apple | *null*



## Function Specification

``` `bigquery-lib.udf.parse_useragent`(useragent) ```

### Parameters

Parameter | Type    | Description
--------- | ------- | ---
useragent | STRING  | The useragent string to parse.

### Returns
```
STRUCT<
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
```


## Reference

[ua-parser-js](https://github.com/faisalman/ua-parser-js)<br>
by: Faisal Salman<br>
version: 0.7.20<br>
published: 2019-06-08
