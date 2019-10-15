CREATE OR REPLACE FUNCTION udf.text_diff(text1 STRING, text2 STRING, options_json STRING)
RETURNS STRUCT<
    diffs STRING,
    patches STRING,
    html STRING,
    distance INT64,
    gnu_patch STRING
>
LANGUAGE js
AS
"""%s

const instance = new rollup();

const options = {
    cleanup: 'semantic',
    include: ['diffs', 'distance', 'html', 'patches', 'gnu_patch']
};
if (options_json) {
    try {
        Object.assign(options, JSON.parse(options.json));
        Object.assign(instance, options);
    }
    catch (err) {
        return null;
    }
}

const diffs = instance.diff_main(text1, text2, options.checklines);

if (options.cleanup === 'semantic')
    instance.diff_cleanupSemantic(diffs);

if (options.cleanup === 'efficiency')
    instance.diff_cleanupEfficiency(diffs);

const patches = options.include.indexOf('patch') >= 0 || options.include.indexOf('gnu_patch') >= 0 ? instance.patch_make(diffs) : undefined;

return {
    diffs: options.include.indexOf('diffs') >= 0 ? JSON.stringify(diffs) : null,
    patches: options.include.indexOf('patches') >= 0 ? JSON.stringify(patches) : null,
    html: options.include.indexOf('html') >= 0 ? instance.diff_prettyHtml(diffs) : null,
    distance: options.include.indexOf('distance') >= 0 ? instance.diff_levenshtein(diffs) : null,
    gnu_patch: options.include.indexOf('gnu_patch') >= 0 ? instance.patch_toText(patches) : null
};
""";