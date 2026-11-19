/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

/**
 * 能力矩阵、错误目录、状态机与回访规则的矩阵用例。
 *
 * 所有断言都引用主代码导出的规则表与函数，测试内不复制业务常量。
 */
import { describe, expect } from '@ohos/hypium';
import { traceParameter, loggedIt as it } from '../support/TestLog';
import { configureTestText } from '../support/TestTextResources';
import {
  CAPABILITY_RULES, CapabilityEvaluation, CapabilityQuery, CapabilityVerdict, DeviceForm,
  SystemFlavor, canSetInApp, evaluateCapability, isDefinitelyUnsupported, needsSettingsGuidance,
  ruleSummaries, verdictSeries
} from '../../../main/ets/autostart/rules/CapabilityMatrix';
import {
  ERROR_CATALOG, ErrorEntry, ErrorOwner, allowsAutoRetry, describeError, groupByOwner,
  isUnsupportedCode, logLineOf, needsSettingsForError, requiresUserActionFirst, tallyCodes
} from '../../../main/ets/autostart/rules/ErrorCatalog';
import {
  REVISIT_TIMEOUT_MS, RevisitComparison, RevisitSession, RevisitStage, RevisitTracker,
  compareSamples, isComparableRecord, valueText
} from '../../../main/ets/autostart/revisit/RevisitTracker';
import {
  EXPORT_ROW_LIMIT, SENSITIVE_KEYS, clip, clockText, compact, countByOutcome, dateTimeText,
  durationText, elapsedSince, exportable, isBlank, isKnownOutcome, isKnownSource, isSensitiveKey,
  latestRecords, maskToken, outcomeLabel, ratioPercent, selectForExport, sourceLabel, toCsv,
  toMarkdown
} from '../../../main/ets/autostart/tools/DiagnosticTools';
import { QueryOutcome, QueryPhase, QueryRecord, RefreshSource } from '../../../main/ets/autostart/AutoStartupTypes';

const ALL_FORMS: DeviceForm[] = [DeviceForm.PHONE, DeviceForm.TABLET, DeviceForm.TV,
  DeviceForm.WEARABLE, DeviceForm.UNKNOWN];
const ALL_FLAVORS: SystemFlavor[] = [SystemFlavor.OPEN_HARMONY, SystemFlavor.COMMERCIAL,
  SystemFlavor.UNKNOWN];

function queryOf(api: number, form: DeviceForm, flavor: SystemFlavor, granted: boolean = true,
  entry: boolean = true): CapabilityQuery {
  return new CapabilityQuery(api, form, flavor, granted, entry);
}

function recordOf(id: number, timestamp: number, result: string,
  outcome: QueryOutcome): QueryRecord {
  const record: QueryRecord = new QueryRecord();
  record.id = id;
  record.timestamp = timestamp;
  record.source = RefreshSource.MANUAL;
  record.result = result;
  record.supportResult = 'true';
  record.statusResult = result;
  record.outcome = outcome;
  record.durationMillis = 12;
  return record;
}

export default function rulesMatrixTests(): void {
  configureTestText();
  describe('CapabilityMatrixRules', (): void => {
    /**
     * @tc.number    SUB_STARTUP_CAPABILITYMATRIXRULES_0100
     * @tc.name      testCapabilityMatrixRules0001
     * @tc.desc      Verify below api9 is system update for every form
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testCapabilityMatrixRules0001', 0, (): void => {
      configureTestText();
      ALL_FORMS.forEach((form: DeviceForm): void => {
        ALL_FLAVORS.forEach((flavor: SystemFlavor): void => {
          for (let api = 0; api <= 8; api++) {
            const evaluation: CapabilityEvaluation = evaluateCapability(queryOf(api, form, flavor));
            expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixRules_0001|RulesMatrix.test.ets|assert0001|assertEqual|actual', evaluation.verdict)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixRules_0001|RulesMatrix.test.ets|assert0001|assertEqual|expected', CapabilityVerdict.NEED_SYSTEM_UPDATE));
            expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixRules_0001|RulesMatrix.test.ets|assert0002|assertTrue|actual|expected=true', evaluation.rule !== undefined)).assertTrue();
            expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixRules_0001|RulesMatrix.test.ets|assert0003|assertTrue|actual|expected=true', isDefinitelyUnsupported(evaluation.verdict))).assertTrue();
            expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixRules_0001|RulesMatrix.test.ets|assert0004|assertFalse|actual|expected=false', canSetInApp(evaluation))).assertFalse();
          }
        });
      });
    });

    /**
     * @tc.number    SUB_STARTUP_CAPABILITYMATRIXRULES_0200
     * @tc.name      testCapabilityMatrixRules0002
     * @tc.desc      Verify api9 to11 open harmony phone and tablet are supported
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testCapabilityMatrixRules0002', 0, (): void => {
      configureTestText();
      const forms: DeviceForm[] = [DeviceForm.PHONE, DeviceForm.TABLET];
      forms.forEach((form: DeviceForm): void => {
        for (let api = 9; api <= 11; api++) {
          const evaluation = evaluateCapability(
            queryOf(api, form, SystemFlavor.OPEN_HARMONY, true, true));
          expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixRules_0002|RulesMatrix.test.ets|assert0005|assertEqual|actual', evaluation.verdict)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixRules_0002|RulesMatrix.test.ets|assert0005|assertEqual|expected', CapabilityVerdict.SUPPORTED));
          expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixRules_0002|RulesMatrix.test.ets|assert0006|assertFalse|actual|expected=false', evaluation.downgradedByPermission)).assertFalse();
          expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixRules_0002|RulesMatrix.test.ets|assert0007|assertFalse|actual|expected=false', canSetInApp(evaluation))).assertFalse();
          expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixRules_0002|RulesMatrix.test.ets|assert0008|assertTrue|actual|expected=true', needsSettingsGuidance(evaluation))).assertTrue();
        }
      });
    });

    /**
     * @tc.number    SUB_STARTUP_CAPABILITYMATRIXRULES_0300
     * @tc.name      testCapabilityMatrixRules0003
     * @tc.desc      Verify api9 to11 commercial distribution requires permission
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testCapabilityMatrixRules0003', 0, (): void => {
      configureTestText();
      for (let api = 9; api <= 11; api++) {
        const denied = evaluateCapability(
          queryOf(api, DeviceForm.PHONE, SystemFlavor.COMMERCIAL, false, true));
        expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixRules_0003|RulesMatrix.test.ets|assert0009|assertEqual|actual', denied.verdict)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixRules_0003|RulesMatrix.test.ets|assert0009|assertEqual|expected', CapabilityVerdict.NEED_PERMISSION));
        expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixRules_0003|RulesMatrix.test.ets|assert0010|assertTrue|actual|expected=true', denied.downgradedByPermission)).assertTrue();
        expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixRules_0003|RulesMatrix.test.ets|assert0011|assertTrue|actual|expected=true', denied.rule !== undefined && denied.rule?.requiresPermission)).assertTrue();
        const granted = evaluateCapability(
          queryOf(api, DeviceForm.PHONE, SystemFlavor.COMMERCIAL, true, true));
        expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixRules_0003|RulesMatrix.test.ets|assert0012|assertEqual|actual', granted.verdict)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixRules_0003|RulesMatrix.test.ets|assert0012|assertEqual|expected', CapabilityVerdict.NEED_PERMISSION));
        expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixRules_0003|RulesMatrix.test.ets|assert0013|assertFalse|actual|expected=false', granted.downgradedByPermission)).assertFalse();
      }
    });

    /**
     * @tc.number    SUB_STARTUP_CAPABILITYMATRIXRULES_0400
     * @tc.name      testCapabilityMatrixRules0004
     * @tc.desc      Verify wearable is excluded until api18
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testCapabilityMatrixRules0004', 0, (): void => {
      configureTestText();
      for (let api = 9; api <= 17; api++) {
        ALL_FLAVORS.forEach((flavor: SystemFlavor): void => {
          const evaluation = evaluateCapability(queryOf(api, DeviceForm.WEARABLE, flavor));
          expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixRules_0004|RulesMatrix.test.ets|assert0014|assertEqual|actual', evaluation.verdict)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixRules_0004|RulesMatrix.test.ets|assert0014|assertEqual|expected', CapabilityVerdict.DEVICE_EXCLUDED));
          expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixRules_0004|RulesMatrix.test.ets|assert0015|assertTrue|actual|expected=true', isDefinitelyUnsupported(evaluation.verdict))).assertTrue();
        });
      }
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixRules_0004|RulesMatrix.test.ets|assert0016|assertTrue|actual|expected=true', ALL_FORMS.indexOf(DeviceForm.WEARABLE) >= 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_CAPABILITYMATRIXRULES_0500
     * @tc.name      testCapabilityMatrixRules0005
     * @tc.desc      Verify tv is excluded only before api12
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testCapabilityMatrixRules0005', 0, (): void => {
      configureTestText();
      for (let api = 9; api <= 11; api++) {
        const evaluation = evaluateCapability(
          queryOf(api, DeviceForm.TV, SystemFlavor.OPEN_HARMONY));
        expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixRules_0005|RulesMatrix.test.ets|assert0017|assertEqual|actual', evaluation.verdict)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixRules_0005|RulesMatrix.test.ets|assert0017|assertEqual|expected', CapabilityVerdict.DEVICE_EXCLUDED));
      }
      for (let api = 12; api <= 13; api++) {
        const open = evaluateCapability(queryOf(api, DeviceForm.TV, SystemFlavor.OPEN_HARMONY));
        expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixRules_0005|RulesMatrix.test.ets|assert0018|assertEqual|actual', open.verdict)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixRules_0005|RulesMatrix.test.ets|assert0018|assertEqual|expected', CapabilityVerdict.SUPPORTED));
        const commercial = evaluateCapability(queryOf(api, DeviceForm.TV, SystemFlavor.COMMERCIAL));
        expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixRules_0005|RulesMatrix.test.ets|assert0019|assertEqual|actual', commercial.verdict)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixRules_0005|RulesMatrix.test.ets|assert0019|assertEqual|expected', CapabilityVerdict.NEED_PERMISSION));
      }
    });

    /**
     * @tc.number    SUB_STARTUP_CAPABILITYMATRIXRULES_0600
     * @tc.name      testCapabilityMatrixRules0006
     * @tc.desc      Verify api14 to17 phone tablet tv are supported
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testCapabilityMatrixRules0006', 0, (): void => {
      configureTestText();
      const forms: DeviceForm[] = [DeviceForm.PHONE, DeviceForm.TABLET, DeviceForm.TV];
      for (let api = 14; api <= 17; api++) {
        forms.forEach((form: DeviceForm): void => {
          ALL_FLAVORS.forEach((flavor: SystemFlavor): void => {
            const evaluation = evaluateCapability(queryOf(api, form, flavor));
            expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixRules_0006|RulesMatrix.test.ets|assert0020|assertEqual|actual', evaluation.verdict)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixRules_0006|RulesMatrix.test.ets|assert0020|assertEqual|expected', CapabilityVerdict.SUPPORTED));
            expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixRules_0006|RulesMatrix.test.ets|assert0021|assertTrue|actual|expected=true', canSetInApp(evaluation))).assertTrue();
            expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixRules_0006|RulesMatrix.test.ets|assert0022|assertFalse|actual|expected=false', needsSettingsGuidance(evaluation))).assertFalse();
          });
        });
      }
    });

    /**
     * @tc.number    SUB_STARTUP_CAPABILITYMATRIXRULES_0700
     * @tc.name      testCapabilityMatrixRules0007
     * @tc.desc      Verify api18 and above supports every form
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testCapabilityMatrixRules0007', 0, (): void => {
      configureTestText();
      for (let api = 18; api <= 26; api++) {
        ALL_FORMS.forEach((form: DeviceForm): void => {
          const evaluation = evaluateCapability(queryOf(api, form, SystemFlavor.OPEN_HARMONY));
          expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixRules_0007|RulesMatrix.test.ets|assert0023|assertEqual|actual', evaluation.verdict)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixRules_0007|RulesMatrix.test.ets|assert0023|assertEqual|expected', CapabilityVerdict.SUPPORTED));
          expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixRules_0007|RulesMatrix.test.ets|assert0024|assertTrue|actual|expected=true', canSetInApp(evaluation))).assertTrue();
        });
      }
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixRules_0007|RulesMatrix.test.ets|assert0025|assertTrue|actual|expected=true', canSetInApp(evaluateCapability(queryOf(26, DeviceForm.PHONE, SystemFlavor.OPEN_HARMONY))))).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_CAPABILITYMATRIXRULES_0800
     * @tc.name      testCapabilityMatrixRules0008
     * @tc.desc      Verify beyond verified api is unknown not supported
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testCapabilityMatrixRules0008', 0, (): void => {
      configureTestText();
      for (let api = 27; api <= 30; api++) {
        const evaluation = evaluateCapability(queryOf(api, DeviceForm.PHONE,
          SystemFlavor.OPEN_HARMONY));
        expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixRules_0008|RulesMatrix.test.ets|assert0026|assertEqual|actual', evaluation.verdict)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixRules_0008|RulesMatrix.test.ets|assert0026|assertEqual|expected', CapabilityVerdict.UNKNOWN));
        expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixRules_0008|RulesMatrix.test.ets|assert0027|assertFalse|actual|expected=false', canSetInApp(evaluation))).assertFalse();
        expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixRules_0008|RulesMatrix.test.ets|assert0028|assertFalse|actual|expected=false', isDefinitelyUnsupported(evaluation.verdict))).assertFalse();
      }
    });

    /**
     * @tc.number    SUB_STARTUP_CAPABILITYMATRIXRULES_0900
     * @tc.name      testCapabilityMatrixRules0009
     * @tc.desc      Verify matrix has no gap between api8 and26
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testCapabilityMatrixRules0009', 0, (): void => {
      configureTestText();
      let evaluated = 0;
      const realForms: DeviceForm[] = [DeviceForm.PHONE, DeviceForm.TABLET, DeviceForm.TV,
        DeviceForm.WEARABLE];
      for (let api = 8; api <= 26; api++) {
        realForms.forEach((form: DeviceForm): void => {
          ALL_FLAVORS.forEach((flavor: SystemFlavor): void => {
            const evaluation = evaluateCapability(queryOf(api, form, flavor));
            expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixRules_0009|RulesMatrix.test.ets|assert0029|assertTrue|actual|expected=true', evaluation.rule !== undefined)).assertTrue();
            evaluated++;
          });
        });
      }
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixRules_0009|RulesMatrix.test.ets|assert0030|assertEqual|actual', evaluated)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixRules_0009|RulesMatrix.test.ets|assert0030|assertEqual|expected', 19 * 4 * 3));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixRules_0009|RulesMatrix.test.ets|assert0031|assertTrue|actual|expected=true', evaluated > 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_CAPABILITYMATRIXRULES_1000
     * @tc.name      testCapabilityMatrixRules0010
     * @tc.desc      Verify unknown flavor is never assumed supported
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testCapabilityMatrixRules0010', 0, (): void => {
      configureTestText();
      for (let api = 9; api <= 13; api++) {
        const evaluation = evaluateCapability(queryOf(api, DeviceForm.PHONE, SystemFlavor.UNKNOWN));
        expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixRules_0010|RulesMatrix.test.ets|assert0032|assertEqual|actual', evaluation.verdict)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixRules_0010|RulesMatrix.test.ets|assert0032|assertEqual|expected', CapabilityVerdict.UNKNOWN));
        expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixRules_0010|RulesMatrix.test.ets|assert0033|assertFalse|actual|expected=false', canSetInApp(evaluation))).assertFalse();
        expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixRules_0010|RulesMatrix.test.ets|assert0034|assertFalse|actual|expected=false', isDefinitelyUnsupported(evaluation.verdict))).assertFalse();
      }
      const later = evaluateCapability(queryOf(18, DeviceForm.PHONE, SystemFlavor.UNKNOWN));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixRules_0010|RulesMatrix.test.ets|assert0035|assertEqual|actual', later.verdict)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixRules_0010|RulesMatrix.test.ets|assert0035|assertEqual|expected', CapabilityVerdict.SUPPORTED));
    });

    /**
     * @tc.number    SUB_STARTUP_CAPABILITYMATRIXRULES_1100
     * @tc.name      testCapabilityMatrixRules0011
     * @tc.desc      Verify rule ids are unique and ordered
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it('testCapabilityMatrixRules0011', 0, (): void => {
      configureTestText();
      const seen: string[] = [];
      let previousMax = -1;
      CAPABILITY_RULES.forEach((rule) => {
        expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixRules_0011|RulesMatrix.test.ets|assert0036|assertTrue|actual|expected=true', seen.indexOf(rule.ruleId) < 0)).assertTrue();
        seen.push(rule.ruleId);
        expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixRules_0011|RulesMatrix.test.ets|assert0037|assertTrue|actual|expected=true', rule.minApi >= previousMax || rule.minApi === 9)).assertTrue();
        expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixRules_0011|RulesMatrix.test.ets|assert0038|assertTrue|actual|expected=true', rule.maxApi >= rule.minApi)).assertTrue();
        expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixRules_0011|RulesMatrix.test.ets|assert0039|assertTrue|actual|expected=true', rule.developerHint.length > 0)).assertTrue();
        expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixRules_0011|RulesMatrix.test.ets|assert0040|assertTrue|actual|expected=true', rule.userHint.length > 0)).assertTrue();
        previousMax = rule.minApi;
      });
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixRules_0011|RulesMatrix.test.ets|assert0041|assertEqual|actual', seen.length)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixRules_0011|RulesMatrix.test.ets|assert0041|assertEqual|expected', CAPABILITY_RULES.length));
    });

    /**
     * @tc.number    SUB_STARTUP_CAPABILITYMATRIXRULES_1200
     * @tc.name      testCapabilityMatrixRules0012
     * @tc.desc      Verify summaries and verdict series cover full range
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testCapabilityMatrixRules0012', 0, (): void => {
      configureTestText();
      const summaries: string[] = ruleSummaries();
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixRules_0012|RulesMatrix.test.ets|assert0042|assertEqual|actual', summaries.length)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixRules_0012|RulesMatrix.test.ets|assert0042|assertEqual|expected', CAPABILITY_RULES.length));
      summaries.forEach((line: string): void => {
        expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixRules_0012|RulesMatrix.test.ets|assert0043|assertTrue|actual|expected=true', line.indexOf('API') >= 0)).assertTrue();
        expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixRules_0012|RulesMatrix.test.ets|assert0044|assertTrue|actual|expected=true', line.indexOf('：') > 0)).assertTrue();
      });
      const series = verdictSeries(DeviceForm.PHONE, SystemFlavor.OPEN_HARMONY, true, true);
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixRules_0012|RulesMatrix.test.ets|assert0045|assertEqual|actual', series.length)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixRules_0012|RulesMatrix.test.ets|assert0045|assertEqual|expected', 21));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixRules_0012|RulesMatrix.test.ets|assert0046|assertEqual|actual', series[0])).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixRules_0012|RulesMatrix.test.ets|assert0046|assertEqual|expected', CapabilityVerdict.NEED_SYSTEM_UPDATE));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixRules_0012|RulesMatrix.test.ets|assert0047|assertEqual|actual', series[26 - 8])).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixRules_0012|RulesMatrix.test.ets|assert0047|assertEqual|expected', CapabilityVerdict.SUPPORTED));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixRules_0012|RulesMatrix.test.ets|assert0048|assertEqual|actual', series[series.length - 1])).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixRules_0012|RulesMatrix.test.ets|assert0048|assertEqual|expected', CapabilityVerdict.UNKNOWN));
    });

    /**
     * @tc.number    SUB_STARTUP_CAPABILITYMATRIXRULES_1300
     * @tc.name      testCapabilityMatrixRules0013
     * @tc.desc      Verify query key and clone are stable
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testCapabilityMatrixRules0013', 0, (): void => {
      configureTestText();
      const query = queryOf(18, DeviceForm.PHONE, SystemFlavor.OPEN_HARMONY, true, true);
      const clone = query.clone();
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixRules_0013|RulesMatrix.test.ets|assert0049|assertEqual|actual', clone.key())).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixRules_0013|RulesMatrix.test.ets|assert0049|assertEqual|expected', query.key()));
      clone.apiLevel = 19;
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixRules_0013|RulesMatrix.test.ets|assert0050|assertFalse|actual|expected=false', clone.key() === query.key())).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixRules_0013|RulesMatrix.test.ets|assert0051|assertEqual|actual', query.apiLevel)).assertEqual(traceParameter('com.samples.appstartupauto_CapabilityMatrixRules_0013|RulesMatrix.test.ets|assert0051|assertEqual|expected', 18));
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixRules_0013|RulesMatrix.test.ets|assert0052|assertTrue|actual|expected=true', evaluateCapability(query).summary().indexOf('supported') >= 0)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixRules_0013|RulesMatrix.test.ets|assert0053|assertTrue|actual|expected=true', evaluateCapability(query).developerHint().length > 0)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_CapabilityMatrixRules_0013|RulesMatrix.test.ets|assert0054|assertTrue|actual|expected=true', evaluateCapability(query).userHint().length > 0)).assertTrue();
    });
  });

  describe('ErrorCatalogRules', (): void => {
    /**
     * @tc.number    SUB_STARTUP_ERRORCATALOGRULES_0100
     * @tc.name      testErrorCatalogRules0001
     * @tc.desc      Verify every catalog entry is complete
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it('testErrorCatalogRules0001', 0, (): void => {
      configureTestText();
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogRules_0001|RulesMatrix.test.ets|assert0055|assertTrue|actual|expected=true', ERROR_CATALOG.length > 10)).assertTrue();
      const codes: string[] = [];
      ERROR_CATALOG.forEach((entry: ErrorEntry): void => {
        expect(traceParameter('com.samples.appstartupauto_ErrorCatalogRules_0001|RulesMatrix.test.ets|assert0056|assertTrue|actual|expected=true', entry.code.length > 0)).assertTrue();
        expect(traceParameter('com.samples.appstartupauto_ErrorCatalogRules_0001|RulesMatrix.test.ets|assert0057|assertTrue|actual|expected=true', entry.name.length > 0)).assertTrue();
        expect(traceParameter('com.samples.appstartupauto_ErrorCatalogRules_0001|RulesMatrix.test.ets|assert0058|assertTrue|actual|expected=true', entry.message.length > 0)).assertTrue();
        expect(traceParameter('com.samples.appstartupauto_ErrorCatalogRules_0001|RulesMatrix.test.ets|assert0059|assertTrue|actual|expected=true', entry.hint.length > 0)).assertTrue();
        expect(traceParameter('com.samples.appstartupauto_ErrorCatalogRules_0001|RulesMatrix.test.ets|assert0060|assertTrue|actual|expected=true', codes.indexOf(entry.code) < 0)).assertTrue();
        codes.push(entry.code);
      });
    });

    /**
     * @tc.number    SUB_STARTUP_ERRORCATALOGRULES_0200
     * @tc.name      testErrorCatalogRules0002
     * @tc.desc      Verify lookup falls back to unknown without throwing
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testErrorCatalogRules0002', 0, (): void => {
      configureTestText();
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogRules_0002|RulesMatrix.test.ets|assert0061|assertEqual|actual', describeError('201').code)).assertEqual(traceParameter('com.samples.appstartupauto_ErrorCatalogRules_0002|RulesMatrix.test.ets|assert0061|assertEqual|expected', '201'));
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogRules_0002|RulesMatrix.test.ets|assert0062|assertEqual|actual', describeError(' 201 ').code)).assertEqual(traceParameter('com.samples.appstartupauto_ErrorCatalogRules_0002|RulesMatrix.test.ets|assert0062|assertEqual|expected', '201'));
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogRules_0002|RulesMatrix.test.ets|assert0063|assertEqual|actual', describeError('not-a-code').code)).assertEqual(traceParameter('com.samples.appstartupauto_ErrorCatalogRules_0002|RulesMatrix.test.ets|assert0063|assertEqual|expected', 'UNKNOWN'));
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogRules_0002|RulesMatrix.test.ets|assert0064|assertEqual|actual', describeError('').code)).assertEqual(traceParameter('com.samples.appstartupauto_ErrorCatalogRules_0002|RulesMatrix.test.ets|assert0064|assertEqual|expected', 'UNKNOWN'));
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogRules_0002|RulesMatrix.test.ets|assert0065|assertFalse|actual|expected=false', describeError('not-a-code').unsupported)).assertFalse();
    });

    /**
     * @tc.number    SUB_STARTUP_ERRORCATALOGRULES_0300
     * @tc.name      testErrorCatalogRules0003
     * @tc.desc      Verify unsupported and permission codes keep semantics
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testErrorCatalogRules0003', 0, (): void => {
      configureTestText();
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogRules_0003|RulesMatrix.test.ets|assert0066|assertTrue|actual|expected=true', isUnsupportedCode('801'))).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogRules_0003|RulesMatrix.test.ets|assert0067|assertFalse|actual|expected=false', isUnsupportedCode('201'))).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogRules_0003|RulesMatrix.test.ets|assert0068|assertTrue|actual|expected=true', needsSettingsForError('201'))).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogRules_0003|RulesMatrix.test.ets|assert0069|assertFalse|actual|expected=false', needsSettingsForError('801'))).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogRules_0003|RulesMatrix.test.ets|assert0070|assertTrue|actual|expected=true', allowsAutoRetry('16000050'))).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogRules_0003|RulesMatrix.test.ets|assert0071|assertFalse|actual|expected=false', allowsAutoRetry('801'))).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogRules_0003|RulesMatrix.test.ets|assert0072|assertTrue|actual|expected=true', requiresUserActionFirst('201'))).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogRules_0003|RulesMatrix.test.ets|assert0073|assertFalse|actual|expected=false', requiresUserActionFirst('0'))).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogRules_0003|RulesMatrix.test.ets|assert0074|assertTrue|actual|expected=true', logLineOf('801', 'probe').indexOf('801') >= 0)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogRules_0003|RulesMatrix.test.ets|assert0075|assertTrue|actual|expected=true', logLineOf('801', '').indexOf('｜') < 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_ERRORCATALOGRULES_0400
     * @tc.name      testErrorCatalogRules0004
     * @tc.desc      Verify tally separates unsupported failure and timeout
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testErrorCatalogRules0004', 0, (): void => {
      configureTestText();
      const tally = tallyCodes(['0', '', '801', '201', '16000050', 'TIMEOUT', 'weird', 'timeout']);
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogRules_0004|RulesMatrix.test.ets|assert0076|assertEqual|actual', tally.succeeded)).assertEqual(traceParameter('com.samples.appstartupauto_ErrorCatalogRules_0004|RulesMatrix.test.ets|assert0076|assertEqual|expected', 2));
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogRules_0004|RulesMatrix.test.ets|assert0077|assertEqual|actual', tally.unsupported)).assertEqual(traceParameter('com.samples.appstartupauto_ErrorCatalogRules_0004|RulesMatrix.test.ets|assert0077|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogRules_0004|RulesMatrix.test.ets|assert0078|assertEqual|actual', tally.failed)).assertEqual(traceParameter('com.samples.appstartupauto_ErrorCatalogRules_0004|RulesMatrix.test.ets|assert0078|assertEqual|expected', 2));
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogRules_0004|RulesMatrix.test.ets|assert0079|assertEqual|actual', tally.timeout)).assertEqual(traceParameter('com.samples.appstartupauto_ErrorCatalogRules_0004|RulesMatrix.test.ets|assert0079|assertEqual|expected', 2));
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogRules_0004|RulesMatrix.test.ets|assert0080|assertEqual|actual', tally.unknown)).assertEqual(traceParameter('com.samples.appstartupauto_ErrorCatalogRules_0004|RulesMatrix.test.ets|assert0080|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogRules_0004|RulesMatrix.test.ets|assert0081|assertEqual|actual', tally.total())).assertEqual(traceParameter('com.samples.appstartupauto_ErrorCatalogRules_0004|RulesMatrix.test.ets|assert0081|assertEqual|expected', 8));
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogRules_0004|RulesMatrix.test.ets|assert0082|assertTrue|actual|expected=true', tally.summary().indexOf('超时 2') >= 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_ERRORCATALOGRULES_0500
     * @tc.name      testErrorCatalogRules0005
     * @tc.desc      Verify group by owner buckets every owner
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testErrorCatalogRules0005', 0, (): void => {
      configureTestText();
      const grouped = groupByOwner(['201', '801', '16000050', 'TIMEOUT', '201']);
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogRules_0005|RulesMatrix.test.ets|assert0083|assertEqual|actual', grouped.get(ErrorOwner.USER)?.length)).assertEqual(traceParameter('com.samples.appstartupauto_ErrorCatalogRules_0005|RulesMatrix.test.ets|assert0083|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogRules_0005|RulesMatrix.test.ets|assert0084|assertEqual|actual', grouped.get(ErrorOwner.SYSTEM)?.length)).assertEqual(traceParameter('com.samples.appstartupauto_ErrorCatalogRules_0005|RulesMatrix.test.ets|assert0084|assertEqual|expected', 2));
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogRules_0005|RulesMatrix.test.ets|assert0085|assertEqual|actual', grouped.get(ErrorOwner.ENVIRONMENT)?.length)).assertEqual(traceParameter('com.samples.appstartupauto_ErrorCatalogRules_0005|RulesMatrix.test.ets|assert0085|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_ErrorCatalogRules_0005|RulesMatrix.test.ets|assert0086|assertEqual|actual', grouped.get(ErrorOwner.APP)?.length)).assertEqual(traceParameter('com.samples.appstartupauto_ErrorCatalogRules_0005|RulesMatrix.test.ets|assert0086|assertEqual|expected', 0));
    });
  });

  describe('RevisitRules', (): void => {
    /**
     * @tc.number    SUB_STARTUP_REVISITRULES_0100
     * @tc.name      testRevisitRules0001
     * @tc.desc      Verify full revisit produces comparison
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRevisitRules0001', 0, (): void => {
      configureTestText();
      const tracker = new RevisitTracker();
      const before = recordOf(1, 1000, '未开启', QueryOutcome.SUCCESS);
      const session: RevisitSession = tracker.begin(before, 2, 2000);
      expect(traceParameter('com.samples.appstartupauto_RevisitRules_0001|RulesMatrix.test.ets|assert0087|assertEqual|actual', session.stage)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitRules_0001|RulesMatrix.test.ets|assert0087|assertEqual|expected', RevisitStage.GUIDED));
      expect(traceParameter('com.samples.appstartupauto_RevisitRules_0001|RulesMatrix.test.ets|assert0088|assertEqual|actual', session.guidanceRevision)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitRules_0001|RulesMatrix.test.ets|assert0088|assertEqual|expected', 2));
      expect(traceParameter('com.samples.appstartupauto_RevisitRules_0001|RulesMatrix.test.ets|assert0089|assertFalse|actual|expected=false', tracker.canGuide())).assertFalse();
      tracker.markLeft(3000);
      expect(traceParameter('com.samples.appstartupauto_RevisitRules_0001|RulesMatrix.test.ets|assert0090|assertTrue|actual|expected=true', tracker.isWaiting())).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_RevisitRules_0001|RulesMatrix.test.ets|assert0091|assertEqual|actual', tracker.remainingMillis(3000))).assertEqual(traceParameter('com.samples.appstartupauto_RevisitRules_0001|RulesMatrix.test.ets|assert0091|assertEqual|expected', REVISIT_TIMEOUT_MS));
      tracker.markReturned(4000);
      const after = recordOf(2, 5000, '已开启', QueryOutcome.SUCCESS);
      const rechecked: RevisitSession = tracker.markRechecked(after, 6000);
      expect(traceParameter('com.samples.appstartupauto_RevisitRules_0001|RulesMatrix.test.ets|assert0092|assertEqual|actual', rechecked.stage)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitRules_0001|RulesMatrix.test.ets|assert0092|assertEqual|expected', RevisitStage.RECHECKED));
      expect(traceParameter('com.samples.appstartupauto_RevisitRules_0001|RulesMatrix.test.ets|assert0093|assertTrue|actual|expected=true', rechecked.conclusion.indexOf('状态已变化') >= 0)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_RevisitRules_0001|RulesMatrix.test.ets|assert0094|assertTrue|actual|expected=true', tracker.isCompleted())).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_RevisitRules_0001|RulesMatrix.test.ets|assert0095|assertTrue|actual|expected=true', tracker.conclusionText().indexOf('已开启') >= 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_REVISITRULES_0200
     * @tc.name      testRevisitRules0002
     * @tc.desc      Verify expiry after timeout
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRevisitRules0002', 0, (): void => {
      configureTestText();
      const tracker = new RevisitTracker();
      tracker.begin(recordOf(1, 1000, '已开启', QueryOutcome.SUCCESS), 1, 2000);
      tracker.markLeft(2000);
      const notYet = tracker.checkExpiry(2000 + REVISIT_TIMEOUT_MS - 1);
      expect(traceParameter('com.samples.appstartupauto_RevisitRules_0002|RulesMatrix.test.ets|assert0096|assertEqual|actual', notYet.stage)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitRules_0002|RulesMatrix.test.ets|assert0096|assertEqual|expected', RevisitStage.LEFT));
      const expired = tracker.checkExpiry(2000 + REVISIT_TIMEOUT_MS);
      expect(traceParameter('com.samples.appstartupauto_RevisitRules_0002|RulesMatrix.test.ets|assert0097|assertEqual|actual', expired.stage)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitRules_0002|RulesMatrix.test.ets|assert0097|assertEqual|expected', RevisitStage.EXPIRED));
      expect(traceParameter('com.samples.appstartupauto_RevisitRules_0002|RulesMatrix.test.ets|assert0098|assertTrue|actual|expected=true', expired.conclusion.indexOf('10 分钟') >= 0)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_RevisitRules_0002|RulesMatrix.test.ets|assert0099|assertFalse|actual|expected=false', tracker.isCompleted())).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_RevisitRules_0002|RulesMatrix.test.ets|assert0100|assertTrue|actual|expected=true', tracker.canGuide())).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_RevisitRules_0002|RulesMatrix.test.ets|assert0101|assertEqual|actual', tracker.remainingMillis(9999))).assertEqual(traceParameter('com.samples.appstartupauto_RevisitRules_0002|RulesMatrix.test.ets|assert0101|assertEqual|expected', -1));
    });

    /**
     * @tc.number    SUB_STARTUP_REVISITRULES_0300
     * @tc.name      testRevisitRules0003
     * @tc.desc      Verify cancel skips comparison
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRevisitRules0003', 0, (): void => {
      configureTestText();
      const tracker = new RevisitTracker();
      tracker.begin(recordOf(1, 1000, '未开启', QueryOutcome.SUCCESS), 1, 2000);
      const cancelled = tracker.cancel(2500);
      expect(traceParameter('com.samples.appstartupauto_RevisitRules_0003|RulesMatrix.test.ets|assert0102|assertEqual|actual', cancelled.stage)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitRules_0003|RulesMatrix.test.ets|assert0102|assertEqual|expected', RevisitStage.CANCELLED));
      expect(traceParameter('com.samples.appstartupauto_RevisitRules_0003|RulesMatrix.test.ets|assert0103|assertTrue|actual|expected=true', cancelled.cancelled)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_RevisitRules_0003|RulesMatrix.test.ets|assert0104|assertEqual|actual', cancelled.conclusion)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitRules_0003|RulesMatrix.test.ets|assert0104|assertEqual|expected', '用户取消，未做判断'));
      expect(traceParameter('com.samples.appstartupauto_RevisitRules_0003|RulesMatrix.test.ets|assert0105|assertFalse|actual|expected=false', tracker.isCompleted())).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_RevisitRules_0003|RulesMatrix.test.ets|assert0106|assertEqual|actual', tracker.sourceForRecord())).assertEqual(traceParameter('com.samples.appstartupauto_RevisitRules_0003|RulesMatrix.test.ets|assert0106|assertEqual|expected', RefreshSource.SETTINGS));
    });

    /**
     * @tc.number    SUB_STARTUP_REVISITRULES_0400
     * @tc.name      testRevisitRules0004
     * @tc.desc      Verify invalid order does not advance
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRevisitRules0004', 0, (): void => {
      configureTestText();
      const tracker = new RevisitTracker();
      tracker.begin(undefined, 1, 2000);
      const returned = tracker.markReturned(3000);
      expect(traceParameter('com.samples.appstartupauto_RevisitRules_0004|RulesMatrix.test.ets|assert0107|assertEqual|actual', returned.stage)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitRules_0004|RulesMatrix.test.ets|assert0107|assertEqual|expected', RevisitStage.GUIDED));
      expect(traceParameter('com.samples.appstartupauto_RevisitRules_0004|RulesMatrix.test.ets|assert0108|assertTrue|actual|expected=true', tracker.notice().indexOf('不接受返回事件') >= 0)).assertTrue();
      tracker.markLeft(4000);
      const leftAgain = tracker.markLeft(5000);
      expect(traceParameter('com.samples.appstartupauto_RevisitRules_0004|RulesMatrix.test.ets|assert0109|assertEqual|actual', leftAgain.leftAt)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitRules_0004|RulesMatrix.test.ets|assert0109|assertEqual|expected', 4000));
    });

    /**
     * @tc.number    SUB_STARTUP_REVISITRULES_0500
     * @tc.name      testRevisitRules0005
     * @tc.desc      Verify comparison refuses non success samples
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRevisitRules0005', 0, (): void => {
      configureTestText();
      const failed = recordOf(1, 1000, '未获取', QueryOutcome.FAILURE);
      const unsupported = recordOf(2, 2000, '', QueryOutcome.UNSUPPORTED);
      expect(traceParameter('com.samples.appstartupauto_RevisitRules_0005|RulesMatrix.test.ets|assert0110|assertFalse|actual|expected=false', isComparableRecord(undefined))).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_RevisitRules_0005|RulesMatrix.test.ets|assert0111|assertFalse|actual|expected=false', isComparableRecord(failed))).assertFalse();
      const missingBefore: RevisitComparison = compareSamples(undefined, unsupported);
      expect(traceParameter('com.samples.appstartupauto_RevisitRules_0005|RulesMatrix.test.ets|assert0112|assertFalse|actual|expected=false', missingBefore.comparable)).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_RevisitRules_0005|RulesMatrix.test.ets|assert0113|assertEqual|actual', missingBefore.reason)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitRules_0005|RulesMatrix.test.ets|assert0113|assertEqual|expected', '缺少离开前样本'));
      const bothBad = compareSamples(failed, unsupported);
      expect(traceParameter('com.samples.appstartupauto_RevisitRules_0005|RulesMatrix.test.ets|assert0114|assertFalse|actual|expected=false', bothBad.comparable)).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_RevisitRules_0005|RulesMatrix.test.ets|assert0115|assertTrue|actual|expected=true', bothBad.reason.indexOf('不可比') >= 0)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_RevisitRules_0005|RulesMatrix.test.ets|assert0116|assertTrue|actual|expected=true', bothBad.summary().indexOf('无法比较') === 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_REVISITRULES_0600
     * @tc.name      testRevisitRules0006
     * @tc.desc      Verify unchanged state is reported as unchanged
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testRevisitRules0006', 0, (): void => {
      configureTestText();
      const before = recordOf(1, 1000, '已开启', QueryOutcome.SUCCESS);
      const after = recordOf(2, 4000, '已开启', QueryOutcome.SUCCESS);
      const comparison = compareSamples(before, after);
      expect(traceParameter('com.samples.appstartupauto_RevisitRules_0006|RulesMatrix.test.ets|assert0117|assertTrue|actual|expected=true', comparison.comparable)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_RevisitRules_0006|RulesMatrix.test.ets|assert0118|assertFalse|actual|expected=false', comparison.changed)).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_RevisitRules_0006|RulesMatrix.test.ets|assert0119|assertEqual|actual', comparison.elapsed)).assertEqual(traceParameter('com.samples.appstartupauto_RevisitRules_0006|RulesMatrix.test.ets|assert0119|assertEqual|expected', 3000));
      expect(traceParameter('com.samples.appstartupauto_RevisitRules_0006|RulesMatrix.test.ets|assert0120|assertTrue|actual|expected=true', comparison.summary().indexOf('状态未变化') >= 0)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_RevisitRules_0006|RulesMatrix.test.ets|assert0121|assertEqual|actual', valueText(null))).assertEqual(traceParameter('com.samples.appstartupauto_RevisitRules_0006|RulesMatrix.test.ets|assert0121|assertEqual|expected', '未获取'));
      expect(traceParameter('com.samples.appstartupauto_RevisitRules_0006|RulesMatrix.test.ets|assert0122|assertEqual|actual', valueText(true))).assertEqual(traceParameter('com.samples.appstartupauto_RevisitRules_0006|RulesMatrix.test.ets|assert0122|assertEqual|expected', '已开启'));
      expect(traceParameter('com.samples.appstartupauto_RevisitRules_0006|RulesMatrix.test.ets|assert0123|assertEqual|actual', valueText(false))).assertEqual(traceParameter('com.samples.appstartupauto_RevisitRules_0006|RulesMatrix.test.ets|assert0123|assertEqual|expected', '未开启'));
    });
  });

  describe('DiagnosticToolRules', (): void => {
    /**
     * @tc.number    SUB_STARTUP_DIAGNOSTICTOOLRULES_0100
     * @tc.name      testDiagnosticToolRules0001
     * @tc.desc      Verify clip and compact keep bounds
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDiagnosticToolRules0001', 0, (): void => {
      configureTestText();
      expect(traceParameter('com.samples.appstartupauto_DiagnosticToolRules_0001|RulesMatrix.test.ets|assert0124|assertEqual|actual', clip('abc').length)).assertEqual(traceParameter('com.samples.appstartupauto_DiagnosticToolRules_0001|RulesMatrix.test.ets|assert0124|assertEqual|expected', 3));
      const long: string = 'x'.repeat(600);
      expect(traceParameter('com.samples.appstartupauto_DiagnosticToolRules_0001|RulesMatrix.test.ets|assert0125|assertEqual|actual', clip(long).length)).assertEqual(traceParameter('com.samples.appstartupauto_DiagnosticToolRules_0001|RulesMatrix.test.ets|assert0125|assertEqual|expected', 512));
      expect(traceParameter('com.samples.appstartupauto_DiagnosticToolRules_0001|RulesMatrix.test.ets|assert0126|assertTrue|actual|expected=true', clip(long).endsWith('…'))).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_DiagnosticToolRules_0001|RulesMatrix.test.ets|assert0127|assertEqual|actual', clip('a\r\nb').indexOf('\r'))).assertEqual(traceParameter('com.samples.appstartupauto_DiagnosticToolRules_0001|RulesMatrix.test.ets|assert0127|assertEqual|expected', -1));
      expect(traceParameter('com.samples.appstartupauto_DiagnosticToolRules_0001|RulesMatrix.test.ets|assert0128|assertEqual|actual', compact('  a   b  '))).assertEqual(traceParameter('com.samples.appstartupauto_DiagnosticToolRules_0001|RulesMatrix.test.ets|assert0128|assertEqual|expected', 'a b'));
      expect(traceParameter('com.samples.appstartupauto_DiagnosticToolRules_0001|RulesMatrix.test.ets|assert0129|assertTrue|actual|expected=true', isBlank('   '))).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_DiagnosticToolRules_0001|RulesMatrix.test.ets|assert0130|assertFalse|actual|expected=false', isBlank('a'))).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_DiagnosticToolRules_0001|RulesMatrix.test.ets|assert0131|assertEqual|actual', durationText(500))).assertEqual(traceParameter('com.samples.appstartupauto_DiagnosticToolRules_0001|RulesMatrix.test.ets|assert0131|assertEqual|expected', '500 ms'));
      expect(traceParameter('com.samples.appstartupauto_DiagnosticToolRules_0001|RulesMatrix.test.ets|assert0132|assertEqual|actual', durationText(1500))).assertEqual(traceParameter('com.samples.appstartupauto_DiagnosticToolRules_0001|RulesMatrix.test.ets|assert0132|assertEqual|expected', '1.50 s'));
      expect(traceParameter('com.samples.appstartupauto_DiagnosticToolRules_0001|RulesMatrix.test.ets|assert0133|assertEqual|actual', durationText(-1))).assertEqual(traceParameter('com.samples.appstartupauto_DiagnosticToolRules_0001|RulesMatrix.test.ets|assert0133|assertEqual|expected', '未知耗时'));
    });

    /**
     * @tc.number    SUB_STARTUP_DIAGNOSTICTOOLRULES_0200
     * @tc.name      testDiagnosticToolRules0002
     * @tc.desc      Verify time formatting handles invalid input
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDiagnosticToolRules0002', 0, (): void => {
      configureTestText();
      expect(traceParameter('com.samples.appstartupauto_DiagnosticToolRules_0002|RulesMatrix.test.ets|assert0134|assertEqual|actual', clockText(0))).assertEqual(traceParameter('com.samples.appstartupauto_DiagnosticToolRules_0002|RulesMatrix.test.ets|assert0134|assertEqual|expected', '--:--:--'));
      expect(traceParameter('com.samples.appstartupauto_DiagnosticToolRules_0002|RulesMatrix.test.ets|assert0135|assertEqual|actual', clockText(Number.NaN))).assertEqual(traceParameter('com.samples.appstartupauto_DiagnosticToolRules_0002|RulesMatrix.test.ets|assert0135|assertEqual|expected', '--:--:--'));
      expect(traceParameter('com.samples.appstartupauto_DiagnosticToolRules_0002|RulesMatrix.test.ets|assert0136|assertEqual|actual', dateTimeText(0))).assertEqual(traceParameter('com.samples.appstartupauto_DiagnosticToolRules_0002|RulesMatrix.test.ets|assert0136|assertEqual|expected', '未知时间'));
      const fixed: number = new Date(2026, 0, 2, 3, 4, 5).getTime();
      expect(traceParameter('com.samples.appstartupauto_DiagnosticToolRules_0002|RulesMatrix.test.ets|assert0137|assertEqual|actual', clockText(fixed))).assertEqual(traceParameter('com.samples.appstartupauto_DiagnosticToolRules_0002|RulesMatrix.test.ets|assert0137|assertEqual|expected', '03:04:05'));
      expect(traceParameter('com.samples.appstartupauto_DiagnosticToolRules_0002|RulesMatrix.test.ets|assert0138|assertEqual|actual', dateTimeText(fixed))).assertEqual(traceParameter('com.samples.appstartupauto_DiagnosticToolRules_0002|RulesMatrix.test.ets|assert0138|assertEqual|expected', '01-02 03:04:05'));
      expect(traceParameter('com.samples.appstartupauto_DiagnosticToolRules_0002|RulesMatrix.test.ets|assert0139|assertEqual|actual', elapsedSince(100, 50))).assertEqual(traceParameter('com.samples.appstartupauto_DiagnosticToolRules_0002|RulesMatrix.test.ets|assert0139|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_DiagnosticToolRules_0002|RulesMatrix.test.ets|assert0140|assertEqual|actual', elapsedSince(100, 160))).assertEqual(traceParameter('com.samples.appstartupauto_DiagnosticToolRules_0002|RulesMatrix.test.ets|assert0140|assertEqual|expected', 60));
      expect(traceParameter('com.samples.appstartupauto_DiagnosticToolRules_0002|RulesMatrix.test.ets|assert0141|assertEqual|actual', ratioPercent(1, 3))).assertEqual(traceParameter('com.samples.appstartupauto_DiagnosticToolRules_0002|RulesMatrix.test.ets|assert0141|assertEqual|expected', 33.3));
      expect(traceParameter('com.samples.appstartupauto_DiagnosticToolRules_0002|RulesMatrix.test.ets|assert0142|assertEqual|actual', ratioPercent(1, 0))).assertEqual(traceParameter('com.samples.appstartupauto_DiagnosticToolRules_0002|RulesMatrix.test.ets|assert0142|assertEqual|expected', 0));
    });

    /**
     * @tc.number    SUB_STARTUP_DIAGNOSTICTOOLRULES_0300
     * @tc.name      testDiagnosticToolRules0003
     * @tc.desc      Verify masking covers sensitive keys
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDiagnosticToolRules0003', 0, (): void => {
      configureTestText();
      expect(traceParameter('com.samples.appstartupauto_DiagnosticToolRules_0003|RulesMatrix.test.ets|assert0143|assertEqual|actual', maskToken(''))).assertEqual(traceParameter('com.samples.appstartupauto_DiagnosticToolRules_0003|RulesMatrix.test.ets|assert0143|assertEqual|expected', ''));
      expect(traceParameter('com.samples.appstartupauto_DiagnosticToolRules_0003|RulesMatrix.test.ets|assert0144|assertEqual|actual', maskToken('abc'))).assertEqual(traceParameter('com.samples.appstartupauto_DiagnosticToolRules_0003|RulesMatrix.test.ets|assert0144|assertEqual|expected', '***'));
      const masked: string = maskToken('abcdefgh');
      expect(traceParameter('com.samples.appstartupauto_DiagnosticToolRules_0003|RulesMatrix.test.ets|assert0145|assertTrue|actual|expected=true', masked.startsWith('ab'))).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_DiagnosticToolRules_0003|RulesMatrix.test.ets|assert0146|assertTrue|actual|expected=true', masked.endsWith('gh'))).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_DiagnosticToolRules_0003|RulesMatrix.test.ets|assert0147|assertEqual|actual', masked.indexOf('cd'))).assertEqual(traceParameter('com.samples.appstartupauto_DiagnosticToolRules_0003|RulesMatrix.test.ets|assert0147|assertEqual|expected', -1));
      expect(traceParameter('com.samples.appstartupauto_DiagnosticToolRules_0003|RulesMatrix.test.ets|assert0148|assertTrue|actual|expected=true', SENSITIVE_KEYS.length > 5)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_DiagnosticToolRules_0003|RulesMatrix.test.ets|assert0149|assertTrue|actual|expected=true', isSensitiveKey('DEVICE_ID'))).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_DiagnosticToolRules_0003|RulesMatrix.test.ets|assert0150|assertTrue|actual|expected=true', isSensitiveKey('userToken'))).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_DiagnosticToolRules_0003|RulesMatrix.test.ets|assert0151|assertFalse|actual|expected=false', isSensitiveKey('count'))).assertFalse();
    });

    /**
     * @tc.number    SUB_STARTUP_DIAGNOSTICTOOLRULES_0400
     * @tc.name      testDiagnosticToolRules0004
     * @tc.desc      Verify labels and validators match enums
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDiagnosticToolRules0004', 0, (): void => {
      configureTestText();
      expect(traceParameter('com.samples.appstartupauto_DiagnosticToolRules_0004|RulesMatrix.test.ets|assert0152|assertEqual|actual', outcomeLabel(QueryOutcome.SUCCESS))).assertEqual(traceParameter('com.samples.appstartupauto_DiagnosticToolRules_0004|RulesMatrix.test.ets|assert0152|assertEqual|expected', '成功'));
      expect(traceParameter('com.samples.appstartupauto_DiagnosticToolRules_0004|RulesMatrix.test.ets|assert0153|assertEqual|actual', outcomeLabel(QueryOutcome.FAILURE))).assertEqual(traceParameter('com.samples.appstartupauto_DiagnosticToolRules_0004|RulesMatrix.test.ets|assert0153|assertEqual|expected', '失败'));
      expect(traceParameter('com.samples.appstartupauto_DiagnosticToolRules_0004|RulesMatrix.test.ets|assert0154|assertEqual|actual', outcomeLabel(QueryOutcome.UNSUPPORTED))).assertEqual(traceParameter('com.samples.appstartupauto_DiagnosticToolRules_0004|RulesMatrix.test.ets|assert0154|assertEqual|expected', '不支持'));
      expect(traceParameter('com.samples.appstartupauto_DiagnosticToolRules_0004|RulesMatrix.test.ets|assert0155|assertEqual|actual', outcomeLabel(QueryOutcome.TIMEOUT))).assertEqual(traceParameter('com.samples.appstartupauto_DiagnosticToolRules_0004|RulesMatrix.test.ets|assert0155|assertEqual|expected', '超时'));
      expect(traceParameter('com.samples.appstartupauto_DiagnosticToolRules_0004|RulesMatrix.test.ets|assert0156|assertEqual|actual', outcomeLabel(QueryOutcome.UNKNOWN))).assertEqual(traceParameter('com.samples.appstartupauto_DiagnosticToolRules_0004|RulesMatrix.test.ets|assert0156|assertEqual|expected', '未知'));
      expect(traceParameter('com.samples.appstartupauto_DiagnosticToolRules_0004|RulesMatrix.test.ets|assert0157|assertEqual|actual', sourceLabel(RefreshSource.SETTINGS))).assertEqual(traceParameter('com.samples.appstartupauto_DiagnosticToolRules_0004|RulesMatrix.test.ets|assert0157|assertEqual|expected', '设置后查询'));
      expect(traceParameter('com.samples.appstartupauto_DiagnosticToolRules_0004|RulesMatrix.test.ets|assert0158|assertEqual|actual', sourceLabel(RefreshSource.FOREGROUND))).assertEqual(traceParameter('com.samples.appstartupauto_DiagnosticToolRules_0004|RulesMatrix.test.ets|assert0158|assertEqual|expected', '返回前台'));
      expect(traceParameter('com.samples.appstartupauto_DiagnosticToolRules_0004|RulesMatrix.test.ets|assert0159|assertTrue|actual|expected=true', isKnownOutcome('success'))).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_DiagnosticToolRules_0004|RulesMatrix.test.ets|assert0160|assertFalse|actual|expected=false', isKnownOutcome('done'))).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_DiagnosticToolRules_0004|RulesMatrix.test.ets|assert0161|assertTrue|actual|expected=true', isKnownSource('设置后查询'))).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_DiagnosticToolRules_0004|RulesMatrix.test.ets|assert0162|assertFalse|actual|expected=false', isKnownSource('unknown'))).assertFalse();
    });

    /**
     * @tc.number    SUB_STARTUP_DIAGNOSTICTOOLRULES_0500
     * @tc.name      testDiagnosticToolRules0005
     * @tc.desc      Verify export selects valid rows and escapes
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDiagnosticToolRules0005', 0, (): void => {
      configureTestText();
      const rows: QueryRecord[] = [];
      for (let index = 1; index <= 210; index++) {
        rows.push(recordOf(index, 1000 + index, index % 2 === 0 ? '已开启' : '未开启',
          QueryOutcome.SUCCESS));
      }
      expect(traceParameter('com.samples.appstartupauto_DiagnosticToolRules_0005|RulesMatrix.test.ets|assert0163|assertEqual|actual', selectForExport(rows).length)).assertEqual(traceParameter('com.samples.appstartupauto_DiagnosticToolRules_0005|RulesMatrix.test.ets|assert0163|assertEqual|expected', EXPORT_ROW_LIMIT));
      expect(traceParameter('com.samples.appstartupauto_DiagnosticToolRules_0005|RulesMatrix.test.ets|assert0164|assertEqual|actual', latestRecords(rows, 3).length)).assertEqual(traceParameter('com.samples.appstartupauto_DiagnosticToolRules_0005|RulesMatrix.test.ets|assert0164|assertEqual|expected', 3));
      expect(traceParameter('com.samples.appstartupauto_DiagnosticToolRules_0005|RulesMatrix.test.ets|assert0165|assertEqual|actual', latestRecords(rows, 0).length)).assertEqual(traceParameter('com.samples.appstartupauto_DiagnosticToolRules_0005|RulesMatrix.test.ets|assert0165|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_DiagnosticToolRules_0005|RulesMatrix.test.ets|assert0166|assertTrue|actual|expected=true', exportable(rows[0]))).assertTrue();
      const broken = new QueryRecord();
      expect(traceParameter('com.samples.appstartupauto_DiagnosticToolRules_0005|RulesMatrix.test.ets|assert0167|assertFalse|actual|expected=false', exportable(broken))).assertFalse();
      const csv: string = toCsv(rows);
      expect(traceParameter('com.samples.appstartupauto_DiagnosticToolRules_0005|RulesMatrix.test.ets|assert0168|assertEqual|actual', csv.split('\n').length)).assertEqual(traceParameter('com.samples.appstartupauto_DiagnosticToolRules_0005|RulesMatrix.test.ets|assert0168|assertEqual|expected', EXPORT_ROW_LIMIT + 1));
      expect(traceParameter('com.samples.appstartupauto_DiagnosticToolRules_0005|RulesMatrix.test.ets|assert0169|assertTrue|actual|expected=true', csv.startsWith('id,时间'))).assertTrue();
      const markdown: string = toMarkdown(rows);
      expect(traceParameter('com.samples.appstartupauto_DiagnosticToolRules_0005|RulesMatrix.test.ets|assert0170|assertEqual|actual', markdown.split('\n').length)).assertEqual(traceParameter('com.samples.appstartupauto_DiagnosticToolRules_0005|RulesMatrix.test.ets|assert0170|assertEqual|expected', EXPORT_ROW_LIMIT + 2));
      expect(traceParameter('com.samples.appstartupauto_DiagnosticToolRules_0005|RulesMatrix.test.ets|assert0171|assertTrue|actual|expected=true', markdown.indexOf('|---') >= 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_DIAGNOSTICTOOLRULES_0600
     * @tc.name      testDiagnosticToolRules0006
     * @tc.desc      Verify outcome counts are exhaustive
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDiagnosticToolRules0006', 0, (): void => {
      configureTestText();
      const rows: QueryRecord[] = [
        recordOf(1, 10, 'a', QueryOutcome.SUCCESS),
        recordOf(2, 20, 'b', QueryOutcome.SUCCESS),
        recordOf(3, 30, 'c', QueryOutcome.FAILURE),
        recordOf(4, 40, 'd', QueryOutcome.TIMEOUT)
      ];
      const counts = countByOutcome(rows);
      expect(traceParameter('com.samples.appstartupauto_DiagnosticToolRules_0006|RulesMatrix.test.ets|assert0172|assertEqual|actual', counts.get(QueryOutcome.SUCCESS))).assertEqual(traceParameter('com.samples.appstartupauto_DiagnosticToolRules_0006|RulesMatrix.test.ets|assert0172|assertEqual|expected', 2));
      expect(traceParameter('com.samples.appstartupauto_DiagnosticToolRules_0006|RulesMatrix.test.ets|assert0173|assertEqual|actual', counts.get(QueryOutcome.FAILURE))).assertEqual(traceParameter('com.samples.appstartupauto_DiagnosticToolRules_0006|RulesMatrix.test.ets|assert0173|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_DiagnosticToolRules_0006|RulesMatrix.test.ets|assert0174|assertEqual|actual', counts.get(QueryOutcome.TIMEOUT))).assertEqual(traceParameter('com.samples.appstartupauto_DiagnosticToolRules_0006|RulesMatrix.test.ets|assert0174|assertEqual|expected', 1));
      let total = 0;
      counts.forEach((value: number): void => {
        total += value;
      });
      expect(traceParameter('com.samples.appstartupauto_DiagnosticToolRules_0006|RulesMatrix.test.ets|assert0175|assertEqual|actual', total)).assertEqual(traceParameter('com.samples.appstartupauto_DiagnosticToolRules_0006|RulesMatrix.test.ets|assert0175|assertEqual|expected', rows.length));
    });
  });
}
