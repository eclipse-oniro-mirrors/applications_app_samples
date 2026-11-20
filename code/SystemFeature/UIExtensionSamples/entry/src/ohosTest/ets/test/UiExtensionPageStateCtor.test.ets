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

/** Logic checks for new UiExtensionPageState (1 cases). */
export default function uiExtensionPageStateCtorTest(): void {
  describe('UiExtensionPageStateCtorTest', () => {
    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_CTOR_0001
     * @tc.name      UIExtensionSamples_UiExtensionPageStateCtor_0001
     * @tc.desc      new UiExtensionPageState() initialises 6 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_UiExtensionPageStateCtor_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateCtor_0001 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      logInfo(`new UiExtensionPageState(): subject.route=${subject.route}`);
      expect(subject.route).assertEqual('');
      logInfo(`new UiExtensionPageState(): subject.lastMessage=${subject.lastMessage}`);
      expect(subject.lastMessage).assertEqual('');
      logInfo(`new UiExtensionPageState(): subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertFalse();
      logInfo(`new UiExtensionPageState(): subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(-1);
      logInfo(`new UiExtensionPageState(): subject.privacyMode=${subject.privacyMode}`);
      expect(subject.privacyMode).assertFalse();
      logInfo(`new UiExtensionPageState(): subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(0);
      logInfo(`${BUNDLE}UiExtensionPageStateCtor_0001 end`);
    });
  });
}
