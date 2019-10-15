# text_diff

Computes a series of text differences producing a textual transformation between a pair of strings.

## ``` `bigquery-lib.udf.text_diff`(source, target, options) ```

## Example
```
SELECT misquote, quote, `bigquery-lib.udf.text_diff`(misquote, quote, NULL) result
FROM UNNEST([
  STRUCT("Luke, I am your father." AS misquote, "No. I am your father." AS quote),
  STRUCT("What we've got here is failure to communicate.", "What we've got here is failure to communicate."),
  STRUCT("Toto, I don't think we're in Kansas anymore.", "Toto, I've a feeling we're not in Kansas anymore."),
  STRUCT("Play it again, Sam.", "Play it, Sam. Play 'As Time Goes By'."),
  STRUCT("Greed is good.", "The point is, ladies and gentleman, that greed, for lack of a better word, is good. Greed is right, greed works.")
]);
```

Row | `misquote` | `quote` | `result.diffs` | `result.distance`
--- | --- | --- | --- | ---
1 | Luke, I am your father. | No. I am your father. | [[-1,"Luke,"],[1,"No."],[0," I am your father."]] | 5
2 | What we've got here is failure to communicate. | What we've got here is failure to communicate. | [[0,"What we've got here is failure to communicate."]] | 0
3 | Toto, I don't think we're in Kansas anymore. | Toto, I've a feeling we're not in Kansas anymore. | [[0,"Toto, I"],[-1," don't th"],[1,"'ve a feel"],[0,"in"],[-1,"k"],[1,"g"],[0," we're "],[1,"not "],[0,"in Kansas anymore."]] | 15
4 | Play it again, Sam. | Play it, Sam. Play 'As Time Goes By'. | [[0,"Play it"],[-1," again, Sam"],[1,", Sam. Play 'As Time Goes By'"],[0,"."]] | 29
5 | Greed is good. | The point is, ladies and gentleman, that greed, for lack of a better word, is good. Greed is right, greed works. | [[-1,"Greed is good"],[1,"The point is, ladies and gentleman, that greed, for lack of a better word, is good. Greed is right, greed works"],[0,"."]] | 111

> Certain columns omitted for brievity.


## Function Specification

``` `bigquery-lib.udf.text_diff`(source, target, options) ```

### Parameters

Parameter | Type    | Description
--------- | ------- | ---
source    | STRING  | The source string for the text transformation.
target    | STRING  | The target sting for the text transformation.
options   | STRING  | Specifies options for performing the transformation. See *Options* below for more information, or pass null for default options.

### Returns
```
STRUCT<
    diffs STRING,
    html STRING,
    distance INT64,
    patches STRING,
    gnu_patch STRING
>
```

### Options
Specifies valid options for performing the text transformation, passed in a stringified JSON object.

Example: ```SELECT `bigquery-lib.udf.text_diff`('going', 'gone', '{"include":["html","distance"],"cleanup":null,"Match_Distance":10}')```

Option | Default | Description
--- | --- | ---
include | *all* | Determines which attributes to include in the output. Valid options are `['diffs', 'distance', 'html', 'patches', 'gnu_patch']`. All outputs are included by default. Omit unused outputs to use to reduce processing.
cleanup | `"semantic"` | Specify `"semantic"` to optimize for human-readbility (which is the default), `"efficiency"` to optimize for machine-processing, or `null` to perform no optimization.
Diff_Timeout | `1.0` | Number of seconds to map a diff before giving up (0 for infinity).
Diff_EditCost | `4` | Cost of an empty edit operation in terms of edit characters.
Match_Threshold | `0.5` | At what point is no match declared (0.0 = perfection, 1.0 = very loose).
Match_Distance | `1000` | How far to search for a match (0 = exact location, 1000+ = broad match). A match this many characters away from the expected location will add 1.0 to the score (0.0 is a perfect match).
Match_MaxBits | `32` | The number of bits in an int. *Bitwise operations in BigQuery UDFs handle only the most significant 32 bits. [(more info)](https://cloud.google.com/bigquery/quotas)*
Patch_DeleteThreshold | `0.5` | When deleting a large block of text (over ~64 characters), how close do the contents have to be to match the expected contents. (0.0 = perfection, 1.0 = very loose). Note that Match_Threshold controls how closely the end points of a delete need to match.
Patch_Margin | `4` | Chunk size for context length.
checklines | `true` | Optional speedup flag. If present and false, then don't run a line-level diff first to identify the changed areas. Defaults to true, which does a faster, slightly less optimal diff.

> For a more in-depth explanation of the above options, reader is referred to [the code](https://github.com/JackuB/diff-match-patch/blob/master/index.js).


## Reference

[diff-match-patch](https://github.com/JackuB/diff-match-patch)<br>
by: Neil Fraser (Google)<br>
version: 1.0.4<br>
published: 2018-09-04
