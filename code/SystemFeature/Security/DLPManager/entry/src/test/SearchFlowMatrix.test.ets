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
import { FileEntry, SortField } from '../main/ets/core/FileQueryCore';
import { SearchModel } from '../main/ets/feature/SearchModel';

function item(id: string, name: string, kind: FileKind, size: number, modified: number, isDlp: boolean,
  isFavorite: boolean): FileEntry {
  return new FileEntry(id, name, 'file:///docs/' + name, kind, size, modified, isDlp, isFavorite);
}

function entries(): Array<FileEntry> {
  return [
    item('1', 'Beta.txt', FileKind.TEXT, 300, 3000, false, true),
    item('2', 'alpha.PDF', FileKind.DOCUMENT, 100, 1000, true, false),
    item('3', 'gamma.png', FileKind.IMAGE, 500, 2000, false, false),
    item('4', 'delta.docx', FileKind.DOCUMENT, 200, 4000, true, true)
  ];
}

function model(): SearchModel {
  const value: SearchModel = new SearchModel();
  value.setEntries(entries());
  return value;
}

function idsOf(values: Array<FileEntry>): string {
  const parts: Array<string> = [];
  for (let index = 0; index < values.length; index++) {
    parts.push(values[index].id);
  }
  return parts.join('|');
}

export default function searchFlowMatrixTest(): void {
  describe('SearchFlowMatrixTest', () => {
    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHFLOW_0001
     * @tc.name      testKeywordThenDlp0001
     * @tc.desc      keyword and dlp filters combine
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeywordThenDlp0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const value: SearchModel = model();
      value.setKeyword('a');
      value.setOnlyDlp(true);
      expect(idsOf(value.results())).assertEqual('2|4');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHFLOW_0002
     * @tc.name      testKeywordSingle0002
     * @tc.desc      specific keywords narrow to one file
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeywordSingle0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const value: SearchModel = model();
      value.setKeyword('docx');
      value.setOnlyDlp(true);
      expect(idsOf(value.results())).assertEqual('4');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHFLOW_0003
     * @tc.name      testToggleKindSequence0003
     * @tc.desc      toggling kinds accumulates and removes filters
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testToggleKindSequence0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const value: SearchModel = model();
      value.toggleKind(FileKind.TEXT);
      value.toggleKind(FileKind.DOCUMENT);
      expect(idsOf(value.results())).assertEqual('2|1|4');
      value.toggleKind(FileKind.TEXT);
      expect(idsOf(value.results())).assertEqual('2|4');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHFLOW_0004
     * @tc.name      testFilterReset0004
     * @tc.desc      resetting restores all entries
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFilterReset0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const value: SearchModel = model();
      value.setKeyword('a');
      value.setOnlyDlp(true);
      value.setKind(FileKind.DOCUMENT);
      value.resetFilters();
      expect(value.total()).assertEqual(4);
      expect(value.hasActiveFilters()).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHFLOW_0005
     * @tc.name      testSortSize0005
     * @tc.desc      size sorting orders files by bytes
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSortSize0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const value: SearchModel = model();
      value.setSort(SortField.SIZE, false);
      expect(idsOf(value.results())).assertEqual('2|4|1|3');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHFLOW_0006
     * @tc.name      testSortTimeDesc0006
     * @tc.desc      descending time sorting puts newest first
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSortTimeDesc0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const value: SearchModel = model();
      value.setSort(SortField.MODIFIED, true);
      expect(idsOf(value.results())).assertEqual('4|1|3|2');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHFLOW_0007
     * @tc.name      testSortCycle0007
     * @tc.desc      sorting can be cycled and reset
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSortCycle0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const value: SearchModel = model();
      value.setSort(SortField.SIZE, false);
      value.setSort(SortField.KIND, false);
      value.setSort(SortField.NAME, false);
      expect(idsOf(value.results())).assertEqual('2|1|4|3');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHFLOW_0008
     * @tc.name      testPageCountFilter0008
     * @tc.desc      page counts follow the filtered total
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPageCountFilter0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const value: SearchModel = model();
      value.setPageSize(2);
      expect(value.pageCount()).assertEqual(2);
      value.setKind(FileKind.DOCUMENT);
      expect(value.pageCount()).assertEqual(1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHFLOW_0009
     * @tc.name      testFilterResetsPage0009
     * @tc.desc      filter changes return to the first page
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFilterResetsPage0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const value: SearchModel = model();
      value.setPageSize(1);
      value.nextPage();
      value.setKeyword('a');
      expect(value.currentPageIndex()).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHFLOW_0010
     * @tc.name      testSortResetsPage0010
     * @tc.desc      sort changes return to the first page
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSortResetsPage0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const value: SearchModel = model();
      value.setPageSize(1);
      value.nextPage();
      value.setSort(SortField.SIZE, false);
      expect(value.currentPageIndex()).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHFLOW_0011
     * @tc.name      testSelectionKeptAcrossFilter0011
     * @tc.desc      selection survives filter changes
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectionKeptAcrossFilter0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const value: SearchModel = model();
      value.toggleSelection('1');
      value.setKind(FileKind.DOCUMENT);
      expect(value.isSelected('1')).assertTrue();
      expect(value.selectedCount()).assertEqual(1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHFLOW_0012
     * @tc.name      testSelectionKeptAcrossReset0012
     * @tc.desc      resetting filters keeps the selection
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectionKeptAcrossReset0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const value: SearchModel = model();
      value.toggleSelection('2');
      value.resetFilters();
      expect(value.selectedCount()).assertEqual(1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHFLOW_0013
     * @tc.name      testSelectionClearedOnEntries0013
     * @tc.desc      replacing entries clears the selection
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectionClearedOnEntries0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const value: SearchModel = model();
      value.toggleSelection('2');
      value.setEntries(entries());
      expect(value.selectedCount()).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHFLOW_0014
     * @tc.name      testSelectAllFiltered0014
     * @tc.desc      select all covers the filtered result set
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectAllFiltered0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const value: SearchModel = model();
      value.setKind(FileKind.DOCUMENT);
      value.selectAllResults();
      expect(value.selectedCount()).assertEqual(2);
      expect(value.isSelected('1')).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHFLOW_0015
     * @tc.name      testSelectAllEmpty0015
     * @tc.desc      select all selects nothing when results are empty
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectAllEmpty0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const value: SearchModel = model();
      value.setKeyword('zzz');
      value.selectAllResults();
      expect(value.selectedCount()).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHFLOW_0016
     * @tc.name      testSelectedEntriesFiltered0016
     * @tc.desc      selected entries can be listed after filtering
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectedEntriesFiltered0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const value: SearchModel = model();
      value.toggleSelection('4');
      value.toggleSelection('1');
      expect(idsOf(value.selectedEntries())).assertEqual('1|4');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHFLOW_0017
     * @tc.name      testSummaryFlow0017
     * @tc.desc      summaries track selection changes
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSummaryFlow0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const value: SearchModel = model();
      value.toggleSelection('1');
      expect(value.selectionSummary()).assertEqual('已选择 1 个文件');
      value.toggleSelection('3');
      expect(value.selectionSummary()).assertEqual('已选择 2 个文件');
      value.clearSelection();
      expect(value.selectionSummary()).assertEqual('已选择 0 个文件');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHFLOW_0018
     * @tc.name      testFilterCountFlow0018
     * @tc.desc      filter counts change with each filter
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFilterCountFlow0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const value: SearchModel = model();
      expect(value.activeFilterCount()).assertEqual(0);
      value.setKeyword('a');
      expect(value.activeFilterCount()).assertEqual(1);
      value.setOnlyDlp(true);
      expect(value.activeFilterCount()).assertEqual(2);
      value.resetFilters();
      expect(value.activeFilterCount()).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHFLOW_0019
     * @tc.name      testPagingNextPrev0019
     * @tc.desc      paging navigation reports movement
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPagingNextPrev0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const value: SearchModel = model();
      value.setPageSize(2);
      expect(value.nextPage()).assertTrue();
      expect(value.nextPage()).assertFalse();
      expect(value.previousPage()).assertTrue();
      expect(value.previousPage()).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHFLOW_0020
     * @tc.name      testPageClampAfterFilter0020
     * @tc.desc      page indexes clamp when results shrink
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPageClampAfterFilter0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const value: SearchModel = model();
      value.setPageSize(1);
      value.setPageIndex(3);
      expect(value.currentPageIndex()).assertEqual(3);
      value.setPageIndex(99);
      expect(value.currentPageIndex()).assertEqual(3);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHFLOW_0021
     * @tc.name      testPageTotalFiltered0021
     * @tc.desc      page results report the filtered total
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPageTotalFiltered0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const value: SearchModel = model();
      value.setKind(FileKind.DOCUMENT);
      value.setPageSize(1);
      expect(value.page().total).assertEqual(2);
      expect(value.page().items.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHFLOW_0022
     * @tc.name      testUnselectMissing0022
     * @tc.desc      unselecting missing ids is safe
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testUnselectMissing0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const value: SearchModel = model();
      value.toggleSelection('1');
      value.unselect('missing');
      expect(value.selectedCount()).assertEqual(1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHFLOW_0023
     * @tc.name      testSelectIdempotent0023
     * @tc.desc      selecting the same id twice keeps one selection
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectIdempotent0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const value: SearchModel = model();
      value.select('2');
      value.select('2');
      expect(value.selectedCount()).assertEqual(1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHFLOW_0024
     * @tc.name      testDescendingGetter0024
     * @tc.desc      descending getters reflect the sort settings
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDescendingGetter0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const value: SearchModel = model();
      value.setSort(SortField.SIZE, true);
      expect(value.isDescending()).assertTrue();
      expect(value.getSortField()).assertEqual(SortField.SIZE);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHFLOW_0025
     * @tc.name      testKindResetPage0025
     * @tc.desc      kind changes reset the page index
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKindResetPage0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const value: SearchModel = model();
      value.setPageSize(1);
      value.nextPage();
      value.toggleKind(FileKind.TEXT);
      expect(value.currentPageIndex()).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHFLOW_0026
     * @tc.name      testFavoriteToggle0026
     * @tc.desc      favorite filters can be turned off
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFavoriteToggle0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const value: SearchModel = model();
      value.setOnlyFavorite(true);
      expect(value.total()).assertEqual(2);
      value.setOnlyFavorite(false);
      expect(value.total()).assertEqual(4);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHFLOW_0027
     * @tc.name      testNoResultsPage0027
     * @tc.desc      empty filters produce empty pages
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNoResultsPage0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const value: SearchModel = model();
      value.setKeyword('zzz');
      expect(value.pageCount()).assertEqual(0);
      expect(value.page().items.length).assertEqual(0);
      expect(value.page().hasMore).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHFLOW_0028
     * @tc.name      testCombinedFilters0028
     * @tc.desc      all filters can be combined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCombinedFilters0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const value: SearchModel = model();
      value.setKeyword('a');
      value.setKind(FileKind.DOCUMENT);
      value.setOnlyDlp(true);
      value.setOnlyFavorite(true);
      expect(idsOf(value.results())).assertEqual('4');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHFLOW_0029
     * @tc.name      testResultsAfterSortFilter0029
     * @tc.desc      sorting is applied to filtered results
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResultsAfterSortFilter0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const value: SearchModel = model();
      value.setKind(FileKind.DOCUMENT);
      value.setSort(SortField.SIZE, true);
      expect(idsOf(value.results())).assertEqual('4|2');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHFLOW_0030
     * @tc.name      testPageAfterSortPaging0030
     * @tc.desc      pages follow the sorted filtered order
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPageAfterSortPaging0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const value: SearchModel = model();
      value.setSort(SortField.SIZE, false);
      value.setPageSize(2);
      expect(idsOf(value.page().items)).assertEqual('2|4');
    })
  });
}
