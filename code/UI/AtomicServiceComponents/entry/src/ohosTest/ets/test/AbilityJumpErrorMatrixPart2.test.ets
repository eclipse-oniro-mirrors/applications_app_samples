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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { delayTick } from './shared/AsyncYield';
import { JumpState, SELF_BUNDLE_NAME, jumpTargetByKey, jumpStateName, jumpErrorHint, describeJumpResult, beginAttempt, isActiveAttempt } from '../../../main/ets/model/AbilityJump';

import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF816;
const TAG: string = '[Sample_AtomicService]';

export default function AbilityJumpErrorMatrixPart2Test(): void {
  describe('AbilityJumpErrorMatrixPart2', () => {

    /**
     * @tc.number    SUB_ATOMIC_AJEP2_4100
     * @tc.name      testJumpActive0041
     * @tc.desc      Verify isActiveAttempt(1, 1) is True.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testJumpActive0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJumpActive0041 begin');
      await delayTick();
      expect(isActiveAttempt(1, 1)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJumpActive0041 end');
    })

  })
}
