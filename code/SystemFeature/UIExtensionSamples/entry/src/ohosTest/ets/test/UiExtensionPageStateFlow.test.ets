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
export default function uiExtensionPageStateFlowTest(): void {
  describe('UiExtensionPageStateFlowTest', () => {
    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0001
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0001
     * @tc.desc      UiExtensionPageState call flow setPrivacyMode > terminateWithResult > requestModal > terminateWi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0001 begin`);
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
      const step3: string = subject.requestModal(false, -1);
      logInfo(`step3 requestModal(false, -1): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(80);
      logInfo(`step3 requestModal(false, -1): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step3 requestModal(false, -1): step3.substring(48)=${step3.substring(48)}`);
      expect(step3.substring(48)).assertEqual('age is ContextUIExtensionAbility');
      const step4: number = subject.terminateWithResult(false);
      logInfo(`step4 terminateWithResult(false): step4=${step4}`);
      expect(step4).assertEqual(99);
      const step5: string = subject.reportDrawn(483.66);
      logInfo(`step5 reportDrawn(483.66): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(80);
      logInfo(`step5 reportDrawn(483.66): step5.substring(0, 32)=${step5.substring(0, 32)}`);
      expect(step5.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step5 reportDrawn(483.66): step5.substring(48)=${step5.substring(48)}`);
      expect(step5.substring(48)).assertEqual('code is 483.66, message is error');
      logInfo(`setPrivacyMode>terminateWithResult>reques...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(80);
      logInfo(`setPrivacyMode>terminateWithResult>reques...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`setPrivacyMode>terminateWithResult>reques...: subject.lastMessa...${subject.lastMessage.substring(48)}`);
      expect(subject.lastMessage.substring(48)).assertEqual('code is 483.66, message is error');
      logInfo(`setPrivacyMode>terminateWithResult>reques...: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`setPrivacyMode>terminateWithResult>reques...: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(99);
      logInfo(`setPrivacyMode>terminateWithResult>reques...: subject.privacyMode=${subject.privacyMode}`);
      expect(subject.privacyMode).assertTrue();
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0001 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0002
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0002
     * @tc.desc      UiExtensionPageState call flow open > terminateWithResult keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0002 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.open(' abc ');
      logInfo(`step1 open(" abc "): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.terminateWithResult(false);
      logInfo(`step2 terminateWithResult(false): step2=${step2}`);
      expect(step2).assertEqual(99);
      logInfo(`open>terminateWithResult final: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`open>terminateWithResult final: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(99);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0002 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0003
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0003
     * @tc.desc      UiExtensionPageState call flow terminateWithResult > setPrivacyMode > requestModal keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0003 begin`);
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
      const step3: string = subject.requestModal(true, 275);
      logInfo(`step3 requestModal(true, 275): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(81);
      logInfo(`step3 requestModal(true, 275): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step3 requestModal(true, 275): step3.substring(49)=${step3.substring(49)}`);
      expect(step3.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`terminateWithResult>setPrivacyMode>reques...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(81);
      logInfo(`terminateWithResult>setPrivacyMode>reques...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`terminateWithResult>setPrivacyMode>reques...: subject.lastMessa...${subject.lastMessage.substring(49)}`);
      expect(subject.lastMessage.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`terminateWithResult>setPrivacyMode>reques...: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`terminateWithResult>setPrivacyMode>reques...: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(100);
      logInfo(`terminateWithResult>setPrivacyMode>reques...: subject.privacyMode=${subject.privacyMode}`);
      expect(subject.privacyMode).assertTrue();
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0003 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0004
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0004
     * @tc.desc      UiExtensionPageState call flow setPrivacyMode > requestModal > open > reportDrawn keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0004 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.setPrivacyMode(false);
      logInfo(`step1 setPrivacyMode(false): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(84);
      logInfo(`step1 setPrivacyMode(false): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`step1 setPrivacyMode(false): step1.substring(52)=${step1.substring(52)}`);
      expect(step1.substring(52)).assertEqual('se) called. isPrivacyMode: false');
      const step2: string = subject.requestModal(false, 200);
      logInfo(`step2 requestModal(false, 200): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(81);
      logInfo(`step2 requestModal(false, 200): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step2 requestModal(false, 200): step2.substring(49)=${step2.substring(49)}`);
      expect(step2.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      const step3: string = subject.open('H4og1');
      logInfo(`step3 open("H4og1"): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.reportDrawn(770);
      logInfo(`step4 reportDrawn(770): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(77);
      logInfo(`step4 reportDrawn(770): step4.substring(0, 32)=${step4.substring(0, 32)}`);
      expect(step4.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step4 reportDrawn(770): step4.substring(45)=${step4.substring(45)}`);
      expect(step4.substring(45)).assertEqual('d, code is 770, message is error');
      logInfo(`setPrivacyMode>requestModal>open>reportDr...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`setPrivacyMode>requestModal>open>reportDr...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`setPrivacyMode>requestModal>open>reportDr...: subject.lastMessa...${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 770, message is error');
      logInfo(`setPrivacyMode>requestModal>open>reportDr...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0004 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0005
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0005
     * @tc.desc      UiExtensionPageState call flow open > open > open > setPrivacyMode > reportDrawn keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0005 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.open('ghtjH');
      logInfo(`step1 open("ghtjH"): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.open('bbpiTO7Zjk');
      logInfo(`step2 open("bbpiTO7Zjk"): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.open('123');
      logInfo(`step3 open("123"): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.setPrivacyMode(true);
      logInfo(`step4 setPrivacyMode(true): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(84);
      logInfo(`step4 setPrivacyMode(true): step4.substring(0, 32)=${step4.substring(0, 32)}`);
      expect(step4.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`step4 setPrivacyMode(true): step4.substring(52)=${step4.substring(52)}`);
      expect(step4.substring(52)).assertEqual('ack) called. isPrivacyMode: true');
      const step5: string = subject.reportDrawn(-134);
      logInfo(`step5 reportDrawn(-134): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(78);
      logInfo(`step5 reportDrawn(-134): step5.substring(0, 32)=${step5.substring(0, 32)}`);
      expect(step5.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step5 reportDrawn(-134): step5.substring(46)=${step5.substring(46)}`);
      expect(step5.substring(46)).assertEqual(', code is -134, message is error');
      logInfo(`open>open>open>setPrivacyMode>reportDrawn...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(78);
      logInfo(`open>open>open>setPrivacyMode>reportDrawn...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`open>open>open>setPrivacyMode>reportDrawn...: subject.lastMessa...${subject.lastMessage.substring(46)}`);
      expect(subject.lastMessage.substring(46)).assertEqual(', code is -134, message is error');
      logInfo(`open>open>open>setPrivacyMode>reportDrawn...: subject.privacyMode=${subject.privacyMode}`);
      expect(subject.privacyMode).assertTrue();
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0005 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0006
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0006
     * @tc.desc      UiExtensionPageState call flow terminateWithResult > terminateWithResult > requestModal > open >...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0006 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: number = subject.terminateWithResult(true);
      logInfo(`step1 terminateWithResult(true): step1=${step1}`);
      expect(step1).assertEqual(100);
      const step2: number = subject.terminateWithResult(true);
      logInfo(`step2 terminateWithResult(true): step2=${step2}`);
      expect(step2).assertEqual(100);
      const step3: string = subject.requestModal(false, 150);
      logInfo(`step3 requestModal(false, 150): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(81);
      logInfo(`step3 requestModal(false, 150): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step3 requestModal(false, 150): step3.substring(49)=${step3.substring(49)}`);
      expect(step3.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      const step4: string = subject.open('Pa21x43o');
      logInfo(`step4 open("Pa21x43o"): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: number = subject.terminateWithResult(true);
      logInfo(`step5 terminateWithResult(true): step5=${step5}`);
      expect(step5).assertEqual(100);
      logInfo(`terminateWithResult>terminateWithResult>r...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(81);
      logInfo(`terminateWithResult>terminateWithResult>r...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`terminateWithResult>terminateWithResult>r...: subject.lastMessa...${subject.lastMessage.substring(49)}`);
      expect(subject.lastMessage.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`terminateWithResult>terminateWithResult>r...: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`terminateWithResult>terminateWithResult>r...: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(100);
      logInfo(`terminateWithResult>terminateWithResult>r...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0006 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0007
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0007
     * @tc.desc      UiExtensionPageState call flow requestModal > reportDrawn > terminateWithResult keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0007 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.requestModal(true, 425);
      logInfo(`step1 requestModal(true, 425): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(81);
      logInfo(`step1 requestModal(true, 425): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step1 requestModal(true, 425): step1.substring(49)=${step1.substring(49)}`);
      expect(step1.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      const step2: string = subject.reportDrawn(483.66);
      logInfo(`step2 reportDrawn(483.66): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(80);
      logInfo(`step2 reportDrawn(483.66): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step2 reportDrawn(483.66): step2.substring(48)=${step2.substring(48)}`);
      expect(step2.substring(48)).assertEqual('code is 483.66, message is error');
      const step3: number = subject.terminateWithResult(true);
      logInfo(`step3 terminateWithResult(true): step3=${step3}`);
      expect(step3).assertEqual(100);
      logInfo(`requestModal>reportDrawn>terminateWithRes...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(80);
      logInfo(`requestModal>reportDrawn>terminateWithRes...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`requestModal>reportDrawn>terminateWithRes...: subject.lastMessa...${subject.lastMessage.substring(48)}`);
      expect(subject.lastMessage.substring(48)).assertEqual('code is 483.66, message is error');
      logInfo(`requestModal>reportDrawn>terminateWithRes...: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`requestModal>reportDrawn>terminateWithRes...: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(100);
      logInfo(`requestModal>reportDrawn>terminateWithRes...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0007 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0008
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0008
     * @tc.desc      UiExtensionPageState call flow setPrivacyMode > setPrivacyMode keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0008 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.setPrivacyMode(false);
      logInfo(`step1 setPrivacyMode(false): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(84);
      logInfo(`step1 setPrivacyMode(false): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`step1 setPrivacyMode(false): step1.substring(52)=${step1.substring(52)}`);
      expect(step1.substring(52)).assertEqual('se) called. isPrivacyMode: false');
      const step2: string = subject.setPrivacyMode(false);
      logInfo(`step2 setPrivacyMode(false): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(84);
      logInfo(`step2 setPrivacyMode(false): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`step2 setPrivacyMode(false): step2.substring(52)=${step2.substring(52)}`);
      expect(step2.substring(52)).assertEqual('se) called. isPrivacyMode: false');
      logInfo(`setPrivacyMode>setPrivacyMode final: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(84);
      logInfo(`setPrivacyMode>setPrivacyMode final: subject.lastMessage.sub...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`setPrivacyMode>setPrivacyMode final: subject.lastMessage.substr...${subject.lastMessage.substring(52)}`);
      expect(subject.lastMessage.substring(52)).assertEqual('se) called. isPrivacyMode: false');
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0008 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0009
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0009
     * @tc.desc      UiExtensionPageState call flow reportDrawn > open > setPrivacyMode > open keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0009 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.reportDrawn(688);
      logInfo(`step1 reportDrawn(688): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(77);
      logInfo(`step1 reportDrawn(688): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step1 reportDrawn(688): step1.substring(45)=${step1.substring(45)}`);
      expect(step1.substring(45)).assertEqual('d, code is 688, message is error');
      const step2: string = subject.open('Hello World');
      logInfo(`step2 open("Hello World"): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.setPrivacyMode(true);
      logInfo(`step3 setPrivacyMode(true): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(84);
      logInfo(`step3 setPrivacyMode(true): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`step3 setPrivacyMode(true): step3.substring(52)=${step3.substring(52)}`);
      expect(step3.substring(52)).assertEqual('ack) called. isPrivacyMode: true');
      const step4: string = subject.open('XuFRoDmSQp');
      logInfo(`step4 open("XuFRoDmSQp"): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`reportDrawn>open>setPrivacyMode>open final: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(84);
      logInfo(`reportDrawn>open>setPrivacyMode>open final: subject.lastMess...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`reportDrawn>open>setPrivacyMode>open final: subject.lastMessage...${subject.lastMessage.substring(52)}`);
      expect(subject.lastMessage.substring(52)).assertEqual('ack) called. isPrivacyMode: true');
      logInfo(`reportDrawn>open>setPrivacyMode>open final: subject.privacyMode=${subject.privacyMode}`);
      expect(subject.privacyMode).assertTrue();
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0009 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0010
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0010
     * @tc.desc      UiExtensionPageState call flow setPrivacyMode > reportDrawn keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0010 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.setPrivacyMode(true);
      logInfo(`step1 setPrivacyMode(true): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(84);
      logInfo(`step1 setPrivacyMode(true): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`step1 setPrivacyMode(true): step1.substring(52)=${step1.substring(52)}`);
      expect(step1.substring(52)).assertEqual('ack) called. isPrivacyMode: true');
      const step2: string = subject.reportDrawn(-228);
      logInfo(`step2 reportDrawn(-228): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(78);
      logInfo(`step2 reportDrawn(-228): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step2 reportDrawn(-228): step2.substring(46)=${step2.substring(46)}`);
      expect(step2.substring(46)).assertEqual(', code is -228, message is error');
      logInfo(`setPrivacyMode>reportDrawn final: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(78);
      logInfo(`setPrivacyMode>reportDrawn final: subject.lastMessage.substr...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`setPrivacyMode>reportDrawn final: subject.lastMessage.substring...${subject.lastMessage.substring(46)}`);
      expect(subject.lastMessage.substring(46)).assertEqual(', code is -228, message is error');
      logInfo(`setPrivacyMode>reportDrawn final: subject.privacyMode=${subject.privacyMode}`);
      expect(subject.privacyMode).assertTrue();
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0010 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0011
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0011
     * @tc.desc      UiExtensionPageState call flow requestModal > requestModal > setPrivacyMode > reportDrawn > requ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0011 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.requestModal(true, 375);
      logInfo(`step1 requestModal(true, 375): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(81);
      logInfo(`step1 requestModal(true, 375): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step1 requestModal(true, 375): step1.substring(49)=${step1.substring(49)}`);
      expect(step1.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      const step2: string = subject.requestModal(false, 200);
      logInfo(`step2 requestModal(false, 200): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(81);
      logInfo(`step2 requestModal(false, 200): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step2 requestModal(false, 200): step2.substring(49)=${step2.substring(49)}`);
      expect(step2.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      const step3: string = subject.setPrivacyMode(false);
      logInfo(`step3 setPrivacyMode(false): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(84);
      logInfo(`step3 setPrivacyMode(false): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`step3 setPrivacyMode(false): step3.substring(52)=${step3.substring(52)}`);
      expect(step3.substring(52)).assertEqual('se) called. isPrivacyMode: false');
      const step4: string = subject.reportDrawn(159.14);
      logInfo(`step4 reportDrawn(159.14): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(80);
      logInfo(`step4 reportDrawn(159.14): step4.substring(0, 32)=${step4.substring(0, 32)}`);
      expect(step4.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step4 reportDrawn(159.14): step4.substring(48)=${step4.substring(48)}`);
      expect(step4.substring(48)).assertEqual('code is 159.14, message is error');
      const step5: string = subject.requestModal(true, 100);
      logInfo(`step5 requestModal(true, 100): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(81);
      logInfo(`step5 requestModal(true, 100): step5.substring(0, 32)=${step5.substring(0, 32)}`);
      expect(step5.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step5 requestModal(true, 100): step5.substring(49)=${step5.substring(49)}`);
      expect(step5.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`requestModal>requestModal>setPrivacyMode>...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(81);
      logInfo(`requestModal>requestModal>setPrivacyMode>...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal>requestModal>setPrivacyMode>...: subject.lastMessa...${subject.lastMessage.substring(49)}`);
      expect(subject.lastMessage.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`requestModal>requestModal>setPrivacyMode>...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(3);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0011 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0012
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0012
     * @tc.desc      UiExtensionPageState call flow terminateWithResult > open > requestModal keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0012 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: number = subject.terminateWithResult(true);
      logInfo(`step1 terminateWithResult(true): step1=${step1}`);
      expect(step1).assertEqual(100);
      const step2: string = subject.open('n');
      logInfo(`step2 open("n"): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.requestModal(false, 225);
      logInfo(`step3 requestModal(false, 225): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(81);
      logInfo(`step3 requestModal(false, 225): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step3 requestModal(false, 225): step3.substring(49)=${step3.substring(49)}`);
      expect(step3.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`terminateWithResult>open>requestModal final: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(81);
      logInfo(`terminateWithResult>open>requestModal final: subject.lastMes...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`terminateWithResult>open>requestModal final: subject.lastMessag...${subject.lastMessage.substring(49)}`);
      expect(subject.lastMessage.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`terminateWithResult>open>requestModal final: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`terminateWithResult>open>requestModal final: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(100);
      logInfo(`terminateWithResult>open>requestModal final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0012 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0013
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0013
     * @tc.desc      UiExtensionPageState call flow requestModal > terminateWithResult > terminateWithResult keeps st...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0013 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.requestModal(false, 450);
      logInfo(`step1 requestModal(false, 450): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(81);
      logInfo(`step1 requestModal(false, 450): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step1 requestModal(false, 450): step1.substring(49)=${step1.substring(49)}`);
      expect(step1.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      const step2: number = subject.terminateWithResult(false);
      logInfo(`step2 terminateWithResult(false): step2=${step2}`);
      expect(step2).assertEqual(99);
      const step3: number = subject.terminateWithResult(false);
      logInfo(`step3 terminateWithResult(false): step3=${step3}`);
      expect(step3).assertEqual(99);
      logInfo(`requestModal>terminateWithResult>terminat...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(81);
      logInfo(`requestModal>terminateWithResult>terminat...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`requestModal>terminateWithResult>terminat...: subject.lastMessa...${subject.lastMessage.substring(49)}`);
      expect(subject.lastMessage.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`requestModal>terminateWithResult>terminat...: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`requestModal>terminateWithResult>terminat...: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(99);
      logInfo(`requestModal>terminateWithResult>terminat...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0013 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0014
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0014
     * @tc.desc      UiExtensionPageState call flow reportDrawn > setPrivacyMode > terminateWithResult keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0014 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.reportDrawn(354.06);
      logInfo(`step1 reportDrawn(354.06): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(80);
      logInfo(`step1 reportDrawn(354.06): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step1 reportDrawn(354.06): step1.substring(48)=${step1.substring(48)}`);
      expect(step1.substring(48)).assertEqual('code is 354.06, message is error');
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
      logInfo(`reportDrawn>setPrivacyMode>terminateWithR...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(84);
      logInfo(`reportDrawn>setPrivacyMode>terminateWithR...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`reportDrawn>setPrivacyMode>terminateWithR...: subject.lastMessa...${subject.lastMessage.substring(52)}`);
      expect(subject.lastMessage.substring(52)).assertEqual('se) called. isPrivacyMode: false');
      logInfo(`reportDrawn>setPrivacyMode>terminateWithR...: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`reportDrawn>setPrivacyMode>terminateWithR...: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(100);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0014 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0015
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0015
     * @tc.desc      UiExtensionPageState call flow reportDrawn > reportDrawn keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0015 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.reportDrawn(25);
      logInfo(`step1 reportDrawn(25): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(76);
      logInfo(`step1 reportDrawn(25): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step1 reportDrawn(25): step1.substring(44)=${step1.substring(44)}`);
      expect(step1.substring(44)).assertEqual('ed, code is 25, message is error');
      const step2: string = subject.reportDrawn(843);
      logInfo(`step2 reportDrawn(843): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(77);
      logInfo(`step2 reportDrawn(843): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step2 reportDrawn(843): step2.substring(45)=${step2.substring(45)}`);
      expect(step2.substring(45)).assertEqual('d, code is 843, message is error');
      logInfo(`reportDrawn>reportDrawn final: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`reportDrawn>reportDrawn final: subject.lastMessage.substring...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn>reportDrawn final: subject.lastMessage.substring(45)=${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 843, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0015 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0016
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0016
     * @tc.desc      UiExtensionPageState call flow open > terminateWithResult > requestModal > open keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0016 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.open(' abc ');
      logInfo(`step1 open(" abc "): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.terminateWithResult(false);
      logInfo(`step2 terminateWithResult(false): step2=${step2}`);
      expect(step2).assertEqual(99);
      const step3: string = subject.requestModal(true, 0);
      logInfo(`step3 requestModal(true, 0): step3=${step3}`);
      expect(step3).assertEqual('requestModalUIExtension succeed.');
      const step4: string = subject.open('3wNBQYfXN');
      logInfo(`step4 open("3wNBQYfXN"): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`open>terminateWithResult>requestModal>ope...: subject.lastMessage=${subject.lastMessage}`);
      expect(subject.lastMessage).assertEqual('requestModalUIExtension succeed.');
      logInfo(`open>terminateWithResult>requestModal>ope...: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`open>terminateWithResult>requestModal>ope...: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(99);
      logInfo(`open>terminateWithResult>requestModal>ope...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0016 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0017
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0017
     * @tc.desc      UiExtensionPageState call flow setPrivacyMode > requestModal keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0017 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.setPrivacyMode(false);
      logInfo(`step1 setPrivacyMode(false): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(84);
      logInfo(`step1 setPrivacyMode(false): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`step1 setPrivacyMode(false): step1.substring(52)=${step1.substring(52)}`);
      expect(step1.substring(52)).assertEqual('se) called. isPrivacyMode: false');
      const step2: string = subject.requestModal(false, 404);
      logInfo(`step2 requestModal(false, 404): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(81);
      logInfo(`step2 requestModal(false, 404): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step2 requestModal(false, 404): step2.substring(49)=${step2.substring(49)}`);
      expect(step2.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`setPrivacyMode>requestModal final: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(81);
      logInfo(`setPrivacyMode>requestModal final: subject.lastMessage.subst...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`setPrivacyMode>requestModal final: subject.lastMessage.substrin...${subject.lastMessage.substring(49)}`);
      expect(subject.lastMessage.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`setPrivacyMode>requestModal final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0017 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0018
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0018
     * @tc.desc      UiExtensionPageState call flow reportDrawn > setPrivacyMode > terminateWithResult keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0018 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.reportDrawn(708);
      logInfo(`step1 reportDrawn(708): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(77);
      logInfo(`step1 reportDrawn(708): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step1 reportDrawn(708): step1.substring(45)=${step1.substring(45)}`);
      expect(step1.substring(45)).assertEqual('d, code is 708, message is error');
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
      logInfo(`reportDrawn>setPrivacyMode>terminateWithR...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(84);
      logInfo(`reportDrawn>setPrivacyMode>terminateWithR...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`reportDrawn>setPrivacyMode>terminateWithR...: subject.lastMessa...${subject.lastMessage.substring(52)}`);
      expect(subject.lastMessage.substring(52)).assertEqual('se) called. isPrivacyMode: false');
      logInfo(`reportDrawn>setPrivacyMode>terminateWithR...: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`reportDrawn>setPrivacyMode>terminateWithR...: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(100);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0018 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0019
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0019
     * @tc.desc      UiExtensionPageState call flow setPrivacyMode > requestModal > terminateWithResult keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0019 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.setPrivacyMode(false);
      logInfo(`step1 setPrivacyMode(false): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(84);
      logInfo(`step1 setPrivacyMode(false): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`step1 setPrivacyMode(false): step1.substring(52)=${step1.substring(52)}`);
      expect(step1.substring(52)).assertEqual('se) called. isPrivacyMode: false');
      const step2: string = subject.requestModal(true, 401);
      logInfo(`step2 requestModal(true, 401): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(81);
      logInfo(`step2 requestModal(true, 401): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step2 requestModal(true, 401): step2.substring(49)=${step2.substring(49)}`);
      expect(step2.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      const step3: number = subject.terminateWithResult(false);
      logInfo(`step3 terminateWithResult(false): step3=${step3}`);
      expect(step3).assertEqual(99);
      logInfo(`setPrivacyMode>requestModal>terminateWith...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(81);
      logInfo(`setPrivacyMode>requestModal>terminateWith...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`setPrivacyMode>requestModal>terminateWith...: subject.lastMessa...${subject.lastMessage.substring(49)}`);
      expect(subject.lastMessage.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`setPrivacyMode>requestModal>terminateWith...: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`setPrivacyMode>requestModal>terminateWith...: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(99);
      logInfo(`setPrivacyMode>requestModal>terminateWith...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0019 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0020
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0020
     * @tc.desc      UiExtensionPageState call flow reportDrawn > setPrivacyMode > terminateWithResult > reportDrawn ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0020 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.reportDrawn(-459);
      logInfo(`step1 reportDrawn(-459): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(78);
      logInfo(`step1 reportDrawn(-459): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step1 reportDrawn(-459): step1.substring(46)=${step1.substring(46)}`);
      expect(step1.substring(46)).assertEqual(', code is -459, message is error');
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
      const step4: string = subject.reportDrawn(225);
      logInfo(`step4 reportDrawn(225): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(77);
      logInfo(`step4 reportDrawn(225): step4.substring(0, 32)=${step4.substring(0, 32)}`);
      expect(step4.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step4 reportDrawn(225): step4.substring(45)=${step4.substring(45)}`);
      expect(step4.substring(45)).assertEqual('d, code is 225, message is error');
      const step5: string = subject.reportDrawn(-207);
      logInfo(`step5 reportDrawn(-207): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(78);
      logInfo(`step5 reportDrawn(-207): step5.substring(0, 32)=${step5.substring(0, 32)}`);
      expect(step5.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step5 reportDrawn(-207): step5.substring(46)=${step5.substring(46)}`);
      expect(step5.substring(46)).assertEqual(', code is -207, message is error');
      logInfo(`reportDrawn>setPrivacyMode>terminateWithR...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(78);
      logInfo(`reportDrawn>setPrivacyMode>terminateWithR...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn>setPrivacyMode>terminateWithR...: subject.lastMessa...${subject.lastMessage.substring(46)}`);
      expect(subject.lastMessage.substring(46)).assertEqual(', code is -207, message is error');
      logInfo(`reportDrawn>setPrivacyMode>terminateWithR...: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`reportDrawn>setPrivacyMode>terminateWithR...: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(99);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0020 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0021
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0021
     * @tc.desc      UiExtensionPageState call flow reportDrawn > setPrivacyMode > terminateWithResult > setPrivacyMo...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0021 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.reportDrawn(353);
      logInfo(`step1 reportDrawn(353): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(77);
      logInfo(`step1 reportDrawn(353): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step1 reportDrawn(353): step1.substring(45)=${step1.substring(45)}`);
      expect(step1.substring(45)).assertEqual('d, code is 353, message is error');
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
      const step4: string = subject.setPrivacyMode(false);
      logInfo(`step4 setPrivacyMode(false): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(84);
      logInfo(`step4 setPrivacyMode(false): step4.substring(0, 32)=${step4.substring(0, 32)}`);
      expect(step4.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`step4 setPrivacyMode(false): step4.substring(52)=${step4.substring(52)}`);
      expect(step4.substring(52)).assertEqual('se) called. isPrivacyMode: false');
      const step5: string = subject.setPrivacyMode(true);
      logInfo(`step5 setPrivacyMode(true): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(84);
      logInfo(`step5 setPrivacyMode(true): step5.substring(0, 32)=${step5.substring(0, 32)}`);
      expect(step5.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`step5 setPrivacyMode(true): step5.substring(52)=${step5.substring(52)}`);
      expect(step5.substring(52)).assertEqual('ack) called. isPrivacyMode: true');
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
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0021 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0022
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0022
     * @tc.desc      UiExtensionPageState call flow terminateWithResult > terminateWithResult keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0022 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: number = subject.terminateWithResult(false);
      logInfo(`step1 terminateWithResult(false): step1=${step1}`);
      expect(step1).assertEqual(99);
      const step2: number = subject.terminateWithResult(false);
      logInfo(`step2 terminateWithResult(false): step2=${step2}`);
      expect(step2).assertEqual(99);
      logInfo(`terminateWithResult>terminateWithResult f...: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`terminateWithResult>terminateWithResult f...: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(99);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0022 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0023
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0023
     * @tc.desc      UiExtensionPageState call flow requestModal > open > open > terminateWithResult > setPrivacyMode...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0023 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.requestModal(false, 175);
      logInfo(`step1 requestModal(false, 175): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(81);
      logInfo(`step1 requestModal(false, 175): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step1 requestModal(false, 175): step1.substring(49)=${step1.substring(49)}`);
      expect(step1.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      const step2: string = subject.open('n2imvliv7B');
      logInfo(`step2 open("n2imvliv7B"): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.open('Q1kP7q');
      logInfo(`step3 open("Q1kP7q"): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: number = subject.terminateWithResult(true);
      logInfo(`step4 terminateWithResult(true): step4=${step4}`);
      expect(step4).assertEqual(100);
      const step5: string = subject.setPrivacyMode(true);
      logInfo(`step5 setPrivacyMode(true): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(84);
      logInfo(`step5 setPrivacyMode(true): step5.substring(0, 32)=${step5.substring(0, 32)}`);
      expect(step5.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`step5 setPrivacyMode(true): step5.substring(52)=${step5.substring(52)}`);
      expect(step5.substring(52)).assertEqual('ack) called. isPrivacyMode: true');
      logInfo(`requestModal>open>open>terminateWithResul...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(84);
      logInfo(`requestModal>open>open>terminateWithResul...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`requestModal>open>open>terminateWithResul...: subject.lastMessa...${subject.lastMessage.substring(52)}`);
      expect(subject.lastMessage.substring(52)).assertEqual('ack) called. isPrivacyMode: true');
      logInfo(`requestModal>open>open>terminateWithResul...: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`requestModal>open>open>terminateWithResul...: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(100);
      logInfo(`requestModal>open>open>terminateWithResul...: subject.privacyMode=${subject.privacyMode}`);
      expect(subject.privacyMode).assertTrue();
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0023 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0024
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0024
     * @tc.desc      UiExtensionPageState call flow terminateWithResult > requestModal keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0024 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: number = subject.terminateWithResult(true);
      logInfo(`step1 terminateWithResult(true): step1=${step1}`);
      expect(step1).assertEqual(100);
      const step2: string = subject.requestModal(true, 325);
      logInfo(`step2 requestModal(true, 325): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(81);
      logInfo(`step2 requestModal(true, 325): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step2 requestModal(true, 325): step2.substring(49)=${step2.substring(49)}`);
      expect(step2.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`terminateWithResult>requestModal final: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(81);
      logInfo(`terminateWithResult>requestModal final: subject.lastMessage....${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`terminateWithResult>requestModal final: subject.lastMessage.sub...${subject.lastMessage.substring(49)}`);
      expect(subject.lastMessage.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`terminateWithResult>requestModal final: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`terminateWithResult>requestModal final: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(100);
      logInfo(`terminateWithResult>requestModal final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0024 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0025
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0025
     * @tc.desc      UiExtensionPageState call flow terminateWithResult > requestModal keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0025 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: number = subject.terminateWithResult(false);
      logInfo(`step1 terminateWithResult(false): step1=${step1}`);
      expect(step1).assertEqual(99);
      const step2: string = subject.requestModal(false, 300);
      logInfo(`step2 requestModal(false, 300): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(81);
      logInfo(`step2 requestModal(false, 300): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step2 requestModal(false, 300): step2.substring(49)=${step2.substring(49)}`);
      expect(step2.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`terminateWithResult>requestModal final: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(81);
      logInfo(`terminateWithResult>requestModal final: subject.lastMessage....${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`terminateWithResult>requestModal final: subject.lastMessage.sub...${subject.lastMessage.substring(49)}`);
      expect(subject.lastMessage.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      logInfo(`terminateWithResult>requestModal final: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`terminateWithResult>requestModal final: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(99);
      logInfo(`terminateWithResult>requestModal final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0025 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0026
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0026
     * @tc.desc      UiExtensionPageState call flow setPrivacyMode > terminateWithResult > open keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0026 begin`);
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
      const step3: string = subject.open('123_1');
      logInfo(`step3 open("123_1"): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`setPrivacyMode>terminateWithResult>open f...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(84);
      logInfo(`setPrivacyMode>terminateWithResult>open f...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`setPrivacyMode>terminateWithResult>open f...: subject.lastMessa...${subject.lastMessage.substring(52)}`);
      expect(subject.lastMessage.substring(52)).assertEqual('se) called. isPrivacyMode: false');
      logInfo(`setPrivacyMode>terminateWithResult>open f...: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`setPrivacyMode>terminateWithResult>open f...: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(99);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0026 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0027
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0027
     * @tc.desc      UiExtensionPageState call flow terminateWithResult > setPrivacyMode > requestModal > setPrivacyM...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0027 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: number = subject.terminateWithResult(false);
      logInfo(`step1 terminateWithResult(false): step1=${step1}`);
      expect(step1).assertEqual(99);
      const step2: string = subject.setPrivacyMode(false);
      logInfo(`step2 setPrivacyMode(false): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(84);
      logInfo(`step2 setPrivacyMode(false): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`step2 setPrivacyMode(false): step2.substring(52)=${step2.substring(52)}`);
      expect(step2.substring(52)).assertEqual('se) called. isPrivacyMode: false');
      const step3: string = subject.requestModal(false, -1);
      logInfo(`step3 requestModal(false, -1): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(80);
      logInfo(`step3 requestModal(false, -1): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step3 requestModal(false, -1): step3.substring(48)=${step3.substring(48)}`);
      expect(step3.substring(48)).assertEqual('age is ContextUIExtensionAbility');
      const step4: string = subject.setPrivacyMode(true);
      logInfo(`step4 setPrivacyMode(true): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(84);
      logInfo(`step4 setPrivacyMode(true): step4.substring(0, 32)=${step4.substring(0, 32)}`);
      expect(step4.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`step4 setPrivacyMode(true): step4.substring(52)=${step4.substring(52)}`);
      expect(step4.substring(52)).assertEqual('ack) called. isPrivacyMode: true');
      logInfo(`terminateWithResult>setPrivacyMode>reques...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(84);
      logInfo(`terminateWithResult>setPrivacyMode>reques...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`terminateWithResult>setPrivacyMode>reques...: subject.lastMessa...${subject.lastMessage.substring(52)}`);
      expect(subject.lastMessage.substring(52)).assertEqual('ack) called. isPrivacyMode: true');
      logInfo(`terminateWithResult>setPrivacyMode>reques...: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`terminateWithResult>setPrivacyMode>reques...: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(99);
      logInfo(`terminateWithResult>setPrivacyMode>reques...: subject.privacyMode=${subject.privacyMode}`);
      expect(subject.privacyMode).assertTrue();
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0027 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0028
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0028
     * @tc.desc      UiExtensionPageState call flow terminateWithResult > terminateWithResult > reportDrawn > setPriv...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0028 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: number = subject.terminateWithResult(false);
      logInfo(`step1 terminateWithResult(false): step1=${step1}`);
      expect(step1).assertEqual(99);
      const step2: number = subject.terminateWithResult(false);
      logInfo(`step2 terminateWithResult(false): step2=${step2}`);
      expect(step2).assertEqual(99);
      const step3: string = subject.reportDrawn(984);
      logInfo(`step3 reportDrawn(984): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(77);
      logInfo(`step3 reportDrawn(984): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step3 reportDrawn(984): step3.substring(45)=${step3.substring(45)}`);
      expect(step3.substring(45)).assertEqual('d, code is 984, message is error');
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
      logInfo(`terminateWithResult>terminateWithResult>r...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(84);
      logInfo(`terminateWithResult>terminateWithResult>r...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`terminateWithResult>terminateWithResult>r...: subject.lastMessa...${subject.lastMessage.substring(52)}`);
      expect(subject.lastMessage.substring(52)).assertEqual('se) called. isPrivacyMode: false');
      logInfo(`terminateWithResult>terminateWithResult>r...: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`terminateWithResult>terminateWithResult>r...: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(99);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0028 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0029
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0029
     * @tc.desc      UiExtensionPageState call flow open > reportDrawn > setPrivacyMode > requestModal keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0029 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.open('feQ');
      logInfo(`step1 open("feQ"): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.reportDrawn(200);
      logInfo(`step2 reportDrawn(200): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(77);
      logInfo(`step2 reportDrawn(200): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step2 reportDrawn(200): step2.substring(45)=${step2.substring(45)}`);
      expect(step2.substring(45)).assertEqual('d, code is 200, message is error');
      const step3: string = subject.setPrivacyMode(true);
      logInfo(`step3 setPrivacyMode(true): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(84);
      logInfo(`step3 setPrivacyMode(true): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`step3 setPrivacyMode(true): step3.substring(52)=${step3.substring(52)}`);
      expect(step3.substring(52)).assertEqual('ack) called. isPrivacyMode: true');
      const step4: string = subject.requestModal(true, 2);
      logInfo(`step4 requestModal(true, 2): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(79);
      logInfo(`step4 requestModal(true, 2): step4.substring(0, 32)=${step4.substring(0, 32)}`);
      expect(step4.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step4 requestModal(true, 2): step4.substring(47)=${step4.substring(47)}`);
      expect(step4.substring(47)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`open>reportDrawn>setPrivacyMode>requestMo...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(79);
      logInfo(`open>reportDrawn>setPrivacyMode>requestMo...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`open>reportDrawn>setPrivacyMode>requestMo...: subject.lastMessa...${subject.lastMessage.substring(47)}`);
      expect(subject.lastMessage.substring(47)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`open>reportDrawn>setPrivacyMode>requestMo...: subject.privacyMode=${subject.privacyMode}`);
      expect(subject.privacyMode).assertTrue();
      logInfo(`open>reportDrawn>setPrivacyMode>requestMo...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0029 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0030
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0030
     * @tc.desc      UiExtensionPageState call flow open > setPrivacyMode > setPrivacyMode > open > setPrivacyMode ke...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0030 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.open('123123');
      logInfo(`step1 open("123123"): step1=${step1}`);
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
      const step4: string = subject.open(' a ');
      logInfo(`step4 open(" a "): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.setPrivacyMode(true);
      logInfo(`step5 setPrivacyMode(true): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(84);
      logInfo(`step5 setPrivacyMode(true): step5.substring(0, 32)=${step5.substring(0, 32)}`);
      expect(step5.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`step5 setPrivacyMode(true): step5.substring(52)=${step5.substring(52)}`);
      expect(step5.substring(52)).assertEqual('ack) called. isPrivacyMode: true');
      logInfo(`open>setPrivacyMode>setPrivacyMode>open>s...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(84);
      logInfo(`open>setPrivacyMode>setPrivacyMode>open>s...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`open>setPrivacyMode>setPrivacyMode>open>s...: subject.lastMessa...${subject.lastMessage.substring(52)}`);
      expect(subject.lastMessage.substring(52)).assertEqual('ack) called. isPrivacyMode: true');
      logInfo(`open>setPrivacyMode>setPrivacyMode>open>s...: subject.privacyMode=${subject.privacyMode}`);
      expect(subject.privacyMode).assertTrue();
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0030 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0031
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0031
     * @tc.desc      UiExtensionPageState call flow requestModal > reportDrawn > terminateWithResult > open > termina...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0031 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.requestModal(true, 275);
      logInfo(`step1 requestModal(true, 275): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(81);
      logInfo(`step1 requestModal(true, 275): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step1 requestModal(true, 275): step1.substring(49)=${step1.substring(49)}`);
      expect(step1.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      const step2: string = subject.reportDrawn(450);
      logInfo(`step2 reportDrawn(450): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(77);
      logInfo(`step2 reportDrawn(450): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step2 reportDrawn(450): step2.substring(45)=${step2.substring(45)}`);
      expect(step2.substring(45)).assertEqual('d, code is 450, message is error');
      const step3: number = subject.terminateWithResult(false);
      logInfo(`step3 terminateWithResult(false): step3=${step3}`);
      expect(step3).assertEqual(99);
      const step4: string = subject.open('123123');
      logInfo(`step4 open("123123"): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: number = subject.terminateWithResult(false);
      logInfo(`step5 terminateWithResult(false): step5=${step5}`);
      expect(step5).assertEqual(99);
      logInfo(`requestModal>reportDrawn>terminateWithRes...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`requestModal>reportDrawn>terminateWithRes...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`requestModal>reportDrawn>terminateWithRes...: subject.lastMessa...${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 450, message is error');
      logInfo(`requestModal>reportDrawn>terminateWithRes...: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`requestModal>reportDrawn>terminateWithRes...: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(99);
      logInfo(`requestModal>reportDrawn>terminateWithRes...: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0031 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0032
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0032
     * @tc.desc      UiExtensionPageState call flow terminateWithResult > open > reportDrawn keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0032 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: number = subject.terminateWithResult(true);
      logInfo(`step1 terminateWithResult(true): step1=${step1}`);
      expect(step1).assertEqual(100);
      const step2: string = subject.open('   ');
      logInfo(`step2 open("   "): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.reportDrawn(-41);
      logInfo(`step3 reportDrawn(-41): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(77);
      logInfo(`step3 reportDrawn(-41): step3.substring(0, 32)=${step3.substring(0, 32)}`);
      expect(step3.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step3 reportDrawn(-41): step3.substring(45)=${step3.substring(45)}`);
      expect(step3.substring(45)).assertEqual('d, code is -41, message is error');
      logInfo(`terminateWithResult>open>reportDrawn final: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`terminateWithResult>open>reportDrawn final: subject.lastMess...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`terminateWithResult>open>reportDrawn final: subject.lastMessage...${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is -41, message is error');
      logInfo(`terminateWithResult>open>reportDrawn final: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`terminateWithResult>open>reportDrawn final: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(100);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0032 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0033
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0033
     * @tc.desc      UiExtensionPageState call flow requestModal > setPrivacyMode keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0033 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.requestModal(false, 425);
      logInfo(`step1 requestModal(false, 425): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(81);
      logInfo(`step1 requestModal(false, 425): step1.substring(0, 32)=${step1.substring(0, 32)}`);
      expect(step1.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step1 requestModal(false, 425): step1.substring(49)=${step1.substring(49)}`);
      expect(step1.substring(49)).assertEqual('age is ContextUIExtensionAbility');
      const step2: string = subject.setPrivacyMode(false);
      logInfo(`step2 setPrivacyMode(false): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(84);
      logInfo(`step2 setPrivacyMode(false): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`step2 setPrivacyMode(false): step2.substring(52)=${step2.substring(52)}`);
      expect(step2.substring(52)).assertEqual('se) called. isPrivacyMode: false');
      logInfo(`requestModal>setPrivacyMode final: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(84);
      logInfo(`requestModal>setPrivacyMode final: subject.lastMessage.subst...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`requestModal>setPrivacyMode final: subject.lastMessage.substrin...${subject.lastMessage.substring(52)}`);
      expect(subject.lastMessage.substring(52)).assertEqual('se) called. isPrivacyMode: false');
      logInfo(`requestModal>setPrivacyMode final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0033 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0034
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0034
     * @tc.desc      UiExtensionPageState call flow open > terminateWithResult > setPrivacyMode > reportDrawn > termi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0034 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.open('Hello WorldHello World');
      logInfo(`step1 open("Hello WorldHello World"): step1=${step1}`);
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
      const step4: string = subject.reportDrawn(898);
      logInfo(`step4 reportDrawn(898): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(77);
      logInfo(`step4 reportDrawn(898): step4.substring(0, 32)=${step4.substring(0, 32)}`);
      expect(step4.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`step4 reportDrawn(898): step4.substring(45)=${step4.substring(45)}`);
      expect(step4.substring(45)).assertEqual('d, code is 898, message is error');
      const step5: number = subject.terminateWithResult(true);
      logInfo(`step5 terminateWithResult(true): step5=${step5}`);
      expect(step5).assertEqual(100);
      logInfo(`open>terminateWithResult>setPrivacyMode>r...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`open>terminateWithResult>setPrivacyMode>r...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`open>terminateWithResult>setPrivacyMode>r...: subject.lastMessa...${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 898, message is error');
      logInfo(`open>terminateWithResult>setPrivacyMode>r...: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`open>terminateWithResult>setPrivacyMode>r...: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(100);
      logInfo(`open>terminateWithResult>setPrivacyMode>r...: subject.privacyMode=${subject.privacyMode}`);
      expect(subject.privacyMode).assertTrue();
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0034 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0035
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0035
     * @tc.desc      UiExtensionPageState call flow terminateWithResult > requestModal keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0035 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: number = subject.terminateWithResult(false);
      logInfo(`step1 terminateWithResult(false): step1=${step1}`);
      expect(step1).assertEqual(99);
      const step2: string = subject.requestModal(true, 375);
      logInfo(`step2 requestModal(true, 375): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(81);
      logInfo(`step2 requestModal(true, 375): step2.substring(0, 32)=${step2.substring(0, 32)}`);
      expect(step2.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`step2 requestModal(true, 375): step2.substring(49)=${step2.substring(49)}`);
      expect(step2.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`terminateWithResult>requestModal final: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(81);
      logInfo(`terminateWithResult>requestModal final: subject.lastMessage....${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`terminateWithResult>requestModal final: subject.lastMessage.sub...${subject.lastMessage.substring(49)}`);
      expect(subject.lastMessage.substring(49)).assertEqual('age is SessionUIExtensionAbility');
      logInfo(`terminateWithResult>requestModal final: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`terminateWithResult>requestModal final: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(99);
      logInfo(`terminateWithResult>requestModal final: subject.requests=${subject.requests}`);
      expect(subject.requests).assertEqual(1);
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0035 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_FLOW_0036
     * @tc.name      UIExtensionSamples_UiExtensionPageStateFlow_0036
     * @tc.desc      UiExtensionPageState call flow open > setPrivacyMode > terminateWithResult > open keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateFlow_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0036 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const step1: string = subject.open('n2imvliv7B');
      logInfo(`step1 open("n2imvliv7B"): step1=${step1}`);
      expect(step1).assertEqual('');
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
      const step4: string = subject.open('MdhTih4aT');
      logInfo(`step4 open("MdhTih4aT"): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`open>setPrivacyMode>terminateWithResult>o...: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(84);
      logInfo(`open>setPrivacyMode>terminateWithResult>o...: subject.lastMe...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContentSession.setWin');
      logInfo(`open>setPrivacyMode>terminateWithResult>o...: subject.lastMessa...${subject.lastMessage.substring(52)}`);
      expect(subject.lastMessage.substring(52)).assertEqual('ack) called. isPrivacyMode: true');
      logInfo(`open>setPrivacyMode>terminateWithResult>o...: subject.terminated=${subject.terminated}`);
      expect(subject.terminated).assertTrue();
      logInfo(`open>setPrivacyMode>terminateWithResult>o...: subject.resultCode=${subject.resultCode}`);
      expect(subject.resultCode).assertEqual(100);
      logInfo(`open>setPrivacyMode>terminateWithResult>o...: subject.privacyMode=${subject.privacyMode}`);
      expect(subject.privacyMode).assertTrue();
      logInfo(`${BUNDLE}UiExtensionPageStateFlow_0036 end`);
    });
  });
}
