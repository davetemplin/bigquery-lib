const DiffMatchPatch = require("diff-match-patch");
const instance = new DiffMatchPatch();
const diffs = instance.diff_main('mouse', 'sofas');
instance.diff_cleanupSemantic(diffs);
console.log(JSON.stringify(diffs));
console.log(instance.diff_levenshtein(diffs));