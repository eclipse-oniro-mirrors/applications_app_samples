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
import { backActionOf } from '../model/VerifyCodeLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_VerifyCode]';
const BUNDLE: string = 'VerifyCode_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for backActionOf (2 cases). */
export default function backActionOfTest(): void {
  describe('BackActionOfTest', () => {
    beforeEach(yieldToEventLoop);

    /**
     * @tc.number    SUB_VERIFYCODE_BACK_ACTION_OF_0001
     * @tc.name      VerifyCode_BackActionOf_0001
     * @tc.desc      backActionOf(isKeyboardShow=true) returns "hideKeyboard"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VerifyCode_BackActionOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}BackActionOf_0001 begin`);
      const actual: string = backActionOf(true);
      logInfo(`backActionOf(isKeyboardShow=true): actual=${actual}`);
      expect(actual).assertEqual('hideKeyboard');
      logInfo(`${BUNDLE}BackActionOf_0001 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_BACK_ACTION_OF_0002
     * @tc.name      VerifyCode_BackActionOf_0002
     * @tc.desc      backActionOf(isKeyboardShow=false) returns "popRouter"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VerifyCode_BackActionOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}BackActionOf_0002 begin`);
      const actual: string = backActionOf(false);
      logInfo(`backActionOf(isKeyboardShow=false): actual=${actual}`);
      expect(actual).assertEqual('popRouter');
      logInfo(`${BUNDLE}BackActionOf_0002 end`);
    });
  });
}
