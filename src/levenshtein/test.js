const expect = require('chai').expect;
const {BigQuery} = require('@google-cloud/bigquery');
const bigquery = new BigQuery();

describe('levenshtein', () => {
    let rows;
    before(async function () {
        [rows] = await bigquery.query({query: "SELECT `bigquery-lib.udf.levenshtein`('kitten', 'sitting') distance"});
    });

    it('got distance of 3', () => expect(rows[0].distance).to.equal(3));
});