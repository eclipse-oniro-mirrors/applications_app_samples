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
import { TerminateResult, terminateResultOf } from './model/UiExtensionLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_UIExtensionSamples]';
const BUNDLE: string = 'UIExtensionSamples_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for terminateResultOf (4 cases). */
export default function terminateResultOfTest(): void {
  describe('TerminateResultOfTest', () => {
    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_TERMINATE_RESULT_OF_0001
     * @tc.name      UIExtensionSamples_TerminateResultOf_0001
     * @tc.desc      terminateResultOf(usePromise=true, hasWant=true) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_TerminateResultOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TerminateResultOf_0001 begin`);
      const actual: TerminateResult = terminateResultOf(true, true);
      logInfo(`terminateResultOf(usePromise=true, hasWan...: actual.resultCode=${actual.resultCode}`);
      expect(actual.resultCode).assertEqual(100);
      logInfo(`terminateResultOf(usePromise=true, hasWan...: actual.hasWant=${actual.hasWant}`);
      expect(actual.hasWant).assertTrue();
      logInfo(`${BUNDLE}TerminateResultOf_0001 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_TERMINATE_RESULT_OF_0002
     * @tc.name      UIExtensionSamples_TerminateResultOf_0002
     * @tc.desc      terminateResultOf(usePromise=true, hasWant=false) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_TerminateResultOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TerminateResultOf_0002 begin`);
      const actual: TerminateResult = terminateResultOf(true, false);
      logInfo(`terminateResultOf(usePromise=true, hasWan...: actual.resultCode=${actual.resultCode}`);
      expect(actual.resultCode).assertEqual(100);
      logInfo(`terminateResultOf(usePromise=true, hasWan...: actual.hasWant=${actual.hasWant}`);
      expect(actual.hasWant).assertFalse();
      logInfo(`${BUNDLE}TerminateResultOf_0002 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_TERMINATE_RESULT_OF_0003
     * @tc.name      UIExtensionSamples_TerminateResultOf_0003
     * @tc.desc      terminateResultOf(usePromise=false, hasWant=true) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_TerminateResultOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TerminateResultOf_0003 begin`);
      const actual: TerminateResult = terminateResultOf(false, true);
      logInfo(`terminateResultOf(usePromise=false, hasWa...: actual.resultCode=${actual.resultCode}`);
      expect(actual.resultCode).assertEqual(99);
      logInfo(`terminateResultOf(usePromise=false, hasWa...: actual.hasWant=${actual.hasWant}`);
      expect(actual.hasWant).assertTrue();
      logInfo(`${BUNDLE}TerminateResultOf_0003 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_TERMINATE_RESULT_OF_0004
     * @tc.name      UIExtensionSamples_TerminateResultOf_0004
     * @tc.desc      terminateResultOf(usePromise=false, hasWant=false) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_TerminateResultOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TerminateResultOf_0004 begin`);
      const actual: TerminateResult = terminateResultOf(false, false);
      logInfo(`terminateResultOf(usePromise=false, hasWa...: actual.resultCode=${actual.resultCode}`);
      expect(actual.resultCode).assertEqual(99);
      logInfo(`terminateResultOf(usePromise=false, hasWa...: actual.hasWant=${actual.hasWant}`);
      expect(actual.hasWant).assertFalse();
      logInfo(`${BUNDLE}TerminateResultOf_0004 end`);
    });
  });
}
