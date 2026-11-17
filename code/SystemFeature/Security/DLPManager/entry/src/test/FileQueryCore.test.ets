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
import { FileEntry, SortField, QueryOptions, QueryResult, KindCount, TextSpan, normalizeKeyword,
  tokenizeKeyword, matchesKeyword, matchesOptions, filterEntries, sortEntries, queryEntries, countByKind,
  distinctKinds, highlight, findEntryById } from '../main/ets/core/FileQueryCore';

function entry(id: string, name: string, kind: FileKind, size: number, modified: number, isDlp: boolean,
  isFavorite: boolean): FileEntry {
  return new FileEntry(id, name, 'file:///docs/' + name, kind, size, modified, isDlp, isFavorite);
}

function sampleEntries(): Array<FileEntry> {
  return [
    entry('1', 'Beta.txt', FileKind.TEXT, 300, 3000, false, true),
    entry('2', 'alpha.PDF', FileKind.DOCUMENT, 100, 1000, true, false),
    entry('3', 'gamma.png', FileKind.IMAGE, 500, 2000, false, false),
    entry('4', 'delta.docx', FileKind.DOCUMENT, 200, 4000, true, true)
  ];
}

function namesOf(entries: Array<FileEntry>): string {
  const parts: Array<string> = [];
  for (let index = 0; index < entries.length; index++) {
    parts.push(entries[index].name);
  }
  return parts.join('|');
}

function idsOf(entries: Array<FileEntry>): string {
  const parts: Array<string> = [];
  for (let index = 0; index < entries.length; index++) {
    parts.push(entries[index].id);
  }
  return parts.join('|');
}

function spansText(spans: Array<TextSpan>): string {
  const parts: Array<string> = [];
  for (let index = 0; index < spans.length; index++) {
    parts.push(spans[index].text);
  }
  return parts.join('|');
}

function matchedText(spans: Array<TextSpan>): string {
  const parts: Array<string> = [];
  for (let index = 0; index < spans.length; index++) {
    if (spans[index].matched) {
      parts.push(spans[index].text);
    }
  }
  return parts.join('|');
}

function options(): QueryOptions {
  return new QueryOptions();
}

export default function fileQueryCoreTest(): void {
  describe('FileQueryCoreTest', () => {
    /**
     * @tc.number    SUB_DLP_MANAGER_FILEQUERY_0001
     * @tc.name      testEntryFields0001
     * @tc.desc      file entry keeps all constructor fields
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntryFields0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testEntryFields0001 begin');
      console.info('testEntryFields0001 begin');
      const item: FileEntry = entry('1', 'a.txt', FileKind.TEXT, 10, 100, true, true);
      expect(item.id).assertEqual('1');
      expect(item.kind).assertEqual(FileKind.TEXT);
      expect(item.isDlp).assertTrue();
      expect(item.isFavorite).assertTrue();
      expect(item.modifiedAtSec).assertEqual(100);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEQUERY_0002
     * @tc.name      testDefaults0002
     * @tc.desc      query options start with neutral defaults
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDefaults0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDefaults0002 begin');
      console.info('testDefaults0002 begin');
      const value: QueryOptions = options();
      expect(value.keyword).assertEqual('');
      expect(value.kinds.length).assertEqual(0);
      expect(value.sortField).assertEqual(SortField.NAME);
      expect(value.descending).assertFalse();
      expect(value.limit).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEQUERY_0003
     * @tc.name      testNormalizeEmpty0003
     * @tc.desc      empty keyword normalizes to empty
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNormalizeEmpty0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testNormalizeEmpty0003 begin');
      console.info('testNormalizeEmpty0003 begin');
      expect(normalizeKeyword('')).assertEqual('');
      expect(normalizeKeyword('   ')).assertEqual('');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEQUERY_0004
     * @tc.name      testNormalizeCase0004
     * @tc.desc      keyword is lowercased
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNormalizeCase0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testNormalizeCase0004 begin');
      console.info('testNormalizeCase0004 begin');
      expect(normalizeKeyword('ABC')).assertEqual('abc');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEQUERY_0005
     * @tc.name      testNormalizeSpaces0005
     * @tc.desc      duplicate and edge spaces collapse
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNormalizeSpaces0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testNormalizeSpaces0005 begin');
      console.info('testNormalizeSpaces0005 begin');
      expect(normalizeKeyword('  a  b  ')).assertEqual('a b');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEQUERY_0006
     * @tc.name      testTokenizeEmpty0006
     * @tc.desc      empty keyword has no tokens
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTokenizeEmpty0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testTokenizeEmpty0006 begin');
      console.info('testTokenizeEmpty0006 begin');
      expect(tokenizeKeyword('').length).assertEqual(0);
      expect(tokenizeKeyword('   ').length).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEQUERY_0007
     * @tc.name      testTokenizeBasic0007
     * @tc.desc      tokens are split and lowercased
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTokenizeBasic0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testTokenizeBasic0007 begin');
      console.info('testTokenizeBasic0007 begin');
      expect(tokenizeKeyword('A B').length).assertEqual(2);
      expect(tokenizeKeyword('A B')[0]).assertEqual('a');
      expect(tokenizeKeyword('A B')[1]).assertEqual('b');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEQUERY_0008
     * @tc.name      testMatchEmptyKeyword0008
     * @tc.desc      empty keyword matches every entry
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMatchEmptyKeyword0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testMatchEmptyKeyword0008 begin');
      console.info('testMatchEmptyKeyword0008 begin');
      expect(matchesKeyword(entry('1', 'a.txt', FileKind.TEXT, 1, 1, false, false), '')).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEQUERY_0009
     * @tc.name      testMatchCaseInsensitive0009
     * @tc.desc      keyword matching ignores case
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMatchCaseInsensitive0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testMatchCaseInsensitive0009 begin');
      console.info('testMatchCaseInsensitive0009 begin');
      const item: FileEntry = entry('1', 'Report.TXT', FileKind.TEXT, 1, 1, false, false);
      expect(matchesKeyword(item, 'report')).assertTrue();
      expect(matchesKeyword(item, 'TXT')).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEQUERY_0010
     * @tc.name      testMatchAllTokens0010
     * @tc.desc      every token must appear in the name
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMatchAllTokens0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testMatchAllTokens0010 begin');
      console.info('testMatchAllTokens0010 begin');
      const item: FileEntry = entry('1', 'report.txt', FileKind.TEXT, 1, 1, false, false);
      expect(matchesKeyword(item, 'rep txt')).assertTrue();
      expect(matchesKeyword(item, 'rep doc')).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEQUERY_0011
     * @tc.name      testMatchMissing0011
     * @tc.desc      unrelated tokens do not match
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMatchMissing0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testMatchMissing0011 begin');
      console.info('testMatchMissing0011 begin');
      expect(matchesKeyword(entry('1', 'a.txt', FileKind.TEXT, 1, 1, false, false), 'xyz')).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEQUERY_0012
     * @tc.name      testMatchChinese0012
     * @tc.desc      chinese keywords match chinese names
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMatchChinese0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testMatchChinese0012 begin');
      console.info('testMatchChinese0012 begin');
      expect(matchesKeyword(entry('1', '报告.txt', FileKind.TEXT, 1, 1, false, false), '报告')).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEQUERY_0013
     * @tc.name      testOptionsDefaultMatch0013
     * @tc.desc      default options match every entry
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testOptionsDefaultMatch0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testOptionsDefaultMatch0013 begin');
      console.info('testOptionsDefaultMatch0013 begin');
      const entries: Array<FileEntry> = sampleEntries();
      for (let index = 0; index < entries.length; index++) {
        expect(matchesOptions(entries[index], options())).assertTrue();
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEQUERY_0014
     * @tc.name      testOptionsOnlyDlp0014
     * @tc.desc      dlp filter keeps only dlp entries
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testOptionsOnlyDlp0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testOptionsOnlyDlp0014 begin');
      console.info('testOptionsOnlyDlp0014 begin');
      const value: QueryOptions = options();
      value.onlyDlp = true;
      expect(matchesOptions(entry('1', 'a.dlp', FileKind.TEXT, 1, 1, true, false), value)).assertTrue();
      expect(matchesOptions(entry('2', 'b.txt', FileKind.TEXT, 1, 1, false, false), value)).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEQUERY_0015
     * @tc.name      testOptionsOnlyFavorite0015
     * @tc.desc      favorite filter keeps only favorites
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testOptionsOnlyFavorite0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testOptionsOnlyFavorite0015 begin');
      console.info('testOptionsOnlyFavorite0015 begin');
      const value: QueryOptions = options();
      value.onlyFavorite = true;
      expect(matchesOptions(entry('1', 'a.txt', FileKind.TEXT, 1, 1, false, true), value)).assertTrue();
      expect(matchesOptions(entry('2', 'b.txt', FileKind.TEXT, 1, 1, false, false), value)).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEQUERY_0016
     * @tc.name      testOptionsKindsHit0016
     * @tc.desc      kind filter matches listed kinds
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testOptionsKindsHit0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testOptionsKindsHit0016 begin');
      console.info('testOptionsKindsHit0016 begin');
      const value: QueryOptions = options();
      value.kinds = [FileKind.TEXT, FileKind.IMAGE];
      expect(matchesOptions(entry('1', 'a.png', FileKind.IMAGE, 1, 1, false, false), value)).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEQUERY_0017
     * @tc.name      testOptionsKindsMiss0017
     * @tc.desc      kind filter rejects unlisted kinds
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testOptionsKindsMiss0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testOptionsKindsMiss0017 begin');
      console.info('testOptionsKindsMiss0017 begin');
      const value: QueryOptions = options();
      value.kinds = [FileKind.TEXT];
      expect(matchesOptions(entry('1', 'a.pdf', FileKind.DOCUMENT, 1, 1, false, false), value)).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEQUERY_0018
     * @tc.name      testOptionsMinSize0018
     * @tc.desc      minimum size is inclusive
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testOptionsMinSize0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testOptionsMinSize0018 begin');
      console.info('testOptionsMinSize0018 begin');
      const value: QueryOptions = options();
      value.minSize = 100;
      expect(matchesOptions(entry('1', 'a.txt', FileKind.TEXT, 100, 1, false, false), value)).assertTrue();
      expect(matchesOptions(entry('2', 'b.txt', FileKind.TEXT, 99, 1, false, false), value)).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEQUERY_0019
     * @tc.name      testOptionsMaxSize0019
     * @tc.desc      maximum size is inclusive
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testOptionsMaxSize0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testOptionsMaxSize0019 begin');
      console.info('testOptionsMaxSize0019 begin');
      const value: QueryOptions = options();
      value.maxSize = 100;
      expect(matchesOptions(entry('1', 'a.txt', FileKind.TEXT, 100, 1, false, false), value)).assertTrue();
      expect(matchesOptions(entry('2', 'b.txt', FileKind.TEXT, 101, 1, false, false), value)).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEQUERY_0020
     * @tc.name      testOptionsSizeRange0020
     * @tc.desc      size range combines both bounds
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testOptionsSizeRange0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testOptionsSizeRange0020 begin');
      console.info('testOptionsSizeRange0020 begin');
      const value: QueryOptions = options();
      value.minSize = 100;
      value.maxSize = 200;
      expect(matchesOptions(entry('1', 'a.txt', FileKind.TEXT, 150, 1, false, false), value)).assertTrue();
      expect(matchesOptions(entry('2', 'b.txt', FileKind.TEXT, 250, 1, false, false), value)).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEQUERY_0021
     * @tc.name      testOptionsTimeRange0021
     * @tc.desc      time range filters by modified seconds
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testOptionsTimeRange0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testOptionsTimeRange0021 begin');
      console.info('testOptionsTimeRange0021 begin');
      const value: QueryOptions = options();
      value.fromSec = 100;
      value.toSec = 200;
      expect(matchesOptions(entry('1', 'a.txt', FileKind.TEXT, 1, 100, false, false), value)).assertTrue();
      expect(matchesOptions(entry('2', 'b.txt', FileKind.TEXT, 1, 201, false, false), value)).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEQUERY_0022
     * @tc.name      testOptionsCombined0022
     * @tc.desc      keyword and kind filters combine
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testOptionsCombined0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testOptionsCombined0022 begin');
      console.info('testOptionsCombined0022 begin');
      const value: QueryOptions = options();
      value.keyword = 'report';
      value.kinds = [FileKind.DOCUMENT];
      expect(matchesOptions(entry('1', 'report.docx', FileKind.DOCUMENT, 1, 1, false, false), value)).assertTrue();
      expect(matchesOptions(entry('2', 'report.txt', FileKind.TEXT, 1, 1, false, false), value)).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEQUERY_0023
     * @tc.name      testFilterEmpty0023
     * @tc.desc      empty input yields empty output
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFilterEmpty0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testFilterEmpty0023 begin');
      console.info('testFilterEmpty0023 begin');
      expect(filterEntries([], options()).length).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEQUERY_0024
     * @tc.name      testFilterAll0024
     * @tc.desc      default options keep all entries in order
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFilterAll0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testFilterAll0024 begin');
      console.info('testFilterAll0024 begin');
      const filtered: Array<FileEntry> = filterEntries(sampleEntries(), options());
      expect(namesOf(filtered)).assertEqual('Beta.txt|alpha.PDF|gamma.png|delta.docx');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEQUERY_0025
     * @tc.name      testFilterSubset0025
     * @tc.desc      kind filter keeps the matching subset
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFilterSubset0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testFilterSubset0025 begin');
      console.info('testFilterSubset0025 begin');
      const value: QueryOptions = options();
      value.kinds = [FileKind.DOCUMENT];
      expect(namesOf(filterEntries(sampleEntries(), value))).assertEqual('alpha.PDF|delta.docx');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEQUERY_0026
     * @tc.name      testFilterNoResult0026
     * @tc.desc      unmatched filters return an empty list
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFilterNoResult0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testFilterNoResult0026 begin');
      console.info('testFilterNoResult0026 begin');
      const value: QueryOptions = options();
      value.keyword = 'zzz';
      expect(filterEntries(sampleEntries(), value).length).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEQUERY_0027
     * @tc.name      testSortNameAsc0027
     * @tc.desc      name sort is case insensitive
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSortNameAsc0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSortNameAsc0027 begin');
      console.info('testSortNameAsc0027 begin');
      const sorted: Array<FileEntry> = sortEntries(sampleEntries(), SortField.NAME, false);
      expect(namesOf(sorted)).assertEqual('alpha.PDF|Beta.txt|delta.docx|gamma.png');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEQUERY_0028
     * @tc.name      testSortNameDesc0028
     * @tc.desc      descending name sort reverses the order
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSortNameDesc0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSortNameDesc0028 begin');
      console.info('testSortNameDesc0028 begin');
      const sorted: Array<FileEntry> = sortEntries(sampleEntries(), SortField.NAME, true);
      expect(sorted[0].name).assertEqual('gamma.png');
      expect(sorted[3].name).assertEqual('alpha.PDF');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEQUERY_0029
     * @tc.name      testSortSizeAsc0029
     * @tc.desc      ascending size orders small files first
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSortSizeAsc0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSortSizeAsc0029 begin');
      console.info('testSortSizeAsc0029 begin');
      const sorted: Array<FileEntry> = sortEntries(sampleEntries(), SortField.SIZE, false);
      expect(idsOf(sorted)).assertEqual('2|4|1|3');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEQUERY_0030
     * @tc.name      testSortSizeDesc0030
     * @tc.desc      descending size orders large files first
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSortSizeDesc0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSortSizeDesc0030 begin');
      console.info('testSortSizeDesc0030 begin');
      const sorted: Array<FileEntry> = sortEntries(sampleEntries(), SortField.SIZE, true);
      expect(idsOf(sorted)).assertEqual('3|1|4|2');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEQUERY_0031
     * @tc.name      testSortModified0031
     * @tc.desc      modified sort orders by timestamp
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSortModified0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSortModified0031 begin');
      console.info('testSortModified0031 begin');
      const sorted: Array<FileEntry> = sortEntries(sampleEntries(), SortField.MODIFIED, false);
      expect(idsOf(sorted)).assertEqual('2|3|1|4');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEQUERY_0032
     * @tc.name      testSortKind0032
     * @tc.desc      kind sort follows the kind priority
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSortKind0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSortKind0032 begin');
      console.info('testSortKind0032 begin');
      const sorted: Array<FileEntry> = sortEntries(sampleEntries(), SortField.KIND, false);
      expect(sorted[0].kind).assertEqual(FileKind.TEXT);
      expect(sorted[1].kind).assertEqual(FileKind.DOCUMENT);
      expect(sorted[3].kind).assertEqual(FileKind.IMAGE);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEQUERY_0033
     * @tc.name      testSortStableTie0033
     * @tc.desc      equal names fall back to entry id
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSortStableTie0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSortStableTie0033 begin');
      console.info('testSortStableTie0033 begin');
      const items: Array<FileEntry> = [
        entry('b', 'same.txt', FileKind.TEXT, 1, 1, false, false),
        entry('a', 'same.txt', FileKind.TEXT, 1, 1, false, false)
      ];
      expect(idsOf(sortEntries(items, SortField.NAME, false))).assertEqual('a|b');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEQUERY_0034
     * @tc.name      testSortEmpty0034
     * @tc.desc      sorting an empty list is safe
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSortEmpty0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSortEmpty0034 begin');
      console.info('testSortEmpty0034 begin');
      expect(sortEntries([], SortField.NAME, false).length).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEQUERY_0035
     * @tc.name      testSortSingle0035
     * @tc.desc      a single entry sorts unchanged
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSortSingle0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSortSingle0035 begin');
      console.info('testSortSingle0035 begin');
      const items: Array<FileEntry> = [entry('1', 'a.txt', FileKind.TEXT, 1, 1, false, false)];
      expect(sortEntries(items, SortField.SIZE, true).length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEQUERY_0036
     * @tc.name      testSortNoMutation0036
     * @tc.desc      sorting returns a copy and keeps the input order
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSortNoMutation0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSortNoMutation0036 begin');
      console.info('testSortNoMutation0036 begin');
      const items: Array<FileEntry> = sampleEntries();
      const sorted: Array<FileEntry> = sortEntries(items, SortField.SIZE, false);
      expect(sorted.length).assertEqual(4);
      expect(items[0].name).assertEqual('Beta.txt');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEQUERY_0037
     * @tc.name      testSortKindTieName0037
     * @tc.desc      equal kinds are ordered by name
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSortKindTieName0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSortKindTieName0037 begin');
      console.info('testSortKindTieName0037 begin');
      const items: Array<FileEntry> = [
        entry('1', 'b.txt', FileKind.TEXT, 1, 1, false, false),
        entry('2', 'a.txt', FileKind.TEXT, 1, 1, false, false)
      ];
      expect(idsOf(sortEntries(items, SortField.KIND, false))).assertEqual('2|1');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEQUERY_0038
     * @tc.name      testQueryAll0038
     * @tc.desc      default query returns every entry
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testQueryAll0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testQueryAll0038 begin');
      console.info('testQueryAll0038 begin');
      const result: QueryResult = queryEntries(sampleEntries(), options());
      expect(result.total).assertEqual(4);
      expect(result.items.length).assertEqual(4);
      expect(result.hasMore).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEQUERY_0039
     * @tc.name      testQueryLimit0039
     * @tc.desc      limit truncates items but keeps the total
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testQueryLimit0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testQueryLimit0039 begin');
      console.info('testQueryLimit0039 begin');
      const value: QueryOptions = options();
      value.limit = 2;
      const result: QueryResult = queryEntries(sampleEntries(), value);
      expect(result.items.length).assertEqual(2);
      expect(result.total).assertEqual(4);
      expect(result.hasMore).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEQUERY_0040
     * @tc.name      testQueryOffset0040
     * @tc.desc      offset skips leading items
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testQueryOffset0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testQueryOffset0040 begin');
      console.info('testQueryOffset0040 begin');
      const value: QueryOptions = options();
      value.offset = 1;
      value.limit = 2;
      const result: QueryResult = queryEntries(sampleEntries(), value);
      expect(result.items.length).assertEqual(2);
      expect(result.offset).assertEqual(1);
      expect(result.hasMore).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEQUERY_0041
     * @tc.name      testQueryLastPage0041
     * @tc.desc      last page reports no more results
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testQueryLastPage0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testQueryLastPage0041 begin');
      console.info('testQueryLastPage0041 begin');
      const value: QueryOptions = options();
      value.offset = 3;
      value.limit = 2;
      const result: QueryResult = queryEntries(sampleEntries(), value);
      expect(result.items.length).assertEqual(1);
      expect(result.hasMore).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEQUERY_0042
     * @tc.name      testQueryOffsetBeyond0042
     * @tc.desc      offset beyond total yields an empty page
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testQueryOffsetBeyond0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testQueryOffsetBeyond0042 begin');
      console.info('testQueryOffsetBeyond0042 begin');
      const value: QueryOptions = options();
      value.offset = 10;
      const result: QueryResult = queryEntries(sampleEntries(), value);
      expect(result.items.length).assertEqual(0);
      expect(result.hasMore).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEQUERY_0043
     * @tc.name      testQueryZeroLimit0043
     * @tc.desc      zero limit returns all remaining items
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testQueryZeroLimit0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testQueryZeroLimit0043 begin');
      console.info('testQueryZeroLimit0043 begin');
      const value: QueryOptions = options();
      value.limit = 0;
      expect(queryEntries(sampleEntries(), value).items.length).assertEqual(4);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEQUERY_0044
     * @tc.name      testQueryNegativeOffset0044
     * @tc.desc      negative offset is clamped to zero
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testQueryNegativeOffset0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testQueryNegativeOffset0044 begin');
      console.info('testQueryNegativeOffset0044 begin');
      const value: QueryOptions = options();
      value.offset = -5;
      expect(queryEntries(sampleEntries(), value).offset).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEQUERY_0045
     * @tc.name      testQueryNegativeLimit0045
     * @tc.desc      negative limit returns all remaining items
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testQueryNegativeLimit0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testQueryNegativeLimit0045 begin');
      console.info('testQueryNegativeLimit0045 begin');
      const value: QueryOptions = options();
      value.limit = -1;
      expect(queryEntries(sampleEntries(), value).items.length).assertEqual(4);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEQUERY_0046
     * @tc.name      testQueryExactEnd0046
     * @tc.desc      page ending at total has no more results
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testQueryExactEnd0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testQueryExactEnd0046 begin');
      console.info('testQueryExactEnd0046 begin');
      const value: QueryOptions = options();
      value.limit = 4;
      expect(queryEntries(sampleEntries(), value).hasMore).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEQUERY_0047
     * @tc.name      testQueryFilter0047
     * @tc.desc      filtering happens before paging
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testQueryFilter0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testQueryFilter0047 begin');
      console.info('testQueryFilter0047 begin');
      const value: QueryOptions = options();
      value.kinds = [FileKind.DOCUMENT];
      const result: QueryResult = queryEntries(sampleEntries(), value);
      expect(result.total).assertEqual(2);
      expect(result.items[0].kind).assertEqual(FileKind.DOCUMENT);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEQUERY_0048
     * @tc.name      testQuerySortPaging0048
     * @tc.desc      sorting is applied before paging
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testQuerySortPaging0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testQuerySortPaging0048 begin');
      console.info('testQuerySortPaging0048 begin');
      const value: QueryOptions = options();
      value.sortField = SortField.SIZE;
      value.limit = 1;
      const result: QueryResult = queryEntries(sampleEntries(), value);
      expect(result.items[0].id).assertEqual('2');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEQUERY_0049
     * @tc.name      testQueryEmptyInput0049
     * @tc.desc      empty input returns an empty result
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testQueryEmptyInput0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testQueryEmptyInput0049 begin');
      console.info('testQueryEmptyInput0049 begin');
      const result: QueryResult = queryEntries([], options());
      expect(result.total).assertEqual(0);
      expect(result.hasMore).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEQUERY_0050
     * @tc.name      testCountEmpty0050
     * @tc.desc      empty input has no kind counts
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountEmpty0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testCountEmpty0050 begin');
      console.info('testCountEmpty0050 begin');
      expect(countByKind([]).length).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEQUERY_0051
     * @tc.name      testCountBasic0051
     * @tc.desc      kind counts aggregate matching entries
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountBasic0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testCountBasic0051 begin');
      console.info('testCountBasic0051 begin');
      const counts: Array<KindCount> = countByKind(sampleEntries());
      expect(counts.length).assertEqual(3);
      expect(counts[0].kind).assertEqual(FileKind.TEXT);
      expect(counts[1].kind).assertEqual(FileKind.DOCUMENT);
      expect(counts[1].count).assertEqual(2);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEQUERY_0052
     * @tc.name      testCountOrder0052
     * @tc.desc      kind counts follow kind priority
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountOrder0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testCountOrder0052 begin');
      console.info('testCountOrder0052 begin');
      const counts: Array<KindCount> = countByKind(sampleEntries());
      expect(counts[2].kind).assertEqual(FileKind.IMAGE);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEQUERY_0053
     * @tc.name      testCountUnknownLast0053
     * @tc.desc      unknown kinds are counted last
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountUnknownLast0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testCountUnknownLast0053 begin');
      console.info('testCountUnknownLast0053 begin');
      const items: Array<FileEntry> = [
        entry('1', 'a.xyz', FileKind.UNKNOWN, 1, 1, false, false),
        entry('2', 'b.txt', FileKind.TEXT, 1, 1, false, false)
      ];
      const counts: Array<KindCount> = countByKind(items);
      expect(counts[0].kind).assertEqual(FileKind.TEXT);
      expect(counts[1].kind).assertEqual(FileKind.UNKNOWN);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEQUERY_0054
     * @tc.name      testCountSingle0054
     * @tc.desc      a single kind counts one entry
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountSingle0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testCountSingle0054 begin');
      console.info('testCountSingle0054 begin');
      const counts: Array<KindCount> = countByKind([entry('1', 'a.txt', FileKind.TEXT, 1, 1, false, false)]);
      expect(counts.length).assertEqual(1);
      expect(counts[0].count).assertEqual(1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEQUERY_0055
     * @tc.name      testDistinctEmpty0055
     * @tc.desc      empty input has no distinct kinds
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDistinctEmpty0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDistinctEmpty0055 begin');
      console.info('testDistinctEmpty0055 begin');
      expect(distinctKinds([]).length).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEQUERY_0056
     * @tc.name      testDistinctBasic0056
     * @tc.desc      distinct kinds are deduplicated and ordered
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDistinctBasic0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDistinctBasic0056 begin');
      console.info('testDistinctBasic0056 begin');
      const kinds: Array<FileKind> = distinctKinds(sampleEntries());
      expect(kinds.length).assertEqual(3);
      expect(kinds[0]).assertEqual(FileKind.TEXT);
      expect(kinds[2]).assertEqual(FileKind.IMAGE);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEQUERY_0057
     * @tc.name      testHighlightEmptyKeyword0057
     * @tc.desc      empty keyword yields one unmatched span
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testHighlightEmptyKeyword0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testHighlightEmptyKeyword0057 begin');
      console.info('testHighlightEmptyKeyword0057 begin');
      const spans: Array<TextSpan> = highlight('abcdef', '');
      expect(spans.length).assertEqual(1);
      expect(spans[0].matched).assertFalse();
      expect(spans[0].text).assertEqual('abcdef');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEQUERY_0058
     * @tc.name      testHighlightStart0058
     * @tc.desc      match at the start keeps the trailing text
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testHighlightStart0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testHighlightStart0058 begin');
      console.info('testHighlightStart0058 begin');
      const spans: Array<TextSpan> = highlight('abcdef', 'ab');
      expect(spansText(spans)).assertEqual('ab|cdef');
      expect(matchedText(spans)).assertEqual('ab');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEQUERY_0059
     * @tc.name      testHighlightMiddle0059
     * @tc.desc      middle matches split the text into three spans
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testHighlightMiddle0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testHighlightMiddle0059 begin');
      console.info('testHighlightMiddle0059 begin');
      const spans: Array<TextSpan> = highlight('abcdef', 'cd');
      expect(spansText(spans)).assertEqual('ab|cd|ef');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEQUERY_0060
     * @tc.name      testHighlightEnd0060
     * @tc.desc      match at the end has no trailing span
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testHighlightEnd0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testHighlightEnd0060 begin');
      console.info('testHighlightEnd0060 begin');
      const spans: Array<TextSpan> = highlight('abcdef', 'ef');
      expect(spansText(spans)).assertEqual('abcd|ef');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEQUERY_0061
     * @tc.name      testHighlightFull0061
     * @tc.desc      full match yields a single matched span
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testHighlightFull0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testHighlightFull0061 begin');
      console.info('testHighlightFull0061 begin');
      const spans: Array<TextSpan> = highlight('abc', 'abc');
      expect(spans.length).assertEqual(1);
      expect(spans[0].matched).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEQUERY_0062
     * @tc.name      testHighlightMultiple0062
     * @tc.desc      repeated matches produce separate spans
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testHighlightMultiple0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testHighlightMultiple0062 begin');
      console.info('testHighlightMultiple0062 begin');
      const spans: Array<TextSpan> = highlight('abab', 'ab');
      expect(spans.length).assertEqual(1);
      expect(matchedText(spans)).assertEqual('abab');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEQUERY_0063
     * @tc.name      testHighlightCase0063
     * @tc.desc      highlighting ignores case
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testHighlightCase0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testHighlightCase0063 begin');
      console.info('testHighlightCase0063 begin');
      const spans: Array<TextSpan> = highlight('ABCdef', 'abc');
      expect(matchedText(spans)).assertEqual('ABC');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEQUERY_0064
     * @tc.name      testHighlightOverlap0064
     * @tc.desc      overlapping token matches merge into one span
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testHighlightOverlap0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testHighlightOverlap0064 begin');
      console.info('testHighlightOverlap0064 begin');
      const spans: Array<TextSpan> = highlight('abc', 'ab bc');
      expect(spans.length).assertEqual(1);
      expect(spans[0].text).assertEqual('abc');
      expect(spans[0].matched).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEQUERY_0065
     * @tc.name      testHighlightAdjacent0065
     * @tc.desc      adjacent matches merge into one span
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testHighlightAdjacent0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testHighlightAdjacent0065 begin');
      console.info('testHighlightAdjacent0065 begin');
      const spans: Array<TextSpan> = highlight('abcd', 'ab cd');
      expect(spans.length).assertEqual(1);
      expect(matchedText(spans)).assertEqual('abcd');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEQUERY_0066
     * @tc.name      testHighlightChinese0066
     * @tc.desc      chinese keywords highlight correctly
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testHighlightChinese0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testHighlightChinese0066 begin');
      console.info('testHighlightChinese0066 begin');
      const spans: Array<TextSpan> = highlight('年度报告.txt', '报告');
      expect(matchedText(spans)).assertEqual('报告');
      expect(spansText(spans)).assertEqual('年度|报告|.txt');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEQUERY_0067
     * @tc.name      testHighlightNoMatch0067
     * @tc.desc      unmatched keyword keeps the whole text
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testHighlightNoMatch0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testHighlightNoMatch0067 begin');
      console.info('testHighlightNoMatch0067 begin');
      const spans: Array<TextSpan> = highlight('abcdef', 'zz');
      expect(spans.length).assertEqual(1);
      expect(spans[0].matched).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEQUERY_0068
     * @tc.name      testHighlightReconstruct0068
     * @tc.desc      span text always reconstructs the source text
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testHighlightReconstruct0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testHighlightReconstruct0068 begin');
      console.info('testHighlightReconstruct0068 begin');
      const source: string = '2026年度报告-final.txt';
      const spans: Array<TextSpan> = highlight(source, '年度 final');
      let rebuilt: string = '';
      for (let index = 0; index < spans.length; index++) {
        rebuilt += spans[index].text;
      }
      expect(rebuilt).assertEqual(source);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEQUERY_0069
     * @tc.name      testHighlightEmptyText0069
     * @tc.desc      empty text yields one empty span
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testHighlightEmptyText0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testHighlightEmptyText0069 begin');
      console.info('testHighlightEmptyText0069 begin');
      const spans: Array<TextSpan> = highlight('', 'ab');
      expect(spans.length).assertEqual(1);
      expect(spans[0].text).assertEqual('');
      expect(spans[0].matched).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEQUERY_0070
     * @tc.name      testFindByIdHit0070
     * @tc.desc      entry lookup returns the matching item
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFindByIdHit0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testFindByIdHit0070 begin');
      console.info('testFindByIdHit0070 begin');
      const found: FileEntry | null = findEntryById(sampleEntries(), '3');
      expect(found !== null).assertTrue();
      if (found !== null) {
        expect(found.name).assertEqual('gamma.png');
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEQUERY_0071
     * @tc.name      testFindByIdMiss0071
     * @tc.desc      missing ids return null
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFindByIdMiss0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testFindByIdMiss0071 begin');
      console.info('testFindByIdMiss0071 begin');
      expect(findEntryById(sampleEntries(), '99')).assertNull();
      expect(findEntryById([], '1')).assertNull();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEQUERY_0072
     * @tc.name      testFindByIdFirst0072
     * @tc.desc      duplicate ids return the first occurrence
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFindByIdFirst0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testFindByIdFirst0072 begin');
      console.info('testFindByIdFirst0072 begin');
      const items: Array<FileEntry> = [
        entry('1', 'first.txt', FileKind.TEXT, 1, 1, false, false),
        entry('1', 'second.txt', FileKind.TEXT, 1, 1, false, false)
      ];
      const found: FileEntry | null = findEntryById(items, '1');
      expect(found !== null).assertTrue();
      if (found !== null) {
        expect(found.name).assertEqual('first.txt');
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEQUERY_0073
     * @tc.name      testMatchSpacesKeyword0073
     * @tc.desc      keyword with only spaces matches everything
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMatchSpacesKeyword0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testMatchSpacesKeyword0073 begin');
      console.info('testMatchSpacesKeyword0073 begin');
      expect(matchesKeyword(entry('1', 'a.txt', FileKind.TEXT, 1, 1, false, false), '   ')).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEQUERY_0074
     * @tc.name      testOptionsDlpAndFavorite0074
     * @tc.desc      dlp and favorite filters combine
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testOptionsDlpAndFavorite0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testOptionsDlpAndFavorite0074 begin');
      console.info('testOptionsDlpAndFavorite0074 begin');
      const value: QueryOptions = options();
      value.onlyDlp = true;
      value.onlyFavorite = true;
      expect(matchesOptions(entry('1', 'a.dlp', FileKind.TEXT, 1, 1, true, false), value)).assertFalse();
      expect(matchesOptions(entry('2', 'b.dlp', FileKind.TEXT, 1, 1, true, true), value)).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEQUERY_0075
     * @tc.name      testOptionsFromOnly0075
     * @tc.desc      lower time bound alone is applied
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testOptionsFromOnly0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testOptionsFromOnly0075 begin');
      console.info('testOptionsFromOnly0075 begin');
      const value: QueryOptions = options();
      value.fromSec = 1000;
      expect(matchesOptions(entry('1', 'a.txt', FileKind.TEXT, 1, 999, false, false), value)).assertFalse();
      expect(matchesOptions(entry('2', 'b.txt', FileKind.TEXT, 1, 1000, false, false), value)).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEQUERY_0076
     * @tc.name      testOptionsToOnly0076
     * @tc.desc      upper time bound alone is applied
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testOptionsToOnly0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testOptionsToOnly0076 begin');
      console.info('testOptionsToOnly0076 begin');
      const value: QueryOptions = options();
      value.toSec = 1000;
      expect(matchesOptions(entry('1', 'a.txt', FileKind.TEXT, 1, 1000, false, false), value)).assertTrue();
      expect(matchesOptions(entry('2', 'b.txt', FileKind.TEXT, 1, 1001, false, false), value)).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEQUERY_0077
     * @tc.name      testSortDescTie0077
     * @tc.desc      descending sort keeps id tie break ascending
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSortDescTie0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSortDescTie0077 begin');
      console.info('testSortDescTie0077 begin');
      const items: Array<FileEntry> = [
        entry('a', 'same.txt', FileKind.TEXT, 1, 1, false, false),
        entry('b', 'same.txt', FileKind.TEXT, 1, 1, false, false)
      ];
      expect(idsOf(sortEntries(items, SortField.SIZE, true))).assertEqual('a|b');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEQUERY_0078
     * @tc.name      testQueryHasMoreMiddle0078
     * @tc.desc      middle pages report more results
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testQueryHasMoreMiddle0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testQueryHasMoreMiddle0078 begin');
      console.info('testQueryHasMoreMiddle0078 begin');
      const value: QueryOptions = options();
      value.offset = 1;
      value.limit = 2;
      expect(queryEntries(sampleEntries(), value).hasMore).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEQUERY_0079
     * @tc.name      testQueryPageContent0079
     * @tc.desc      paged items follow the sorted order
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testQueryPageContent0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testQueryPageContent0079 begin');
      console.info('testQueryPageContent0079 begin');
      const value: QueryOptions = options();
      value.sortField = SortField.SIZE;
      value.offset = 1;
      value.limit = 2;
      const result: QueryResult = queryEntries(sampleEntries(), value);
      expect(result.items[0].id).assertEqual('4');
      expect(result.items[1].id).assertEqual('1');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEQUERY_0080
     * @tc.name      testNormalizeNewline0080
     * @tc.desc      newlines are not treated as token separators
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNormalizeNewline0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testNormalizeNewline0080 begin');
      console.info('testNormalizeNewline0080 begin');
      expect(normalizeKeyword('a\nb')).assertEqual('a\nb');
    })
  });
}
