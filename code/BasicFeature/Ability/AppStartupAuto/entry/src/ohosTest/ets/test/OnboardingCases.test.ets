import { describe, expect, it } from '@ohos/hypium';
import {
  PERMISSION_RULES, PermissionContext, PermissionDecision, PermissionRule, PermissionState,
  RequestPolicy, afterAsk, afterDontAskAgain, auditPermissionRules, permissionLabel, permissionLines,
  planPermission, policySeries
} from '../../../main/ets/autostart/permission/PermissionPlan';

function contextOf(api: number, asked: number, state: PermissionState): PermissionContext {
  return new PermissionContext(api, asked, state);
}

export default function onboardingCasesTest(): void {

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
      const granted: PermissionDecision = planPermission(
        contextOf(18, 0, PermissionState.GRANTED));
      expect(granted.policy).assertEqual(RequestPolicy.NO_REQUEST);
      expect(granted.canAsk).assertFalse();
      expect(granted.needsSettings).assertFalse();
      expect(granted.ruleId).assertEqual('PM-GRANTED');
      const notRequired: PermissionDecision = planPermission(
        contextOf(18, 0, PermissionState.NOT_REQUIRED));
      expect(notRequired.ruleId).assertEqual('PM-NOT-REQUIRED');
      expect(notRequired.state).assertEqual(PermissionState.NOT_REQUIRED);
      expect(permissionLabel(PermissionState.GRANTED)).assertEqual('已授权');
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
      const decision: PermissionDecision = planPermission(contextOf(8, 0, PermissionState.DENIED));
      expect(decision.ruleId).assertEqual('PM-0001');
      expect(decision.policy).assertEqual(RequestPolicy.NO_REQUEST);
      expect(decision.canAsk).assertFalse();
      expect(decision.needsSettings).assertFalse();
      expect(decision.message.indexOf('不支持') >= 0).assertTrue();
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
      const first: PermissionDecision = planPermission(contextOf(10, 0, PermissionState.DENIED));
      expect(first.ruleId).assertEqual('PM-0002');
      expect(first.canAsk).assertTrue();
      expect(first.needsSettings).assertFalse();
      const asked: PermissionContext = contextOf(10, 1, PermissionState.DENIED);
      asked.askedThisSession = true;
      const second: PermissionDecision = planPermission(asked);
      expect(second.canAsk).assertFalse();
      expect(second.needsSettings).assertTrue();
      expect(second.message.indexOf('系统设置') >= 0).assertTrue();
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
      expect(planPermission(contextOf(12, 0, PermissionState.DENIED)).ruleId).assertEqual('PM-0003');
      expect(planPermission(contextOf(14, 1, PermissionState.DENIED)).canAsk).assertTrue();
      const used: PermissionDecision = planPermission(contextOf(17, 2, PermissionState.DENIED));
      expect(used.canAsk).assertFalse();
      expect(used.needsSettings).assertTrue();
      expect(used.message.indexOf('已申请 2 次') >= 0).assertTrue();
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
      expect(planPermission(contextOf(18, 0, PermissionState.DENIED)).ruleId).assertEqual('PM-0004');
      expect(planPermission(contextOf(26, 2, PermissionState.DENIED)).canAsk).assertTrue();
      expect(planPermission(contextOf(26, 3, PermissionState.DENIED)).canAsk).assertFalse();
      const series: string[] = policySeries();
      expect(series.length).assertEqual(21);
      expect(series[0].indexOf('noRequest') > 0).assertTrue();
      expect(series[series.length - 1].indexOf('settingsOnly') > 0).assertTrue();
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
      const decision: PermissionDecision = planPermission(
        contextOf(18, 1, PermissionState.DENIED_PERMANENTLY));
      expect(decision.canAsk).assertFalse();
      expect(decision.needsSettings).assertTrue();
      expect(decision.state).assertEqual(PermissionState.DENIED_PERMANENTLY);
      expect(permissionLabel(PermissionState.DENIED_PERMANENTLY)).assertEqual('已永久拒绝');
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
      const context: PermissionContext = contextOf(20, 0, PermissionState.DENIED);
      context.systemDialogAvailable = false;
      const decision: PermissionDecision = planPermission(context);
      expect(decision.canAsk).assertFalse();
      expect(decision.needsSettings).assertTrue();
      expect(decision.hint.indexOf('systemDialogAvailable') >= 0).assertTrue();
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
      const decision: PermissionDecision = planPermission(contextOf(28, 0, PermissionState.DENIED));
      expect(decision.ruleId).assertEqual('PM-0005');
      expect(decision.policy).assertEqual(RequestPolicy.SETTINGS_ONLY);
      expect(decision.needsSettings).assertTrue();
      expect(decision.canAsk).assertFalse();
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
      const base: PermissionContext = contextOf(18, 0, PermissionState.DENIED);
      const granted: PermissionContext = afterAsk(base, true);
      expect(granted.state).assertEqual(PermissionState.GRANTED);
      expect(granted.askedTimes).assertEqual(1);
      expect(granted.askedThisSession).assertTrue();
      expect(base.askedTimes).assertEqual(0);
      const denied: PermissionContext = afterAsk(base, false);
      expect(denied.state).assertEqual(PermissionState.DENIED);
      const forever: PermissionContext = afterDontAskAgain(base);
      expect(forever.state).assertEqual(PermissionState.DENIED_PERMANENTLY);
      expect(planPermission(forever).needsSettings).assertTrue();
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
      expect(PERMISSION_RULES.length).assertEqual(5);
      expect(permissionLines().length).assertEqual(5);
      expect(auditPermissionRules().ok).assertTrue();
      expect(auditPermissionRules().summary()).assertEqual('权限规则表自洽');
      PERMISSION_RULES.forEach((rule: PermissionRule): void => {
        expect(rule.text().indexOf(rule.ruleId) === 0).assertTrue();
        expect(rule.maxApi >= rule.minApi).assertTrue();
      });
      expect(permissionLabel(PermissionState.UNKNOWN)).assertEqual('未知');
      expect(permissionLabel(PermissionState.NOT_REQUIRED)).assertEqual('无需授权');
    });
  });
}
