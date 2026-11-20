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

export default function settingsMatrix2Test(): void {
  describe('SettingsMatrix2Test', () => {
    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSMATRIX2_0001
     * @tc.name      testDefaults0001
     * @tc.desc      defaults serialize predictably
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDefaults0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(new SettingsModel().serialize()).assertEqual(
        'logLevel=info;pageSize=10;theme=light;template=read-only;confirm=1');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSMATRIX2_0002
     * @tc.name      testParseAllFields0002
     * @tc.desc      every field parses from one payload
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseAllFields0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const parsed: SettingsModel = SettingsModel.parse(
        'logLevel=debug;pageSize=20;theme=dark;template=full;confirm=0');
      expect(parsed.logLevel).assertEqual('debug');
      expect(parsed.pageSize).assertEqual(20);
      expect(parsed.theme).assertEqual('dark');
      expect(parsed.defaultTemplateId).assertEqual('full');
      expect(parsed.confirmBeforeDelete).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSMATRIX2_0003
     * @tc.name      testParseNoise0003
     * @tc.desc      unknown and malformed segments are ignored
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseNoise0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const parsed: SettingsModel = SettingsModel.parse('unknown=1;broken;theme=auto');
      expect(parsed.theme).assertEqual('auto');
      expect(parsed.logLevel).assertEqual('info');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSMATRIX2_0004
     * @tc.name      testParseInvalidLog0004
     * @tc.desc      invalid log levels keep the default
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseInvalidLog0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(SettingsModel.parse('logLevel=trace').logLevel).assertEqual('info');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSMATRIX2_0005
     * @tc.name      testParseInvalidTheme0005
     * @tc.desc      invalid themes keep the default
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseInvalidTheme0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(SettingsModel.parse('theme=neon').theme).assertEqual('light');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSMATRIX2_0006
     * @tc.name      testParseBadPage0006
     * @tc.desc      non numeric page sizes keep the default
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseBadPage0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(SettingsModel.parse('pageSize=ten').pageSize).assertEqual(10);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSMATRIX2_0007
     * @tc.name      testParseClampPage0007
     * @tc.desc      parsed page sizes are clamped
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseClampPage0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(SettingsModel.parse('pageSize=0').pageSize).assertEqual(5);
      expect(SettingsModel.parse('pageSize=999').pageSize).assertEqual(50);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSMATRIX2_0008
     * @tc.name      testParseBlankTemplate0008
     * @tc.desc      blank templates keep the default id
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseBlankTemplate0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(SettingsModel.parse('template=   ').defaultTemplateId).assertEqual('read-only');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSMATRIX2_0009
     * @tc.name      testParseConfirmMatrix0009
     * @tc.desc      confirmation values parse for both states
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseConfirmMatrix0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(SettingsModel.parse('confirm=0').confirmBeforeDelete).assertFalse();
      expect(SettingsModel.parse('confirm=1').confirmBeforeDelete).assertTrue();
      expect(SettingsModel.parse('confirm=yes').confirmBeforeDelete).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSMATRIX2_0010
     * @tc.name      testLogSequence0010
     * @tc.desc      log level changes serialize in order
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLogSequence0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: SettingsModel = new SettingsModel();
      model.setLogLevel('debug');
      model.setLogLevel('error');
      expect(model.serialize().indexOf('logLevel=error') === 0).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSMATRIX2_0011
     * @tc.name      testPageSequence0011
     * @tc.desc      page size changes clamp on every call
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPageSequence0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.setPageSize(1)).assertEqual(5);
      expect(model.setPageSize(20)).assertEqual(20);
      expect(model.setPageSize(200)).assertEqual(50);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSMATRIX2_0012
     * @tc.name      testThemeSequence0012
     * @tc.desc      theme changes serialize in order
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testThemeSequence0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: SettingsModel = new SettingsModel();
      model.setTheme('dark');
      model.setTheme('auto');
      expect(model.serialize().indexOf('theme=auto') > 0).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSMATRIX2_0013
     * @tc.name      testValidateLog0013
     * @tc.desc      invalid log levels are reported
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidateLog0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: SettingsModel = new SettingsModel();
      model.logLevel = 'x';
      expect(model.validate().length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSMATRIX2_0014
     * @tc.name      testValidatePage0014
     * @tc.desc      invalid page sizes are reported
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidatePage0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: SettingsModel = new SettingsModel();
      model.pageSize = 0;
      expect(model.validate().length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSMATRIX2_0015
     * @tc.name      testValidateTheme0015
     * @tc.desc      invalid themes are reported
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidateTheme0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: SettingsModel = new SettingsModel();
      model.theme = 'x';
      expect(model.validate().length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSMATRIX2_0016
     * @tc.name      testValidateTemplate0016
     * @tc.desc      blank templates are reported
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidateTemplate0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: SettingsModel = new SettingsModel();
      model.defaultTemplateId = '';
      expect(model.validate().length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSMATRIX2_0017
     * @tc.name      testReset0017
     * @tc.desc      reset restores the default serialization
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testReset0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: SettingsModel = new SettingsModel();
      model.setLogLevel('error');
      model.setPageSize(50);
      model.setTheme('dark');
      model.setDefaultTemplate('full');
      model.reset();
      expect(model.serialize()).assertEqual(
        'logLevel=info;pageSize=10;theme=light;template=read-only;confirm=1');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSMATRIX2_0018
     * @tc.name      testSummaryMatrix0018
     * @tc.desc      summaries follow the changed fields
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSummaryMatrix0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.summary()).assertEqual('信息 · 每页 10 条 · 浅色');
      model.setTheme('dark');
      expect(model.summary()).assertEqual('信息 · 每页 10 条 · 深色');
      model.setPageSize(50);
      expect(model.summary()).assertEqual('信息 · 每页 50 条 · 深色');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSMATRIX2_0019
     * @tc.name      testLogLabels0019
     * @tc.desc      log level labels cover every option
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLogLabels0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(logLevelLabel('debug')).assertEqual('调试');
      expect(logLevelLabel('warn')).assertEqual('警告');
      expect(logLevelLabel('error')).assertEqual('错误');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSMATRIX2_0020
     * @tc.name      testThemeLabels0020
     * @tc.desc      theme labels cover every option
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testThemeLabels0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(themeLabel('light')).assertEqual('浅色');
      expect(themeLabel('dark')).assertEqual('深色');
      expect(themeLabel('auto')).assertEqual('跟随系统');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSMATRIX2_0021
     * @tc.name      testRoundTripTwice0021
     * @tc.desc      repeated serialization cycles are stable
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRoundTripTwice0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const source: SettingsModel = SettingsModel.parse('logLevel=warn;pageSize=20;theme=auto');
      const first: string = source.serialize();
      const second: SettingsModel = SettingsModel.parse(first);
      expect(second.serialize()).assertEqual(first);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSMATRIX2_0022
     * @tc.name      testParseOnlyUnknown0022
     * @tc.desc      payloads without known fields keep defaults
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseOnlyUnknown0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const parsed: SettingsModel = SettingsModel.parse('a=1;b=2');
      expect(parsed.serialize()).assertEqual(
        'logLevel=info;pageSize=10;theme=light;template=read-only;confirm=1');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSMATRIX2_0023
     * @tc.name      testPageFloor0023
     * @tc.desc      fractional page sizes are floored
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPageFloor0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.setPageSize(14.9)).assertEqual(14);
      expect(model.setPageSize(5.1)).assertEqual(5);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSMATRIX2_0024
     * @tc.name      testTemplateSetter0024
     * @tc.desc      template ids can be changed and reset
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTemplateSetter0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: SettingsModel = new SettingsModel();
      expect(model.setDefaultTemplate('editable')).assertTrue();
      expect(model.defaultTemplateId).assertEqual('editable');
      model.reset();
      expect(model.defaultTemplateId).assertEqual('read-only');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSMATRIX2_0025
     * @tc.name      testConfirmSetter0025
     * @tc.desc      confirmation changes serialize correctly
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfirmSetter0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: SettingsModel = new SettingsModel();
      model.setConfirmBeforeDelete(false);
      expect(model.serialize().endsWith('confirm=0')).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSMATRIX2_0026
     * @tc.name      testValidateAfterFixes0026
     * @tc.desc      validation clears after fixing each field
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidateAfterFixes0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: SettingsModel = new SettingsModel();
      model.logLevel = 'x';
      model.pageSize = 0;
      expect(model.validate().length).assertEqual(2);
      model.setLogLevel('info');
      model.setPageSize(10);
      expect(model.validate().length).assertEqual(0);
    })
  });
}
