CREATE OR REPLACE FUNCTION udf.color_distance(colors1 ARRAY<STRING>, colors2 ARRAY<STRING>)
RETURNS INT64
LANGUAGE js
AS
"""
function from_hex(value) {
    return 65536 * parseInt(value.substr(1, 2), 16) + 256 * parseInt(value.substr(3, 2), 16) + parseInt(value.substr(5, 2), 16);
}

function rgb_distance(value1, value2) {
    const x = Math.abs(r(value1) - r(value2));
    const y = Math.abs(g(value1) - g(value2));
    const z = Math.abs(b(value1) - b(value2));
    return Math.sqrt(x * x + y * y + z * z);
}

function r(value) {
    return Math.floor((value / 65536) % 256);
}

function g(value) {
    return Math.floor((value / 256) % 256);
}

function b(value) {
    return Math.floor(value % 256);
}

if (colors1.every(color => /^#[0-9a-f]{6}$/i.test(color)) && colors2.every(color => /^#[0-9a-f]{6}$/i.test(color))) {
    colors1 = colors1.filter(color => !!color).map(color => from_hex(color.substr(1)));
    colors2 = colors2.filter(color => !!color).map(color => from_hex(color.substr(1)));

    // if one array is larger than the other, ensure the smaller array is on the left
    if (colors1.length > colors2.length) {
        var tmp = colors1;
        colors1 = colors2;
        colors2 = tmp;
    }

    let result = 0;
    for (let i = 0; i < colors1.length; ++i) {
        const color1 = colors1[i];
        colors2.sort((a, b) => rgb_distance(a, color1) - rgb_distance(b, color1));
        const color2 = colors2.shift();
        if (color2)
            result += rgb_distance(color1, color2);
    }

    return Math.round(result);
}
""";