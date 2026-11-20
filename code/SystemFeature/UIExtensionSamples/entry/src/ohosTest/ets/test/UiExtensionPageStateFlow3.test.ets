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
export default function uiExtensionPageStateFlow3Test(): void {
  describe('UiExtensionPageStateFlow3Test', () => {
    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0074
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0074
     * @tc.desc      UiExtensionPageState call flow setPrivacyMode > open > reportDrawn > setPrivacyMode > reportDraw...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0074 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.setPrivacyMode(false);
      logInfo(`step1 setPrivacyMode(false): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(84);
      logInfo(`step1 setPrivacyMode(false): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`step1 setPrivacyMode(false): step1.substring(52)=${step1.substring(52)}`);
      expect(step1.substring(52)).assertEqual('se) called. isPrivacyMode: false');
      const step2: string = subject.open(' ');
      logInfo(`step2 open(" "): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.reportDrawn(950);
      logInfo(`step3 reportDrawn(950): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(77);
      logInfo(`step3 reportDrawn(950): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step3 reportDrawn(950): step3.substring(45)=${step3.substring(45)}`);
      expect(step3.substring(45)).assertEqual('d, code is 950, message is error');
      const step4: string = subject.setPrivacyMode(false);
      logInfo(`step4 setPrivacyMode(false): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(84);
      logInfo(`step4 setPrivacyMode(false): step4.substring(0, 32)=${step4.substring(0, 32)}`);
      expect(step4.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`step4 setPrivacyMode(false): step4.substring(52)=${step4.substring(52)}`);
      expect(step4.substring(52)).assertEqual('se) called. isPrivacyMode: false');
      const step5: string = subject.reportDrawn(889);
      logInfo(`step5 reportDrawn(889): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(77);
      logInfo(`step5 reportDrawn(889): step5.substring(0, 32)=${step5.substring(0, 32)}`);
      expect(step5.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step5 reportDrawn(889): step5.substring(45)=${step5.substring(45)}`);
      expect(step5.substring(45)).assertEqual('d, code is 889, message is error');
      logInfo(`setPrivacyMode>open>reportDrawn>setPrivac...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`setPrivacyMode>open>reportDrawn>setPrivac...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`setPrivacyMode>open>reportDrawn>setPrivac...: subject.lastMessa...${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 889, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0074 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0075
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0075
     * @tc.desc      UiExtensionPageState call flow terminateWithResult > open > requestModal > setPrivacyMode keeps ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0075 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: number = subject.terminateWithResult(true);
      logInfo(`step1 terminateWithResult(true): step1=${step1}`);
      expect(step1).assertEqual(100);
      const step2: string = subject.open('Em1');
      logInfo(`step2 open("Em1"): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.requestModal(false, 325);
      logInfo(`step3 requestModal(false, 325): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(81);
      logInfo(`step3 requestModal(false, 325): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step3 requestModal(false, 325): step3.substring(49)=${step3.substring(49)}`);
      expect(step3.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      const step4: string = subject.setPrivacyMode(false);
      logInfo(`step4 setPrivacyMode(false): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(84);
      logInfo(`step4 setPrivacyMode(false): step4.substring(0, 32)=${step4.substring(0, 32)}`);
      expect(step4.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`step4 setPrivacyMode(false): step4.substring(52)=${step4.substring(52)}`);
      expect(step4.substring(52)).assertEqual('se) called. isPrivacyMode: false');
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
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0075 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0076
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0076
     * @tc.desc      UiExtensionPageState call flow terminateWithResult > requestModal > open keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0076 begin`);
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
      const step3: string = subject.open('x123');
      logInfo(`step3 open("x123"): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`terminateWithResult>requestModal>open final: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(81);
      logInfo(`terminateWithResult>requestModal>open final: subject.lastMes...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`terminateWithResult>requestModal>open final: subject.lastMessag...${subject.lastMessage.substring(49)}`);
      expect(subject.lastMessage.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`terminateWithResult>requestModal>open final: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`terminateWithResult>requestModal>open final: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(99);
      logInfo(`terminateWithResult>requestModal>open final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0076 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0077
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0077
     * @tc.desc      UiExtensionPageState call flow reportDrawn > reportDrawn > terminateWithResult > setPrivacyMode ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0077 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.reportDrawn(140.56);
      logInfo(`step1 reportDrawn(140.56): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(80);
      logInfo(`step1 reportDrawn(140.56): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step1 reportDrawn(140.56): step1.substring(48)=${step1.substring(48)}`);
      expect(step1.substring(48)).assertEqual('code is 140.56, message is error');
      const step2: string = subject.reportDrawn(675);
      logInfo(`step2 reportDrawn(675): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(77);
      logInfo(`step2 reportDrawn(675): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step2 reportDrawn(675): step2.substring(45)=${step2.substring(45)}`);
      expect(step2.substring(45)).assertEqual('d, code is 675, message is error');
      const step3: number = subject.terminateWithResult(false);
      logInfo(`step3 terminateWithResult(false): step3=${step3}`);
      expect(step3).assertEqual(99);
      const step4: string = subject.setPrivacyMode(false);
      logInfo(`step4 setPrivacyMode(false): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(84);
      logInfo(`step4 setPrivacyMode(false): step4.substring(0, 32)=${step4.substring(0, 32)}`);
      expect(step4.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`step4 setPrivacyMode(false): step4.substring(52)=${step4.substring(52)}`);
      expect(step4.substring(52)).assertEqual('se) called. isPrivacyMode: false');
      const step5: string = subject.setPrivacyMode(false);
      logInfo(`step5 setPrivacyMode(false): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(84);
      logInfo(`step5 setPrivacyMode(false): step5.substring(0, 32)=${step5.substring(0, 32)}`);
      expect(step5.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`step5 setPrivacyMode(false): step5.substring(52)=${step5.substring(52)}`);
      expect(step5.substring(52)).assertEqual('se) called. isPrivacyMode: false');
      logInfo(`reportDrawn>reportDrawn>terminateWithResu...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(84);
      logInfo(`reportDrawn>reportDrawn>terminateWithResu...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`reportDrawn>reportDrawn>terminateWithResu...: subject.lastMessa...${subject.lastMessage.substring(52)}`);
      expect(subject.lastMessage.substring(52)).assertEqual('se) called. isPrivacyMode: false');
      logInfo(`reportDrawn>reportDrawn>terminateWithResu...: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`reportDrawn>reportDrawn>terminateWithResu...: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(99);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0077 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0078
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0078
     * @tc.desc      UiExtensionPageState call flow requestModal > requestModal > setPrivacyMode > setPrivacyMode > r...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0078 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.requestModal(true, 175);
      logInfo(`step1 requestModal(true, 175): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(81);
      logInfo(`step1 requestModal(true, 175): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step1 requestModal(true, 175): step1.substring(49)=${step1.substring(49)}`);
      expect(step1.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      const step2: string = subject.requestModal(false, 375);
      logInfo(`step2 requestModal(false, 375): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(81);
      logInfo(`step2 requestModal(false, 375): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step2 requestModal(false, 375): step2.substring(49)=${step2.substring(49)}`);
      expect(step2.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      const step3: string = subject.setPrivacyMode(true);
      logInfo(`step3 setPrivacyMode(true): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(84);
      logInfo(`step3 setPrivacyMode(true): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`step3 setPrivacyMode(true): step3.substring(52)=${step3.substring(52)}`);
      expect(step3.substring(52)).assertEqual('ack) called. isPrivacyMode: true');
      const step4: string = subject.setPrivacyMode(true);
      logInfo(`step4 setPrivacyMode(true): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(84);
      logInfo(`step4 setPrivacyMode(true): step4.substring(0, 32)=${step4.substring(0, 32)}`);
      expect(step4.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`step4 setPrivacyMode(true): step4.substring(52)=${step4.substring(52)}`);
      expect(step4.substring(52)).assertEqual('ack) called. isPrivacyMode: true');
      const step5: string = subject.reportDrawn(950);
      logInfo(`step5 reportDrawn(950): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(77);
      logInfo(`step5 reportDrawn(950): step5.substring(0, 32)=${step5.substring(0, 32)}`);
      expect(step5.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step5 reportDrawn(950): step5.substring(45)=${step5.substring(45)}`);
      expect(step5.substring(45)).assertEqual('d, code is 950, message is error');
      logInfo(`requestModal>requestModal>setPrivacyMode>...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`requestModal>requestModal>setPrivacyMode>...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`requestModal>requestModal>setPrivacyMode>...: subject.lastMessa...${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 950, message is error');
      logInfo(`requestModal>requestModal>setPrivacyMode>...: subject.privacyMode=${subject.privacyMode}`);
      expect(subject.privacyMode).assertTrue();
      logInfo(`requestModal>requestModal>setPrivacyMode>...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(2);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0078 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0079
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0079
     * @tc.desc      UiExtensionPageState call flow setPrivacyMode > requestModal keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0079 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.setPrivacyMode(false);
      logInfo(`step1 setPrivacyMode(false): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(84);
      logInfo(`step1 setPrivacyMode(false): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`step1 setPrivacyMode(false): step1.substring(52)=${step1.substring(52)}`);
      expect(step1.substring(52)).assertEqual('se) called. isPrivacyMode: false');
      const step2: string = subject.requestModal(true, 0);
      logInfo(`step2 requestModal(true, 0): step2=${step2}`);
      expect(step2).assertEqual('requestModalUIExtension succeed.');
      logInfo(`setPrivacyMode>requestModal final: subject.lastMessage=${subject.lastMessage}`);
      expect(subject.lastMessage).assertEqual('requestModalUIExtension succeed.');
      logInfo(`setPrivacyMode>requestModal final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0079 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0080
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0080
     * @tc.desc      UiExtensionPageState call flow terminateWithResult > reportDrawn > open > terminateWithResult ke...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0080 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: number = subject.terminateWithResult(false);
      logInfo(`step1 terminateWithResult(false): step1=${step1}`);
      expect(step1).assertEqual(99);
      const step2: string = subject.reportDrawn(275);
      logInfo(`step2 reportDrawn(275): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(77);
      logInfo(`step2 reportDrawn(275): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step2 reportDrawn(275): step2.substring(45)=${step2.substring(45)}`);
      expect(step2.substring(45)).assertEqual('d, code is 275, message is error');
      const step3: string = subject.open('36QYpsR');
      logInfo(`step3 open("36QYpsR"): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: number = subject.terminateWithResult(true);
      logInfo(`step4 terminateWithResult(true): step4=${step4}`);
      expect(step4).assertEqual(100);
      logInfo(`terminateWithResult>reportDrawn>open>term...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`terminateWithResult>reportDrawn>open>term...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`terminateWithResult>reportDrawn>open>term...: subject.lastMessa...${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 275, message is error');
      logInfo(`terminateWithResult>reportDrawn>open>term...: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`terminateWithResult>reportDrawn>open>term...: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(100);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0080 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0081
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0081
     * @tc.desc      UiExtensionPageState call flow reportDrawn > open > terminateWithResult > requestModal > request...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0081 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.reportDrawn(300.61);
      logInfo(`step1 reportDrawn(300.61): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(80);
      logInfo(`step1 reportDrawn(300.61): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step1 reportDrawn(300.61): step1.substring(48)=${step1.substring(48)}`);
      expect(step1.substring(48)).assertEqual('code is 300.61, message is error');
      const step2: string = subject.open('Hello WorldHello World');
      logInfo(`step2 open("Hello WorldHello World"): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.terminateWithResult(false);
      logInfo(`step3 terminateWithResult(false): step3=${step3}`);
      expect(step3).assertEqual(99);
      const step4: string = subject.requestModal(true, 350);
      logInfo(`step4 requestModal(true, 350): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(81);
      logInfo(`step4 requestModal(true, 350): step4.substring(0, 32)=${step4.substring(0, 32)}`);
      expect(step4.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step4 requestModal(true, 350): step4.substring(49)=${step4.substring(49)}`);
      expect(step4.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      const step5: string = subject.requestModal(true, 300);
      logInfo(`step5 requestModal(true, 300): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(81);
      logInfo(`step5 requestModal(true, 300): step5.substring(0, 32)=${step5.substring(0, 32)}`);
      expect(step5.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step5 requestModal(true, 300): step5.substring(49)=${step5.substring(49)}`);
      expect(step5.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`reportDrawn>open>terminateWithResult>requ...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(81);
      logInfo(`reportDrawn>open>terminateWithResult>requ...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`reportDrawn>open>terminateWithResult>requ...: subject.lastMessa...${subject.lastMessage.substring(49)}`);
      expect(subject.lastMessage.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`reportDrawn>open>terminateWithResult>requ...: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`reportDrawn>open>terminateWithResult>requ...: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(99);
      logInfo(`reportDrawn>open>terminateWithResult>requ...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(2);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0081 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0082
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0082
     * @tc.desc      UiExtensionPageState call flow requestModal > requestModal > reportDrawn keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0082 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.requestModal(false, 425);
      logInfo(`step1 requestModal(false, 425): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(81);
      logInfo(`step1 requestModal(false, 425): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step1 requestModal(false, 425): step1.substring(49)=${step1.substring(49)}`);
      expect(step1.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      const step2: string = subject.requestModal(true, 200);
      logInfo(`step2 requestModal(true, 200): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(81);
      logInfo(`step2 requestModal(true, 200): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step2 requestModal(true, 200): step2.substring(49)=${step2.substring(49)}`);
      expect(step2.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      const step3: string = subject.reportDrawn(800);
      logInfo(`step3 reportDrawn(800): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(77);
      logInfo(`step3 reportDrawn(800): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step3 reportDrawn(800): step3.substring(45)=${step3.substring(45)}`);
      expect(step3.substring(45)).assertEqual('d, code is 800, message is error');
      logInfo(`requestModal>requestModal>reportDrawn final: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`requestModal>requestModal>reportDrawn final: subject.lastMes...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`requestModal>requestModal>reportDrawn final: subject.lastMessag...${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 800, message is error');
      logInfo(`requestModal>requestModal>reportDrawn final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(2);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0082 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0083
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0083
     * @tc.desc      UiExtensionPageState call flow setPrivacyMode > terminateWithResult keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0083 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.setPrivacyMode(false);
      logInfo(`step1 setPrivacyMode(false): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(84);
      logInfo(`step1 setPrivacyMode(false): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`step1 setPrivacyMode(false): step1.substring(52)=${step1.substring(52)}`);
      expect(step1.substring(52)).assertEqual('se) called. isPrivacyMode: false');
      const step2: number = subject.terminateWithResult(false);
      logInfo(`step2 terminateWithResult(false): step2=${step2}`);
      expect(step2).assertEqual(99);
      logInfo(`setPrivacyMode>terminateWithResult final: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(84);
      logInfo(`setPrivacyMode>terminateWithResult final: subject.lastMessag...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`setPrivacyMode>terminateWithResult final: subject.lastMessage.s...${subject.lastMessage.substring(52)}`);
      expect(subject.lastMessage.substring(52)).assertEqual('se) called. isPrivacyMode: false');
      logInfo(`setPrivacyMode>terminateWithResult final: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`setPrivacyMode>terminateWithResult final: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(99);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0083 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0084
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0084
     * @tc.desc      UiExtensionPageState call flow reportDrawn > reportDrawn > open > requestModal keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0084 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.reportDrawn(175);
      logInfo(`step1 reportDrawn(175): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(77);
      logInfo(`step1 reportDrawn(175): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step1 reportDrawn(175): step1.substring(45)=${step1.substring(45)}`);
      expect(step1.substring(45)).assertEqual('d, code is 175, message is error');
      const step2: string = subject.reportDrawn(-60);
      logInfo(`step2 reportDrawn(-60): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(77);
      logInfo(`step2 reportDrawn(-60): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step2 reportDrawn(-60): step2.substring(45)=${step2.substring(45)}`);
      expect(step2.substring(45)).assertEqual('d, code is -60, message is error');
      const step3: string = subject.open('juF6JdWeP');
      logInfo(`step3 open("juF6JdWeP"): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.requestModal(false, 175);
      logInfo(`step4 requestModal(false, 175): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(81);
      logInfo(`step4 requestModal(false, 175): step4.substring(0, 32)=${step4.substring(0, 32)}`);
      expect(step4.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step4 requestModal(false, 175): step4.substring(49)=${step4.substring(49)}`);
      expect(step4.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`reportDrawn>reportDrawn>open>requestModal...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(81);
      logInfo(`reportDrawn>reportDrawn>open>requestModal...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`reportDrawn>reportDrawn>open>requestModal...: subject.lastMessa...${subject.lastMessage.substring(49)}`);
      expect(subject.lastMessage.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`reportDrawn>reportDrawn>open>requestModal...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0084 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0085
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0085
     * @tc.desc      UiExtensionPageState call flow reportDrawn > requestModal > setPrivacyMode keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0085 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.reportDrawn(229);
      logInfo(`step1 reportDrawn(229): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(77);
      logInfo(`step1 reportDrawn(229): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step1 reportDrawn(229): step1.substring(45)=${step1.substring(45)}`);
      expect(step1.substring(45)).assertEqual('d, code is 229, message is error');
      const step2: string = subject.requestModal(true, 494);
      logInfo(`step2 requestModal(true, 494): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(81);
      logInfo(`step2 requestModal(true, 494): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step2 requestModal(true, 494): step2.substring(49)=${step2.substring(49)}`);
      expect(step2.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      const step3: string = subject.setPrivacyMode(false);
      logInfo(`step3 setPrivacyMode(false): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(84);
      logInfo(`step3 setPrivacyMode(false): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`step3 setPrivacyMode(false): step3.substring(52)=${step3.substring(52)}`);
      expect(step3.substring(52)).assertEqual('se) called. isPrivacyMode: false');
      logInfo(`reportDrawn>requestModal>setPrivacyMode f...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(84);
      logInfo(`reportDrawn>requestModal>setPrivacyMode f...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`reportDrawn>requestModal>setPrivacyMode f...: subject.lastMessa...${subject.lastMessage.substring(52)}`);
      expect(subject.lastMessage.substring(52)).assertEqual('se) called. isPrivacyMode: false');
      logInfo(`reportDrawn>requestModal>setPrivacyMode f...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0085 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0086
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0086
     * @tc.desc      UiExtensionPageState call flow terminateWithResult > setPrivacyMode > terminateWithResult > setP...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0086 begin`);
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
      const step5: string = subject.requestModal(false, 50);
      logInfo(`step5 requestModal(false, 50): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(80);
      logInfo(`step5 requestModal(false, 50): step5.substring(0, 32)=${step5.substring(0, 32)}`);
      expect(step5.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step5 requestModal(false, 50): step5.substring(48)=${step5.substring(48)}`);
      expect(step5.substring(48)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`terminateWithResult>setPrivacyMode>termin...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(80);
      logInfo(`terminateWithResult>setPrivacyMode>termin...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`terminateWithResult>setPrivacyMode>termin...: subject.lastMessa...${subject.lastMessage.substring(48)}`);
      expect(subject.lastMessage.substring(48)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`terminateWithResult>setPrivacyMode>termin...: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`terminateWithResult>setPrivacyMode>termin...: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(99);
      logInfo(`terminateWithResult>setPrivacyMode>termin...: subject.privacyMode=${subject.privacyMode}`);
      expect(subject.privacyMode).assertTrue();
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0086 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0087
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0087
     * @tc.desc      UiExtensionPageState call flow open > requestModal > terminateWithResult keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0087 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.open('D');
      logInfo(`step1 open("D"): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.requestModal(true, 25);
      logInfo(`step2 requestModal(true, 25): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(80);
      logInfo(`step2 requestModal(true, 25): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step2 requestModal(true, 25): step2.substring(48)=${step2.substring(48)}`);
      expect(step2.substring(48)).assertEqual('age is SessionUIExtensionAbility');
      const step3: number = subject.terminateWithResult(false);
      logInfo(`step3 terminateWithResult(false): step3=${step3}`);
      expect(step3).assertEqual(99);
      logInfo(`open>requestModal>terminateWithResult final: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(80);
      logInfo(`open>requestModal>terminateWithResult final: subject.lastMes...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`open>requestModal>terminateWithResult final: subject.lastMessag...${subject.lastMessage.substring(48)}`);
      expect(subject.lastMessage.substring(48)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`open>requestModal>terminateWithResult final: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`open>requestModal>terminateWithResult final: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(99);
      logInfo(`open>requestModal>terminateWithResult final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0087 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0088
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0088
     * @tc.desc      UiExtensionPageState call flow reportDrawn > requestModal keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0088 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.reportDrawn(515);
      logInfo(`step1 reportDrawn(515): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(77);
      logInfo(`step1 reportDrawn(515): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step1 reportDrawn(515): step1.substring(45)=${step1.substring(45)}`);
      expect(step1.substring(45)).assertEqual('d, code is 515, message is error');
      const step2: string = subject.requestModal(true, 50);
      logInfo(`step2 requestModal(true, 50): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(80);
      logInfo(`step2 requestModal(true, 50): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step2 requestModal(true, 50): step2.substring(48)=${step2.substring(48)}`);
      expect(step2.substring(48)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`reportDrawn>requestModal final: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(80);
      logInfo(`reportDrawn>requestModal final: subject.lastMessage.substrin...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`reportDrawn>requestModal final: subject.lastMessage.substring(48)=${subject.lastMessage.substring(48)}`);
      expect(subject.lastMessage.substring(48)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`reportDrawn>requestModal final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0088 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0089
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0089
     * @tc.desc      UiExtensionPageState call flow reportDrawn > requestModal keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0089 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.reportDrawn(300);
      logInfo(`step1 reportDrawn(300): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(77);
      logInfo(`step1 reportDrawn(300): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step1 reportDrawn(300): step1.substring(45)=${step1.substring(45)}`);
      expect(step1.substring(45)).assertEqual('d, code is 300, message is error');
      const step2: string = subject.requestModal(true, 200);
      logInfo(`step2 requestModal(true, 200): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(81);
      logInfo(`step2 requestModal(true, 200): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step2 requestModal(true, 200): step2.substring(49)=${step2.substring(49)}`);
      expect(step2.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`reportDrawn>requestModal final: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(81);
      logInfo(`reportDrawn>requestModal final: subject.lastMessage.substrin...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`reportDrawn>requestModal final: subject.lastMessage.substring(49)=${subject.lastMessage.substring(49)}`);
      expect(subject.lastMessage.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`reportDrawn>requestModal final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0089 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0090
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0090
     * @tc.desc      UiExtensionPageState call flow reportDrawn > terminateWithResult > requestModal keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0090 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.reportDrawn(75);
      logInfo(`step1 reportDrawn(75): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(76);
      logInfo(`step1 reportDrawn(75): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step1 reportDrawn(75): step1.substring(44)=${step1.substring(44)}`);
      expect(step1.substring(44)).assertEqual('ed, code is 75, message is error');
      const step2: number = subject.terminateWithResult(true);
      logInfo(`step2 terminateWithResult(true): step2=${step2}`);
      expect(step2).assertEqual(100);
      const step3: string = subject.requestModal(false, 450);
      logInfo(`step3 requestModal(false, 450): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(81);
      logInfo(`step3 requestModal(false, 450): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step3 requestModal(false, 450): step3.substring(49)=${step3.substring(49)}`);
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
      expect(subject.resultCode).assertEqual(100);
      logInfo(`reportDrawn>terminateWithResult>requestMo...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0090 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0091
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0091
     * @tc.desc      UiExtensionPageState call flow reportDrawn > requestModal > terminateWithResult > reportDrawn ke...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0091 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.reportDrawn(125);
      logInfo(`step1 reportDrawn(125): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(77);
      logInfo(`step1 reportDrawn(125): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step1 reportDrawn(125): step1.substring(45)=${step1.substring(45)}`);
      expect(step1.substring(45)).assertEqual('d, code is 125, message is error');
      const step2: string = subject.requestModal(false, 400);
      logInfo(`step2 requestModal(false, 400): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(81);
      logInfo(`step2 requestModal(false, 400): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step2 requestModal(false, 400): step2.substring(49)=${step2.substring(49)}`);
      expect(step2.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      const step3: number = subject.terminateWithResult(true);
      logInfo(`step3 terminateWithResult(true): step3=${step3}`);
      expect(step3).assertEqual(100);
      const step4: string = subject.reportDrawn(127.5);
      logInfo(`step4 reportDrawn(127.5): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(79);
      logInfo(`step4 reportDrawn(127.5): step4.substring(0, 32)=${step4.substring(0, 32)}`);
      expect(step4.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step4 reportDrawn(127.5): step4.substring(47)=${step4.substring(47)}`);
      expect(step4.substring(47)).assertEqual(' code is 127.5, message is error');
      logInfo(`reportDrawn>requestModal>terminateWithRes...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(79);
      logInfo(`reportDrawn>requestModal>terminateWithRes...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn>requestModal>terminateWithRes...: subject.lastMessa...${subject.lastMessage.substring(47)}`);
      expect(subject.lastMessage.substring(47)).assertEqual(' code is 127.5, message is error');
      logInfo(`reportDrawn>requestModal>terminateWithRes...: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`reportDrawn>requestModal>terminateWithRes...: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(100);
      logInfo(`reportDrawn>requestModal>terminateWithRes...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0091 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0092
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0092
     * @tc.desc      UiExtensionPageState call flow reportDrawn > terminateWithResult keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0092 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.reportDrawn(843);
      logInfo(`step1 reportDrawn(843): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(77);
      logInfo(`step1 reportDrawn(843): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step1 reportDrawn(843): step1.substring(45)=${step1.substring(45)}`);
      expect(step1.substring(45)).assertEqual('d, code is 843, message is error');
      const step2: number = subject.terminateWithResult(true);
      logInfo(`step2 terminateWithResult(true): step2=${step2}`);
      expect(step2).assertEqual(100);
      logInfo(`reportDrawn>terminateWithResult final: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`reportDrawn>terminateWithResult final: subject.lastMessage.s...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn>terminateWithResult final: subject.lastMessage.subs...${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 843, message is error');
      logInfo(`reportDrawn>terminateWithResult final: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`reportDrawn>terminateWithResult final: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(100);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0092 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0093
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0093
     * @tc.desc      UiExtensionPageState call flow reportDrawn > terminateWithResult > terminateWithResult > reportD...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0093 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.reportDrawn(50.71);
      logInfo(`step1 reportDrawn(50.71): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(79);
      logInfo(`step1 reportDrawn(50.71): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step1 reportDrawn(50.71): step1.substring(47)=${step1.substring(47)}`);
      expect(step1.substring(47)).assertEqual(' code is 50.71, message is error');
      const step2: number = subject.terminateWithResult(false);
      logInfo(`step2 terminateWithResult(false): step2=${step2}`);
      expect(step2).assertEqual(99);
      const step3: number = subject.terminateWithResult(true);
      logInfo(`step3 terminateWithResult(true): step3=${step3}`);
      expect(step3).assertEqual(100);
      const step4: string = subject.reportDrawn(185.1);
      logInfo(`step4 reportDrawn(185.1): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(79);
      logInfo(`step4 reportDrawn(185.1): step4.substring(0, 32)=${step4.substring(0, 32)}`);
      expect(step4.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step4 reportDrawn(185.1): step4.substring(47)=${step4.substring(47)}`);
      expect(step4.substring(47)).assertEqual(' code is 185.1, message is error');
      const step5: string = subject.open('h05Z1tQ');
      logInfo(`step5 open("h05Z1tQ"): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`reportDrawn>terminateWithResult>terminate...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(79);
      logInfo(`reportDrawn>terminateWithResult>terminate...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn>terminateWithResult>terminate...: subject.lastMessa...${subject.lastMessage.substring(47)}`);
      expect(subject.lastMessage.substring(47)).assertEqual(' code is 185.1, message is error');
      logInfo(`reportDrawn>terminateWithResult>terminate...: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`reportDrawn>terminateWithResult>terminate...: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(100);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0093 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0094
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0094
     * @tc.desc      UiExtensionPageState call flow terminateWithResult > reportDrawn > setPrivacyMode keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0094 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: number = subject.terminateWithResult(false);
      logInfo(`step1 terminateWithResult(false): step1=${step1}`);
      expect(step1).assertEqual(99);
      const step2: string = subject.reportDrawn(-15);
      logInfo(`step2 reportDrawn(-15): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(77);
      logInfo(`step2 reportDrawn(-15): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step2 reportDrawn(-15): step2.substring(45)=${step2.substring(45)}`);
      expect(step2.substring(45)).assertEqual('d, code is -15, message is error');
      const step3: string = subject.setPrivacyMode(true);
      logInfo(`step3 setPrivacyMode(true): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(84);
      logInfo(`step3 setPrivacyMode(true): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`step3 setPrivacyMode(true): step3.substring(52)=${step3.substring(52)}`);
      expect(step3.substring(52)).assertEqual('ack) called. isPrivacyMode: true');
      logInfo(`terminateWithResult>reportDrawn>setPrivac...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(84);
      logInfo(`terminateWithResult>reportDrawn>setPrivac...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`terminateWithResult>reportDrawn>setPrivac...: subject.lastMessa...${subject.lastMessage.substring(52)}`);
      expect(subject.lastMessage.substring(52)).assertEqual('ack) called. isPrivacyMode: true');
      logInfo(`terminateWithResult>reportDrawn>setPrivac...: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`terminateWithResult>reportDrawn>setPrivac...: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(99);
      logInfo(`terminateWithResult>reportDrawn>setPrivac...: subject.privacyMode=${subject.privacyMode}`);
      expect(subject.privacyMode).assertTrue();
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0094 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0095
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0095
     * @tc.desc      UiExtensionPageState call flow setPrivacyMode > requestModal keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0095 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.setPrivacyMode(false);
      logInfo(`step1 setPrivacyMode(false): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(84);
      logInfo(`step1 setPrivacyMode(false): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`step1 setPrivacyMode(false): step1.substring(52)=${step1.substring(52)}`);
      expect(step1.substring(52)).assertEqual('se) called. isPrivacyMode: false');
      const step2: string = subject.requestModal(true, 100);
      logInfo(`step2 requestModal(true, 100): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(81);
      logInfo(`step2 requestModal(true, 100): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step2 requestModal(true, 100): step2.substring(49)=${step2.substring(49)}`);
      expect(step2.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`setPrivacyMode>requestModal final: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(81);
      logInfo(`setPrivacyMode>requestModal final: subject.lastMessage.subst...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`setPrivacyMode>requestModal final: subject.lastMessage.substrin...${subject.lastMessage.substring(49)}`);
      expect(subject.lastMessage.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`setPrivacyMode>requestModal final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0095 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0096
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0096
     * @tc.desc      UiExtensionPageState call flow open > reportDrawn > terminateWithResult keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0096 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.open('x123');
      logInfo(`step1 open("x123"): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.reportDrawn(24);
      logInfo(`step2 reportDrawn(24): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(76);
      logInfo(`step2 reportDrawn(24): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step2 reportDrawn(24): step2.substring(44)=${step2.substring(44)}`);
      expect(step2.substring(44)).assertEqual('ed, code is 24, message is error');
      const step3: number = subject.terminateWithResult(true);
      logInfo(`step3 terminateWithResult(true): step3=${step3}`);
      expect(step3).assertEqual(100);
      logInfo(`open>reportDrawn>terminateWithResult final: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(76);
      logInfo(`open>reportDrawn>terminateWithResult final: subject.lastMess...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`open>reportDrawn>terminateWithResult final: subject.lastMessage...${subject.lastMessage.substring(44)}`);
      expect(subject.lastMessage.substring(44)).assertEqual('ed, code is 24, message is error');
      logInfo(`open>reportDrawn>terminateWithResult final: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`open>reportDrawn>terminateWithResult final: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(100);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0096 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0097
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0097
     * @tc.desc      UiExtensionPageState call flow setPrivacyMode > terminateWithResult > requestModal keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0097 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.setPrivacyMode(false);
      logInfo(`step1 setPrivacyMode(false): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(84);
      logInfo(`step1 setPrivacyMode(false): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`step1 setPrivacyMode(false): step1.substring(52)=${step1.substring(52)}`);
      expect(step1.substring(52)).assertEqual('se) called. isPrivacyMode: false');
      const step2: number = subject.terminateWithResult(false);
      logInfo(`step2 terminateWithResult(false): step2=${step2}`);
      expect(step2).assertEqual(99);
      const step3: string = subject.requestModal(false, 861);
      logInfo(`step3 requestModal(false, 861): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(81);
      logInfo(`step3 requestModal(false, 861): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step3 requestModal(false, 861): step3.substring(49)=${step3.substring(49)}`);
      expect(step3.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`setPrivacyMode>terminateWithResult>reques...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(81);
      logInfo(`setPrivacyMode>terminateWithResult>reques...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`setPrivacyMode>terminateWithResult>reques...: subject.lastMessa...${subject.lastMessage.substring(49)}`);
      expect(subject.lastMessage.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`setPrivacyMode>terminateWithResult>reques...: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`setPrivacyMode>terminateWithResult>reques...: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(99);
      logInfo(`setPrivacyMode>terminateWithResult>reques...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0097 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0098
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0098
     * @tc.desc      UiExtensionPageState call flow open > setPrivacyMode > setPrivacyMode keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0098 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.open('oz8ITHEFE2Cd');
      logInfo(`step1 open("oz8ITHEFE2Cd"): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.setPrivacyMode(false);
      logInfo(`step2 setPrivacyMode(false): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(84);
      logInfo(`step2 setPrivacyMode(false): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`step2 setPrivacyMode(false): step2.substring(52)=${step2.substring(52)}`);
      expect(step2.substring(52)).assertEqual('se) called. isPrivacyMode: false');
      const step3: string = subject.setPrivacyMode(true);
      logInfo(`step3 setPrivacyMode(true): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(84);
      logInfo(`step3 setPrivacyMode(true): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`step3 setPrivacyMode(true): step3.substring(52)=${step3.substring(52)}`);
      expect(step3.substring(52)).assertEqual('ack) called. isPrivacyMode: true');
      logInfo(`open>setPrivacyMode>setPrivacyMode final: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(84);
      logInfo(`open>setPrivacyMode>setPrivacyMode final: subject.lastMessag...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`open>setPrivacyMode>setPrivacyMode final: subject.lastMessage.s...${subject.lastMessage.substring(52)}`);
      expect(subject.lastMessage.substring(52)).assertEqual('ack) called. isPrivacyMode: true');
      logInfo(`open>setPrivacyMode>setPrivacyMode final: subject.privacyMode=${subject.privacyMode}`);
      expect(subject.privacyMode).assertTrue();
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0098 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0099
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0099
     * @tc.desc      UiExtensionPageState call flow reportDrawn > open > setPrivacyMode > open > setPrivacyMode keeps...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0099 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.reportDrawn(703);
      logInfo(`step1 reportDrawn(703): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(77);
      logInfo(`step1 reportDrawn(703): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step1 reportDrawn(703): step1.substring(45)=${step1.substring(45)}`);
      expect(step1.substring(45)).assertEqual('d, code is 703, message is error');
      const step2: string = subject.open('nKak');
      logInfo(`step2 open("nKak"): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.setPrivacyMode(false);
      logInfo(`step3 setPrivacyMode(false): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(84);
      logInfo(`step3 setPrivacyMode(false): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`step3 setPrivacyMode(false): step3.substring(52)=${step3.substring(52)}`);
      expect(step3.substring(52)).assertEqual('se) called. isPrivacyMode: false');
      const step4: string = subject.open('QY');
      logInfo(`step4 open("QY"): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.setPrivacyMode(true);
      logInfo(`step5 setPrivacyMode(true): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(84);
      logInfo(`step5 setPrivacyMode(true): step5.substring(0, 32)=${step5.substring(0, 32)}`);
      expect(step5.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`step5 setPrivacyMode(true): step5.substring(52)=${step5.substring(52)}`);
      expect(step5.substring(52)).assertEqual('ack) called. isPrivacyMode: true');
      logInfo(`reportDrawn>open>setPrivacyMode>open>setP...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(84);
      logInfo(`reportDrawn>open>setPrivacyMode>open>setP...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`reportDrawn>open>setPrivacyMode>open>setP...: subject.lastMessa...${subject.lastMessage.substring(52)}`);
      expect(subject.lastMessage.substring(52)).assertEqual('ack) called. isPrivacyMode: true');
      logInfo(`reportDrawn>open>setPrivacyMode>open>setP...: subject.privacyMode=${subject.privacyMode}`);
      expect(subject.privacyMode).assertTrue();
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0099 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0100
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0100
     * @tc.desc      UiExtensionPageState call flow open > requestModal > requestModal keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0100 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.open('123');
      logInfo(`step1 open("123"): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.requestModal(true, 250);
      logInfo(`step2 requestModal(true, 250): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(81);
      logInfo(`step2 requestModal(true, 250): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step2 requestModal(true, 250): step2.substring(49)=${step2.substring(49)}`);
      expect(step2.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      const step3: string = subject.requestModal(false, 400);
      logInfo(`step3 requestModal(false, 400): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(81);
      logInfo(`step3 requestModal(false, 400): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step3 requestModal(false, 400): step3.substring(49)=${step3.substring(49)}`);
      expect(step3.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`open>requestModal>requestModal final: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(81);
      logInfo(`open>requestModal>requestModal final: subject.lastMessage.su...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`open>requestModal>requestModal final: subject.lastMessage.subst...${subject.lastMessage.substring(49)}`);
      expect(subject.lastMessage.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`open>requestModal>requestModal final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(2);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0100 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0101
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0101
     * @tc.desc      UiExtensionPageState call flow terminateWithResult > reportDrawn keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0101 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: number = subject.terminateWithResult(true);
      logInfo(`step1 terminateWithResult(true): step1=${step1}`);
      expect(step1).assertEqual(100);
      const step2: string = subject.reportDrawn(277.13);
      logInfo(`step2 reportDrawn(277.13): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(80);
      logInfo(`step2 reportDrawn(277.13): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step2 reportDrawn(277.13): step2.substring(48)=${step2.substring(48)}`);
      expect(step2.substring(48)).assertEqual('code is 277.13, message is error');
      logInfo(`terminateWithResult>reportDrawn final: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(80);
      logInfo(`terminateWithResult>reportDrawn final: subject.lastMessage.s...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`terminateWithResult>reportDrawn final: subject.lastMessage.subs...${subject.lastMessage.substring(48)}`);
      expect(subject.lastMessage.substring(48)).assertEqual('code is 277.13, message is error');
      logInfo(`terminateWithResult>reportDrawn final: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`terminateWithResult>reportDrawn final: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(100);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0101 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0102
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0102
     * @tc.desc      UiExtensionPageState call flow terminateWithResult > setPrivacyMode > reportDrawn > reportDrawn ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0102 begin`);
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
      const step3: string = subject.reportDrawn(75);
      logInfo(`step3 reportDrawn(75): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(76);
      logInfo(`step3 reportDrawn(75): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step3 reportDrawn(75): step3.substring(44)=${step3.substring(44)}`);
      expect(step3.substring(44)).assertEqual('ed, code is 75, message is error');
      const step4: string = subject.reportDrawn(70.48);
      logInfo(`step4 reportDrawn(70.48): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(79);
      logInfo(`step4 reportDrawn(70.48): step4.substring(0, 32)=${step4.substring(0, 32)}`);
      expect(step4.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step4 reportDrawn(70.48): step4.substring(47)=${step4.substring(47)}`);
      expect(step4.substring(47)).assertEqual(' code is 70.48, message is error');
      const step5: string = subject.setPrivacyMode(true);
      logInfo(`step5 setPrivacyMode(true): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(84);
      logInfo(`step5 setPrivacyMode(true): step5.substring(0, 32)=${step5.substring(0, 32)}`);
      expect(step5.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`step5 setPrivacyMode(true): step5.substring(52)=${step5.substring(52)}`);
      expect(step5.substring(52)).assertEqual('ack) called. isPrivacyMode: true');
      logInfo(`terminateWithResult>setPrivacyMode>report...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(84);
      logInfo(`terminateWithResult>setPrivacyMode>report...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`terminateWithResult>setPrivacyMode>report...: subject.lastMessa...${subject.lastMessage.substring(52)}`);
      expect(subject.lastMessage.substring(52)).assertEqual('ack) called. isPrivacyMode: true');
      logInfo(`terminateWithResult>setPrivacyMode>report...: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`terminateWithResult>setPrivacyMode>report...: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(100);
      logInfo(`terminateWithResult>setPrivacyMode>report...: subject.privacyMode=${subject.privacyMode}`);
      expect(subject.privacyMode).assertTrue();
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0102 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0103
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0103
     * @tc.desc      UiExtensionPageState call flow open > open > requestModal > requestModal keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0103 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.open('19Ak27w');
      logInfo(`step1 open("19Ak27w"): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.open('H4og1');
      logInfo(`step2 open("H4og1"): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.requestModal(false, 400);
      logInfo(`step3 requestModal(false, 400): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(81);
      logInfo(`step3 requestModal(false, 400): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step3 requestModal(false, 400): step3.substring(49)=${step3.substring(49)}`);
      expect(step3.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      const step4: string = subject.requestModal(false, 494);
      logInfo(`step4 requestModal(false, 494): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(81);
      logInfo(`step4 requestModal(false, 494): step4.substring(0, 32)=${step4.substring(0, 32)}`);
      expect(step4.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step4 requestModal(false, 494): step4.substring(49)=${step4.substring(49)}`);
      expect(step4.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`open>open>requestModal>requestModal final: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(81);
      logInfo(`open>open>requestModal>requestModal final: subject.lastMessa...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`open>open>requestModal>requestModal final: subject.lastMessage....${subject.lastMessage.substring(49)}`);
      expect(subject.lastMessage.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`open>open>requestModal>requestModal final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(2);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0103 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0104
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0104
     * @tc.desc      UiExtensionPageState call flow reportDrawn > requestModal > requestModal > terminateWithResult >...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0104 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.reportDrawn(750);
      logInfo(`step1 reportDrawn(750): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(77);
      logInfo(`step1 reportDrawn(750): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step1 reportDrawn(750): step1.substring(45)=${step1.substring(45)}`);
      expect(step1.substring(45)).assertEqual('d, code is 750, message is error');
      const step2: string = subject.requestModal(false, 350);
      logInfo(`step2 requestModal(false, 350): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(81);
      logInfo(`step2 requestModal(false, 350): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step2 requestModal(false, 350): step2.substring(49)=${step2.substring(49)}`);
      expect(step2.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      const step3: string = subject.requestModal(true, 494);
      logInfo(`step3 requestModal(true, 494): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(81);
      logInfo(`step3 requestModal(true, 494): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step3 requestModal(true, 494): step3.substring(49)=${step3.substring(49)}`);
      expect(step3.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      const step4: number = subject.terminateWithResult(false);
      logInfo(`step4 terminateWithResult(false): step4=${step4}`);
      expect(step4).assertEqual(99);
      const step5: string = subject.requestModal(true, 300);
      logInfo(`step5 requestModal(true, 300): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(81);
      logInfo(`step5 requestModal(true, 300): step5.substring(0, 32)=${step5.substring(0, 32)}`);
      expect(step5.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step5 requestModal(true, 300): step5.substring(49)=${step5.substring(49)}`);
      expect(step5.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`reportDrawn>requestModal>requestModal>ter...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(81);
      logInfo(`reportDrawn>requestModal>requestModal>ter...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`reportDrawn>requestModal>requestModal>ter...: subject.lastMessa...${subject.lastMessage.substring(49)}`);
      expect(subject.lastMessage.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`reportDrawn>requestModal>requestModal>ter...: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`reportDrawn>requestModal>requestModal>ter...: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(99);
      logInfo(`reportDrawn>requestModal>requestModal>ter...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(3);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0104 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0105
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0105
     * @tc.desc      UiExtensionPageState call flow open > open > open > requestModal keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0105 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.open('5yydQNM');
      logInfo(`step1 open("5yydQNM"): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.open('D');
      logInfo(`step2 open("D"): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.open('123123');
      logInfo(`step3 open("123123"): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.requestModal(true, 861);
      logInfo(`step4 requestModal(true, 861): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(81);
      logInfo(`step4 requestModal(true, 861): step4.substring(0, 32)=${step4.substring(0, 32)}`);
      expect(step4.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step4 requestModal(true, 861): step4.substring(49)=${step4.substring(49)}`);
      expect(step4.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`open>open>open>requestModal final: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(81);
      logInfo(`open>open>open>requestModal final: subject.lastMessage.subst...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`open>open>open>requestModal final: subject.lastMessage.substrin...${subject.lastMessage.substring(49)}`);
      expect(subject.lastMessage.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`open>open>open>requestModal final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0105 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0106
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0106
     * @tc.desc      UiExtensionPageState call flow reportDrawn > setPrivacyMode > requestModal > setPrivacyMode keep...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0106 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.reportDrawn(279.01);
      logInfo(`step1 reportDrawn(279.01): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(80);
      logInfo(`step1 reportDrawn(279.01): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step1 reportDrawn(279.01): step1.substring(48)=${step1.substring(48)}`);
      expect(step1.substring(48)).assertEqual('code is 279.01, message is error');
      const step2: string = subject.setPrivacyMode(true);
      logInfo(`step2 setPrivacyMode(true): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(84);
      logInfo(`step2 setPrivacyMode(true): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`step2 setPrivacyMode(true): step2.substring(52)=${step2.substring(52)}`);
      expect(step2.substring(52)).assertEqual('ack) called. isPrivacyMode: true');
      const step3: string = subject.requestModal(true, 250);
      logInfo(`step3 requestModal(true, 250): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(81);
      logInfo(`step3 requestModal(true, 250): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step3 requestModal(true, 250): step3.substring(49)=${step3.substring(49)}`);
      expect(step3.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      const step4: string = subject.setPrivacyMode(true);
      logInfo(`step4 setPrivacyMode(true): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(84);
      logInfo(`step4 setPrivacyMode(true): step4.substring(0, 32)=${step4.substring(0, 32)}`);
      expect(step4.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`step4 setPrivacyMode(true): step4.substring(52)=${step4.substring(52)}`);
      expect(step4.substring(52)).assertEqual('ack) called. isPrivacyMode: true');
      logInfo(`reportDrawn>setPrivacyMode>requestModal>s...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(84);
      logInfo(`reportDrawn>setPrivacyMode>requestModal>s...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`reportDrawn>setPrivacyMode>requestModal>s...: subject.lastMessa...${subject.lastMessage.substring(52)}`);
      expect(subject.lastMessage.substring(52)).assertEqual('ack) called. isPrivacyMode: true');
      logInfo(`reportDrawn>setPrivacyMode>requestModal>s...: subject.privacyMode=${subject.privacyMode}`);
      expect(subject.privacyMode).assertTrue();
      logInfo(`reportDrawn>setPrivacyMode>requestModal>s...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0106 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0107
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0107
     * @tc.desc      UiExtensionPageState call flow open > requestModal > requestModal > terminateWithResult > termin...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0107 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.open('xa');
      logInfo(`step1 open("xa"): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.requestModal(false, 401);
      logInfo(`step2 requestModal(false, 401): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(81);
      logInfo(`step2 requestModal(false, 401): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step2 requestModal(false, 401): step2.substring(49)=${step2.substring(49)}`);
      expect(step2.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      const step3: string = subject.requestModal(false, 2);
      logInfo(`step3 requestModal(false, 2): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(79);
      logInfo(`step3 requestModal(false, 2): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step3 requestModal(false, 2): step3.substring(47)=${step3.substring(47)}`);
      expect(step3.substring(47)).assertEqual('age is ContextUIExtensionAbility');
      const step4: number = subject.terminateWithResult(true);
      logInfo(`step4 terminateWithResult(true): step4=${step4}`);
      expect(step4).assertEqual(100);
      const step5: number = subject.terminateWithResult(false);
      logInfo(`step5 terminateWithResult(false): step5=${step5}`);
      expect(step5).assertEqual(99);
      logInfo(`open>requestModal>requestModal>terminateW...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(79);
      logInfo(`open>requestModal>requestModal>terminateW...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`open>requestModal>requestModal>terminateW...: subject.lastMessa...${subject.lastMessage.substring(47)}`);
      expect(subject.lastMessage.substring(47)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`open>requestModal>requestModal>terminateW...: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`open>requestModal>requestModal>terminateW...: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(99);
      logInfo(`open>requestModal>requestModal>terminateW...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(2);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0107 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0108
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0108
     * @tc.desc      UiExtensionPageState call flow open > terminateWithResult > setPrivacyMode > terminateWithResult...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0108 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.open('frBjwRl5v');
      logInfo(`step1 open("frBjwRl5v"): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.terminateWithResult(true);
      logInfo(`step2 terminateWithResult(true): step2=${step2}`);
      expect(step2).assertEqual(100);
      const step3: string = subject.setPrivacyMode(true);
      logInfo(`step3 setPrivacyMode(true): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(84);
      logInfo(`step3 setPrivacyMode(true): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`step3 setPrivacyMode(true): step3.substring(52)=${step3.substring(52)}`);
      expect(step3.substring(52)).assertEqual('ack) called. isPrivacyMode: true');
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
      expect(subject.lastMessage.substring(52)).assertEqual('ack) called. isPrivacyMode: true');
      logInfo(`open>terminateWithResult>setPrivacyMode>t...: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`open>terminateWithResult>setPrivacyMode>t...: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(99);
      logInfo(`open>terminateWithResult>setPrivacyMode>t...: subject.privacyMode=${subject.privacyMode}`);
      expect(subject.privacyMode).assertTrue();
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0108 end`);
    });
  });
}
