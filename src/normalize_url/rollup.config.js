import commonjs from 'rollup-plugin-commonjs';
import resolve from 'rollup-plugin-node-resolve';
import builtins from 'rollup-plugin-node-builtins';
import globals from 'rollup-plugin-node-globals';
import cleanup from 'rollup-plugin-cleanup';
//import {terser} from 'rollup-plugin-terser';

export default {
    input: 'export.js',
    output: {
        name: 'rollup',
        file: 'a.out',
        format: 'iife'
    },
    plugins: [
        commonjs(),
        globals(),
        builtins(),
        resolve({preferBuiltins: false}),
        //resolve(),
        cleanup()
        //terser()
    ]
};