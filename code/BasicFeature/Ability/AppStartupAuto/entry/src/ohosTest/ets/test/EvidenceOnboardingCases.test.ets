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
import { loggedIt as it } from '../support/TestLog';
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
      expect(EVIDENCE_CATALOG.length).assertEqual(20);
      expect(CHAIN_RULES.length).assertEqual(18);
      expect(evidenceIds().length).assertEqual(20);
      expect(chainIds().length).assertEqual(18);
      expect(evidenceLines().length).assertEqual(20);
      expect(chainLines().length).assertEqual(18);
      const audit = auditChains();
      expect(audit.findings.length).assertEqual(0);
      expect(audit.ok).assertTrue();
      expect(audit.summary()).assertEqual('证据链自洽');
      EVIDENCE_CATALOG.forEach((item): void => {
        expect(item.label.length > 0).assertTrue();
        expect(item.weight > 0).assertTrue();
        expect(item.text().indexOf(item.evidenceId) === 0).assertTrue();
      });
      expect(evidenceOf('EV-99')).assertEqual(undefined);
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
      expect(evidencesOfKind(EvidenceKind.CAPABILITY_RULE).length).assertEqual(3);
      expect(evidencesOfKind(EvidenceKind.ERROR_CODE).length).assertEqual(4);
      expect(evidencesOfKind(EvidenceKind.HISTORY_SAMPLE).length).assertEqual(3);
      expect(evidencesOfKind(EvidenceKind.DEVICE_INFO).length).assertEqual(3);
      expect(evidencesOfKind(EvidenceKind.SCHEMA_AUDIT).length).assertEqual(2);
      expect(evidencesOfKind(EvidenceKind.SLO_RESULT).length).assertEqual(2);
      expect(evidencesOfKind(EvidenceKind.USER_ACTION).length).assertEqual(3);
      expect(kindLines().length).assertEqual(7);
      expect(kindLabel(EvidenceKind.ERROR_CODE)).assertEqual('错误码');
      expect(conclusionLabel(Conclusion.NEED_PERMISSION)).assertEqual('需要授权');
      expect(chainsOf(Conclusion.SUPPORTED).length).assertEqual(4);
      expect(chainsOf(Conclusion.UNSUPPORTED).length).assertEqual(4);
      expect(chainsOf(Conclusion.TIMEOUT).length).assertEqual(1);
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
      const rule = CHAIN_RULES[0];
      const complete = evaluateChain(rule, ['EV-01', 'EV-10', 'EV-11', 'EV-07']);
      expect(complete.established()).assertTrue();
      expect(complete.missing.length).assertEqual(0);
      expect(complete.optionalHits.length).assertEqual(1);
      expect(complete.confidence).assertEqual(100);
      const partial = evaluateChain(rule, ['EV-01', 'EV-10']);
      expect(partial.established()).assertFalse();
      expect(partial.missing.length).assertEqual(1);
      expect(partial.missing[0]).assertEqual('EV-11');
      expect(partial.confidence).assertEqual(0);
      expect(partial.text().indexOf('缺少') > 0).assertTrue();
      const withoutOptional = evaluateChain(rule, ['EV-01', 'EV-10', 'EV-11']);
      expect(withoutOptional.established()).assertTrue();
      expect(withoutOptional.confidence).assertEqual(95);
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
      const best = bestChain(Conclusion.SUPPORTED, ['EV-01', 'EV-10', 'EV-11', 'EV-07']);
      expect(best !== undefined).assertTrue();
      if (best !== undefined) {
        expect(best.ruleId).assertEqual('EC-01');
        expect(best.confidence).assertEqual(100);
        expect(best.text().indexOf('成立') > 0).assertTrue();
      }
      const unsupported = bestChain(Conclusion.UNSUPPORTED, ['EV-02', 'EV-03', 'EV-04']);
      expect(unsupported !== undefined).assertTrue();
      if (unsupported !== undefined) {
        expect(unsupported.ruleId).assertEqual('EC-05');
        expect(unsupported.confidence).assertEqual(100);
      }
      const minimal = bestChain(Conclusion.UNSUPPORTED, ['EV-02']);
      expect(minimal !== undefined).assertTrue();
      if (minimal !== undefined) {
        expect(minimal.confidence).assertEqual(90);
      }
      expect(bestChain(Conclusion.TIMEOUT, [])).assertEqual(undefined);
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
      const all: string[] = evidenceIds();
      const counts = feasibleCounts(all);
      expect(counts.length).assertEqual(6);
      expect(counts[0]).assertEqual(4);
      expect(counts[1]).assertEqual(3);
      expect(counts[2]).assertEqual(4);
      expect(counts[3]).assertEqual(3);
      expect(counts[4]).assertEqual(3);
      expect(counts[5]).assertEqual(1);
      const none = feasibleCounts([]);
      expect(none[0]).assertEqual(0);
      expect(none[5]).assertEqual(0);
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
      expect(ONBOARDING_STEPS.length).assertEqual(20);
      expect(stepIds().length).assertEqual(20);
      expect(stepLines().length).assertEqual(20);
      const audit = auditOnboarding();
      expect(audit.findings.length).assertEqual(0);
      expect(audit.ok).assertTrue();
      expect(audit.summary()).assertEqual('引导步骤表自洽');
      ONBOARDING_STEPS.forEach((step): void => {
        expect(step.title.length > 0).assertTrue();
        expect(step.detail.length > 0).assertTrue();
        expect(step.text().indexOf(step.stepId) === 0).assertTrue();
      });
      expect(stepOf('OB-99')).assertEqual(undefined);
      expect(totalSeconds()).assertEqual(500);
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
      expect(mandatorySteps().length).assertEqual(10);
      expect(skippableSteps().length).assertEqual(10);
      expect(stepsOfGroup(OnboardingGroup.INTRO).length).assertEqual(6);
      expect(stepsOfGroup(OnboardingGroup.PERMISSION).length).assertEqual(3);
      expect(stepsOfGroup(OnboardingGroup.CAPABILITY).length).assertEqual(4);
      expect(stepsOfGroup(OnboardingGroup.PRACTICE).length).assertEqual(4);
      expect(stepsOfGroup(OnboardingGroup.CLOSING).length).assertEqual(3);
      expect(groupLabel(OnboardingGroup.PRACTICE)).assertEqual('实际操作');
      expect(statusLabel(StepStatus.SKIPPED)).assertEqual('已跳过');
      expect(settled(StepStatus.DONE)).assertTrue();
      expect(settled(StepStatus.PENDING)).assertFalse();
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
      const flow = new OnboardingFlow();
      expect(flow.statusOf('OB-01')).assertEqual(StepStatus.PENDING);
      expect(flow.complete('OB-08')).assertFalse();
      expect(flow.complete('OB-01')).assertTrue();
      expect(flow.statusOf('OB-01')).assertEqual(StepStatus.DONE);
      expect(flow.complete('OB-02')).assertTrue();
      expect(flow.complete('OB-03')).assertTrue();
      expect(flow.complete('OB-08')).assertFalse();
      expect(flow.doneCount()).assertEqual(3);
      expect(flow.progress()).assertEqual(15);
      expect(flow.complete('OB-99')).assertFalse();
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
      const flow = new OnboardingFlow();
      expect(flow.skip('OB-01')).assertFalse();
      flow.complete('OB-01');
      expect(flow.skip('OB-02')).assertFalse();
      expect(flow.complete('OB-03')).assertTrue();
      expect(flow.skip('OB-19')).assertTrue();
      expect(flow.statusOf('OB-19')).assertEqual(StepStatus.SKIPPED);
      expect(flow.skippedCount()).assertEqual(1);
      expect(flow.progress()).assertEqual(15);
      expect(flow.skip('OB-99')).assertFalse();
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
      const flow = new OnboardingFlow();
      expect(flow.current()?.stepId).assertEqual('OB-01');
      flow.complete('OB-01');
      expect(flow.current()?.stepId).assertEqual('OB-02');
      expect(flow.blocked().length > 0).assertTrue();
      flow.complete('OB-02');
      flow.complete('OB-03');
      flow.complete('OB-04');
      expect(flow.current()?.stepId).assertEqual('OB-05');
      const lines: string[] = groupProgressLines(flow);
      expect(lines.length).assertEqual(5);
      expect(lines[0].indexOf('认识功能') === 0).assertTrue();
      expect(flow.text().indexOf('进度') === 0).assertTrue();
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
      expect(flow.mandatoryDone()).assertFalse();
      ['OB-10', 'OB-11', 'OB-12', 'OB-13', 'OB-14', 'OB-15', 'OB-16', 'OB-17'].forEach(
        (id: string): void => {
          flow.skip(id);
        });
      expect(flow.complete('OB-18')).assertTrue();
      expect(flow.mandatoryDone()).assertTrue();
      expect(flow.current()?.stepId).assertEqual('OB-19');
      expect(flow.progress()).assertEqual(90);
      expect(flow.blocked().length).assertEqual(0);
    });
  });
}
