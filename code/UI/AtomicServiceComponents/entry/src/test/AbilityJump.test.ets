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
// AbilityJump 单测：目标清单、状态文案、错误码提示、attempt token 与结果描述。
// 这三个分支分别对应 startAbility 成功、拒绝（16000001 等）与 3 秒超时，纯函数保证文案与判定可测。

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
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
    it('jumpTargets_shape', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
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
    it('jumpTargetByKey_knownAndUnknown', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(jumpTargetByKey('settings') === JUMP_TARGETS[0]).assertTrue();
      expect(jumpTargetByKey('missing')?.abilityName).assertEqual('EntryAbility');
      expect(jumpTargetByKey('unknown')).assertNull();
      expect(jumpTargetByKey('')).assertNull();
    });

    // describe 拼接 bundleName/abilityName
    it('jumpTarget_describe', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(JUMP_TARGETS[2].describe()).assertEqual('com.samples.not.installed/EntryAbility');
    });

    // 状态文案：五种状态各有中文描述
    it('jumpStateName_all', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(jumpStateName(JumpState.IDLE)).assertEqual('Idle');
      expect(jumpStateName(JumpState.WAITING)).assertEqual('Waiting for target');
      expect(jumpStateName(JumpState.SUCCESS)).assertEqual('Launched');
      expect(jumpStateName(JumpState.REJECTED)).assertEqual('Launch rejected');
      expect(jumpStateName(JumpState.TIMEOUT)).assertEqual('Timed out');
    });

    // 错误码提示：已覆盖 16000001 / 16000004 / 16000019 / 201，未知码给出兜底
    it('jumpErrorHint_knownCodes', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(jumpErrorHint(16000001).includes('not found')).assertTrue();
      expect(jumpErrorHint(16000004).includes('not visible')).assertTrue();
      expect(jumpErrorHint(16000019).includes('No matching')).assertTrue();
      expect(jumpErrorHint(201).includes('permission')).assertTrue();
      expect(jumpErrorHint(16000050).includes('Try again later')).assertTrue();
      expect(jumpErrorHint(999).includes('bundleName')).assertTrue();
    });

    // 结果描述：有错误码带方括号，无错误码只保留消息，空消息回落未知错误
    it('describeJumpResult_formats', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(describeJumpResult(16000001, 'ability not exist')).assertEqual('[16000001] ability not exist');
      expect(describeJumpResult(0, 'timed out')).assertEqual('timed out');
      expect(describeJumpResult(0, '')).assertEqual('Unknown error');
    });

    // attempt token 单调递增，只有当前 token 的结果会被采纳
    it('attemptToken_guards', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(beginAttempt(0)).assertEqual(1);
      expect(beginAttempt(7)).assertEqual(8);
      expect(isActiveAttempt(3, 3)).assertTrue();
      expect(isActiveAttempt(2, 3)).assertFalse();
      expect(isActiveAttempt(0, -1)).assertFalse();
    });
  });
}
