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

function model(): SettingsModel {
  return new SettingsModel();
}

export default function settingsFlowMatrixTest(): void {
  describe('SettingsFlowMatrixTest', () => {
    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSFLOW_0001
     * @tc.name      testDefaultSerialize0001
     * @tc.desc      defaults serialize consistently
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDefaultSerialize0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(model().serialize()).assertEqual(
        'logLevel=info;pageSize=10;theme=light;template=read-only;confirm=1');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSFLOW_0002
     * @tc.name      testLogChange0002
     * @tc.desc      log level changes appear in serialized text
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLogChange0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const value: SettingsModel = model();
      value.setLogLevel('debug');
      expect(value.serialize().indexOf('logLevel=debug') === 0).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSFLOW_0003
     * @tc.name      testPageChange0003
     * @tc.desc      page size changes appear in serialized text
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPageChange0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const value: SettingsModel = model();
      value.setPageSize(20);
      expect(value.serialize().indexOf('pageSize=20') > 0).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSFLOW_0004
     * @tc.name      testThemeChange0004
     * @tc.desc      theme changes appear in serialized text
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testThemeChange0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const value: SettingsModel = model();
      value.setTheme('dark');
      expect(value.serialize().indexOf('theme=dark') > 0).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSFLOW_0005
     * @tc.name      testTemplateChange0005
     * @tc.desc      template changes appear in serialized text
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTemplateChange0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const value: SettingsModel = model();
      value.setDefaultTemplate('full');
      expect(value.serialize().indexOf('template=full') > 0).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSFLOW_0006
     * @tc.name      testConfirmChange0006
     * @tc.desc      confirmation changes appear in serialized text
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfirmChange0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const value: SettingsModel = model();
      value.setConfirmBeforeDelete(false);
      expect(value.serialize().endsWith('confirm=0')).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSFLOW_0007
     * @tc.name      testStepSequence0007
     * @tc.desc      a full sequence serializes predictably
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStepSequence0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const value: SettingsModel = model();
      value.setLogLevel('warn');
      value.setPageSize(50);
      value.setTheme('auto');
      value.setDefaultTemplate('copyable');
      value.setConfirmBeforeDelete(false);
      expect(value.serialize()).assertEqual(
        'logLevel=warn;pageSize=50;theme=auto;template=copyable;confirm=0');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSFLOW_0008
     * @tc.name      testRoundTripSequence0008
     * @tc.desc      the full sequence round trips through parsing
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRoundTripSequence0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const value: SettingsModel = model();
      value.setLogLevel('error');
      value.setPageSize(5);
      value.setTheme('dark');
      value.setDefaultTemplate('editable');
      value.setConfirmBeforeDelete(false);
      const parsed: SettingsModel = SettingsModel.parse(value.serialize());
      expect(parsed.serialize()).assertEqual(value.serialize());
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSFLOW_0009
     * @tc.name      testParseLog0009
     * @tc.desc      single field parses keep other defaults
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseLog0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const parsed: SettingsModel = SettingsModel.parse('logLevel=debug');
      expect(parsed.logLevel).assertEqual('debug');
      expect(parsed.pageSize).assertEqual(10);
      expect(parsed.theme).assertEqual('light');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSFLOW_0010
     * @tc.name      testParsePage0010
     * @tc.desc      page size parses independently
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParsePage0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const parsed: SettingsModel = SettingsModel.parse('pageSize=20');
      expect(parsed.pageSize).assertEqual(20);
      expect(parsed.logLevel).assertEqual('info');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSFLOW_0011
     * @tc.name      testParseTheme0011
     * @tc.desc      theme parses independently
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseTheme0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(SettingsModel.parse('theme=auto').theme).assertEqual('auto');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSFLOW_0012
     * @tc.name      testParseTemplate0012
     * @tc.desc      template parses independently
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseTemplate0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(SettingsModel.parse('template=printable').defaultTemplateId).assertEqual('printable');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSFLOW_0013
     * @tc.name      testParseConfirm0013
     * @tc.desc      confirmation parses independently
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseConfirm0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(SettingsModel.parse('confirm=0').confirmBeforeDelete).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSFLOW_0014
     * @tc.name      testParseInvalidLog0014
     * @tc.desc      invalid log levels leave defaults intact
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseInvalidLog0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(SettingsModel.parse('logLevel=trace').logLevel).assertEqual('info');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSFLOW_0015
     * @tc.name      testParseInvalidTheme0015
     * @tc.desc      invalid themes leave defaults intact
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseInvalidTheme0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(SettingsModel.parse('theme=neon').theme).assertEqual('light');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSFLOW_0016
     * @tc.name      testParseBadPage0016
     * @tc.desc      non numeric page sizes are ignored
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseBadPage0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(SettingsModel.parse('pageSize=many').pageSize).assertEqual(10);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSFLOW_0017
     * @tc.name      testParseClampPage0017
     * @tc.desc      large page sizes are clamped on parse
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseClampPage0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(SettingsModel.parse('pageSize=200').pageSize).assertEqual(50);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSFLOW_0018
     * @tc.name      testParseNoise0018
     * @tc.desc      unknown and malformed segments are ignored
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseNoise0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const parsed: SettingsModel = SettingsModel.parse('unknown=1;broken;theme=dark');
      expect(parsed.theme).assertEqual('dark');
      expect(parsed.logLevel).assertEqual('info');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSFLOW_0019
     * @tc.name      testValidateAfterLog0019
     * @tc.desc      valid log changes pass validation
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidateAfterLog0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const value: SettingsModel = model();
      value.setLogLevel('error');
      expect(value.validate().length).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSFLOW_0020
     * @tc.name      testValidateAfterPage0020
     * @tc.desc      clamped page sizes pass validation
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidateAfterPage0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const value: SettingsModel = model();
      value.setPageSize(999);
      expect(value.pageSize).assertEqual(50);
      expect(value.validate().length).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSFLOW_0021
     * @tc.name      testValidateBroken0021
     * @tc.desc      broken fields are all reported
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidateBroken0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const value: SettingsModel = model();
      value.logLevel = 'x';
      value.pageSize = 0;
      value.theme = 'y';
      value.defaultTemplateId = '';
      expect(value.validate().length).assertEqual(4);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSFLOW_0022
     * @tc.name      testValidateThenFix0022
     * @tc.desc      fixing broken fields clears the issues
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testValidateThenFix0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const value: SettingsModel = model();
      value.theme = 'y';
      expect(value.validate().length).assertEqual(1);
      value.setTheme('dark');
      expect(value.validate().length).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSFLOW_0023
     * @tc.name      testResetAfterChanges0023
     * @tc.desc      resetting returns to serializable defaults
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResetAfterChanges0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const value: SettingsModel = model();
      value.setLogLevel('debug');
      value.setPageSize(5);
      value.setTheme('auto');
      value.setDefaultTemplate('full');
      value.reset();
      expect(value.serialize()).assertEqual(
        'logLevel=info;pageSize=10;theme=light;template=read-only;confirm=1');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSFLOW_0024
     * @tc.name      testResetTwice0024
     * @tc.desc      resetting twice is idempotent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResetTwice0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const value: SettingsModel = model();
      value.reset();
      const first: string = value.serialize();
      value.reset();
      expect(value.serialize()).assertEqual(first);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSFLOW_0025
     * @tc.name      testSummarySequence0025
     * @tc.desc      summaries follow each change
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSummarySequence0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const value: SettingsModel = model();
      expect(value.summary()).assertEqual('信息 · 每页 10 条 · 浅色');
      value.setLogLevel('warn');
      expect(value.summary()).assertEqual('警告 · 每页 10 条 · 浅色');
      value.setTheme('auto');
      expect(value.summary()).assertEqual('警告 · 每页 10 条 · 跟随系统');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSFLOW_0026
     * @tc.name      testLabelSweep0026
     * @tc.desc      labels cover all log levels and themes
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLabelSweep0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(logLevelLabel('debug')).assertEqual('调试');
      expect(logLevelLabel('info')).assertEqual('信息');
      expect(logLevelLabel('warn')).assertEqual('警告');
      expect(logLevelLabel('error')).assertEqual('错误');
      expect(themeLabel('light')).assertEqual('浅色');
      expect(themeLabel('dark')).assertEqual('深色');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSFLOW_0027
     * @tc.name      testPageClampSequence0027
     * @tc.desc      page clamping applies to every setter call
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPageClampSequence0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const value: SettingsModel = model();
      expect(value.setPageSize(0)).assertEqual(5);
      expect(value.setPageSize(100)).assertEqual(50);
      expect(value.setPageSize(25)).assertEqual(25);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSFLOW_0028
     * @tc.name      testTemplateBlankRejected0028
     * @tc.desc      blank template ids are rejected without side effects
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTemplateBlankRejected0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const value: SettingsModel = model();
      expect(value.setDefaultTemplate('  ')).assertFalse();
      expect(value.defaultTemplateId).assertEqual('read-only');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSFLOW_0029
     * @tc.name      testSerializeStability0029
     * @tc.desc      repeated serialization is stable
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSerializeStability0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const value: SettingsModel = model();
      value.setTheme('dark');
      expect(value.serialize()).assertEqual(value.serialize());
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSFLOW_0030
     * @tc.name      testParseThenChange0030
     * @tc.desc      parsed settings can be changed and serialized again
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseThenChange0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const parsed: SettingsModel = SettingsModel.parse('theme=dark;confirm=0');
      parsed.setPageSize(20);
      expect(parsed.serialize()).assertEqual(
        'logLevel=info;pageSize=20;theme=dark;template=read-only;confirm=0');
    })
  });
}
