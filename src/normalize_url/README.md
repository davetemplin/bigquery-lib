# normalize_url
Useful when you need to display, store, deduplicate, sort, compare, etc, URLs.


## ``` `bigquery-lib.udf.normalize_url`(url, options) ```

## Example
```
SELECT `bigquery-lib.udf.normalize_url`("example.com", NULL);
```


## Function Specification

``` `bigquery-lib.udf.normalize_url`(url, options) ```

### Parameters

Parameter | Type    | Description
--------- | ------- | ---
url       | STRING  | URL to normalize.

### Returns
Returns a string containing the normalized url.


## Reference
