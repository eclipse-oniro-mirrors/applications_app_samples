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
import { DlpPolicy, hasPermission, DlpPermission } from '../main/ets/core/DlpPolicyCore';
import { ErrorInfo, categoryOf, describeError, formatCode, isRetryable, lookupError } from '../main/ets/core/ErrorCodeCore';
import { RecentItem, RecentModel, RECENT_CAPACITY, parseRecentText } from '../main/ets/feature/RecentModel';
import { TemplateModel } from '../main/ets/feature/TemplateModel';
import { SettingsModel } from '../main/ets/feature/SettingsModel';
import { ErrorCenterModel } from '../main/ets/feature/ErrorCenterModel';

export default function featureJourneyMatrixTest(): void {
  describe('FeatureJourneyMatrixTest', () => {
    /**
     * @tc.number    SUB_DLP_MANAGER_JOURNEY_0001
     * @tc.name      testSettingsToPolicy0001
     * @tc.desc      settings default template drives policy masks
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSettingsToPolicy0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const settings: SettingsModel = SettingsModel.parse('template=editable');
      const templates: TemplateModel = new TemplateModel();
      const policy: DlpPolicy | null = templates.toPolicy('u', 'n', settings.defaultTemplateId);
      expect(policy !== null).assertTrue();
      if (policy !== null) {
        expect(policy.mask).assertEqual(3);
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_JOURNEY_0002
     * @tc.name      testSettingsFullParse0002
     * @tc.desc      fully parsed settings keep the chosen template
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSettingsFullParse0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const settings: SettingsModel = SettingsModel.parse(
        'logLevel=warn;pageSize=20;theme=dark;template=copyable;confirm=0');
      expect(settings.defaultTemplateId).assertEqual('copyable');
      expect(settings.summary()).assertEqual('警告 · 每页 20 条 · 深色');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_JOURNEY_0003
     * @tc.name      testCustomTemplateToPolicy0003
     * @tc.desc      custom templates drive policies
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCustomTemplateToPolicy0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const templates: TemplateModel = new TemplateModel();
      const id: string = templates.add('审阅', 5, 100).id;
      const settings: SettingsModel = new SettingsModel();
      settings.setDefaultTemplate(id);
      const policy: DlpPolicy | null = templates.toPolicy('u', 'n', settings.defaultTemplateId);
      expect(policy !== null).assertTrue();
      if (policy !== null) {
        expect(policy.mask).assertEqual(5);
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_JOURNEY_0004
     * @tc.name      testUpdateChangesPolicy0004
     * @tc.desc      template updates change the resulting policy
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testUpdateChangesPolicy0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const templates: TemplateModel = new TemplateModel();
      templates.add('temp', 1, 100);
      templates.update('custom-100', 'temp', 15);
      const policy: DlpPolicy | null = templates.toPolicy('u', 'n', 'custom-100');
      expect(policy !== null).assertTrue();
      if (policy !== null) {
        expect(hasPermission(policy, DlpPermission.WRITE)).assertTrue();
        expect(hasPermission(policy, DlpPermission.PRINT)).assertTrue();
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_JOURNEY_0005
     * @tc.name      testDeleteDropsPolicy0005
     * @tc.desc      deleted templates cannot produce policies
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDeleteDropsPolicy0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const templates: TemplateModel = new TemplateModel();
      templates.add('temp', 3, 100);
      templates.remove('custom-100');
      expect(templates.toPolicy('u', 'n', 'custom-100')).assertNull();
      expect(templates.summaryOf('custom-100')).assertEqual('无权限');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_JOURNEY_0006
     * @tc.name      testRecentFavoriteSummary0006
     * @tc.desc      recent favorites pair with template summaries
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRecentFavoriteSummary0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const recent: RecentModel = new RecentModel();
      recent.addRecent(new RecentItem('id1', 'a.docx', 'file:///a', true, 100, true));
      const templates: TemplateModel = new TemplateModel();
      expect(recent.favorites()[0].isDlp).assertTrue();
      expect(templates.summaryOf('editable')).assertEqual('读取、编辑');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_JOURNEY_0007
     * @tc.name      testDualSerialization0007
     * @tc.desc      recent and settings serialization are independent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDualSerialization0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const recent: RecentModel = new RecentModel();
      recent.addOpen('a.txt', 'file:///a', false, 100);
      const settings: SettingsModel = new SettingsModel();
      settings.setTheme('dark');
      const parsedRecent: RecentModel = parseRecentText(recent.serialize(), RECENT_CAPACITY);
      const parsedSettings: SettingsModel = SettingsModel.parse(settings.serialize());
      expect(parsedRecent.recents()[0].name).assertEqual('a.txt');
      expect(parsedSettings.theme).assertEqual('dark');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_JOURNEY_0008
     * @tc.name      testErrorReportAndCenter0008
     * @tc.desc      error reports match error center filters
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testErrorReportAndCenter0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const info: ErrorInfo = lookupError(13900002);
      const result: Array<ErrorInfo> = ErrorCenterModel.filter(formatCode(info.code), 'all');
      expect(result.length).assertEqual(1);
      expect(info.category).assertEqual(categoryOf(13900002));
      expect(describeError(13900002)).assertEqual('文件不存在');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_JOURNEY_0009
     * @tc.name      testLogLevelSummary0009
     * @tc.desc      log level changes flow into summaries
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLogLevelSummary0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const settings: SettingsModel = SettingsModel.parse('logLevel=error;pageSize=5;theme=auto');
      expect(settings.summary()).assertEqual('错误 · 每页 5 条 · 跟随系统');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_JOURNEY_0010
     * @tc.name      testRetryableReport0010
     * @tc.desc      retryable flags and reports agree
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRetryableReport0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(isRetryable(13900004)).assertTrue();
      expect(ErrorCenterModel.retryableLabel(lookupError(13900004))).assertEqual('可重试');
      expect(lookupError(13900004).hint.length > 0).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_JOURNEY_0011
     * @tc.name      testClearRecentKeepsSettings0011
     * @tc.desc      clearing recents does not touch settings
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testClearRecentKeepsSettings0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const recent: RecentModel = new RecentModel();
      recent.addOpen('a.txt', 'file:///a', false, 100);
      recent.clearRecents();
      const settings: SettingsModel = new SettingsModel();
      settings.setTheme('dark');
      expect(recent.isEmpty()).assertTrue();
      expect(settings.theme).assertEqual('dark');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_JOURNEY_0012
     * @tc.name      testErrorCategoryLabels0012
     * @tc.desc      category counts and labels agree
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testErrorCategoryLabels0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(ErrorCenterModel.filter('', 'dlp_policy').length).assertEqual(2);
      expect(ErrorCenterModel.filter('', 'dlp_policy')[0].category.toString()).assertEqual('dlp_policy');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_JOURNEY_0013
     * @tc.name      testTemplateCounts0013
     * @tc.desc      template counts track multiple additions
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTemplateCounts0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const templates: TemplateModel = new TemplateModel();
      templates.add('a', 1, 100);
      templates.add('b', 2, 200);
      templates.add('c', 3, 300);
      expect(templates.customCount()).assertEqual(3);
      expect(templates.totalCount()).assertEqual(8);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_JOURNEY_0014
     * @tc.name      testRecentCapacityJourney0014
     * @tc.desc      recent capacity trimming keeps the newest records
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRecentCapacityJourney0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const recent: RecentModel = new RecentModel();
      recent.setCapacity(2);
      for (let index = 0; index < 4; index++) {
        recent.addOpen('f' + index.toString(), 'file:///' + index.toString(), false, index);
      }
      expect(recent.count()).assertEqual(2);
      expect(recent.recents()[0].name).assertEqual('f3');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_JOURNEY_0015
     * @tc.name      testSettingsClampJourney0015
     * @tc.desc      settings clamping keeps serialization valid
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSettingsClampJourney0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const settings: SettingsModel = new SettingsModel();
      settings.setPageSize(1000);
      expect(settings.serialize().indexOf('pageSize=50') > 0).assertTrue();
      expect(settings.validate().length).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_JOURNEY_0016
     * @tc.name      testUnknownErrorJourney0016
     * @tc.desc      unknown errors remain descriptive
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testUnknownErrorJourney0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(describeError(1234)).assertEqual('未知错误');
      expect(ErrorCenterModel.filter('1234', 'all').length).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_JOURNEY_0017
     * @tc.name      testRecentFavoriteCleanup0017
     * @tc.desc      removing favorites updates both sections
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRecentFavoriteCleanup0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const recent: RecentModel = new RecentModel();
      recent.addRecent(new RecentItem('id1', 'a.txt', 'file:///a', false, 100, true));
      recent.addOpen('b.txt', 'file:///b', false, 200);
      recent.remove('id1');
      expect(recent.favoriteCount()).assertEqual(0);
      expect(recent.nonFavorites()[0].name).assertEqual('b.txt');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_JOURNEY_0018
     * @tc.name      testTemplateRenameJourney0018
     * @tc.desc      template renames appear in display names
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTemplateRenameJourney0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const templates: TemplateModel = new TemplateModel();
      templates.add('before', 1, 100);
      templates.update('custom-100', 'after', 1);
      expect(templates.allTemplates()[5].nameKey).assertEqual('after');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_JOURNEY_0019
     * @tc.name      testFormattedSearchJourney0019
     * @tc.desc      formatted codes search the error center
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormattedSearchJourney0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(ErrorCenterModel.filter(formatCode(13900025), 'all').length).assertEqual(1);
      expect(ErrorCenterModel.filter(formatCode(19100002), 'all').length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_JOURNEY_0020
     * @tc.name      testSettingsResetJourney0020
     * @tc.desc      settings reset restores defaults after changes
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSettingsResetJourney0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const settings: SettingsModel = new SettingsModel();
      settings.setLogLevel('debug');
      settings.setPageSize(50);
      settings.setTheme('dark');
      settings.reset();
      expect(settings.summary()).assertEqual('信息 · 每页 10 条 · 浅色');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_JOURNEY_0021
     * @tc.name      testRecentUnicodeJourney0021
     * @tc.desc      unicode recent records round trip
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRecentUnicodeJourney0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const recent: RecentModel = new RecentModel();
      recent.addOpen('年度报告😀.txt', '', false, 100);
      const parsed: RecentModel = parseRecentText(recent.serialize(), RECENT_CAPACITY);
      expect(parsed.recents()[0].name).assertEqual('年度报告😀.txt');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_JOURNEY_0022
     * @tc.name      testTemplateNameFreeJourney0022
     * @tc.desc      names are reusable after removal
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTemplateNameFreeJourney0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const templates: TemplateModel = new TemplateModel();
      templates.add('reuse', 1, 100);
      templates.remove('custom-100');
      expect(templates.add('reuse', 2, 200).ok).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_JOURNEY_0023
     * @tc.name      testHintsJourney0023
     * @tc.desc      every error hint is non empty
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testHintsJourney0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const codes: Array<number> = [13900001, 13900002, 13900012, 13900025, 13900042, 19100001, 19100004];
      for (let index = 0; index < codes.length; index++) {
        expect(lookupError(codes[index]).hint.length > 0).assertTrue();
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_JOURNEY_0024
     * @tc.name      testConfirmOffJourney0024
     * @tc.desc      confirmation changes serialize correctly
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfirmOffJourney0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const settings: SettingsModel = new SettingsModel();
      settings.setConfirmBeforeDelete(false);
      expect(settings.serialize().endsWith('confirm=0')).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_JOURNEY_0025
     * @tc.name      testFourModulesJourney0025
     * @tc.desc      four modules compose in one scenario
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFourModulesJourney0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const settings: SettingsModel = SettingsModel.parse('template=full;pageSize=20');
      const templates: TemplateModel = new TemplateModel();
      const policy: DlpPolicy | null = templates.toPolicy('u', 'n', settings.defaultTemplateId);
      const recent: RecentModel = new RecentModel();
      recent.addOpen('a.docx', 'file:///a', true, 100);
      recent.toggleFavorite('file:///a');
      expect(policy !== null).assertTrue();
      if (policy !== null) {
        expect(policy.mask).assertEqual(15);
      }
      expect(recent.favoriteCount()).assertEqual(1);
      expect(ErrorCenterModel.filter('', 'all').length).assertEqual(19);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_JOURNEY_0026
     * @tc.name      testDecimalPrefixJourney0026
     * @tc.desc      decimal prefixes return the system code group
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDecimalPrefixJourney0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(ErrorCenterModel.filter('139', 'all').length).assertEqual(14);
      expect(ErrorCenterModel.filter('191', 'all').length).assertEqual(4);
    })
  });
}
