import commonjs from 'rollup-plugin-commonjs';
import resolve from 'rollup-plugin-node-resolve';
import globals from 'rollup-plugin-node-globals';
import builtins from 'rollup-plugin-node-builtins';
import {terser} from 'rollup-plugin-terser';

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
        resolve(),
        terser()
    ]
};