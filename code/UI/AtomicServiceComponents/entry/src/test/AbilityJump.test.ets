// AbilityJump 单测：目标清单、状态文案、错误码提示、attempt token 与结果描述。
// 这三个分支分别对应 startAbility 成功、拒绝（16000001 等）与 3 秒超时，纯函数保证文案与判定可测。

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
} from '../main/ets/model/AbilityJump';

export default function abilityJumpTest() {
  describe('AbilityJumpTest', () => {
    // 目标清单：三个目标、key 唯一、字段非空，本应用目标使用自身 bundleName
    it('jumpTargets_shape', 0, () => {
      expect(JUMP_TARGETS.length).assertEqual(3);
      const keys: string[] = JUMP_TARGETS.map((target: JumpTarget) => target.key);
      for (const key of keys) {
        expect(keys.indexOf(key)).assertEqual(keys.lastIndexOf(key));
      }
      for (const target of JUMP_TARGETS) {
        expect(target.title.length > 0).assertTrue();
        expect(target.bundleName.length > 0).assertTrue();
        expect(target.abilityName.length > 0).assertTrue();
        expect(target.expectation.length > 0).assertTrue();
      }
      expect(jumpTargetByKey('self')?.bundleName).assertEqual(SELF_BUNDLE_NAME);
    });

    // 目标查找：命中返回同一实例，未知 key 返回 null
    it('jumpTargetByKey_knownAndUnknown', 0, () => {
      expect(jumpTargetByKey('settings') === JUMP_TARGETS[0]).assertTrue();
      expect(jumpTargetByKey('missing')?.abilityName).assertEqual('EntryAbility');
      expect(jumpTargetByKey('unknown')).assertNull();
      expect(jumpTargetByKey('')).assertNull();
    });

    // describe 拼接 bundleName/abilityName
    it('jumpTarget_describe', 0, () => {
      expect(JUMP_TARGETS[2].describe()).assertEqual('com.samples.not.installed/EntryAbility');
    });

    // 状态文案：五种状态各有中文描述
    it('jumpStateName_all', 0, () => {
      expect(jumpStateName(JumpState.IDLE)).assertEqual('待发起');
      expect(jumpStateName(JumpState.WAITING)).assertEqual('等待目标响应');
      expect(jumpStateName(JumpState.SUCCESS)).assertEqual('已拉起');
      expect(jumpStateName(JumpState.REJECTED)).assertEqual('拉起被拒绝');
      expect(jumpStateName(JumpState.TIMEOUT)).assertEqual('等待超时');
    });

    // 错误码提示：已覆盖 16000001 / 16000004 / 16000019 / 201，未知码给出兜底
    it('jumpErrorHint_knownCodes', 0, () => {
      expect(jumpErrorHint(16000001).includes('不存在')).assertTrue();
      expect(jumpErrorHint(16000004).includes('不可见')).assertTrue();
      expect(jumpErrorHint(16000019).includes('没有匹配')).assertTrue();
      expect(jumpErrorHint(201).includes('权限')).assertTrue();
      expect(jumpErrorHint(16000050).includes('稍后重试')).assertTrue();
      expect(jumpErrorHint(999).includes('bundleName')).assertTrue();
    });

    // 结果描述：有错误码带方括号，无错误码只保留消息，空消息回落未知错误
    it('describeJumpResult_formats', 0, () => {
      expect(describeJumpResult(16000001, 'ability not exist')).assertEqual('[16000001] ability not exist');
      expect(describeJumpResult(0, 'timed out')).assertEqual('timed out');
      expect(describeJumpResult(0, '')).assertEqual('未知错误');
    });

    // attempt token 单调递增，只有当前 token 的结果会被采纳
    it('attemptToken_guards', 0, () => {
      expect(beginAttempt(0)).assertEqual(1);
      expect(beginAttempt(7)).assertEqual(8);
      expect(isActiveAttempt(3, 3)).assertTrue();
      expect(isActiveAttempt(2, 3)).assertFalse();
      expect(isActiveAttempt(0, -1)).assertFalse();
    });
  });
}
