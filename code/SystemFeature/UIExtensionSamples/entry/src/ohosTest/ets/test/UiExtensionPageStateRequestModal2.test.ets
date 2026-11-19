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

/** Logic checks for UiExtensionPageState.requestModal (9 cases). */
export default function uiExtensionPageStateRequestModal2Test(): void {
  describe('UiExtensionPageStateRequestModal2Test', () => {
    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REQUEST_MODAL_0052
     * @tc.name      UIExtensionSamples_UiExtensionPageStateRequestModal_0052
     * @tc.desc      UiExtensionPageState.requestModal(useSession=false, code=325) yields len81
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateRequestModal_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0052 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.requestModal(false, 325);
      logInfo(`requestModal(useSession=false, code=325): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(81);
      logInfo(`requestModal(useSession=false, code=325): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=false, code=325): actual.substring(49)=${actual.substring(49)}`);
      expect(actual.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`requestModal(useSession=false, code=325) ...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(81);
      logInfo(`requestModal(useSession=false, code=325) ...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=false, code=325) ...: subject.lastMessa...${subject.lastMessage.substring(49)}`);
      expect(subject.lastMessage.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`requestModal(useSession=false, code=325) ...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0052 end`);
      });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REQUEST_MODAL_0053
     * @tc.name      UIExtensionSamples_UiExtensionPageStateRequestModal_0053
     * @tc.desc      UiExtensionPageState.requestModal(useSession=false, code=350) yields len81
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateRequestModal_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0053 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.requestModal(false, 350);
      logInfo(`requestModal(useSession=false, code=350): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(81);
      logInfo(`requestModal(useSession=false, code=350): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=false, code=350): actual.substring(49)=${actual.substring(49)}`);
      expect(actual.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`requestModal(useSession=false, code=350) ...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(81);
      logInfo(`requestModal(useSession=false, code=350) ...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=false, code=350) ...: subject.lastMessa...${subject.lastMessage.substring(49)}`);
      expect(subject.lastMessage.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`requestModal(useSession=false, code=350) ...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0053 end`);
      });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REQUEST_MODAL_0054
     * @tc.name      UIExtensionSamples_UiExtensionPageStateRequestModal_0054
     * @tc.desc      UiExtensionPageState.requestModal(useSession=false, code=375) yields len81
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateRequestModal_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0054 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.requestModal(false, 375);
      logInfo(`requestModal(useSession=false, code=375): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(81);
      logInfo(`requestModal(useSession=false, code=375): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=false, code=375): actual.substring(49)=${actual.substring(49)}`);
      expect(actual.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`requestModal(useSession=false, code=375) ...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(81);
      logInfo(`requestModal(useSession=false, code=375) ...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=false, code=375) ...: subject.lastMessa...${subject.lastMessage.substring(49)}`);
      expect(subject.lastMessage.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`requestModal(useSession=false, code=375) ...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0054 end`);
      });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REQUEST_MODAL_0055
     * @tc.name      UIExtensionSamples_UiExtensionPageStateRequestModal_0055
     * @tc.desc      UiExtensionPageState.requestModal(useSession=false, code=400) yields len81
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateRequestModal_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0055 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.requestModal(false, 400);
      logInfo(`requestModal(useSession=false, code=400): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(81);
      logInfo(`requestModal(useSession=false, code=400): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=false, code=400): actual.substring(49)=${actual.substring(49)}`);
      expect(actual.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`requestModal(useSession=false, code=400) ...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(81);
      logInfo(`requestModal(useSession=false, code=400) ...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=false, code=400) ...: subject.lastMessa...${subject.lastMessage.substring(49)}`);
      expect(subject.lastMessage.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`requestModal(useSession=false, code=400) ...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0055 end`);
      });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REQUEST_MODAL_0056
     * @tc.name      UIExtensionSamples_UiExtensionPageStateRequestModal_0056
     * @tc.desc      UiExtensionPageState.requestModal(useSession=false, code=425) yields len81
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateRequestModal_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0056 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.requestModal(false, 425);
      logInfo(`requestModal(useSession=false, code=425): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(81);
      logInfo(`requestModal(useSession=false, code=425): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=false, code=425): actual.substring(49)=${actual.substring(49)}`);
      expect(actual.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`requestModal(useSession=false, code=425) ...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(81);
      logInfo(`requestModal(useSession=false, code=425) ...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=false, code=425) ...: subject.lastMessa...${subject.lastMessage.substring(49)}`);
      expect(subject.lastMessage.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`requestModal(useSession=false, code=425) ...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0056 end`);
      });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REQUEST_MODAL_0057
     * @tc.name      UIExtensionSamples_UiExtensionPageStateRequestModal_0057
     * @tc.desc      UiExtensionPageState.requestModal(useSession=false, code=450) yields len81
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateRequestModal_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0057 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.requestModal(false, 450);
      logInfo(`requestModal(useSession=false, code=450): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(81);
      logInfo(`requestModal(useSession=false, code=450): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=false, code=450): actual.substring(49)=${actual.substring(49)}`);
      expect(actual.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`requestModal(useSession=false, code=450) ...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(81);
      logInfo(`requestModal(useSession=false, code=450) ...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=false, code=450) ...: subject.lastMessa...${subject.lastMessage.substring(49)}`);
      expect(subject.lastMessage.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`requestModal(useSession=false, code=450) ...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0057 end`);
      });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REQUEST_MODAL_0058
     * @tc.name      UIExtensionSamples_UiExtensionPageStateRequestModal_0058
     * @tc.desc      UiExtensionPageState.requestModal(useSession=false, code=475) yields len81
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateRequestModal_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0058 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.requestModal(false, 475);
      logInfo(`requestModal(useSession=false, code=475): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(81);
      logInfo(`requestModal(useSession=false, code=475): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=false, code=475): actual.substring(49)=${actual.substring(49)}`);
      expect(actual.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`requestModal(useSession=false, code=475) ...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(81);
      logInfo(`requestModal(useSession=false, code=475) ...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=false, code=475) ...: subject.lastMessa...${subject.lastMessage.substring(49)}`);
      expect(subject.lastMessage.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`requestModal(useSession=false, code=475) ...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0058 end`);
      });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REQUEST_MODAL_0059
     * @tc.name      UIExtensionSamples_UiExtensionPageStateRequestModal_0059
     * @tc.desc      UiExtensionPageState.requestModal(useSession=false, code=861) yields len81
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateRequestModal_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0059 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.requestModal(false, 861);
      logInfo(`requestModal(useSession=false, code=861): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(81);
      logInfo(`requestModal(useSession=false, code=861): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=false, code=861): actual.substring(49)=${actual.substring(49)}`);
      expect(actual.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`requestModal(useSession=false, code=861) ...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(81);
      logInfo(`requestModal(useSession=false, code=861) ...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=false, code=861) ...: subject.lastMessa...${subject.lastMessage.substring(49)}`);
      expect(subject.lastMessage.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`requestModal(useSession=false, code=861) ...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0059 end`);
      });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REQUEST_MODAL_0060
     * @tc.name      UIExtensionSamples_UiExtensionPageStateRequestModal_0060
     * @tc.desc      UiExtensionPageState.requestModal(useSession=false, code=494) yields len81
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateRequestModal_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0060 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.requestModal(false, 494);
      logInfo(`requestModal(useSession=false, code=494): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(81);
      logInfo(`requestModal(useSession=false, code=494): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=false, code=494): actual.substring(49)=${actual.substring(49)}`);
      expect(actual.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`requestModal(useSession=false, code=494) ...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(81);
      logInfo(`requestModal(useSession=false, code=494) ...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=false, code=494) ...: subject.lastMessa...${subject.lastMessage.substring(49)}`);
      expect(subject.lastMessage.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`requestModal(useSession=false, code=494) ...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0060 end`);
      });
  });
}
