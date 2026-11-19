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
import { SettingsModel, logLevelLabel, themeLabel } from '../main/ets/feature/SettingsModel';

export default function settingsModelTest(): void {
  describe('SettingsModelTest', () => {
    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSMODEL_0001
     * @tc.name      testDefaults0001
     * @tc.desc      default settings are the documented values
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDefaults0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDefaults0001 begin');
      const model: SettingsModel = SettingsModel.createDefault();
      expect(model.logLevel).assertEqual('info');
      expect(model.pageSize).assertEqual(10);
      expect(model.theme).assertEqual('light');
      expect(model.defaultTemplateId).assertEqual('read-only');
      expect(model.confirmBeforeDelete).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSMODEL_0002
     * @tc.name      testSetLogLevel0002
     * @tc.desc      valid log levels are accepted
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSetLogLevel0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSetLogLevel0002 begin');
      const model: SettingsModel = new SettingsModel();
      expect(model.setLogLevel('debug')).assertTrue();
      expect(model.logLevel).assertEqual('debug');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSMODEL_0003
     * @tc.name      testSetLogLevelInvalid0003
     * @tc.desc      unknown log levels are rejected
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSetLogLevelInvalid0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSetLogLevelInvalid0003 begin');
      const model: SettingsModel = new SettingsModel();
      expect(model.setLogLevel('trace')).assertFalse();
      expect(model.logLevel).assertEqual('info');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSMODEL_0004
     * @tc.name      testLogLevelLabel0004
     * @tc.desc      log level labels are localized
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLogLevelLabel0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testLogLevelLabel0004 begin');
      expect(logLevelLabel('debug')).assertEqual('调试');
      expect(logLevelLabel('error')).assertEqual('错误');
      expect(logLevelLabel('unknown')).assertEqual('信息');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSMODEL_0005
     * @tc.name      testPageSizeLow0005
     * @tc.desc      page sizes below five are clamped
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPageSizeLow0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testPageSizeLow0005 begin');
      const model: SettingsModel = new SettingsModel();
      expect(model.setPageSize(1)).assertEqual(5);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSMODEL_0006
     * @tc.name      testPageSizeHigh0006
     * @tc.desc      page sizes above fifty are clamped
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPageSizeHigh0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testPageSizeHigh0006 begin');
      const model: SettingsModel = new SettingsModel();
      expect(model.setPageSize(1000)).assertEqual(50);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSMODEL_0007
     * @tc.name      testPageSizeFloor0007
     * @tc.desc      fractional page sizes are floored
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPageSizeFloor0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testPageSizeFloor0007 begin');
      const model: SettingsModel = new SettingsModel();
      expect(model.setPageSize(10.9)).assertEqual(10);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSMODEL_0008
     * @tc.name      testSetTheme0008
     * @tc.desc      valid themes are accepted
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSetTheme0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSetTheme0008 begin');
      const model: SettingsModel = new SettingsModel();
      expect(model.setTheme('dark')).assertTrue();
      expect(model.theme).assertEqual('dark');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSMODEL_0009
     * @tc.name      testSetThemeInvalid0009
     * @tc.desc      unknown themes are rejected
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSetThemeInvalid0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSetThemeInvalid0009 begin');
      const model: SettingsModel = new SettingsModel();
      expect(model.setTheme('neon')).assertFalse();
      expect(model.theme).assertEqual('light');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSMODEL_0010
     * @tc.name      testThemeLabel0010
     * @tc.desc      theme labels are localized
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testThemeLabel0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testThemeLabel0010 begin');
      expect(themeLabel('dark')).assertEqual('深色');
      expect(themeLabel('auto')).assertEqual('跟随系统');
      expect(themeLabel('unknown')).assertEqual('浅色');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSMODEL_0011
     * @tc.name      testDefaultTemplate0011
     * @tc.desc      template ids must not be empty
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDefaultTemplate0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDefaultTemplate0011 begin');
      const model: SettingsModel = new SettingsModel();
      expect(model.setDefaultTemplate('')).assertFalse();
      expect(model.setDefaultTemplate('editable')).assertTrue();
      expect(model.defaultTemplateId).assertEqual('editable');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSMODEL_0012
     * @tc.name      testConfirmFlag0012
     * @tc.desc      the confirmation flag is stored
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfirmFlag0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testConfirmFlag0012 begin');
      const model: SettingsModel = new SettingsModel();
      model.setConfirmBeforeDelete(false);
      expect(model.confirmBeforeDelete).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSMODEL_0013
     * @tc.name      testReset0013
     * @tc.desc      reset restores every default
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testReset0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testReset0013 begin');
      const model: SettingsModel = new SettingsModel();
      model.setLogLevel('error');
      model.setPageSize(50);
      model.setTheme('dark');
      model.setDefaultTemplate('full');
      model.setConfirmBeforeDelete(false);
      model.reset();
      expect(model.logLevel).assertEqual('info');
      expect(model.pageSize).assertEqual(10);
      expect(model.theme).assertEqual('light');
      expect(model.defaultTemplateId).assertEqual('read-only');
      expect(model.confirmBeforeDelete).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSMODEL_0014
     * @tc.name      testValidateDefault0014
     * @tc.desc      default settings pass validation
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidateDefault0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testValidateDefault0014 begin');
      expect(new SettingsModel().validate().length).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSMODEL_0015
     * @tc.name      testValidateBroken0015
     * @tc.desc      invalid settings report every issue
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidateBroken0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testValidateBroken0015 begin');
      const model: SettingsModel = new SettingsModel();
      model.logLevel = 'verbose';
      model.pageSize = 1;
      model.theme = 'neon';
      model.defaultTemplateId = '';
      expect(model.validate().length).assertEqual(4);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSMODEL_0016
     * @tc.name      testSerializeDefault0016
     * @tc.desc      defaults serialize in the documented order
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSerializeDefault0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSerializeDefault0016 begin');
      expect(new SettingsModel().serialize()).assertEqual(
        'logLevel=info;pageSize=10;theme=light;template=read-only;confirm=1');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSMODEL_0017
     * @tc.name      testSerializeChanged0017
     * @tc.desc      changed settings serialize the new values
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSerializeChanged0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSerializeChanged0017 begin');
      const model: SettingsModel = new SettingsModel();
      model.setLogLevel('warn');
      model.setPageSize(20);
      model.setTheme('auto');
      model.setDefaultTemplate('full');
      model.setConfirmBeforeDelete(false);
      expect(model.serialize()).assertEqual(
        'logLevel=warn;pageSize=20;theme=auto;template=full;confirm=0');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSMODEL_0018
     * @tc.name      testParseEmpty0018
     * @tc.desc      empty text parses to defaults
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseEmpty0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseEmpty0018 begin');
      const model: SettingsModel = SettingsModel.parse('');
      expect(model.logLevel).assertEqual('info');
      expect(model.pageSize).assertEqual(10);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSMODEL_0019
     * @tc.name      testParseRoundTrip0019
     * @tc.desc      serialized settings parse back identically
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseRoundTrip0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseRoundTrip0019 begin');
      const source: SettingsModel = new SettingsModel();
      source.setLogLevel('debug');
      source.setPageSize(50);
      source.setTheme('dark');
      source.setDefaultTemplate('copyable');
      source.setConfirmBeforeDelete(false);
      const parsed: SettingsModel = SettingsModel.parse(source.serialize());
      expect(parsed.logLevel).assertEqual('debug');
      expect(parsed.pageSize).assertEqual(50);
      expect(parsed.theme).assertEqual('dark');
      expect(parsed.defaultTemplateId).assertEqual('copyable');
      expect(parsed.confirmBeforeDelete).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSMODEL_0020
     * @tc.name      testParsePartial0020
     * @tc.desc      missing fields keep their defaults
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParsePartial0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParsePartial0020 begin');
      const model: SettingsModel = SettingsModel.parse('theme=auto');
      expect(model.theme).assertEqual('auto');
      expect(model.logLevel).assertEqual('info');
      expect(model.pageSize).assertEqual(10);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSMODEL_0021
     * @tc.name      testParseClamp0021
     * @tc.desc      parsed page sizes are clamped
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseClamp0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseClamp0021 begin');
      expect(SettingsModel.parse('pageSize=1000').pageSize).assertEqual(50);
      expect(SettingsModel.parse('pageSize=1').pageSize).assertEqual(5);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSMODEL_0022
     * @tc.name      testParseInvalidLog0022
     * @tc.desc      invalid log levels are ignored
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseInvalidLog0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseInvalidLog0022 begin');
      expect(SettingsModel.parse('logLevel=verbose').logLevel).assertEqual('info');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSMODEL_0023
     * @tc.name      testParseBadPage0023
     * @tc.desc      non numeric page sizes are ignored
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseBadPage0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseBadPage0023 begin');
      expect(SettingsModel.parse('pageSize=abc').pageSize).assertEqual(10);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSMODEL_0024
     * @tc.name      testSummary0024
     * @tc.desc      summary combines the main settings
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSummary0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSummary0024 begin');
      expect(new SettingsModel().summary()).assertEqual('信息 · 每页 10 条 · 浅色');
    })
  });
}
