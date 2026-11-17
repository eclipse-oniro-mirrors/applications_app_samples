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

/** Logic checks for UiExtensionPageState.requestModal (51 cases). */
export default function uiExtensionPageStateRequestModalTest(): void {
  describe('UiExtensionPageStateRequestModalTest', () => {
    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REQUEST_MODAL_0001
     * @tc.name      UIExtensionSamples_UiExtensionPageStateRequestModal_0001
     * @tc.desc      UiExtensionPageState.requestModal(useSession=true, code=0) yields "requestModalUIExtension succe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_UiExtensionPageStateRequestModal_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      () => {
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0001 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.requestModal(true, 0);
      logInfo(`requestModal(useSession=true, code=0): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension succeed.');
      logInfo(`requestModal(useSession=true, code=0) state: subject.lastMessage=${subject.lastMessage}`);
      expect(subject.lastMessage).assertEqual('requestModalUIExtension succeed.');
      logInfo(`requestModal(useSession=true, code=0) state: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0001 end`);
      });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REQUEST_MODAL_0002
     * @tc.name      UIExtensionSamples_UiExtensionPageStateRequestModal_0002
     * @tc.desc      UiExtensionPageState.requestModal(useSession=true, code=200) yields len81
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_UiExtensionPageStateRequestModal_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      () => {
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0002 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.requestModal(true, 200);
      logInfo(`requestModal(useSession=true, code=200): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(81);
      logInfo(`requestModal(useSession=true, code=200): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=true, code=200): actual.substring(49)=${actual.substring(49)}`);
      expect(actual.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`requestModal(useSession=true, code=200) s...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(81);
      logInfo(`requestModal(useSession=true, code=200) s...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=true, code=200) s...: subject.lastMessa...${subject.lastMessage.substring(49)}`);
      expect(subject.lastMessage.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`requestModal(useSession=true, code=200) s...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0002 end`);
      });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REQUEST_MODAL_0003
     * @tc.name      UIExtensionSamples_UiExtensionPageStateRequestModal_0003
     * @tc.desc      UiExtensionPageState.requestModal(useSession=true, code=-1) yields len80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_UiExtensionPageStateRequestModal_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      () => {
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0003 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.requestModal(true, -1);
      logInfo(`requestModal(useSession=true, code=-1): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(80);
      logInfo(`requestModal(useSession=true, code=-1): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=true, code=-1): actual.substring(48)=${actual.substring(48)}`);
      expect(actual.substring(48)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`requestModal(useSession=true, code=-1) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(80);
      logInfo(`requestModal(useSession=true, code=-1) state: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=true, code=-1) state: subject.lastMessa...${subject.lastMessage.substring(48)}`);
      expect(subject.lastMessage.substring(48)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`requestModal(useSession=true, code=-1) state: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0003 end`);
      });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REQUEST_MODAL_0004
     * @tc.name      UIExtensionSamples_UiExtensionPageStateRequestModal_0004
     * @tc.desc      UiExtensionPageState.requestModal(useSession=true, code=1) yields len79
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateRequestModal_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0004 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.requestModal(true, 1);
      logInfo(`requestModal(useSession=true, code=1): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(79);
      logInfo(`requestModal(useSession=true, code=1): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=true, code=1): actual.substring(47)=${actual.substring(47)}`);
      expect(actual.substring(47)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`requestModal(useSession=true, code=1) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(79);
      logInfo(`requestModal(useSession=true, code=1) state: subject.lastMes...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=true, code=1) state: subject.lastMessag...${subject.lastMessage.substring(47)}`);
      expect(subject.lastMessage.substring(47)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`requestModal(useSession=true, code=1) state: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0004 end`);
      });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REQUEST_MODAL_0005
     * @tc.name      UIExtensionSamples_UiExtensionPageStateRequestModal_0005
     * @tc.desc      UiExtensionPageState.requestModal(useSession=false, code=200) yields len81
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateRequestModal_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0005 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.requestModal(false, 200);
      logInfo(`requestModal(useSession=false, code=200): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(81);
      logInfo(`requestModal(useSession=false, code=200): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=false, code=200): actual.substring(49)=${actual.substring(49)}`);
      expect(actual.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`requestModal(useSession=false, code=200) ...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(81);
      logInfo(`requestModal(useSession=false, code=200) ...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=false, code=200) ...: subject.lastMessa...${subject.lastMessage.substring(49)}`);
      expect(subject.lastMessage.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`requestModal(useSession=false, code=200) ...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0005 end`);
      });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REQUEST_MODAL_0006
     * @tc.name      UIExtensionSamples_UiExtensionPageStateRequestModal_0006
     * @tc.desc      UiExtensionPageState.requestModal(useSession=false, code=-1) yields len80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_UiExtensionPageStateRequestModal_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      () => {
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0006 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.requestModal(false, -1);
      logInfo(`requestModal(useSession=false, code=-1): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(80);
      logInfo(`requestModal(useSession=false, code=-1): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=false, code=-1): actual.substring(48)=${actual.substring(48)}`);
      expect(actual.substring(48)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`requestModal(useSession=false, code=-1) s...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(80);
      logInfo(`requestModal(useSession=false, code=-1) s...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=false, code=-1) s...: subject.lastMessa...${subject.lastMessage.substring(48)}`);
      expect(subject.lastMessage.substring(48)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`requestModal(useSession=false, code=-1) s...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0006 end`);
      });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REQUEST_MODAL_0007
     * @tc.name      UIExtensionSamples_UiExtensionPageStateRequestModal_0007
     * @tc.desc      UiExtensionPageState.requestModal(useSession=false, code=1) yields len79
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateRequestModal_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0007 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.requestModal(false, 1);
      logInfo(`requestModal(useSession=false, code=1): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(79);
      logInfo(`requestModal(useSession=false, code=1): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=false, code=1): actual.substring(47)=${actual.substring(47)}`);
      expect(actual.substring(47)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`requestModal(useSession=false, code=1) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(79);
      logInfo(`requestModal(useSession=false, code=1) state: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=false, code=1) state: subject.lastMessa...${subject.lastMessage.substring(47)}`);
      expect(subject.lastMessage.substring(47)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`requestModal(useSession=false, code=1) state: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0007 end`);
      });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REQUEST_MODAL_0008
     * @tc.name      UIExtensionSamples_UiExtensionPageStateRequestModal_0008
     * @tc.desc      UiExtensionPageState.requestModal(useSession=true, code=401) yields len81
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateRequestModal_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0008 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.requestModal(true, 401);
      logInfo(`requestModal(useSession=true, code=401): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(81);
      logInfo(`requestModal(useSession=true, code=401): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=true, code=401): actual.substring(49)=${actual.substring(49)}`);
      expect(actual.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`requestModal(useSession=true, code=401) s...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(81);
      logInfo(`requestModal(useSession=true, code=401) s...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=true, code=401) s...: subject.lastMessa...${subject.lastMessage.substring(49)}`);
      expect(subject.lastMessage.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`requestModal(useSession=true, code=401) s...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0008 end`);
      });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REQUEST_MODAL_0009
     * @tc.name      UIExtensionSamples_UiExtensionPageStateRequestModal_0009
     * @tc.desc      UiExtensionPageState.requestModal(useSession=true, code=404) yields len81
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateRequestModal_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0009 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.requestModal(true, 404);
      logInfo(`requestModal(useSession=true, code=404): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(81);
      logInfo(`requestModal(useSession=true, code=404): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=true, code=404): actual.substring(49)=${actual.substring(49)}`);
      expect(actual.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`requestModal(useSession=true, code=404) s...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(81);
      logInfo(`requestModal(useSession=true, code=404) s...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=true, code=404) s...: subject.lastMessa...${subject.lastMessage.substring(49)}`);
      expect(subject.lastMessage.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`requestModal(useSession=true, code=404) s...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0009 end`);
      });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REQUEST_MODAL_0010
     * @tc.name      UIExtensionSamples_UiExtensionPageStateRequestModal_0010
     * @tc.desc      UiExtensionPageState.requestModal(useSession=true, code=500) yields len81
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateRequestModal_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0010 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.requestModal(true, 500);
      logInfo(`requestModal(useSession=true, code=500): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(81);
      logInfo(`requestModal(useSession=true, code=500): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=true, code=500): actual.substring(49)=${actual.substring(49)}`);
      expect(actual.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`requestModal(useSession=true, code=500) s...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(81);
      logInfo(`requestModal(useSession=true, code=500) s...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=true, code=500) s...: subject.lastMessa...${subject.lastMessage.substring(49)}`);
      expect(subject.lastMessage.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`requestModal(useSession=true, code=500) s...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0010 end`);
      });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REQUEST_MODAL_0011
     * @tc.name      UIExtensionSamples_UiExtensionPageStateRequestModal_0011
     * @tc.desc      UiExtensionPageState.requestModal(useSession=true, code=2) yields len79
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateRequestModal_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0011 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.requestModal(true, 2);
      logInfo(`requestModal(useSession=true, code=2): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(79);
      logInfo(`requestModal(useSession=true, code=2): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=true, code=2): actual.substring(47)=${actual.substring(47)}`);
      expect(actual.substring(47)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`requestModal(useSession=true, code=2) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(79);
      logInfo(`requestModal(useSession=true, code=2) state: subject.lastMes...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=true, code=2) state: subject.lastMessag...${subject.lastMessage.substring(47)}`);
      expect(subject.lastMessage.substring(47)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`requestModal(useSession=true, code=2) state: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0011 end`);
      });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REQUEST_MODAL_0012
     * @tc.name      UIExtensionSamples_UiExtensionPageStateRequestModal_0012
     * @tc.desc      UiExtensionPageState.requestModal(useSession=true, code=3) yields len79
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateRequestModal_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0012 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.requestModal(true, 3);
      logInfo(`requestModal(useSession=true, code=3): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(79);
      logInfo(`requestModal(useSession=true, code=3): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=true, code=3): actual.substring(47)=${actual.substring(47)}`);
      expect(actual.substring(47)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`requestModal(useSession=true, code=3) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(79);
      logInfo(`requestModal(useSession=true, code=3) state: subject.lastMes...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=true, code=3) state: subject.lastMessag...${subject.lastMessage.substring(47)}`);
      expect(subject.lastMessage.substring(47)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`requestModal(useSession=true, code=3) state: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0012 end`);
      });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REQUEST_MODAL_0013
     * @tc.name      UIExtensionSamples_UiExtensionPageStateRequestModal_0013
     * @tc.desc      UiExtensionPageState.requestModal(useSession=true, code=10) yields len80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateRequestModal_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0013 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.requestModal(true, 10);
      logInfo(`requestModal(useSession=true, code=10): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(80);
      logInfo(`requestModal(useSession=true, code=10): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=true, code=10): actual.substring(48)=${actual.substring(48)}`);
      expect(actual.substring(48)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`requestModal(useSession=true, code=10) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(80);
      logInfo(`requestModal(useSession=true, code=10) state: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=true, code=10) state: subject.lastMessa...${subject.lastMessage.substring(48)}`);
      expect(subject.lastMessage.substring(48)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`requestModal(useSession=true, code=10) state: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0013 end`);
      });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REQUEST_MODAL_0014
     * @tc.name      UIExtensionSamples_UiExtensionPageStateRequestModal_0014
     * @tc.desc      UiExtensionPageState.requestModal(useSession=true, code=100) yields len81
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateRequestModal_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0014 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.requestModal(true, 100);
      logInfo(`requestModal(useSession=true, code=100): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(81);
      logInfo(`requestModal(useSession=true, code=100): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=true, code=100): actual.substring(49)=${actual.substring(49)}`);
      expect(actual.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`requestModal(useSession=true, code=100) s...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(81);
      logInfo(`requestModal(useSession=true, code=100) s...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=true, code=100) s...: subject.lastMessa...${subject.lastMessage.substring(49)}`);
      expect(subject.lastMessage.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`requestModal(useSession=true, code=100) s...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0014 end`);
      });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REQUEST_MODAL_0015
     * @tc.name      UIExtensionSamples_UiExtensionPageStateRequestModal_0015
     * @tc.desc      UiExtensionPageState.requestModal(useSession=true, code=25) yields len80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateRequestModal_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0015 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.requestModal(true, 25);
      logInfo(`requestModal(useSession=true, code=25): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(80);
      logInfo(`requestModal(useSession=true, code=25): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=true, code=25): actual.substring(48)=${actual.substring(48)}`);
      expect(actual.substring(48)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`requestModal(useSession=true, code=25) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(80);
      logInfo(`requestModal(useSession=true, code=25) state: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=true, code=25) state: subject.lastMessa...${subject.lastMessage.substring(48)}`);
      expect(subject.lastMessage.substring(48)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`requestModal(useSession=true, code=25) state: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0015 end`);
      });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REQUEST_MODAL_0016
     * @tc.name      UIExtensionSamples_UiExtensionPageStateRequestModal_0016
     * @tc.desc      UiExtensionPageState.requestModal(useSession=true, code=50) yields len80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateRequestModal_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0016 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.requestModal(true, 50);
      logInfo(`requestModal(useSession=true, code=50): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(80);
      logInfo(`requestModal(useSession=true, code=50): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=true, code=50): actual.substring(48)=${actual.substring(48)}`);
      expect(actual.substring(48)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`requestModal(useSession=true, code=50) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(80);
      logInfo(`requestModal(useSession=true, code=50) state: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=true, code=50) state: subject.lastMessa...${subject.lastMessage.substring(48)}`);
      expect(subject.lastMessage.substring(48)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`requestModal(useSession=true, code=50) state: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0016 end`);
      });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REQUEST_MODAL_0017
     * @tc.name      UIExtensionSamples_UiExtensionPageStateRequestModal_0017
     * @tc.desc      UiExtensionPageState.requestModal(useSession=true, code=75) yields len80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateRequestModal_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0017 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.requestModal(true, 75);
      logInfo(`requestModal(useSession=true, code=75): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(80);
      logInfo(`requestModal(useSession=true, code=75): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=true, code=75): actual.substring(48)=${actual.substring(48)}`);
      expect(actual.substring(48)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`requestModal(useSession=true, code=75) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(80);
      logInfo(`requestModal(useSession=true, code=75) state: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=true, code=75) state: subject.lastMessa...${subject.lastMessage.substring(48)}`);
      expect(subject.lastMessage.substring(48)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`requestModal(useSession=true, code=75) state: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0017 end`);
      });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REQUEST_MODAL_0018
     * @tc.name      UIExtensionSamples_UiExtensionPageStateRequestModal_0018
     * @tc.desc      UiExtensionPageState.requestModal(useSession=true, code=125) yields len81
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateRequestModal_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0018 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.requestModal(true, 125);
      logInfo(`requestModal(useSession=true, code=125): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(81);
      logInfo(`requestModal(useSession=true, code=125): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=true, code=125): actual.substring(49)=${actual.substring(49)}`);
      expect(actual.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`requestModal(useSession=true, code=125) s...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(81);
      logInfo(`requestModal(useSession=true, code=125) s...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=true, code=125) s...: subject.lastMessa...${subject.lastMessage.substring(49)}`);
      expect(subject.lastMessage.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`requestModal(useSession=true, code=125) s...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0018 end`);
      });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REQUEST_MODAL_0019
     * @tc.name      UIExtensionSamples_UiExtensionPageStateRequestModal_0019
     * @tc.desc      UiExtensionPageState.requestModal(useSession=true, code=150) yields len81
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateRequestModal_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0019 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.requestModal(true, 150);
      logInfo(`requestModal(useSession=true, code=150): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(81);
      logInfo(`requestModal(useSession=true, code=150): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=true, code=150): actual.substring(49)=${actual.substring(49)}`);
      expect(actual.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`requestModal(useSession=true, code=150) s...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(81);
      logInfo(`requestModal(useSession=true, code=150) s...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=true, code=150) s...: subject.lastMessa...${subject.lastMessage.substring(49)}`);
      expect(subject.lastMessage.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`requestModal(useSession=true, code=150) s...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0019 end`);
      });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REQUEST_MODAL_0020
     * @tc.name      UIExtensionSamples_UiExtensionPageStateRequestModal_0020
     * @tc.desc      UiExtensionPageState.requestModal(useSession=true, code=175) yields len81
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateRequestModal_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0020 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.requestModal(true, 175);
      logInfo(`requestModal(useSession=true, code=175): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(81);
      logInfo(`requestModal(useSession=true, code=175): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=true, code=175): actual.substring(49)=${actual.substring(49)}`);
      expect(actual.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`requestModal(useSession=true, code=175) s...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(81);
      logInfo(`requestModal(useSession=true, code=175) s...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=true, code=175) s...: subject.lastMessa...${subject.lastMessage.substring(49)}`);
      expect(subject.lastMessage.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`requestModal(useSession=true, code=175) s...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0020 end`);
      });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REQUEST_MODAL_0021
     * @tc.name      UIExtensionSamples_UiExtensionPageStateRequestModal_0021
     * @tc.desc      UiExtensionPageState.requestModal(useSession=true, code=225) yields len81
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateRequestModal_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0021 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.requestModal(true, 225);
      logInfo(`requestModal(useSession=true, code=225): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(81);
      logInfo(`requestModal(useSession=true, code=225): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=true, code=225): actual.substring(49)=${actual.substring(49)}`);
      expect(actual.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`requestModal(useSession=true, code=225) s...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(81);
      logInfo(`requestModal(useSession=true, code=225) s...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=true, code=225) s...: subject.lastMessa...${subject.lastMessage.substring(49)}`);
      expect(subject.lastMessage.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`requestModal(useSession=true, code=225) s...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0021 end`);
      });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REQUEST_MODAL_0022
     * @tc.name      UIExtensionSamples_UiExtensionPageStateRequestModal_0022
     * @tc.desc      UiExtensionPageState.requestModal(useSession=true, code=250) yields len81
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateRequestModal_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0022 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.requestModal(true, 250);
      logInfo(`requestModal(useSession=true, code=250): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(81);
      logInfo(`requestModal(useSession=true, code=250): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=true, code=250): actual.substring(49)=${actual.substring(49)}`);
      expect(actual.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`requestModal(useSession=true, code=250) s...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(81);
      logInfo(`requestModal(useSession=true, code=250) s...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=true, code=250) s...: subject.lastMessa...${subject.lastMessage.substring(49)}`);
      expect(subject.lastMessage.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`requestModal(useSession=true, code=250) s...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0022 end`);
      });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REQUEST_MODAL_0023
     * @tc.name      UIExtensionSamples_UiExtensionPageStateRequestModal_0023
     * @tc.desc      UiExtensionPageState.requestModal(useSession=true, code=275) yields len81
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateRequestModal_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0023 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.requestModal(true, 275);
      logInfo(`requestModal(useSession=true, code=275): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(81);
      logInfo(`requestModal(useSession=true, code=275): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=true, code=275): actual.substring(49)=${actual.substring(49)}`);
      expect(actual.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`requestModal(useSession=true, code=275) s...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(81);
      logInfo(`requestModal(useSession=true, code=275) s...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=true, code=275) s...: subject.lastMessa...${subject.lastMessage.substring(49)}`);
      expect(subject.lastMessage.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`requestModal(useSession=true, code=275) s...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0023 end`);
      });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REQUEST_MODAL_0024
     * @tc.name      UIExtensionSamples_UiExtensionPageStateRequestModal_0024
     * @tc.desc      UiExtensionPageState.requestModal(useSession=true, code=300) yields len81
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateRequestModal_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0024 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.requestModal(true, 300);
      logInfo(`requestModal(useSession=true, code=300): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(81);
      logInfo(`requestModal(useSession=true, code=300): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=true, code=300): actual.substring(49)=${actual.substring(49)}`);
      expect(actual.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`requestModal(useSession=true, code=300) s...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(81);
      logInfo(`requestModal(useSession=true, code=300) s...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=true, code=300) s...: subject.lastMessa...${subject.lastMessage.substring(49)}`);
      expect(subject.lastMessage.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`requestModal(useSession=true, code=300) s...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0024 end`);
      });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REQUEST_MODAL_0025
     * @tc.name      UIExtensionSamples_UiExtensionPageStateRequestModal_0025
     * @tc.desc      UiExtensionPageState.requestModal(useSession=true, code=325) yields len81
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateRequestModal_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0025 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.requestModal(true, 325);
      logInfo(`requestModal(useSession=true, code=325): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(81);
      logInfo(`requestModal(useSession=true, code=325): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=true, code=325): actual.substring(49)=${actual.substring(49)}`);
      expect(actual.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`requestModal(useSession=true, code=325) s...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(81);
      logInfo(`requestModal(useSession=true, code=325) s...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=true, code=325) s...: subject.lastMessa...${subject.lastMessage.substring(49)}`);
      expect(subject.lastMessage.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`requestModal(useSession=true, code=325) s...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0025 end`);
      });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REQUEST_MODAL_0026
     * @tc.name      UIExtensionSamples_UiExtensionPageStateRequestModal_0026
     * @tc.desc      UiExtensionPageState.requestModal(useSession=true, code=350) yields len81
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateRequestModal_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0026 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.requestModal(true, 350);
      logInfo(`requestModal(useSession=true, code=350): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(81);
      logInfo(`requestModal(useSession=true, code=350): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=true, code=350): actual.substring(49)=${actual.substring(49)}`);
      expect(actual.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`requestModal(useSession=true, code=350) s...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(81);
      logInfo(`requestModal(useSession=true, code=350) s...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=true, code=350) s...: subject.lastMessa...${subject.lastMessage.substring(49)}`);
      expect(subject.lastMessage.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`requestModal(useSession=true, code=350) s...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0026 end`);
      });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REQUEST_MODAL_0027
     * @tc.name      UIExtensionSamples_UiExtensionPageStateRequestModal_0027
     * @tc.desc      UiExtensionPageState.requestModal(useSession=true, code=375) yields len81
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateRequestModal_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0027 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.requestModal(true, 375);
      logInfo(`requestModal(useSession=true, code=375): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(81);
      logInfo(`requestModal(useSession=true, code=375): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=true, code=375): actual.substring(49)=${actual.substring(49)}`);
      expect(actual.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`requestModal(useSession=true, code=375) s...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(81);
      logInfo(`requestModal(useSession=true, code=375) s...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=true, code=375) s...: subject.lastMessa...${subject.lastMessage.substring(49)}`);
      expect(subject.lastMessage.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`requestModal(useSession=true, code=375) s...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0027 end`);
      });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REQUEST_MODAL_0028
     * @tc.name      UIExtensionSamples_UiExtensionPageStateRequestModal_0028
     * @tc.desc      UiExtensionPageState.requestModal(useSession=true, code=400) yields len81
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateRequestModal_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0028 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.requestModal(true, 400);
      logInfo(`requestModal(useSession=true, code=400): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(81);
      logInfo(`requestModal(useSession=true, code=400): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=true, code=400): actual.substring(49)=${actual.substring(49)}`);
      expect(actual.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`requestModal(useSession=true, code=400) s...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(81);
      logInfo(`requestModal(useSession=true, code=400) s...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=true, code=400) s...: subject.lastMessa...${subject.lastMessage.substring(49)}`);
      expect(subject.lastMessage.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`requestModal(useSession=true, code=400) s...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0028 end`);
      });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REQUEST_MODAL_0029
     * @tc.name      UIExtensionSamples_UiExtensionPageStateRequestModal_0029
     * @tc.desc      UiExtensionPageState.requestModal(useSession=true, code=425) yields len81
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateRequestModal_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0029 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.requestModal(true, 425);
      logInfo(`requestModal(useSession=true, code=425): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(81);
      logInfo(`requestModal(useSession=true, code=425): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=true, code=425): actual.substring(49)=${actual.substring(49)}`);
      expect(actual.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`requestModal(useSession=true, code=425) s...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(81);
      logInfo(`requestModal(useSession=true, code=425) s...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=true, code=425) s...: subject.lastMessa...${subject.lastMessage.substring(49)}`);
      expect(subject.lastMessage.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`requestModal(useSession=true, code=425) s...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0029 end`);
      });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REQUEST_MODAL_0030
     * @tc.name      UIExtensionSamples_UiExtensionPageStateRequestModal_0030
     * @tc.desc      UiExtensionPageState.requestModal(useSession=true, code=450) yields len81
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateRequestModal_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0030 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.requestModal(true, 450);
      logInfo(`requestModal(useSession=true, code=450): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(81);
      logInfo(`requestModal(useSession=true, code=450): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=true, code=450): actual.substring(49)=${actual.substring(49)}`);
      expect(actual.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`requestModal(useSession=true, code=450) s...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(81);
      logInfo(`requestModal(useSession=true, code=450) s...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=true, code=450) s...: subject.lastMessa...${subject.lastMessage.substring(49)}`);
      expect(subject.lastMessage.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`requestModal(useSession=true, code=450) s...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0030 end`);
      });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REQUEST_MODAL_0031
     * @tc.name      UIExtensionSamples_UiExtensionPageStateRequestModal_0031
     * @tc.desc      UiExtensionPageState.requestModal(useSession=true, code=475) yields len81
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateRequestModal_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0031 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.requestModal(true, 475);
      logInfo(`requestModal(useSession=true, code=475): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(81);
      logInfo(`requestModal(useSession=true, code=475): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=true, code=475): actual.substring(49)=${actual.substring(49)}`);
      expect(actual.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`requestModal(useSession=true, code=475) s...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(81);
      logInfo(`requestModal(useSession=true, code=475) s...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=true, code=475) s...: subject.lastMessa...${subject.lastMessage.substring(49)}`);
      expect(subject.lastMessage.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`requestModal(useSession=true, code=475) s...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0031 end`);
      });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REQUEST_MODAL_0032
     * @tc.name      UIExtensionSamples_UiExtensionPageStateRequestModal_0032
     * @tc.desc      UiExtensionPageState.requestModal(useSession=true, code=861) yields len81
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateRequestModal_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0032 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.requestModal(true, 861);
      logInfo(`requestModal(useSession=true, code=861): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(81);
      logInfo(`requestModal(useSession=true, code=861): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=true, code=861): actual.substring(49)=${actual.substring(49)}`);
      expect(actual.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`requestModal(useSession=true, code=861) s...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(81);
      logInfo(`requestModal(useSession=true, code=861) s...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=true, code=861) s...: subject.lastMessa...${subject.lastMessage.substring(49)}`);
      expect(subject.lastMessage.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`requestModal(useSession=true, code=861) s...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0032 end`);
      });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REQUEST_MODAL_0033
     * @tc.name      UIExtensionSamples_UiExtensionPageStateRequestModal_0033
     * @tc.desc      UiExtensionPageState.requestModal(useSession=true, code=494) yields len81
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateRequestModal_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0033 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.requestModal(true, 494);
      logInfo(`requestModal(useSession=true, code=494): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(81);
      logInfo(`requestModal(useSession=true, code=494): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=true, code=494): actual.substring(49)=${actual.substring(49)}`);
      expect(actual.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`requestModal(useSession=true, code=494) s...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(81);
      logInfo(`requestModal(useSession=true, code=494) s...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=true, code=494) s...: subject.lastMessa...${subject.lastMessage.substring(49)}`);
      expect(subject.lastMessage.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`requestModal(useSession=true, code=494) s...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0033 end`);
      });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REQUEST_MODAL_0034
     * @tc.name      UIExtensionSamples_UiExtensionPageStateRequestModal_0034
     * @tc.desc      UiExtensionPageState.requestModal(useSession=false, code=0) yields "requestModalUIExtension succ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateRequestModal_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0034 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.requestModal(false, 0);
      logInfo(`requestModal(useSession=false, code=0): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension succeed.');
      logInfo(`requestModal(useSession=false, code=0) state: subject.lastMessage=${subject.lastMessage}`);
      expect(subject.lastMessage).assertEqual('requestModalUIExtension succeed.');
      logInfo(`requestModal(useSession=false, code=0) state: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0034 end`);
      });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REQUEST_MODAL_0035
     * @tc.name      UIExtensionSamples_UiExtensionPageStateRequestModal_0035
     * @tc.desc      UiExtensionPageState.requestModal(useSession=false, code=401) yields len81
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateRequestModal_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0035 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.requestModal(false, 401);
      logInfo(`requestModal(useSession=false, code=401): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(81);
      logInfo(`requestModal(useSession=false, code=401): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=false, code=401): actual.substring(49)=${actual.substring(49)}`);
      expect(actual.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`requestModal(useSession=false, code=401) ...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(81);
      logInfo(`requestModal(useSession=false, code=401) ...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=false, code=401) ...: subject.lastMessa...${subject.lastMessage.substring(49)}`);
      expect(subject.lastMessage.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`requestModal(useSession=false, code=401) ...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0035 end`);
      });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REQUEST_MODAL_0036
     * @tc.name      UIExtensionSamples_UiExtensionPageStateRequestModal_0036
     * @tc.desc      UiExtensionPageState.requestModal(useSession=false, code=404) yields len81
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateRequestModal_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0036 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.requestModal(false, 404);
      logInfo(`requestModal(useSession=false, code=404): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(81);
      logInfo(`requestModal(useSession=false, code=404): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=false, code=404): actual.substring(49)=${actual.substring(49)}`);
      expect(actual.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`requestModal(useSession=false, code=404) ...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(81);
      logInfo(`requestModal(useSession=false, code=404) ...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=false, code=404) ...: subject.lastMessa...${subject.lastMessage.substring(49)}`);
      expect(subject.lastMessage.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`requestModal(useSession=false, code=404) ...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0036 end`);
      });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REQUEST_MODAL_0037
     * @tc.name      UIExtensionSamples_UiExtensionPageStateRequestModal_0037
     * @tc.desc      UiExtensionPageState.requestModal(useSession=false, code=500) yields len81
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateRequestModal_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0037 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.requestModal(false, 500);
      logInfo(`requestModal(useSession=false, code=500): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(81);
      logInfo(`requestModal(useSession=false, code=500): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=false, code=500): actual.substring(49)=${actual.substring(49)}`);
      expect(actual.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`requestModal(useSession=false, code=500) ...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(81);
      logInfo(`requestModal(useSession=false, code=500) ...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=false, code=500) ...: subject.lastMessa...${subject.lastMessage.substring(49)}`);
      expect(subject.lastMessage.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`requestModal(useSession=false, code=500) ...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0037 end`);
      });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REQUEST_MODAL_0038
     * @tc.name      UIExtensionSamples_UiExtensionPageStateRequestModal_0038
     * @tc.desc      UiExtensionPageState.requestModal(useSession=false, code=2) yields len79
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateRequestModal_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0038 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.requestModal(false, 2);
      logInfo(`requestModal(useSession=false, code=2): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(79);
      logInfo(`requestModal(useSession=false, code=2): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=false, code=2): actual.substring(47)=${actual.substring(47)}`);
      expect(actual.substring(47)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`requestModal(useSession=false, code=2) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(79);
      logInfo(`requestModal(useSession=false, code=2) state: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=false, code=2) state: subject.lastMessa...${subject.lastMessage.substring(47)}`);
      expect(subject.lastMessage.substring(47)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`requestModal(useSession=false, code=2) state: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0038 end`);
      });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REQUEST_MODAL_0039
     * @tc.name      UIExtensionSamples_UiExtensionPageStateRequestModal_0039
     * @tc.desc      UiExtensionPageState.requestModal(useSession=false, code=3) yields len79
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateRequestModal_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0039 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.requestModal(false, 3);
      logInfo(`requestModal(useSession=false, code=3): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(79);
      logInfo(`requestModal(useSession=false, code=3): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=false, code=3): actual.substring(47)=${actual.substring(47)}`);
      expect(actual.substring(47)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`requestModal(useSession=false, code=3) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(79);
      logInfo(`requestModal(useSession=false, code=3) state: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=false, code=3) state: subject.lastMessa...${subject.lastMessage.substring(47)}`);
      expect(subject.lastMessage.substring(47)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`requestModal(useSession=false, code=3) state: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0039 end`);
      });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REQUEST_MODAL_0040
     * @tc.name      UIExtensionSamples_UiExtensionPageStateRequestModal_0040
     * @tc.desc      UiExtensionPageState.requestModal(useSession=false, code=10) yields len80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateRequestModal_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0040 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.requestModal(false, 10);
      logInfo(`requestModal(useSession=false, code=10): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(80);
      logInfo(`requestModal(useSession=false, code=10): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=false, code=10): actual.substring(48)=${actual.substring(48)}`);
      expect(actual.substring(48)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`requestModal(useSession=false, code=10) s...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(80);
      logInfo(`requestModal(useSession=false, code=10) s...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=false, code=10) s...: subject.lastMessa...${subject.lastMessage.substring(48)}`);
      expect(subject.lastMessage.substring(48)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`requestModal(useSession=false, code=10) s...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0040 end`);
      });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REQUEST_MODAL_0041
     * @tc.name      UIExtensionSamples_UiExtensionPageStateRequestModal_0041
     * @tc.desc      UiExtensionPageState.requestModal(useSession=false, code=100) yields len81
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateRequestModal_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0041 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.requestModal(false, 100);
      logInfo(`requestModal(useSession=false, code=100): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(81);
      logInfo(`requestModal(useSession=false, code=100): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=false, code=100): actual.substring(49)=${actual.substring(49)}`);
      expect(actual.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`requestModal(useSession=false, code=100) ...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(81);
      logInfo(`requestModal(useSession=false, code=100) ...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=false, code=100) ...: subject.lastMessa...${subject.lastMessage.substring(49)}`);
      expect(subject.lastMessage.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`requestModal(useSession=false, code=100) ...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0041 end`);
      });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REQUEST_MODAL_0042
     * @tc.name      UIExtensionSamples_UiExtensionPageStateRequestModal_0042
     * @tc.desc      UiExtensionPageState.requestModal(useSession=false, code=25) yields len80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateRequestModal_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0042 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.requestModal(false, 25);
      logInfo(`requestModal(useSession=false, code=25): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(80);
      logInfo(`requestModal(useSession=false, code=25): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=false, code=25): actual.substring(48)=${actual.substring(48)}`);
      expect(actual.substring(48)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`requestModal(useSession=false, code=25) s...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(80);
      logInfo(`requestModal(useSession=false, code=25) s...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=false, code=25) s...: subject.lastMessa...${subject.lastMessage.substring(48)}`);
      expect(subject.lastMessage.substring(48)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`requestModal(useSession=false, code=25) s...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0042 end`);
      });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REQUEST_MODAL_0043
     * @tc.name      UIExtensionSamples_UiExtensionPageStateRequestModal_0043
     * @tc.desc      UiExtensionPageState.requestModal(useSession=false, code=50) yields len80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateRequestModal_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0043 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.requestModal(false, 50);
      logInfo(`requestModal(useSession=false, code=50): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(80);
      logInfo(`requestModal(useSession=false, code=50): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=false, code=50): actual.substring(48)=${actual.substring(48)}`);
      expect(actual.substring(48)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`requestModal(useSession=false, code=50) s...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(80);
      logInfo(`requestModal(useSession=false, code=50) s...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=false, code=50) s...: subject.lastMessa...${subject.lastMessage.substring(48)}`);
      expect(subject.lastMessage.substring(48)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`requestModal(useSession=false, code=50) s...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0043 end`);
      });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REQUEST_MODAL_0044
     * @tc.name      UIExtensionSamples_UiExtensionPageStateRequestModal_0044
     * @tc.desc      UiExtensionPageState.requestModal(useSession=false, code=75) yields len80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateRequestModal_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0044 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.requestModal(false, 75);
      logInfo(`requestModal(useSession=false, code=75): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(80);
      logInfo(`requestModal(useSession=false, code=75): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=false, code=75): actual.substring(48)=${actual.substring(48)}`);
      expect(actual.substring(48)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`requestModal(useSession=false, code=75) s...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(80);
      logInfo(`requestModal(useSession=false, code=75) s...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=false, code=75) s...: subject.lastMessa...${subject.lastMessage.substring(48)}`);
      expect(subject.lastMessage.substring(48)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`requestModal(useSession=false, code=75) s...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0044 end`);
      });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REQUEST_MODAL_0045
     * @tc.name      UIExtensionSamples_UiExtensionPageStateRequestModal_0045
     * @tc.desc      UiExtensionPageState.requestModal(useSession=false, code=125) yields len81
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateRequestModal_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0045 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.requestModal(false, 125);
      logInfo(`requestModal(useSession=false, code=125): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(81);
      logInfo(`requestModal(useSession=false, code=125): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=false, code=125): actual.substring(49)=${actual.substring(49)}`);
      expect(actual.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`requestModal(useSession=false, code=125) ...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(81);
      logInfo(`requestModal(useSession=false, code=125) ...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=false, code=125) ...: subject.lastMessa...${subject.lastMessage.substring(49)}`);
      expect(subject.lastMessage.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`requestModal(useSession=false, code=125) ...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0045 end`);
      });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REQUEST_MODAL_0046
     * @tc.name      UIExtensionSamples_UiExtensionPageStateRequestModal_0046
     * @tc.desc      UiExtensionPageState.requestModal(useSession=false, code=150) yields len81
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateRequestModal_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0046 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.requestModal(false, 150);
      logInfo(`requestModal(useSession=false, code=150): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(81);
      logInfo(`requestModal(useSession=false, code=150): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=false, code=150): actual.substring(49)=${actual.substring(49)}`);
      expect(actual.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`requestModal(useSession=false, code=150) ...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(81);
      logInfo(`requestModal(useSession=false, code=150) ...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=false, code=150) ...: subject.lastMessa...${subject.lastMessage.substring(49)}`);
      expect(subject.lastMessage.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`requestModal(useSession=false, code=150) ...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0046 end`);
      });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REQUEST_MODAL_0047
     * @tc.name      UIExtensionSamples_UiExtensionPageStateRequestModal_0047
     * @tc.desc      UiExtensionPageState.requestModal(useSession=false, code=175) yields len81
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateRequestModal_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0047 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.requestModal(false, 175);
      logInfo(`requestModal(useSession=false, code=175): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(81);
      logInfo(`requestModal(useSession=false, code=175): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=false, code=175): actual.substring(49)=${actual.substring(49)}`);
      expect(actual.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`requestModal(useSession=false, code=175) ...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(81);
      logInfo(`requestModal(useSession=false, code=175) ...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=false, code=175) ...: subject.lastMessa...${subject.lastMessage.substring(49)}`);
      expect(subject.lastMessage.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`requestModal(useSession=false, code=175) ...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0047 end`);
      });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REQUEST_MODAL_0048
     * @tc.name      UIExtensionSamples_UiExtensionPageStateRequestModal_0048
     * @tc.desc      UiExtensionPageState.requestModal(useSession=false, code=225) yields len81
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateRequestModal_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0048 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.requestModal(false, 225);
      logInfo(`requestModal(useSession=false, code=225): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(81);
      logInfo(`requestModal(useSession=false, code=225): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=false, code=225): actual.substring(49)=${actual.substring(49)}`);
      expect(actual.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`requestModal(useSession=false, code=225) ...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(81);
      logInfo(`requestModal(useSession=false, code=225) ...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=false, code=225) ...: subject.lastMessa...${subject.lastMessage.substring(49)}`);
      expect(subject.lastMessage.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`requestModal(useSession=false, code=225) ...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0048 end`);
      });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REQUEST_MODAL_0049
     * @tc.name      UIExtensionSamples_UiExtensionPageStateRequestModal_0049
     * @tc.desc      UiExtensionPageState.requestModal(useSession=false, code=250) yields len81
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateRequestModal_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0049 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.requestModal(false, 250);
      logInfo(`requestModal(useSession=false, code=250): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(81);
      logInfo(`requestModal(useSession=false, code=250): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=false, code=250): actual.substring(49)=${actual.substring(49)}`);
      expect(actual.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`requestModal(useSession=false, code=250) ...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(81);
      logInfo(`requestModal(useSession=false, code=250) ...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=false, code=250) ...: subject.lastMessa...${subject.lastMessage.substring(49)}`);
      expect(subject.lastMessage.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`requestModal(useSession=false, code=250) ...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0049 end`);
      });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REQUEST_MODAL_0050
     * @tc.name      UIExtensionSamples_UiExtensionPageStateRequestModal_0050
     * @tc.desc      UiExtensionPageState.requestModal(useSession=false, code=275) yields len81
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateRequestModal_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0050 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.requestModal(false, 275);
      logInfo(`requestModal(useSession=false, code=275): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(81);
      logInfo(`requestModal(useSession=false, code=275): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=false, code=275): actual.substring(49)=${actual.substring(49)}`);
      expect(actual.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`requestModal(useSession=false, code=275) ...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(81);
      logInfo(`requestModal(useSession=false, code=275) ...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=false, code=275) ...: subject.lastMessa...${subject.lastMessage.substring(49)}`);
      expect(subject.lastMessage.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`requestModal(useSession=false, code=275) ...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0050 end`);
      });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REQUEST_MODAL_0051
     * @tc.name      UIExtensionSamples_UiExtensionPageStateRequestModal_0051
     * @tc.desc      UiExtensionPageState.requestModal(useSession=false, code=300) yields len81
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateRequestModal_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0051 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.requestModal(false, 300);
      logInfo(`requestModal(useSession=false, code=300): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(81);
      logInfo(`requestModal(useSession=false, code=300): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=false, code=300): actual.substring(49)=${actual.substring(49)}`);
      expect(actual.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`requestModal(useSession=false, code=300) ...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(81);
      logInfo(`requestModal(useSession=false, code=300) ...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal(useSession=false, code=300) ...: subject.lastMessa...${subject.lastMessage.substring(49)}`);
      expect(subject.lastMessage.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`requestModal(useSession=false, code=300) ...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateRequestModal_0051 end`);
      });
  });
}
