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

/** Logic checks for UiExtensionPageState.setPrivacyMode (2 cases). */
export default function uiExtensionPageStateSetPrivacyModeTest(): void {
  describe('UiExtensionPageStateSetPrivacyModeTest', () => {
    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_SET_PRIVACY_MODE_0001
     * @tc.name      UIExtensionSamples_UiExtensionPageStateSetPrivacyMode_0001
     * @tc.desc      UiExtensionPageState.setPrivacyMode(isPrivacyMode=true) yields len84
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_UiExtensionPageStateSetPrivacyMode_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      () => {
      logInfo(`${BUNDLE}UiExtensionPageStateSetPrivacyMode_0001 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.setPrivacyMode(true);
      logInfo(`setPrivacyMode(isPrivacyMode=true): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(84);
      logInfo(`setPrivacyMode(isPrivacyMode=true): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`setPrivacyMode(isPrivacyMode=true): actual.substring(52)=${actual.substring(52)}`);
      expect(actual.substring(52)).assertEqual('ack) called. isPrivacyMode: true');
      logInfo(`setPrivacyMode(isPrivacyMode=true) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(84);
      logInfo(`setPrivacyMode(isPrivacyMode=true) state: subject.lastMessag...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`setPrivacyMode(isPrivacyMode=true) state: subject.lastMessage.s...${subject.lastMessage.substring(52)}`);
      expect(subject.lastMessage.substring(52)).assertEqual('ack) called. isPrivacyMode: true');
      logInfo(`setPrivacyMode(isPrivacyMode=true) state: subject.privacyMode=${subject.privacyMode}`);
      expect(subject.privacyMode).assertTrue();
      logInfo(`${BUNDLE}UiExtensionPageStateSetPrivacyMode_0001 end`);
      });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_SET_PRIVACY_MODE_0002
     * @tc.name      UIExtensionSamples_UiExtensionPageStateSetPrivacyMode_0002
     * @tc.desc      UiExtensionPageState.setPrivacyMode(isPrivacyMode=false) yields len84
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_UiExtensionPageStateSetPrivacyMode_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      () => {
      logInfo(`${BUNDLE}UiExtensionPageStateSetPrivacyMode_0002 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.setPrivacyMode(false);
      logInfo(`setPrivacyMode(isPrivacyMode=false): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(84);
      logInfo(`setPrivacyMode(isPrivacyMode=false): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`setPrivacyMode(isPrivacyMode=false): actual.substring(52)=${actual.substring(52)}`);
      expect(actual.substring(52)).assertEqual('se) called. isPrivacyMode: false');
      logInfo(`setPrivacyMode(isPrivacyMode=false) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(84);
      logInfo(`setPrivacyMode(isPrivacyMode=false) state: subject.lastMessa...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`setPrivacyMode(isPrivacyMode=false) state: subject.lastMessage....${subject.lastMessage.substring(52)}`);
      expect(subject.lastMessage.substring(52)).assertEqual('se) called. isPrivacyMode: false');
      logInfo(`${BUNDLE}UiExtensionPageStateSetPrivacyMode_0002 end`);
      });
  });
}
