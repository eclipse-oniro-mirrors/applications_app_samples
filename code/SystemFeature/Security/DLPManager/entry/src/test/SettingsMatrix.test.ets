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

export default function settingsMatrixTest(): void {
  describe('SettingsMatrixTest', () => {
    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSMATRIX_0001
     * @tc.name      testDefaults0001
     * @tc.desc      default settings match the documented values
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
     * @tc.number    SUB_DLP_MANAGER_SETTINGSMATRIX_0002
     * @tc.name      testLogLevels0002
     * @tc.desc      every supported log level is accepted
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLogLevels0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testLogLevels0002 begin');
      const model: SettingsModel = new SettingsModel();
      const levels: Array<string> = ['debug', 'info', 'warn', 'error'];
      for (let index = 0; index < levels.length; index++) {
        expect(model.setLogLevel(levels[index])).assertTrue();
        expect(model.logLevel).assertEqual(levels[index]);
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSMATRIX_0003
     * @tc.name      testLogInvalid0003
     * @tc.desc      unknown log levels leave the value unchanged
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLogInvalid0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testLogInvalid0003 begin');
      const model: SettingsModel = new SettingsModel();
      expect(model.setLogLevel('verbose')).assertFalse();
      expect(model.logLevel).assertEqual('info');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSMATRIX_0004
     * @tc.name      testPageClamp0004
     * @tc.desc      page sizes are clamped to five through fifty
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPageClamp0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testPageClamp0004 begin');
      const model: SettingsModel = new SettingsModel();
      expect(model.setPageSize(4)).assertEqual(5);
      expect(model.setPageSize(50)).assertEqual(50);
      expect(model.setPageSize(51)).assertEqual(50);
      expect(model.setPageSize(20.9)).assertEqual(20);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSMATRIX_0005
     * @tc.name      testThemes0005
     * @tc.desc      every supported theme is accepted
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testThemes0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testThemes0005 begin');
      const model: SettingsModel = new SettingsModel();
      const themes: Array<string> = ['light', 'dark', 'auto'];
      for (let index = 0; index < themes.length; index++) {
        expect(model.setTheme(themes[index])).assertTrue();
        expect(model.theme).assertEqual(themes[index]);
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSMATRIX_0006
     * @tc.name      testThemeInvalid0006
     * @tc.desc      unknown themes leave the value unchanged
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testThemeInvalid0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testThemeInvalid0006 begin');
      const model: SettingsModel = new SettingsModel();
      expect(model.setTheme('neon')).assertFalse();
      expect(model.theme).assertEqual('light');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSMATRIX_0007
     * @tc.name      testTemplateId0007
     * @tc.desc      template ids must be non blank
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTemplateId0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testTemplateId0007 begin');
      const model: SettingsModel = new SettingsModel();
      expect(model.setDefaultTemplate('   ')).assertFalse();
      expect(model.setDefaultTemplate('full')).assertTrue();
      expect(model.defaultTemplateId).assertEqual('full');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSMATRIX_0008
     * @tc.name      testConfirmFlag0008
     * @tc.desc      the confirmation switch is stored
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfirmFlag0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testConfirmFlag0008 begin');
      const model: SettingsModel = new SettingsModel();
      model.setConfirmBeforeDelete(false);
      expect(model.confirmBeforeDelete).assertFalse();
      model.setConfirmBeforeDelete(true);
      expect(model.confirmBeforeDelete).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSMATRIX_0009
     * @tc.name      testReset0009
     * @tc.desc      reset restores every default
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testReset0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testReset0009 begin');
      const model: SettingsModel = new SettingsModel();
      model.setLogLevel('error');
      model.setPageSize(50);
      model.setTheme('dark');
      model.setDefaultTemplate('full');
      model.setConfirmBeforeDelete(false);
      model.reset();
      expect(model.serialize()).assertEqual(
        'logLevel=info;pageSize=10;theme=light;template=read-only;confirm=1');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSMATRIX_0010
     * @tc.name      testValidateDefault0010
     * @tc.desc      defaults pass validation
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidateDefault0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testValidateDefault0010 begin');
      expect(new SettingsModel().validate().length).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSMATRIX_0011
     * @tc.name      testValidateLog0011
     * @tc.desc      invalid log levels are reported
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidateLog0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testValidateLog0011 begin');
      const model: SettingsModel = new SettingsModel();
      model.logLevel = 'x';
      expect(model.validate().length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSMATRIX_0012
     * @tc.name      testValidatePage0012
     * @tc.desc      out of range page sizes are reported
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidatePage0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testValidatePage0012 begin');
      const model: SettingsModel = new SettingsModel();
      model.pageSize = 1;
      expect(model.validate().length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSMATRIX_0013
     * @tc.name      testValidateTheme0013
     * @tc.desc      invalid themes are reported
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidateTheme0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testValidateTheme0013 begin');
      const model: SettingsModel = new SettingsModel();
      model.theme = 'neon';
      expect(model.validate().length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSMATRIX_0014
     * @tc.name      testValidateTemplate0014
     * @tc.desc      blank default templates are reported
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidateTemplate0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testValidateTemplate0014 begin');
      const model: SettingsModel = new SettingsModel();
      model.defaultTemplateId = '';
      expect(model.validate().length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSMATRIX_0015
     * @tc.name      testValidateMultiple0015
     * @tc.desc      multiple issues are all reported
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidateMultiple0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testValidateMultiple0015 begin');
      const model: SettingsModel = new SettingsModel();
      model.logLevel = 'x';
      model.pageSize = 0;
      model.theme = 'y';
      model.defaultTemplateId = '';
      expect(model.validate().length).assertEqual(4);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSMATRIX_0016
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
     * @tc.number    SUB_DLP_MANAGER_SETTINGSMATRIX_0017
     * @tc.name      testSerializeChanged0017
     * @tc.desc      changed values serialize correctly
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSerializeChanged0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSerializeChanged0017 begin');
      const model: SettingsModel = new SettingsModel();
      model.setLogLevel('debug');
      model.setPageSize(5);
      model.setTheme('auto');
      model.setDefaultTemplate('editable');
      model.setConfirmBeforeDelete(false);
      expect(model.serialize()).assertEqual(
        'logLevel=debug;pageSize=5;theme=auto;template=editable;confirm=0');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSMATRIX_0018
     * @tc.name      testParseEmpty0018
     * @tc.desc      empty text parses to defaults
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseEmpty0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseEmpty0018 begin');
      expect(SettingsModel.parse('').serialize()).assertEqual(
        'logLevel=info;pageSize=10;theme=light;template=read-only;confirm=1');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSMATRIX_0019
     * @tc.name      testParseRoundTrip0019
     * @tc.desc      serialized settings round trip
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseRoundTrip0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseRoundTrip0019 begin');
      const source: SettingsModel = new SettingsModel();
      source.setLogLevel('warn');
      source.setPageSize(20);
      source.setTheme('dark');
      source.setDefaultTemplate('copyable');
      source.setConfirmBeforeDelete(false);
      expect(SettingsModel.parse(source.serialize()).serialize()).assertEqual(source.serialize());
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSMATRIX_0020
     * @tc.name      testParseLogOnly0020
     * @tc.desc      single fields parse without touching defaults
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseLogOnly0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseLogOnly0020 begin');
      const model: SettingsModel = SettingsModel.parse('logLevel=error');
      expect(model.logLevel).assertEqual('error');
      expect(model.pageSize).assertEqual(10);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSMATRIX_0021
     * @tc.name      testParsePageOnly0021
     * @tc.desc      page size parses independently
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParsePageOnly0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParsePageOnly0021 begin');
      expect(SettingsModel.parse('pageSize=50').pageSize).assertEqual(50);
      expect(SettingsModel.parse('pageSize=100').pageSize).assertEqual(50);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSMATRIX_0022
     * @tc.name      testParseThemeOnly0022
     * @tc.desc      theme parses independently
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseThemeOnly0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseThemeOnly0022 begin');
      expect(SettingsModel.parse('theme=dark').theme).assertEqual('dark');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSMATRIX_0023
     * @tc.name      testParseTemplateOnly0023
     * @tc.desc      default template parses independently
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseTemplateOnly0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseTemplateOnly0023 begin');
      expect(SettingsModel.parse('template=full').defaultTemplateId).assertEqual('full');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSMATRIX_0024
     * @tc.name      testParseConfirmOnly0024
     * @tc.desc      the confirmation flag parses independently
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseConfirmOnly0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseConfirmOnly0024 begin');
      expect(SettingsModel.parse('confirm=0').confirmBeforeDelete).assertFalse();
      expect(SettingsModel.parse('confirm=1').confirmBeforeDelete).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSMATRIX_0025
     * @tc.name      testParseInvalidValues0025
     * @tc.desc      invalid log levels and themes keep defaults
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseInvalidValues0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseInvalidValues0025 begin');
      expect(SettingsModel.parse('logLevel=verbose').logLevel).assertEqual('info');
      expect(SettingsModel.parse('theme=neon').theme).assertEqual('light');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSMATRIX_0026
     * @tc.name      testParseBadPage0026
     * @tc.desc      non numeric page sizes keep the default
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseBadPage0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseBadPage0026 begin');
      expect(SettingsModel.parse('pageSize=abc').pageSize).assertEqual(10);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSMATRIX_0027
     * @tc.name      testParseIgnoredFields0027
     * @tc.desc      unknown and malformed fields are ignored
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseIgnoredFields0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseIgnoredFields0027 begin');
      const model: SettingsModel = SettingsModel.parse('unknown=1;broken;theme=auto');
      expect(model.theme).assertEqual('auto');
      expect(model.logLevel).assertEqual('info');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSMATRIX_0028
     * @tc.name      testSummaryDefault0028
     * @tc.desc      summaries combine the main values
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSummaryDefault0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSummaryDefault0028 begin');
      expect(new SettingsModel().summary()).assertEqual('信息 · 每页 10 条 · 浅色');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSMATRIX_0029
     * @tc.name      testSummaryChanged0029
     * @tc.desc      summaries follow the changed values
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSummaryChanged0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSummaryChanged0029 begin');
      const model: SettingsModel = new SettingsModel();
      model.setLogLevel('error');
      model.setPageSize(50);
      model.setTheme('dark');
      expect(model.summary()).assertEqual('错误 · 每页 50 条 · 深色');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSMATRIX_0030
     * @tc.name      testLabels0030
     * @tc.desc      labels cover every level and theme
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLabels0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testLabels0030 begin');
      expect(logLevelLabel('debug')).assertEqual('调试');
      expect(logLevelLabel('info')).assertEqual('信息');
      expect(logLevelLabel('warn')).assertEqual('警告');
      expect(logLevelLabel('error')).assertEqual('错误');
      expect(themeLabel('light')).assertEqual('浅色');
      expect(themeLabel('dark')).assertEqual('深色');
      expect(themeLabel('auto')).assertEqual('跟随系统');
    })
  });
}
