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

/** Logic checks for UiExtensionPageState.reportDrawn (57 cases). */
export default function uiExtensionPageStateReportDrawn2Test(): void {
  describe('UiExtensionPageStateReportDrawn2Test', () => {
    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0058
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0058
     * @tc.desc      UiExtensionPageState.reportDrawn(code=168.64) yields len80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0058 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(168.64);
      logInfo(`reportDrawn(code=168.64): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(80);
      logInfo(`reportDrawn(code=168.64): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=168.64): actual.substring(48)=${actual.substring(48)}`);
      expect(actual.substring(48)).assertEqual('code is 168.64, message is error');
      logInfo(`reportDrawn(code=168.64) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(80);
      logInfo(`reportDrawn(code=168.64) state: subject.lastMessage.substrin...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=168.64) state: subject.lastMessage.substring(48)=${subject.lastMessage.substring(48)}`);
      expect(subject.lastMessage.substring(48)).assertEqual('code is 168.64, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0058 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0059
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0059
     * @tc.desc      UiExtensionPageState.reportDrawn(code=28.63) yields len79
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0059 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(28.63);
      logInfo(`reportDrawn(code=28.63): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(79);
      logInfo(`reportDrawn(code=28.63): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=28.63): actual.substring(47)=${actual.substring(47)}`);
      expect(actual.substring(47)).assertEqual(' code is 28.63, message is error');
      logInfo(`reportDrawn(code=28.63) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(79);
      logInfo(`reportDrawn(code=28.63) state: subject.lastMessage.substring...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=28.63) state: subject.lastMessage.substring(47)=${subject.lastMessage.substring(47)}`);
      expect(subject.lastMessage.substring(47)).assertEqual(' code is 28.63, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0059 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0060
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0060
     * @tc.desc      UiExtensionPageState.reportDrawn(code=902) yields len77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0060 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(902);
      logInfo(`reportDrawn(code=902): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(77);
      logInfo(`reportDrawn(code=902): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=902): actual.substring(45)=${actual.substring(45)}`);
      expect(actual.substring(45)).assertEqual('d, code is 902, message is error');
      logInfo(`reportDrawn(code=902) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`reportDrawn(code=902) state: subject.lastMessage.substring(0...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=902) state: subject.lastMessage.substring(45)=${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 902, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0060 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0061
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0061
     * @tc.desc      UiExtensionPageState.reportDrawn(code=432.99) yields len80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0061 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(432.99);
      logInfo(`reportDrawn(code=432.99): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(80);
      logInfo(`reportDrawn(code=432.99): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=432.99): actual.substring(48)=${actual.substring(48)}`);
      expect(actual.substring(48)).assertEqual('code is 432.99, message is error');
      logInfo(`reportDrawn(code=432.99) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(80);
      logInfo(`reportDrawn(code=432.99) state: subject.lastMessage.substrin...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=432.99) state: subject.lastMessage.substring(48)=${subject.lastMessage.substring(48)}`);
      expect(subject.lastMessage.substring(48)).assertEqual('code is 432.99, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0061 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0062
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0062
     * @tc.desc      UiExtensionPageState.reportDrawn(code=279.01) yields len80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0062 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(279.01);
      logInfo(`reportDrawn(code=279.01): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(80);
      logInfo(`reportDrawn(code=279.01): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=279.01): actual.substring(48)=${actual.substring(48)}`);
      expect(actual.substring(48)).assertEqual('code is 279.01, message is error');
      logInfo(`reportDrawn(code=279.01) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(80);
      logInfo(`reportDrawn(code=279.01) state: subject.lastMessage.substrin...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=279.01) state: subject.lastMessage.substring(48)=${subject.lastMessage.substring(48)}`);
      expect(subject.lastMessage.substring(48)).assertEqual('code is 279.01, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0062 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0063
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0063
     * @tc.desc      UiExtensionPageState.reportDrawn(code=541) yields len77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0063 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(541);
      logInfo(`reportDrawn(code=541): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(77);
      logInfo(`reportDrawn(code=541): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=541): actual.substring(45)=${actual.substring(45)}`);
      expect(actual.substring(45)).assertEqual('d, code is 541, message is error');
      logInfo(`reportDrawn(code=541) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`reportDrawn(code=541) state: subject.lastMessage.substring(0...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=541) state: subject.lastMessage.substring(45)=${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 541, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0063 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0064
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0064
     * @tc.desc      UiExtensionPageState.reportDrawn(code=353) yields len77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0064 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(353);
      logInfo(`reportDrawn(code=353): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(77);
      logInfo(`reportDrawn(code=353): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=353): actual.substring(45)=${actual.substring(45)}`);
      expect(actual.substring(45)).assertEqual('d, code is 353, message is error');
      logInfo(`reportDrawn(code=353) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`reportDrawn(code=353) state: subject.lastMessage.substring(0...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=353) state: subject.lastMessage.substring(45)=${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 353, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0064 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0065
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0065
     * @tc.desc      UiExtensionPageState.reportDrawn(code=889) yields len77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0065 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(889);
      logInfo(`reportDrawn(code=889): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(77);
      logInfo(`reportDrawn(code=889): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=889): actual.substring(45)=${actual.substring(45)}`);
      expect(actual.substring(45)).assertEqual('d, code is 889, message is error');
      logInfo(`reportDrawn(code=889) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`reportDrawn(code=889) state: subject.lastMessage.substring(0...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=889) state: subject.lastMessage.substring(45)=${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 889, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0065 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0066
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0066
     * @tc.desc      UiExtensionPageState.reportDrawn(code=-459) yields len78
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0066 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(-459);
      logInfo(`reportDrawn(code=-459): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(78);
      logInfo(`reportDrawn(code=-459): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=-459): actual.substring(46)=${actual.substring(46)}`);
      expect(actual.substring(46)).assertEqual(', code is -459, message is error');
      logInfo(`reportDrawn(code=-459) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(78);
      logInfo(`reportDrawn(code=-459) state: subject.lastMessage.substring(...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=-459) state: subject.lastMessage.substring(46)=${subject.lastMessage.substring(46)}`);
      expect(subject.lastMessage.substring(46)).assertEqual(', code is -459, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0066 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0067
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0067
     * @tc.desc      UiExtensionPageState.reportDrawn(code=-207) yields len78
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0067 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(-207);
      logInfo(`reportDrawn(code=-207): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(78);
      logInfo(`reportDrawn(code=-207): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=-207): actual.substring(46)=${actual.substring(46)}`);
      expect(actual.substring(46)).assertEqual(', code is -207, message is error');
      logInfo(`reportDrawn(code=-207) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(78);
      logInfo(`reportDrawn(code=-207) state: subject.lastMessage.substring(...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=-207) state: subject.lastMessage.substring(46)=${subject.lastMessage.substring(46)}`);
      expect(subject.lastMessage.substring(46)).assertEqual(', code is -207, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0067 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0068
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0068
     * @tc.desc      UiExtensionPageState.reportDrawn(code=688) yields len77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0068 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(688);
      logInfo(`reportDrawn(code=688): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(77);
      logInfo(`reportDrawn(code=688): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=688): actual.substring(45)=${actual.substring(45)}`);
      expect(actual.substring(45)).assertEqual('d, code is 688, message is error');
      logInfo(`reportDrawn(code=688) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`reportDrawn(code=688) state: subject.lastMessage.substring(0...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=688) state: subject.lastMessage.substring(45)=${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 688, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0068 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0069
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0069
     * @tc.desc      UiExtensionPageState.reportDrawn(code=50.71) yields len79
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0069 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(50.71);
      logInfo(`reportDrawn(code=50.71): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(79);
      logInfo(`reportDrawn(code=50.71): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=50.71): actual.substring(47)=${actual.substring(47)}`);
      expect(actual.substring(47)).assertEqual(' code is 50.71, message is error');
      logInfo(`reportDrawn(code=50.71) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(79);
      logInfo(`reportDrawn(code=50.71) state: subject.lastMessage.substring...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=50.71) state: subject.lastMessage.substring(47)=${subject.lastMessage.substring(47)}`);
      expect(subject.lastMessage.substring(47)).assertEqual(' code is 50.71, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0069 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0070
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0070
     * @tc.desc      UiExtensionPageState.reportDrawn(code=82.77) yields len79
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0070 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(82.77);
      logInfo(`reportDrawn(code=82.77): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(79);
      logInfo(`reportDrawn(code=82.77): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=82.77): actual.substring(47)=${actual.substring(47)}`);
      expect(actual.substring(47)).assertEqual(' code is 82.77, message is error');
      logInfo(`reportDrawn(code=82.77) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(79);
      logInfo(`reportDrawn(code=82.77) state: subject.lastMessage.substring...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=82.77) state: subject.lastMessage.substring(47)=${subject.lastMessage.substring(47)}`);
      expect(subject.lastMessage.substring(47)).assertEqual(' code is 82.77, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0070 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0071
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0071
     * @tc.desc      UiExtensionPageState.reportDrawn(code=354.06) yields len80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0071 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(354.06);
      logInfo(`reportDrawn(code=354.06): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(80);
      logInfo(`reportDrawn(code=354.06): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=354.06): actual.substring(48)=${actual.substring(48)}`);
      expect(actual.substring(48)).assertEqual('code is 354.06, message is error');
      logInfo(`reportDrawn(code=354.06) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(80);
      logInfo(`reportDrawn(code=354.06) state: subject.lastMessage.substrin...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=354.06) state: subject.lastMessage.substring(48)=${subject.lastMessage.substring(48)}`);
      expect(subject.lastMessage.substring(48)).assertEqual('code is 354.06, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0071 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0072
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0072
     * @tc.desc      UiExtensionPageState.reportDrawn(code=-465) yields len78
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0072 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(-465);
      logInfo(`reportDrawn(code=-465): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(78);
      logInfo(`reportDrawn(code=-465): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=-465): actual.substring(46)=${actual.substring(46)}`);
      expect(actual.substring(46)).assertEqual(', code is -465, message is error');
      logInfo(`reportDrawn(code=-465) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(78);
      logInfo(`reportDrawn(code=-465) state: subject.lastMessage.substring(...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=-465) state: subject.lastMessage.substring(46)=${subject.lastMessage.substring(46)}`);
      expect(subject.lastMessage.substring(46)).assertEqual(', code is -465, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0072 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0073
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0073
     * @tc.desc      UiExtensionPageState.reportDrawn(code=29) yields len76
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0073 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(29);
      logInfo(`reportDrawn(code=29): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(76);
      logInfo(`reportDrawn(code=29): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=29): actual.substring(44)=${actual.substring(44)}`);
      expect(actual.substring(44)).assertEqual('ed, code is 29, message is error');
      logInfo(`reportDrawn(code=29) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(76);
      logInfo(`reportDrawn(code=29) state: subject.lastMessage.substring(0,...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=29) state: subject.lastMessage.substring(44)=${subject.lastMessage.substring(44)}`);
      expect(subject.lastMessage.substring(44)).assertEqual('ed, code is 29, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0073 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0074
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0074
     * @tc.desc      UiExtensionPageState.reportDrawn(code=-342) yields len78
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0074 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(-342);
      logInfo(`reportDrawn(code=-342): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(78);
      logInfo(`reportDrawn(code=-342): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=-342): actual.substring(46)=${actual.substring(46)}`);
      expect(actual.substring(46)).assertEqual(', code is -342, message is error');
      logInfo(`reportDrawn(code=-342) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(78);
      logInfo(`reportDrawn(code=-342) state: subject.lastMessage.substring(...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=-342) state: subject.lastMessage.substring(46)=${subject.lastMessage.substring(46)}`);
      expect(subject.lastMessage.substring(46)).assertEqual(', code is -342, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0074 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0075
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0075
     * @tc.desc      UiExtensionPageState.reportDrawn(code=66.39) yields len79
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0075 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(66.39);
      logInfo(`reportDrawn(code=66.39): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(79);
      logInfo(`reportDrawn(code=66.39): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=66.39): actual.substring(47)=${actual.substring(47)}`);
      expect(actual.substring(47)).assertEqual(' code is 66.39, message is error');
      logInfo(`reportDrawn(code=66.39) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(79);
      logInfo(`reportDrawn(code=66.39) state: subject.lastMessage.substring...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=66.39) state: subject.lastMessage.substring(47)=${subject.lastMessage.substring(47)}`);
      expect(subject.lastMessage.substring(47)).assertEqual(' code is 66.39, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0075 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0076
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0076
     * @tc.desc      UiExtensionPageState.reportDrawn(code=-60) yields len77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0076 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(-60);
      logInfo(`reportDrawn(code=-60): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(77);
      logInfo(`reportDrawn(code=-60): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=-60): actual.substring(45)=${actual.substring(45)}`);
      expect(actual.substring(45)).assertEqual('d, code is -60, message is error');
      logInfo(`reportDrawn(code=-60) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`reportDrawn(code=-60) state: subject.lastMessage.substring(0...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=-60) state: subject.lastMessage.substring(45)=${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is -60, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0076 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0077
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0077
     * @tc.desc      UiExtensionPageState.reportDrawn(code=-318) yields len78
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0077 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(-318);
      logInfo(`reportDrawn(code=-318): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(78);
      logInfo(`reportDrawn(code=-318): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=-318): actual.substring(46)=${actual.substring(46)}`);
      expect(actual.substring(46)).assertEqual(', code is -318, message is error');
      logInfo(`reportDrawn(code=-318) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(78);
      logInfo(`reportDrawn(code=-318) state: subject.lastMessage.substring(...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=-318) state: subject.lastMessage.substring(46)=${subject.lastMessage.substring(46)}`);
      expect(subject.lastMessage.substring(46)).assertEqual(', code is -318, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0077 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0078
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0078
     * @tc.desc      UiExtensionPageState.reportDrawn(code=127.5) yields len79
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0078 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(127.5);
      logInfo(`reportDrawn(code=127.5): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(79);
      logInfo(`reportDrawn(code=127.5): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=127.5): actual.substring(47)=${actual.substring(47)}`);
      expect(actual.substring(47)).assertEqual(' code is 127.5, message is error');
      logInfo(`reportDrawn(code=127.5) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(79);
      logInfo(`reportDrawn(code=127.5) state: subject.lastMessage.substring...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=127.5) state: subject.lastMessage.substring(47)=${subject.lastMessage.substring(47)}`);
      expect(subject.lastMessage.substring(47)).assertEqual(' code is 127.5, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0078 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0079
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0079
     * @tc.desc      UiExtensionPageState.reportDrawn(code=696) yields len77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0079 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(696);
      logInfo(`reportDrawn(code=696): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(77);
      logInfo(`reportDrawn(code=696): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=696): actual.substring(45)=${actual.substring(45)}`);
      expect(actual.substring(45)).assertEqual('d, code is 696, message is error');
      logInfo(`reportDrawn(code=696) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`reportDrawn(code=696) state: subject.lastMessage.substring(0...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=696) state: subject.lastMessage.substring(45)=${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 696, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0079 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0080
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0080
     * @tc.desc      UiExtensionPageState.reportDrawn(code=-378) yields len78
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0080 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(-378);
      logInfo(`reportDrawn(code=-378): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(78);
      logInfo(`reportDrawn(code=-378): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=-378): actual.substring(46)=${actual.substring(46)}`);
      expect(actual.substring(46)).assertEqual(', code is -378, message is error');
      logInfo(`reportDrawn(code=-378) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(78);
      logInfo(`reportDrawn(code=-378) state: subject.lastMessage.substring(...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=-378) state: subject.lastMessage.substring(46)=${subject.lastMessage.substring(46)}`);
      expect(subject.lastMessage.substring(46)).assertEqual(', code is -378, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0080 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0081
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0081
     * @tc.desc      UiExtensionPageState.reportDrawn(code=266) yields len77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0081 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(266);
      logInfo(`reportDrawn(code=266): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(77);
      logInfo(`reportDrawn(code=266): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=266): actual.substring(45)=${actual.substring(45)}`);
      expect(actual.substring(45)).assertEqual('d, code is 266, message is error');
      logInfo(`reportDrawn(code=266) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`reportDrawn(code=266) state: subject.lastMessage.substring(0...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=266) state: subject.lastMessage.substring(45)=${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 266, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0081 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0082
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0082
     * @tc.desc      UiExtensionPageState.reportDrawn(code=483.66) yields len80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0082 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(483.66);
      logInfo(`reportDrawn(code=483.66): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(80);
      logInfo(`reportDrawn(code=483.66): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=483.66): actual.substring(48)=${actual.substring(48)}`);
      expect(actual.substring(48)).assertEqual('code is 483.66, message is error');
      logInfo(`reportDrawn(code=483.66) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(80);
      logInfo(`reportDrawn(code=483.66) state: subject.lastMessage.substrin...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=483.66) state: subject.lastMessage.substring(48)=${subject.lastMessage.substring(48)}`);
      expect(subject.lastMessage.substring(48)).assertEqual('code is 483.66, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0082 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0083
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0083
     * @tc.desc      UiExtensionPageState.reportDrawn(code=898) yields len77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0083 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(898);
      logInfo(`reportDrawn(code=898): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(77);
      logInfo(`reportDrawn(code=898): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=898): actual.substring(45)=${actual.substring(45)}`);
      expect(actual.substring(45)).assertEqual('d, code is 898, message is error');
      logInfo(`reportDrawn(code=898) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`reportDrawn(code=898) state: subject.lastMessage.substring(0...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=898) state: subject.lastMessage.substring(45)=${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 898, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0083 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0084
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0084
     * @tc.desc      UiExtensionPageState.reportDrawn(code=-41) yields len77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0084 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(-41);
      logInfo(`reportDrawn(code=-41): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(77);
      logInfo(`reportDrawn(code=-41): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=-41): actual.substring(45)=${actual.substring(45)}`);
      expect(actual.substring(45)).assertEqual('d, code is -41, message is error');
      logInfo(`reportDrawn(code=-41) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`reportDrawn(code=-41) state: subject.lastMessage.substring(0...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=-41) state: subject.lastMessage.substring(45)=${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is -41, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0084 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0085
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0085
     * @tc.desc      UiExtensionPageState.reportDrawn(code=708) yields len77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0085 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(708);
      logInfo(`reportDrawn(code=708): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(77);
      logInfo(`reportDrawn(code=708): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=708): actual.substring(45)=${actual.substring(45)}`);
      expect(actual.substring(45)).assertEqual('d, code is 708, message is error');
      logInfo(`reportDrawn(code=708) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`reportDrawn(code=708) state: subject.lastMessage.substring(0...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=708) state: subject.lastMessage.substring(45)=${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 708, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0085 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0086
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0086
     * @tc.desc      UiExtensionPageState.reportDrawn(code=-497) yields len78
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0086 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(-497);
      logInfo(`reportDrawn(code=-497): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(78);
      logInfo(`reportDrawn(code=-497): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=-497): actual.substring(46)=${actual.substring(46)}`);
      expect(actual.substring(46)).assertEqual(', code is -497, message is error');
      logInfo(`reportDrawn(code=-497) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(78);
      logInfo(`reportDrawn(code=-497) state: subject.lastMessage.substring(...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=-497) state: subject.lastMessage.substring(46)=${subject.lastMessage.substring(46)}`);
      expect(subject.lastMessage.substring(46)).assertEqual(', code is -497, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0086 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0087
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0087
     * @tc.desc      UiExtensionPageState.reportDrawn(code=-228) yields len78
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0087 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(-228);
      logInfo(`reportDrawn(code=-228): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(78);
      logInfo(`reportDrawn(code=-228): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=-228): actual.substring(46)=${actual.substring(46)}`);
      expect(actual.substring(46)).assertEqual(', code is -228, message is error');
      logInfo(`reportDrawn(code=-228) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(78);
      logInfo(`reportDrawn(code=-228) state: subject.lastMessage.substring(...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=-228) state: subject.lastMessage.substring(46)=${subject.lastMessage.substring(46)}`);
      expect(subject.lastMessage.substring(46)).assertEqual(', code is -228, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0087 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0088
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0088
     * @tc.desc      UiExtensionPageState.reportDrawn(code=356) yields len77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0088 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(356);
      logInfo(`reportDrawn(code=356): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(77);
      logInfo(`reportDrawn(code=356): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=356): actual.substring(45)=${actual.substring(45)}`);
      expect(actual.substring(45)).assertEqual('d, code is 356, message is error');
      logInfo(`reportDrawn(code=356) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`reportDrawn(code=356) state: subject.lastMessage.substring(0...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=356) state: subject.lastMessage.substring(45)=${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 356, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0088 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0089
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0089
     * @tc.desc      UiExtensionPageState.reportDrawn(code=70.48) yields len79
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0089 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(70.48);
      logInfo(`reportDrawn(code=70.48): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(79);
      logInfo(`reportDrawn(code=70.48): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=70.48): actual.substring(47)=${actual.substring(47)}`);
      expect(actual.substring(47)).assertEqual(' code is 70.48, message is error');
      logInfo(`reportDrawn(code=70.48) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(79);
      logInfo(`reportDrawn(code=70.48) state: subject.lastMessage.substring...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=70.48) state: subject.lastMessage.substring(47)=${subject.lastMessage.substring(47)}`);
      expect(subject.lastMessage.substring(47)).assertEqual(' code is 70.48, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0089 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0090
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0090
     * @tc.desc      UiExtensionPageState.reportDrawn(code=369) yields len77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0090 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(369);
      logInfo(`reportDrawn(code=369): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(77);
      logInfo(`reportDrawn(code=369): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=369): actual.substring(45)=${actual.substring(45)}`);
      expect(actual.substring(45)).assertEqual('d, code is 369, message is error');
      logInfo(`reportDrawn(code=369) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`reportDrawn(code=369) state: subject.lastMessage.substring(0...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=369) state: subject.lastMessage.substring(45)=${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 369, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0090 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0091
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0091
     * @tc.desc      UiExtensionPageState.reportDrawn(code=24) yields len76
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0091 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(24);
      logInfo(`reportDrawn(code=24): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(76);
      logInfo(`reportDrawn(code=24): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=24): actual.substring(44)=${actual.substring(44)}`);
      expect(actual.substring(44)).assertEqual('ed, code is 24, message is error');
      logInfo(`reportDrawn(code=24) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(76);
      logInfo(`reportDrawn(code=24) state: subject.lastMessage.substring(0,...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=24) state: subject.lastMessage.substring(44)=${subject.lastMessage.substring(44)}`);
      expect(subject.lastMessage.substring(44)).assertEqual('ed, code is 24, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0091 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0092
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0092
     * @tc.desc      UiExtensionPageState.reportDrawn(code=966) yields len77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0092 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(966);
      logInfo(`reportDrawn(code=966): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(77);
      logInfo(`reportDrawn(code=966): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=966): actual.substring(45)=${actual.substring(45)}`);
      expect(actual.substring(45)).assertEqual('d, code is 966, message is error');
      logInfo(`reportDrawn(code=966) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`reportDrawn(code=966) state: subject.lastMessage.substring(0...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=966) state: subject.lastMessage.substring(45)=${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 966, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0092 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0093
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0093
     * @tc.desc      UiExtensionPageState.reportDrawn(code=333) yields len77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0093 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(333);
      logInfo(`reportDrawn(code=333): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(77);
      logInfo(`reportDrawn(code=333): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=333): actual.substring(45)=${actual.substring(45)}`);
      expect(actual.substring(45)).assertEqual('d, code is 333, message is error');
      logInfo(`reportDrawn(code=333) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`reportDrawn(code=333) state: subject.lastMessage.substring(0...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=333) state: subject.lastMessage.substring(45)=${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 333, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0093 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0094
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0094
     * @tc.desc      UiExtensionPageState.reportDrawn(code=300.61) yields len80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0094 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(300.61);
      logInfo(`reportDrawn(code=300.61): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(80);
      logInfo(`reportDrawn(code=300.61): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=300.61): actual.substring(48)=${actual.substring(48)}`);
      expect(actual.substring(48)).assertEqual('code is 300.61, message is error');
      logInfo(`reportDrawn(code=300.61) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(80);
      logInfo(`reportDrawn(code=300.61) state: subject.lastMessage.substrin...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=300.61) state: subject.lastMessage.substring(48)=${subject.lastMessage.substring(48)}`);
      expect(subject.lastMessage.substring(48)).assertEqual('code is 300.61, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0094 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0095
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0095
     * @tc.desc      UiExtensionPageState.reportDrawn(code=860) yields len77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0095 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(860);
      logInfo(`reportDrawn(code=860): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(77);
      logInfo(`reportDrawn(code=860): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=860): actual.substring(45)=${actual.substring(45)}`);
      expect(actual.substring(45)).assertEqual('d, code is 860, message is error');
      logInfo(`reportDrawn(code=860) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`reportDrawn(code=860) state: subject.lastMessage.substring(0...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=860) state: subject.lastMessage.substring(45)=${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 860, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0095 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0096
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0096
     * @tc.desc      UiExtensionPageState.reportDrawn(code=786) yields len77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0096 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(786);
      logInfo(`reportDrawn(code=786): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(77);
      logInfo(`reportDrawn(code=786): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=786): actual.substring(45)=${actual.substring(45)}`);
      expect(actual.substring(45)).assertEqual('d, code is 786, message is error');
      logInfo(`reportDrawn(code=786) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`reportDrawn(code=786) state: subject.lastMessage.substring(0...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=786) state: subject.lastMessage.substring(45)=${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 786, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0096 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0097
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0097
     * @tc.desc      UiExtensionPageState.reportDrawn(code=229.57) yields len80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0097 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(229.57);
      logInfo(`reportDrawn(code=229.57): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(80);
      logInfo(`reportDrawn(code=229.57): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=229.57): actual.substring(48)=${actual.substring(48)}`);
      expect(actual.substring(48)).assertEqual('code is 229.57, message is error');
      logInfo(`reportDrawn(code=229.57) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(80);
      logInfo(`reportDrawn(code=229.57) state: subject.lastMessage.substrin...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=229.57) state: subject.lastMessage.substring(48)=${subject.lastMessage.substring(48)}`);
      expect(subject.lastMessage.substring(48)).assertEqual('code is 229.57, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0097 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0098
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0098
     * @tc.desc      UiExtensionPageState.reportDrawn(code=398) yields len77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0098 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(398);
      logInfo(`reportDrawn(code=398): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(77);
      logInfo(`reportDrawn(code=398): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=398): actual.substring(45)=${actual.substring(45)}`);
      expect(actual.substring(45)).assertEqual('d, code is 398, message is error');
      logInfo(`reportDrawn(code=398) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`reportDrawn(code=398) state: subject.lastMessage.substring(0...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=398) state: subject.lastMessage.substring(45)=${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 398, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0098 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0099
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0099
     * @tc.desc      UiExtensionPageState.reportDrawn(code=159.14) yields len80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0099 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(159.14);
      logInfo(`reportDrawn(code=159.14): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(80);
      logInfo(`reportDrawn(code=159.14): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=159.14): actual.substring(48)=${actual.substring(48)}`);
      expect(actual.substring(48)).assertEqual('code is 159.14, message is error');
      logInfo(`reportDrawn(code=159.14) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(80);
      logInfo(`reportDrawn(code=159.14) state: subject.lastMessage.substrin...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=159.14) state: subject.lastMessage.substring(48)=${subject.lastMessage.substring(48)}`);
      expect(subject.lastMessage.substring(48)).assertEqual('code is 159.14, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0099 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0100
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0100
     * @tc.desc      UiExtensionPageState.reportDrawn(code=-134) yields len78
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0100 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(-134);
      logInfo(`reportDrawn(code=-134): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(78);
      logInfo(`reportDrawn(code=-134): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=-134): actual.substring(46)=${actual.substring(46)}`);
      expect(actual.substring(46)).assertEqual(', code is -134, message is error');
      logInfo(`reportDrawn(code=-134) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(78);
      logInfo(`reportDrawn(code=-134) state: subject.lastMessage.substring(...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=-134) state: subject.lastMessage.substring(46)=${subject.lastMessage.substring(46)}`);
      expect(subject.lastMessage.substring(46)).assertEqual(', code is -134, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0100 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0101
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0101
     * @tc.desc      UiExtensionPageState.reportDrawn(code=770) yields len77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0101 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(770);
      logInfo(`reportDrawn(code=770): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(77);
      logInfo(`reportDrawn(code=770): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=770): actual.substring(45)=${actual.substring(45)}`);
      expect(actual.substring(45)).assertEqual('d, code is 770, message is error');
      logInfo(`reportDrawn(code=770) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`reportDrawn(code=770) state: subject.lastMessage.substring(0...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=770) state: subject.lastMessage.substring(45)=${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 770, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0101 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0102
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0102
     * @tc.desc      UiExtensionPageState.reportDrawn(code=-224) yields len78
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0102 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(-224);
      logInfo(`reportDrawn(code=-224): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(78);
      logInfo(`reportDrawn(code=-224): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=-224): actual.substring(46)=${actual.substring(46)}`);
      expect(actual.substring(46)).assertEqual(', code is -224, message is error');
      logInfo(`reportDrawn(code=-224) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(78);
      logInfo(`reportDrawn(code=-224) state: subject.lastMessage.substring(...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=-224) state: subject.lastMessage.substring(46)=${subject.lastMessage.substring(46)}`);
      expect(subject.lastMessage.substring(46)).assertEqual(', code is -224, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0102 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0103
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0103
     * @tc.desc      UiExtensionPageState.reportDrawn(code=-15) yields len77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0103 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(-15);
      logInfo(`reportDrawn(code=-15): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(77);
      logInfo(`reportDrawn(code=-15): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=-15): actual.substring(45)=${actual.substring(45)}`);
      expect(actual.substring(45)).assertEqual('d, code is -15, message is error');
      logInfo(`reportDrawn(code=-15) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`reportDrawn(code=-15) state: subject.lastMessage.substring(0...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=-15) state: subject.lastMessage.substring(45)=${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is -15, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0103 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0104
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0104
     * @tc.desc      UiExtensionPageState.reportDrawn(code=-28) yields len77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0104 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(-28);
      logInfo(`reportDrawn(code=-28): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(77);
      logInfo(`reportDrawn(code=-28): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=-28): actual.substring(45)=${actual.substring(45)}`);
      expect(actual.substring(45)).assertEqual('d, code is -28, message is error');
      logInfo(`reportDrawn(code=-28) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`reportDrawn(code=-28) state: subject.lastMessage.substring(0...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=-28) state: subject.lastMessage.substring(45)=${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is -28, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0104 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0105
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0105
     * @tc.desc      UiExtensionPageState.reportDrawn(code=-433) yields len78
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0105 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(-433);
      logInfo(`reportDrawn(code=-433): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(78);
      logInfo(`reportDrawn(code=-433): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=-433): actual.substring(46)=${actual.substring(46)}`);
      expect(actual.substring(46)).assertEqual(', code is -433, message is error');
      logInfo(`reportDrawn(code=-433) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(78);
      logInfo(`reportDrawn(code=-433) state: subject.lastMessage.substring(...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=-433) state: subject.lastMessage.substring(46)=${subject.lastMessage.substring(46)}`);
      expect(subject.lastMessage.substring(46)).assertEqual(', code is -433, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0105 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0106
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0106
     * @tc.desc      UiExtensionPageState.reportDrawn(code=-320) yields len78
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0106 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(-320);
      logInfo(`reportDrawn(code=-320): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(78);
      logInfo(`reportDrawn(code=-320): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=-320): actual.substring(46)=${actual.substring(46)}`);
      expect(actual.substring(46)).assertEqual(', code is -320, message is error');
      logInfo(`reportDrawn(code=-320) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(78);
      logInfo(`reportDrawn(code=-320) state: subject.lastMessage.substring(...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=-320) state: subject.lastMessage.substring(46)=${subject.lastMessage.substring(46)}`);
      expect(subject.lastMessage.substring(46)).assertEqual(', code is -320, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0106 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0107
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0107
     * @tc.desc      UiExtensionPageState.reportDrawn(code=449.82) yields len80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0107 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(449.82);
      logInfo(`reportDrawn(code=449.82): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(80);
      logInfo(`reportDrawn(code=449.82): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=449.82): actual.substring(48)=${actual.substring(48)}`);
      expect(actual.substring(48)).assertEqual('code is 449.82, message is error');
      logInfo(`reportDrawn(code=449.82) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(80);
      logInfo(`reportDrawn(code=449.82) state: subject.lastMessage.substrin...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=449.82) state: subject.lastMessage.substring(48)=${subject.lastMessage.substring(48)}`);
      expect(subject.lastMessage.substring(48)).assertEqual('code is 449.82, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0107 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0108
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0108
     * @tc.desc      UiExtensionPageState.reportDrawn(code=137.04) yields len80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0108 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(137.04);
      logInfo(`reportDrawn(code=137.04): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(80);
      logInfo(`reportDrawn(code=137.04): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=137.04): actual.substring(48)=${actual.substring(48)}`);
      expect(actual.substring(48)).assertEqual('code is 137.04, message is error');
      logInfo(`reportDrawn(code=137.04) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(80);
      logInfo(`reportDrawn(code=137.04) state: subject.lastMessage.substrin...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=137.04) state: subject.lastMessage.substring(48)=${subject.lastMessage.substring(48)}`);
      expect(subject.lastMessage.substring(48)).assertEqual('code is 137.04, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0108 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0109
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0109
     * @tc.desc      UiExtensionPageState.reportDrawn(code=888) yields len77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0109 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(888);
      logInfo(`reportDrawn(code=888): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(77);
      logInfo(`reportDrawn(code=888): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=888): actual.substring(45)=${actual.substring(45)}`);
      expect(actual.substring(45)).assertEqual('d, code is 888, message is error');
      logInfo(`reportDrawn(code=888) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`reportDrawn(code=888) state: subject.lastMessage.substring(0...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=888) state: subject.lastMessage.substring(45)=${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 888, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0109 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0110
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0110
     * @tc.desc      UiExtensionPageState.reportDrawn(code=-114) yields len78
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0110 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(-114);
      logInfo(`reportDrawn(code=-114): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(78);
      logInfo(`reportDrawn(code=-114): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=-114): actual.substring(46)=${actual.substring(46)}`);
      expect(actual.substring(46)).assertEqual(', code is -114, message is error');
      logInfo(`reportDrawn(code=-114) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(78);
      logInfo(`reportDrawn(code=-114) state: subject.lastMessage.substring(...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=-114) state: subject.lastMessage.substring(46)=${subject.lastMessage.substring(46)}`);
      expect(subject.lastMessage.substring(46)).assertEqual(', code is -114, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0110 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0111
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0111
     * @tc.desc      UiExtensionPageState.reportDrawn(code=859) yields len77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0111 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(859);
      logInfo(`reportDrawn(code=859): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(77);
      logInfo(`reportDrawn(code=859): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=859): actual.substring(45)=${actual.substring(45)}`);
      expect(actual.substring(45)).assertEqual('d, code is 859, message is error');
      logInfo(`reportDrawn(code=859) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`reportDrawn(code=859) state: subject.lastMessage.substring(0...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=859) state: subject.lastMessage.substring(45)=${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 859, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0111 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0112
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0112
     * @tc.desc      UiExtensionPageState.reportDrawn(code=124) yields len77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0112 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(124);
      logInfo(`reportDrawn(code=124): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(77);
      logInfo(`reportDrawn(code=124): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=124): actual.substring(45)=${actual.substring(45)}`);
      expect(actual.substring(45)).assertEqual('d, code is 124, message is error');
      logInfo(`reportDrawn(code=124) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`reportDrawn(code=124) state: subject.lastMessage.substring(0...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=124) state: subject.lastMessage.substring(45)=${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 124, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0112 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0113
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0113
     * @tc.desc      UiExtensionPageState.reportDrawn(code=-463) yields len78
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0113 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(-463);
      logInfo(`reportDrawn(code=-463): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(78);
      logInfo(`reportDrawn(code=-463): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=-463): actual.substring(46)=${actual.substring(46)}`);
      expect(actual.substring(46)).assertEqual(', code is -463, message is error');
      logInfo(`reportDrawn(code=-463) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(78);
      logInfo(`reportDrawn(code=-463) state: subject.lastMessage.substring(...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=-463) state: subject.lastMessage.substring(46)=${subject.lastMessage.substring(46)}`);
      expect(subject.lastMessage.substring(46)).assertEqual(', code is -463, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0113 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0114
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0114
     * @tc.desc      UiExtensionPageState.reportDrawn(code=185.1) yields len79
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0114 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(185.1);
      logInfo(`reportDrawn(code=185.1): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(79);
      logInfo(`reportDrawn(code=185.1): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=185.1): actual.substring(47)=${actual.substring(47)}`);
      expect(actual.substring(47)).assertEqual(' code is 185.1, message is error');
      logInfo(`reportDrawn(code=185.1) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(79);
      logInfo(`reportDrawn(code=185.1) state: subject.lastMessage.substring...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=185.1) state: subject.lastMessage.substring(47)=${subject.lastMessage.substring(47)}`);
      expect(subject.lastMessage.substring(47)).assertEqual(' code is 185.1, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0114 end`);
    });
  });
}
