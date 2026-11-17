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
import { SearchModel, DEFAULT_PAGE_SIZE } from '../main/ets/feature/SearchModel';

function item(id: string, name: string, kind: FileKind, size: number, modified: number, isDlp: boolean,
  isFavorite: boolean): FileEntry {
  return new FileEntry(id, name, 'file:///docs/' + name, kind, size, modified, isDlp, isFavorite);
}

function sampleEntries(): FileEntry[] {
  return [
    item('1', 'Beta.txt', FileKind.TEXT, 300, 3000, false, true),
    item('2', 'alpha.PDF', FileKind.DOCUMENT, 100, 1000, true, false),
    item('3', 'gamma.png', FileKind.IMAGE, 500, 2000, false, false),
    item('4', 'delta.docx', FileKind.DOCUMENT, 200, 4000, true, true),
    item('5', 'note.md', FileKind.TEXT, 50, 500, false, false)
  ];
}

function idsOf(entries: FileEntry[]): string {
  const parts: string[] = [];
  for (let index = 0; index < entries.length; index++) {
    parts.push(entries[index].id);
  }
  return parts.join('|');
}

function modelWithEntries(): SearchModel {
  const model: SearchModel = new SearchModel();
  model.setEntries(sampleEntries());
  return model;
}

export default function searchModelTest(): void {
  describe('SearchModelTest', () => {
    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHMODEL_0001
     * @tc.name      testSetEntries0001
     * @tc.desc      entries are stored and counted
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSetEntries0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSetEntries0001 begin');
      console.info('testSetEntries0001 begin');
      const model: SearchModel = modelWithEntries();
      expect(model.getEntries().length).assertEqual(5);
      expect(model.total()).assertEqual(5);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHMODEL_0002
     * @tc.name      testSetEntriesResets0002
     * @tc.desc      replacing entries clears selection and paging
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSetEntriesResets0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSetEntriesResets0002 begin');
      console.info('testSetEntriesResets0002 begin');
      const model: SearchModel = modelWithEntries();
      model.setPageSize(2);
      model.toggleSelection('1');
      model.setPageIndex(2);
      model.setEntries(sampleEntries());
      expect(model.selectedCount()).assertEqual(0);
      expect(model.currentPageIndex()).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHMODEL_0003
     * @tc.name      testSetEntriesEmpty0003
     * @tc.desc      empty entry list yields zero results
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSetEntriesEmpty0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSetEntriesEmpty0003 begin');
      console.info('testSetEntriesEmpty0003 begin');
      const model: SearchModel = new SearchModel();
      model.setEntries([]);
      expect(model.total()).assertEqual(0);
      expect(model.pageCount()).assertEqual(0);
      expect(model.page().items.length).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHMODEL_0004
     * @tc.name      testDefaultPageSize0004
     * @tc.desc      default page size is used before configuration
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDefaultPageSize0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDefaultPageSize0004 begin');
      console.info('testDefaultPageSize0004 begin');
      expect(new SearchModel().getPageSize()).assertEqual(DEFAULT_PAGE_SIZE);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHMODEL_0005
     * @tc.name      testPageSizeClampLow0005
     * @tc.desc      page size below one is clamped
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPageSizeClampLow0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testPageSizeClampLow0005 begin');
      console.info('testPageSizeClampLow0005 begin');
      const model: SearchModel = new SearchModel();
      model.setPageSize(0);
      expect(model.getPageSize()).assertEqual(1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHMODEL_0006
     * @tc.name      testPageSizeClampHigh0006
     * @tc.desc      page size above fifty is clamped
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPageSizeClampHigh0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testPageSizeClampHigh0006 begin');
      console.info('testPageSizeClampHigh0006 begin');
      const model: SearchModel = new SearchModel();
      model.setPageSize(100);
      expect(model.getPageSize()).assertEqual(50);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHMODEL_0007
     * @tc.name      testKeywordFilter0007
     * @tc.desc      keyword filters entries by name
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeywordFilter0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testKeywordFilter0007 begin');
      console.info('testKeywordFilter0007 begin');
      const model: SearchModel = modelWithEntries();
      model.setKeyword('docx');
      expect(model.total()).assertEqual(1);
      expect(model.results()[0].id).assertEqual('4');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHMODEL_0008
     * @tc.name      testKeywordCase0008
     * @tc.desc      keyword matching ignores case
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeywordCase0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testKeywordCase0008 begin');
      console.info('testKeywordCase0008 begin');
      const model: SearchModel = modelWithEntries();
      model.setKeyword('PDF');
      expect(model.total()).assertEqual(1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHMODEL_0009
     * @tc.name      testKeywordResetPage0009
     * @tc.desc      keyword changes return to the first page
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeywordResetPage0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testKeywordResetPage0009 begin');
      console.info('testKeywordResetPage0009 begin');
      const model: SearchModel = modelWithEntries();
      model.setPageSize(1);
      model.nextPage();
      model.setKeyword('a');
      expect(model.currentPageIndex()).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHMODEL_0010
     * @tc.name      testKindFilter0010
     * @tc.desc      kind filter keeps only the requested kind
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKindFilter0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testKindFilter0010 begin');
      console.info('testKindFilter0010 begin');
      const model: SearchModel = modelWithEntries();
      model.setKind(FileKind.DOCUMENT);
      expect(idsOf(model.results())).assertEqual('2|4');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHMODEL_0011
     * @tc.name      testToggleKind0011
     * @tc.desc      toggling a kind adds then removes it
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testToggleKind0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testToggleKind0011 begin');
      console.info('testToggleKind0011 begin');
      const model: SearchModel = modelWithEntries();
      model.toggleKind(FileKind.TEXT);
      expect(model.getKinds().length).assertEqual(1);
      expect(idsOf(model.results())).assertEqual('1|5');
      model.toggleKind(FileKind.TEXT);
      expect(model.getKinds().length).assertEqual(0);
      expect(model.total()).assertEqual(5);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHMODEL_0012
     * @tc.name      testToggleTwoKinds0012
     * @tc.desc      multiple kinds are combined with or semantics
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testToggleTwoKinds0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testToggleTwoKinds0012 begin');
      console.info('testToggleTwoKinds0012 begin');
      const model: SearchModel = modelWithEntries();
      model.toggleKind(FileKind.TEXT);
      model.toggleKind(FileKind.DOCUMENT);
      expect(model.results().length).assertEqual(4);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHMODEL_0013
     * @tc.name      testClearKinds0013
     * @tc.desc      clearing kinds restores all entries
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testClearKinds0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testClearKinds0013 begin');
      console.info('testClearKinds0013 begin');
      const model: SearchModel = modelWithEntries();
      model.setKind(FileKind.IMAGE);
      model.clearKinds();
      expect(model.getKinds().length).assertEqual(0);
      expect(model.total()).assertEqual(5);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHMODEL_0014
     * @tc.name      testKindResetPage0014
     * @tc.desc      kind changes return to the first page
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKindResetPage0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testKindResetPage0014 begin');
      console.info('testKindResetPage0014 begin');
      const model: SearchModel = modelWithEntries();
      model.setPageSize(1);
      model.nextPage();
      model.setKind(FileKind.TEXT);
      expect(model.currentPageIndex()).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHMODEL_0015
     * @tc.name      testOnlyDlp0015
     * @tc.desc      dlp filter keeps encrypted entries
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testOnlyDlp0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testOnlyDlp0015 begin');
      console.info('testOnlyDlp0015 begin');
      const model: SearchModel = modelWithEntries();
      model.setOnlyDlp(true);
      expect(idsOf(model.results())).assertEqual('2|4');
      model.setOnlyDlp(false);
      expect(model.total()).assertEqual(5);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHMODEL_0016
     * @tc.name      testOnlyFavorite0016
     * @tc.desc      favorite filter keeps favorite entries
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testOnlyFavorite0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testOnlyFavorite0016 begin');
      console.info('testOnlyFavorite0016 begin');
      const model: SearchModel = modelWithEntries();
      model.setOnlyFavorite(true);
      expect(idsOf(model.results())).assertEqual('1|4');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHMODEL_0017
     * @tc.name      testDlpAndKind0017
     * @tc.desc      dlp and kind filters combine
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDlpAndKind0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDlpAndKind0017 begin');
      console.info('testDlpAndKind0017 begin');
      const model: SearchModel = modelWithEntries();
      model.setOnlyDlp(true);
      model.setKind(FileKind.DOCUMENT);
      expect(idsOf(model.results())).assertEqual('2|4');
      model.setKind(FileKind.TEXT);
      expect(model.total()).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHMODEL_0018
     * @tc.name      testSortName0018
     * @tc.desc      name sort is ascending by default
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSortName0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSortName0018 begin');
      console.info('testSortName0018 begin');
      const model: SearchModel = modelWithEntries();
      expect(idsOf(model.results())).assertEqual('2|1|4|3|5');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHMODEL_0019
     * @tc.name      testSortSize0019
     * @tc.desc      size sort orders entries by byte size
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSortSize0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSortSize0019 begin');
      console.info('testSortSize0019 begin');
      const model: SearchModel = modelWithEntries();
      model.setSort(SortField.SIZE, false);
      expect(idsOf(model.results())).assertEqual('5|2|4|1|3');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHMODEL_0020
     * @tc.name      testSortTime0020
     * @tc.desc      modified sort orders entries by timestamp
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSortTime0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSortTime0020 begin');
      console.info('testSortTime0020 begin');
      const model: SearchModel = modelWithEntries();
      model.setSort(SortField.MODIFIED, false);
      expect(idsOf(model.results())).assertEqual('5|2|3|1|4');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHMODEL_0021
     * @tc.name      testSortDescending0021
     * @tc.desc      descending sort reverses the comparison
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSortDescending0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSortDescending0021 begin');
      console.info('testSortDescending0021 begin');
      const model: SearchModel = modelWithEntries();
      model.setSort(SortField.SIZE, true);
      expect(idsOf(model.results())).assertEqual('3|1|4|2|5');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHMODEL_0022
     * @tc.name      testSortResetPage0022
     * @tc.desc      sort changes return to the first page
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSortResetPage0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSortResetPage0022 begin');
      console.info('testSortResetPage0022 begin');
      const model: SearchModel = modelWithEntries();
      model.setPageSize(2);
      model.nextPage();
      model.setSort(SortField.SIZE, false);
      expect(model.currentPageIndex()).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHMODEL_0023
     * @tc.name      testPaging0023
     * @tc.desc      pages split sorted results by page size
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPaging0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testPaging0023 begin');
      console.info('testPaging0023 begin');
      const model: SearchModel = modelWithEntries();
      model.setPageSize(2);
      expect(model.pageCount()).assertEqual(3);
      expect(idsOf(model.page().items)).assertEqual('2|1');
      model.nextPage();
      expect(idsOf(model.page().items)).assertEqual('4|3');
      model.nextPage();
      expect(idsOf(model.page().items)).assertEqual('5');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHMODEL_0024
     * @tc.name      testNextPageLimit0024
     * @tc.desc      next page stops at the last page
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNextPageLimit0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testNextPageLimit0024 begin');
      console.info('testNextPageLimit0024 begin');
      const model: SearchModel = modelWithEntries();
      model.setPageSize(2);
      expect(model.nextPage()).assertTrue();
      expect(model.nextPage()).assertTrue();
      expect(model.nextPage()).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHMODEL_0025
     * @tc.name      testPreviousPage0025
     * @tc.desc      previous page stops at the first page
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPreviousPage0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testPreviousPage0025 begin');
      console.info('testPreviousPage0025 begin');
      const model: SearchModel = modelWithEntries();
      expect(model.previousPage()).assertFalse();
      model.setPageSize(2);
      model.nextPage();
      expect(model.previousPage()).assertTrue();
      expect(model.currentPageIndex()).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHMODEL_0026
     * @tc.name      testSetPageClamp0026
     * @tc.desc      page index is clamped to the valid range
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSetPageClamp0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSetPageClamp0026 begin');
      console.info('testSetPageClamp0026 begin');
      const model: SearchModel = modelWithEntries();
      model.setPageSize(2);
      model.setPageIndex(99);
      expect(model.currentPageIndex()).assertEqual(2);
      model.setPageIndex(-5);
      expect(model.currentPageIndex()).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHMODEL_0027
     * @tc.name      testEmptyPageCount0027
     * @tc.desc      empty results report zero pages
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEmptyPageCount0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testEmptyPageCount0027 begin');
      console.info('testEmptyPageCount0027 begin');
      const model: SearchModel = modelWithEntries();
      model.setKeyword('zzz');
      expect(model.pageCount()).assertEqual(0);
      expect(model.page().items.length).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHMODEL_0028
     * @tc.name      testPageResultTotal0028
     * @tc.desc      page result total reflects all filtered entries
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPageResultTotal0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testPageResultTotal0028 begin');
      console.info('testPageResultTotal0028 begin');
      const model: SearchModel = modelWithEntries();
      model.setPageSize(2);
      const page: QueryResult = model.page();
      expect(page.total).assertEqual(5);
      expect(page.items.length).assertEqual(2);
      expect(page.hasMore).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHMODEL_0029
     * @tc.name      testActiveFilters0029
     * @tc.desc      active filter detection covers all filters
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testActiveFilters0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testActiveFilters0029 begin');
      console.info('testActiveFilters0029 begin');
      const model: SearchModel = modelWithEntries();
      expect(model.hasActiveFilters()).assertFalse();
      model.setOnlyDlp(true);
      expect(model.hasActiveFilters()).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHMODEL_0030
     * @tc.name      testActiveFilterCount0030
     * @tc.desc      filter count adds keyword kinds and flags
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testActiveFilterCount0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testActiveFilterCount0030 begin');
      console.info('testActiveFilterCount0030 begin');
      const model: SearchModel = modelWithEntries();
      model.setKeyword('a');
      model.toggleKind(FileKind.TEXT);
      model.toggleKind(FileKind.IMAGE);
      model.setOnlyDlp(true);
      model.setOnlyFavorite(true);
      expect(model.activeFilterCount()).assertEqual(5);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHMODEL_0031
     * @tc.name      testResetFilters0031
     * @tc.desc      reset clears keyword kinds and flags
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResetFilters0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testResetFilters0031 begin');
      console.info('testResetFilters0031 begin');
      const model: SearchModel = modelWithEntries();
      model.setKeyword('a');
      model.setKind(FileKind.TEXT);
      model.setOnlyDlp(true);
      model.resetFilters();
      expect(model.hasActiveFilters()).assertFalse();
      expect(model.total()).assertEqual(5);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHMODEL_0032
     * @tc.name      testResetFiltersSort0032
     * @tc.desc      reset restores the default sort
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResetFiltersSort0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testResetFiltersSort0032 begin');
      console.info('testResetFiltersSort0032 begin');
      const model: SearchModel = modelWithEntries();
      model.setSort(SortField.SIZE, true);
      model.resetFilters();
      expect(model.getSortField()).assertEqual(SortField.NAME);
      expect(model.isDescending()).assertFalse();
      expect(idsOf(model.results())).assertEqual('2|1|4|3|5');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHMODEL_0033
     * @tc.name      testToggleSelection0033
     * @tc.desc      selection toggles on and off
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testToggleSelection0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testToggleSelection0033 begin');
      console.info('testToggleSelection0033 begin');
      const model: SearchModel = modelWithEntries();
      model.toggleSelection('1');
      expect(model.isSelected('1')).assertTrue();
      expect(model.selectedCount()).assertEqual(1);
      model.toggleSelection('1');
      expect(model.isSelected('1')).assertFalse();
      expect(model.selectedCount()).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHMODEL_0034
     * @tc.name      testSelectUnselect0034
     * @tc.desc      explicit select and unselect are idempotent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectUnselect0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSelectUnselect0034 begin');
      console.info('testSelectUnselect0034 begin');
      const model: SearchModel = modelWithEntries();
      model.select('2');
      model.select('2');
      expect(model.selectedCount()).assertEqual(1);
      model.unselect('2');
      model.unselect('2');
      expect(model.selectedCount()).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHMODEL_0035
     * @tc.name      testSelectAllResults0035
     * @tc.desc      select all only covers filtered results
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectAllResults0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSelectAllResults0035 begin');
      console.info('testSelectAllResults0035 begin');
      const model: SearchModel = modelWithEntries();
      model.setKind(FileKind.DOCUMENT);
      model.selectAllResults();
      expect(model.selectedCount()).assertEqual(2);
      expect(model.isSelected('1')).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHMODEL_0036
     * @tc.name      testSelectAllEmpty0036
     * @tc.desc      select all on empty results selects nothing
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectAllEmpty0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSelectAllEmpty0036 begin');
      console.info('testSelectAllEmpty0036 begin');
      const model: SearchModel = modelWithEntries();
      model.setKeyword('zzz');
      model.selectAllResults();
      expect(model.selectedCount()).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHMODEL_0037
     * @tc.name      testSelectionAcrossPages0037
     * @tc.desc      selection survives paging changes
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectionAcrossPages0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSelectionAcrossPages0037 begin');
      console.info('testSelectionAcrossPages0037 begin');
      const model: SearchModel = modelWithEntries();
      model.setPageSize(2);
      model.toggleSelection('1');
      model.nextPage();
      expect(model.isSelected('1')).assertTrue();
      expect(model.selectedCount()).assertEqual(1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHMODEL_0038
     * @tc.name      testSelectedEntries0038
     * @tc.desc      selected entries follow the source order
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectedEntries0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSelectedEntries0038 begin');
      console.info('testSelectedEntries0038 begin');
      const model: SearchModel = modelWithEntries();
      model.toggleSelection('4');
      model.toggleSelection('2');
      expect(idsOf(model.selectedEntries())).assertEqual('2|4');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHMODEL_0039
     * @tc.name      testSelectedIds0039
     * @tc.desc      selected ids keep insertion order
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectedIds0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSelectedIds0039 begin');
      console.info('testSelectedIds0039 begin');
      const model: SearchModel = modelWithEntries();
      model.toggleSelection('3');
      model.toggleSelection('1');
      expect(idsOf(model.selectedEntries())).assertEqual('1|3');
      expect(model.getSelectedIds().length).assertEqual(2);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHMODEL_0040
     * @tc.name      testClearSelection0040
     * @tc.desc      clearing removes every selection
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testClearSelection0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testClearSelection0040 begin');
      console.info('testClearSelection0040 begin');
      const model: SearchModel = modelWithEntries();
      model.selectAllResults();
      model.clearSelection();
      expect(model.selectedCount()).assertEqual(0);
      expect(model.selectedEntries().length).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHMODEL_0041
     * @tc.name      testSelectionSummary0041
     * @tc.desc      selection summary counts selected files
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectionSummary0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSelectionSummary0041 begin');
      console.info('testSelectionSummary0041 begin');
      const model: SearchModel = modelWithEntries();
      model.toggleSelection('1');
      model.toggleSelection('2');
      expect(model.selectionSummary()).assertEqual('已选择 2 个文件');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHMODEL_0042
     * @tc.name      testKeywordAndKind0042
     * @tc.desc      keyword and kind filters combine
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeywordAndKind0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testKeywordAndKind0042 begin');
      console.info('testKeywordAndKind0042 begin');
      const model: SearchModel = modelWithEntries();
      model.setKeyword('a');
      model.setKind(FileKind.DOCUMENT);
      expect(idsOf(model.results())).assertEqual('2|4');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHMODEL_0043
     * @tc.name      testKeywordNoResult0043
     * @tc.desc      unmatched keywords yield no entries
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeywordNoResult0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testKeywordNoResult0043 begin');
      console.info('testKeywordNoResult0043 begin');
      const model: SearchModel = modelWithEntries();
      model.setKeyword('not-exist');
      expect(model.total()).assertEqual(0);
      expect(model.hasActiveFilters()).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHMODEL_0044
     * @tc.name      testKeywordBlank0044
     * @tc.desc      blank keywords are not active filters
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeywordBlank0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testKeywordBlank0044 begin');
      console.info('testKeywordBlank0044 begin');
      const model: SearchModel = modelWithEntries();
      model.setKeyword('   ');
      expect(model.hasActiveFilters()).assertFalse();
      expect(model.total()).assertEqual(5);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHMODEL_0045
     * @tc.name      testPageAfterFilter0045
     * @tc.desc      paging applies to the filtered result set
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPageAfterFilter0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testPageAfterFilter0045 begin');
      console.info('testPageAfterFilter0045 begin');
      const model: SearchModel = modelWithEntries();
      model.setKind(FileKind.TEXT);
      model.setPageSize(1);
      expect(model.pageCount()).assertEqual(2);
      expect(idsOf(model.page().items)).assertEqual('1');
      model.nextPage();
      expect(idsOf(model.page().items)).assertEqual('5');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHMODEL_0046
     * @tc.name      testResultsSorted0046
     * @tc.desc      results are sorted independently of paging
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResultsSorted0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testResultsSorted0046 begin');
      console.info('testResultsSorted0046 begin');
      const model: SearchModel = modelWithEntries();
      model.setPageSize(2);
      model.nextPage();
      expect(idsOf(model.results())).assertEqual('2|1|4|3|5');
    })
  });
}
