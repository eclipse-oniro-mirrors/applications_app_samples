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

import { beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { yieldToEventLoop } from '../TestExecution';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { VerifyCodeState } from '../model/VerifyCodeLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_VerifyCode]';
const BUNDLE: string = 'VerifyCode_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for new VerifyCodeState (1 cases). */
export default function verifyCodeStateCtorTest(): void {
  describe('VerifyCodeStateCtorTest', () => {
    beforeEach(yieldToEventLoop);

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_CTOR_0001
     * @tc.name      VerifyCode_VerifyCodeStateCtor_0001
     * @tc.desc      new VerifyCodeState() initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VerifyCode_VerifyCodeStateCtor_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VerifyCodeStateCtor_0001 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      logInfo(`new VerifyCodeState(): subject.codeText=${subject.codeText}`);
      expect(subject.codeText).assertEqual('');
      logInfo(`new VerifyCodeState(): subject.isKeyboardShow=${subject.isKeyboardShow}`);
      expect(subject.isKeyboardShow).assertFalse();
      logInfo(`new VerifyCodeState(): subject.isListen=${subject.isListen}`);
      expect(subject.isListen).assertFalse();
      logInfo(`new VerifyCodeState(): subject.completed=${subject.completed}`);
      expect(subject.completed).assertEqual(0);
      logInfo(`new VerifyCodeState(): subject.rejected=${subject.rejected}`);
      expect(subject.rejected).assertEqual(0);
      logInfo(`${BUNDLE}VerifyCodeStateCtor_0001 end`);
    });
  });
}
