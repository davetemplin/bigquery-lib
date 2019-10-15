CREATE OR REPLACE FUNCTION udf.hamming_distance(hash1 STRING, hash2 STRING)
RETURNS INT64
LANGUAGE js
AS
"""
const hex = /^[0-9a-f]+$/i;
if (hex.test(hash1) && hex.test(hash2) && hash1.length === hash2.length) {
  const bitmap = [0, 1, 1, 2, 1, 2, 2, 3, 1, 2, 2, 3, 2, 3, 3, 4];
  let d = 0;
  for (let i = 0; i < hash1.length; i++) {
      const n1 = parseInt(hash1[i], 16);
      const n2 = parseInt(hash2[i], 16);
      d += bitmap[n1 ^ n2];
  }
  return d;
}
""";