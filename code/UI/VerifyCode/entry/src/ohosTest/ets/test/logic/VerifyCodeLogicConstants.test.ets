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
import { CODE_INDEXES, VERIFY_CODE_LENGTH } from '../model/VerifyCodeLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_VerifyCode]';
const BUNDLE: string = 'VerifyCode_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for VerifyCodeLogic (2 cases). */
export default function verifyCodeLogicConstantsTest(): void {
  describe('VerifyCodeLogicConstantsTest', () => {
    beforeEach(yieldToEventLoop);

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_LOGIC_CONSTANTS_0001
     * @tc.name      VerifyCode_VerifyCodeLogicConstants_0001
     * @tc.desc      VERIFY_CODE_LENGTH keeps value 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VerifyCode_VerifyCodeLogicConstants_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VerifyCodeLogicConstants_0001 begin`);
      const actual: number = VERIFY_CODE_LENGTH;
      logInfo(`VERIFY_CODE_LENGTH: actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}VerifyCodeLogicConstants_0001 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_VERIFY_CODE_LOGIC_CONSTANTS_0002
     * @tc.name      VerifyCode_VerifyCodeLogicConstants_0002
     * @tc.desc      CODE_INDEXES keeps value [0,1,2,3,4,5]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VerifyCode_VerifyCodeLogicConstants_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VerifyCodeLogicConstants_0002 begin`);
      const actual: number[] = CODE_INDEXES;
      logInfo(`CODE_INDEXES: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`CODE_INDEXES: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[0,1,2,3,4,5]');
      logInfo(`${BUNDLE}VerifyCodeLogicConstants_0002 end`);
    });
  });
}
