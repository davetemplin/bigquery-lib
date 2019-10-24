const expect = require('chai').expect;
const {BigQuery} = require('@google-cloud/bigquery');
const bigquery = new BigQuery();

describe('parse_useragent', () => {
    let rows;
    before(async function () {
        [rows] = await bigquery.query({query: `
            SELECT \`bigquery-lib.udf.parse_useragent\`(ua) result
            FROM UNNEST([
                'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36 Edge/12.246',
                'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_2) AppleWebKit/601.3.9 (KHTML, like Gecko) Version/9.0.2 Safari/601.3.9',
                'Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1'
            ]) ua;
        `});
    });

    it('got 3 rows', () => expect(rows).to.have.lengthOf(3));
    it('row #1 is "Edge 12.246 on Windows 10"', () => expect(`${rows[0].result.browser.name} ${rows[0].result.browser.version} on ${rows[0].result.os.name} ${rows[0].result.os.version}`).to.equal('Edge 12.246 on Windows 10'));
    it('row #2 is "Safari 9.0.2 on Mac OS 10.11.2"', () => expect(`${rows[1].result.browser.name} ${rows[1].result.browser.version} on ${rows[1].result.os.name} ${rows[1].result.os.version}`).to.equal('Safari 9.0.2 on Mac OS 10.11.2'));
    it('row #3 is "Mobile Safari 11.0 on iOS 11.0"', () => expect(`${rows[2].result.browser.name} ${rows[2].result.browser.version} on ${rows[2].result.os.name} ${rows[2].result.os.version}`).to.equal('Mobile Safari 11.0 on iOS 11.0'));
});