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
  PERMISSION_RULES, PermissionContext, PermissionDecision, PermissionRule, PermissionState,
  RequestPolicy, afterAsk, afterDontAskAgain, auditPermissionRules, permissionLabel, permissionLines,
  planPermission, policySeries
} from '../../../main/ets/autostart/permission/PermissionPlan';

function contextOf(api: number, asked: number, state: PermissionState): PermissionContext {
  return new PermissionContext(api, asked, state);
}

export default function onboardingCasesTest(): void {
  configureTestText();

  describe('PermissionPlanCases', (): void => {
    /**
     * @tc.number    SUB_STARTUP_PERMISSIONPLANCASES_0100
     * @tc.name      testPermissionPlanCases0001
     * @tc.desc      Verify granted and not required short circuit
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testPermissionPlanCases0001', 0, (): void => {
      configureTestText();
      const granted: PermissionDecision = planPermission(
        contextOf(18, 0, PermissionState.GRANTED));
      expect(traceParameter('com.samples.appstartupauto_PermissionPlanCases_0001|OnboardingCases.test.ets|assert0001|assertEqual|actual', granted.policy)).assertEqual(traceParameter('com.samples.appstartupauto_PermissionPlanCases_0001|OnboardingCases.test.ets|assert0001|assertEqual|expected', RequestPolicy.NO_REQUEST));
      expect(traceParameter('com.samples.appstartupauto_PermissionPlanCases_0001|OnboardingCases.test.ets|assert0002|assertFalse|actual|expected=false', granted.canAsk)).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_PermissionPlanCases_0001|OnboardingCases.test.ets|assert0003|assertFalse|actual|expected=false', granted.needsSettings)).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_PermissionPlanCases_0001|OnboardingCases.test.ets|assert0004|assertEqual|actual', granted.ruleId)).assertEqual(traceParameter('com.samples.appstartupauto_PermissionPlanCases_0001|OnboardingCases.test.ets|assert0004|assertEqual|expected', 'PM-GRANTED'));
      const notRequired: PermissionDecision = planPermission(
        contextOf(18, 0, PermissionState.NOT_REQUIRED));
      expect(traceParameter('com.samples.appstartupauto_PermissionPlanCases_0001|OnboardingCases.test.ets|assert0005|assertEqual|actual', notRequired.ruleId)).assertEqual(traceParameter('com.samples.appstartupauto_PermissionPlanCases_0001|OnboardingCases.test.ets|assert0005|assertEqual|expected', 'PM-NOT-REQUIRED'));
      expect(traceParameter('com.samples.appstartupauto_PermissionPlanCases_0001|OnboardingCases.test.ets|assert0006|assertEqual|actual', notRequired.state)).assertEqual(traceParameter('com.samples.appstartupauto_PermissionPlanCases_0001|OnboardingCases.test.ets|assert0006|assertEqual|expected', PermissionState.NOT_REQUIRED));
      expect(traceParameter('com.samples.appstartupauto_PermissionPlanCases_0001|OnboardingCases.test.ets|assert0007|assertEqual|actual', permissionLabel(PermissionState.GRANTED))).assertEqual(traceParameter('com.samples.appstartupauto_PermissionPlanCases_0001|OnboardingCases.test.ets|assert0007|assertEqual|expected', '已授权'));
    });

    /**
     * @tc.number    SUB_STARTUP_PERMISSIONPLANCASES_0200
     * @tc.name      testPermissionPlanCases0002
     * @tc.desc      Verify low api never asks
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testPermissionPlanCases0002', 0, (): void => {
      configureTestText();
      const decision: PermissionDecision = planPermission(contextOf(8, 0, PermissionState.DENIED));
      expect(traceParameter('com.samples.appstartupauto_PermissionPlanCases_0002|OnboardingCases.test.ets|assert0008|assertEqual|actual', decision.ruleId)).assertEqual(traceParameter('com.samples.appstartupauto_PermissionPlanCases_0002|OnboardingCases.test.ets|assert0008|assertEqual|expected', 'PM-0001'));
      expect(traceParameter('com.samples.appstartupauto_PermissionPlanCases_0002|OnboardingCases.test.ets|assert0009|assertEqual|actual', decision.policy)).assertEqual(traceParameter('com.samples.appstartupauto_PermissionPlanCases_0002|OnboardingCases.test.ets|assert0009|assertEqual|expected', RequestPolicy.NO_REQUEST));
      expect(traceParameter('com.samples.appstartupauto_PermissionPlanCases_0002|OnboardingCases.test.ets|assert0010|assertFalse|actual|expected=false', decision.canAsk)).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_PermissionPlanCases_0002|OnboardingCases.test.ets|assert0011|assertFalse|actual|expected=false', decision.needsSettings)).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_PermissionPlanCases_0002|OnboardingCases.test.ets|assert0012|assertTrue|actual|expected=true', decision.message.indexOf('不支持') >= 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_PERMISSIONPLANCASES_0300
     * @tc.name      testPermissionPlanCases0003
     * @tc.desc      Verify api9 to11 asks once only
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testPermissionPlanCases0003', 0, (): void => {
      configureTestText();
      const first: PermissionDecision = planPermission(contextOf(10, 0, PermissionState.DENIED));
      expect(traceParameter('com.samples.appstartupauto_PermissionPlanCases_0003|OnboardingCases.test.ets|assert0013|assertEqual|actual', first.ruleId)).assertEqual(traceParameter('com.samples.appstartupauto_PermissionPlanCases_0003|OnboardingCases.test.ets|assert0013|assertEqual|expected', 'PM-0002'));
      expect(traceParameter('com.samples.appstartupauto_PermissionPlanCases_0003|OnboardingCases.test.ets|assert0014|assertTrue|actual|expected=true', first.canAsk)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_PermissionPlanCases_0003|OnboardingCases.test.ets|assert0015|assertFalse|actual|expected=false', first.needsSettings)).assertFalse();
      const asked: PermissionContext = contextOf(10, 1, PermissionState.DENIED);
      asked.askedThisSession = true;
      const second: PermissionDecision = planPermission(asked);
      expect(traceParameter('com.samples.appstartupauto_PermissionPlanCases_0003|OnboardingCases.test.ets|assert0016|assertFalse|actual|expected=false', second.canAsk)).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_PermissionPlanCases_0003|OnboardingCases.test.ets|assert0017|assertTrue|actual|expected=true', second.needsSettings)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_PermissionPlanCases_0003|OnboardingCases.test.ets|assert0018|assertTrue|actual|expected=true', second.message.indexOf('系统设置') >= 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_PERMISSIONPLANCASES_0400
     * @tc.name      testPermissionPlanCases0004
     * @tc.desc      Verify api12 to17 asks twice
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testPermissionPlanCases0004', 0, (): void => {
      configureTestText();
      expect(traceParameter('com.samples.appstartupauto_PermissionPlanCases_0004|OnboardingCases.test.ets|assert0019|assertEqual|actual', planPermission(contextOf(12, 0, PermissionState.DENIED)).ruleId)).assertEqual(traceParameter('com.samples.appstartupauto_PermissionPlanCases_0004|OnboardingCases.test.ets|assert0019|assertEqual|expected', 'PM-0003'));
      expect(traceParameter('com.samples.appstartupauto_PermissionPlanCases_0004|OnboardingCases.test.ets|assert0020|assertTrue|actual|expected=true', planPermission(contextOf(14, 1, PermissionState.DENIED)).canAsk)).assertTrue();
      const used: PermissionDecision = planPermission(contextOf(17, 2, PermissionState.DENIED));
      expect(traceParameter('com.samples.appstartupauto_PermissionPlanCases_0004|OnboardingCases.test.ets|assert0021|assertFalse|actual|expected=false', used.canAsk)).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_PermissionPlanCases_0004|OnboardingCases.test.ets|assert0022|assertTrue|actual|expected=true', used.needsSettings)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_PermissionPlanCases_0004|OnboardingCases.test.ets|assert0023|assertTrue|actual|expected=true', used.message.indexOf('已申请 2 次') >= 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_PERMISSIONPLANCASES_0500
     * @tc.name      testPermissionPlanCases0005
     * @tc.desc      Verify api18 to26 asks three times
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testPermissionPlanCases0005', 0, (): void => {
      configureTestText();
      expect(traceParameter('com.samples.appstartupauto_PermissionPlanCases_0005|OnboardingCases.test.ets|assert0024|assertEqual|actual', planPermission(contextOf(18, 0, PermissionState.DENIED)).ruleId)).assertEqual(traceParameter('com.samples.appstartupauto_PermissionPlanCases_0005|OnboardingCases.test.ets|assert0024|assertEqual|expected', 'PM-0004'));
      expect(traceParameter('com.samples.appstartupauto_PermissionPlanCases_0005|OnboardingCases.test.ets|assert0025|assertTrue|actual|expected=true', planPermission(contextOf(26, 2, PermissionState.DENIED)).canAsk)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_PermissionPlanCases_0005|OnboardingCases.test.ets|assert0026|assertFalse|actual|expected=false', planPermission(contextOf(26, 3, PermissionState.DENIED)).canAsk)).assertFalse();
      const series: string[] = policySeries();
      expect(traceParameter('com.samples.appstartupauto_PermissionPlanCases_0005|OnboardingCases.test.ets|assert0027|assertEqual|actual', series.length)).assertEqual(traceParameter('com.samples.appstartupauto_PermissionPlanCases_0005|OnboardingCases.test.ets|assert0027|assertEqual|expected', 21));
      expect(traceParameter('com.samples.appstartupauto_PermissionPlanCases_0005|OnboardingCases.test.ets|assert0028|assertTrue|actual|expected=true', series[0].indexOf('noRequest') > 0)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_PermissionPlanCases_0005|OnboardingCases.test.ets|assert0029|assertTrue|actual|expected=true', series[series.length - 1].indexOf('settingsOnly') > 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_PERMISSIONPLANCASES_0600
     * @tc.name      testPermissionPlanCases0006
     * @tc.desc      Verify permanent denial forces settings
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testPermissionPlanCases0006', 0, (): void => {
      configureTestText();
      const decision: PermissionDecision = planPermission(
        contextOf(18, 1, PermissionState.DENIED_PERMANENTLY));
      expect(traceParameter('com.samples.appstartupauto_PermissionPlanCases_0006|OnboardingCases.test.ets|assert0030|assertFalse|actual|expected=false', decision.canAsk)).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_PermissionPlanCases_0006|OnboardingCases.test.ets|assert0031|assertTrue|actual|expected=true', decision.needsSettings)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_PermissionPlanCases_0006|OnboardingCases.test.ets|assert0032|assertEqual|actual', decision.state)).assertEqual(traceParameter('com.samples.appstartupauto_PermissionPlanCases_0006|OnboardingCases.test.ets|assert0032|assertEqual|expected', PermissionState.DENIED_PERMANENTLY));
      expect(traceParameter('com.samples.appstartupauto_PermissionPlanCases_0006|OnboardingCases.test.ets|assert0033|assertEqual|actual', permissionLabel(PermissionState.DENIED_PERMANENTLY))).assertEqual(traceParameter('com.samples.appstartupauto_PermissionPlanCases_0006|OnboardingCases.test.ets|assert0033|assertEqual|expected', '已永久拒绝'));
    });

    /**
     * @tc.number    SUB_STARTUP_PERMISSIONPLANCASES_0700
     * @tc.name      testPermissionPlanCases0007
     * @tc.desc      Verify missing dialog falls back to settings
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testPermissionPlanCases0007', 0, (): void => {
      configureTestText();
      const context: PermissionContext = contextOf(20, 0, PermissionState.DENIED);
      context.systemDialogAvailable = false;
      const decision: PermissionDecision = planPermission(context);
      expect(traceParameter('com.samples.appstartupauto_PermissionPlanCases_0007|OnboardingCases.test.ets|assert0034|assertFalse|actual|expected=false', decision.canAsk)).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_PermissionPlanCases_0007|OnboardingCases.test.ets|assert0035|assertTrue|actual|expected=true', decision.needsSettings)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_PermissionPlanCases_0007|OnboardingCases.test.ets|assert0036|assertTrue|actual|expected=true', decision.hint.indexOf('systemDialogAvailable') >= 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_PERMISSIONPLANCASES_0800
     * @tc.name      testPermissionPlanCases0008
     * @tc.desc      Verify future api goes straight to settings
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testPermissionPlanCases0008', 0, (): void => {
      configureTestText();
      const decision: PermissionDecision = planPermission(contextOf(28, 0, PermissionState.DENIED));
      expect(traceParameter('com.samples.appstartupauto_PermissionPlanCases_0008|OnboardingCases.test.ets|assert0037|assertEqual|actual', decision.ruleId)).assertEqual(traceParameter('com.samples.appstartupauto_PermissionPlanCases_0008|OnboardingCases.test.ets|assert0037|assertEqual|expected', 'PM-0005'));
      expect(traceParameter('com.samples.appstartupauto_PermissionPlanCases_0008|OnboardingCases.test.ets|assert0038|assertEqual|actual', decision.policy)).assertEqual(traceParameter('com.samples.appstartupauto_PermissionPlanCases_0008|OnboardingCases.test.ets|assert0038|assertEqual|expected', RequestPolicy.SETTINGS_ONLY));
      expect(traceParameter('com.samples.appstartupauto_PermissionPlanCases_0008|OnboardingCases.test.ets|assert0039|assertTrue|actual|expected=true', decision.needsSettings)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_PermissionPlanCases_0008|OnboardingCases.test.ets|assert0040|assertFalse|actual|expected=false', decision.canAsk)).assertFalse();
    });

    /**
     * @tc.number    SUB_STARTUP_PERMISSIONPLANCASES_0900
     * @tc.name      testPermissionPlanCases0009
     * @tc.desc      Verify state transitions after ask
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testPermissionPlanCases0009', 0, (): void => {
      configureTestText();
      const base: PermissionContext = contextOf(18, 0, PermissionState.DENIED);
      const granted: PermissionContext = afterAsk(base, true);
      expect(traceParameter('com.samples.appstartupauto_PermissionPlanCases_0009|OnboardingCases.test.ets|assert0041|assertEqual|actual', granted.state)).assertEqual(traceParameter('com.samples.appstartupauto_PermissionPlanCases_0009|OnboardingCases.test.ets|assert0041|assertEqual|expected', PermissionState.GRANTED));
      expect(traceParameter('com.samples.appstartupauto_PermissionPlanCases_0009|OnboardingCases.test.ets|assert0042|assertEqual|actual', granted.askedTimes)).assertEqual(traceParameter('com.samples.appstartupauto_PermissionPlanCases_0009|OnboardingCases.test.ets|assert0042|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_PermissionPlanCases_0009|OnboardingCases.test.ets|assert0043|assertTrue|actual|expected=true', granted.askedThisSession)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_PermissionPlanCases_0009|OnboardingCases.test.ets|assert0044|assertEqual|actual', base.askedTimes)).assertEqual(traceParameter('com.samples.appstartupauto_PermissionPlanCases_0009|OnboardingCases.test.ets|assert0044|assertEqual|expected', 0));
      const denied: PermissionContext = afterAsk(base, false);
      expect(traceParameter('com.samples.appstartupauto_PermissionPlanCases_0009|OnboardingCases.test.ets|assert0045|assertEqual|actual', denied.state)).assertEqual(traceParameter('com.samples.appstartupauto_PermissionPlanCases_0009|OnboardingCases.test.ets|assert0045|assertEqual|expected', PermissionState.DENIED));
      const forever: PermissionContext = afterDontAskAgain(base);
      expect(traceParameter('com.samples.appstartupauto_PermissionPlanCases_0009|OnboardingCases.test.ets|assert0046|assertEqual|actual', forever.state)).assertEqual(traceParameter('com.samples.appstartupauto_PermissionPlanCases_0009|OnboardingCases.test.ets|assert0046|assertEqual|expected', PermissionState.DENIED_PERMANENTLY));
      expect(traceParameter('com.samples.appstartupauto_PermissionPlanCases_0009|OnboardingCases.test.ets|assert0047|assertTrue|actual|expected=true', planPermission(forever).needsSettings)).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_PERMISSIONPLANCASES_1000
     * @tc.name      testPermissionPlanCases0010
     * @tc.desc      Verify rule table is consistent
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it('testPermissionPlanCases0010', 0, (): void => {
      configureTestText();
      expect(traceParameter('com.samples.appstartupauto_PermissionPlanCases_0010|OnboardingCases.test.ets|assert0048|assertEqual|actual', PERMISSION_RULES.length)).assertEqual(traceParameter('com.samples.appstartupauto_PermissionPlanCases_0010|OnboardingCases.test.ets|assert0048|assertEqual|expected', 5));
      expect(traceParameter('com.samples.appstartupauto_PermissionPlanCases_0010|OnboardingCases.test.ets|assert0049|assertEqual|actual', permissionLines().length)).assertEqual(traceParameter('com.samples.appstartupauto_PermissionPlanCases_0010|OnboardingCases.test.ets|assert0049|assertEqual|expected', 5));
      expect(traceParameter('com.samples.appstartupauto_PermissionPlanCases_0010|OnboardingCases.test.ets|assert0050|assertTrue|actual|expected=true', auditPermissionRules().ok)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_PermissionPlanCases_0010|OnboardingCases.test.ets|assert0051|assertEqual|actual', auditPermissionRules().summary())).assertEqual(traceParameter('com.samples.appstartupauto_PermissionPlanCases_0010|OnboardingCases.test.ets|assert0051|assertEqual|expected', '权限规则表自洽'));
      PERMISSION_RULES.forEach((rule: PermissionRule): void => {
        expect(traceParameter('com.samples.appstartupauto_PermissionPlanCases_0010|OnboardingCases.test.ets|assert0052|assertTrue|actual|expected=true', rule.text().indexOf(rule.ruleId) === 0)).assertTrue();
        expect(traceParameter('com.samples.appstartupauto_PermissionPlanCases_0010|OnboardingCases.test.ets|assert0053|assertTrue|actual|expected=true', rule.maxApi >= rule.minApi)).assertTrue();
      });
      expect(traceParameter('com.samples.appstartupauto_PermissionPlanCases_0010|OnboardingCases.test.ets|assert0054|assertEqual|actual', permissionLabel(PermissionState.UNKNOWN))).assertEqual(traceParameter('com.samples.appstartupauto_PermissionPlanCases_0010|OnboardingCases.test.ets|assert0054|assertEqual|expected', '未知'));
      expect(traceParameter('com.samples.appstartupauto_PermissionPlanCases_0010|OnboardingCases.test.ets|assert0055|assertEqual|actual', permissionLabel(PermissionState.NOT_REQUIRED))).assertEqual(traceParameter('com.samples.appstartupauto_PermissionPlanCases_0010|OnboardingCases.test.ets|assert0055|assertEqual|expected', '无需授权'));
    });
  });
}
