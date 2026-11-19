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
import { ThrottleGate } from '../model/TitleExpansionLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ExpandTitle]';
const BUNDLE: string = 'ExpandTitle_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for new ThrottleGate (1 cases). */
export default function throttleGateCtorTest(): void {
  describe('ThrottleGateCtorTest', () => {
    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_CTOR_0001
     * @tc.name      ExpandTitle_ThrottleGateCtor_0001
     * @tc.desc      new ThrottleGate() initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ExpandTitle_ThrottleGateCtor_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ThrottleGateCtor_0001 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      logInfo(`new ThrottleGate(): subject.open=${subject.open}`);
      expect(subject.open).assertTrue();
      logInfo(`new ThrottleGate(): subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(0);
      logInfo(`new ThrottleGate(): subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(0);
      logInfo(`new ThrottleGate(): subject.blocked=${subject.blocked}`);
      expect(subject.blocked).assertEqual(0);
      logInfo(`${BUNDLE}ThrottleGateCtor_0001 end`);
    });
  });
}
