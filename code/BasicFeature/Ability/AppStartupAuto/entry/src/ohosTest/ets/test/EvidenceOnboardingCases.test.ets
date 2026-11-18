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

import { describe, expect } from '@ohos/hypium';
import { traceParameter, loggedIt as it } from '../support/TestLog';
import { configureTestText } from '../support/TestTextResources';
import {
  CHAIN_RULES, Conclusion, EVIDENCE_CATALOG, EvidenceKind, auditChains, bestChain, chainIds,
  chainLines, chainsOf, conclusionLabel, evaluateChain, evidenceIds, evidenceLines, evidenceOf,
  evidencesOfKind, feasibleCounts, kindLabel, kindLines
} from '../../../main/ets/autostart/diagnostics/EvidenceChain';
import {
  ONBOARDING_STEPS, OnboardingFlow, OnboardingGroup, StepStatus, auditOnboarding,
  groupLabel, groupProgressLines, mandatorySteps, settled, skippableSteps, statusLabel, stepIds,
  stepLines, stepOf, stepsOfGroup, totalSeconds
} from '../../../main/ets/autostart/guide/OnboardingFlow';

export default function evidenceOnboardingCasesTest(): void {
  configureTestText();
  describe('EvidenceChainCases', (): void => {
    /**
     * @tc.number    SUB_STARTUP_EVIDENCECHAINCASES_0100
     * @tc.name      testEvidenceChainCases0001
     * @tc.desc      Verify catalog and chain are consistent
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it('testEvidenceChainCases0001', 0, (): void => {
      configureTestText();
      expect(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0001|EvidenceOnboardingCases.test.ets|assert0001|assertEqual|actual', EVIDENCE_CATALOG.length)).assertEqual(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0001|EvidenceOnboardingCases.test.ets|assert0001|assertEqual|expected', 20));
      expect(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0001|EvidenceOnboardingCases.test.ets|assert0002|assertEqual|actual', CHAIN_RULES.length)).assertEqual(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0001|EvidenceOnboardingCases.test.ets|assert0002|assertEqual|expected', 18));
      expect(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0001|EvidenceOnboardingCases.test.ets|assert0003|assertEqual|actual', evidenceIds().length)).assertEqual(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0001|EvidenceOnboardingCases.test.ets|assert0003|assertEqual|expected', 20));
      expect(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0001|EvidenceOnboardingCases.test.ets|assert0004|assertEqual|actual', chainIds().length)).assertEqual(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0001|EvidenceOnboardingCases.test.ets|assert0004|assertEqual|expected', 18));
      expect(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0001|EvidenceOnboardingCases.test.ets|assert0005|assertEqual|actual', evidenceLines().length)).assertEqual(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0001|EvidenceOnboardingCases.test.ets|assert0005|assertEqual|expected', 20));
      expect(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0001|EvidenceOnboardingCases.test.ets|assert0006|assertEqual|actual', chainLines().length)).assertEqual(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0001|EvidenceOnboardingCases.test.ets|assert0006|assertEqual|expected', 18));
      const audit = auditChains();
      expect(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0001|EvidenceOnboardingCases.test.ets|assert0007|assertEqual|actual', audit.findings.length)).assertEqual(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0001|EvidenceOnboardingCases.test.ets|assert0007|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0001|EvidenceOnboardingCases.test.ets|assert0008|assertTrue|actual|expected=true', audit.ok)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0001|EvidenceOnboardingCases.test.ets|assert0009|assertEqual|actual', audit.summary())).assertEqual(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0001|EvidenceOnboardingCases.test.ets|assert0009|assertEqual|expected', '证据链自洽'));
      EVIDENCE_CATALOG.forEach((item): void => {
        expect(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0001|EvidenceOnboardingCases.test.ets|assert0010|assertTrue|actual|expected=true', item.label.length > 0)).assertTrue();
        expect(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0001|EvidenceOnboardingCases.test.ets|assert0011|assertTrue|actual|expected=true', item.weight > 0)).assertTrue();
        expect(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0001|EvidenceOnboardingCases.test.ets|assert0012|assertTrue|actual|expected=true', item.text().indexOf(item.evidenceId) === 0)).assertTrue();
      });
      expect(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0001|EvidenceOnboardingCases.test.ets|assert0013|assertEqual|actual', evidenceOf('EV-99'))).assertEqual(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0001|EvidenceOnboardingCases.test.ets|assert0013|assertEqual|expected', undefined));
    });

    /**
     * @tc.number    SUB_STARTUP_EVIDENCECHAINCASES_0200
     * @tc.name      testEvidenceChainCases0002
     * @tc.desc      Verify kind distribution and labels
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testEvidenceChainCases0002', 0, (): void => {
      configureTestText();
      expect(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0002|EvidenceOnboardingCases.test.ets|assert0014|assertEqual|actual', evidencesOfKind(EvidenceKind.CAPABILITY_RULE).length)).assertEqual(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0002|EvidenceOnboardingCases.test.ets|assert0014|assertEqual|expected', 3));
      expect(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0002|EvidenceOnboardingCases.test.ets|assert0015|assertEqual|actual', evidencesOfKind(EvidenceKind.ERROR_CODE).length)).assertEqual(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0002|EvidenceOnboardingCases.test.ets|assert0015|assertEqual|expected', 4));
      expect(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0002|EvidenceOnboardingCases.test.ets|assert0016|assertEqual|actual', evidencesOfKind(EvidenceKind.HISTORY_SAMPLE).length)).assertEqual(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0002|EvidenceOnboardingCases.test.ets|assert0016|assertEqual|expected', 3));
      expect(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0002|EvidenceOnboardingCases.test.ets|assert0017|assertEqual|actual', evidencesOfKind(EvidenceKind.DEVICE_INFO).length)).assertEqual(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0002|EvidenceOnboardingCases.test.ets|assert0017|assertEqual|expected', 3));
      expect(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0002|EvidenceOnboardingCases.test.ets|assert0018|assertEqual|actual', evidencesOfKind(EvidenceKind.SCHEMA_AUDIT).length)).assertEqual(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0002|EvidenceOnboardingCases.test.ets|assert0018|assertEqual|expected', 2));
      expect(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0002|EvidenceOnboardingCases.test.ets|assert0019|assertEqual|actual', evidencesOfKind(EvidenceKind.SLO_RESULT).length)).assertEqual(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0002|EvidenceOnboardingCases.test.ets|assert0019|assertEqual|expected', 2));
      expect(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0002|EvidenceOnboardingCases.test.ets|assert0020|assertEqual|actual', evidencesOfKind(EvidenceKind.USER_ACTION).length)).assertEqual(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0002|EvidenceOnboardingCases.test.ets|assert0020|assertEqual|expected', 3));
      expect(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0002|EvidenceOnboardingCases.test.ets|assert0021|assertEqual|actual', kindLines().length)).assertEqual(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0002|EvidenceOnboardingCases.test.ets|assert0021|assertEqual|expected', 7));
      expect(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0002|EvidenceOnboardingCases.test.ets|assert0022|assertEqual|actual', kindLabel(EvidenceKind.ERROR_CODE))).assertEqual(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0002|EvidenceOnboardingCases.test.ets|assert0022|assertEqual|expected', '错误码'));
      expect(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0002|EvidenceOnboardingCases.test.ets|assert0023|assertEqual|actual', conclusionLabel(Conclusion.NEED_PERMISSION))).assertEqual(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0002|EvidenceOnboardingCases.test.ets|assert0023|assertEqual|expected', '需要授权'));
      expect(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0002|EvidenceOnboardingCases.test.ets|assert0024|assertEqual|actual', chainsOf(Conclusion.SUPPORTED).length)).assertEqual(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0002|EvidenceOnboardingCases.test.ets|assert0024|assertEqual|expected', 4));
      expect(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0002|EvidenceOnboardingCases.test.ets|assert0025|assertEqual|actual', chainsOf(Conclusion.UNSUPPORTED).length)).assertEqual(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0002|EvidenceOnboardingCases.test.ets|assert0025|assertEqual|expected', 4));
      expect(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0002|EvidenceOnboardingCases.test.ets|assert0026|assertEqual|actual', chainsOf(Conclusion.TIMEOUT).length)).assertEqual(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0002|EvidenceOnboardingCases.test.ets|assert0026|assertEqual|expected', 1));
    });

    /**
     * @tc.number    SUB_STARTUP_EVIDENCECHAINCASES_0300
     * @tc.name      testEvidenceChainCases0003
     * @tc.desc      Verify chain establishes only with required evidence
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testEvidenceChainCases0003', 0, (): void => {
      configureTestText();
      const rule = CHAIN_RULES[0];
      const complete = evaluateChain(rule, ['EV-01', 'EV-10', 'EV-11', 'EV-07']);
      expect(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0003|EvidenceOnboardingCases.test.ets|assert0027|assertTrue|actual|expected=true', complete.established())).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0003|EvidenceOnboardingCases.test.ets|assert0028|assertEqual|actual', complete.missing.length)).assertEqual(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0003|EvidenceOnboardingCases.test.ets|assert0028|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0003|EvidenceOnboardingCases.test.ets|assert0029|assertEqual|actual', complete.optionalHits.length)).assertEqual(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0003|EvidenceOnboardingCases.test.ets|assert0029|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0003|EvidenceOnboardingCases.test.ets|assert0030|assertEqual|actual', complete.confidence)).assertEqual(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0003|EvidenceOnboardingCases.test.ets|assert0030|assertEqual|expected', 100));
      const partial = evaluateChain(rule, ['EV-01', 'EV-10']);
      expect(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0003|EvidenceOnboardingCases.test.ets|assert0031|assertFalse|actual|expected=false', partial.established())).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0003|EvidenceOnboardingCases.test.ets|assert0032|assertEqual|actual', partial.missing.length)).assertEqual(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0003|EvidenceOnboardingCases.test.ets|assert0032|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0003|EvidenceOnboardingCases.test.ets|assert0033|assertEqual|actual', partial.missing[0])).assertEqual(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0003|EvidenceOnboardingCases.test.ets|assert0033|assertEqual|expected', 'EV-11'));
      expect(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0003|EvidenceOnboardingCases.test.ets|assert0034|assertEqual|actual', partial.confidence)).assertEqual(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0003|EvidenceOnboardingCases.test.ets|assert0034|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0003|EvidenceOnboardingCases.test.ets|assert0035|assertTrue|actual|expected=true', partial.text().indexOf('缺少') > 0)).assertTrue();
      const withoutOptional = evaluateChain(rule, ['EV-01', 'EV-10', 'EV-11']);
      expect(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0003|EvidenceOnboardingCases.test.ets|assert0036|assertTrue|actual|expected=true', withoutOptional.established())).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0003|EvidenceOnboardingCases.test.ets|assert0037|assertEqual|actual', withoutOptional.confidence)).assertEqual(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0003|EvidenceOnboardingCases.test.ets|assert0037|assertEqual|expected', 95));
    });

    /**
     * @tc.number    SUB_STARTUP_EVIDENCECHAINCASES_0400
     * @tc.name      testEvidenceChainCases0004
     * @tc.desc      Verify best chain picks highest confidence
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testEvidenceChainCases0004', 0, (): void => {
      configureTestText();
      const best = bestChain(Conclusion.SUPPORTED, ['EV-01', 'EV-10', 'EV-11', 'EV-07']);
      expect(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0004|EvidenceOnboardingCases.test.ets|assert0038|assertTrue|actual|expected=true', best !== undefined)).assertTrue();
      if (best !== undefined) {
        expect(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0004|EvidenceOnboardingCases.test.ets|assert0039|assertEqual|actual', best.ruleId)).assertEqual(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0004|EvidenceOnboardingCases.test.ets|assert0039|assertEqual|expected', 'EC-01'));
        expect(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0004|EvidenceOnboardingCases.test.ets|assert0040|assertEqual|actual', best.confidence)).assertEqual(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0004|EvidenceOnboardingCases.test.ets|assert0040|assertEqual|expected', 100));
        expect(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0004|EvidenceOnboardingCases.test.ets|assert0041|assertTrue|actual|expected=true', best.text().indexOf('成立') > 0)).assertTrue();
      }
      const unsupported = bestChain(Conclusion.UNSUPPORTED, ['EV-02', 'EV-03', 'EV-04']);
      expect(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0004|EvidenceOnboardingCases.test.ets|assert0042|assertTrue|actual|expected=true', unsupported !== undefined)).assertTrue();
      if (unsupported !== undefined) {
        expect(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0004|EvidenceOnboardingCases.test.ets|assert0043|assertEqual|actual', unsupported.ruleId)).assertEqual(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0004|EvidenceOnboardingCases.test.ets|assert0043|assertEqual|expected', 'EC-05'));
        expect(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0004|EvidenceOnboardingCases.test.ets|assert0044|assertEqual|actual', unsupported.confidence)).assertEqual(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0004|EvidenceOnboardingCases.test.ets|assert0044|assertEqual|expected', 100));
      }
      const minimal = bestChain(Conclusion.UNSUPPORTED, ['EV-02']);
      expect(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0004|EvidenceOnboardingCases.test.ets|assert0045|assertTrue|actual|expected=true', minimal !== undefined)).assertTrue();
      if (minimal !== undefined) {
        expect(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0004|EvidenceOnboardingCases.test.ets|assert0046|assertEqual|actual', minimal.confidence)).assertEqual(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0004|EvidenceOnboardingCases.test.ets|assert0046|assertEqual|expected', 90));
      }
      expect(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0004|EvidenceOnboardingCases.test.ets|assert0047|assertEqual|actual', bestChain(Conclusion.TIMEOUT, []))).assertEqual(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0004|EvidenceOnboardingCases.test.ets|assert0047|assertEqual|expected', undefined));
    });

    /**
     * @tc.number    SUB_STARTUP_EVIDENCECHAINCASES_0500
     * @tc.name      testEvidenceChainCases0005
     * @tc.desc      Verify feasible counts reflect evidence
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testEvidenceChainCases0005', 0, (): void => {
      configureTestText();
      const all: string[] = evidenceIds();
      const counts = feasibleCounts(all);
      expect(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0005|EvidenceOnboardingCases.test.ets|assert0048|assertEqual|actual', counts.length)).assertEqual(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0005|EvidenceOnboardingCases.test.ets|assert0048|assertEqual|expected', 6));
      expect(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0005|EvidenceOnboardingCases.test.ets|assert0049|assertEqual|actual', counts[0])).assertEqual(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0005|EvidenceOnboardingCases.test.ets|assert0049|assertEqual|expected', 4));
      expect(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0005|EvidenceOnboardingCases.test.ets|assert0050|assertEqual|actual', counts[1])).assertEqual(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0005|EvidenceOnboardingCases.test.ets|assert0050|assertEqual|expected', 3));
      expect(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0005|EvidenceOnboardingCases.test.ets|assert0051|assertEqual|actual', counts[2])).assertEqual(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0005|EvidenceOnboardingCases.test.ets|assert0051|assertEqual|expected', 4));
      expect(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0005|EvidenceOnboardingCases.test.ets|assert0052|assertEqual|actual', counts[3])).assertEqual(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0005|EvidenceOnboardingCases.test.ets|assert0052|assertEqual|expected', 3));
      expect(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0005|EvidenceOnboardingCases.test.ets|assert0053|assertEqual|actual', counts[4])).assertEqual(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0005|EvidenceOnboardingCases.test.ets|assert0053|assertEqual|expected', 3));
      expect(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0005|EvidenceOnboardingCases.test.ets|assert0054|assertEqual|actual', counts[5])).assertEqual(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0005|EvidenceOnboardingCases.test.ets|assert0054|assertEqual|expected', 1));
      const none = feasibleCounts([]);
      expect(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0005|EvidenceOnboardingCases.test.ets|assert0055|assertEqual|actual', none[0])).assertEqual(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0005|EvidenceOnboardingCases.test.ets|assert0055|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0005|EvidenceOnboardingCases.test.ets|assert0056|assertEqual|actual', none[5])).assertEqual(traceParameter('com.samples.appstartupauto_EvidenceChainCases_0005|EvidenceOnboardingCases.test.ets|assert0056|assertEqual|expected', 0));
    });
  });

  describe('OnboardingFlowCases', (): void => {
    /**
     * @tc.number    SUB_STARTUP_ONBOARDINGFLOWCASES_0100
     * @tc.name      testOnboardingFlowCases0001
     * @tc.desc      Verify step table is ordered
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testOnboardingFlowCases0001', 0, (): void => {
      configureTestText();
      expect(traceParameter('com.samples.appstartupauto_OnboardingFlowCases_0001|EvidenceOnboardingCases.test.ets|assert0057|assertEqual|actual', ONBOARDING_STEPS.length)).assertEqual(traceParameter('com.samples.appstartupauto_OnboardingFlowCases_0001|EvidenceOnboardingCases.test.ets|assert0057|assertEqual|expected', 20));
      expect(traceParameter('com.samples.appstartupauto_OnboardingFlowCases_0001|EvidenceOnboardingCases.test.ets|assert0058|assertEqual|actual', stepIds().length)).assertEqual(traceParameter('com.samples.appstartupauto_OnboardingFlowCases_0001|EvidenceOnboardingCases.test.ets|assert0058|assertEqual|expected', 20));
      expect(traceParameter('com.samples.appstartupauto_OnboardingFlowCases_0001|EvidenceOnboardingCases.test.ets|assert0059|assertEqual|actual', stepLines().length)).assertEqual(traceParameter('com.samples.appstartupauto_OnboardingFlowCases_0001|EvidenceOnboardingCases.test.ets|assert0059|assertEqual|expected', 20));
      const audit = auditOnboarding();
      expect(traceParameter('com.samples.appstartupauto_OnboardingFlowCases_0001|EvidenceOnboardingCases.test.ets|assert0060|assertEqual|actual', audit.findings.length)).assertEqual(traceParameter('com.samples.appstartupauto_OnboardingFlowCases_0001|EvidenceOnboardingCases.test.ets|assert0060|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_OnboardingFlowCases_0001|EvidenceOnboardingCases.test.ets|assert0061|assertTrue|actual|expected=true', audit.ok)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_OnboardingFlowCases_0001|EvidenceOnboardingCases.test.ets|assert0062|assertEqual|actual', audit.summary())).assertEqual(traceParameter('com.samples.appstartupauto_OnboardingFlowCases_0001|EvidenceOnboardingCases.test.ets|assert0062|assertEqual|expected', '引导步骤表自洽'));
      ONBOARDING_STEPS.forEach((step): void => {
        expect(traceParameter('com.samples.appstartupauto_OnboardingFlowCases_0001|EvidenceOnboardingCases.test.ets|assert0063|assertTrue|actual|expected=true', step.title.length > 0)).assertTrue();
        expect(traceParameter('com.samples.appstartupauto_OnboardingFlowCases_0001|EvidenceOnboardingCases.test.ets|assert0064|assertTrue|actual|expected=true', step.detail.length > 0)).assertTrue();
        expect(traceParameter('com.samples.appstartupauto_OnboardingFlowCases_0001|EvidenceOnboardingCases.test.ets|assert0065|assertTrue|actual|expected=true', step.text().indexOf(step.stepId) === 0)).assertTrue();
      });
      expect(traceParameter('com.samples.appstartupauto_OnboardingFlowCases_0001|EvidenceOnboardingCases.test.ets|assert0066|assertEqual|actual', stepOf('OB-99'))).assertEqual(traceParameter('com.samples.appstartupauto_OnboardingFlowCases_0001|EvidenceOnboardingCases.test.ets|assert0066|assertEqual|expected', undefined));
      expect(traceParameter('com.samples.appstartupauto_OnboardingFlowCases_0001|EvidenceOnboardingCases.test.ets|assert0067|assertEqual|actual', totalSeconds())).assertEqual(traceParameter('com.samples.appstartupauto_OnboardingFlowCases_0001|EvidenceOnboardingCases.test.ets|assert0067|assertEqual|expected', 500));
    });

    /**
     * @tc.number    SUB_STARTUP_ONBOARDINGFLOWCASES_0200
     * @tc.name      testOnboardingFlowCases0002
     * @tc.desc      Verify group and skip distribution
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testOnboardingFlowCases0002', 0, (): void => {
      configureTestText();
      expect(traceParameter('com.samples.appstartupauto_OnboardingFlowCases_0002|EvidenceOnboardingCases.test.ets|assert0068|assertEqual|actual', mandatorySteps().length)).assertEqual(traceParameter('com.samples.appstartupauto_OnboardingFlowCases_0002|EvidenceOnboardingCases.test.ets|assert0068|assertEqual|expected', 10));
      expect(traceParameter('com.samples.appstartupauto_OnboardingFlowCases_0002|EvidenceOnboardingCases.test.ets|assert0069|assertEqual|actual', skippableSteps().length)).assertEqual(traceParameter('com.samples.appstartupauto_OnboardingFlowCases_0002|EvidenceOnboardingCases.test.ets|assert0069|assertEqual|expected', 10));
      expect(traceParameter('com.samples.appstartupauto_OnboardingFlowCases_0002|EvidenceOnboardingCases.test.ets|assert0070|assertEqual|actual', stepsOfGroup(OnboardingGroup.INTRO).length)).assertEqual(traceParameter('com.samples.appstartupauto_OnboardingFlowCases_0002|EvidenceOnboardingCases.test.ets|assert0070|assertEqual|expected', 6));
      expect(traceParameter('com.samples.appstartupauto_OnboardingFlowCases_0002|EvidenceOnboardingCases.test.ets|assert0071|assertEqual|actual', stepsOfGroup(OnboardingGroup.PERMISSION).length)).assertEqual(traceParameter('com.samples.appstartupauto_OnboardingFlowCases_0002|EvidenceOnboardingCases.test.ets|assert0071|assertEqual|expected', 3));
      expect(traceParameter('com.samples.appstartupauto_OnboardingFlowCases_0002|EvidenceOnboardingCases.test.ets|assert0072|assertEqual|actual', stepsOfGroup(OnboardingGroup.CAPABILITY).length)).assertEqual(traceParameter('com.samples.appstartupauto_OnboardingFlowCases_0002|EvidenceOnboardingCases.test.ets|assert0072|assertEqual|expected', 4));
      expect(traceParameter('com.samples.appstartupauto_OnboardingFlowCases_0002|EvidenceOnboardingCases.test.ets|assert0073|assertEqual|actual', stepsOfGroup(OnboardingGroup.PRACTICE).length)).assertEqual(traceParameter('com.samples.appstartupauto_OnboardingFlowCases_0002|EvidenceOnboardingCases.test.ets|assert0073|assertEqual|expected', 4));
      expect(traceParameter('com.samples.appstartupauto_OnboardingFlowCases_0002|EvidenceOnboardingCases.test.ets|assert0074|assertEqual|actual', stepsOfGroup(OnboardingGroup.CLOSING).length)).assertEqual(traceParameter('com.samples.appstartupauto_OnboardingFlowCases_0002|EvidenceOnboardingCases.test.ets|assert0074|assertEqual|expected', 3));
      expect(traceParameter('com.samples.appstartupauto_OnboardingFlowCases_0002|EvidenceOnboardingCases.test.ets|assert0075|assertEqual|actual', groupLabel(OnboardingGroup.PRACTICE))).assertEqual(traceParameter('com.samples.appstartupauto_OnboardingFlowCases_0002|EvidenceOnboardingCases.test.ets|assert0075|assertEqual|expected', '实际操作'));
      expect(traceParameter('com.samples.appstartupauto_OnboardingFlowCases_0002|EvidenceOnboardingCases.test.ets|assert0076|assertEqual|actual', statusLabel(StepStatus.SKIPPED))).assertEqual(traceParameter('com.samples.appstartupauto_OnboardingFlowCases_0002|EvidenceOnboardingCases.test.ets|assert0076|assertEqual|expected', '已跳过'));
      expect(traceParameter('com.samples.appstartupauto_OnboardingFlowCases_0002|EvidenceOnboardingCases.test.ets|assert0077|assertTrue|actual|expected=true', settled(StepStatus.DONE))).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_OnboardingFlowCases_0002|EvidenceOnboardingCases.test.ets|assert0078|assertFalse|actual|expected=false', settled(StepStatus.PENDING))).assertFalse();
    });

    /**
     * @tc.number    SUB_STARTUP_ONBOARDINGFLOWCASES_0300
     * @tc.name      testOnboardingFlowCases0003
     * @tc.desc      Verify flow requires dependencies
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testOnboardingFlowCases0003', 0, (): void => {
      configureTestText();
      const flow = new OnboardingFlow();
      expect(traceParameter('com.samples.appstartupauto_OnboardingFlowCases_0003|EvidenceOnboardingCases.test.ets|assert0079|assertEqual|actual', flow.statusOf('OB-01'))).assertEqual(traceParameter('com.samples.appstartupauto_OnboardingFlowCases_0003|EvidenceOnboardingCases.test.ets|assert0079|assertEqual|expected', StepStatus.PENDING));
      expect(traceParameter('com.samples.appstartupauto_OnboardingFlowCases_0003|EvidenceOnboardingCases.test.ets|assert0080|assertFalse|actual|expected=false', flow.complete('OB-08'))).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_OnboardingFlowCases_0003|EvidenceOnboardingCases.test.ets|assert0081|assertTrue|actual|expected=true', flow.complete('OB-01'))).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_OnboardingFlowCases_0003|EvidenceOnboardingCases.test.ets|assert0082|assertEqual|actual', flow.statusOf('OB-01'))).assertEqual(traceParameter('com.samples.appstartupauto_OnboardingFlowCases_0003|EvidenceOnboardingCases.test.ets|assert0082|assertEqual|expected', StepStatus.DONE));
      expect(traceParameter('com.samples.appstartupauto_OnboardingFlowCases_0003|EvidenceOnboardingCases.test.ets|assert0083|assertTrue|actual|expected=true', flow.complete('OB-02'))).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_OnboardingFlowCases_0003|EvidenceOnboardingCases.test.ets|assert0084|assertTrue|actual|expected=true', flow.complete('OB-03'))).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_OnboardingFlowCases_0003|EvidenceOnboardingCases.test.ets|assert0085|assertFalse|actual|expected=false', flow.complete('OB-08'))).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_OnboardingFlowCases_0003|EvidenceOnboardingCases.test.ets|assert0086|assertEqual|actual', flow.doneCount())).assertEqual(traceParameter('com.samples.appstartupauto_OnboardingFlowCases_0003|EvidenceOnboardingCases.test.ets|assert0086|assertEqual|expected', 3));
      expect(traceParameter('com.samples.appstartupauto_OnboardingFlowCases_0003|EvidenceOnboardingCases.test.ets|assert0087|assertEqual|actual', flow.progress())).assertEqual(traceParameter('com.samples.appstartupauto_OnboardingFlowCases_0003|EvidenceOnboardingCases.test.ets|assert0087|assertEqual|expected', 15));
      expect(traceParameter('com.samples.appstartupauto_OnboardingFlowCases_0003|EvidenceOnboardingCases.test.ets|assert0088|assertFalse|actual|expected=false', flow.complete('OB-99'))).assertFalse();
    });

    /**
     * @tc.number    SUB_STARTUP_ONBOARDINGFLOWCASES_0400
     * @tc.name      testOnboardingFlowCases0004
     * @tc.desc      Verify skip rules are enforced
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testOnboardingFlowCases0004', 0, (): void => {
      configureTestText();
      const flow = new OnboardingFlow();
      expect(traceParameter('com.samples.appstartupauto_OnboardingFlowCases_0004|EvidenceOnboardingCases.test.ets|assert0089|assertFalse|actual|expected=false', flow.skip('OB-01'))).assertFalse();
      flow.complete('OB-01');
      expect(traceParameter('com.samples.appstartupauto_OnboardingFlowCases_0004|EvidenceOnboardingCases.test.ets|assert0090|assertFalse|actual|expected=false', flow.skip('OB-02'))).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_OnboardingFlowCases_0004|EvidenceOnboardingCases.test.ets|assert0091|assertTrue|actual|expected=true', flow.complete('OB-03'))).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_OnboardingFlowCases_0004|EvidenceOnboardingCases.test.ets|assert0092|assertTrue|actual|expected=true', flow.skip('OB-19'))).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_OnboardingFlowCases_0004|EvidenceOnboardingCases.test.ets|assert0093|assertEqual|actual', flow.statusOf('OB-19'))).assertEqual(traceParameter('com.samples.appstartupauto_OnboardingFlowCases_0004|EvidenceOnboardingCases.test.ets|assert0093|assertEqual|expected', StepStatus.SKIPPED));
      expect(traceParameter('com.samples.appstartupauto_OnboardingFlowCases_0004|EvidenceOnboardingCases.test.ets|assert0094|assertEqual|actual', flow.skippedCount())).assertEqual(traceParameter('com.samples.appstartupauto_OnboardingFlowCases_0004|EvidenceOnboardingCases.test.ets|assert0094|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_OnboardingFlowCases_0004|EvidenceOnboardingCases.test.ets|assert0095|assertEqual|actual', flow.progress())).assertEqual(traceParameter('com.samples.appstartupauto_OnboardingFlowCases_0004|EvidenceOnboardingCases.test.ets|assert0095|assertEqual|expected', 15));
      expect(traceParameter('com.samples.appstartupauto_OnboardingFlowCases_0004|EvidenceOnboardingCases.test.ets|assert0096|assertFalse|actual|expected=false', flow.skip('OB-99'))).assertFalse();
    });

    /**
     * @tc.number    SUB_STARTUP_ONBOARDINGFLOWCASES_0500
     * @tc.name      testOnboardingFlowCases0005
     * @tc.desc      Verify current step follows dependencies
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testOnboardingFlowCases0005', 0, (): void => {
      configureTestText();
      const flow = new OnboardingFlow();
      expect(traceParameter('com.samples.appstartupauto_OnboardingFlowCases_0005|EvidenceOnboardingCases.test.ets|assert0097|assertEqual|actual', flow.current()?.stepId)).assertEqual(traceParameter('com.samples.appstartupauto_OnboardingFlowCases_0005|EvidenceOnboardingCases.test.ets|assert0097|assertEqual|expected', 'OB-01'));
      flow.complete('OB-01');
      expect(traceParameter('com.samples.appstartupauto_OnboardingFlowCases_0005|EvidenceOnboardingCases.test.ets|assert0098|assertEqual|actual', flow.current()?.stepId)).assertEqual(traceParameter('com.samples.appstartupauto_OnboardingFlowCases_0005|EvidenceOnboardingCases.test.ets|assert0098|assertEqual|expected', 'OB-02'));
      expect(traceParameter('com.samples.appstartupauto_OnboardingFlowCases_0005|EvidenceOnboardingCases.test.ets|assert0099|assertTrue|actual|expected=true', flow.blocked().length > 0)).assertTrue();
      flow.complete('OB-02');
      flow.complete('OB-03');
      flow.complete('OB-04');
      expect(traceParameter('com.samples.appstartupauto_OnboardingFlowCases_0005|EvidenceOnboardingCases.test.ets|assert0100|assertEqual|actual', flow.current()?.stepId)).assertEqual(traceParameter('com.samples.appstartupauto_OnboardingFlowCases_0005|EvidenceOnboardingCases.test.ets|assert0100|assertEqual|expected', 'OB-05'));
      const lines: string[] = groupProgressLines(flow);
      expect(traceParameter('com.samples.appstartupauto_OnboardingFlowCases_0005|EvidenceOnboardingCases.test.ets|assert0101|assertEqual|actual', lines.length)).assertEqual(traceParameter('com.samples.appstartupauto_OnboardingFlowCases_0005|EvidenceOnboardingCases.test.ets|assert0101|assertEqual|expected', 5));
      expect(traceParameter('com.samples.appstartupauto_OnboardingFlowCases_0005|EvidenceOnboardingCases.test.ets|assert0102|assertTrue|actual|expected=true', lines[0].indexOf('认识功能') === 0)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_OnboardingFlowCases_0005|EvidenceOnboardingCases.test.ets|assert0103|assertTrue|actual|expected=true', flow.text().indexOf('进度') === 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_ONBOARDINGFLOWCASES_0600
     * @tc.name      testOnboardingFlowCases0006
     * @tc.desc      Verify full path clears mandatory steps
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testOnboardingFlowCases0006', 0, (): void => {
      configureTestText();
      const flow = new OnboardingFlow();
      flow.complete('OB-01');
      flow.complete('OB-02');
      flow.complete('OB-03');
      flow.complete('OB-04');
      flow.complete('OB-05');
      flow.complete('OB-06');
      flow.complete('OB-07');
      flow.complete('OB-08');
      flow.complete('OB-09');
      expect(traceParameter('com.samples.appstartupauto_OnboardingFlowCases_0006|EvidenceOnboardingCases.test.ets|assert0104|assertFalse|actual|expected=false', flow.mandatoryDone())).assertFalse();
      ['OB-10', 'OB-11', 'OB-12', 'OB-13', 'OB-14', 'OB-15', 'OB-16', 'OB-17'].forEach(
        (id: string): void => {
          flow.skip(id);
        });
      expect(traceParameter('com.samples.appstartupauto_OnboardingFlowCases_0006|EvidenceOnboardingCases.test.ets|assert0105|assertTrue|actual|expected=true', flow.complete('OB-18'))).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_OnboardingFlowCases_0006|EvidenceOnboardingCases.test.ets|assert0106|assertTrue|actual|expected=true', flow.mandatoryDone())).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_OnboardingFlowCases_0006|EvidenceOnboardingCases.test.ets|assert0107|assertEqual|actual', flow.current()?.stepId)).assertEqual(traceParameter('com.samples.appstartupauto_OnboardingFlowCases_0006|EvidenceOnboardingCases.test.ets|assert0107|assertEqual|expected', 'OB-19'));
      expect(traceParameter('com.samples.appstartupauto_OnboardingFlowCases_0006|EvidenceOnboardingCases.test.ets|assert0108|assertEqual|actual', flow.progress())).assertEqual(traceParameter('com.samples.appstartupauto_OnboardingFlowCases_0006|EvidenceOnboardingCases.test.ets|assert0108|assertEqual|expected', 90));
      expect(traceParameter('com.samples.appstartupauto_OnboardingFlowCases_0006|EvidenceOnboardingCases.test.ets|assert0109|assertEqual|actual', flow.blocked().length)).assertEqual(traceParameter('com.samples.appstartupauto_OnboardingFlowCases_0006|EvidenceOnboardingCases.test.ets|assert0109|assertEqual|expected', 0));
    });
  });
}
