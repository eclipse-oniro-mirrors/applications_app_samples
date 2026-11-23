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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { KeyboardAvoidState } from '../model/KeyboardAvoidLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_KeyboardAvoid]';
const BUNDLE: string = 'KeyboardAvoid_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for new KeyboardAvoidState (1 cases). */
export default function keyboardAvoidStateCtorTest(): void {
  describe('KeyboardAvoidStateCtorTest', (): void => {
    /**
     * @tc.number    SUB_KEYBOARDAVOID_KEYBOARD_AVOID_STATE_CTOR_0001
     * @tc.name      KeyboardAvoid_KeyboardAvoidStateCtor_0001
     * @tc.desc      new KeyboardAvoidState() initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('KeyboardAvoid_KeyboardAvoidStateCtor_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}KeyboardAvoidStateCtor_0001 begin`);
      const subject: KeyboardAvoidState = new KeyboardAvoidState();
      logInfo(`new KeyboardAvoidState(): subject.keyboardHeight=${subject.keyboardHeight}`);
      expect(subject.keyboardHeight).assertEqual(0);
      logInfo(`new KeyboardAvoidState(): subject.isLiftUpShow=${subject.isLiftUpShow}`);
      expect(subject.isLiftUpShow).assertTrue();
      logInfo(`new KeyboardAvoidState(): subject.isScalingShow=${subject.isScalingShow}`);
      expect(subject.isScalingShow).assertFalse();
      logInfo(`new KeyboardAvoidState(): subject.avoidAreaBottom=${subject.avoidAreaBottom}`);
      expect(subject.avoidAreaBottom).assertEqual(0);
      logInfo(`new KeyboardAvoidState(): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(3);
      logInfo(`${BUNDLE}KeyboardAvoidStateCtor_0001 end`);
    });
  });
}
