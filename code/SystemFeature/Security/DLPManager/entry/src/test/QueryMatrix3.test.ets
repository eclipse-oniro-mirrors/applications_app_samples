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
import { FileEntry, QueryOptions, QueryResult, SortField, TextSpan, countByKind, distinctKinds,
  filterEntries, findEntryById, highlight, matchesKeyword, matchesOptions, queryEntries, sortEntries
} from '../main/ets/core/FileQueryCore';

function item(id: string, name: string, kind: FileKind, size: number, modified: number, isDlp: boolean,
  isFavorite: boolean): FileEntry {
  return new FileEntry(id, name, 'file:///docs/' + name, kind, size, modified, isDlp, isFavorite);
}

function sample(): Array<FileEntry> {
  return [
    item('1', 'a.txt', FileKind.TEXT, 100, 1000, false, true),
    item('2', 'b.docx', FileKind.DOCUMENT, 200, 2000, true, false),
    item('3', 'c.png', FileKind.IMAGE, 300, 3000, false, true),
    item('4', 'd.pdf', FileKind.DOCUMENT, 400, 4000, true, true)
  ];
}

function idsOf(values: Array<FileEntry>): string {
  const parts: Array<string> = [];
  for (let index = 0; index < values.length; index++) {
    parts.push(values[index].id);
  }
  return parts.join('|');
}

function reconstruct(spans: Array<TextSpan>): string {
  let result: string = '';
  for (let index = 0; index < spans.length; index++) {
    result += spans[index].text;
  }
  return result;
}

export default function queryMatrix3Test(): void {
  describe('QueryMatrix3Test', () => {
    /**
     * @tc.number    SUB_DLP_MANAGER_QUERYMATRIX3_0001
     * @tc.name      testSortFieldLoop0001
     * @tc.desc      every sort field returns a stable first element
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSortFieldLoop0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(sortEntries(sample(), SortField.NAME, false)[0].id).assertEqual('1');
      expect(sortEntries(sample(), SortField.SIZE, false)[0].id).assertEqual('1');
      expect(sortEntries(sample(), SortField.MODIFIED, false)[0].id).assertEqual('1');
      expect(sortEntries(sample(), SortField.KIND, false)[0].id).assertEqual('1');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_QUERYMATRIX3_0002
     * @tc.name      testSortFieldDescLoop0002
     * @tc.desc      descending sorts return the expected last element
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSortFieldDescLoop0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(sortEntries(sample(), SortField.NAME, true)[0].id).assertEqual('4');
      expect(sortEntries(sample(), SortField.SIZE, true)[0].id).assertEqual('4');
      expect(sortEntries(sample(), SortField.MODIFIED, true)[0].id).assertEqual('4');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_QUERYMATRIX3_0003
     * @tc.name      testSizeFilterMatrix0003
     * @tc.desc      size bounds combine in every pairing
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSizeFilterMatrix0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const low: QueryOptions = new QueryOptions();
      low.minSize = 250;
      const high: QueryOptions = new QueryOptions();
      high.maxSize = 150;
      const both: QueryOptions = new QueryOptions();
      both.minSize = 150;
      both.maxSize = 350;
      expect(idsOf(filterEntries(sample(), low))).assertEqual('3|4');
      expect(idsOf(filterEntries(sample(), high))).assertEqual('1');
      expect(idsOf(filterEntries(sample(), both))).assertEqual('2|3');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_QUERYMATRIX3_0004
     * @tc.name      testKeywordTokenLoop0004
     * @tc.desc      multiple tokens must all match
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeywordTokenLoop0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const entry: FileEntry = item('9', 'report-2026.docx', FileKind.DOCUMENT, 1, 1, false, false);
      expect(matchesKeyword(entry, 'report')).assertTrue();
      expect(matchesKeyword(entry, '2026')).assertTrue();
      expect(matchesKeyword(entry, 'report 2026 docx')).assertTrue();
      expect(matchesKeyword(entry, 'report pdf')).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_QUERYMATRIX3_0005
     * @tc.name      testHighlightReconstructLoop0005
     * @tc.desc      spans reconstruct every sample text
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testHighlightReconstructLoop0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const samples: Array<string> = ['abc', '年度报告.txt', 'a-b_c.docx', '😀文件.txt', ''];
      for (let index = 0; index < samples.length; index++) {
        expect(reconstruct(highlight(samples[index], '报告 a'))).assertEqual(samples[index]);
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_QUERYMATRIX3_0006
     * @tc.name      testCountConsistency0006
     * @tc.desc      kind counts sum to the entry total
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountConsistency0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const counts = countByKind(sample());
      let total: number = 0;
      for (let index = 0; index < counts.length; index++) {
        total += counts[index].count;
      }
      expect(total).assertEqual(4);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_QUERYMATRIX3_0007
     * @tc.name      testDistinctConsistency0007
     * @tc.desc      distinct kinds match the count groups
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDistinctConsistency0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(distinctKinds(sample()).length).assertEqual(countByKind(sample()).length);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_QUERYMATRIX3_0008
     * @tc.name      testPagingBoundaryLoop0008
     * @tc.desc      hasMore flips at each paging boundary
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPagingBoundaryLoop0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      for (let limit = 1; limit <= 4; limit++) {
        const options: QueryOptions = new QueryOptions();
        options.limit = limit;
        const result: QueryResult = queryEntries(sample(), options);
        expect(result.items.length).assertEqual(limit);
        expect(result.hasMore).assertEqual(limit < 4);
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_QUERYMATRIX3_0009
     * @tc.name      testFindIdLoop0009
     * @tc.desc      identifier lookups resolve every entry
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFindIdLoop0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const ids: Array<string> = ['1', '2', '3', '4'];
      for (let index = 0; index < ids.length; index++) {
        expect(findEntryById(sample(), ids[index]) !== null).assertTrue();
      }
      expect(findEntryById(sample(), '5')).assertNull();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_QUERYMATRIX3_0010
     * @tc.name      testFavoriteDlpKindCombos0010
     * @tc.desc      favorite dlp and kind filters combine in every subset
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFavoriteDlpKindCombos0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const options: QueryOptions = new QueryOptions();
      options.onlyDlp = true;
      options.kinds = [FileKind.DOCUMENT];
      expect(idsOf(filterEntries(sample(), options))).assertEqual('2|4');
      options.onlyFavorite = true;
      expect(idsOf(filterEntries(sample(), options))).assertEqual('4');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_QUERYMATRIX3_0011
     * @tc.name      testOptionsDefaultLoop0011
     * @tc.desc      default options match every entry
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testOptionsDefaultLoop0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const entries: Array<FileEntry> = sample();
      for (let index = 0; index < entries.length; index++) {
        expect(matchesOptions(entries[index], new QueryOptions())).assertTrue();
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_QUERYMATRIX3_0012
     * @tc.name      testFilterNoMutation0012
     * @tc.desc      filtering does not mutate the source collection
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFilterNoMutation0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const entries: Array<FileEntry> = sample();
      const options: QueryOptions = new QueryOptions();
      options.keyword = 'docx';
      filterEntries(entries, options);
      expect(entries.length).assertEqual(4);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_QUERYMATRIX3_0013
     * @tc.name      testQueryTotalStable0013
     * @tc.desc      query totals ignore paging
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testQueryTotalStable0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const options: QueryOptions = new QueryOptions();
      options.limit = 1;
      options.offset = 2;
      expect(queryEntries(sample(), options).total).assertEqual(4);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_QUERYMATRIX3_0014
     * @tc.name      testEmptyKeywordToken0014
     * @tc.desc      empty keyword tokens are ignored
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEmptyKeywordToken0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(matchesKeyword(sample()[0], '   ')).assertTrue();
      expect(matchesKeyword(sample()[0], '')).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_QUERYMATRIX3_0015
     * @tc.name      testHighlightBoundary0015
     * @tc.desc      highlight boundaries stay consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testHighlightBoundary0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const spans: Array<TextSpan> = highlight('abc', 'a');
      expect(spans.length).assertEqual(2);
      expect(spans[0].matched).assertTrue();
      expect(spans[1].text).assertEqual('bc');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_QUERYMATRIX3_0016
     * @tc.name      testSortStabilityLoop0016
     * @tc.desc      repeated sorts are deterministic
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSortStabilityLoop0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const first: string = idsOf(sortEntries(sample(), SortField.KIND, false));
      const second: string = idsOf(sortEntries(sample(), SortField.KIND, false));
      expect(first).assertEqual(second);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_QUERYMATRIX3_0017
     * @tc.name      testFilterTimeLoop0017
     * @tc.desc      time filters select consistent windows
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFilterTimeLoop0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const options: QueryOptions = new QueryOptions();
      options.fromSec = 2000;
      options.toSec = 3000;
      expect(idsOf(filterEntries(sample(), options))).assertEqual('2|3');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_QUERYMATRIX3_0018
     * @tc.name      testQueryOffsetLoop0018
     * @tc.desc      every offset returns the expected suffix
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testQueryOffsetLoop0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      for (let offset = 0; offset <= 4; offset++) {
        const options: QueryOptions = new QueryOptions();
        options.offset = offset;
        expect(queryEntries(sample(), options).items.length).assertEqual(4 - offset);
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_QUERYMATRIX3_0019
     * @tc.name      testCountEmptyLoop0019
     * @tc.desc      empty inputs yield empty analyses
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountEmptyLoop0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(countByKind([]).length).assertEqual(0);
      expect(distinctKinds([]).length).assertEqual(0);
      expect(sortEntries([], SortField.NAME, false).length).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_QUERYMATRIX3_0020
     * @tc.name      testKeywordCaseLoop0020
     * @tc.desc      keywords match regardless of case
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeywordCaseLoop0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const variants: Array<string> = ['A.TXT', 'a.txt', 'A.Txt'];
      for (let index = 0; index < variants.length; index++) {
        expect(matchesKeyword(item('9', variants[index], FileKind.TEXT, 1, 1, false, false), 'txt'))
          .assertTrue();
      }
    })
  });
}
