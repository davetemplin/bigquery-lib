const expect = require('chai').expect;
const {BigQuery} = require('@google-cloud/bigquery');
const bigquery = new BigQuery();

describe('decode_uri_component', () => {
    let rows;
    before(async function () {
        [rows] = await bigquery.query('SELECT `bigquery-lib.udf.decode_uri_component`("https%3A%2F%2Fwww.example.com%2F%3Fname%3Dst%C3%A5le%26car%3Dsaab")');
    });
    it('has expected value', () => expect(rows[0].f0_).to.equal('https://www.example.com/?name=ståle&car=saab'));
});