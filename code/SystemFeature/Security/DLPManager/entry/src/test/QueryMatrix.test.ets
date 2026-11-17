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
    item('1', 'Beta.txt', FileKind.TEXT, 300, 3000, false, true),
    item('2', 'alpha.PDF', FileKind.DOCUMENT, 100, 1000, true, false),
    item('3', 'gamma.png', FileKind.IMAGE, 500, 2000, false, false),
    item('4', 'delta.docx', FileKind.DOCUMENT, 200, 4000, true, true)
  ];
}

function idsOf(entries: FileEntry[]): string {
  const parts: string[] = [];
  for (let index = 0; index < entries.length; index++) {
    parts.push(entries[index].id);
  }
  return parts.join('|');
}

function namesOf(entries: FileEntry[]): string {
  const parts: string[] = [];
  for (let index = 0; index < entries.length; index++) {
    parts.push(entries[index].name);
  }
  return parts.join('|');
}

function spansText(spans: TextSpan[]): string {
  const parts: string[] = [];
  for (let index = 0; index < spans.length; index++) {
    parts.push(spans[index].text);
  }
  return parts.join('|');
}

function matchedText(spans: TextSpan[]): string {
  const parts: string[] = [];
  for (let index = 0; index < spans.length; index++) {
    if (spans[index].matched) {
      parts.push(spans[index].text);
    }
  }
  return parts.join('|');
}

export default function queryMatrixTest(): void {
  describe('QueryMatrixTest', () => {
    /**
     * @tc.number    SUB_DLP_MANAGER_QUERYMATRIX_0001
     * @tc.name      testKeywordEmpty0001
     * @tc.desc      empty keywords match every entry
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeywordEmpty0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testKeywordEmpty0001 begin');
      expect(matchesKeyword(sample()[0], '')).assertTrue();
      expect(matchesKeyword(sample()[0], '   ')).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_QUERYMATRIX_0002
     * @tc.name      testKeywordCase0002
     * @tc.desc      keyword matching ignores case
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeywordCase0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testKeywordCase0002 begin');
      expect(matchesKeyword(sample()[1], 'alpha')).assertTrue();
      expect(matchesKeyword(sample()[1], 'PDF')).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_QUERYMATRIX_0003
     * @tc.name      testKeywordTokens0003
     * @tc.desc      every keyword token must match
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeywordTokens0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testKeywordTokens0003 begin');
      expect(matchesKeyword(sample()[3], 'delta docx')).assertTrue();
      expect(matchesKeyword(sample()[3], 'delta pdf')).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_QUERYMATRIX_0004
     * @tc.name      testKeywordChinese0004
     * @tc.desc      chinese keywords match chinese names
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeywordChinese0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testKeywordChinese0004 begin');
      const chinese: FileEntry = item('9', '年度报告.txt', FileKind.TEXT, 1, 1, false, false);
      expect(matchesKeyword(chinese, '年度')).assertTrue();
      expect(matchesKeyword(chinese, '季度')).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_QUERYMATRIX_0005
     * @tc.name      testOptionsDefault0005
     * @tc.desc      default options match every entry
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testOptionsDefault0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testOptionsDefault0005 begin');
      const options: QueryOptions = new QueryOptions();
      const entries: FileEntry[] = sample();
      for (let index = 0; index < entries.length; index++) {
        expect(matchesOptions(entries[index], options)).assertTrue();
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_QUERYMATRIX_0006
     * @tc.name      testOptionsDlp0006
     * @tc.desc      the dlp filter keeps encrypted entries
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testOptionsDlp0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testOptionsDlp0006 begin');
      const options: QueryOptions = new QueryOptions();
      options.onlyDlp = true;
      expect(idsOf(filterEntries(sample(), options))).assertEqual('2|4');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_QUERYMATRIX_0007
     * @tc.name      testOptionsFavorite0007
     * @tc.desc      the favorite filter keeps favorites
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testOptionsFavorite0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testOptionsFavorite0007 begin');
      const options: QueryOptions = new QueryOptions();
      options.onlyFavorite = true;
      expect(idsOf(filterEntries(sample(), options))).assertEqual('1|4');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_QUERYMATRIX_0008
     * @tc.name      testOptionsKinds0008
     * @tc.desc      kind filters accept multiple kinds
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testOptionsKinds0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testOptionsKinds0008 begin');
      const options: QueryOptions = new QueryOptions();
      options.kinds = [FileKind.TEXT, FileKind.IMAGE];
      expect(idsOf(filterEntries(sample(), options))).assertEqual('1|3');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_QUERYMATRIX_0009
     * @tc.name      testOptionsMinSize0009
     * @tc.desc      minimum size is inclusive
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testOptionsMinSize0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testOptionsMinSize0009 begin');
      const options: QueryOptions = new QueryOptions();
      options.minSize = 300;
      expect(idsOf(filterEntries(sample(), options))).assertEqual('1|3');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_QUERYMATRIX_0010
     * @tc.name      testOptionsMaxSize0010
     * @tc.desc      maximum size is inclusive
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testOptionsMaxSize0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testOptionsMaxSize0010 begin');
      const options: QueryOptions = new QueryOptions();
      options.maxSize = 200;
      expect(idsOf(filterEntries(sample(), options))).assertEqual('2|4');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_QUERYMATRIX_0011
     * @tc.name      testOptionsSizeRange0011
     * @tc.desc      size ranges combine both bounds
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testOptionsSizeRange0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testOptionsSizeRange0011 begin');
      const options: QueryOptions = new QueryOptions();
      options.minSize = 100;
      options.maxSize = 300;
      expect(idsOf(filterEntries(sample(), options))).assertEqual('1|2|4');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_QUERYMATRIX_0012
     * @tc.name      testOptionsTimeRange0012
     * @tc.desc      modified time ranges are inclusive
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testOptionsTimeRange0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testOptionsTimeRange0012 begin');
      const options: QueryOptions = new QueryOptions();
      options.fromSec = 2000;
      options.toSec = 3000;
      expect(idsOf(filterEntries(sample(), options))).assertEqual('1|3');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_QUERYMATRIX_0013
     * @tc.name      testOptionsCombined0013
     * @tc.desc      keyword kind and dlp filters combine
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testOptionsCombined0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testOptionsCombined0013 begin');
      const options: QueryOptions = new QueryOptions();
      options.keyword = 'a';
      options.kinds = [FileKind.DOCUMENT];
      options.onlyDlp = true;
      expect(idsOf(filterEntries(sample(), options))).assertEqual('2|4');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_QUERYMATRIX_0014
     * @tc.name      testFilterOrder0014
     * @tc.desc      filtering preserves the source order
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFilterOrder0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testFilterOrder0014 begin');
      expect(namesOf(filterEntries(sample(), new QueryOptions())))
        .assertEqual('Beta.txt|alpha.PDF|gamma.png|delta.docx');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_QUERYMATRIX_0015
     * @tc.name      testFilterNone0015
     * @tc.desc      unmatched filters return empty lists
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFilterNone0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testFilterNone0015 begin');
      const options: QueryOptions = new QueryOptions();
      options.keyword = 'zzz';
      expect(filterEntries(sample(), options).length).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_QUERYMATRIX_0016
     * @tc.name      testSortNameAsc0016
     * @tc.desc      name sorting is case insensitive
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSortNameAsc0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSortNameAsc0016 begin');
      expect(idsOf(sortEntries(sample(), SortField.NAME, false))).assertEqual('2|1|4|3');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_QUERYMATRIX_0017
     * @tc.name      testSortNameDesc0017
     * @tc.desc      descending name sorting reverses the order
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSortNameDesc0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSortNameDesc0017 begin');
      expect(idsOf(sortEntries(sample(), SortField.NAME, true))).assertEqual('3|4|1|2');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_QUERYMATRIX_0018
     * @tc.name      testSortSize0018
     * @tc.desc      size sorting orders by byte count
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSortSize0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSortSize0018 begin');
      expect(idsOf(sortEntries(sample(), SortField.SIZE, false))).assertEqual('2|4|1|3');
      expect(idsOf(sortEntries(sample(), SortField.SIZE, true))).assertEqual('3|1|4|2');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_QUERYMATRIX_0019
     * @tc.name      testSortModified0019
     * @tc.desc      modified sorting orders by timestamp
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSortModified0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSortModified0019 begin');
      expect(idsOf(sortEntries(sample(), SortField.MODIFIED, false))).assertEqual('2|3|1|4');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_QUERYMATRIX_0020
     * @tc.name      testSortKind0020
     * @tc.desc      kind sorting follows the priority order
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSortKind0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSortKind0020 begin');
      expect(idsOf(sortEntries(sample(), SortField.KIND, false))).assertEqual('1|2|4|3');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_QUERYMATRIX_0021
     * @tc.name      testSortTie0021
     * @tc.desc      equal keys fall back to id order
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSortTie0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSortTie0021 begin');
      const entries: FileEntry[] = [
        item('b', 'same.txt', FileKind.TEXT, 1, 1, false, false),
        item('a', 'same.txt', FileKind.TEXT, 1, 1, false, false)
      ];
      expect(idsOf(sortEntries(entries, SortField.NAME, false))).assertEqual('a|b');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_QUERYMATRIX_0022
     * @tc.name      testSortEmpty0022
     * @tc.desc      sorting empty lists is safe
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSortEmpty0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSortEmpty0022 begin');
      expect(sortEntries([], SortField.SIZE, false).length).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_QUERYMATRIX_0023
     * @tc.name      testSortNoMutation0023
     * @tc.desc      sorting does not mutate the source array
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSortNoMutation0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSortNoMutation0023 begin');
      const entries: FileEntry[] = sample();
      sortEntries(entries, SortField.SIZE, false);
      expect(entries[0].id).assertEqual('1');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_QUERYMATRIX_0024
     * @tc.name      testQueryAll0024
     * @tc.desc      default queries return every entry
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testQueryAll0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testQueryAll0024 begin');
      const result: QueryResult = queryEntries(sample(), new QueryOptions());
      expect(result.total).assertEqual(4);
      expect(result.items.length).assertEqual(4);
      expect(result.hasMore).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_QUERYMATRIX_0025
     * @tc.name      testQueryPaging0025
     * @tc.desc      limit and offset page the sorted result set
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testQueryPaging0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testQueryPaging0025 begin');
      const options: QueryOptions = new QueryOptions();
      options.sortField = SortField.SIZE;
      options.offset = 1;
      options.limit = 2;
      const result: QueryResult = queryEntries(sample(), options);
      expect(idsOf(result.items)).assertEqual('4|1');
      expect(result.hasMore).assertTrue();
      expect(result.total).assertEqual(4);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_QUERYMATRIX_0026
     * @tc.name      testQueryLastPage0026
     * @tc.desc      the last page reports no more results
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testQueryLastPage0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testQueryLastPage0026 begin');
      const options: QueryOptions = new QueryOptions();
      options.offset = 3;
      options.limit = 2;
      const result: QueryResult = queryEntries(sample(), options);
      expect(result.items.length).assertEqual(1);
      expect(result.hasMore).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_QUERYMATRIX_0027
     * @tc.name      testQueryBeyond0027
     * @tc.desc      offsets beyond the total return an empty page
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testQueryBeyond0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testQueryBeyond0027 begin');
      const options: QueryOptions = new QueryOptions();
      options.offset = 99;
      const result: QueryResult = queryEntries(sample(), options);
      expect(result.items.length).assertEqual(0);
      expect(result.hasMore).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_QUERYMATRIX_0028
     * @tc.name      testQueryLimits0028
     * @tc.desc      zero and negative limits return the remaining items
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testQueryLimits0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testQueryLimits0028 begin');
      const zero: QueryOptions = new QueryOptions();
      zero.limit = 0;
      const negative: QueryOptions = new QueryOptions();
      negative.limit = -5;
      expect(queryEntries(sample(), zero).items.length).assertEqual(4);
      expect(queryEntries(sample(), negative).items.length).assertEqual(4);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_QUERYMATRIX_0029
     * @tc.name      testQueryNegativeOffset0029
     * @tc.desc      negative offsets are clamped to zero
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testQueryNegativeOffset0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testQueryNegativeOffset0029 begin');
      const options: QueryOptions = new QueryOptions();
      options.offset = -3;
      expect(queryEntries(sample(), options).offset).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_QUERYMATRIX_0030
     * @tc.name      testQueryFilter00230
     * @tc.desc      filtering happens before paging
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testQueryFilter00230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testQueryFilter00230 begin');
      const options: QueryOptions = new QueryOptions();
      options.kinds = [FileKind.DOCUMENT];
      const result: QueryResult = queryEntries(sample(), options);
      expect(result.total).assertEqual(2);
      expect(result.items.length).assertEqual(2);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_QUERYMATRIX_0031
     * @tc.name      testQueryEmpty0031
     * @tc.desc      empty inputs return empty results
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testQueryEmpty0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testQueryEmpty0031 begin');
      const result: QueryResult = queryEntries([], new QueryOptions());
      expect(result.total).assertEqual(0);
      expect(result.hasMore).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_QUERYMATRIX_0032
     * @tc.name      testCountKinds0032
     * @tc.desc      kind counts aggregate and order entries
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountKinds0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testCountKinds0032 begin');
      const counts: KindCount[] = countByKind(sample());
      expect(counts.length).assertEqual(3);
      expect(counts[1].kind).assertEqual(FileKind.DOCUMENT);
      expect(counts[1].count).assertEqual(2);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_QUERYMATRIX_0033
     * @tc.name      testCountEmpty0033
     * @tc.desc      empty inputs have no kind counts
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountEmpty0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testCountEmpty0033 begin');
      expect(countByKind([]).length).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_QUERYMATRIX_0034
     * @tc.name      testDistinctKinds0034
     * @tc.desc      distinct kinds follow the count order
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDistinctKinds0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDistinctKinds0034 begin');
      const kinds: FileKind[] = distinctKinds(sample());
      expect(kinds.length).assertEqual(3);
      expect(kinds[0]).assertEqual(FileKind.TEXT);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_QUERYMATRIX_0035
     * @tc.name      testHighlightEmptyKeyword0035
     * @tc.desc      empty keywords produce one unmatched span
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testHighlightEmptyKeyword0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testHighlightEmptyKeyword0035 begin');
      const spans: TextSpan[] = highlight('abcdef', '');
      expect(spans.length).assertEqual(1);
      expect(spans[0].matched).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_QUERYMATRIX_0036
     * @tc.name      testHighlightMatrix0036
     * @tc.desc      highlight splits text around matches
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testHighlightMatrix0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testHighlightMatrix0036 begin');
      expect(spansText(highlight('abcdef', 'ab'))).assertEqual('ab|cdef');
      expect(spansText(highlight('abcdef', 'cd'))).assertEqual('ab|cd|ef');
      expect(spansText(highlight('abcdef', 'ef'))).assertEqual('abcd|ef');
      expect(spansText(highlight('abcdef', 'zz'))).assertEqual('abcdef');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_QUERYMATRIX_0037
     * @tc.name      testHighlightCase0037
     * @tc.desc      highlighting ignores case
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testHighlightCase0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testHighlightCase0037 begin');
      expect(matchedText(highlight('Report.PDF', 'report'))).assertEqual('Report');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_QUERYMATRIX_0038
     * @tc.name      testHighlightOverlap0038
     * @tc.desc      overlapping matches merge into one span
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testHighlightOverlap0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testHighlightOverlap0038 begin');
      const spans: TextSpan[] = highlight('abcd', 'ab bc cd');
      expect(spans.length).assertEqual(1);
      expect(spans[0].text).assertEqual('abcd');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_QUERYMATRIX_0039
     * @tc.name      testHighlightChinese0039
     * @tc.desc      chinese matches highlight correctly
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testHighlightChinese0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testHighlightChinese0039 begin');
      const spans: TextSpan[] = highlight('年度报告.txt', '报告');
      expect(spansText(spans)).assertEqual('年度|报告|.txt');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_QUERYMATRIX_0040
     * @tc.name      testHighlightReconstruct0040
     * @tc.desc      spans always reconstruct the source text
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testHighlightReconstruct0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testHighlightReconstruct0040 begin');
      const source: string = '2026 年度 Report-final.txt';
      const spans: TextSpan[] = highlight(source, '年度 report');
      let rebuilt: string = '';
      for (let index = 0; index < spans.length; index++) {
        rebuilt += spans[index].text;
      }
      expect(rebuilt).assertEqual(source);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_QUERYMATRIX_0041
     * @tc.name      testFindEntry0041
     * @tc.desc      entry lookups return the first match
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFindEntry0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testFindEntry0041 begin');
      const found: FileEntry | null = findEntryById(sample(), '3');
      expect(found !== null).assertTrue();
      if (found !== null) {
        expect(found.name).assertEqual('gamma.png');
      }
      expect(findEntryById(sample(), '99')).assertNull();
    })
  });
}
