# levenshtein

Compute a [Levenshtein distance](https://en.wikipedia.org/wiki/Levenshtein_distance) between two strings, for example to determine the degree of similarity between a pair of words or a sequence of words.


## ``` `bigquery-lib.udf.levenshtein`(source, target) ```

## Example
```
SELECT source, target, `bigquery-lib.udf.levenshtein`(source, target) distance
FROM UNNEST([
  STRUCT("analyze" AS source, "analyse" AS target),
  STRUCT("opossum", "possum"),
  STRUCT("potatoe", "potatoe"),
  STRUCT("while", "whilst"),
  STRUCT("aluminum", "alumininium"),
  STRUCT("We are building a religion", "We are building it bigger"),
  STRUCT("We are building a religion", "A limited edition")
]);
```

Row | source | target | distance
--- | --- | --- | ---
1 |	analyze | analyse | 1
2 | opossum | possum | 1
3 | potatoe | potatoe | 0
4 | while | whilst | 2
5 | aluminum | alumininium| 3
6 | We are building a religion | We are building it bigger | 8
7 | We are building a religion | A limited edition | 17


## Function Specification

``` `bigquery-lib.udf.levenshtein`(source, target) ```

### Parameters

Parameter | Type    | Description
--------- | ------- | ---
source    | STRING  | The source string to compare.
target    | STRING  | The target string to compare.

### Returns
An integer indicating the Levenshtein distance between the source and target strings.


## Reference

[js-levenshtein](https://github.com/gustf/js-levenshtein)<br>
by: Gustaf Andersson<br>
version: 1.1.6<br>
published: 2019-01-10
