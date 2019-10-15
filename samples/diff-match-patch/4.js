const source = 'We are building a religion';
const target = 'We are building it bigger';

const DiffMatchPatch = require("diff-match-patch");
const instance = new DiffMatchPatch();

const diffs = instance.diff_main(source, target);
instance.diff_cleanupSemantic(diffs);
console.log('diffs', JSON.stringify(diffs));

const patches = instance.patch_make(diffs);
console.log('patches', JSON.stringify(patches));
console.log(instance.patch_apply(patches, source));