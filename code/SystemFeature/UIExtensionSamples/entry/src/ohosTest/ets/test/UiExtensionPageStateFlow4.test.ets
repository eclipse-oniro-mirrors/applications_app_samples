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
export default function uiExtensionPageStateFlow4Test(): void {
  describe('UiExtensionPageStateFlow4Test', () => {
    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0109
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0109
     * @tc.desc      UiExtensionPageState call flow requestModal > requestModal > terminateWithResult keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0109 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.requestModal(true, 225);
      logInfo(`step1 requestModal(true, 225): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(81);
      logInfo(`step1 requestModal(true, 225): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step1 requestModal(true, 225): step1.substring(49)=${step1.substring(49)}`);
      expect(step1.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      const step2: string = subject.requestModal(true, 100);
      logInfo(`step2 requestModal(true, 100): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(81);
      logInfo(`step2 requestModal(true, 100): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step2 requestModal(true, 100): step2.substring(49)=${step2.substring(49)}`);
      expect(step2.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      const step3: number = subject.terminateWithResult(true);
      logInfo(`step3 terminateWithResult(true): step3=${step3}`);
      expect(step3).assertEqual(100);
      logInfo(`requestModal>requestModal>terminateWithRe...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(81);
      logInfo(`requestModal>requestModal>terminateWithRe...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal>requestModal>terminateWithRe...: subject.lastMessa...${subject.lastMessage.substring(49)}`);
      expect(subject.lastMessage.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`requestModal>requestModal>terminateWithRe...: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`requestModal>requestModal>terminateWithRe...: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(100);
      logInfo(`requestModal>requestModal>terminateWithRe...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(2);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0109 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0110
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0110
     * @tc.desc      UiExtensionPageState call flow terminateWithResult > terminateWithResult > setPrivacyMode > requ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0110 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: number = subject.terminateWithResult(true);
      logInfo(`step1 terminateWithResult(true): step1=${step1}`);
      expect(step1).assertEqual(100);
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
      const step4: string = subject.requestModal(false, 275);
      logInfo(`step4 requestModal(false, 275): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(81);
      logInfo(`step4 requestModal(false, 275): step4.substring(0, 32)=${step4.substring(0, 32)}`);
      expect(step4.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step4 requestModal(false, 275): step4.substring(49)=${step4.substring(49)}`);
      expect(step4.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      const step5: string = subject.reportDrawn(29);
      logInfo(`step5 reportDrawn(29): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(76);
      logInfo(`step5 reportDrawn(29): step5.substring(0, 32)=${step5.substring(0, 32)}`);
      expect(step5.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step5 reportDrawn(29): step5.substring(44)=${step5.substring(44)}`);
      expect(step5.substring(44)).assertEqual('ed, code is 29, message is error');
      logInfo(`terminateWithResult>terminateWithResult>s...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(76);
      logInfo(`terminateWithResult>terminateWithResult>s...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`terminateWithResult>terminateWithResult>s...: subject.lastMessa...${subject.lastMessage.substring(44)}`);
      expect(subject.lastMessage.substring(44)).assertEqual('ed, code is 29, message is error');
      logInfo(`terminateWithResult>terminateWithResult>s...: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`terminateWithResult>terminateWithResult>s...: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(100);
      logInfo(`terminateWithResult>terminateWithResult>s...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0110 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0111
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0111
     * @tc.desc      UiExtensionPageState call flow terminateWithResult > terminateWithResult > reportDrawn > termina...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0111 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: number = subject.terminateWithResult(false);
      logInfo(`step1 terminateWithResult(false): step1=${step1}`);
      expect(step1).assertEqual(99);
      const step2: number = subject.terminateWithResult(true);
      logInfo(`step2 terminateWithResult(true): step2=${step2}`);
      expect(step2).assertEqual(100);
      const step3: string = subject.reportDrawn(195);
      logInfo(`step3 reportDrawn(195): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(77);
      logInfo(`step3 reportDrawn(195): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step3 reportDrawn(195): step3.substring(45)=${step3.substring(45)}`);
      expect(step3.substring(45)).assertEqual('d, code is 195, message is error');
      const step4: number = subject.terminateWithResult(false);
      logInfo(`step4 terminateWithResult(false): step4=${step4}`);
      expect(step4).assertEqual(99);
      logInfo(`terminateWithResult>terminateWithResult>r...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`terminateWithResult>terminateWithResult>r...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`terminateWithResult>terminateWithResult>r...: subject.lastMessa...${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 195, message is error');
      logInfo(`terminateWithResult>terminateWithResult>r...: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`terminateWithResult>terminateWithResult>r...: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(99);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0111 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0112
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0112
     * @tc.desc      UiExtensionPageState call flow open > requestModal > reportDrawn keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0112 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.open('   ');
      logInfo(`step1 open("   "): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.requestModal(true, 2);
      logInfo(`step2 requestModal(true, 2): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(79);
      logInfo(`step2 requestModal(true, 2): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step2 requestModal(true, 2): step2.substring(47)=${step2.substring(47)}`);
      expect(step2.substring(47)).assertEqual('age is SessionUIExtensionAbility');
      const step3: string = subject.reportDrawn(775);
      logInfo(`step3 reportDrawn(775): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(77);
      logInfo(`step3 reportDrawn(775): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step3 reportDrawn(775): step3.substring(45)=${step3.substring(45)}`);
      expect(step3.substring(45)).assertEqual('d, code is 775, message is error');
      logInfo(`open>requestModal>reportDrawn final: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`open>requestModal>reportDrawn final: subject.lastMessage.sub...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`open>requestModal>reportDrawn final: subject.lastMessage.substr...${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 775, message is error');
      logInfo(`open>requestModal>reportDrawn final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0112 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0113
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0113
     * @tc.desc      UiExtensionPageState call flow setPrivacyMode > terminateWithResult > setPrivacyMode keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0113 begin`);
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
      const step3: string = subject.setPrivacyMode(true);
      logInfo(`step3 setPrivacyMode(true): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(84);
      logInfo(`step3 setPrivacyMode(true): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`step3 setPrivacyMode(true): step3.substring(52)=${step3.substring(52)}`);
      expect(step3.substring(52)).assertEqual('ack) called. isPrivacyMode: true');
      logInfo(`setPrivacyMode>terminateWithResult>setPri...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(84);
      logInfo(`setPrivacyMode>terminateWithResult>setPri...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`setPrivacyMode>terminateWithResult>setPri...: subject.lastMessa...${subject.lastMessage.substring(52)}`);
      expect(subject.lastMessage.substring(52)).assertEqual('ack) called. isPrivacyMode: true');
      logInfo(`setPrivacyMode>terminateWithResult>setPri...: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`setPrivacyMode>terminateWithResult>setPri...: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(100);
      logInfo(`setPrivacyMode>terminateWithResult>setPri...: subject.privacyMode=${subject.privacyMode}`);
      expect(subject.privacyMode).assertTrue();
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0113 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0114
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0114
     * @tc.desc      UiExtensionPageState call flow reportDrawn > open > reportDrawn > setPrivacyMode keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0114 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.reportDrawn(575);
      logInfo(`step1 reportDrawn(575): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(77);
      logInfo(`step1 reportDrawn(575): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step1 reportDrawn(575): step1.substring(45)=${step1.substring(45)}`);
      expect(step1.substring(45)).assertEqual('d, code is 575, message is error');
      const step2: string = subject.open('juF6JdWeP');
      logInfo(`step2 open("juF6JdWeP"): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.reportDrawn(1);
      logInfo(`step3 reportDrawn(1): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(75);
      logInfo(`step3 reportDrawn(1): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step3 reportDrawn(1): step3.substring(43)=${step3.substring(43)}`);
      expect(step3.substring(43)).assertEqual('led, code is 1, message is error');
      const step4: string = subject.setPrivacyMode(true);
      logInfo(`step4 setPrivacyMode(true): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(84);
      logInfo(`step4 setPrivacyMode(true): step4.substring(0, 32)=${step4.substring(0, 32)}`);
      expect(step4.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`step4 setPrivacyMode(true): step4.substring(52)=${step4.substring(52)}`);
      expect(step4.substring(52)).assertEqual('ack) called. isPrivacyMode: true');
      logInfo(`reportDrawn>open>reportDrawn>setPrivacyMo...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(84);
      logInfo(`reportDrawn>open>reportDrawn>setPrivacyMo...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`reportDrawn>open>reportDrawn>setPrivacyMo...: subject.lastMessa...${subject.lastMessage.substring(52)}`);
      expect(subject.lastMessage.substring(52)).assertEqual('ack) called. isPrivacyMode: true');
      logInfo(`reportDrawn>open>reportDrawn>setPrivacyMo...: subject.privacyMode=${subject.privacyMode}`);
      expect(subject.privacyMode).assertTrue();
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0114 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0115
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0115
     * @tc.desc      UiExtensionPageState call flow setPrivacyMode > requestModal > terminateWithResult > terminateWi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0115 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.setPrivacyMode(false);
      logInfo(`step1 setPrivacyMode(false): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(84);
      logInfo(`step1 setPrivacyMode(false): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`step1 setPrivacyMode(false): step1.substring(52)=${step1.substring(52)}`);
      expect(step1.substring(52)).assertEqual('se) called. isPrivacyMode: false');
      const step2: string = subject.requestModal(false, 2);
      logInfo(`step2 requestModal(false, 2): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(79);
      logInfo(`step2 requestModal(false, 2): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step2 requestModal(false, 2): step2.substring(47)=${step2.substring(47)}`);
      expect(step2.substring(47)).assertEqual('age is ContextUIExtensionAbility');
      const step3: number = subject.terminateWithResult(true);
      logInfo(`step3 terminateWithResult(true): step3=${step3}`);
      expect(step3).assertEqual(100);
      const step4: number = subject.terminateWithResult(false);
      logInfo(`step4 terminateWithResult(false): step4=${step4}`);
      expect(step4).assertEqual(99);
      const step5: number = subject.terminateWithResult(true);
      logInfo(`step5 terminateWithResult(true): step5=${step5}`);
      expect(step5).assertEqual(100);
      logInfo(`setPrivacyMode>requestModal>terminateWith...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(79);
      logInfo(`setPrivacyMode>requestModal>terminateWith...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`setPrivacyMode>requestModal>terminateWith...: subject.lastMessa...${subject.lastMessage.substring(47)}`);
      expect(subject.lastMessage.substring(47)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`setPrivacyMode>requestModal>terminateWith...: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`setPrivacyMode>requestModal>terminateWith...: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(100);
      logInfo(`setPrivacyMode>requestModal>terminateWith...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0115 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0116
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0116
     * @tc.desc      UiExtensionPageState call flow open > open > requestModal > open keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0116 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.open('H');
      logInfo(`step1 open("H"): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.open('x123');
      logInfo(`step2 open("x123"): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.requestModal(false, 225);
      logInfo(`step3 requestModal(false, 225): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(81);
      logInfo(`step3 requestModal(false, 225): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step3 requestModal(false, 225): step3.substring(49)=${step3.substring(49)}`);
      expect(step3.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      const step4: string = subject.open('tSvqPFfN');
      logInfo(`step4 open("tSvqPFfN"): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`open>open>requestModal>open final: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(81);
      logInfo(`open>open>requestModal>open final: subject.lastMessage.subst...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`open>open>requestModal>open final: subject.lastMessage.substrin...${subject.lastMessage.substring(49)}`);
      expect(subject.lastMessage.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`open>open>requestModal>open final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0116 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0117
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0117
     * @tc.desc      UiExtensionPageState call flow setPrivacyMode > setPrivacyMode > reportDrawn > requestModal keep...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0117 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.setPrivacyMode(false);
      logInfo(`step1 setPrivacyMode(false): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(84);
      logInfo(`step1 setPrivacyMode(false): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`step1 setPrivacyMode(false): step1.substring(52)=${step1.substring(52)}`);
      expect(step1.substring(52)).assertEqual('se) called. isPrivacyMode: false');
      const step2: string = subject.setPrivacyMode(true);
      logInfo(`step2 setPrivacyMode(true): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(84);
      logInfo(`step2 setPrivacyMode(true): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`step2 setPrivacyMode(true): step2.substring(52)=${step2.substring(52)}`);
      expect(step2.substring(52)).assertEqual('ack) called. isPrivacyMode: true');
      const step3: string = subject.reportDrawn(150);
      logInfo(`step3 reportDrawn(150): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(77);
      logInfo(`step3 reportDrawn(150): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step3 reportDrawn(150): step3.substring(45)=${step3.substring(45)}`);
      expect(step3.substring(45)).assertEqual('d, code is 150, message is error');
      const step4: string = subject.requestModal(false, 2);
      logInfo(`step4 requestModal(false, 2): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(79);
      logInfo(`step4 requestModal(false, 2): step4.substring(0, 32)=${step4.substring(0, 32)}`);
      expect(step4.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step4 requestModal(false, 2): step4.substring(47)=${step4.substring(47)}`);
      expect(step4.substring(47)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`setPrivacyMode>setPrivacyMode>reportDrawn...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(79);
      logInfo(`setPrivacyMode>setPrivacyMode>reportDrawn...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`setPrivacyMode>setPrivacyMode>reportDrawn...: subject.lastMessa...${subject.lastMessage.substring(47)}`);
      expect(subject.lastMessage.substring(47)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`setPrivacyMode>setPrivacyMode>reportDrawn...: subject.privacyMode=${subject.privacyMode}`);
      expect(subject.privacyMode).assertTrue();
      logInfo(`setPrivacyMode>setPrivacyMode>reportDrawn...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0117 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0118
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0118
     * @tc.desc      UiExtensionPageState call flow open > requestModal > open keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0118 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.open('nKak');
      logInfo(`step1 open("nKak"): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.requestModal(true, 125);
      logInfo(`step2 requestModal(true, 125): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(81);
      logInfo(`step2 requestModal(true, 125): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step2 requestModal(true, 125): step2.substring(49)=${step2.substring(49)}`);
      expect(step2.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      const step3: string = subject.open('N');
      logInfo(`step3 open("N"): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`open>requestModal>open final: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(81);
      logInfo(`open>requestModal>open final: subject.lastMessage.substring(...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`open>requestModal>open final: subject.lastMessage.substring(49)=${subject.lastMessage.substring(49)}`);
      expect(subject.lastMessage.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`open>requestModal>open final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0118 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0119
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0119
     * @tc.desc      UiExtensionPageState call flow setPrivacyMode > setPrivacyMode > terminateWithResult > open > re...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0119 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.setPrivacyMode(true);
      logInfo(`step1 setPrivacyMode(true): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(84);
      logInfo(`step1 setPrivacyMode(true): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`step1 setPrivacyMode(true): step1.substring(52)=${step1.substring(52)}`);
      expect(step1.substring(52)).assertEqual('ack) called. isPrivacyMode: true');
      const step2: string = subject.setPrivacyMode(true);
      logInfo(`step2 setPrivacyMode(true): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(84);
      logInfo(`step2 setPrivacyMode(true): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`step2 setPrivacyMode(true): step2.substring(52)=${step2.substring(52)}`);
      expect(step2.substring(52)).assertEqual('ack) called. isPrivacyMode: true');
      const step3: number = subject.terminateWithResult(true);
      logInfo(`step3 terminateWithResult(true): step3=${step3}`);
      expect(step3).assertEqual(100);
      const step4: string = subject.open('bbpiTO7Zjk');
      logInfo(`step4 open("bbpiTO7Zjk"): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.reportDrawn(-318);
      logInfo(`step5 reportDrawn(-318): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(78);
      logInfo(`step5 reportDrawn(-318): step5.substring(0, 32)=${step5.substring(0, 32)}`);
      expect(step5.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step5 reportDrawn(-318): step5.substring(46)=${step5.substring(46)}`);
      expect(step5.substring(46)).assertEqual(', code is -318, message is error');
      logInfo(`setPrivacyMode>setPrivacyMode>terminateWi...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(78);
      logInfo(`setPrivacyMode>setPrivacyMode>terminateWi...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`setPrivacyMode>setPrivacyMode>terminateWi...: subject.lastMessa...${subject.lastMessage.substring(46)}`);
      expect(subject.lastMessage.substring(46)).assertEqual(', code is -318, message is error');
      logInfo(`setPrivacyMode>setPrivacyMode>terminateWi...: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`setPrivacyMode>setPrivacyMode>terminateWi...: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(100);
      logInfo(`setPrivacyMode>setPrivacyMode>terminateWi...: subject.privacyMode=${subject.privacyMode}`);
      expect(subject.privacyMode).assertTrue();
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0119 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0120
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0120
     * @tc.desc      UiExtensionPageState call flow reportDrawn > setPrivacyMode > reportDrawn > requestModal keeps s...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0120 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.reportDrawn(-433);
      logInfo(`step1 reportDrawn(-433): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(78);
      logInfo(`step1 reportDrawn(-433): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step1 reportDrawn(-433): step1.substring(46)=${step1.substring(46)}`);
      expect(step1.substring(46)).assertEqual(', code is -433, message is error');
      const step2: string = subject.setPrivacyMode(false);
      logInfo(`step2 setPrivacyMode(false): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(84);
      logInfo(`step2 setPrivacyMode(false): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`step2 setPrivacyMode(false): step2.substring(52)=${step2.substring(52)}`);
      expect(step2.substring(52)).assertEqual('se) called. isPrivacyMode: false');
      const step3: string = subject.reportDrawn(398);
      logInfo(`step3 reportDrawn(398): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(77);
      logInfo(`step3 reportDrawn(398): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step3 reportDrawn(398): step3.substring(45)=${step3.substring(45)}`);
      expect(step3.substring(45)).assertEqual('d, code is 398, message is error');
      const step4: string = subject.requestModal(true, 275);
      logInfo(`step4 requestModal(true, 275): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(81);
      logInfo(`step4 requestModal(true, 275): step4.substring(0, 32)=${step4.substring(0, 32)}`);
      expect(step4.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step4 requestModal(true, 275): step4.substring(49)=${step4.substring(49)}`);
      expect(step4.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`reportDrawn>setPrivacyMode>reportDrawn>re...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(81);
      logInfo(`reportDrawn>setPrivacyMode>reportDrawn>re...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`reportDrawn>setPrivacyMode>reportDrawn>re...: subject.lastMessa...${subject.lastMessage.substring(49)}`);
      expect(subject.lastMessage.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`reportDrawn>setPrivacyMode>reportDrawn>re...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0120 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0121
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0121
     * @tc.desc      UiExtensionPageState call flow requestModal > setPrivacyMode > terminateWithResult > requestModa...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0121 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.requestModal(true, 175);
      logInfo(`step1 requestModal(true, 175): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(81);
      logInfo(`step1 requestModal(true, 175): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step1 requestModal(true, 175): step1.substring(49)=${step1.substring(49)}`);
      expect(step1.substring(49)).assertEqual('age is SessionUIExtensionAbility');
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
      const step4: string = subject.requestModal(true, 10);
      logInfo(`step4 requestModal(true, 10): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(80);
      logInfo(`step4 requestModal(true, 10): step4.substring(0, 32)=${step4.substring(0, 32)}`);
      expect(step4.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step4 requestModal(true, 10): step4.substring(48)=${step4.substring(48)}`);
      expect(step4.substring(48)).assertEqual('age is SessionUIExtensionAbility');
      const step5: string = subject.requestModal(true, 494);
      logInfo(`step5 requestModal(true, 494): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(81);
      logInfo(`step5 requestModal(true, 494): step5.substring(0, 32)=${step5.substring(0, 32)}`);
      expect(step5.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step5 requestModal(true, 494): step5.substring(49)=${step5.substring(49)}`);
      expect(step5.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`requestModal>setPrivacyMode>terminateWith...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(81);
      logInfo(`requestModal>setPrivacyMode>terminateWith...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal>setPrivacyMode>terminateWith...: subject.lastMessa...${subject.lastMessage.substring(49)}`);
      expect(subject.lastMessage.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`requestModal>setPrivacyMode>terminateWith...: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`requestModal>setPrivacyMode>terminateWith...: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(99);
      logInfo(`requestModal>setPrivacyMode>terminateWith...: subject.privacyMode=${subject.privacyMode}`);
      expect(subject.privacyMode).assertTrue();
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0121 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0122
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0122
     * @tc.desc      UiExtensionPageState call flow requestModal > reportDrawn > open > open keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0122 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.requestModal(false, 2);
      logInfo(`step1 requestModal(false, 2): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(79);
      logInfo(`step1 requestModal(false, 2): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step1 requestModal(false, 2): step1.substring(47)=${step1.substring(47)}`);
      expect(step1.substring(47)).assertEqual('age is ContextUIExtensionAbility');
      const step2: string = subject.reportDrawn(-114);
      logInfo(`step2 reportDrawn(-114): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(78);
      logInfo(`step2 reportDrawn(-114): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step2 reportDrawn(-114): step2.substring(46)=${step2.substring(46)}`);
      expect(step2.substring(46)).assertEqual(', code is -114, message is error');
      const step3: string = subject.open('cSAn5vqaC');
      logInfo(`step3 open("cSAn5vqaC"): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.open('MdhTih4aT');
      logInfo(`step4 open("MdhTih4aT"): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`requestModal>reportDrawn>open>open final: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(78);
      logInfo(`requestModal>reportDrawn>open>open final: subject.lastMessag...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`requestModal>reportDrawn>open>open final: subject.lastMessage.s...${subject.lastMessage.substring(46)}`);
      expect(subject.lastMessage.substring(46)).assertEqual(', code is -114, message is error');
      logInfo(`requestModal>reportDrawn>open>open final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0122 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0123
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0123
     * @tc.desc      UiExtensionPageState call flow open > open > terminateWithResult keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0123 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.open(' Hello World ');
      logInfo(`step1 open(" Hello World "): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.open('tV');
      logInfo(`step2 open("tV"): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.terminateWithResult(false);
      logInfo(`step3 terminateWithResult(false): step3=${step3}`);
      expect(step3).assertEqual(99);
      logInfo(`open>open>terminateWithResult final: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`open>open>terminateWithResult final: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(99);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0123 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0124
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0124
     * @tc.desc      UiExtensionPageState call flow requestModal > open > requestModal > requestModal keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0124 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.requestModal(true, 75);
      logInfo(`step1 requestModal(true, 75): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(80);
      logInfo(`step1 requestModal(true, 75): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step1 requestModal(true, 75): step1.substring(48)=${step1.substring(48)}`);
      expect(step1.substring(48)).assertEqual('age is SessionUIExtensionAbility');
      const step2: string = subject.open('xR');
      logInfo(`step2 open("xR"): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.requestModal(true, 404);
      logInfo(`step3 requestModal(true, 404): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(81);
      logInfo(`step3 requestModal(true, 404): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step3 requestModal(true, 404): step3.substring(49)=${step3.substring(49)}`);
      expect(step3.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      const step4: string = subject.requestModal(true, 200);
      logInfo(`step4 requestModal(true, 200): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(81);
      logInfo(`step4 requestModal(true, 200): step4.substring(0, 32)=${step4.substring(0, 32)}`);
      expect(step4.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step4 requestModal(true, 200): step4.substring(49)=${step4.substring(49)}`);
      expect(step4.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`requestModal>open>requestModal>requestMod...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(81);
      logInfo(`requestModal>open>requestModal>requestMod...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal>open>requestModal>requestMod...: subject.lastMessa...${subject.lastMessage.substring(49)}`);
      expect(subject.lastMessage.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`requestModal>open>requestModal>requestMod...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(3);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0124 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0125
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0125
     * @tc.desc      UiExtensionPageState call flow requestModal > setPrivacyMode keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0125 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.requestModal(true, 25);
      logInfo(`step1 requestModal(true, 25): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(80);
      logInfo(`step1 requestModal(true, 25): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step1 requestModal(true, 25): step1.substring(48)=${step1.substring(48)}`);
      expect(step1.substring(48)).assertEqual('age is SessionUIExtensionAbility');
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
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0125 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0126
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0126
     * @tc.desc      UiExtensionPageState call flow terminateWithResult > open > setPrivacyMode keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0126 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: number = subject.terminateWithResult(false);
      logInfo(`step1 terminateWithResult(false): step1=${step1}`);
      expect(step1).assertEqual(99);
      const step2: string = subject.open('Si8vnT');
      logInfo(`step2 open("Si8vnT"): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.setPrivacyMode(false);
      logInfo(`step3 setPrivacyMode(false): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(84);
      logInfo(`step3 setPrivacyMode(false): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`step3 setPrivacyMode(false): step3.substring(52)=${step3.substring(52)}`);
      expect(step3.substring(52)).assertEqual('se) called. isPrivacyMode: false');
      logInfo(`terminateWithResult>open>setPrivacyMode f...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(84);
      logInfo(`terminateWithResult>open>setPrivacyMode f...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`terminateWithResult>open>setPrivacyMode f...: subject.lastMessa...${subject.lastMessage.substring(52)}`);
      expect(subject.lastMessage.substring(52)).assertEqual('se) called. isPrivacyMode: false');
      logInfo(`terminateWithResult>open>setPrivacyMode f...: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`terminateWithResult>open>setPrivacyMode f...: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(99);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0126 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0127
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0127
     * @tc.desc      UiExtensionPageState call flow terminateWithResult > setPrivacyMode > terminateWithResult > term...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0127 begin`);
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
      const step3: number = subject.terminateWithResult(true);
      logInfo(`step3 terminateWithResult(true): step3=${step3}`);
      expect(step3).assertEqual(100);
      const step4: number = subject.terminateWithResult(true);
      logInfo(`step4 terminateWithResult(true): step4=${step4}`);
      expect(step4).assertEqual(100);
      const step5: string = subject.setPrivacyMode(false);
      logInfo(`step5 setPrivacyMode(false): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(84);
      logInfo(`step5 setPrivacyMode(false): step5.substring(0, 32)=${step5.substring(0, 32)}`);
      expect(step5.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`step5 setPrivacyMode(false): step5.substring(52)=${step5.substring(52)}`);
      expect(step5.substring(52)).assertEqual('se) called. isPrivacyMode: false');
      logInfo(`terminateWithResult>setPrivacyMode>termin...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(84);
      logInfo(`terminateWithResult>setPrivacyMode>termin...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`terminateWithResult>setPrivacyMode>termin...: subject.lastMessa...${subject.lastMessage.substring(52)}`);
      expect(subject.lastMessage.substring(52)).assertEqual('se) called. isPrivacyMode: false');
      logInfo(`terminateWithResult>setPrivacyMode>termin...: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`terminateWithResult>setPrivacyMode>termin...: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(100);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0127 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0128
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0128
     * @tc.desc      UiExtensionPageState call flow reportDrawn > requestModal keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0128 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.reportDrawn(-465);
      logInfo(`step1 reportDrawn(-465): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(78);
      logInfo(`step1 reportDrawn(-465): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step1 reportDrawn(-465): step1.substring(46)=${step1.substring(46)}`);
      expect(step1.substring(46)).assertEqual(', code is -465, message is error');
      const step2: string = subject.requestModal(true, 350);
      logInfo(`step2 requestModal(true, 350): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(81);
      logInfo(`step2 requestModal(true, 350): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step2 requestModal(true, 350): step2.substring(49)=${step2.substring(49)}`);
      expect(step2.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`reportDrawn>requestModal final: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(81);
      logInfo(`reportDrawn>requestModal final: subject.lastMessage.substrin...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`reportDrawn>requestModal final: subject.lastMessage.substring(49)=${subject.lastMessage.substring(49)}`);
      expect(subject.lastMessage.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`reportDrawn>requestModal final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0128 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0129
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0129
     * @tc.desc      UiExtensionPageState call flow open > setPrivacyMode keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0129 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.open('x123');
      logInfo(`step1 open("x123"): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.setPrivacyMode(false);
      logInfo(`step2 setPrivacyMode(false): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(84);
      logInfo(`step2 setPrivacyMode(false): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`step2 setPrivacyMode(false): step2.substring(52)=${step2.substring(52)}`);
      expect(step2.substring(52)).assertEqual('se) called. isPrivacyMode: false');
      logInfo(`open>setPrivacyMode final: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(84);
      logInfo(`open>setPrivacyMode final: subject.lastMessage.substring(0, ...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`open>setPrivacyMode final: subject.lastMessage.substring(52)=${subject.lastMessage.substring(52)}`);
      expect(subject.lastMessage.substring(52)).assertEqual('se) called. isPrivacyMode: false');
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0129 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0130
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0130
     * @tc.desc      UiExtensionPageState call flow reportDrawn > terminateWithResult > setPrivacyMode > setPrivacyMo...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0130 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.reportDrawn(266);
      logInfo(`step1 reportDrawn(266): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(77);
      logInfo(`step1 reportDrawn(266): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step1 reportDrawn(266): step1.substring(45)=${step1.substring(45)}`);
      expect(step1.substring(45)).assertEqual('d, code is 266, message is error');
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
      const step4: string = subject.setPrivacyMode(true);
      logInfo(`step4 setPrivacyMode(true): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(84);
      logInfo(`step4 setPrivacyMode(true): step4.substring(0, 32)=${step4.substring(0, 32)}`);
      expect(step4.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`step4 setPrivacyMode(true): step4.substring(52)=${step4.substring(52)}`);
      expect(step4.substring(52)).assertEqual('ack) called. isPrivacyMode: true');
      const step5: number = subject.terminateWithResult(false);
      logInfo(`step5 terminateWithResult(false): step5=${step5}`);
      expect(step5).assertEqual(99);
      logInfo(`reportDrawn>terminateWithResult>setPrivac...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(84);
      logInfo(`reportDrawn>terminateWithResult>setPrivac...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`reportDrawn>terminateWithResult>setPrivac...: subject.lastMessa...${subject.lastMessage.substring(52)}`);
      expect(subject.lastMessage.substring(52)).assertEqual('ack) called. isPrivacyMode: true');
      logInfo(`reportDrawn>terminateWithResult>setPrivac...: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`reportDrawn>terminateWithResult>setPrivac...: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(99);
      logInfo(`reportDrawn>terminateWithResult>setPrivac...: subject.privacyMode=${subject.privacyMode}`);
      expect(subject.privacyMode).assertTrue();
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0130 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0131
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0131
     * @tc.desc      UiExtensionPageState call flow terminateWithResult > open > setPrivacyMode keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0131 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: number = subject.terminateWithResult(false);
      logInfo(`step1 terminateWithResult(false): step1=${step1}`);
      expect(step1).assertEqual(99);
      const step2: string = subject.open('feQ');
      logInfo(`step2 open("feQ"): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.setPrivacyMode(true);
      logInfo(`step3 setPrivacyMode(true): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(84);
      logInfo(`step3 setPrivacyMode(true): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`step3 setPrivacyMode(true): step3.substring(52)=${step3.substring(52)}`);
      expect(step3.substring(52)).assertEqual('ack) called. isPrivacyMode: true');
      logInfo(`terminateWithResult>open>setPrivacyMode f...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(84);
      logInfo(`terminateWithResult>open>setPrivacyMode f...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`terminateWithResult>open>setPrivacyMode f...: subject.lastMessa...${subject.lastMessage.substring(52)}`);
      expect(subject.lastMessage.substring(52)).assertEqual('ack) called. isPrivacyMode: true');
      logInfo(`terminateWithResult>open>setPrivacyMode f...: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`terminateWithResult>open>setPrivacyMode f...: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(99);
      logInfo(`terminateWithResult>open>setPrivacyMode f...: subject.privacyMode=${subject.privacyMode}`);
      expect(subject.privacyMode).assertTrue();
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0131 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0132
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0132
     * @tc.desc      UiExtensionPageState call flow setPrivacyMode > open > reportDrawn keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0132 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.setPrivacyMode(false);
      logInfo(`step1 setPrivacyMode(false): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(84);
      logInfo(`step1 setPrivacyMode(false): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`step1 setPrivacyMode(false): step1.substring(52)=${step1.substring(52)}`);
      expect(step1.substring(52)).assertEqual('se) called. isPrivacyMode: false');
      const step2: string = subject.open('VG9PQ315');
      logInfo(`step2 open("VG9PQ315"): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.reportDrawn(266);
      logInfo(`step3 reportDrawn(266): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(77);
      logInfo(`step3 reportDrawn(266): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step3 reportDrawn(266): step3.substring(45)=${step3.substring(45)}`);
      expect(step3.substring(45)).assertEqual('d, code is 266, message is error');
      logInfo(`setPrivacyMode>open>reportDrawn final: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`setPrivacyMode>open>reportDrawn final: subject.lastMessage.s...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`setPrivacyMode>open>reportDrawn final: subject.lastMessage.subs...${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 266, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0132 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0133
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0133
     * @tc.desc      UiExtensionPageState call flow setPrivacyMode > setPrivacyMode > terminateWithResult > terminate...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0133 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.setPrivacyMode(false);
      logInfo(`step1 setPrivacyMode(false): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(84);
      logInfo(`step1 setPrivacyMode(false): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`step1 setPrivacyMode(false): step1.substring(52)=${step1.substring(52)}`);
      expect(step1.substring(52)).assertEqual('se) called. isPrivacyMode: false');
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
      const step4: number = subject.terminateWithResult(false);
      logInfo(`step4 terminateWithResult(false): step4=${step4}`);
      expect(step4).assertEqual(99);
      const step5: number = subject.terminateWithResult(false);
      logInfo(`step5 terminateWithResult(false): step5=${step5}`);
      expect(step5).assertEqual(99);
      logInfo(`setPrivacyMode>setPrivacyMode>terminateWi...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(84);
      logInfo(`setPrivacyMode>setPrivacyMode>terminateWi...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`setPrivacyMode>setPrivacyMode>terminateWi...: subject.lastMessa...${subject.lastMessage.substring(52)}`);
      expect(subject.lastMessage.substring(52)).assertEqual('ack) called. isPrivacyMode: true');
      logInfo(`setPrivacyMode>setPrivacyMode>terminateWi...: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`setPrivacyMode>setPrivacyMode>terminateWi...: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(99);
      logInfo(`setPrivacyMode>setPrivacyMode>terminateWi...: subject.privacyMode=${subject.privacyMode}`);
      expect(subject.privacyMode).assertTrue();
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0133 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0134
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0134
     * @tc.desc      UiExtensionPageState call flow open > open > terminateWithResult > open > requestModal keeps sta...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0134 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.open('xabc');
      logInfo(`step1 open("xabc"): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.open('x ');
      logInfo(`step2 open("x "): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.terminateWithResult(false);
      logInfo(`step3 terminateWithResult(false): step3=${step3}`);
      expect(step3).assertEqual(99);
      const step4: string = subject.open('frBjwRl5v');
      logInfo(`step4 open("frBjwRl5v"): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.requestModal(true, 125);
      logInfo(`step5 requestModal(true, 125): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(81);
      logInfo(`step5 requestModal(true, 125): step5.substring(0, 32)=${step5.substring(0, 32)}`);
      expect(step5.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step5 requestModal(true, 125): step5.substring(49)=${step5.substring(49)}`);
      expect(step5.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`open>open>terminateWithResult>open>reques...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(81);
      logInfo(`open>open>terminateWithResult>open>reques...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`open>open>terminateWithResult>open>reques...: subject.lastMessa...${subject.lastMessage.substring(49)}`);
      expect(subject.lastMessage.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`open>open>terminateWithResult>open>reques...: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`open>open>terminateWithResult>open>reques...: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(99);
      logInfo(`open>open>terminateWithResult>open>reques...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0134 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0135
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0135
     * @tc.desc      UiExtensionPageState call flow reportDrawn > setPrivacyMode > open > terminateWithResult keeps s...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0135 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.reportDrawn(250);
      logInfo(`step1 reportDrawn(250): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(77);
      logInfo(`step1 reportDrawn(250): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step1 reportDrawn(250): step1.substring(45)=${step1.substring(45)}`);
      expect(step1.substring(45)).assertEqual('d, code is 250, message is error');
      const step2: string = subject.setPrivacyMode(false);
      logInfo(`step2 setPrivacyMode(false): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(84);
      logInfo(`step2 setPrivacyMode(false): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`step2 setPrivacyMode(false): step2.substring(52)=${step2.substring(52)}`);
      expect(step2.substring(52)).assertEqual('se) called. isPrivacyMode: false');
      const step3: string = subject.open('frBjwRl5v');
      logInfo(`step3 open("frBjwRl5v"): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: number = subject.terminateWithResult(false);
      logInfo(`step4 terminateWithResult(false): step4=${step4}`);
      expect(step4).assertEqual(99);
      logInfo(`reportDrawn>setPrivacyMode>open>terminate...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(84);
      logInfo(`reportDrawn>setPrivacyMode>open>terminate...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`reportDrawn>setPrivacyMode>open>terminate...: subject.lastMessa...${subject.lastMessage.substring(52)}`);
      expect(subject.lastMessage.substring(52)).assertEqual('se) called. isPrivacyMode: false');
      logInfo(`reportDrawn>setPrivacyMode>open>terminate...: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`reportDrawn>setPrivacyMode>open>terminate...: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(99);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0135 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0136
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0136
     * @tc.desc      UiExtensionPageState call flow open > terminateWithResult > terminateWithResult keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0136 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.open('Rde');
      logInfo(`step1 open("Rde"): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.terminateWithResult(false);
      logInfo(`step2 terminateWithResult(false): step2=${step2}`);
      expect(step2).assertEqual(99);
      const step3: number = subject.terminateWithResult(false);
      logInfo(`step3 terminateWithResult(false): step3=${step3}`);
      expect(step3).assertEqual(99);
      logInfo(`open>terminateWithResult>terminateWithRes...: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`open>terminateWithResult>terminateWithRes...: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(99);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0136 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0137
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0137
     * @tc.desc      UiExtensionPageState call flow terminateWithResult > reportDrawn > reportDrawn > setPrivacyMode ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0137 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: number = subject.terminateWithResult(false);
      logInfo(`step1 terminateWithResult(false): step1=${step1}`);
      expect(step1).assertEqual(99);
      const step2: string = subject.reportDrawn(525);
      logInfo(`step2 reportDrawn(525): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(77);
      logInfo(`step2 reportDrawn(525): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step2 reportDrawn(525): step2.substring(45)=${step2.substring(45)}`);
      expect(step2.substring(45)).assertEqual('d, code is 525, message is error');
      const step3: string = subject.reportDrawn(-320);
      logInfo(`step3 reportDrawn(-320): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(78);
      logInfo(`step3 reportDrawn(-320): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step3 reportDrawn(-320): step3.substring(46)=${step3.substring(46)}`);
      expect(step3.substring(46)).assertEqual(', code is -320, message is error');
      const step4: string = subject.setPrivacyMode(false);
      logInfo(`step4 setPrivacyMode(false): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(84);
      logInfo(`step4 setPrivacyMode(false): step4.substring(0, 32)=${step4.substring(0, 32)}`);
      expect(step4.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`step4 setPrivacyMode(false): step4.substring(52)=${step4.substring(52)}`);
      expect(step4.substring(52)).assertEqual('se) called. isPrivacyMode: false');
      logInfo(`terminateWithResult>reportDrawn>reportDra...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(84);
      logInfo(`terminateWithResult>reportDrawn>reportDra...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`terminateWithResult>reportDrawn>reportDra...: subject.lastMessa...${subject.lastMessage.substring(52)}`);
      expect(subject.lastMessage.substring(52)).assertEqual('se) called. isPrivacyMode: false');
      logInfo(`terminateWithResult>reportDrawn>reportDra...: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`terminateWithResult>reportDrawn>reportDra...: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(99);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0137 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0138
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0138
     * @tc.desc      UiExtensionPageState call flow open > reportDrawn > requestModal > terminateWithResult > termina...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0138 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.open('xx');
      logInfo(`step1 open("xx"): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.reportDrawn(803);
      logInfo(`step2 reportDrawn(803): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(77);
      logInfo(`step2 reportDrawn(803): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step2 reportDrawn(803): step2.substring(45)=${step2.substring(45)}`);
      expect(step2.substring(45)).assertEqual('d, code is 803, message is error');
      const step3: string = subject.requestModal(false, 475);
      logInfo(`step3 requestModal(false, 475): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(81);
      logInfo(`step3 requestModal(false, 475): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step3 requestModal(false, 475): step3.substring(49)=${step3.substring(49)}`);
      expect(step3.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      const step4: number = subject.terminateWithResult(false);
      logInfo(`step4 terminateWithResult(false): step4=${step4}`);
      expect(step4).assertEqual(99);
      const step5: number = subject.terminateWithResult(true);
      logInfo(`step5 terminateWithResult(true): step5=${step5}`);
      expect(step5).assertEqual(100);
      logInfo(`open>reportDrawn>requestModal>terminateWi...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(81);
      logInfo(`open>reportDrawn>requestModal>terminateWi...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`open>reportDrawn>requestModal>terminateWi...: subject.lastMessa...${subject.lastMessage.substring(49)}`);
      expect(subject.lastMessage.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`open>reportDrawn>requestModal>terminateWi...: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`open>reportDrawn>requestModal>terminateWi...: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(100);
      logInfo(`open>reportDrawn>requestModal>terminateWi...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0138 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0139
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0139
     * @tc.desc      UiExtensionPageState call flow open > terminateWithResult > open > open > open keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0139 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.open(' x ');
      logInfo(`step1 open(" x "): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.terminateWithResult(false);
      logInfo(`step2 terminateWithResult(false): step2=${step2}`);
      expect(step2).assertEqual(99);
      const step3: string = subject.open(' x ');
      logInfo(`step3 open(" x "): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.open('Tz4ASfYDof');
      logInfo(`step4 open("Tz4ASfYDof"): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.open('abc_1');
      logInfo(`step5 open("abc_1"): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`open>terminateWithResult>open>open>open f...: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`open>terminateWithResult>open>open>open f...: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(99);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0139 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0140
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0140
     * @tc.desc      UiExtensionPageState call flow open > reportDrawn > requestModal keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0140 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.open('CcjAcD');
      logInfo(`step1 open("CcjAcD"): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.reportDrawn(369);
      logInfo(`step2 reportDrawn(369): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(77);
      logInfo(`step2 reportDrawn(369): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step2 reportDrawn(369): step2.substring(45)=${step2.substring(45)}`);
      expect(step2.substring(45)).assertEqual('d, code is 369, message is error');
      const step3: string = subject.requestModal(true, 25);
      logInfo(`step3 requestModal(true, 25): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(80);
      logInfo(`step3 requestModal(true, 25): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step3 requestModal(true, 25): step3.substring(48)=${step3.substring(48)}`);
      expect(step3.substring(48)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`open>reportDrawn>requestModal final: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(80);
      logInfo(`open>reportDrawn>requestModal final: subject.lastMessage.sub...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`open>reportDrawn>requestModal final: subject.lastMessage.substr...${subject.lastMessage.substring(48)}`);
      expect(subject.lastMessage.substring(48)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`open>reportDrawn>requestModal final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0140 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0141
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0141
     * @tc.desc      UiExtensionPageState call flow requestModal > open > terminateWithResult > requestModal keeps st...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0141 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.requestModal(false, -1);
      logInfo(`step1 requestModal(false, -1): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(80);
      logInfo(`step1 requestModal(false, -1): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step1 requestModal(false, -1): step1.substring(48)=${step1.substring(48)}`);
      expect(step1.substring(48)).assertEqual('age is ContextUIExtensionAbility');
      const step2: string = subject.open('5yydQNM');
      logInfo(`step2 open("5yydQNM"): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.terminateWithResult(false);
      logInfo(`step3 terminateWithResult(false): step3=${step3}`);
      expect(step3).assertEqual(99);
      const step4: string = subject.requestModal(false, 2);
      logInfo(`step4 requestModal(false, 2): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(79);
      logInfo(`step4 requestModal(false, 2): step4.substring(0, 32)=${step4.substring(0, 32)}`);
      expect(step4.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step4 requestModal(false, 2): step4.substring(47)=${step4.substring(47)}`);
      expect(step4.substring(47)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`requestModal>open>terminateWithResult>req...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(79);
      logInfo(`requestModal>open>terminateWithResult>req...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal>open>terminateWithResult>req...: subject.lastMessa...${subject.lastMessage.substring(47)}`);
      expect(subject.lastMessage.substring(47)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`requestModal>open>terminateWithResult>req...: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`requestModal>open>terminateWithResult>req...: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(99);
      logInfo(`requestModal>open>terminateWithResult>req...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(2);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0141 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0142
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0142
     * @tc.desc      UiExtensionPageState call flow open > reportDrawn keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0142 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.open('MdhTih4aT');
      logInfo(`step1 open("MdhTih4aT"): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.reportDrawn(66.39);
      logInfo(`step2 reportDrawn(66.39): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(79);
      logInfo(`step2 reportDrawn(66.39): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step2 reportDrawn(66.39): step2.substring(47)=${step2.substring(47)}`);
      expect(step2.substring(47)).assertEqual(' code is 66.39, message is error');
      logInfo(`open>reportDrawn final: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(79);
      logInfo(`open>reportDrawn final: subject.lastMessage.substring(0, 32)=${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`open>reportDrawn final: subject.lastMessage.substring(47)=${subject.lastMessage.substring(47)}`);
      expect(subject.lastMessage.substring(47)).assertEqual(' code is 66.39, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0142 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0143
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0143
     * @tc.desc      UiExtensionPageState call flow requestModal > terminateWithResult > setPrivacyMode > reportDrawn...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0143 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.requestModal(false, 425);
      logInfo(`step1 requestModal(false, 425): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(81);
      logInfo(`step1 requestModal(false, 425): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step1 requestModal(false, 425): step1.substring(49)=${step1.substring(49)}`);
      expect(step1.substring(49)).assertEqual('age is ContextUIExtensionAbility');
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
      const step4: string = subject.reportDrawn(279.01);
      logInfo(`step4 reportDrawn(279.01): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(80);
      logInfo(`step4 reportDrawn(279.01): step4.substring(0, 32)=${step4.substring(0, 32)}`);
      expect(step4.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step4 reportDrawn(279.01): step4.substring(48)=${step4.substring(48)}`);
      expect(step4.substring(48)).assertEqual('code is 279.01, message is error');
      logInfo(`requestModal>terminateWithResult>setPriva...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(80);
      logInfo(`requestModal>terminateWithResult>setPriva...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`requestModal>terminateWithResult>setPriva...: subject.lastMessa...${subject.lastMessage.substring(48)}`);
      expect(subject.lastMessage.substring(48)).assertEqual('code is 279.01, message is error');
      logInfo(`requestModal>terminateWithResult>setPriva...: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`requestModal>terminateWithResult>setPriva...: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(100);
      logInfo(`requestModal>terminateWithResult>setPriva...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0143 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0144
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0144
     * @tc.desc      UiExtensionPageState call flow setPrivacyMode > open > open > reportDrawn keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0144 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.setPrivacyMode(true);
      logInfo(`step1 setPrivacyMode(true): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(84);
      logInfo(`step1 setPrivacyMode(true): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`step1 setPrivacyMode(true): step1.substring(52)=${step1.substring(52)}`);
      expect(step1.substring(52)).assertEqual('ack) called. isPrivacyMode: true');
      const step2: string = subject.open('xa');
      logInfo(`step2 open("xa"): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.open('x_1');
      logInfo(`step3 open("x_1"): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.reportDrawn(354.06);
      logInfo(`step4 reportDrawn(354.06): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(80);
      logInfo(`step4 reportDrawn(354.06): step4.substring(0, 32)=${step4.substring(0, 32)}`);
      expect(step4.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step4 reportDrawn(354.06): step4.substring(48)=${step4.substring(48)}`);
      expect(step4.substring(48)).assertEqual('code is 354.06, message is error');
      logInfo(`setPrivacyMode>open>open>reportDrawn final: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(80);
      logInfo(`setPrivacyMode>open>open>reportDrawn final: subject.lastMess...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`setPrivacyMode>open>open>reportDrawn final: subject.lastMessage...${subject.lastMessage.substring(48)}`);
      expect(subject.lastMessage.substring(48)).assertEqual('code is 354.06, message is error');
      logInfo(`setPrivacyMode>open>open>reportDrawn final: subject.privacyMode=${subject.privacyMode}`);
      expect(subject.privacyMode).assertTrue();
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0144 end`);
    });
  });
}
