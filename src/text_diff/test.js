const expect = require('chai').expect;
const {BigQuery} = require('@google-cloud/bigquery');
const bigquery = new BigQuery();

describe('text_diff', () => {
    let rows;
    before(async function () {
        [rows] = await bigquery.query({query: `
            SELECT misquote, quote, \`bigquery-lib.udf.text_diff\`(misquote, quote, NULL) result
            FROM UNNEST([
                STRUCT("Luke, I am your father." AS misquote, "No. I am your father." AS quote),
                STRUCT("What we've got here is failure to communicate.", "What we've got here is failure to communicate."),
                STRUCT("Toto, I don't think we're in Kansas anymore.", "Toto, I've a feeling we're not in Kansas anymore."),
                STRUCT("Play it again, Sam.", "Play it, Sam. Play 'As Time Goes By'."),
                STRUCT("Greed is good.", "The point is, ladies and gentleman, that greed, for lack of a better word, is good. Greed is right, greed works.")
            ]);
        `});
    });

    it('got 5 rows', () => expect(rows).to.have.lengthOf(5));
    it('row #1 has 3 diffs', () => expect(JSON.parse(rows[0].result.diffs)).to.have.lengthOf(3));
    it('row #2 has 1 diff', () => expect(JSON.parse(rows[1].result.diffs)).to.have.lengthOf(1));
    it('row #3 has 9 diffs', () => expect(JSON.parse(rows[2].result.diffs)).to.have.lengthOf(9));
    it('row #4 has 4 diffs', () => expect(JSON.parse(rows[3].result.diffs)).to.have.lengthOf(4));
    it('row #5 has 3 diffs', () => expect(JSON.parse(rows[4].result.diffs)).to.have.lengthOf(3));

    it('row #1 has distance 5', () => expect(rows[0].result.distance).to.eql(5));
    it('row #2 has distance 0', () => expect(rows[1].result.distance).to.eql(0));
    it('row #3 has distance 15', () => expect(rows[2].result.distance).to.eql(15));
    it('row #4 has distance 29', () => expect(rows[3].result.distance).to.eql(29));
    it('row #5 has distance 111', () => expect(rows[4].result.distance).to.eql(111));

    it('row #1 diffs are correct', () => expect(rows[0].result.diffs).to.eql(`[[-1,"Luke,"],[1,"No."],[0," I am your father."]]`));
    it('row #1 patches are correct', () => expect(rows[0].result.patches).to.eql(`[{"diffs":[[-1,"Luke,"],[1,"No."],[0," I a"]],"start1":0,"start2":0,"length1":9,"length2":7}]`));
    it('row #2 patches are correct', () => expect(rows[1].result.patches).to.eql(`[]`));
    it('row #2 html is correct', () => expect(rows[1].result.html).to.eql(`<span>What we've got here is failure to communicate.</span>`));
    it('row #5 gnu_patch is correct', () => expect(rows[4].result.gnu_patch.startsWith(`@@ -1,14 +1,112 @@`)).to.be.true);
});