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

/** Logic checks for UiExtensionPageState flow (35 cases). */
export default function uiExtensionPageStateFlow5Test(): void {
  describe('UiExtensionPageStateFlow5Test', () => {
    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0145
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0145
     * @tc.desc      UiExtensionPageState call flow requestModal > terminateWithResult keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0145 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.requestModal(true, 494);
      logInfo(`step1 requestModal(true, 494): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(81);
      logInfo(`step1 requestModal(true, 494): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step1 requestModal(true, 494): step1.substring(49)=${step1.substring(49)}`);
      expect(step1.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      const step2: number = subject.terminateWithResult(true);
      logInfo(`step2 terminateWithResult(true): step2=${step2}`);
      expect(step2).assertEqual(100);
      logInfo(`requestModal>terminateWithResult final: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(81);
      logInfo(`requestModal>terminateWithResult final: subject.lastMessage....${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal>terminateWithResult final: subject.lastMessage.sub...${subject.lastMessage.substring(49)}`);
      expect(subject.lastMessage.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`requestModal>terminateWithResult final: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`requestModal>terminateWithResult final: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(100);
      logInfo(`requestModal>terminateWithResult final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0145 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0146
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0146
     * @tc.desc      UiExtensionPageState call flow requestModal > open keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0146 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.requestModal(true, 100);
      logInfo(`step1 requestModal(true, 100): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(81);
      logInfo(`step1 requestModal(true, 100): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step1 requestModal(true, 100): step1.substring(49)=${step1.substring(49)}`);
      expect(step1.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      const step2: string = subject.open('D');
      logInfo(`step2 open("D"): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`requestModal>open final: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(81);
      logInfo(`requestModal>open final: subject.lastMessage.substring(0, 32)=${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal>open final: subject.lastMessage.substring(49)=${subject.lastMessage.substring(49)}`);
      expect(subject.lastMessage.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`requestModal>open final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0146 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0147
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0147
     * @tc.desc      UiExtensionPageState call flow terminateWithResult > terminateWithResult keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0147 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: number = subject.terminateWithResult(false);
      logInfo(`step1 terminateWithResult(false): step1=${step1}`);
      expect(step1).assertEqual(99);
      const step2: number = subject.terminateWithResult(true);
      logInfo(`step2 terminateWithResult(true): step2=${step2}`);
      expect(step2).assertEqual(100);
      logInfo(`terminateWithResult>terminateWithResult f...: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`terminateWithResult>terminateWithResult f...: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(100);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0147 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0148
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0148
     * @tc.desc      UiExtensionPageState call flow setPrivacyMode > setPrivacyMode > requestModal > reportDrawn > re...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0148 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.setPrivacyMode(true);
      logInfo(`step1 setPrivacyMode(true): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(84);
      logInfo(`step1 setPrivacyMode(true): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`step1 setPrivacyMode(true): step1.substring(52)=${step1.substring(52)}`);
      expect(step1.substring(52)).assertEqual('ack) called. isPrivacyMode: true');
      const step2: string = subject.setPrivacyMode(false);
      logInfo(`step2 setPrivacyMode(false): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(84);
      logInfo(`step2 setPrivacyMode(false): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`step2 setPrivacyMode(false): step2.substring(52)=${step2.substring(52)}`);
      expect(step2.substring(52)).assertEqual('se) called. isPrivacyMode: false');
      const step3: string = subject.requestModal(true, 350);
      logInfo(`step3 requestModal(true, 350): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(81);
      logInfo(`step3 requestModal(true, 350): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step3 requestModal(true, 350): step3.substring(49)=${step3.substring(49)}`);
      expect(step3.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      const step4: string = subject.reportDrawn(127.5);
      logInfo(`step4 reportDrawn(127.5): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(79);
      logInfo(`step4 reportDrawn(127.5): step4.substring(0, 32)=${step4.substring(0, 32)}`);
      expect(step4.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step4 reportDrawn(127.5): step4.substring(47)=${step4.substring(47)}`);
      expect(step4.substring(47)).assertEqual(' code is 127.5, message is error');
      const step5: string = subject.reportDrawn(277.13);
      logInfo(`step5 reportDrawn(277.13): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(80);
      logInfo(`step5 reportDrawn(277.13): step5.substring(0, 32)=${step5.substring(0, 32)}`);
      expect(step5.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step5 reportDrawn(277.13): step5.substring(48)=${step5.substring(48)}`);
      expect(step5.substring(48)).assertEqual('code is 277.13, message is error');
      logInfo(`setPrivacyMode>setPrivacyMode>requestModa...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(80);
      logInfo(`setPrivacyMode>setPrivacyMode>requestModa...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`setPrivacyMode>setPrivacyMode>requestModa...: subject.lastMessa...${subject.lastMessage.substring(48)}`);
      expect(subject.lastMessage.substring(48)).assertEqual('code is 277.13, message is error');
      logInfo(`setPrivacyMode>setPrivacyMode>requestModa...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0148 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0149
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0149
     * @tc.desc      UiExtensionPageState call flow reportDrawn > setPrivacyMode > terminateWithResult > setPrivacyMo...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0149 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.reportDrawn(191);
      logInfo(`step1 reportDrawn(191): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(77);
      logInfo(`step1 reportDrawn(191): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step1 reportDrawn(191): step1.substring(45)=${step1.substring(45)}`);
      expect(step1.substring(45)).assertEqual('d, code is 191, message is error');
      const step2: string = subject.setPrivacyMode(false);
      logInfo(`step2 setPrivacyMode(false): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(84);
      logInfo(`step2 setPrivacyMode(false): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`step2 setPrivacyMode(false): step2.substring(52)=${step2.substring(52)}`);
      expect(step2.substring(52)).assertEqual('se) called. isPrivacyMode: false');
      const step3: number = subject.terminateWithResult(false);
      logInfo(`step3 terminateWithResult(false): step3=${step3}`);
      expect(step3).assertEqual(99);
      const step4: string = subject.setPrivacyMode(true);
      logInfo(`step4 setPrivacyMode(true): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(84);
      logInfo(`step4 setPrivacyMode(true): step4.substring(0, 32)=${step4.substring(0, 32)}`);
      expect(step4.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`step4 setPrivacyMode(true): step4.substring(52)=${step4.substring(52)}`);
      expect(step4.substring(52)).assertEqual('ack) called. isPrivacyMode: true');
      logInfo(`reportDrawn>setPrivacyMode>terminateWithR...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(84);
      logInfo(`reportDrawn>setPrivacyMode>terminateWithR...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`reportDrawn>setPrivacyMode>terminateWithR...: subject.lastMessa...${subject.lastMessage.substring(52)}`);
      expect(subject.lastMessage.substring(52)).assertEqual('ack) called. isPrivacyMode: true');
      logInfo(`reportDrawn>setPrivacyMode>terminateWithR...: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`reportDrawn>setPrivacyMode>terminateWithR...: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(99);
      logInfo(`reportDrawn>setPrivacyMode>terminateWithR...: subject.privacyMode=${subject.privacyMode}`);
      expect(subject.privacyMode).assertTrue();
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0149 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0150
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0150
     * @tc.desc      UiExtensionPageState call flow terminateWithResult > reportDrawn > setPrivacyMode > requestModal...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0150 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: number = subject.terminateWithResult(true);
      logInfo(`step1 terminateWithResult(true): step1=${step1}`);
      expect(step1).assertEqual(100);
      const step2: string = subject.reportDrawn(696);
      logInfo(`step2 reportDrawn(696): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(77);
      logInfo(`step2 reportDrawn(696): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step2 reportDrawn(696): step2.substring(45)=${step2.substring(45)}`);
      expect(step2.substring(45)).assertEqual('d, code is 696, message is error');
      const step3: string = subject.setPrivacyMode(true);
      logInfo(`step3 setPrivacyMode(true): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(84);
      logInfo(`step3 setPrivacyMode(true): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`step3 setPrivacyMode(true): step3.substring(52)=${step3.substring(52)}`);
      expect(step3.substring(52)).assertEqual('ack) called. isPrivacyMode: true');
      const step4: string = subject.requestModal(true, 425);
      logInfo(`step4 requestModal(true, 425): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(81);
      logInfo(`step4 requestModal(true, 425): step4.substring(0, 32)=${step4.substring(0, 32)}`);
      expect(step4.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step4 requestModal(true, 425): step4.substring(49)=${step4.substring(49)}`);
      expect(step4.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      const step5: number = subject.terminateWithResult(true);
      logInfo(`step5 terminateWithResult(true): step5=${step5}`);
      expect(step5).assertEqual(100);
      logInfo(`terminateWithResult>reportDrawn>setPrivac...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(81);
      logInfo(`terminateWithResult>reportDrawn>setPrivac...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`terminateWithResult>reportDrawn>setPrivac...: subject.lastMessa...${subject.lastMessage.substring(49)}`);
      expect(subject.lastMessage.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`terminateWithResult>reportDrawn>setPrivac...: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`terminateWithResult>reportDrawn>setPrivac...: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(100);
      logInfo(`terminateWithResult>reportDrawn>setPrivac...: subject.privacyMode=${subject.privacyMode}`);
      expect(subject.privacyMode).assertTrue();
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0150 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0151
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0151
     * @tc.desc      UiExtensionPageState call flow requestModal > open > requestModal > open > reportDrawn keeps sta...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0151 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.requestModal(false, 300);
      logInfo(`step1 requestModal(false, 300): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(81);
      logInfo(`step1 requestModal(false, 300): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step1 requestModal(false, 300): step1.substring(49)=${step1.substring(49)}`);
      expect(step1.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      const step2: string = subject.open('123_1');
      logInfo(`step2 open("123_1"): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.requestModal(true, 1);
      logInfo(`step3 requestModal(true, 1): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(79);
      logInfo(`step3 requestModal(true, 1): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step3 requestModal(true, 1): step3.substring(47)=${step3.substring(47)}`);
      expect(step3.substring(47)).assertEqual('age is SessionUIExtensionAbility');
      const step4: string = subject.open('LLaPl6');
      logInfo(`step4 open("LLaPl6"): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.reportDrawn(-465);
      logInfo(`step5 reportDrawn(-465): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(78);
      logInfo(`step5 reportDrawn(-465): step5.substring(0, 32)=${step5.substring(0, 32)}`);
      expect(step5.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step5 reportDrawn(-465): step5.substring(46)=${step5.substring(46)}`);
      expect(step5.substring(46)).assertEqual(', code is -465, message is error');
      logInfo(`requestModal>open>requestModal>open>repor...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(78);
      logInfo(`requestModal>open>requestModal>open>repor...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`requestModal>open>requestModal>open>repor...: subject.lastMessa...${subject.lastMessage.substring(46)}`);
      expect(subject.lastMessage.substring(46)).assertEqual(', code is -465, message is error');
      logInfo(`requestModal>open>requestModal>open>repor...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(2);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0151 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0152
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0152
     * @tc.desc      UiExtensionPageState call flow setPrivacyMode > terminateWithResult > open > terminateWithResult...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0152 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.setPrivacyMode(true);
      logInfo(`step1 setPrivacyMode(true): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(84);
      logInfo(`step1 setPrivacyMode(true): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`step1 setPrivacyMode(true): step1.substring(52)=${step1.substring(52)}`);
      expect(step1.substring(52)).assertEqual('ack) called. isPrivacyMode: true');
      const step2: number = subject.terminateWithResult(false);
      logInfo(`step2 terminateWithResult(false): step2=${step2}`);
      expect(step2).assertEqual(99);
      const step3: string = subject.open('tV');
      logInfo(`step3 open("tV"): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: number = subject.terminateWithResult(false);
      logInfo(`step4 terminateWithResult(false): step4=${step4}`);
      expect(step4).assertEqual(99);
      const step5: string = subject.reportDrawn(770);
      logInfo(`step5 reportDrawn(770): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(77);
      logInfo(`step5 reportDrawn(770): step5.substring(0, 32)=${step5.substring(0, 32)}`);
      expect(step5.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step5 reportDrawn(770): step5.substring(45)=${step5.substring(45)}`);
      expect(step5.substring(45)).assertEqual('d, code is 770, message is error');
      logInfo(`setPrivacyMode>terminateWithResult>open>t...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`setPrivacyMode>terminateWithResult>open>t...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`setPrivacyMode>terminateWithResult>open>t...: subject.lastMessa...${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 770, message is error');
      logInfo(`setPrivacyMode>terminateWithResult>open>t...: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`setPrivacyMode>terminateWithResult>open>t...: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(99);
      logInfo(`setPrivacyMode>terminateWithResult>open>t...: subject.privacyMode=${subject.privacyMode}`);
      expect(subject.privacyMode).assertTrue();
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0152 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0153
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0153
     * @tc.desc      UiExtensionPageState call flow terminateWithResult > reportDrawn > terminateWithResult keeps sta...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0153 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: number = subject.terminateWithResult(true);
      logInfo(`step1 terminateWithResult(true): step1=${step1}`);
      expect(step1).assertEqual(100);
      const step2: string = subject.reportDrawn(475);
      logInfo(`step2 reportDrawn(475): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(77);
      logInfo(`step2 reportDrawn(475): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step2 reportDrawn(475): step2.substring(45)=${step2.substring(45)}`);
      expect(step2.substring(45)).assertEqual('d, code is 475, message is error');
      const step3: number = subject.terminateWithResult(false);
      logInfo(`step3 terminateWithResult(false): step3=${step3}`);
      expect(step3).assertEqual(99);
      logInfo(`terminateWithResult>reportDrawn>terminate...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`terminateWithResult>reportDrawn>terminate...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`terminateWithResult>reportDrawn>terminate...: subject.lastMessa...${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 475, message is error');
      logInfo(`terminateWithResult>reportDrawn>terminate...: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`terminateWithResult>reportDrawn>terminate...: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(99);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0153 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0154
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0154
     * @tc.desc      UiExtensionPageState call flow reportDrawn > reportDrawn > requestModal > open > reportDrawn kee...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0154 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.reportDrawn(28.63);
      logInfo(`step1 reportDrawn(28.63): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(79);
      logInfo(`step1 reportDrawn(28.63): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step1 reportDrawn(28.63): step1.substring(47)=${step1.substring(47)}`);
      expect(step1.substring(47)).assertEqual(' code is 28.63, message is error');
      const step2: string = subject.reportDrawn(786);
      logInfo(`step2 reportDrawn(786): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(77);
      logInfo(`step2 reportDrawn(786): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step2 reportDrawn(786): step2.substring(45)=${step2.substring(45)}`);
      expect(step2.substring(45)).assertEqual('d, code is 786, message is error');
      const step3: string = subject.requestModal(false, 475);
      logInfo(`step3 requestModal(false, 475): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(81);
      logInfo(`step3 requestModal(false, 475): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step3 requestModal(false, 475): step3.substring(49)=${step3.substring(49)}`);
      expect(step3.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      const step4: string = subject.open('X2vVKeCoX1Z');
      logInfo(`step4 open("X2vVKeCoX1Z"): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.reportDrawn(353);
      logInfo(`step5 reportDrawn(353): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(77);
      logInfo(`step5 reportDrawn(353): step5.substring(0, 32)=${step5.substring(0, 32)}`);
      expect(step5.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step5 reportDrawn(353): step5.substring(45)=${step5.substring(45)}`);
      expect(step5.substring(45)).assertEqual('d, code is 353, message is error');
      logInfo(`reportDrawn>reportDrawn>requestModal>open...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`reportDrawn>reportDrawn>requestModal>open...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn>reportDrawn>requestModal>open...: subject.lastMessa...${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 353, message is error');
      logInfo(`reportDrawn>reportDrawn>requestModal>open...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0154 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0155
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0155
     * @tc.desc      UiExtensionPageState call flow terminateWithResult > reportDrawn > terminateWithResult > termina...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0155 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: number = subject.terminateWithResult(true);
      logInfo(`step1 terminateWithResult(true): step1=${step1}`);
      expect(step1).assertEqual(100);
      const step2: string = subject.reportDrawn(353);
      logInfo(`step2 reportDrawn(353): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(77);
      logInfo(`step2 reportDrawn(353): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step2 reportDrawn(353): step2.substring(45)=${step2.substring(45)}`);
      expect(step2.substring(45)).assertEqual('d, code is 353, message is error');
      const step3: number = subject.terminateWithResult(true);
      logInfo(`step3 terminateWithResult(true): step3=${step3}`);
      expect(step3).assertEqual(100);
      const step4: number = subject.terminateWithResult(false);
      logInfo(`step4 terminateWithResult(false): step4=${step4}`);
      expect(step4).assertEqual(99);
      logInfo(`terminateWithResult>reportDrawn>terminate...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`terminateWithResult>reportDrawn>terminate...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`terminateWithResult>reportDrawn>terminate...: subject.lastMessa...${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 353, message is error');
      logInfo(`terminateWithResult>reportDrawn>terminate...: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`terminateWithResult>reportDrawn>terminate...: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(99);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0155 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0156
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0156
     * @tc.desc      UiExtensionPageState call flow open > requestModal > open > open > requestModal keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0156 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.open('xR');
      logInfo(`step1 open("xR"): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.requestModal(true, 300);
      logInfo(`step2 requestModal(true, 300): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(81);
      logInfo(`step2 requestModal(true, 300): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step2 requestModal(true, 300): step2.substring(49)=${step2.substring(49)}`);
      expect(step2.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      const step3: string = subject.open('By4ABZLE');
      logInfo(`step3 open("By4ABZLE"): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.open('19Ak27w');
      logInfo(`step4 open("19Ak27w"): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.requestModal(true, 75);
      logInfo(`step5 requestModal(true, 75): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(80);
      logInfo(`step5 requestModal(true, 75): step5.substring(0, 32)=${step5.substring(0, 32)}`);
      expect(step5.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step5 requestModal(true, 75): step5.substring(48)=${step5.substring(48)}`);
      expect(step5.substring(48)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`open>requestModal>open>open>requestModal ...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(80);
      logInfo(`open>requestModal>open>open>requestModal ...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`open>requestModal>open>open>requestModal ...: subject.lastMessa...${subject.lastMessage.substring(48)}`);
      expect(subject.lastMessage.substring(48)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`open>requestModal>open>open>requestModal ...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(2);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0156 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0157
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0157
     * @tc.desc      UiExtensionPageState call flow requestModal > requestModal > reportDrawn > open keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0157 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.requestModal(true, 1);
      logInfo(`step1 requestModal(true, 1): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(79);
      logInfo(`step1 requestModal(true, 1): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step1 requestModal(true, 1): step1.substring(47)=${step1.substring(47)}`);
      expect(step1.substring(47)).assertEqual('age is SessionUIExtensionAbility');
      const step2: string = subject.requestModal(true, 350);
      logInfo(`step2 requestModal(true, 350): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(81);
      logInfo(`step2 requestModal(true, 350): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step2 requestModal(true, 350): step2.substring(49)=${step2.substring(49)}`);
      expect(step2.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      const step3: string = subject.reportDrawn(-224);
      logInfo(`step3 reportDrawn(-224): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(78);
      logInfo(`step3 reportDrawn(-224): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step3 reportDrawn(-224): step3.substring(46)=${step3.substring(46)}`);
      expect(step3.substring(46)).assertEqual(', code is -224, message is error');
      const step4: string = subject.open('h05Z1tQ');
      logInfo(`step4 open("h05Z1tQ"): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`requestModal>requestModal>reportDrawn>ope...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(78);
      logInfo(`requestModal>requestModal>reportDrawn>ope...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`requestModal>requestModal>reportDrawn>ope...: subject.lastMessa...${subject.lastMessage.substring(46)}`);
      expect(subject.lastMessage.substring(46)).assertEqual(', code is -224, message is error');
      logInfo(`requestModal>requestModal>reportDrawn>ope...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(2);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0157 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0158
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0158
     * @tc.desc      UiExtensionPageState call flow terminateWithResult > reportDrawn > open keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0158 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: number = subject.terminateWithResult(true);
      logInfo(`step1 terminateWithResult(true): step1=${step1}`);
      expect(step1).assertEqual(100);
      const step2: string = subject.reportDrawn(575);
      logInfo(`step2 reportDrawn(575): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(77);
      logInfo(`step2 reportDrawn(575): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step2 reportDrawn(575): step2.substring(45)=${step2.substring(45)}`);
      expect(step2.substring(45)).assertEqual('d, code is 575, message is error');
      const step3: string = subject.open(' abc ');
      logInfo(`step3 open(" abc "): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`terminateWithResult>reportDrawn>open final: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`terminateWithResult>reportDrawn>open final: subject.lastMess...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`terminateWithResult>reportDrawn>open final: subject.lastMessage...${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 575, message is error');
      logInfo(`terminateWithResult>reportDrawn>open final: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`terminateWithResult>reportDrawn>open final: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(100);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0158 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0159
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0159
     * @tc.desc      UiExtensionPageState call flow setPrivacyMode > terminateWithResult > setPrivacyMode > open > se...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0159 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.setPrivacyMode(false);
      logInfo(`step1 setPrivacyMode(false): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(84);
      logInfo(`step1 setPrivacyMode(false): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`step1 setPrivacyMode(false): step1.substring(52)=${step1.substring(52)}`);
      expect(step1.substring(52)).assertEqual('se) called. isPrivacyMode: false');
      const step2: number = subject.terminateWithResult(true);
      logInfo(`step2 terminateWithResult(true): step2=${step2}`);
      expect(step2).assertEqual(100);
      const step3: string = subject.setPrivacyMode(false);
      logInfo(`step3 setPrivacyMode(false): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(84);
      logInfo(`step3 setPrivacyMode(false): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`step3 setPrivacyMode(false): step3.substring(52)=${step3.substring(52)}`);
      expect(step3.substring(52)).assertEqual('se) called. isPrivacyMode: false');
      const step4: string = subject.open('123');
      logInfo(`step4 open("123"): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.setPrivacyMode(false);
      logInfo(`step5 setPrivacyMode(false): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(84);
      logInfo(`step5 setPrivacyMode(false): step5.substring(0, 32)=${step5.substring(0, 32)}`);
      expect(step5.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`step5 setPrivacyMode(false): step5.substring(52)=${step5.substring(52)}`);
      expect(step5.substring(52)).assertEqual('se) called. isPrivacyMode: false');
      logInfo(`setPrivacyMode>terminateWithResult>setPri...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(84);
      logInfo(`setPrivacyMode>terminateWithResult>setPri...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`setPrivacyMode>terminateWithResult>setPri...: subject.lastMessa...${subject.lastMessage.substring(52)}`);
      expect(subject.lastMessage.substring(52)).assertEqual('se) called. isPrivacyMode: false');
      logInfo(`setPrivacyMode>terminateWithResult>setPri...: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`setPrivacyMode>terminateWithResult>setPri...: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(100);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0159 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0160
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0160
     * @tc.desc      UiExtensionPageState call flow terminateWithResult > terminateWithResult > setPrivacyMode > requ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0160 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: number = subject.terminateWithResult(false);
      logInfo(`step1 terminateWithResult(false): step1=${step1}`);
      expect(step1).assertEqual(99);
      const step2: number = subject.terminateWithResult(false);
      logInfo(`step2 terminateWithResult(false): step2=${step2}`);
      expect(step2).assertEqual(99);
      const step3: string = subject.setPrivacyMode(true);
      logInfo(`step3 setPrivacyMode(true): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(84);
      logInfo(`step3 setPrivacyMode(true): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`step3 setPrivacyMode(true): step3.substring(52)=${step3.substring(52)}`);
      expect(step3.substring(52)).assertEqual('ack) called. isPrivacyMode: true');
      const step4: string = subject.requestModal(false, 275);
      logInfo(`step4 requestModal(false, 275): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(81);
      logInfo(`step4 requestModal(false, 275): step4.substring(0, 32)=${step4.substring(0, 32)}`);
      expect(step4.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step4 requestModal(false, 275): step4.substring(49)=${step4.substring(49)}`);
      expect(step4.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`terminateWithResult>terminateWithResult>s...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(81);
      logInfo(`terminateWithResult>terminateWithResult>s...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`terminateWithResult>terminateWithResult>s...: subject.lastMessa...${subject.lastMessage.substring(49)}`);
      expect(subject.lastMessage.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`terminateWithResult>terminateWithResult>s...: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`terminateWithResult>terminateWithResult>s...: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(99);
      logInfo(`terminateWithResult>terminateWithResult>s...: subject.privacyMode=${subject.privacyMode}`);
      expect(subject.privacyMode).assertTrue();
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0160 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0161
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0161
     * @tc.desc      UiExtensionPageState call flow open > reportDrawn > reportDrawn keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0161 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.open('nKak');
      logInfo(`step1 open("nKak"): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.reportDrawn(-318);
      logInfo(`step2 reportDrawn(-318): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(78);
      logInfo(`step2 reportDrawn(-318): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step2 reportDrawn(-318): step2.substring(46)=${step2.substring(46)}`);
      expect(step2.substring(46)).assertEqual(', code is -318, message is error');
      const step3: string = subject.reportDrawn(195);
      logInfo(`step3 reportDrawn(195): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(77);
      logInfo(`step3 reportDrawn(195): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step3 reportDrawn(195): step3.substring(45)=${step3.substring(45)}`);
      expect(step3.substring(45)).assertEqual('d, code is 195, message is error');
      logInfo(`open>reportDrawn>reportDrawn final: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`open>reportDrawn>reportDrawn final: subject.lastMessage.subs...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`open>reportDrawn>reportDrawn final: subject.lastMessage.substri...${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 195, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0161 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0162
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0162
     * @tc.desc      UiExtensionPageState call flow requestModal > setPrivacyMode > open > setPrivacyMode > requestMo...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0162 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.requestModal(false, 225);
      logInfo(`step1 requestModal(false, 225): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(81);
      logInfo(`step1 requestModal(false, 225): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step1 requestModal(false, 225): step1.substring(49)=${step1.substring(49)}`);
      expect(step1.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      const step2: string = subject.setPrivacyMode(true);
      logInfo(`step2 setPrivacyMode(true): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(84);
      logInfo(`step2 setPrivacyMode(true): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`step2 setPrivacyMode(true): step2.substring(52)=${step2.substring(52)}`);
      expect(step2.substring(52)).assertEqual('ack) called. isPrivacyMode: true');
      const step3: string = subject.open('VG9PQ315');
      logInfo(`step3 open("VG9PQ315"): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.setPrivacyMode(false);
      logInfo(`step4 setPrivacyMode(false): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(84);
      logInfo(`step4 setPrivacyMode(false): step4.substring(0, 32)=${step4.substring(0, 32)}`);
      expect(step4.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`step4 setPrivacyMode(false): step4.substring(52)=${step4.substring(52)}`);
      expect(step4.substring(52)).assertEqual('se) called. isPrivacyMode: false');
      const step5: string = subject.requestModal(true, 400);
      logInfo(`step5 requestModal(true, 400): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(81);
      logInfo(`step5 requestModal(true, 400): step5.substring(0, 32)=${step5.substring(0, 32)}`);
      expect(step5.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step5 requestModal(true, 400): step5.substring(49)=${step5.substring(49)}`);
      expect(step5.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`requestModal>setPrivacyMode>open>setPriva...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(81);
      logInfo(`requestModal>setPrivacyMode>open>setPriva...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal>setPrivacyMode>open>setPriva...: subject.lastMessa...${subject.lastMessage.substring(49)}`);
      expect(subject.lastMessage.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`requestModal>setPrivacyMode>open>setPriva...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(2);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0162 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0163
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0163
     * @tc.desc      UiExtensionPageState call flow reportDrawn > setPrivacyMode keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0163 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.reportDrawn(888);
      logInfo(`step1 reportDrawn(888): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(77);
      logInfo(`step1 reportDrawn(888): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step1 reportDrawn(888): step1.substring(45)=${step1.substring(45)}`);
      expect(step1.substring(45)).assertEqual('d, code is 888, message is error');
      const step2: string = subject.setPrivacyMode(false);
      logInfo(`step2 setPrivacyMode(false): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(84);
      logInfo(`step2 setPrivacyMode(false): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`step2 setPrivacyMode(false): step2.substring(52)=${step2.substring(52)}`);
      expect(step2.substring(52)).assertEqual('se) called. isPrivacyMode: false');
      logInfo(`reportDrawn>setPrivacyMode final: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(84);
      logInfo(`reportDrawn>setPrivacyMode final: subject.lastMessage.substr...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`reportDrawn>setPrivacyMode final: subject.lastMessage.substring...${subject.lastMessage.substring(52)}`);
      expect(subject.lastMessage.substring(52)).assertEqual('se) called. isPrivacyMode: false');
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0163 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0164
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0164
     * @tc.desc      UiExtensionPageState call flow requestModal > requestModal > requestModal > open keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0164 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.requestModal(true, 325);
      logInfo(`step1 requestModal(true, 325): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(81);
      logInfo(`step1 requestModal(true, 325): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step1 requestModal(true, 325): step1.substring(49)=${step1.substring(49)}`);
      expect(step1.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      const step2: string = subject.requestModal(true, 275);
      logInfo(`step2 requestModal(true, 275): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(81);
      logInfo(`step2 requestModal(true, 275): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step2 requestModal(true, 275): step2.substring(49)=${step2.substring(49)}`);
      expect(step2.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      const step3: string = subject.requestModal(true, 275);
      logInfo(`step3 requestModal(true, 275): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(81);
      logInfo(`step3 requestModal(true, 275): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step3 requestModal(true, 275): step3.substring(49)=${step3.substring(49)}`);
      expect(step3.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      const step4: string = subject.open('Tz4ASfYDof');
      logInfo(`step4 open("Tz4ASfYDof"): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`requestModal>requestModal>requestModal>op...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(81);
      logInfo(`requestModal>requestModal>requestModal>op...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal>requestModal>requestModal>op...: subject.lastMessa...${subject.lastMessage.substring(49)}`);
      expect(subject.lastMessage.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`requestModal>requestModal>requestModal>op...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(3);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0164 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0165
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0165
     * @tc.desc      UiExtensionPageState call flow requestModal > open keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0165 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.requestModal(false, 500);
      logInfo(`step1 requestModal(false, 500): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(81);
      logInfo(`step1 requestModal(false, 500): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step1 requestModal(false, 500): step1.substring(49)=${step1.substring(49)}`);
      expect(step1.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      const step2: string = subject.open('MdhTih4aT');
      logInfo(`step2 open("MdhTih4aT"): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`requestModal>open final: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(81);
      logInfo(`requestModal>open final: subject.lastMessage.substring(0, 32)=${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal>open final: subject.lastMessage.substring(49)=${subject.lastMessage.substring(49)}`);
      expect(subject.lastMessage.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`requestModal>open final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0165 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0166
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0166
     * @tc.desc      UiExtensionPageState call flow setPrivacyMode > open > terminateWithResult > reportDrawn > setPr...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0166 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.setPrivacyMode(false);
      logInfo(`step1 setPrivacyMode(false): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(84);
      logInfo(`step1 setPrivacyMode(false): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`step1 setPrivacyMode(false): step1.substring(52)=${step1.substring(52)}`);
      expect(step1.substring(52)).assertEqual('se) called. isPrivacyMode: false');
      const step2: string = subject.open('Rde');
      logInfo(`step2 open("Rde"): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.terminateWithResult(true);
      logInfo(`step3 terminateWithResult(true): step3=${step3}`);
      expect(step3).assertEqual(100);
      const step4: string = subject.reportDrawn(63);
      logInfo(`step4 reportDrawn(63): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(76);
      logInfo(`step4 reportDrawn(63): step4.substring(0, 32)=${step4.substring(0, 32)}`);
      expect(step4.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step4 reportDrawn(63): step4.substring(44)=${step4.substring(44)}`);
      expect(step4.substring(44)).assertEqual('ed, code is 63, message is error');
      const step5: string = subject.setPrivacyMode(true);
      logInfo(`step5 setPrivacyMode(true): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(84);
      logInfo(`step5 setPrivacyMode(true): step5.substring(0, 32)=${step5.substring(0, 32)}`);
      expect(step5.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`step5 setPrivacyMode(true): step5.substring(52)=${step5.substring(52)}`);
      expect(step5.substring(52)).assertEqual('ack) called. isPrivacyMode: true');
      logInfo(`setPrivacyMode>open>terminateWithResult>r...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(84);
      logInfo(`setPrivacyMode>open>terminateWithResult>r...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`setPrivacyMode>open>terminateWithResult>r...: subject.lastMessa...${subject.lastMessage.substring(52)}`);
      expect(subject.lastMessage.substring(52)).assertEqual('ack) called. isPrivacyMode: true');
      logInfo(`setPrivacyMode>open>terminateWithResult>r...: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`setPrivacyMode>open>terminateWithResult>r...: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(100);
      logInfo(`setPrivacyMode>open>terminateWithResult>r...: subject.privacyMode=${subject.privacyMode}`);
      expect(subject.privacyMode).assertTrue();
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0166 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0167
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0167
     * @tc.desc      UiExtensionPageState call flow requestModal > open > reportDrawn > open keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0167 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.requestModal(false, 1);
      logInfo(`step1 requestModal(false, 1): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(79);
      logInfo(`step1 requestModal(false, 1): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step1 requestModal(false, 1): step1.substring(47)=${step1.substring(47)}`);
      expect(step1.substring(47)).assertEqual('age is ContextUIExtensionAbility');
      const step2: string = subject.open(' ');
      logInfo(`step2 open(" "): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.reportDrawn(229);
      logInfo(`step3 reportDrawn(229): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(77);
      logInfo(`step3 reportDrawn(229): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step3 reportDrawn(229): step3.substring(45)=${step3.substring(45)}`);
      expect(step3.substring(45)).assertEqual('d, code is 229, message is error');
      const step4: string = subject.open('19MlAkKU2i');
      logInfo(`step4 open("19MlAkKU2i"): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`requestModal>open>reportDrawn>open final: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`requestModal>open>reportDrawn>open final: subject.lastMessag...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`requestModal>open>reportDrawn>open final: subject.lastMessage.s...${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 229, message is error');
      logInfo(`requestModal>open>reportDrawn>open final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0167 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0168
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0168
     * @tc.desc      UiExtensionPageState call flow requestModal > setPrivacyMode keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0168 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.requestModal(false, 125);
      logInfo(`step1 requestModal(false, 125): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(81);
      logInfo(`step1 requestModal(false, 125): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step1 requestModal(false, 125): step1.substring(49)=${step1.substring(49)}`);
      expect(step1.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      const step2: string = subject.setPrivacyMode(true);
      logInfo(`step2 setPrivacyMode(true): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(84);
      logInfo(`step2 setPrivacyMode(true): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`step2 setPrivacyMode(true): step2.substring(52)=${step2.substring(52)}`);
      expect(step2.substring(52)).assertEqual('ack) called. isPrivacyMode: true');
      logInfo(`requestModal>setPrivacyMode final: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(84);
      logInfo(`requestModal>setPrivacyMode final: subject.lastMessage.subst...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`requestModal>setPrivacyMode final: subject.lastMessage.substrin...${subject.lastMessage.substring(52)}`);
      expect(subject.lastMessage.substring(52)).assertEqual('ack) called. isPrivacyMode: true');
      logInfo(`requestModal>setPrivacyMode final: subject.privacyMode=${subject.privacyMode}`);
      expect(subject.privacyMode).assertTrue();
      logInfo(`requestModal>setPrivacyMode final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0168 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0169
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0169
     * @tc.desc      UiExtensionPageState call flow setPrivacyMode > reportDrawn > setPrivacyMode > setPrivacyMode > ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0169 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.setPrivacyMode(true);
      logInfo(`step1 setPrivacyMode(true): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(84);
      logInfo(`step1 setPrivacyMode(true): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`step1 setPrivacyMode(true): step1.substring(52)=${step1.substring(52)}`);
      expect(step1.substring(52)).assertEqual('ack) called. isPrivacyMode: true');
      const step2: string = subject.reportDrawn(400);
      logInfo(`step2 reportDrawn(400): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(77);
      logInfo(`step2 reportDrawn(400): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step2 reportDrawn(400): step2.substring(45)=${step2.substring(45)}`);
      expect(step2.substring(45)).assertEqual('d, code is 400, message is error');
      const step3: string = subject.setPrivacyMode(false);
      logInfo(`step3 setPrivacyMode(false): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(84);
      logInfo(`step3 setPrivacyMode(false): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`step3 setPrivacyMode(false): step3.substring(52)=${step3.substring(52)}`);
      expect(step3.substring(52)).assertEqual('se) called. isPrivacyMode: false');
      const step4: string = subject.setPrivacyMode(false);
      logInfo(`step4 setPrivacyMode(false): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(84);
      logInfo(`step4 setPrivacyMode(false): step4.substring(0, 32)=${step4.substring(0, 32)}`);
      expect(step4.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`step4 setPrivacyMode(false): step4.substring(52)=${step4.substring(52)}`);
      expect(step4.substring(52)).assertEqual('se) called. isPrivacyMode: false');
      const step5: number = subject.terminateWithResult(true);
      logInfo(`step5 terminateWithResult(true): step5=${step5}`);
      expect(step5).assertEqual(100);
      logInfo(`setPrivacyMode>reportDrawn>setPrivacyMode...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(84);
      logInfo(`setPrivacyMode>reportDrawn>setPrivacyMode...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`setPrivacyMode>reportDrawn>setPrivacyMode...: subject.lastMessa...${subject.lastMessage.substring(52)}`);
      expect(subject.lastMessage.substring(52)).assertEqual('se) called. isPrivacyMode: false');
      logInfo(`setPrivacyMode>reportDrawn>setPrivacyMode...: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`setPrivacyMode>reportDrawn>setPrivacyMode...: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(100);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0169 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0170
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0170
     * @tc.desc      UiExtensionPageState call flow requestModal > open keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0170 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.requestModal(false, 10);
      logInfo(`step1 requestModal(false, 10): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(80);
      logInfo(`step1 requestModal(false, 10): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step1 requestModal(false, 10): step1.substring(48)=${step1.substring(48)}`);
      expect(step1.substring(48)).assertEqual('age is ContextUIExtensionAbility');
      const step2: string = subject.open('5yydQNM');
      logInfo(`step2 open("5yydQNM"): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`requestModal>open final: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(80);
      logInfo(`requestModal>open final: subject.lastMessage.substring(0, 32)=${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal>open final: subject.lastMessage.substring(48)=${subject.lastMessage.substring(48)}`);
      expect(subject.lastMessage.substring(48)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`requestModal>open final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0170 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0171
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0171
     * @tc.desc      UiExtensionPageState call flow terminateWithResult > requestModal > reportDrawn keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0171 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: number = subject.terminateWithResult(true);
      logInfo(`step1 terminateWithResult(true): step1=${step1}`);
      expect(step1).assertEqual(100);
      const step2: string = subject.requestModal(true, 125);
      logInfo(`step2 requestModal(true, 125): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(81);
      logInfo(`step2 requestModal(true, 125): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step2 requestModal(true, 125): step2.substring(49)=${step2.substring(49)}`);
      expect(step2.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      const step3: string = subject.reportDrawn(140.56);
      logInfo(`step3 reportDrawn(140.56): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(80);
      logInfo(`step3 reportDrawn(140.56): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step3 reportDrawn(140.56): step3.substring(48)=${step3.substring(48)}`);
      expect(step3.substring(48)).assertEqual('code is 140.56, message is error');
      logInfo(`terminateWithResult>requestModal>reportDr...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(80);
      logInfo(`terminateWithResult>requestModal>reportDr...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`terminateWithResult>requestModal>reportDr...: subject.lastMessa...${subject.lastMessage.substring(48)}`);
      expect(subject.lastMessage.substring(48)).assertEqual('code is 140.56, message is error');
      logInfo(`terminateWithResult>requestModal>reportDr...: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`terminateWithResult>requestModal>reportDr...: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(100);
      logInfo(`terminateWithResult>requestModal>reportDr...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0171 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0172
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0172
     * @tc.desc      UiExtensionPageState call flow terminateWithResult > requestModal > setPrivacyMode keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0172 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: number = subject.terminateWithResult(true);
      logInfo(`step1 terminateWithResult(true): step1=${step1}`);
      expect(step1).assertEqual(100);
      const step2: string = subject.requestModal(false, -1);
      logInfo(`step2 requestModal(false, -1): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(80);
      logInfo(`step2 requestModal(false, -1): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step2 requestModal(false, -1): step2.substring(48)=${step2.substring(48)}`);
      expect(step2.substring(48)).assertEqual('age is ContextUIExtensionAbility');
      const step3: string = subject.setPrivacyMode(false);
      logInfo(`step3 setPrivacyMode(false): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(84);
      logInfo(`step3 setPrivacyMode(false): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`step3 setPrivacyMode(false): step3.substring(52)=${step3.substring(52)}`);
      expect(step3.substring(52)).assertEqual('se) called. isPrivacyMode: false');
      logInfo(`terminateWithResult>requestModal>setPriva...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(84);
      logInfo(`terminateWithResult>requestModal>setPriva...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`terminateWithResult>requestModal>setPriva...: subject.lastMessa...${subject.lastMessage.substring(52)}`);
      expect(subject.lastMessage.substring(52)).assertEqual('se) called. isPrivacyMode: false');
      logInfo(`terminateWithResult>requestModal>setPriva...: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`terminateWithResult>requestModal>setPriva...: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(100);
      logInfo(`terminateWithResult>requestModal>setPriva...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0172 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0173
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0173
     * @tc.desc      UiExtensionPageState call flow terminateWithResult > terminateWithResult > requestModal > termin...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0173 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: number = subject.terminateWithResult(false);
      logInfo(`step1 terminateWithResult(false): step1=${step1}`);
      expect(step1).assertEqual(99);
      const step2: number = subject.terminateWithResult(false);
      logInfo(`step2 terminateWithResult(false): step2=${step2}`);
      expect(step2).assertEqual(99);
      const step3: string = subject.requestModal(true, 225);
      logInfo(`step3 requestModal(true, 225): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(81);
      logInfo(`step3 requestModal(true, 225): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step3 requestModal(true, 225): step3.substring(49)=${step3.substring(49)}`);
      expect(step3.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      const step4: number = subject.terminateWithResult(false);
      logInfo(`step4 terminateWithResult(false): step4=${step4}`);
      expect(step4).assertEqual(99);
      const step5: string = subject.reportDrawn(223);
      logInfo(`step5 reportDrawn(223): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(77);
      logInfo(`step5 reportDrawn(223): step5.substring(0, 32)=${step5.substring(0, 32)}`);
      expect(step5.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step5 reportDrawn(223): step5.substring(45)=${step5.substring(45)}`);
      expect(step5.substring(45)).assertEqual('d, code is 223, message is error');
      logInfo(`terminateWithResult>terminateWithResult>r...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`terminateWithResult>terminateWithResult>r...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`terminateWithResult>terminateWithResult>r...: subject.lastMessa...${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 223, message is error');
      logInfo(`terminateWithResult>terminateWithResult>r...: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`terminateWithResult>terminateWithResult>r...: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(99);
      logInfo(`terminateWithResult>terminateWithResult>r...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0173 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0174
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0174
     * @tc.desc      UiExtensionPageState call flow terminateWithResult > open > open > reportDrawn > reportDrawn kee...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0174 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: number = subject.terminateWithResult(false);
      logInfo(`step1 terminateWithResult(false): step1=${step1}`);
      expect(step1).assertEqual(99);
      const step2: string = subject.open('bbpiTO7Zjk');
      logInfo(`step2 open("bbpiTO7Zjk"): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.open('   ');
      logInfo(`step3 open("   "): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.reportDrawn(525);
      logInfo(`step4 reportDrawn(525): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(77);
      logInfo(`step4 reportDrawn(525): step4.substring(0, 32)=${step4.substring(0, 32)}`);
      expect(step4.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step4 reportDrawn(525): step4.substring(45)=${step4.substring(45)}`);
      expect(step4.substring(45)).assertEqual('d, code is 525, message is error');
      const step5: string = subject.reportDrawn(-224);
      logInfo(`step5 reportDrawn(-224): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(78);
      logInfo(`step5 reportDrawn(-224): step5.substring(0, 32)=${step5.substring(0, 32)}`);
      expect(step5.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step5 reportDrawn(-224): step5.substring(46)=${step5.substring(46)}`);
      expect(step5.substring(46)).assertEqual(', code is -224, message is error');
      logInfo(`terminateWithResult>open>open>reportDrawn...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(78);
      logInfo(`terminateWithResult>open>open>reportDrawn...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`terminateWithResult>open>open>reportDrawn...: subject.lastMessa...${subject.lastMessage.substring(46)}`);
      expect(subject.lastMessage.substring(46)).assertEqual(', code is -224, message is error');
      logInfo(`terminateWithResult>open>open>reportDrawn...: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`terminateWithResult>open>open>reportDrawn...: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(99);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0174 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0175
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0175
     * @tc.desc      UiExtensionPageState call flow terminateWithResult > terminateWithResult > terminateWithResult >...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0175 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: number = subject.terminateWithResult(false);
      logInfo(`step1 terminateWithResult(false): step1=${step1}`);
      expect(step1).assertEqual(99);
      const step2: number = subject.terminateWithResult(true);
      logInfo(`step2 terminateWithResult(true): step2=${step2}`);
      expect(step2).assertEqual(100);
      const step3: number = subject.terminateWithResult(false);
      logInfo(`step3 terminateWithResult(false): step3=${step3}`);
      expect(step3).assertEqual(99);
      const step4: string = subject.requestModal(false, 450);
      logInfo(`step4 requestModal(false, 450): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(81);
      logInfo(`step4 requestModal(false, 450): step4.substring(0, 32)=${step4.substring(0, 32)}`);
      expect(step4.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step4 requestModal(false, 450): step4.substring(49)=${step4.substring(49)}`);
      expect(step4.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      const step5: number = subject.terminateWithResult(false);
      logInfo(`step5 terminateWithResult(false): step5=${step5}`);
      expect(step5).assertEqual(99);
      logInfo(`terminateWithResult>terminateWithResult>t...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(81);
      logInfo(`terminateWithResult>terminateWithResult>t...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`terminateWithResult>terminateWithResult>t...: subject.lastMessa...${subject.lastMessage.substring(49)}`);
      expect(subject.lastMessage.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`terminateWithResult>terminateWithResult>t...: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`terminateWithResult>terminateWithResult>t...: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(99);
      logInfo(`terminateWithResult>terminateWithResult>t...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0175 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0176
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0176
     * @tc.desc      UiExtensionPageState call flow open > reportDrawn > terminateWithResult keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0176 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.open('xa');
      logInfo(`step1 open("xa"): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.reportDrawn(50.71);
      logInfo(`step2 reportDrawn(50.71): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(79);
      logInfo(`step2 reportDrawn(50.71): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step2 reportDrawn(50.71): step2.substring(47)=${step2.substring(47)}`);
      expect(step2.substring(47)).assertEqual(' code is 50.71, message is error');
      const step3: number = subject.terminateWithResult(false);
      logInfo(`step3 terminateWithResult(false): step3=${step3}`);
      expect(step3).assertEqual(99);
      logInfo(`open>reportDrawn>terminateWithResult final: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(79);
      logInfo(`open>reportDrawn>terminateWithResult final: subject.lastMess...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`open>reportDrawn>terminateWithResult final: subject.lastMessage...${subject.lastMessage.substring(47)}`);
      expect(subject.lastMessage.substring(47)).assertEqual(' code is 50.71, message is error');
      logInfo(`open>reportDrawn>terminateWithResult final: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`open>reportDrawn>terminateWithResult final: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(99);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0176 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0177
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0177
     * @tc.desc      UiExtensionPageState call flow reportDrawn > open > reportDrawn > open keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0177 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.reportDrawn(143);
      logInfo(`step1 reportDrawn(143): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(77);
      logInfo(`step1 reportDrawn(143): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step1 reportDrawn(143): step1.substring(45)=${step1.substring(45)}`);
      expect(step1.substring(45)).assertEqual('d, code is 143, message is error');
      const step2: string = subject.open('xR');
      logInfo(`step2 open("xR"): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.reportDrawn(708);
      logInfo(`step3 reportDrawn(708): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(77);
      logInfo(`step3 reportDrawn(708): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step3 reportDrawn(708): step3.substring(45)=${step3.substring(45)}`);
      expect(step3.substring(45)).assertEqual('d, code is 708, message is error');
      const step4: string = subject.open('xa');
      logInfo(`step4 open("xa"): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`reportDrawn>open>reportDrawn>open final: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`reportDrawn>open>reportDrawn>open final: subject.lastMessage...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn>open>reportDrawn>open final: subject.lastMessage.su...${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 708, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0177 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0178
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0178
     * @tc.desc      UiExtensionPageState call flow reportDrawn > open > requestModal keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0178 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.reportDrawn(650);
      logInfo(`step1 reportDrawn(650): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(77);
      logInfo(`step1 reportDrawn(650): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step1 reportDrawn(650): step1.substring(45)=${step1.substring(45)}`);
      expect(step1.substring(45)).assertEqual('d, code is 650, message is error');
      const step2: string = subject.open('Hello WorldHello World');
      logInfo(`step2 open("Hello WorldHello World"): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.requestModal(false, -1);
      logInfo(`step3 requestModal(false, -1): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(80);
      logInfo(`step3 requestModal(false, -1): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step3 requestModal(false, -1): step3.substring(48)=${step3.substring(48)}`);
      expect(step3.substring(48)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`reportDrawn>open>requestModal final: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(80);
      logInfo(`reportDrawn>open>requestModal final: subject.lastMessage.sub...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`reportDrawn>open>requestModal final: subject.lastMessage.substr...${subject.lastMessage.substring(48)}`);
      expect(subject.lastMessage.substring(48)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`reportDrawn>open>requestModal final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0178 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0179
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0179
     * @tc.desc      UiExtensionPageState call flow open > terminateWithResult > terminateWithResult keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0179 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.open('x');
      logInfo(`step1 open("x"): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.terminateWithResult(true);
      logInfo(`step2 terminateWithResult(true): step2=${step2}`);
      expect(step2).assertEqual(100);
      const step3: number = subject.terminateWithResult(false);
      logInfo(`step3 terminateWithResult(false): step3=${step3}`);
      expect(step3).assertEqual(99);
      logInfo(`open>terminateWithResult>terminateWithRes...: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`open>terminateWithResult>terminateWithRes...: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(99);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0179 end`);
    });
  });
}
