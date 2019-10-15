const fs = require('fs');
const util = require('util');
const script = fs.readFileSync(process.argv[2], 'utf8');
const prototype = fs.readFileSync(process.argv[3], 'utf8');
console.log(util.format(prototype, JSON.stringify(script).slice(1, -3)));