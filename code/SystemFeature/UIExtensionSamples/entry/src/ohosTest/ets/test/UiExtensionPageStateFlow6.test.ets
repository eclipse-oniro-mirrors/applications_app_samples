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

/** Logic checks for UiExtensionPageState flow (36 cases). */
export default function uiExtensionPageStateFlow6Test(): void {
  describe('UiExtensionPageStateFlow6Test', () => {
    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0180
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0180
     * @tc.desc      UiExtensionPageState call flow setPrivacyMode > open > terminateWithResult > requestModal > term...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0180 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.setPrivacyMode(false);
      logInfo(`step1 setPrivacyMode(false): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(84);
      logInfo(`step1 setPrivacyMode(false): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`step1 setPrivacyMode(false): step1.substring(52)=${step1.substring(52)}`);
      expect(step1.substring(52)).assertEqual('se) called. isPrivacyMode: false');
      const step2: string = subject.open('ko8Gym');
      logInfo(`step2 open("ko8Gym"): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.terminateWithResult(false);
      logInfo(`step3 terminateWithResult(false): step3=${step3}`);
      expect(step3).assertEqual(99);
      const step4: string = subject.requestModal(true, -1);
      logInfo(`step4 requestModal(true, -1): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(80);
      logInfo(`step4 requestModal(true, -1): step4.substring(0, 32)=${step4.substring(0, 32)}`);
      expect(step4.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step4 requestModal(true, -1): step4.substring(48)=${step4.substring(48)}`);
      expect(step4.substring(48)).assertEqual('age is SessionUIExtensionAbility');
      const step5: number = subject.terminateWithResult(false);
      logInfo(`step5 terminateWithResult(false): step5=${step5}`);
      expect(step5).assertEqual(99);
      logInfo(`setPrivacyMode>open>terminateWithResult>r...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(80);
      logInfo(`setPrivacyMode>open>terminateWithResult>r...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`setPrivacyMode>open>terminateWithResult>r...: subject.lastMessa...${subject.lastMessage.substring(48)}`);
      expect(subject.lastMessage.substring(48)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`setPrivacyMode>open>terminateWithResult>r...: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`setPrivacyMode>open>terminateWithResult>r...: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(99);
      logInfo(`setPrivacyMode>open>terminateWithResult>r...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0180 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0181
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0181
     * @tc.desc      UiExtensionPageState call flow open > requestModal > requestModal > setPrivacyMode > reportDrawn...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0181 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.open('juF6JdWeP');
      logInfo(`step1 open("juF6JdWeP"): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.requestModal(false, 125);
      logInfo(`step2 requestModal(false, 125): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(81);
      logInfo(`step2 requestModal(false, 125): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step2 requestModal(false, 125): step2.substring(49)=${step2.substring(49)}`);
      expect(step2.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      const step3: string = subject.requestModal(false, 200);
      logInfo(`step3 requestModal(false, 200): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(81);
      logInfo(`step3 requestModal(false, 200): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step3 requestModal(false, 200): step3.substring(49)=${step3.substring(49)}`);
      expect(step3.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      const step4: string = subject.setPrivacyMode(false);
      logInfo(`step4 setPrivacyMode(false): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(84);
      logInfo(`step4 setPrivacyMode(false): step4.substring(0, 32)=${step4.substring(0, 32)}`);
      expect(step4.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`step4 setPrivacyMode(false): step4.substring(52)=${step4.substring(52)}`);
      expect(step4.substring(52)).assertEqual('se) called. isPrivacyMode: false');
      const step5: string = subject.reportDrawn(279.01);
      logInfo(`step5 reportDrawn(279.01): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(80);
      logInfo(`step5 reportDrawn(279.01): step5.substring(0, 32)=${step5.substring(0, 32)}`);
      expect(step5.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step5 reportDrawn(279.01): step5.substring(48)=${step5.substring(48)}`);
      expect(step5.substring(48)).assertEqual('code is 279.01, message is error');
      logInfo(`open>requestModal>requestModal>setPrivacy...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(80);
      logInfo(`open>requestModal>requestModal>setPrivacy...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`open>requestModal>requestModal>setPrivacy...: subject.lastMessa...${subject.lastMessage.substring(48)}`);
      expect(subject.lastMessage.substring(48)).assertEqual('code is 279.01, message is error');
      logInfo(`open>requestModal>requestModal>setPrivacy...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(2);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0181 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0182
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0182
     * @tc.desc      UiExtensionPageState call flow open > setPrivacyMode > setPrivacyMode > setPrivacyMode > termina...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0182 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.open('aa');
      logInfo(`step1 open("aa"): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.setPrivacyMode(true);
      logInfo(`step2 setPrivacyMode(true): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(84);
      logInfo(`step2 setPrivacyMode(true): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`step2 setPrivacyMode(true): step2.substring(52)=${step2.substring(52)}`);
      expect(step2.substring(52)).assertEqual('ack) called. isPrivacyMode: true');
      const step3: string = subject.setPrivacyMode(false);
      logInfo(`step3 setPrivacyMode(false): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(84);
      logInfo(`step3 setPrivacyMode(false): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`step3 setPrivacyMode(false): step3.substring(52)=${step3.substring(52)}`);
      expect(step3.substring(52)).assertEqual('se) called. isPrivacyMode: false');
      const step4: string = subject.setPrivacyMode(true);
      logInfo(`step4 setPrivacyMode(true): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(84);
      logInfo(`step4 setPrivacyMode(true): step4.substring(0, 32)=${step4.substring(0, 32)}`);
      expect(step4.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`step4 setPrivacyMode(true): step4.substring(52)=${step4.substring(52)}`);
      expect(step4.substring(52)).assertEqual('ack) called. isPrivacyMode: true');
      const step5: number = subject.terminateWithResult(true);
      logInfo(`step5 terminateWithResult(true): step5=${step5}`);
      expect(step5).assertEqual(100);
      logInfo(`open>setPrivacyMode>setPrivacyMode>setPri...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(84);
      logInfo(`open>setPrivacyMode>setPrivacyMode>setPri...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`open>setPrivacyMode>setPrivacyMode>setPri...: subject.lastMessa...${subject.lastMessage.substring(52)}`);
      expect(subject.lastMessage.substring(52)).assertEqual('ack) called. isPrivacyMode: true');
      logInfo(`open>setPrivacyMode>setPrivacyMode>setPri...: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`open>setPrivacyMode>setPrivacyMode>setPri...: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(100);
      logInfo(`open>setPrivacyMode>setPrivacyMode>setPri...: subject.privacyMode=${subject.privacyMode}`);
      expect(subject.privacyMode).assertTrue();
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0182 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0183
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0183
     * @tc.desc      UiExtensionPageState call flow requestModal > requestModal keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0183 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.requestModal(true, 150);
      logInfo(`step1 requestModal(true, 150): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(81);
      logInfo(`step1 requestModal(true, 150): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step1 requestModal(true, 150): step1.substring(49)=${step1.substring(49)}`);
      expect(step1.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      const step2: string = subject.requestModal(false, 1);
      logInfo(`step2 requestModal(false, 1): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(79);
      logInfo(`step2 requestModal(false, 1): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step2 requestModal(false, 1): step2.substring(47)=${step2.substring(47)}`);
      expect(step2.substring(47)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`requestModal>requestModal final: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(79);
      logInfo(`requestModal>requestModal final: subject.lastMessage.substri...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal>requestModal final: subject.lastMessage.substring(...${subject.lastMessage.substring(47)}`);
      expect(subject.lastMessage.substring(47)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`requestModal>requestModal final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(2);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0183 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0184
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0184
     * @tc.desc      UiExtensionPageState call flow setPrivacyMode > reportDrawn keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0184 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.setPrivacyMode(false);
      logInfo(`step1 setPrivacyMode(false): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(84);
      logInfo(`step1 setPrivacyMode(false): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`step1 setPrivacyMode(false): step1.substring(52)=${step1.substring(52)}`);
      expect(step1.substring(52)).assertEqual('se) called. isPrivacyMode: false');
      const step2: string = subject.reportDrawn(-433);
      logInfo(`step2 reportDrawn(-433): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(78);
      logInfo(`step2 reportDrawn(-433): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step2 reportDrawn(-433): step2.substring(46)=${step2.substring(46)}`);
      expect(step2.substring(46)).assertEqual(', code is -433, message is error');
      logInfo(`setPrivacyMode>reportDrawn final: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(78);
      logInfo(`setPrivacyMode>reportDrawn final: subject.lastMessage.substr...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`setPrivacyMode>reportDrawn final: subject.lastMessage.substring...${subject.lastMessage.substring(46)}`);
      expect(subject.lastMessage.substring(46)).assertEqual(', code is -433, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0184 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0185
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0185
     * @tc.desc      UiExtensionPageState call flow open > open > setPrivacyMode keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0185 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.open('vS7d4RAa9rDd');
      logInfo(`step1 open("vS7d4RAa9rDd"): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.open('iz');
      logInfo(`step2 open("iz"): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.setPrivacyMode(true);
      logInfo(`step3 setPrivacyMode(true): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(84);
      logInfo(`step3 setPrivacyMode(true): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`step3 setPrivacyMode(true): step3.substring(52)=${step3.substring(52)}`);
      expect(step3.substring(52)).assertEqual('ack) called. isPrivacyMode: true');
      logInfo(`open>open>setPrivacyMode final: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(84);
      logInfo(`open>open>setPrivacyMode final: subject.lastMessage.substrin...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`open>open>setPrivacyMode final: subject.lastMessage.substring(52)=${subject.lastMessage.substring(52)}`);
      expect(subject.lastMessage.substring(52)).assertEqual('ack) called. isPrivacyMode: true');
      logInfo(`open>open>setPrivacyMode final: subject.privacyMode=${subject.privacyMode}`);
      expect(subject.privacyMode).assertTrue();
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0185 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0186
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0186
     * @tc.desc      UiExtensionPageState call flow requestModal > reportDrawn > terminateWithResult > terminateWithR...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0186 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.requestModal(true, 1);
      logInfo(`step1 requestModal(true, 1): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(79);
      logInfo(`step1 requestModal(true, 1): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step1 requestModal(true, 1): step1.substring(47)=${step1.substring(47)}`);
      expect(step1.substring(47)).assertEqual('age is SessionUIExtensionAbility');
      const step2: string = subject.reportDrawn(900);
      logInfo(`step2 reportDrawn(900): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(77);
      logInfo(`step2 reportDrawn(900): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step2 reportDrawn(900): step2.substring(45)=${step2.substring(45)}`);
      expect(step2.substring(45)).assertEqual('d, code is 900, message is error');
      const step3: number = subject.terminateWithResult(false);
      logInfo(`step3 terminateWithResult(false): step3=${step3}`);
      expect(step3).assertEqual(99);
      const step4: number = subject.terminateWithResult(false);
      logInfo(`step4 terminateWithResult(false): step4=${step4}`);
      expect(step4).assertEqual(99);
      const step5: number = subject.terminateWithResult(false);
      logInfo(`step5 terminateWithResult(false): step5=${step5}`);
      expect(step5).assertEqual(99);
      logInfo(`requestModal>reportDrawn>terminateWithRes...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`requestModal>reportDrawn>terminateWithRes...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`requestModal>reportDrawn>terminateWithRes...: subject.lastMessa...${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 900, message is error');
      logInfo(`requestModal>reportDrawn>terminateWithRes...: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`requestModal>reportDrawn>terminateWithRes...: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(99);
      logInfo(`requestModal>reportDrawn>terminateWithRes...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0186 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0187
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0187
     * @tc.desc      UiExtensionPageState call flow terminateWithResult > setPrivacyMode > open > requestModal keeps ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0187 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: number = subject.terminateWithResult(true);
      logInfo(`step1 terminateWithResult(true): step1=${step1}`);
      expect(step1).assertEqual(100);
      const step2: string = subject.setPrivacyMode(true);
      logInfo(`step2 setPrivacyMode(true): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(84);
      logInfo(`step2 setPrivacyMode(true): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`step2 setPrivacyMode(true): step2.substring(52)=${step2.substring(52)}`);
      expect(step2.substring(52)).assertEqual('ack) called. isPrivacyMode: true');
      const step3: string = subject.open('H');
      logInfo(`step3 open("H"): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.requestModal(true, 375);
      logInfo(`step4 requestModal(true, 375): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(81);
      logInfo(`step4 requestModal(true, 375): step4.substring(0, 32)=${step4.substring(0, 32)}`);
      expect(step4.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step4 requestModal(true, 375): step4.substring(49)=${step4.substring(49)}`);
      expect(step4.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`terminateWithResult>setPrivacyMode>open>r...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(81);
      logInfo(`terminateWithResult>setPrivacyMode>open>r...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`terminateWithResult>setPrivacyMode>open>r...: subject.lastMessa...${subject.lastMessage.substring(49)}`);
      expect(subject.lastMessage.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`terminateWithResult>setPrivacyMode>open>r...: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`terminateWithResult>setPrivacyMode>open>r...: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(100);
      logInfo(`terminateWithResult>setPrivacyMode>open>r...: subject.privacyMode=${subject.privacyMode}`);
      expect(subject.privacyMode).assertTrue();
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0187 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0188
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0188
     * @tc.desc      UiExtensionPageState call flow terminateWithResult > open > requestModal > setPrivacyMode > open...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0188 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: number = subject.terminateWithResult(true);
      logInfo(`step1 terminateWithResult(true): step1=${step1}`);
      expect(step1).assertEqual(100);
      const step2: string = subject.open('vS7d4RAa9rDd');
      logInfo(`step2 open("vS7d4RAa9rDd"): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.requestModal(false, 10);
      logInfo(`step3 requestModal(false, 10): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(80);
      logInfo(`step3 requestModal(false, 10): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step3 requestModal(false, 10): step3.substring(48)=${step3.substring(48)}`);
      expect(step3.substring(48)).assertEqual('age is ContextUIExtensionAbility');
      const step4: string = subject.setPrivacyMode(false);
      logInfo(`step4 setPrivacyMode(false): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(84);
      logInfo(`step4 setPrivacyMode(false): step4.substring(0, 32)=${step4.substring(0, 32)}`);
      expect(step4.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`step4 setPrivacyMode(false): step4.substring(52)=${step4.substring(52)}`);
      expect(step4.substring(52)).assertEqual('se) called. isPrivacyMode: false');
      const step5: string = subject.open('a');
      logInfo(`step5 open("a"): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`terminateWithResult>open>requestModal>set...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(84);
      logInfo(`terminateWithResult>open>requestModal>set...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`terminateWithResult>open>requestModal>set...: subject.lastMessa...${subject.lastMessage.substring(52)}`);
      expect(subject.lastMessage.substring(52)).assertEqual('se) called. isPrivacyMode: false');
      logInfo(`terminateWithResult>open>requestModal>set...: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`terminateWithResult>open>requestModal>set...: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(100);
      logInfo(`terminateWithResult>open>requestModal>set...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0188 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0189
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0189
     * @tc.desc      UiExtensionPageState call flow terminateWithResult > reportDrawn keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0189 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: number = subject.terminateWithResult(false);
      logInfo(`step1 terminateWithResult(false): step1=${step1}`);
      expect(step1).assertEqual(99);
      const step2: string = subject.reportDrawn(143);
      logInfo(`step2 reportDrawn(143): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(77);
      logInfo(`step2 reportDrawn(143): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step2 reportDrawn(143): step2.substring(45)=${step2.substring(45)}`);
      expect(step2.substring(45)).assertEqual('d, code is 143, message is error');
      logInfo(`terminateWithResult>reportDrawn final: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`terminateWithResult>reportDrawn final: subject.lastMessage.s...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`terminateWithResult>reportDrawn final: subject.lastMessage.subs...${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 143, message is error');
      logInfo(`terminateWithResult>reportDrawn final: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`terminateWithResult>reportDrawn final: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(99);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0189 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0190
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0190
     * @tc.desc      UiExtensionPageState call flow terminateWithResult > open keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0190 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: number = subject.terminateWithResult(true);
      logInfo(`step1 terminateWithResult(true): step1=${step1}`);
      expect(step1).assertEqual(100);
      const step2: string = subject.open('By4ABZLE');
      logInfo(`step2 open("By4ABZLE"): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`terminateWithResult>open final: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`terminateWithResult>open final: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(100);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0190 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0191
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0191
     * @tc.desc      UiExtensionPageState call flow open > terminateWithResult > setPrivacyMode > terminateWithResult...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0191 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.open('D');
      logInfo(`step1 open("D"): step1=${step1}`);
      expect(step1).assertEqual('');
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
      const step4: number = subject.terminateWithResult(false);
      logInfo(`step4 terminateWithResult(false): step4=${step4}`);
      expect(step4).assertEqual(99);
      const step5: number = subject.terminateWithResult(false);
      logInfo(`step5 terminateWithResult(false): step5=${step5}`);
      expect(step5).assertEqual(99);
      logInfo(`open>terminateWithResult>setPrivacyMode>t...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(84);
      logInfo(`open>terminateWithResult>setPrivacyMode>t...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`open>terminateWithResult>setPrivacyMode>t...: subject.lastMessa...${subject.lastMessage.substring(52)}`);
      expect(subject.lastMessage.substring(52)).assertEqual('se) called. isPrivacyMode: false');
      logInfo(`open>terminateWithResult>setPrivacyMode>t...: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`open>terminateWithResult>setPrivacyMode>t...: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(99);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0191 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0192
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0192
     * @tc.desc      UiExtensionPageState call flow setPrivacyMode > terminateWithResult > terminateWithResult > open...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0192 begin`);
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
      const step3: number = subject.terminateWithResult(true);
      logInfo(`step3 terminateWithResult(true): step3=${step3}`);
      expect(step3).assertEqual(100);
      const step4: string = subject.open(' ');
      logInfo(`step4 open(" "): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`setPrivacyMode>terminateWithResult>termin...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(84);
      logInfo(`setPrivacyMode>terminateWithResult>termin...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`setPrivacyMode>terminateWithResult>termin...: subject.lastMessa...${subject.lastMessage.substring(52)}`);
      expect(subject.lastMessage.substring(52)).assertEqual('se) called. isPrivacyMode: false');
      logInfo(`setPrivacyMode>terminateWithResult>termin...: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`setPrivacyMode>terminateWithResult>termin...: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(100);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0192 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0193
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0193
     * @tc.desc      UiExtensionPageState call flow open > terminateWithResult > open > terminateWithResult > setPriv...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0193 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.open('PN');
      logInfo(`step1 open("PN"): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.terminateWithResult(true);
      logInfo(`step2 terminateWithResult(true): step2=${step2}`);
      expect(step2).assertEqual(100);
      const step3: string = subject.open('uP');
      logInfo(`step3 open("uP"): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: number = subject.terminateWithResult(false);
      logInfo(`step4 terminateWithResult(false): step4=${step4}`);
      expect(step4).assertEqual(99);
      const step5: string = subject.setPrivacyMode(false);
      logInfo(`step5 setPrivacyMode(false): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(84);
      logInfo(`step5 setPrivacyMode(false): step5.substring(0, 32)=${step5.substring(0, 32)}`);
      expect(step5.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`step5 setPrivacyMode(false): step5.substring(52)=${step5.substring(52)}`);
      expect(step5.substring(52)).assertEqual('se) called. isPrivacyMode: false');
      logInfo(`open>terminateWithResult>open>terminateWi...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(84);
      logInfo(`open>terminateWithResult>open>terminateWi...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`open>terminateWithResult>open>terminateWi...: subject.lastMessa...${subject.lastMessage.substring(52)}`);
      expect(subject.lastMessage.substring(52)).assertEqual('se) called. isPrivacyMode: false');
      logInfo(`open>terminateWithResult>open>terminateWi...: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`open>terminateWithResult>open>terminateWi...: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(99);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0193 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0194
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0194
     * @tc.desc      UiExtensionPageState call flow setPrivacyMode > terminateWithResult keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0194 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.setPrivacyMode(true);
      logInfo(`step1 setPrivacyMode(true): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(84);
      logInfo(`step1 setPrivacyMode(true): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`step1 setPrivacyMode(true): step1.substring(52)=${step1.substring(52)}`);
      expect(step1.substring(52)).assertEqual('ack) called. isPrivacyMode: true');
      const step2: number = subject.terminateWithResult(true);
      logInfo(`step2 terminateWithResult(true): step2=${step2}`);
      expect(step2).assertEqual(100);
      logInfo(`setPrivacyMode>terminateWithResult final: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(84);
      logInfo(`setPrivacyMode>terminateWithResult final: subject.lastMessag...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`setPrivacyMode>terminateWithResult final: subject.lastMessage.s...${subject.lastMessage.substring(52)}`);
      expect(subject.lastMessage.substring(52)).assertEqual('ack) called. isPrivacyMode: true');
      logInfo(`setPrivacyMode>terminateWithResult final: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`setPrivacyMode>terminateWithResult final: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(100);
      logInfo(`setPrivacyMode>terminateWithResult final: subject.privacyMode=${subject.privacyMode}`);
      expect(subject.privacyMode).assertTrue();
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0194 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0195
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0195
     * @tc.desc      UiExtensionPageState call flow open > open > reportDrawn > terminateWithResult keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0195 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.open('5yydQNM');
      logInfo(`step1 open("5yydQNM"): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.open(' x ');
      logInfo(`step2 open(" x "): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.reportDrawn(50.71);
      logInfo(`step3 reportDrawn(50.71): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(79);
      logInfo(`step3 reportDrawn(50.71): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step3 reportDrawn(50.71): step3.substring(47)=${step3.substring(47)}`);
      expect(step3.substring(47)).assertEqual(' code is 50.71, message is error');
      const step4: number = subject.terminateWithResult(true);
      logInfo(`step4 terminateWithResult(true): step4=${step4}`);
      expect(step4).assertEqual(100);
      logInfo(`open>open>reportDrawn>terminateWithResult...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(79);
      logInfo(`open>open>reportDrawn>terminateWithResult...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`open>open>reportDrawn>terminateWithResult...: subject.lastMessa...${subject.lastMessage.substring(47)}`);
      expect(subject.lastMessage.substring(47)).assertEqual(' code is 50.71, message is error');
      logInfo(`open>open>reportDrawn>terminateWithResult...: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`open>open>reportDrawn>terminateWithResult...: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(100);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0195 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0196
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0196
     * @tc.desc      UiExtensionPageState call flow requestModal > reportDrawn > setPrivacyMode > requestModal > requ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0196 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.requestModal(true, 450);
      logInfo(`step1 requestModal(true, 450): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(81);
      logInfo(`step1 requestModal(true, 450): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step1 requestModal(true, 450): step1.substring(49)=${step1.substring(49)}`);
      expect(step1.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      const step2: string = subject.reportDrawn(70.48);
      logInfo(`step2 reportDrawn(70.48): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(79);
      logInfo(`step2 reportDrawn(70.48): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step2 reportDrawn(70.48): step2.substring(47)=${step2.substring(47)}`);
      expect(step2.substring(47)).assertEqual(' code is 70.48, message is error');
      const step3: string = subject.setPrivacyMode(true);
      logInfo(`step3 setPrivacyMode(true): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(84);
      logInfo(`step3 setPrivacyMode(true): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`step3 setPrivacyMode(true): step3.substring(52)=${step3.substring(52)}`);
      expect(step3.substring(52)).assertEqual('ack) called. isPrivacyMode: true');
      const step4: string = subject.requestModal(false, 0);
      logInfo(`step4 requestModal(false, 0): step4=${step4}`);
      expect(step4).assertEqual('requestModalUIExtension succeed.');
      const step5: string = subject.requestModal(true, 300);
      logInfo(`step5 requestModal(true, 300): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(81);
      logInfo(`step5 requestModal(true, 300): step5.substring(0, 32)=${step5.substring(0, 32)}`);
      expect(step5.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step5 requestModal(true, 300): step5.substring(49)=${step5.substring(49)}`);
      expect(step5.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`requestModal>reportDrawn>setPrivacyMode>r...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(81);
      logInfo(`requestModal>reportDrawn>setPrivacyMode>r...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal>reportDrawn>setPrivacyMode>r...: subject.lastMessa...${subject.lastMessage.substring(49)}`);
      expect(subject.lastMessage.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`requestModal>reportDrawn>setPrivacyMode>r...: subject.privacyMode=${subject.privacyMode}`);
      expect(subject.privacyMode).assertTrue();
      logInfo(`requestModal>reportDrawn>setPrivacyMode>r...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(3);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0196 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0197
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0197
     * @tc.desc      UiExtensionPageState call flow requestModal > open > requestModal > reportDrawn > reportDrawn ke...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0197 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.requestModal(false, 450);
      logInfo(`step1 requestModal(false, 450): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(81);
      logInfo(`step1 requestModal(false, 450): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step1 requestModal(false, 450): step1.substring(49)=${step1.substring(49)}`);
      expect(step1.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      const step2: string = subject.open('xx');
      logInfo(`step2 open("xx"): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.requestModal(false, 300);
      logInfo(`step3 requestModal(false, 300): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(81);
      logInfo(`step3 requestModal(false, 300): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step3 requestModal(false, 300): step3.substring(49)=${step3.substring(49)}`);
      expect(step3.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      const step4: string = subject.reportDrawn(143);
      logInfo(`step4 reportDrawn(143): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(77);
      logInfo(`step4 reportDrawn(143): step4.substring(0, 32)=${step4.substring(0, 32)}`);
      expect(step4.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step4 reportDrawn(143): step4.substring(45)=${step4.substring(45)}`);
      expect(step4.substring(45)).assertEqual('d, code is 143, message is error');
      const step5: string = subject.reportDrawn(-114);
      logInfo(`step5 reportDrawn(-114): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(78);
      logInfo(`step5 reportDrawn(-114): step5.substring(0, 32)=${step5.substring(0, 32)}`);
      expect(step5.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step5 reportDrawn(-114): step5.substring(46)=${step5.substring(46)}`);
      expect(step5.substring(46)).assertEqual(', code is -114, message is error');
      logInfo(`requestModal>open>requestModal>reportDraw...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(78);
      logInfo(`requestModal>open>requestModal>reportDraw...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`requestModal>open>requestModal>reportDraw...: subject.lastMessa...${subject.lastMessage.substring(46)}`);
      expect(subject.lastMessage.substring(46)).assertEqual(', code is -114, message is error');
      logInfo(`requestModal>open>requestModal>reportDraw...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(2);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0197 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0198
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0198
     * @tc.desc      UiExtensionPageState call flow setPrivacyMode > reportDrawn > reportDrawn keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0198 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.setPrivacyMode(false);
      logInfo(`step1 setPrivacyMode(false): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(84);
      logInfo(`step1 setPrivacyMode(false): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`step1 setPrivacyMode(false): step1.substring(52)=${step1.substring(52)}`);
      expect(step1.substring(52)).assertEqual('se) called. isPrivacyMode: false');
      const step2: string = subject.reportDrawn(984);
      logInfo(`step2 reportDrawn(984): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(77);
      logInfo(`step2 reportDrawn(984): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step2 reportDrawn(984): step2.substring(45)=${step2.substring(45)}`);
      expect(step2.substring(45)).assertEqual('d, code is 984, message is error');
      const step3: string = subject.reportDrawn(-224);
      logInfo(`step3 reportDrawn(-224): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(78);
      logInfo(`step3 reportDrawn(-224): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step3 reportDrawn(-224): step3.substring(46)=${step3.substring(46)}`);
      expect(step3.substring(46)).assertEqual(', code is -224, message is error');
      logInfo(`setPrivacyMode>reportDrawn>reportDrawn final: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(78);
      logInfo(`setPrivacyMode>reportDrawn>reportDrawn final: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`setPrivacyMode>reportDrawn>reportDrawn final: subject.lastMessa...${subject.lastMessage.substring(46)}`);
      expect(subject.lastMessage.substring(46)).assertEqual(', code is -224, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0198 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0199
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0199
     * @tc.desc      UiExtensionPageState call flow reportDrawn > requestModal > open keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0199 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.reportDrawn(432.99);
      logInfo(`step1 reportDrawn(432.99): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(80);
      logInfo(`step1 reportDrawn(432.99): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step1 reportDrawn(432.99): step1.substring(48)=${step1.substring(48)}`);
      expect(step1.substring(48)).assertEqual('code is 432.99, message is error');
      const step2: string = subject.requestModal(true, -1);
      logInfo(`step2 requestModal(true, -1): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(80);
      logInfo(`step2 requestModal(true, -1): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step2 requestModal(true, -1): step2.substring(48)=${step2.substring(48)}`);
      expect(step2.substring(48)).assertEqual('age is SessionUIExtensionAbility');
      const step3: string = subject.open('ma9hB6Vj');
      logInfo(`step3 open("ma9hB6Vj"): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`reportDrawn>requestModal>open final: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(80);
      logInfo(`reportDrawn>requestModal>open final: subject.lastMessage.sub...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`reportDrawn>requestModal>open final: subject.lastMessage.substr...${subject.lastMessage.substring(48)}`);
      expect(subject.lastMessage.substring(48)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`reportDrawn>requestModal>open final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0199 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0200
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0200
     * @tc.desc      UiExtensionPageState call flow reportDrawn > setPrivacyMode > setPrivacyMode > reportDrawn keeps...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0200 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.reportDrawn(350);
      logInfo(`step1 reportDrawn(350): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(77);
      logInfo(`step1 reportDrawn(350): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step1 reportDrawn(350): step1.substring(45)=${step1.substring(45)}`);
      expect(step1.substring(45)).assertEqual('d, code is 350, message is error');
      const step2: string = subject.setPrivacyMode(true);
      logInfo(`step2 setPrivacyMode(true): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(84);
      logInfo(`step2 setPrivacyMode(true): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`step2 setPrivacyMode(true): step2.substring(52)=${step2.substring(52)}`);
      expect(step2.substring(52)).assertEqual('ack) called. isPrivacyMode: true');
      const step3: string = subject.setPrivacyMode(false);
      logInfo(`step3 setPrivacyMode(false): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(84);
      logInfo(`step3 setPrivacyMode(false): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`step3 setPrivacyMode(false): step3.substring(52)=${step3.substring(52)}`);
      expect(step3.substring(52)).assertEqual('se) called. isPrivacyMode: false');
      const step4: string = subject.reportDrawn(450);
      logInfo(`step4 reportDrawn(450): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(77);
      logInfo(`step4 reportDrawn(450): step4.substring(0, 32)=${step4.substring(0, 32)}`);
      expect(step4.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step4 reportDrawn(450): step4.substring(45)=${step4.substring(45)}`);
      expect(step4.substring(45)).assertEqual('d, code is 450, message is error');
      logInfo(`reportDrawn>setPrivacyMode>setPrivacyMode...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`reportDrawn>setPrivacyMode>setPrivacyMode...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn>setPrivacyMode>setPrivacyMode...: subject.lastMessa...${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 450, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0200 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0201
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0201
     * @tc.desc      UiExtensionPageState call flow terminateWithResult > setPrivacyMode > requestModal > open keeps ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0201 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: number = subject.terminateWithResult(true);
      logInfo(`step1 terminateWithResult(true): step1=${step1}`);
      expect(step1).assertEqual(100);
      const step2: string = subject.setPrivacyMode(false);
      logInfo(`step2 setPrivacyMode(false): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(84);
      logInfo(`step2 setPrivacyMode(false): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`step2 setPrivacyMode(false): step2.substring(52)=${step2.substring(52)}`);
      expect(step2.substring(52)).assertEqual('se) called. isPrivacyMode: false');
      const step3: string = subject.requestModal(false, 494);
      logInfo(`step3 requestModal(false, 494): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(81);
      logInfo(`step3 requestModal(false, 494): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step3 requestModal(false, 494): step3.substring(49)=${step3.substring(49)}`);
      expect(step3.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      const step4: string = subject.open('123');
      logInfo(`step4 open("123"): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`terminateWithResult>setPrivacyMode>reques...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(81);
      logInfo(`terminateWithResult>setPrivacyMode>reques...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`terminateWithResult>setPrivacyMode>reques...: subject.lastMessa...${subject.lastMessage.substring(49)}`);
      expect(subject.lastMessage.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`terminateWithResult>setPrivacyMode>reques...: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`terminateWithResult>setPrivacyMode>reques...: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(100);
      logInfo(`terminateWithResult>setPrivacyMode>reques...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0201 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0202
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0202
     * @tc.desc      UiExtensionPageState call flow reportDrawn > terminateWithResult > requestModal keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0202 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.reportDrawn(150);
      logInfo(`step1 reportDrawn(150): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(77);
      logInfo(`step1 reportDrawn(150): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step1 reportDrawn(150): step1.substring(45)=${step1.substring(45)}`);
      expect(step1.substring(45)).assertEqual('d, code is 150, message is error');
      const step2: number = subject.terminateWithResult(false);
      logInfo(`step2 terminateWithResult(false): step2=${step2}`);
      expect(step2).assertEqual(99);
      const step3: string = subject.requestModal(false, 250);
      logInfo(`step3 requestModal(false, 250): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(81);
      logInfo(`step3 requestModal(false, 250): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step3 requestModal(false, 250): step3.substring(49)=${step3.substring(49)}`);
      expect(step3.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`reportDrawn>terminateWithResult>requestMo...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(81);
      logInfo(`reportDrawn>terminateWithResult>requestMo...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`reportDrawn>terminateWithResult>requestMo...: subject.lastMessa...${subject.lastMessage.substring(49)}`);
      expect(subject.lastMessage.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`reportDrawn>terminateWithResult>requestMo...: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`reportDrawn>terminateWithResult>requestMo...: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(99);
      logInfo(`reportDrawn>terminateWithResult>requestMo...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0202 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0203
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0203
     * @tc.desc      UiExtensionPageState call flow requestModal > requestModal > requestModal > requestModal > reque...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0203 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.requestModal(true, 2);
      logInfo(`step1 requestModal(true, 2): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(79);
      logInfo(`step1 requestModal(true, 2): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step1 requestModal(true, 2): step1.substring(47)=${step1.substring(47)}`);
      expect(step1.substring(47)).assertEqual('age is SessionUIExtensionAbility');
      const step2: string = subject.requestModal(false, 1);
      logInfo(`step2 requestModal(false, 1): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(79);
      logInfo(`step2 requestModal(false, 1): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step2 requestModal(false, 1): step2.substring(47)=${step2.substring(47)}`);
      expect(step2.substring(47)).assertEqual('age is ContextUIExtensionAbility');
      const step3: string = subject.requestModal(false, 494);
      logInfo(`step3 requestModal(false, 494): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(81);
      logInfo(`step3 requestModal(false, 494): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step3 requestModal(false, 494): step3.substring(49)=${step3.substring(49)}`);
      expect(step3.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      const step4: string = subject.requestModal(false, 75);
      logInfo(`step4 requestModal(false, 75): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(80);
      logInfo(`step4 requestModal(false, 75): step4.substring(0, 32)=${step4.substring(0, 32)}`);
      expect(step4.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step4 requestModal(false, 75): step4.substring(48)=${step4.substring(48)}`);
      expect(step4.substring(48)).assertEqual('age is ContextUIExtensionAbility');
      const step5: string = subject.requestModal(false, 75);
      logInfo(`step5 requestModal(false, 75): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(80);
      logInfo(`step5 requestModal(false, 75): step5.substring(0, 32)=${step5.substring(0, 32)}`);
      expect(step5.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step5 requestModal(false, 75): step5.substring(48)=${step5.substring(48)}`);
      expect(step5.substring(48)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`requestModal>requestModal>requestModal>re...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(80);
      logInfo(`requestModal>requestModal>requestModal>re...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal>requestModal>requestModal>re...: subject.lastMessa...${subject.lastMessage.substring(48)}`);
      expect(subject.lastMessage.substring(48)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`requestModal>requestModal>requestModal>re...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(5);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0203 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0204
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0204
     * @tc.desc      UiExtensionPageState call flow open > reportDrawn > reportDrawn keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0204 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.open('tSvqPFfN');
      logInfo(`step1 open("tSvqPFfN"): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.reportDrawn(575);
      logInfo(`step2 reportDrawn(575): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(77);
      logInfo(`step2 reportDrawn(575): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step2 reportDrawn(575): step2.substring(45)=${step2.substring(45)}`);
      expect(step2.substring(45)).assertEqual('d, code is 575, message is error');
      const step3: string = subject.reportDrawn(966);
      logInfo(`step3 reportDrawn(966): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(77);
      logInfo(`step3 reportDrawn(966): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step3 reportDrawn(966): step3.substring(45)=${step3.substring(45)}`);
      expect(step3.substring(45)).assertEqual('d, code is 966, message is error');
      logInfo(`open>reportDrawn>reportDrawn final: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`open>reportDrawn>reportDrawn final: subject.lastMessage.subs...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`open>reportDrawn>reportDrawn final: subject.lastMessage.substri...${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 966, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0204 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0205
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0205
     * @tc.desc      UiExtensionPageState call flow reportDrawn > open > setPrivacyMode keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0205 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.reportDrawn(770);
      logInfo(`step1 reportDrawn(770): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(77);
      logInfo(`step1 reportDrawn(770): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step1 reportDrawn(770): step1.substring(45)=${step1.substring(45)}`);
      expect(step1.substring(45)).assertEqual('d, code is 770, message is error');
      const step2: string = subject.open('x');
      logInfo(`step2 open("x"): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.setPrivacyMode(true);
      logInfo(`step3 setPrivacyMode(true): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(84);
      logInfo(`step3 setPrivacyMode(true): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`step3 setPrivacyMode(true): step3.substring(52)=${step3.substring(52)}`);
      expect(step3.substring(52)).assertEqual('ack) called. isPrivacyMode: true');
      logInfo(`reportDrawn>open>setPrivacyMode final: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(84);
      logInfo(`reportDrawn>open>setPrivacyMode final: subject.lastMessage.s...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`reportDrawn>open>setPrivacyMode final: subject.lastMessage.subs...${subject.lastMessage.substring(52)}`);
      expect(subject.lastMessage.substring(52)).assertEqual('ack) called. isPrivacyMode: true');
      logInfo(`reportDrawn>open>setPrivacyMode final: subject.privacyMode=${subject.privacyMode}`);
      expect(subject.privacyMode).assertTrue();
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0205 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0206
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0206
     * @tc.desc      UiExtensionPageState call flow requestModal > reportDrawn keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0206 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.requestModal(false, 250);
      logInfo(`step1 requestModal(false, 250): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(81);
      logInfo(`step1 requestModal(false, 250): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step1 requestModal(false, 250): step1.substring(49)=${step1.substring(49)}`);
      expect(step1.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      const step2: string = subject.reportDrawn(950);
      logInfo(`step2 reportDrawn(950): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(77);
      logInfo(`step2 reportDrawn(950): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step2 reportDrawn(950): step2.substring(45)=${step2.substring(45)}`);
      expect(step2.substring(45)).assertEqual('d, code is 950, message is error');
      logInfo(`requestModal>reportDrawn final: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`requestModal>reportDrawn final: subject.lastMessage.substrin...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`requestModal>reportDrawn final: subject.lastMessage.substring(45)=${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 950, message is error');
      logInfo(`requestModal>reportDrawn final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0206 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0207
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0207
     * @tc.desc      UiExtensionPageState call flow reportDrawn > terminateWithResult > open > reportDrawn keeps stat...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0207 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.reportDrawn(127.5);
      logInfo(`step1 reportDrawn(127.5): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(79);
      logInfo(`step1 reportDrawn(127.5): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step1 reportDrawn(127.5): step1.substring(47)=${step1.substring(47)}`);
      expect(step1.substring(47)).assertEqual(' code is 127.5, message is error');
      const step2: number = subject.terminateWithResult(false);
      logInfo(`step2 terminateWithResult(false): step2=${step2}`);
      expect(step2).assertEqual(99);
      const step3: string = subject.open('uP');
      logInfo(`step3 open("uP"): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.reportDrawn(127.5);
      logInfo(`step4 reportDrawn(127.5): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(79);
      logInfo(`step4 reportDrawn(127.5): step4.substring(0, 32)=${step4.substring(0, 32)}`);
      expect(step4.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step4 reportDrawn(127.5): step4.substring(47)=${step4.substring(47)}`);
      expect(step4.substring(47)).assertEqual(' code is 127.5, message is error');
      logInfo(`reportDrawn>terminateWithResult>open>repo...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(79);
      logInfo(`reportDrawn>terminateWithResult>open>repo...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn>terminateWithResult>open>repo...: subject.lastMessa...${subject.lastMessage.substring(47)}`);
      expect(subject.lastMessage.substring(47)).assertEqual(' code is 127.5, message is error');
      logInfo(`reportDrawn>terminateWithResult>open>repo...: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`reportDrawn>terminateWithResult>open>repo...: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(99);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0207 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0208
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0208
     * @tc.desc      UiExtensionPageState call flow open > reportDrawn > reportDrawn keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0208 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.open('Rde');
      logInfo(`step1 open("Rde"): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.reportDrawn(-134);
      logInfo(`step2 reportDrawn(-134): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(78);
      logInfo(`step2 reportDrawn(-134): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step2 reportDrawn(-134): step2.substring(46)=${step2.substring(46)}`);
      expect(step2.substring(46)).assertEqual(', code is -134, message is error');
      const step3: string = subject.reportDrawn(900);
      logInfo(`step3 reportDrawn(900): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(77);
      logInfo(`step3 reportDrawn(900): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step3 reportDrawn(900): step3.substring(45)=${step3.substring(45)}`);
      expect(step3.substring(45)).assertEqual('d, code is 900, message is error');
      logInfo(`open>reportDrawn>reportDrawn final: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`open>reportDrawn>reportDrawn final: subject.lastMessage.subs...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`open>reportDrawn>reportDrawn final: subject.lastMessage.substri...${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 900, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0208 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0209
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0209
     * @tc.desc      UiExtensionPageState call flow terminateWithResult > terminateWithResult > requestModal > report...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0209 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: number = subject.terminateWithResult(true);
      logInfo(`step1 terminateWithResult(true): step1=${step1}`);
      expect(step1).assertEqual(100);
      const step2: number = subject.terminateWithResult(false);
      logInfo(`step2 terminateWithResult(false): step2=${step2}`);
      expect(step2).assertEqual(99);
      const step3: string = subject.requestModal(false, 475);
      logInfo(`step3 requestModal(false, 475): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(81);
      logInfo(`step3 requestModal(false, 475): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step3 requestModal(false, 475): step3.substring(49)=${step3.substring(49)}`);
      expect(step3.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      const step4: string = subject.reportDrawn(28.63);
      logInfo(`step4 reportDrawn(28.63): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(79);
      logInfo(`step4 reportDrawn(28.63): step4.substring(0, 32)=${step4.substring(0, 32)}`);
      expect(step4.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step4 reportDrawn(28.63): step4.substring(47)=${step4.substring(47)}`);
      expect(step4.substring(47)).assertEqual(' code is 28.63, message is error');
      logInfo(`terminateWithResult>terminateWithResult>r...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(79);
      logInfo(`terminateWithResult>terminateWithResult>r...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`terminateWithResult>terminateWithResult>r...: subject.lastMessa...${subject.lastMessage.substring(47)}`);
      expect(subject.lastMessage.substring(47)).assertEqual(' code is 28.63, message is error');
      logInfo(`terminateWithResult>terminateWithResult>r...: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`terminateWithResult>terminateWithResult>r...: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(99);
      logInfo(`terminateWithResult>terminateWithResult>r...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0209 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0210
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0210
     * @tc.desc      UiExtensionPageState call flow setPrivacyMode > terminateWithResult > reportDrawn > requestModal...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0210 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.setPrivacyMode(true);
      logInfo(`step1 setPrivacyMode(true): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(84);
      logInfo(`step1 setPrivacyMode(true): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`step1 setPrivacyMode(true): step1.substring(52)=${step1.substring(52)}`);
      expect(step1.substring(52)).assertEqual('ack) called. isPrivacyMode: true');
      const step2: number = subject.terminateWithResult(true);
      logInfo(`step2 terminateWithResult(true): step2=${step2}`);
      expect(step2).assertEqual(100);
      const step3: string = subject.reportDrawn(369);
      logInfo(`step3 reportDrawn(369): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(77);
      logInfo(`step3 reportDrawn(369): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step3 reportDrawn(369): step3.substring(45)=${step3.substring(45)}`);
      expect(step3.substring(45)).assertEqual('d, code is 369, message is error');
      const step4: string = subject.requestModal(true, 0);
      logInfo(`step4 requestModal(true, 0): step4=${step4}`);
      expect(step4).assertEqual('requestModalUIExtension succeed.');
      logInfo(`setPrivacyMode>terminateWithResult>report...: subject.lastMessage=${subject.lastMessage}`);
      expect(subject.lastMessage).assertEqual('requestModalUIExtension succeed.');
      logInfo(`setPrivacyMode>terminateWithResult>report...: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`setPrivacyMode>terminateWithResult>report...: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(100);
      logInfo(`setPrivacyMode>terminateWithResult>report...: subject.privacyMode=${subject.privacyMode}`);
      expect(subject.privacyMode).assertTrue();
      logInfo(`setPrivacyMode>terminateWithResult>report...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0210 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0211
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0211
     * @tc.desc      UiExtensionPageState call flow reportDrawn > reportDrawn > reportDrawn keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0211 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.reportDrawn(125);
      logInfo(`step1 reportDrawn(125): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(77);
      logInfo(`step1 reportDrawn(125): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step1 reportDrawn(125): step1.substring(45)=${step1.substring(45)}`);
      expect(step1.substring(45)).assertEqual('d, code is 125, message is error');
      const step2: string = subject.reportDrawn(803);
      logInfo(`step2 reportDrawn(803): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(77);
      logInfo(`step2 reportDrawn(803): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step2 reportDrawn(803): step2.substring(45)=${step2.substring(45)}`);
      expect(step2.substring(45)).assertEqual('d, code is 803, message is error');
      const step3: string = subject.reportDrawn(575);
      logInfo(`step3 reportDrawn(575): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(77);
      logInfo(`step3 reportDrawn(575): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step3 reportDrawn(575): step3.substring(45)=${step3.substring(45)}`);
      expect(step3.substring(45)).assertEqual('d, code is 575, message is error');
      logInfo(`reportDrawn>reportDrawn>reportDrawn final: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`reportDrawn>reportDrawn>reportDrawn final: subject.lastMessa...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn>reportDrawn>reportDrawn final: subject.lastMessage....${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 575, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0211 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0212
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0212
     * @tc.desc      UiExtensionPageState call flow terminateWithResult > reportDrawn keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0212 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: number = subject.terminateWithResult(true);
      logInfo(`step1 terminateWithResult(true): step1=${step1}`);
      expect(step1).assertEqual(100);
      const step2: string = subject.reportDrawn(688);
      logInfo(`step2 reportDrawn(688): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(77);
      logInfo(`step2 reportDrawn(688): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step2 reportDrawn(688): step2.substring(45)=${step2.substring(45)}`);
      expect(step2.substring(45)).assertEqual('d, code is 688, message is error');
      logInfo(`terminateWithResult>reportDrawn final: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`terminateWithResult>reportDrawn final: subject.lastMessage.s...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`terminateWithResult>reportDrawn final: subject.lastMessage.subs...${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 688, message is error');
      logInfo(`terminateWithResult>reportDrawn final: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`terminateWithResult>reportDrawn final: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(100);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0212 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0213
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0213
     * @tc.desc      UiExtensionPageState call flow requestModal > open > terminateWithResult > terminateWithResult k...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0213 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.requestModal(false, 125);
      logInfo(`step1 requestModal(false, 125): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(81);
      logInfo(`step1 requestModal(false, 125): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step1 requestModal(false, 125): step1.substring(49)=${step1.substring(49)}`);
      expect(step1.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      const step2: string = subject.open('Si8vnT');
      logInfo(`step2 open("Si8vnT"): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.terminateWithResult(false);
      logInfo(`step3 terminateWithResult(false): step3=${step3}`);
      expect(step3).assertEqual(99);
      const step4: number = subject.terminateWithResult(false);
      logInfo(`step4 terminateWithResult(false): step4=${step4}`);
      expect(step4).assertEqual(99);
      logInfo(`requestModal>open>terminateWithResult>ter...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(81);
      logInfo(`requestModal>open>terminateWithResult>ter...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal>open>terminateWithResult>ter...: subject.lastMessa...${subject.lastMessage.substring(49)}`);
      expect(subject.lastMessage.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`requestModal>open>terminateWithResult>ter...: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`requestModal>open>terminateWithResult>ter...: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(99);
      logInfo(`requestModal>open>terminateWithResult>ter...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0213 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0214
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0214
     * @tc.desc      UiExtensionPageState call flow terminateWithResult > requestModal > requestModal > requestModal ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0214 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: number = subject.terminateWithResult(false);
      logInfo(`step1 terminateWithResult(false): step1=${step1}`);
      expect(step1).assertEqual(99);
      const step2: string = subject.requestModal(true, 401);
      logInfo(`step2 requestModal(true, 401): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(81);
      logInfo(`step2 requestModal(true, 401): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step2 requestModal(true, 401): step2.substring(49)=${step2.substring(49)}`);
      expect(step2.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      const step3: string = subject.requestModal(false, 250);
      logInfo(`step3 requestModal(false, 250): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(81);
      logInfo(`step3 requestModal(false, 250): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step3 requestModal(false, 250): step3.substring(49)=${step3.substring(49)}`);
      expect(step3.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      const step4: string = subject.requestModal(false, 10);
      logInfo(`step4 requestModal(false, 10): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(80);
      logInfo(`step4 requestModal(false, 10): step4.substring(0, 32)=${step4.substring(0, 32)}`);
      expect(step4.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step4 requestModal(false, 10): step4.substring(48)=${step4.substring(48)}`);
      expect(step4.substring(48)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`terminateWithResult>requestModal>requestM...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(80);
      logInfo(`terminateWithResult>requestModal>requestM...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`terminateWithResult>requestModal>requestM...: subject.lastMessa...${subject.lastMessage.substring(48)}`);
      expect(subject.lastMessage.substring(48)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`terminateWithResult>requestModal>requestM...: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`terminateWithResult>requestModal>requestM...: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(99);
      logInfo(`terminateWithResult>requestModal>requestM...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(3);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0214 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0215
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0215
     * @tc.desc      UiExtensionPageState call flow reportDrawn > open keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0215 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.reportDrawn(1000);
      logInfo(`step1 reportDrawn(1000): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(78);
      logInfo(`step1 reportDrawn(1000): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step1 reportDrawn(1000): step1.substring(46)=${step1.substring(46)}`);
      expect(step1.substring(46)).assertEqual(', code is 1000, message is error');
      const step2: string = subject.open('   ');
      logInfo(`step2 open("   "): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`reportDrawn>open final: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(78);
      logInfo(`reportDrawn>open final: subject.lastMessage.substring(0, 32)=${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn>open final: subject.lastMessage.substring(46)=${subject.lastMessage.substring(46)}`);
      expect(subject.lastMessage.substring(46)).assertEqual(', code is 1000, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0215 end`);
    });
  });
}
