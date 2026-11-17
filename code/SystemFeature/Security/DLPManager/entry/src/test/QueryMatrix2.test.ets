/*
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { FileKind } from '../main/ets/core/FileKindCore';
import { FileEntry, KindCount, QueryOptions, QueryResult, SortField, TextSpan, countByKind,
  distinctKinds, filterEntries, findEntryById, highlight, matchesKeyword, matchesOptions, queryEntries,
  sortEntries } from '../main/ets/core/FileQueryCore';

function item(id: string, name: string, kind: FileKind, size: number, modified: number, isDlp: boolean,
  isFavorite: boolean): FileEntry {
  return new FileEntry(id, name, 'file:///docs/' + name, kind, size, modified, isDlp, isFavorite);
}

function sample(): FileEntry[] {
  return [
    item('1', 'delta.txt', FileKind.TEXT, 300, 3000, false, false),
    item('2', 'beta.docx', FileKind.DOCUMENT, 100, 1000, true, false),
    item('3', 'alpha.png', FileKind.IMAGE, 500, 2000, false, true),
    item('4', 'gamma.docx', FileKind.DOCUMENT, 100, 4000, true, true)
  ];
}

function idsOf(values: FileEntry[]): string {
  const parts: string[] = [];
  for (let index = 0; index < values.length; index++) {
    parts.push(values[index].id);
  }
  return parts.join('|');
}

function spansText(values: TextSpan[]): string {
  const parts: string[] = [];
  for (let index = 0; index < values.length; index++) {
    parts.push(values[index].text);
  }
  return parts.join('|');
}

function matchedText(values: TextSpan[]): string {
  const parts: string[] = [];
  for (let index = 0; index < values.length; index++) {
    if (values[index].matched) {
      parts.push(values[index].text);
    }
  }
  return parts.join('|');
}

export default function queryMatrix2Test(): void {
  describe('QueryMatrix2Test', () => {
    /**
     * @tc.number    SUB_DLP_MANAGER_QUERYMATRIX2_0001
     * @tc.name      testSortSizeTie0001
     * @tc.desc      equal sizes fall back to id ordering
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSortSizeTie0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const sorted: FileEntry[] = sortEntries(sample(), SortField.SIZE, false);
      expect(idsOf(sorted)).assertEqual('2|4|1|3');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_QUERYMATRIX2_0002
     * @tc.name      testSortKindTie0002
     * @tc.desc      kind ties are ordered by name
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSortKindTie0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const sorted: FileEntry[] = sortEntries(sample(), SortField.KIND, false);
      expect(idsOf(sorted)).assertEqual('1|2|4|3');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_QUERYMATRIX2_0003
     * @tc.name      testSortNameTie0003
     * @tc.desc      equal names fall back to id ordering
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSortNameTie0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const entries: FileEntry[] = [
        item('z', 'same.txt', FileKind.TEXT, 1, 1, false, false),
        item('a', 'same.txt', FileKind.TEXT, 1, 1, false, false)
      ];
      expect(idsOf(sortEntries(entries, SortField.NAME, false))).assertEqual('a|z');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_QUERYMATRIX2_0004
     * @tc.name      testSortDescTie0004
     * @tc.desc      descending ties still use ascending ids
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSortDescTie0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const entries: FileEntry[] = [
        item('b', 'x.txt', FileKind.TEXT, 5, 1, false, false),
        item('a', 'y.txt', FileKind.TEXT, 5, 1, false, false)
      ];
      expect(idsOf(sortEntries(entries, SortField.SIZE, true))).assertEqual('a|b');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_QUERYMATRIX2_0005
     * @tc.name      testFilterExactSize0005
     * @tc.desc      equal min and max size act as an exact match
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFilterExactSize0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const options: QueryOptions = new QueryOptions();
      options.minSize = 100;
      options.maxSize = 100;
      expect(idsOf(filterEntries(sample(), options))).assertEqual('2|4');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_QUERYMATRIX2_0006
     * @tc.name      testFilterZeroSize0006
     * @tc.desc      zero minimums are applied
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFilterZeroSize0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const options: QueryOptions = new QueryOptions();
      options.minSize = 0;
      expect(filterEntries(sample(), options).length).assertEqual(4);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_QUERYMATRIX2_0007
     * @tc.name      testFilterNegativeBounds0007
     * @tc.desc      negative bounds are treated as unset
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFilterNegativeBounds0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const options: QueryOptions = new QueryOptions();
      options.minSize = -10;
      options.maxSize = -1;
      options.fromSec = -5;
      options.toSec = -5;
      expect(filterEntries(sample(), options).length).assertEqual(4);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_QUERYMATRIX2_0008
     * @tc.name      testKeywordSpaces0008
     * @tc.desc      extra spaces in keywords are ignored
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeywordSpaces0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(matchesKeyword(item('1', 'delta.docx', FileKind.DOCUMENT, 1, 1, false, false), '  delta   docx  '))
        .assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_QUERYMATRIX2_0009
     * @tc.name      testKeywordOrder0009
     * @tc.desc      token order does not matter
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeywordOrder0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const entry: FileEntry = item('1', 'delta.docx', FileKind.DOCUMENT, 1, 1, false, false);
      expect(matchesKeyword(entry, 'docx delta')).assertTrue();
      expect(matchesKeyword(entry, 'delta docx')).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_QUERYMATRIX2_0010
     * @tc.name      testKeywordPathName0010
     * @tc.desc      keywords match the full stored name including paths
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeywordPathName0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const entry: FileEntry = item('1', 'docs/a.txt', FileKind.TEXT, 1, 1, false, false);
      expect(matchesKeyword(entry, 'docs')).assertTrue();
      expect(matchesKeyword(entry, 'a.txt')).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_QUERYMATRIX2_0011
     * @tc.name      testHighlightDuplicateTokens0011
     * @tc.desc      duplicate keyword tokens merge into one span
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testHighlightDuplicateTokens0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const spans: TextSpan[] = highlight('abcdef', 'cd cd');
      expect(matchedText(spans)).assertEqual('cd');
      expect(spansText(spans)).assertEqual('ab|cd|ef');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_QUERYMATRIX2_0012
     * @tc.name      testHighlightAdjacentTokens0012
     * @tc.desc      adjacent keyword tokens merge into one span
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testHighlightAdjacentTokens0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const spans: TextSpan[] = highlight('abcd', 'ab bc');
      expect(spansText(spans)).assertEqual('abc|d');
      expect(matchedText(spans)).assertEqual('abc');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_QUERYMATRIX2_0013
     * @tc.name      testHighlightFullText0013
     * @tc.desc      whole text matches produce one matched span
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testHighlightFullText0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const spans: TextSpan[] = highlight('年度报告', '年度报告');
      expect(spans.length).assertEqual(1);
      expect(spans[0].matched).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_QUERYMATRIX2_0014
     * @tc.name      testHighlightEmptyText0014
     * @tc.desc      empty text with keywords yields one empty span
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testHighlightEmptyText0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const spans: TextSpan[] = highlight('', 'abc');
      expect(spans.length).assertEqual(1);
      expect(spans[0].text).assertEqual('');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_QUERYMATRIX2_0015
     * @tc.name      testQueryOffsetMatrix0015
     * @tc.desc      offsets and limits select consistent slices
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testQueryOffsetMatrix0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const first: QueryOptions = new QueryOptions();
      first.limit = 2;
      const second: QueryOptions = new QueryOptions();
      second.offset = 2;
      second.limit = 2;
      const third: QueryOptions = new QueryOptions();
      third.offset = 3;
      third.limit = 5;
      expect(idsOf(queryEntries(sample(), first).items)).assertEqual('3|2');
      expect(idsOf(queryEntries(sample(), second).items)).assertEqual('1|4');
      expect(queryEntries(sample(), third).items.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_QUERYMATRIX2_0016
     * @tc.name      testQueryZeroLimit0016
     * @tc.desc      zero limits return every remaining item
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testQueryZeroLimit0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const options: QueryOptions = new QueryOptions();
      options.offset = 2;
      options.limit = 0;
      const result: QueryResult = queryEntries(sample(), options);
      expect(result.items.length).assertEqual(2);
      expect(result.hasMore).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_QUERYMATRIX2_0017
     * @tc.name      testQueryLookupOrder0017
     * @tc.desc      query results follow the default name order
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testQueryLookupOrder0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(idsOf(queryEntries(sample(), new QueryOptions()).items)).assertEqual('3|2|1|4');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_QUERYMATRIX2_0018
     * @tc.name      testCountUnknownOrder0018
     * @tc.desc      unknown kinds are counted after known kinds
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountUnknownOrder0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const counts: KindCount[] = countByKind([
        item('1', 'a.xyz', FileKind.UNKNOWN, 1, 1, false, false),
        item('2', 'b.zip', FileKind.ARCHIVE, 1, 1, false, false),
        item('3', 'c.txt', FileKind.TEXT, 1, 1, false, false)
      ]);
      expect(counts[0].kind).assertEqual(FileKind.TEXT);
      expect(counts[2].kind).assertEqual(FileKind.UNKNOWN);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_QUERYMATRIX2_0019
     * @tc.name      testCountMultiples0019
     * @tc.desc      counts aggregate repeated kinds
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountMultiples0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const counts: KindCount[] = countByKind(sample());
      expect(counts[1].kind).assertEqual(FileKind.DOCUMENT);
      expect(counts[1].count).assertEqual(2);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_QUERYMATRIX2_0020
     * @tc.name      testDistinctOrder0020
     * @tc.desc      distinct kinds follow the count order
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDistinctOrder0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const kinds: FileKind[] = distinctKinds(sample());
      expect(kinds.length).assertEqual(3);
      expect(kinds[0]).assertEqual(FileKind.TEXT);
      expect(kinds[2]).assertEqual(FileKind.IMAGE);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_QUERYMATRIX2_0021
     * @tc.name      testFindFirst0021
     * @tc.desc      identifier lookups return the first match
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFindFirst0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const entries: FileEntry[] = [
        item('1', 'first.txt', FileKind.TEXT, 1, 1, false, false),
        item('1', 'second.txt', FileKind.TEXT, 1, 1, false, false)
      ];
      const found: FileEntry | null = findEntryById(entries, '1');
      expect(found !== null).assertTrue();
      if (found !== null) {
        expect(found.name).assertEqual('first.txt');
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_QUERYMATRIX2_0022
     * @tc.name      testFindMissing0022
     * @tc.desc      missing identifiers return null
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFindMissing0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(findEntryById(sample(), '99')).assertNull();
      expect(findEntryById([], '1')).assertNull();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_QUERYMATRIX2_0023
     * @tc.name      testOptionsCombined0023
     * @tc.desc      favorite dlp and kind filters combine
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testOptionsCombined0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const options: QueryOptions = new QueryOptions();
      options.onlyDlp = true;
      options.onlyFavorite = true;
      options.kinds = [FileKind.DOCUMENT];
      expect(idsOf(filterEntries(sample(), options))).assertEqual('4');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_QUERYMATRIX2_0024
     * @tc.name      testFilterTimeSingle0024
     * @tc.desc      single time bounds are applied
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFilterTimeSingle0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const fromOnly: QueryOptions = new QueryOptions();
      fromOnly.fromSec = 3000;
      const toOnly: QueryOptions = new QueryOptions();
      toOnly.toSec = 1500;
      expect(idsOf(filterEntries(sample(), fromOnly))).assertEqual('1|4');
      expect(idsOf(filterEntries(sample(), toOnly))).assertEqual('2');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_QUERYMATRIX2_0025
     * @tc.name      testQueryHasMoreBoundary0025
     * @tc.desc      hasMore flips exactly at the end of the list
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testQueryHasMoreBoundary0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const three: QueryOptions = new QueryOptions();
      three.limit = 3;
      const four: QueryOptions = new QueryOptions();
      four.limit = 4;
      expect(queryEntries(sample(), three).hasMore).assertTrue();
      expect(queryEntries(sample(), four).hasMore).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_QUERYMATRIX2_0026
     * @tc.name      testEmptyHighlight0026
     * @tc.desc      empty text and keyword produce one empty span
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEmptyHighlight0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const spans: TextSpan[] = highlight('', '');
      expect(spans.length).assertEqual(1);
      expect(spans[0].matched).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_QUERYMATRIX2_0027
     * @tc.name      testMatchesOptionsDlpOnly0027
     * @tc.desc      dlp only filters match encrypted entries
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMatchesOptionsDlpOnly0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const options: QueryOptions = new QueryOptions();
      options.onlyDlp = true;
      expect(matchesOptions(item('1', 'a.txt', FileKind.TEXT, 1, 1, true, false), options)).assertTrue();
      expect(matchesOptions(item('2', 'b.txt', FileKind.TEXT, 1, 1, false, false), options)).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_QUERYMATRIX2_0028
     * @tc.name      testQueryEmptyOptions0028
     * @tc.desc      empty entries remain empty through paging
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testQueryEmptyOptions0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const options: QueryOptions = new QueryOptions();
      options.limit = 5;
      options.offset = 2;
      expect(queryEntries([], options).items.length).assertEqual(0);
    })
  });
}
