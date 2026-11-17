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
import { DlpPolicy, DlpPermission, hasPermission } from '../main/ets/core/DlpPolicyCore';
import { SearchModel } from '../main/ets/feature/SearchModel';
import { DetailModel, DetailRow } from '../main/ets/feature/DetailModel';
import { RecentItem, RecentModel, RECENT_CAPACITY, parseRecentText, buildId } from '../main/ets/feature/RecentModel';
import { CustomTemplate, TemplateModel, templateDisplayName } from '../main/ets/feature/TemplateModel';
import { SettingsModel } from '../main/ets/feature/SettingsModel';
import { ErrorCenterModel } from '../main/ets/feature/ErrorCenterModel';

function entry(id: string, name: string, kind: FileKind, size: number, modified: number, isDlp: boolean): FileEntry {
  return new FileEntry(id, name, 'file:///docs/' + name, kind, size, modified, isDlp, false);
}

function sampleEntries(): Array<FileEntry> {
  return [
    entry('1', 'a.txt', FileKind.TEXT, 1536, 3000, false),
    entry('2', 'b.docx', FileKind.DOCUMENT, 2048, 2000, true),
    entry('3', 'c.png', FileKind.IMAGE, 500, 1000, false)
  ];
}

function namesOf(items: Array<RecentItem>): string {
  const parts: Array<string> = [];
  for (let index = 0; index < items.length; index++) {
    parts.push(items[index].name);
  }
  return parts.join('|');
}

function labelsOf(rows: Array<DetailRow>): string {
  const parts: Array<string> = [];
  for (let index = 0; index < rows.length; index++) {
    parts.push(rows[index].label);
  }
  return parts.join('|');
}

export default function featureFlowTest(): void {
  describe('FeatureFlowTest', () => {
    /**
     * @tc.number    SUB_DLP_MANAGER_FEATUREFLOW_0001
     * @tc.name      testSearchKeyword0001
     * @tc.desc      keyword search returns the matching files
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSearchKeyword0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSearchKeyword0001 begin');
      const model: SearchModel = new SearchModel();
      model.setEntries(sampleEntries());
      model.setKeyword('txt');
      expect(model.total()).assertEqual(1);
      expect(model.results()[0].name).assertEqual('a.txt');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FEATUREFLOW_0002
     * @tc.name      testSearchKind0002
     * @tc.desc      kind filters narrow the result set
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSearchKind0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSearchKind0002 begin');
      const model: SearchModel = new SearchModel();
      model.setEntries(sampleEntries());
      model.setKind(FileKind.DOCUMENT);
      expect(model.total()).assertEqual(1);
      expect(model.results()[0].name).assertEqual('b.docx');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FEATUREFLOW_0003
     * @tc.name      testSearchDlp0003
     * @tc.desc      the dlp filter keeps encrypted files
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSearchDlp0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSearchDlp0003 begin');
      const model: SearchModel = new SearchModel();
      model.setEntries(sampleEntries());
      model.setOnlyDlp(true);
      expect(model.results()[0].name).assertEqual('b.docx');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FEATUREFLOW_0004
     * @tc.name      testSearchSort0004
     * @tc.desc      size sorting orders files from small to large
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSearchSort0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSearchSort0004 begin');
      const model: SearchModel = new SearchModel();
      model.setEntries(sampleEntries());
      model.setSort(SortField.SIZE, false);
      expect(model.results()[0].name).assertEqual('c.png');
      expect(model.results()[2].name).assertEqual('b.docx');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FEATUREFLOW_0005
     * @tc.name      testSearchPaging0005
     * @tc.desc      paging splits the result set by page size
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSearchPaging0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSearchPaging0005 begin');
      const model: SearchModel = new SearchModel();
      model.setEntries(sampleEntries());
      model.setPageSize(1);
      expect(model.pageCount()).assertEqual(3);
      const first: QueryResult = model.page();
      expect(first.items.length).assertEqual(1);
      expect(first.hasMore).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FEATUREFLOW_0006
     * @tc.name      testSearchSelection0006
     * @tc.desc      selecting all results feeds the batch summary
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSearchSelection0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSearchSelection0006 begin');
      const model: SearchModel = new SearchModel();
      model.setEntries(sampleEntries());
      model.selectAllResults();
      expect(model.selectedCount()).assertEqual(3);
      expect(model.selectionSummary()).assertEqual('已选择 3 个文件');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FEATUREFLOW_0007
     * @tc.name      testSearchReset0007
     * @tc.desc      resetting filters restores the full list
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSearchReset0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSearchReset0007 begin');
      const model: SearchModel = new SearchModel();
      model.setEntries(sampleEntries());
      model.setKeyword('txt');
      model.setKind(FileKind.TEXT);
      model.setOnlyDlp(true);
      model.resetFilters();
      expect(model.total()).assertEqual(3);
      expect(model.hasActiveFilters()).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FEATUREFLOW_0008
     * @tc.name      testRecentRecord0008
     * @tc.desc      opening a result records it as recent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRecentRecord0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testRecentRecord0008 begin');
      const recent: RecentModel = new RecentModel();
      recent.addOpen('a.txt', 'file:///docs/a.txt', false, 1000);
      expect(recent.count()).assertEqual(1);
      expect(recent.recents()[0].name).assertEqual('a.txt');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FEATUREFLOW_0009
     * @tc.name      testRecentOrder0009
     * @tc.desc      newer opens appear before older ones
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRecentOrder0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testRecentOrder0009 begin');
      const recent: RecentModel = new RecentModel();
      recent.addOpen('a.txt', 'file:///docs/a.txt', false, 1000);
      recent.addOpen('b.docx', 'file:///docs/b.docx', true, 2000);
      expect(namesOf(recent.recents())).assertEqual('b.docx|a.txt');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FEATUREFLOW_0010
     * @tc.name      testRecentReopen0010
     * @tc.desc      reopening promotes the file without duplicating it
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRecentReopen0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testRecentReopen0010 begin');
      const recent: RecentModel = new RecentModel();
      recent.addOpen('a.txt', 'file:///docs/a.txt', false, 1000);
      recent.addOpen('b.docx', 'file:///docs/b.docx', true, 2000);
      recent.addOpen('a.txt', 'file:///docs/a.txt', false, 3000);
      expect(recent.count()).assertEqual(2);
      expect(namesOf(recent.recents())).assertEqual('a.txt|b.docx');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FEATUREFLOW_0011
     * @tc.name      testRecentFavorite0011
     * @tc.desc      favorites are separated from recent records
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRecentFavorite0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testRecentFavorite0011 begin');
      const recent: RecentModel = new RecentModel();
      recent.addOpen('a.txt', 'file:///docs/a.txt', false, 1000);
      recent.addOpen('b.docx', 'file:///docs/b.docx', true, 2000);
      recent.toggleFavorite(buildId('a.txt', 'file:///docs/a.txt'));
      expect(namesOf(recent.favorites())).assertEqual('a.txt');
      expect(namesOf(recent.nonFavorites())).assertEqual('b.docx');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FEATUREFLOW_0012
     * @tc.name      testRecentClearKeepFavorite0012
     * @tc.desc      clearing recents keeps favorites
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRecentClearKeepFavorite0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testRecentClearKeepFavorite0012 begin');
      const recent: RecentModel = new RecentModel();
      recent.addOpen('a.txt', 'file:///docs/a.txt', false, 1000);
      recent.addOpen('b.docx', 'file:///docs/b.docx', true, 2000);
      recent.toggleFavorite(buildId('a.txt', 'file:///docs/a.txt'));
      expect(recent.clearRecents()).assertEqual(1);
      expect(namesOf(recent.recents())).assertEqual('a.txt');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FEATUREFLOW_0013
     * @tc.name      testRecentRemove0013
     * @tc.desc      removing a record leaves the others intact
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRecentRemove0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testRecentRemove0013 begin');
      const recent: RecentModel = new RecentModel();
      recent.addOpen('a.txt', 'file:///docs/a.txt', false, 1000);
      recent.addOpen('b.docx', 'file:///docs/b.docx', true, 2000);
      expect(recent.remove('file:///docs/a.txt')).assertTrue();
      expect(namesOf(recent.recents())).assertEqual('b.docx');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FEATUREFLOW_0014
     * @tc.name      testRecentSerialize0014
     * @tc.desc      recent records survive serialization
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRecentSerialize0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testRecentSerialize0014 begin');
      const recent: RecentModel = new RecentModel();
      recent.addOpen('年度报告.txt', 'file:///docs/年度报告.txt', true, 1000);
      recent.toggleFavorite(buildId('年度报告.txt', 'file:///docs/年度报告.txt'));
      const parsed: RecentModel = parseRecentText(recent.serialize(), RECENT_CAPACITY);
      expect(parsed.recents()[0].name).assertEqual('年度报告.txt');
      expect(parsed.favoriteCount()).assertEqual(1);
      expect(parsed.recents()[0].isDlp).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FEATUREFLOW_0015
     * @tc.name      testDetailSummaryText0015
     * @tc.desc      detail summaries reuse core formatting
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDetailSummaryText0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDetailSummaryText0015 begin');
      expect(DetailModel.summary('a.txt', 1536)).assertEqual('文本 · 1.5 KB');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FEATUREFLOW_0016
     * @tc.name      testDetailRowsPlain0016
     * @tc.desc      plain files have seven detail rows
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDetailRowsPlain0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDetailRowsPlain0016 begin');
      const rows: Array<DetailRow> = DetailModel.build('a.txt', 'file:///docs/a.txt', 1536, 3000, true);
      expect(rows.length).assertEqual(7);
      expect(labelsOf(rows)).assertEqual('名称|类型|MIME|大小|修改时间|加密文件|访问路径');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FEATUREFLOW_0017
     * @tc.name      testDetailRowsDlp0017
     * @tc.desc      dlp files add the inner file row
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDetailRowsDlp0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDetailRowsDlp0017 begin');
      const rows: Array<DetailRow> = DetailModel.build('b.docx.dlp', 'file:///docs/b.docx.dlp', 2048, 2000, true);
      expect(rows.length).assertEqual(8);
      expect(labelsOf(rows)).assertEqual('名称|类型|MIME|大小|修改时间|加密文件|容器内文件|访问路径');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FEATUREFLOW_0018
     * @tc.name      testDetailSummaryDocx0018
     * @tc.desc      document summaries use the document label
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDetailSummaryDocx0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDetailSummaryDocx0018 begin');
      expect(DetailModel.summary('b.docx', 2048)).assertEqual('文档 · 2 KB');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FEATUREFLOW_0019
     * @tc.name      testTemplateReadOnly0019
     * @tc.desc      the read only template produces a read policy
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTemplateReadOnly0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testTemplateReadOnly0019 begin');
      const templates: TemplateModel = new TemplateModel();
      const policy: DlpPolicy | null = templates.toPolicy('user001', 'User', 'read-only');
      expect(policy !== null).assertTrue();
      if (policy !== null) {
        expect(policy.mask).assertEqual(1);
        expect(hasPermission(policy, DlpPermission.WRITE)).assertFalse();
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FEATUREFLOW_0020
     * @tc.name      testTemplateCustom0020
     * @tc.desc      custom templates drive policies directly
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTemplateCustom0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testTemplateCustom0020 begin');
      const templates: TemplateModel = new TemplateModel();
      templates.add('审阅', 3, 100);
      const policy: DlpPolicy | null = templates.toPolicy('u', 'n', 'custom-100');
      expect(policy !== null).assertTrue();
      if (policy !== null) {
        expect(policy.mask).assertEqual(3);
        expect(hasPermission(policy, DlpPermission.WRITE)).assertTrue();
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FEATUREFLOW_0021
     * @tc.name      testTemplateDisplay0021
     * @tc.desc      custom template names are displayed verbatim
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTemplateDisplay0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testTemplateDisplay0021 begin');
      const templates: TemplateModel = new TemplateModel();
      templates.add('审阅', 3, 100);
      const customs: Array<CustomTemplate> = templates.customTemplates();
      expect(customs[0].name).assertEqual('审阅');
      expect(templateDisplayName(templates.allTemplates()[5])).assertEqual('审阅');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FEATUREFLOW_0022
     * @tc.name      testTemplateValidation0022
     * @tc.desc      invalid templates never enter the list
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTemplateValidation0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testTemplateValidation0022 begin');
      const templates: TemplateModel = new TemplateModel();
      expect(templates.add('', 1, 100).ok).assertFalse();
      expect(templates.add('x', 0, 100).ok).assertFalse();
      expect(templates.customCount()).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FEATUREFLOW_0023
     * @tc.name      testSettingsPageSize0023
     * @tc.desc      settings page size drives search paging
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSettingsPageSize0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSettingsPageSize0023 begin');
      const settings: SettingsModel = new SettingsModel();
      settings.setPageSize(5);
      const model: SearchModel = new SearchModel();
      model.setEntries(sampleEntries());
      model.setPageSize(settings.pageSize);
      expect(model.getPageSize()).assertEqual(5);
      expect(model.pageCount()).assertEqual(1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FEATUREFLOW_0024
     * @tc.name      testSettingsTemplate0024
     * @tc.desc      the default template in settings resolves to a policy mask
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSettingsTemplate0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSettingsTemplate0024 begin');
      const settings: SettingsModel = new SettingsModel();
      settings.setDefaultTemplate('printable');
      const templates: TemplateModel = new TemplateModel();
      expect(templates.maskOf(settings.defaultTemplateId)).assertEqual(5);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FEATUREFLOW_0025
     * @tc.name      testSettingsRoundTrip0025
     * @tc.desc      settings survive serialization before use
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSettingsRoundTrip0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSettingsRoundTrip0025 begin');
      const settings: SettingsModel = new SettingsModel();
      settings.setLogLevel('warn');
      settings.setPageSize(50);
      settings.setTheme('dark');
      settings.setDefaultTemplate('full');
      const parsed: SettingsModel = SettingsModel.parse(settings.serialize());
      expect(parsed.logLevel).assertEqual('warn');
      expect(parsed.pageSize).assertEqual(50);
      expect(parsed.theme).assertEqual('dark');
      expect(parsed.defaultTemplateId).assertEqual('full');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FEATUREFLOW_0026
     * @tc.name      testErrorCenterNotFound0026
     * @tc.desc      error search finds the missing file code
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testErrorCenterNotFound0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testErrorCenterNotFound0026 begin');
      const result = ErrorCenterModel.filter('13900002', 'all');
      expect(result.length).assertEqual(1);
      expect(result[0].message).assertEqual('文件不存在');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FEATUREFLOW_0027
     * @tc.name      testErrorCenterPermission0027
     * @tc.desc      permission errors group together
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testErrorCenterPermission0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testErrorCenterPermission0027 begin');
      expect(ErrorCenterModel.filter('', 'permission_denied').length).assertEqual(3);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FEATUREFLOW_0028
     * @tc.name      testErrorCenterRetryable0028
     * @tc.desc      retryable errors are counted
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testErrorCenterRetryable0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testErrorCenterRetryable0028 begin');
      expect(ErrorCenterModel.retryableCount(ErrorCenterModel.entries())).assertEqual(5);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FEATUREFLOW_0029
     * @tc.name      testJournalSearchToFavorite0029
     * @tc.desc      search result opens are recorded and favorited
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testJournalSearchToFavorite0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testJournalSearchToFavorite0029 begin');
      const model: SearchModel = new SearchModel();
      model.setEntries(sampleEntries());
      model.setKeyword('docx');
      const matched: FileEntry = model.results()[0];
      const recent: RecentModel = new RecentModel();
      recent.addOpen(matched.name, matched.uri, matched.isDlp, 1000);
      recent.toggleFavorite(buildId(matched.name, matched.uri));
      expect(recent.count()).assertEqual(1);
      expect(recent.favoriteCount()).assertEqual(1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FEATUREFLOW_0030
     * @tc.name      testJournalSearchToPolicy0030
     * @tc.desc      batch authorization resolves the chosen template
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testJournalSearchToPolicy0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testJournalSearchToPolicy0030 begin');
      const model: SearchModel = new SearchModel();
      model.setEntries(sampleEntries());
      model.selectAllResults();
      const templates: TemplateModel = new TemplateModel();
      const policy: DlpPolicy | null = templates.toPolicy('u', 'n', 'editable');
      expect(model.selectedCount()).assertEqual(3);
      expect(policy !== null).assertTrue();
      if (policy !== null) {
        expect(policy.mask).assertEqual(3);
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FEATUREFLOW_0031
     * @tc.name      testJournalDetailThenRecent0031
     * @tc.desc      detail rows and recent records agree on the file
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testJournalDetailThenRecent0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testJournalDetailThenRecent0031 begin');
      const rows: Array<DetailRow> = DetailModel.build('b.docx.dlp', 'file:///docs/b.docx.dlp', 2048, 2000, true);
      const recent: RecentModel = new RecentModel();
      recent.addOpen(rows[0].value, 'file:///docs/b.docx.dlp', true, 2000);
      expect(rows[0].value).assertEqual('b.docx.dlp');
      expect(recent.recents()[0].isDlp).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FEATUREFLOW_0032
     * @tc.name      testJournalSettingsErrorSweep0032
     * @tc.desc      settings defaults keep the error center usable
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testJournalSettingsErrorSweep0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testJournalSettingsErrorSweep0032 begin');
      const settings: SettingsModel = SettingsModel.parse('');
      const entries = ErrorCenterModel.filter('', 'all');
      expect(settings.logLevel).assertEqual('info');
      expect(entries.length).assertEqual(19);
    })
  });
}
