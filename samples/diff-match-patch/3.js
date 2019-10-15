const source = 'We are building a religion';
const target = 'We are building it bigger';

const DiffMatchPatch = require("diff-match-patch");
const instance = new DiffMatchPatch();
const patches = instance.patch_make(source, target);
console.log(JSON.stringify(patches));