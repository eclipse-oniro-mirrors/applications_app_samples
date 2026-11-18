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
import { UiExtensionPageState } from './model/UiExtensionLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_UIExtensionSamples]';
const BUNDLE: string = 'UIExtensionSamples_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for UiExtensionPageState.terminateWithResult (2 cases). */
export default function uiExtensionPageStateTerminateWithResultTest(): void {
  describe('UiExtensionPageStateTerminateWithResultTest', () => {
    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_TERMINATE_WITH_RESULT_0001
     * @tc.name      UIExtensionSamples_UiExtensionPageStateTerminateWithResult_0001
     * @tc.desc      UiExtensionPageState.terminateWithResult(usePromise=true) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_UiExtensionPageStateTerminateWithResult_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      () => {
      logInfo(`${BUNDLE}UiExtensionPageStateTerminateWithResult_0001 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: number = subject.terminateWithResult(true);
      logInfo(`terminateWithResult(usePromise=true): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`terminateWithResult(usePromise=true) state: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`terminateWithResult(usePromise=true) state: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(100);
      logInfo(`${BUNDLE}UiExtensionPageStateTerminateWithResult_0001 end`);
      });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_TERMINATE_WITH_RESULT_0002
     * @tc.name      UIExtensionSamples_UiExtensionPageStateTerminateWithResult_0002
     * @tc.desc      UiExtensionPageState.terminateWithResult(usePromise=false) yields 99
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_UiExtensionPageStateTerminateWithResult_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      () => {
      logInfo(`${BUNDLE}UiExtensionPageStateTerminateWithResult_0002 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: number = subject.terminateWithResult(false);
      logInfo(`terminateWithResult(usePromise=false): actual=${actual}`);
      expect(actual).assertEqual(99);
      logInfo(`terminateWithResult(usePromise=false) state: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`terminateWithResult(usePromise=false) state: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(99);
      logInfo(`${BUNDLE}UiExtensionPageStateTerminateWithResult_0002 end`);
      });
  });
}
