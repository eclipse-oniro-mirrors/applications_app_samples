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
import { privacyModeMessageOf } from './model/UiExtensionLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_UIExtensionSamples]';
const BUNDLE: string = 'UIExtensionSamples_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for privacyModeMessageOf (2 cases). */
export default function privacyModeMessageOfTest(): void {
  describe('PrivacyModeMessageOfTest', () => {
    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_PRIVACY_MODE_MESSAGE_OF_0001
     * @tc.name      UIExtensionSamples_PrivacyModeMessageOf_0001
     * @tc.desc      privacyModeMessageOf(isPrivacyMode=true) returns "ack) called. isPrivacyMode: true"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_PrivacyModeMessageOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PrivacyModeMessageOf_0001 begin`);
      const actual: string = privacyModeMessageOf(true);
      logInfo(`privacyModeMessageOf(isPrivacyMode=true): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(84);
      logInfo(`privacyModeMessageOf(isPrivacyMode=true): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`privacyModeMessageOf(isPrivacyMode=true): actual.substring(52)=${actual.substring(52)}`);
      expect(actual.substring(52)).assertEqual('ack) called. isPrivacyMode: true');
      logInfo(`${BUNDLE}PrivacyModeMessageOf_0001 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_PRIVACY_MODE_MESSAGE_OF_0002
     * @tc.name      UIExtensionSamples_PrivacyModeMessageOf_0002
     * @tc.desc      privacyModeMessageOf(isPrivacyMode=false) returns "se) called. isPrivacyMode: false"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_PrivacyModeMessageOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PrivacyModeMessageOf_0002 begin`);
      const actual: string = privacyModeMessageOf(false);
      logInfo(`privacyModeMessageOf(isPrivacyMode=false): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(84);
      logInfo(`privacyModeMessageOf(isPrivacyMode=false): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`privacyModeMessageOf(isPrivacyMode=false): actual.substring(52)=${actual.substring(52)}`);
      expect(actual.substring(52)).assertEqual('se) called. isPrivacyMode: false');
      logInfo(`${BUNDLE}PrivacyModeMessageOf_0002 end`);
    });
  });
}
