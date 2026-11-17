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
import { FileEntry, QueryResult, SortField } from '../main/ets/core/FileQueryCore';
import { DEFAULT_PAGE_SIZE, SearchModel } from '../main/ets/feature/SearchModel';

function item(id: string, name: string, kind: FileKind, size: number, modified: number, isDlp: boolean,
  isFavorite: boolean): FileEntry {
  return new FileEntry(id, name, 'file:///docs/' + name, kind, size, modified, isDlp, isFavorite);
}

function sample(): Array<FileEntry> {
  return [
    item('1', 'Beta.txt', FileKind.TEXT, 300, 3000, false, true),
    item('2', 'alpha.PDF', FileKind.DOCUMENT, 100, 1000, true, false),
    item('3', 'gamma.png', FileKind.IMAGE, 500, 2000, false, false),
    item('4', 'delta.docx', FileKind.DOCUMENT, 200, 4000, true, true)
  ];
}

function model(): SearchModel {
  const value: SearchModel = new SearchModel();
  value.setEntries(sample());
  return value;
}

function idsOf(entries: Array<FileEntry>): string {
  const parts: Array<string> = [];
  for (let index = 0; index < entries.length; index++) {
    parts.push(entries[index].id);
  }
  return parts.join('|');
}

export default function searchMatrixTest(): void {
  describe('SearchMatrixTest', () => {
    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHMATRIX_0001
     * @tc.name      testEntries0001
     * @tc.desc      entries are stored and counted
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntries0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testEntries0001 begin');
      const value: SearchModel = model();
      expect(value.getEntries().length).assertEqual(4);
      expect(value.total()).assertEqual(4);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHMATRIX_0002
     * @tc.name      testEntriesReset0002
     * @tc.desc      replacing entries resets paging and selection
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntriesReset0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testEntriesReset0002 begin');
      const value: SearchModel = model();
      value.setPageSize(1);
      value.nextPage();
      value.toggleSelection('1');
      value.setEntries(sample());
      expect(value.currentPageIndex()).assertEqual(0);
      expect(value.selectedCount()).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHMATRIX_0003
     * @tc.name      testEntriesEmpty0003
     * @tc.desc      empty entry lists yield empty results
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEntriesEmpty0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testEntriesEmpty0003 begin');
      const value: SearchModel = new SearchModel();
      value.setEntries([]);
      expect(value.total()).assertEqual(0);
      expect(value.pageCount()).assertEqual(0);
      expect(value.page().items.length).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHMATRIX_0004
     * @tc.name      testKeyword0004
     * @tc.desc      keywords filter by file name
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyword0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testKeyword0004 begin');
      const value: SearchModel = model();
      value.setKeyword('docx');
      expect(idsOf(value.results())).assertEqual('4');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHMATRIX_0005
     * @tc.name      testKeywordCase0005
     * @tc.desc      keyword matching ignores case
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeywordCase0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testKeywordCase0005 begin');
      const value: SearchModel = model();
      value.setKeyword('PDF');
      expect(value.total()).assertEqual(1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHMATRIX_0006
     * @tc.name      testKeywordMiss0006
     * @tc.desc      unmatched keywords yield no entries
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeywordMiss0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testKeywordMiss0006 begin');
      const value: SearchModel = model();
      value.setKeyword('zzz');
      expect(value.total()).assertEqual(0);
      expect(value.hasActiveFilters()).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHMATRIX_0007
     * @tc.name      testKeywordBlank0007
     * @tc.desc      blank keywords are not active filters
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeywordBlank0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testKeywordBlank0007 begin');
      const value: SearchModel = model();
      value.setKeyword('   ');
      expect(value.hasActiveFilters()).assertFalse();
      expect(value.total()).assertEqual(4);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHMATRIX_0008
     * @tc.name      testKind0008
     * @tc.desc      kind filters keep the requested type
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKind0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testKind0008 begin');
      const value: SearchModel = model();
      value.setKind(FileKind.DOCUMENT);
      expect(idsOf(value.results())).assertEqual('2|4');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHMATRIX_0009
     * @tc.name      testToggleKind0009
     * @tc.desc      toggling a kind adds then removes it
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testToggleKind0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testToggleKind0009 begin');
      const value: SearchModel = model();
      value.toggleKind(FileKind.IMAGE);
      expect(value.getKinds().length).assertEqual(1);
      value.toggleKind(FileKind.IMAGE);
      expect(value.getKinds().length).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHMATRIX_0010
     * @tc.name      testTwoKinds0010
     * @tc.desc      multiple kinds combine with or semantics
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTwoKinds0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testTwoKinds0010 begin');
      const value: SearchModel = model();
      value.toggleKind(FileKind.TEXT);
      value.toggleKind(FileKind.IMAGE);
      expect(idsOf(value.results())).assertEqual('1|3');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHMATRIX_0011
     * @tc.name      testClearKinds0011
     * @tc.desc      clearing kinds restores all entries
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testClearKinds0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testClearKinds0011 begin');
      const value: SearchModel = model();
      value.setKind(FileKind.TEXT);
      value.clearKinds();
      expect(value.total()).assertEqual(4);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHMATRIX_0012
     * @tc.name      testOnlyDlp0012
     * @tc.desc      the dlp filter keeps encrypted entries
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testOnlyDlp0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testOnlyDlp0012 begin');
      const value: SearchModel = model();
      value.setOnlyDlp(true);
      expect(idsOf(value.results())).assertEqual('2|4');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHMATRIX_0013
     * @tc.name      testOnlyFavorite0013
     * @tc.desc      the favorite filter keeps favorites
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testOnlyFavorite0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testOnlyFavorite0013 begin');
      const value: SearchModel = model();
      value.setOnlyFavorite(true);
      expect(idsOf(value.results())).assertEqual('1|4');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHMATRIX_0014
     * @tc.name      testDlpKindEmpty0014
     * @tc.desc      incompatible filters yield empty results
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDlpKindEmpty0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDlpKindEmpty0014 begin');
      const value: SearchModel = model();
      value.setOnlyDlp(true);
      value.setKind(FileKind.IMAGE);
      expect(value.total()).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHMATRIX_0015
     * @tc.name      testSortName0015
     * @tc.desc      default sorting is by name
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSortName0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSortName0015 begin');
      expect(idsOf(model().results())).assertEqual('2|1|4|3');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHMATRIX_0016
     * @tc.name      testSortSize0016
     * @tc.desc      size sorting orders by byte size
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSortSize0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSortSize0016 begin');
      const value: SearchModel = model();
      value.setSort(SortField.SIZE, false);
      expect(idsOf(value.results())).assertEqual('2|4|1|3');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHMATRIX_0017
     * @tc.name      testSortTime0017
     * @tc.desc      modified sorting orders by timestamp
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSortTime0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSortTime0017 begin');
      const value: SearchModel = model();
      value.setSort(SortField.MODIFIED, false);
      expect(idsOf(value.results())).assertEqual('2|3|1|4');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHMATRIX_0018
     * @tc.name      testSortDesc0018
     * @tc.desc      descending sorting reverses the order
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSortDesc0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSortDesc0018 begin');
      const value: SearchModel = model();
      value.setSort(SortField.SIZE, true);
      expect(idsOf(value.results())).assertEqual('3|1|4|2');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHMATRIX_0019
     * @tc.name      testSortKind0019
     * @tc.desc      kind sorting follows the kind priority
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSortKind0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSortKind0019 begin');
      const value: SearchModel = model();
      value.setSort(SortField.KIND, false);
      expect(idsOf(value.results())).assertEqual('1|2|4|3');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHMATRIX_0020
     * @tc.name      testPageSizeDefault0020
     * @tc.desc      default page size matches the constant
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPageSizeDefault0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testPageSizeDefault0020 begin');
      expect(new SearchModel().getPageSize()).assertEqual(DEFAULT_PAGE_SIZE);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHMATRIX_0021
     * @tc.name      testPageSizeClamp0021
     * @tc.desc      page sizes are clamped to one through fifty
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPageSizeClamp0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testPageSizeClamp0021 begin');
      const value: SearchModel = new SearchModel();
      value.setPageSize(0);
      expect(value.getPageSize()).assertEqual(1);
      value.setPageSize(999);
      expect(value.getPageSize()).assertEqual(50);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHMATRIX_0022
     * @tc.name      testPageCount0022
     * @tc.desc      page counts follow the filtered total
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPageCount0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testPageCount0022 begin');
      const value: SearchModel = model();
      value.setPageSize(2);
      expect(value.pageCount()).assertEqual(2);
      value.setKind(FileKind.DOCUMENT);
      expect(value.pageCount()).assertEqual(1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHMATRIX_0023
     * @tc.name      testPageContent0023
     * @tc.desc      pages contain the sorted slice
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPageContent0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testPageContent0023 begin');
      const value: SearchModel = model();
      value.setPageSize(2);
      expect(idsOf(value.page().items)).assertEqual('2|1');
      value.nextPage();
      expect(idsOf(value.page().items)).assertEqual('4|3');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHMATRIX_0024
     * @tc.name      testNextLimit0024
     * @tc.desc      next page stops at the last page
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNextLimit0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testNextLimit0024 begin');
      const value: SearchModel = model();
      value.setPageSize(2);
      expect(value.nextPage()).assertTrue();
      expect(value.nextPage()).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHMATRIX_0025
     * @tc.name      testPreviousLimit0025
     * @tc.desc      previous page stops at the first page
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPreviousLimit0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testPreviousLimit0025 begin');
      const value: SearchModel = model();
      expect(value.previousPage()).assertFalse();
      value.setPageSize(2);
      value.nextPage();
      expect(value.previousPage()).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHMATRIX_0026
     * @tc.name      testPageIndexClamp0026
     * @tc.desc      page indexes are clamped to the valid range
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPageIndexClamp0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testPageIndexClamp0026 begin');
      const value: SearchModel = model();
      value.setPageSize(2);
      value.setPageIndex(99);
      expect(value.currentPageIndex()).assertEqual(1);
      value.setPageIndex(-1);
      expect(value.currentPageIndex()).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHMATRIX_0027
     * @tc.name      testToggleSelection0027
     * @tc.desc      selection toggles on and off
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testToggleSelection0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testToggleSelection0027 begin');
      const value: SearchModel = model();
      value.toggleSelection('2');
      expect(value.isSelected('2')).assertTrue();
      value.toggleSelection('2');
      expect(value.isSelected('2')).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHMATRIX_0028
     * @tc.name      testSelectUnselect0028
     * @tc.desc      explicit selection calls are idempotent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectUnselect0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSelectUnselect0028 begin');
      const value: SearchModel = model();
      value.select('3');
      value.select('3');
      expect(value.selectedCount()).assertEqual(1);
      value.unselect('3');
      value.unselect('3');
      expect(value.selectedCount()).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHMATRIX_0029
     * @tc.name      testSelectAllFiltered0029
     * @tc.desc      select all only covers filtered results
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectAllFiltered0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSelectAllFiltered0029 begin');
      const value: SearchModel = model();
      value.setKind(FileKind.DOCUMENT);
      value.selectAllResults();
      expect(value.selectedCount()).assertEqual(2);
      expect(value.isSelected('1')).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHMATRIX_0030
     * @tc.name      testSelectionSummary0030
     * @tc.desc      selection summaries count the selected files
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectionSummary0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSelectionSummary0030 begin');
      const value: SearchModel = model();
      value.toggleSelection('1');
      value.toggleSelection('3');
      expect(value.selectionSummary()).assertEqual('已选择 2 个文件');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHMATRIX_0031
     * @tc.name      testSelectedEntries0031
     * @tc.desc      selected entries follow the source order
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectedEntries0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSelectedEntries0031 begin');
      const value: SearchModel = model();
      value.toggleSelection('4');
      value.toggleSelection('2');
      expect(idsOf(value.selectedEntries())).assertEqual('2|4');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHMATRIX_0032
     * @tc.name      testSelectionPaging0032
     * @tc.desc      selection survives paging changes
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectionPaging0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSelectionPaging0032 begin');
      const value: SearchModel = model();
      value.setPageSize(2);
      value.toggleSelection('1');
      value.nextPage();
      expect(value.isSelected('1')).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHMATRIX_0033
     * @tc.name      testClearSelection0033
     * @tc.desc      clearing removes every selection
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testClearSelection0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testClearSelection0033 begin');
      const value: SearchModel = model();
      value.selectAllResults();
      value.clearSelection();
      expect(value.selectedCount()).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHMATRIX_0034
     * @tc.name      testActiveFilters0034
     * @tc.desc      active filter detection covers all filters
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testActiveFilters0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testActiveFilters0034 begin');
      const value: SearchModel = model();
      expect(value.hasActiveFilters()).assertFalse();
      value.setOnlyFavorite(true);
      expect(value.hasActiveFilters()).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHMATRIX_0035
     * @tc.name      testActiveCount0035
     * @tc.desc      filter counts add keywords kinds and flags
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testActiveCount0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testActiveCount0035 begin');
      const value: SearchModel = model();
      value.setKeyword('a');
      value.toggleKind(FileKind.TEXT);
      value.toggleKind(FileKind.IMAGE);
      value.setOnlyDlp(true);
      value.setOnlyFavorite(true);
      expect(value.activeFilterCount()).assertEqual(5);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHMATRIX_0036
     * @tc.name      testResetFilters0036
     * @tc.desc      reset clears filters and restores sorting
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResetFilters0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testResetFilters0036 begin');
      const value: SearchModel = model();
      value.setKeyword('x');
      value.setKind(FileKind.TEXT);
      value.setSort(SortField.SIZE, true);
      value.resetFilters();
      expect(value.hasActiveFilters()).assertFalse();
      expect(value.getSortField()).assertEqual(SortField.NAME);
      expect(idsOf(value.results())).assertEqual('2|1|4|3');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHMATRIX_0037
     * @tc.name      testResultsPaging0037
     * @tc.desc      results are independent of paging
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResultsPaging0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testResultsPaging0037 begin');
      const value: SearchModel = model();
      value.setPageSize(1);
      value.nextPage();
      expect(value.results().length).assertEqual(4);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHMATRIX_0038
     * @tc.name      testGetters0038
     * @tc.desc      getters reflect the configured values
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testGetters0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testGetters0038 begin');
      const value: SearchModel = model();
      value.setKeyword('abc');
      value.setKind(FileKind.TEXT);
      value.setSort(SortField.MODIFIED, false);
      expect(value.getKeyword()).assertEqual('abc');
      expect(value.getKinds().length).assertEqual(1);
      expect(value.getSortField()).assertEqual(SortField.MODIFIED);
      expect(value.isDescending()).assertFalse();
    })
  });
}
