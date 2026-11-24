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

/** Logic checks for VerifyCodeState.deleteLeft (1 cases). */
export default function verifyCodeStateDeleteLeftTest(): void {
  describe('VerifyCodeStateDeleteLeftTest', () => {
    beforeEach(yieldToEventLoop);

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_STATE_DELETE_LEFT_0001
     * @tc.name      VerifyCode_VerifyCodeStateDeleteLeft_0001
     * @tc.desc      VerifyCodeState.deleteLeft() yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VerifyCode_VerifyCodeStateDeleteLeft_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VerifyCodeStateDeleteLeft_0001 begin`);
      const subject: VerifyCodeState = new VerifyCodeState();
      const actual: string = subject.deleteLeft();
      logInfo(`deleteLeft(): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}VerifyCodeStateDeleteLeft_0001 end`);
    });
  });
}
