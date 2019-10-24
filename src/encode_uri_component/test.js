const expect = require('chai').expect;
const {BigQuery} = require('@google-cloud/bigquery');
const bigquery = new BigQuery();

describe('encode_uri_component', () => {
    let rows;
    before(async function () {
        [rows] = await bigquery.query('SELECT `bigquery-lib.udf.encode_uri_component`("https://www.example.com/?name=ståle&car=saab")');
    });
    it('has expected value', () => expect(rows[0].f0_).to.equal('https%3A%2F%2Fwww.example.com%2F%3Fname%3Dst%C3%A5le%26car%3Dsaab'));
});