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
import { DlpPolicy, DlpPermission, PolicyTemplate, hasPermission } from '../main/ets/core/DlpPolicyCore';
import { ErrorInfo, formatCode, lookupError } from '../main/ets/core/ErrorCodeCore';
import { DetailModel, DetailRow } from '../main/ets/feature/DetailModel';
import { SearchModel } from '../main/ets/feature/SearchModel';
import { RecentItem, RecentModel, RECENT_CAPACITY, buildId, parseRecentText } from '../main/ets/feature/RecentModel';
import { TemplateModel } from '../main/ets/feature/TemplateModel';
import { SettingsModel } from '../main/ets/feature/SettingsModel';
import { ErrorCenterModel } from '../main/ets/feature/ErrorCenterModel';

function item(id: string, name: string, kind: FileKind, size: number, modified: number, isDlp: boolean,
  isFavorite: boolean): FileEntry {
  return new FileEntry(id, name, 'file:///docs/' + name, kind, size, modified, isDlp, isFavorite);
}

function entries(): FileEntry[] {
  return [
    item('1', 'Beta.txt', FileKind.TEXT, 300, 3000, false, true),
    item('2', 'alpha.PDF', FileKind.DOCUMENT, 100, 1000, true, false),
    item('4', 'delta.docx', FileKind.DOCUMENT, 200, 4000, true, true)
  ];
}

function search(): SearchModel {
  const value: SearchModel = new SearchModel();
  value.setEntries(entries());
  return value;
}

function valueOf(rows: DetailRow[], label: string): string {
  for (let index = 0; index < rows.length; index++) {
    if (rows[index].label === label) {
      return rows[index].value;
    }
  }
  return '';
}

export default function crossModuleMatrixTest(): void {
  describe('CrossModuleMatrixTest', () => {
    /**
     * @tc.number    SUB_DLP_MANAGER_CROSS_0001
     * @tc.name      testSearchToDetail0001
     * @tc.desc      search results feed the detail summary
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSearchToDetail0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: SearchModel = search();
      model.setKeyword('docx');
      const matched: FileEntry = model.results()[0];
      expect(DetailModel.summary(matched.name, matched.sizeBytes)).assertEqual('文档 · 200 B');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_CROSS_0002
     * @tc.name      testDlpDetailRows0002
     * @tc.desc      dlp search results produce eight detail rows
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDlpDetailRows0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: SearchModel = search();
      model.setOnlyDlp(true);
      const matched: FileEntry = model.results()[0];
      const rows: DetailRow[] = DetailModel.build(matched.name + '.dlp', matched.uri, matched.sizeBytes,
        matched.modifiedAtSec, true);
      expect(matched.name).assertEqual('alpha.PDF');
      expect(rows.length).assertEqual(8);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_CROSS_0003
     * @tc.name      testTextDetailRows0003
     * @tc.desc      plain search results produce seven detail rows
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTextDetailRows0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: SearchModel = search();
      model.setKind(FileKind.TEXT);
      const matched: FileEntry = model.results()[0];
      expect(DetailModel.build(matched.name, matched.uri, matched.sizeBytes, matched.modifiedAtSec, true).length)
        .assertEqual(7);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_CROSS_0004
     * @tc.name      testDetailTime0004
     * @tc.desc      detail time matches the entry timestamp
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDetailTime0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const matched: FileEntry = entries()[0];
      const rows: DetailRow[] = DetailModel.build(matched.name, matched.uri, matched.sizeBytes,
        matched.modifiedAtSec, true);
      expect(valueOf(rows, '修改时间')).assertEqual('1970/01/01 00:50:00');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_CROSS_0005
     * @tc.name      testDetailUri0005
     * @tc.desc      detail access path matches the entry uri
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDetailUri0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const matched: FileEntry = entries()[1];
      const rows: DetailRow[] = DetailModel.build(matched.name, matched.uri, matched.sizeBytes,
        matched.modifiedAtSec, true);
      expect(valueOf(rows, '访问路径')).assertEqual('file:///docs/alpha.PDF');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_CROSS_0006
     * @tc.name      testDetailInner0006
     * @tc.desc      dlp inner names come from the detail rows
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDetailInner0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const rows: DetailRow[] = DetailModel.build('report.docx.dlp', '', 10, 0, true);
      expect(valueOf(rows, '容器内文件')).assertEqual('report.docx');
      expect(valueOf(rows, '类型')).assertEqual('文档');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_CROSS_0007
     * @tc.name      testSearchToRecent0007
     * @tc.desc      search results are recorded as recent items
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSearchToRecent0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: SearchModel = search();
      model.setKeyword('docx');
      const matched: FileEntry = model.results()[0];
      const recent: RecentModel = new RecentModel();
      recent.addOpen(matched.name, matched.uri, matched.isDlp, 1000);
      expect(recent.recents()[0].name).assertEqual('delta.docx');
      expect(recent.recents()[0].isDlp).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_CROSS_0008
     * @tc.name      testRecentFavorite0008
     * @tc.desc      recent favorites track the recorded file
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRecentFavorite0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const recent: RecentModel = new RecentModel();
      recent.addOpen('delta.docx', 'file:///docs/delta.docx', true, 1000);
      recent.toggleFavorite(buildId('delta.docx', 'file:///docs/delta.docx'));
      expect(recent.favoriteCount()).assertEqual(1);
      expect(recent.favorites()[0].name).assertEqual('delta.docx');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_CROSS_0009
     * @tc.name      testRecentClearKeep0009
     * @tc.desc      clearing recents keeps the favorite file
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRecentClearKeep0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const recent: RecentModel = new RecentModel();
      recent.addOpen('a.txt', 'file:///docs/a.txt', false, 1000);
      recent.addOpen('b.docx', 'file:///docs/b.docx', true, 2000);
      recent.toggleFavorite('file:///docs/a.txt');
      expect(recent.clearRecents()).assertEqual(1);
      expect(recent.favorites()[0].name).assertEqual('a.txt');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_CROSS_0010
     * @tc.name      testRecentSerialize0010
     * @tc.desc      recent serialization survives a reload
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRecentSerialize0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const recent: RecentModel = new RecentModel();
      recent.addOpen('a.txt', 'file:///docs/a.txt', false, 1000);
      recent.addOpen('b.docx', 'file:///docs/b.docx', true, 2000);
      recent.toggleFavorite('file:///docs/b.docx');
      const parsed: RecentModel = parseRecentText(recent.serialize(), RECENT_CAPACITY);
      expect(parsed.recents()[0].name).assertEqual('b.docx');
      expect(parsed.favoriteCount()).assertEqual(1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_CROSS_0011
     * @tc.name      testSearchSelectionPolicy0011
     * @tc.desc      batch selection feeds the editable template
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSearchSelectionPolicy0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: SearchModel = search();
      model.setKind(FileKind.DOCUMENT);
      model.selectAllResults();
      const templates: TemplateModel = new TemplateModel();
      const policy: DlpPolicy | null = templates.toPolicy('u', 'n', 'editable');
      expect(model.selectedCount()).assertEqual(2);
      expect(policy !== null).assertTrue();
      if (policy !== null) {
        expect(hasPermission(policy, DlpPermission.WRITE)).assertTrue();
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_CROSS_0012
     * @tc.name      testSettingsDefaultPolicy0012
     * @tc.desc      settings default template drives the batch policy
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSettingsDefaultPolicy0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const settings: SettingsModel = SettingsModel.parse('template=printable');
      const templates: TemplateModel = new TemplateModel();
      const policy: DlpPolicy | null = templates.toPolicy('u', 'n', settings.defaultTemplateId);
      expect(policy !== null).assertTrue();
      if (policy !== null) {
        expect(policy.mask).assertEqual(5);
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_CROSS_0013
     * @tc.name      testSettingsPageSize0013
     * @tc.desc      settings page size drives search paging
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSettingsPageSize0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const settings: SettingsModel = SettingsModel.parse('pageSize=5');
      const model: SearchModel = search();
      model.setPageSize(settings.pageSize);
      expect(model.pageCount()).assertEqual(1);
      expect(model.page().items.length).assertEqual(3);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_CROSS_0014
     * @tc.name      testSettingsPageSizeSmall0014
     * @tc.desc      small page sizes split the search results
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSettingsPageSizeSmall0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const settings: SettingsModel = SettingsModel.parse('pageSize=5');
      const model: SearchModel = search();
      model.setPageSize(2);
      expect(settings.pageSize).assertEqual(5);
      expect(model.pageCount()).assertEqual(2);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_CROSS_0015
     * @tc.name      testCustomTemplatePolicy0015
     * @tc.desc      custom templates produce policies for selected files
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCustomTemplatePolicy0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const templates: TemplateModel = new TemplateModel();
      templates.add('审阅', 3, 100);
      const policy: DlpPolicy | null = templates.toPolicy('u', 'n', 'custom-100');
      expect(policy !== null).assertTrue();
      if (policy !== null) {
        expect(policy.mask).assertEqual(3);
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_CROSS_0016
     * @tc.name      testTemplateSummary0016
     * @tc.desc      template summaries match policy labels
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTemplateSummary0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const templates: TemplateModel = new TemplateModel();
      expect(templates.summaryOf('editable')).assertEqual('读取、编辑');
      expect(templates.summaryOf('printable')).assertEqual('读取、打印');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_CROSS_0017
     * @tc.name      testTemplateDeletePolicy0017
     * @tc.desc      deleted templates cannot produce policies
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTemplateDeletePolicy0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const templates: TemplateModel = new TemplateModel();
      templates.add('temp', 5, 100);
      templates.remove('custom-100');
      expect(templates.toPolicy('u', 'n', 'custom-100')).assertNull();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_CROSS_0018
     * @tc.name      testTemplateUpdateSummary0018
     * @tc.desc      template updates flow into summaries
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTemplateUpdateSummary0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const templates: TemplateModel = new TemplateModel();
      templates.add('temp', 1, 100);
      expect(templates.summaryOf('custom-100')).assertEqual('读取');
      templates.update('custom-100', 'temp', 9);
      expect(templates.summaryOf('custom-100')).assertEqual('读取、复制');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_CROSS_0019
     * @tc.name      testErrorLookupHint0019
     * @tc.desc      error lookups align with error center categories
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testErrorLookupHint0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const info: ErrorInfo = lookupError(13900002);
      expect(info.category).assertEqual(lookupError(13900002).category);
      expect(info.hint.length > 0).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_CROSS_0020
     * @tc.name      testErrorCenterByFormattedCode0020
     * @tc.desc      formatted codes can be searched in the error center
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testErrorCenterByFormattedCode0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const codeText: string = formatCode(13900025);
      const result: ErrorInfo[] = ErrorCenterModel.filter(codeText, 'all');
      expect(result.length).assertEqual(1);
      expect(result[0].code).assertEqual(13900025);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_CROSS_0021
     * @tc.name      testErrorCenterCategoryCounts0021
     * @tc.desc      error center category counts match direct lookups
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testErrorCenterCategoryCounts0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(ErrorCenterModel.filter('', 'permission_denied').length).assertEqual(3);
      expect(ErrorCenterModel.filter('', 'file_not_found').length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_CROSS_0022
     * @tc.name      testErrorRetryableCount0022
     * @tc.desc      error center retryable totals match core flags
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testErrorRetryableCount0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const entries: ErrorInfo[] = ErrorCenterModel.entries();
      let expected: number = 0;
      for (let index = 0; index < entries.length; index++) {
        if (entries[index].retryable) {
          expected += 1;
        }
      }
      expect(ErrorCenterModel.retryableCount(entries)).assertEqual(expected);
      expect(expected).assertEqual(5);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_CROSS_0023
     * @tc.name      testSortThenDetail0023
     * @tc.desc      sorted results produce consistent detail summaries
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSortThenDetail0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: SearchModel = search();
      model.setSort(SortField.SIZE, false);
      const first: FileEntry = model.results()[0];
      expect(first.name).assertEqual('alpha.PDF');
      expect(DetailModel.summary(first.name, first.sizeBytes)).assertEqual('文档 · 100 B');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_CROSS_0024
     * @tc.name      testEmptySearchDetail0024
     * @tc.desc      empty searches do not break detail construction
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEmptySearchDetail0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: SearchModel = search();
      model.setKeyword('zzz');
      expect(model.results().length).assertEqual(0);
      expect(DetailModel.build('', '', -1, 0, true).length).assertEqual(7);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_CROSS_0025
     * @tc.name      testRecentCapacity0025
     * @tc.desc      recent capacities survive multiple recordings
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRecentCapacity0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const recent: RecentModel = new RecentModel();
      recent.setCapacity(2);
      for (let index = 0; index < 5; index++) {
        recent.addOpen('f' + index.toString() + '.txt', 'file:///' + index.toString(), false, index);
      }
      expect(recent.count()).assertEqual(2);
      expect(recent.recents()[0].name).assertEqual('f4.txt');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_CROSS_0026
     * @tc.name      testSelectionFilterPolicy0026
     * @tc.desc      selections survive filtering before policy application
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectionFilterPolicy0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: SearchModel = search();
      model.toggleSelection('2');
      model.toggleSelection('4');
      model.setKind(FileKind.DOCUMENT);
      const templates: TemplateModel = new TemplateModel();
      expect(model.selectedCount()).assertEqual(2);
      expect(templates.toPolicy('u', 'n', 'read-only') !== null).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_CROSS_0027
     * @tc.name      testSettingsSummaryParse0027
     * @tc.desc      parsed settings summaries reflect stored values
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSettingsSummaryParse0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const settings: SettingsModel = SettingsModel.parse('logLevel=warn;pageSize=20;theme=dark');
      expect(settings.summary()).assertEqual('警告 · 每页 20 条 · 深色');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_CROSS_0028
     * @tc.name      testRecentRemoveChild0028
     * @tc.desc      removing a record updates favorites
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRecentRemoveChild0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const recent: RecentModel = new RecentModel();
      recent.addRecent(new RecentItem('id1', 'a.txt', 'file:///a', false, 100, true));
      recent.addOpen('b.txt', 'file:///b', false, 200);
      recent.remove('id1');
      expect(recent.favoriteCount()).assertEqual(0);
      expect(recent.count()).assertEqual(1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_CROSS_0029
     * @tc.name      testUnknownDetail0029
     * @tc.desc      unknown extensions still produce detail rows
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testUnknownDetail0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const rows: DetailRow[] = DetailModel.build('README', '', 0, 0, true);
      expect(valueOf(rows, '类型')).assertEqual('未知');
      expect(valueOf(rows, '大小')).assertEqual('0 B');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_CROSS_0030
     * @tc.name      testJourneyPolicyReport0030
     * @tc.desc      selection policy and error reporting compose
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testJourneyPolicyReport0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: SearchModel = search();
      model.setOnlyDlp(true);
      model.selectAllResults();
      const templates: TemplateModel = new TemplateModel();
      const policy: DlpPolicy | null = templates.toPolicy('u', 'n', 'full');
      expect(model.selectedCount()).assertEqual(2);
      expect(policy !== null).assertTrue();
      if (policy !== null) {
        expect(policy.mask).assertEqual(15);
      }
      expect(lookupError(13900012).category.toString()).assertEqual('permission_denied');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_CROSS_0031
     * @tc.name      testBestTemplate0031
     * @tc.desc      template selection by id matches built in masks
     * @type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBestTemplate0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const templates: TemplateModel = new TemplateModel();
      const all: PolicyTemplate[] = templates.allTemplates();
      expect(all[0].mask).assertEqual(1);
      expect(templates.maskOf(all[2].id)).assertEqual(5);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_CROSS_0032
     * @tc.name      testSelectedMatchesResults0032
     * @tc.desc      selected entries follow the search results order
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectedMatchesResults0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: SearchModel = search();
      model.setKind(FileKind.DOCUMENT);
      model.selectAllResults();
      const selected: FileEntry[] = model.selectedEntries();
      expect(selected[0].id).assertEqual('2');
      expect(selected[1].id).assertEqual('4');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_CROSS_0033
     * @tc.name      testRecentUpdateOrder0033
     * @tc.desc      updated recents reorder consistently
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRecentUpdateOrder0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const recent: RecentModel = new RecentModel();
      recent.addOpen('a.txt', 'file:///a', false, 100);
      recent.addOpen('b.txt', 'file:///b', false, 200);
      recent.updateOpened('file:///b', 50);
      expect(recent.recents()[0].name).assertEqual('b.txt');
      expect(recent.recents()[1].name).assertEqual('a.txt');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_CROSS_0034
     * @tc.name      testSettingsParseSearchPage0034
     * @tc.desc      parsed page sizes apply to search paging
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSettingsParseSearchPage0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const settings: SettingsModel = SettingsModel.parse('pageSize=5');
      const model: SearchModel = search();
      model.setPageSize(settings.pageSize);
      expect(model.page().hasMore).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_CROSS_0035
     * @tc.name      testErrorReportCategory0035
     * @tc.desc      report text carries the looked up category
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testErrorReportCategory0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const info: ErrorInfo = lookupError(13900025);
      expect(info.category.toString()).assertEqual('storage_full');
      expect(ErrorCenterModel.formattedCode(info)).assertEqual('0x00D418F9');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_CROSS_0036
     * @tc.name      testDlpSummaryMatchesRows0036
     * @tc.desc      dlp summaries match the detail type row
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDlpSummaryMatchesRows0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const rows: DetailRow[] = DetailModel.build('a.docx.dlp', '', 2048, 0, true);
      expect(valueOf(rows, '类型')).assertEqual('文档');
      expect(DetailModel.summary('a.docx.dlp', 2048)).assertEqual('文档 · 2 KB');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_CROSS_0037
     * @tc.name      testSearchResetThenDetail0037
     * @tc.desc      resetting filters restores detail-ready results
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSearchResetThenDetail0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: SearchModel = search();
      model.setKeyword('zzz');
      model.resetFilters();
      expect(model.results().length).assertEqual(3);
      expect(DetailModel.summary(model.results()[0].name, model.results()[0].sizeBytes))
        .assertEqual('文档 · 100 B');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_CROSS_0038
     * @tc.name      testRecentSerializationAfterRemove0038
     * @tc.desc      serialization after removal stays consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRecentSerializationAfterRemove0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const recent: RecentModel = new RecentModel();
      recent.addOpen('a.txt', 'file:///a', false, 100);
      recent.addOpen('b.txt', 'file:///b', false, 200);
      recent.remove('file:///a');
      const parsed: RecentModel = parseRecentText(recent.serialize(), RECENT_CAPACITY);
      expect(parsed.count()).assertEqual(1);
      expect(parsed.recents()[0].name).assertEqual('b.txt');
    })
  });
}
