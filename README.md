# bigquery-lib

This is a public library of [BigQuery persistent user-defined functions (UDFs)](https://cloud.google.com/bigquery/docs/reference/standard-sql/data-definition-language#create_function_statement). The goal of this project is to adapt useful algorithms and solutions from the broader Javascript open-source community that add significant value to BigQuery scenarios. Select code is packaged as a persistent UDF and made publically available for general use from any BigQuery query.

Below is a list of UDFs available in this library, all of which are directly callable from any BigQuery query. A link is given for each UDF citing the original source project upon which it is based.

Function | Description | Source
--- | --- | ---
[levenshtein](general/levenshtein/README.md) | Compute a [Levenshtein distance](https://en.wikipedia.org/wiki/Levenshtein_distance) between two strings. Use to determine the degree of similarity between words or sentences. | [js-levenshtein](https://github.com/gustf/js-levenshtein)
[parse_useragent](general/parse_useragent/README.md) | Parses web-browser user-agent strings, breaking them down into components of browser, engine, OS, CPU, and device type/model. | [ua-parser-js](https://github.com/faisalman/ua-parser-js)
[text_diff](general/text_diff/README.md) | Creates a textual diff-analysis that can be used to analyze differences between strings, highlight before/after changes, or to create a textual patch between two similar documents. | [diff-match-patch](https://github.com/JackuB/diff-match-patch)
[text_patch](general/text_patch/README.md) | Applies a textual patch to transform one string into another. Useful for restoring copies of highly similar documents, for example different revisions of a document or code file. The patch can be created by calling **text_diff**. | [diff-match-patch](https://github.com/JackuB/diff-match-patch)

## FAQ

**Is there an additional charge for using UDFs?**<br>
No, there are no additional charges for running UDFs on top of the regular data processing costs. So there is no additional cost overhead to using UDFs.

**My query is taking a lot longer now, is the UDF slowing it down?**<br>
Probably. Queries that make use of UDFs may run substantially slower, depending on the amount of data to be processed and the algorithmic complexity of the UDF itself.

**How does billing work when using a UDF from another project? Which project is billed?**<br>
Billing is charged to the project from which a query is run.

**Are there any other limits to using UDFs?**<br>
The amount of data output by a UDF is limited to approximately 5 MB per row. See [UDF limits]( https://cloud.google.com/bigquery/quotas#udf_limits) for more info.



Can you add support for moment?

What about cheerio and jsdom for parsing HTML content?



Pull requests and suggestions for additional UDFs are always welcome!