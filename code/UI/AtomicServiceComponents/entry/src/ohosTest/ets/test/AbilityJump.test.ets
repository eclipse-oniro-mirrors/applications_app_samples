import { describe, it, expect } from '@ohos/hypium';
import {
  JUMP_TARGETS,
  JumpState,
  JumpTarget,
  SELF_BUNDLE_NAME,
  beginAttempt,
  describeJumpResult,
  isActiveAttempt,
  jumpErrorHint,
  jumpStateName,
  jumpTargetByKey
} from '../../../main/ets/model/AbilityJump';
import { JUMP_TIMEOUT_MS, RouteKey, isRouteKey } from '../../../main/ets/common/AppConstants';
import { DEMO_ITEMS } from '../../../main/ets/model/DemoLogic';

export default function abilityJumpTest() {
  describe('abilityJumpTest', () => {

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_ABILITYJUMP_0100
     * @tc.name jumpTargetsShape001
     * @tc.desc Verify the jump catalog has three unique targets with bundle and ability names
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('jumpTargets_shape', 0, () => {
      expect(JUMP_TARGETS.length).assertEqual(3);
      const keys: string[] = JUMP_TARGETS.map((target: JumpTarget) => target.key);
      for (const key of keys) {
        expect(keys.indexOf(key)).assertEqual(keys.lastIndexOf(key));
      }
      for (const target of JUMP_TARGETS) {
        expect(target.bundleName.length > 0).assertTrue();
        expect(target.abilityName.length > 0).assertTrue();
        expect(target.describe().includes('/')).assertTrue();
      }
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_ABILITYJUMP_0200
     * @tc.name jumpTargetSelfBundle002
     * @tc.desc Verify the self target resolves to the sample bundle name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('jumpTarget_selfBundle', 0, () => {
      expect(SELF_BUNDLE_NAME).assertEqual('com.samples.atomicservicecomponents');
      expect(jumpTargetByKey('self')?.bundleName).assertEqual(SELF_BUNDLE_NAME);
      expect(jumpTargetByKey('missing')?.bundleName).assertEqual('com.samples.not.installed');
      expect(jumpTargetByKey('unknown')).assertNull();
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_ABILITYJUMP_0300
     * @tc.name jumpStateNames003
     * @tc.desc Verify all five jump states map to readable Chinese names
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('jumpState_names', 0, () => {
      expect(jumpStateName(JumpState.IDLE)).assertEqual('待发起');
      expect(jumpStateName(JumpState.WAITING)).assertEqual('等待目标响应');
      expect(jumpStateName(JumpState.SUCCESS)).assertEqual('已拉起');
      expect(jumpStateName(JumpState.REJECTED)).assertEqual('拉起被拒绝');
      expect(jumpStateName(JumpState.TIMEOUT)).assertEqual('等待超时');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_ABILITYJUMP_0400
     * @tc.name jumpErrorHintMissingAbility004
     * @tc.desc Verify the 16000001 hint explains the target ability is missing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('jumpErrorHint_missingAbility', 0, () => {
      expect(jumpErrorHint(16000001).includes('不存在')).assertTrue();
      expect(jumpErrorHint(16000001).includes('安装')).assertTrue();
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_ABILITYJUMP_0500
     * @tc.name jumpErrorHintOtherCodes005
     * @tc.desc Verify visibility, invalid want, no-match, internal and permission hints, plus the fallback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('jumpErrorHint_otherCodes', 0, () => {
      expect(jumpErrorHint(16000004).includes('不可见')).assertTrue();
      expect(jumpErrorHint(16000011).includes('参数无效')).assertTrue();
      expect(jumpErrorHint(16000019).includes('没有匹配')).assertTrue();
      expect(jumpErrorHint(16000050).includes('稍后重试')).assertTrue();
      expect(jumpErrorHint(201).includes('权限')).assertTrue();
      expect(jumpErrorHint(999).includes('bundleName')).assertTrue();
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_ABILITYJUMP_0600
     * @tc.name describeJumpResultFormats006
     * @tc.desc Verify result descriptions keep the code only when positive and fall back on empty messages
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('describeJumpResult_formats', 0, () => {
      expect(describeJumpResult(16000050, 'internal error')).assertEqual('[16000050] internal error');
      expect(describeJumpResult(0, 'timed out')).assertEqual('timed out');
      expect(describeJumpResult(0, '')).assertEqual('未知错误');
      expect(describeJumpResult(-1, 'weird')).assertEqual('weird');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_ABILITYJUMP_0700
     * @tc.name attemptTokenGuards007
     * @tc.desc Verify attempt tokens increase by one and only the active token is accepted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('attemptToken_guards', 0, () => {
      expect(beginAttempt(0)).assertEqual(1);
      expect(beginAttempt(9)).assertEqual(10);
      expect(isActiveAttempt(4, 4)).assertTrue();
      expect(isActiveAttempt(3, 4)).assertFalse();
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_ABILITYJUMP_0800
     * @tc.name jumpTimeoutConstant008
     * @tc.desc Verify the jump timeout constant is three seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('jumpTimeout_constant', 0, () => {
      expect(JUMP_TIMEOUT_MS).assertEqual(3000);
      expect(JUMP_TIMEOUT_MS / 1000).assertEqual(3);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_ABILITYJUMP_0900
     * @tc.name jumpRouteRegistered009
     * @tc.desc Verify the jump route key is registered and exposed in the home catalog
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('jumpRoute_registered', 0, () => {
      expect(RouteKey.JUMP).assertEqual('jump');
      expect(isRouteKey(RouteKey.JUMP)).assertTrue();
      const keys: string[] = DEMO_ITEMS.map((item) => item.key);
      expect(keys.includes(RouteKey.JUMP)).assertTrue();
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_ABILITYJUMP_1000
     * @tc.name jumpTargetsDistinct010
     * @tc.desc Verify every jump target points at a distinct bundle/ability pair
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('jumpTargets_distinct', 0, () => {
      const describes: string[] = JUMP_TARGETS.map((target: JumpTarget) => target.describe());
      for (const value of describes) {
        expect(describes.indexOf(value)).assertEqual(describes.lastIndexOf(value));
      }
      expect(JUMP_TARGETS[0].describe()).assertEqual('com.ohos.settings/com.ohos.settings.MainAbility');
    });
  });
}
