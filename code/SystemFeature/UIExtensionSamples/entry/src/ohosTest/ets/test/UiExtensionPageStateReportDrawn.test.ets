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
export default function uiExtensionPageStateReportDrawnTest(): void {
  describe('UiExtensionPageStateReportDrawnTest', () => {
    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0001
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0001
     * @tc.desc      UiExtensionPageState.reportDrawn(code=0) yields "UIExtensionContent.reportDrawnCompleted succeed."
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0001 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(0);
      logInfo(`reportDrawn(code=0): actual=${actual}`);
      expect(actual).assertEqual('UIExtensionContent.reportDrawnCompleted succeed.');
      logInfo(`reportDrawn(code=0) state: subject.lastMessage=${subject.lastMessage}`);
      expect(subject.lastMessage).assertEqual('UIExtensionContent.reportDrawnCompleted succeed.');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0001 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0002
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0002
     * @tc.desc      UiExtensionPageState.reportDrawn(code=200) yields len77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0002 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(200);
      logInfo(`reportDrawn(code=200): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(77);
      logInfo(`reportDrawn(code=200): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=200): actual.substring(45)=${actual.substring(45)}`);
      expect(actual.substring(45)).assertEqual('d, code is 200, message is error');
      logInfo(`reportDrawn(code=200) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`reportDrawn(code=200) state: subject.lastMessage.substring(0...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=200) state: subject.lastMessage.substring(45)=${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 200, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0002 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0003
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0003
     * @tc.desc      UiExtensionPageState.reportDrawn(code=401) yields len77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0003 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(401);
      logInfo(`reportDrawn(code=401): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(77);
      logInfo(`reportDrawn(code=401): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=401): actual.substring(45)=${actual.substring(45)}`);
      expect(actual.substring(45)).assertEqual('d, code is 401, message is error');
      logInfo(`reportDrawn(code=401) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`reportDrawn(code=401) state: subject.lastMessage.substring(0...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=401) state: subject.lastMessage.substring(45)=${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 401, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0003 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0004
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0004
     * @tc.desc      UiExtensionPageState.reportDrawn(code=404) yields len77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0004 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(404);
      logInfo(`reportDrawn(code=404): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(77);
      logInfo(`reportDrawn(code=404): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=404): actual.substring(45)=${actual.substring(45)}`);
      expect(actual.substring(45)).assertEqual('d, code is 404, message is error');
      logInfo(`reportDrawn(code=404) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`reportDrawn(code=404) state: subject.lastMessage.substring(0...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=404) state: subject.lastMessage.substring(45)=${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 404, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0004 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0005
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0005
     * @tc.desc      UiExtensionPageState.reportDrawn(code=500) yields len77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0005 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(500);
      logInfo(`reportDrawn(code=500): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(77);
      logInfo(`reportDrawn(code=500): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=500): actual.substring(45)=${actual.substring(45)}`);
      expect(actual.substring(45)).assertEqual('d, code is 500, message is error');
      logInfo(`reportDrawn(code=500) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`reportDrawn(code=500) state: subject.lastMessage.substring(0...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=500) state: subject.lastMessage.substring(45)=${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 500, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0005 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0006
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0006
     * @tc.desc      UiExtensionPageState.reportDrawn(code=-1) yields len76
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0006 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(-1);
      logInfo(`reportDrawn(code=-1): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(76);
      logInfo(`reportDrawn(code=-1): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=-1): actual.substring(44)=${actual.substring(44)}`);
      expect(actual.substring(44)).assertEqual('ed, code is -1, message is error');
      logInfo(`reportDrawn(code=-1) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(76);
      logInfo(`reportDrawn(code=-1) state: subject.lastMessage.substring(0,...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=-1) state: subject.lastMessage.substring(44)=${subject.lastMessage.substring(44)}`);
      expect(subject.lastMessage.substring(44)).assertEqual('ed, code is -1, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0006 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0007
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0007
     * @tc.desc      UiExtensionPageState.reportDrawn(code=1) yields len75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0007 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(1);
      logInfo(`reportDrawn(code=1): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(75);
      logInfo(`reportDrawn(code=1): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=1): actual.substring(43)=${actual.substring(43)}`);
      expect(actual.substring(43)).assertEqual('led, code is 1, message is error');
      logInfo(`reportDrawn(code=1) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(75);
      logInfo(`reportDrawn(code=1) state: subject.lastMessage.substring(0, ...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=1) state: subject.lastMessage.substring(43)=${subject.lastMessage.substring(43)}`);
      expect(subject.lastMessage.substring(43)).assertEqual('led, code is 1, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0007 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0008
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0008
     * @tc.desc      UiExtensionPageState.reportDrawn(code=2) yields len75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0008 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(2);
      logInfo(`reportDrawn(code=2): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(75);
      logInfo(`reportDrawn(code=2): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=2): actual.substring(43)=${actual.substring(43)}`);
      expect(actual.substring(43)).assertEqual('led, code is 2, message is error');
      logInfo(`reportDrawn(code=2) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(75);
      logInfo(`reportDrawn(code=2) state: subject.lastMessage.substring(0, ...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=2) state: subject.lastMessage.substring(43)=${subject.lastMessage.substring(43)}`);
      expect(subject.lastMessage.substring(43)).assertEqual('led, code is 2, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0008 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0009
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0009
     * @tc.desc      UiExtensionPageState.reportDrawn(code=3) yields len75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0009 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(3);
      logInfo(`reportDrawn(code=3): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(75);
      logInfo(`reportDrawn(code=3): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=3): actual.substring(43)=${actual.substring(43)}`);
      expect(actual.substring(43)).assertEqual('led, code is 3, message is error');
      logInfo(`reportDrawn(code=3) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(75);
      logInfo(`reportDrawn(code=3) state: subject.lastMessage.substring(0, ...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=3) state: subject.lastMessage.substring(43)=${subject.lastMessage.substring(43)}`);
      expect(subject.lastMessage.substring(43)).assertEqual('led, code is 3, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0009 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0010
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0010
     * @tc.desc      UiExtensionPageState.reportDrawn(code=10) yields len76
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0010 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(10);
      logInfo(`reportDrawn(code=10): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(76);
      logInfo(`reportDrawn(code=10): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=10): actual.substring(44)=${actual.substring(44)}`);
      expect(actual.substring(44)).assertEqual('ed, code is 10, message is error');
      logInfo(`reportDrawn(code=10) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(76);
      logInfo(`reportDrawn(code=10) state: subject.lastMessage.substring(0,...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=10) state: subject.lastMessage.substring(44)=${subject.lastMessage.substring(44)}`);
      expect(subject.lastMessage.substring(44)).assertEqual('ed, code is 10, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0010 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0011
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0011
     * @tc.desc      UiExtensionPageState.reportDrawn(code=100) yields len77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0011 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(100);
      logInfo(`reportDrawn(code=100): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(77);
      logInfo(`reportDrawn(code=100): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=100): actual.substring(45)=${actual.substring(45)}`);
      expect(actual.substring(45)).assertEqual('d, code is 100, message is error');
      logInfo(`reportDrawn(code=100) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`reportDrawn(code=100) state: subject.lastMessage.substring(0...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=100) state: subject.lastMessage.substring(45)=${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 100, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0011 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0012
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0012
     * @tc.desc      UiExtensionPageState.reportDrawn(code=25) yields len76
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0012 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(25);
      logInfo(`reportDrawn(code=25): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(76);
      logInfo(`reportDrawn(code=25): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=25): actual.substring(44)=${actual.substring(44)}`);
      expect(actual.substring(44)).assertEqual('ed, code is 25, message is error');
      logInfo(`reportDrawn(code=25) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(76);
      logInfo(`reportDrawn(code=25) state: subject.lastMessage.substring(0,...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=25) state: subject.lastMessage.substring(44)=${subject.lastMessage.substring(44)}`);
      expect(subject.lastMessage.substring(44)).assertEqual('ed, code is 25, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0012 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0013
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0013
     * @tc.desc      UiExtensionPageState.reportDrawn(code=50) yields len76
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0013 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(50);
      logInfo(`reportDrawn(code=50): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(76);
      logInfo(`reportDrawn(code=50): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=50): actual.substring(44)=${actual.substring(44)}`);
      expect(actual.substring(44)).assertEqual('ed, code is 50, message is error');
      logInfo(`reportDrawn(code=50) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(76);
      logInfo(`reportDrawn(code=50) state: subject.lastMessage.substring(0,...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=50) state: subject.lastMessage.substring(44)=${subject.lastMessage.substring(44)}`);
      expect(subject.lastMessage.substring(44)).assertEqual('ed, code is 50, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0013 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0014
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0014
     * @tc.desc      UiExtensionPageState.reportDrawn(code=75) yields len76
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0014 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(75);
      logInfo(`reportDrawn(code=75): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(76);
      logInfo(`reportDrawn(code=75): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=75): actual.substring(44)=${actual.substring(44)}`);
      expect(actual.substring(44)).assertEqual('ed, code is 75, message is error');
      logInfo(`reportDrawn(code=75) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(76);
      logInfo(`reportDrawn(code=75) state: subject.lastMessage.substring(0,...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=75) state: subject.lastMessage.substring(44)=${subject.lastMessage.substring(44)}`);
      expect(subject.lastMessage.substring(44)).assertEqual('ed, code is 75, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0014 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0015
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0015
     * @tc.desc      UiExtensionPageState.reportDrawn(code=125) yields len77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0015 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(125);
      logInfo(`reportDrawn(code=125): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(77);
      logInfo(`reportDrawn(code=125): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=125): actual.substring(45)=${actual.substring(45)}`);
      expect(actual.substring(45)).assertEqual('d, code is 125, message is error');
      logInfo(`reportDrawn(code=125) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`reportDrawn(code=125) state: subject.lastMessage.substring(0...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=125) state: subject.lastMessage.substring(45)=${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 125, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0015 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0016
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0016
     * @tc.desc      UiExtensionPageState.reportDrawn(code=150) yields len77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0016 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(150);
      logInfo(`reportDrawn(code=150): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(77);
      logInfo(`reportDrawn(code=150): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=150): actual.substring(45)=${actual.substring(45)}`);
      expect(actual.substring(45)).assertEqual('d, code is 150, message is error');
      logInfo(`reportDrawn(code=150) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`reportDrawn(code=150) state: subject.lastMessage.substring(0...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=150) state: subject.lastMessage.substring(45)=${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 150, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0016 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0017
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0017
     * @tc.desc      UiExtensionPageState.reportDrawn(code=175) yields len77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0017 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(175);
      logInfo(`reportDrawn(code=175): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(77);
      logInfo(`reportDrawn(code=175): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=175): actual.substring(45)=${actual.substring(45)}`);
      expect(actual.substring(45)).assertEqual('d, code is 175, message is error');
      logInfo(`reportDrawn(code=175) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`reportDrawn(code=175) state: subject.lastMessage.substring(0...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=175) state: subject.lastMessage.substring(45)=${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 175, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0017 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0018
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0018
     * @tc.desc      UiExtensionPageState.reportDrawn(code=225) yields len77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0018 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(225);
      logInfo(`reportDrawn(code=225): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(77);
      logInfo(`reportDrawn(code=225): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=225): actual.substring(45)=${actual.substring(45)}`);
      expect(actual.substring(45)).assertEqual('d, code is 225, message is error');
      logInfo(`reportDrawn(code=225) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`reportDrawn(code=225) state: subject.lastMessage.substring(0...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=225) state: subject.lastMessage.substring(45)=${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 225, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0018 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0019
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0019
     * @tc.desc      UiExtensionPageState.reportDrawn(code=250) yields len77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0019 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(250);
      logInfo(`reportDrawn(code=250): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(77);
      logInfo(`reportDrawn(code=250): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=250): actual.substring(45)=${actual.substring(45)}`);
      expect(actual.substring(45)).assertEqual('d, code is 250, message is error');
      logInfo(`reportDrawn(code=250) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`reportDrawn(code=250) state: subject.lastMessage.substring(0...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=250) state: subject.lastMessage.substring(45)=${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 250, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0019 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0020
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0020
     * @tc.desc      UiExtensionPageState.reportDrawn(code=275) yields len77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0020 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(275);
      logInfo(`reportDrawn(code=275): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(77);
      logInfo(`reportDrawn(code=275): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=275): actual.substring(45)=${actual.substring(45)}`);
      expect(actual.substring(45)).assertEqual('d, code is 275, message is error');
      logInfo(`reportDrawn(code=275) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`reportDrawn(code=275) state: subject.lastMessage.substring(0...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=275) state: subject.lastMessage.substring(45)=${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 275, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0020 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0021
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0021
     * @tc.desc      UiExtensionPageState.reportDrawn(code=300) yields len77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0021 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(300);
      logInfo(`reportDrawn(code=300): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(77);
      logInfo(`reportDrawn(code=300): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=300): actual.substring(45)=${actual.substring(45)}`);
      expect(actual.substring(45)).assertEqual('d, code is 300, message is error');
      logInfo(`reportDrawn(code=300) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`reportDrawn(code=300) state: subject.lastMessage.substring(0...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=300) state: subject.lastMessage.substring(45)=${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 300, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0021 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0022
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0022
     * @tc.desc      UiExtensionPageState.reportDrawn(code=325) yields len77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0022 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(325);
      logInfo(`reportDrawn(code=325): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(77);
      logInfo(`reportDrawn(code=325): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=325): actual.substring(45)=${actual.substring(45)}`);
      expect(actual.substring(45)).assertEqual('d, code is 325, message is error');
      logInfo(`reportDrawn(code=325) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`reportDrawn(code=325) state: subject.lastMessage.substring(0...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=325) state: subject.lastMessage.substring(45)=${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 325, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0022 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0023
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0023
     * @tc.desc      UiExtensionPageState.reportDrawn(code=350) yields len77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0023 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(350);
      logInfo(`reportDrawn(code=350): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(77);
      logInfo(`reportDrawn(code=350): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=350): actual.substring(45)=${actual.substring(45)}`);
      expect(actual.substring(45)).assertEqual('d, code is 350, message is error');
      logInfo(`reportDrawn(code=350) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`reportDrawn(code=350) state: subject.lastMessage.substring(0...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=350) state: subject.lastMessage.substring(45)=${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 350, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0023 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0024
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0024
     * @tc.desc      UiExtensionPageState.reportDrawn(code=375) yields len77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0024 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(375);
      logInfo(`reportDrawn(code=375): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(77);
      logInfo(`reportDrawn(code=375): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=375): actual.substring(45)=${actual.substring(45)}`);
      expect(actual.substring(45)).assertEqual('d, code is 375, message is error');
      logInfo(`reportDrawn(code=375) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`reportDrawn(code=375) state: subject.lastMessage.substring(0...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=375) state: subject.lastMessage.substring(45)=${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 375, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0024 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0025
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0025
     * @tc.desc      UiExtensionPageState.reportDrawn(code=400) yields len77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0025 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(400);
      logInfo(`reportDrawn(code=400): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(77);
      logInfo(`reportDrawn(code=400): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=400): actual.substring(45)=${actual.substring(45)}`);
      expect(actual.substring(45)).assertEqual('d, code is 400, message is error');
      logInfo(`reportDrawn(code=400) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`reportDrawn(code=400) state: subject.lastMessage.substring(0...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=400) state: subject.lastMessage.substring(45)=${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 400, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0025 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0026
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0026
     * @tc.desc      UiExtensionPageState.reportDrawn(code=425) yields len77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0026 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(425);
      logInfo(`reportDrawn(code=425): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(77);
      logInfo(`reportDrawn(code=425): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=425): actual.substring(45)=${actual.substring(45)}`);
      expect(actual.substring(45)).assertEqual('d, code is 425, message is error');
      logInfo(`reportDrawn(code=425) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`reportDrawn(code=425) state: subject.lastMessage.substring(0...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=425) state: subject.lastMessage.substring(45)=${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 425, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0026 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0027
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0027
     * @tc.desc      UiExtensionPageState.reportDrawn(code=450) yields len77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0027 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(450);
      logInfo(`reportDrawn(code=450): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(77);
      logInfo(`reportDrawn(code=450): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=450): actual.substring(45)=${actual.substring(45)}`);
      expect(actual.substring(45)).assertEqual('d, code is 450, message is error');
      logInfo(`reportDrawn(code=450) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`reportDrawn(code=450) state: subject.lastMessage.substring(0...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=450) state: subject.lastMessage.substring(45)=${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 450, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0027 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0028
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0028
     * @tc.desc      UiExtensionPageState.reportDrawn(code=475) yields len77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0028 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(475);
      logInfo(`reportDrawn(code=475): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(77);
      logInfo(`reportDrawn(code=475): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=475): actual.substring(45)=${actual.substring(45)}`);
      expect(actual.substring(45)).assertEqual('d, code is 475, message is error');
      logInfo(`reportDrawn(code=475) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`reportDrawn(code=475) state: subject.lastMessage.substring(0...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=475) state: subject.lastMessage.substring(45)=${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 475, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0028 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0029
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0029
     * @tc.desc      UiExtensionPageState.reportDrawn(code=525) yields len77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0029 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(525);
      logInfo(`reportDrawn(code=525): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(77);
      logInfo(`reportDrawn(code=525): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=525): actual.substring(45)=${actual.substring(45)}`);
      expect(actual.substring(45)).assertEqual('d, code is 525, message is error');
      logInfo(`reportDrawn(code=525) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`reportDrawn(code=525) state: subject.lastMessage.substring(0...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=525) state: subject.lastMessage.substring(45)=${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 525, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0029 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0030
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0030
     * @tc.desc      UiExtensionPageState.reportDrawn(code=550) yields len77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0030 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(550);
      logInfo(`reportDrawn(code=550): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(77);
      logInfo(`reportDrawn(code=550): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=550): actual.substring(45)=${actual.substring(45)}`);
      expect(actual.substring(45)).assertEqual('d, code is 550, message is error');
      logInfo(`reportDrawn(code=550) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`reportDrawn(code=550) state: subject.lastMessage.substring(0...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=550) state: subject.lastMessage.substring(45)=${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 550, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0030 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0031
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0031
     * @tc.desc      UiExtensionPageState.reportDrawn(code=575) yields len77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0031 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(575);
      logInfo(`reportDrawn(code=575): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(77);
      logInfo(`reportDrawn(code=575): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=575): actual.substring(45)=${actual.substring(45)}`);
      expect(actual.substring(45)).assertEqual('d, code is 575, message is error');
      logInfo(`reportDrawn(code=575) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`reportDrawn(code=575) state: subject.lastMessage.substring(0...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=575) state: subject.lastMessage.substring(45)=${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 575, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0031 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0032
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0032
     * @tc.desc      UiExtensionPageState.reportDrawn(code=600) yields len77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0032 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(600);
      logInfo(`reportDrawn(code=600): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(77);
      logInfo(`reportDrawn(code=600): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=600): actual.substring(45)=${actual.substring(45)}`);
      expect(actual.substring(45)).assertEqual('d, code is 600, message is error');
      logInfo(`reportDrawn(code=600) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`reportDrawn(code=600) state: subject.lastMessage.substring(0...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=600) state: subject.lastMessage.substring(45)=${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 600, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0032 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0033
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0033
     * @tc.desc      UiExtensionPageState.reportDrawn(code=625) yields len77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0033 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(625);
      logInfo(`reportDrawn(code=625): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(77);
      logInfo(`reportDrawn(code=625): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=625): actual.substring(45)=${actual.substring(45)}`);
      expect(actual.substring(45)).assertEqual('d, code is 625, message is error');
      logInfo(`reportDrawn(code=625) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`reportDrawn(code=625) state: subject.lastMessage.substring(0...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=625) state: subject.lastMessage.substring(45)=${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 625, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0033 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0034
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0034
     * @tc.desc      UiExtensionPageState.reportDrawn(code=650) yields len77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0034 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(650);
      logInfo(`reportDrawn(code=650): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(77);
      logInfo(`reportDrawn(code=650): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=650): actual.substring(45)=${actual.substring(45)}`);
      expect(actual.substring(45)).assertEqual('d, code is 650, message is error');
      logInfo(`reportDrawn(code=650) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`reportDrawn(code=650) state: subject.lastMessage.substring(0...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=650) state: subject.lastMessage.substring(45)=${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 650, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0034 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0035
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0035
     * @tc.desc      UiExtensionPageState.reportDrawn(code=675) yields len77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0035 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(675);
      logInfo(`reportDrawn(code=675): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(77);
      logInfo(`reportDrawn(code=675): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=675): actual.substring(45)=${actual.substring(45)}`);
      expect(actual.substring(45)).assertEqual('d, code is 675, message is error');
      logInfo(`reportDrawn(code=675) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`reportDrawn(code=675) state: subject.lastMessage.substring(0...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=675) state: subject.lastMessage.substring(45)=${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 675, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0035 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0036
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0036
     * @tc.desc      UiExtensionPageState.reportDrawn(code=700) yields len77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0036 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(700);
      logInfo(`reportDrawn(code=700): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(77);
      logInfo(`reportDrawn(code=700): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=700): actual.substring(45)=${actual.substring(45)}`);
      expect(actual.substring(45)).assertEqual('d, code is 700, message is error');
      logInfo(`reportDrawn(code=700) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`reportDrawn(code=700) state: subject.lastMessage.substring(0...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=700) state: subject.lastMessage.substring(45)=${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 700, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0036 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0037
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0037
     * @tc.desc      UiExtensionPageState.reportDrawn(code=725) yields len77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0037 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(725);
      logInfo(`reportDrawn(code=725): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(77);
      logInfo(`reportDrawn(code=725): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=725): actual.substring(45)=${actual.substring(45)}`);
      expect(actual.substring(45)).assertEqual('d, code is 725, message is error');
      logInfo(`reportDrawn(code=725) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`reportDrawn(code=725) state: subject.lastMessage.substring(0...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=725) state: subject.lastMessage.substring(45)=${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 725, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0037 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0038
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0038
     * @tc.desc      UiExtensionPageState.reportDrawn(code=750) yields len77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0038 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(750);
      logInfo(`reportDrawn(code=750): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(77);
      logInfo(`reportDrawn(code=750): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=750): actual.substring(45)=${actual.substring(45)}`);
      expect(actual.substring(45)).assertEqual('d, code is 750, message is error');
      logInfo(`reportDrawn(code=750) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`reportDrawn(code=750) state: subject.lastMessage.substring(0...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=750) state: subject.lastMessage.substring(45)=${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 750, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0038 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0039
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0039
     * @tc.desc      UiExtensionPageState.reportDrawn(code=775) yields len77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0039 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(775);
      logInfo(`reportDrawn(code=775): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(77);
      logInfo(`reportDrawn(code=775): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=775): actual.substring(45)=${actual.substring(45)}`);
      expect(actual.substring(45)).assertEqual('d, code is 775, message is error');
      logInfo(`reportDrawn(code=775) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`reportDrawn(code=775) state: subject.lastMessage.substring(0...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=775) state: subject.lastMessage.substring(45)=${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 775, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0039 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0040
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0040
     * @tc.desc      UiExtensionPageState.reportDrawn(code=800) yields len77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0040 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(800);
      logInfo(`reportDrawn(code=800): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(77);
      logInfo(`reportDrawn(code=800): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=800): actual.substring(45)=${actual.substring(45)}`);
      expect(actual.substring(45)).assertEqual('d, code is 800, message is error');
      logInfo(`reportDrawn(code=800) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`reportDrawn(code=800) state: subject.lastMessage.substring(0...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=800) state: subject.lastMessage.substring(45)=${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 800, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0040 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0041
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0041
     * @tc.desc      UiExtensionPageState.reportDrawn(code=825) yields len77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0041 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(825);
      logInfo(`reportDrawn(code=825): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(77);
      logInfo(`reportDrawn(code=825): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=825): actual.substring(45)=${actual.substring(45)}`);
      expect(actual.substring(45)).assertEqual('d, code is 825, message is error');
      logInfo(`reportDrawn(code=825) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`reportDrawn(code=825) state: subject.lastMessage.substring(0...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=825) state: subject.lastMessage.substring(45)=${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 825, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0041 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0042
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0042
     * @tc.desc      UiExtensionPageState.reportDrawn(code=850) yields len77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0042 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(850);
      logInfo(`reportDrawn(code=850): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(77);
      logInfo(`reportDrawn(code=850): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=850): actual.substring(45)=${actual.substring(45)}`);
      expect(actual.substring(45)).assertEqual('d, code is 850, message is error');
      logInfo(`reportDrawn(code=850) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`reportDrawn(code=850) state: subject.lastMessage.substring(0...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=850) state: subject.lastMessage.substring(45)=${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 850, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0042 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0043
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0043
     * @tc.desc      UiExtensionPageState.reportDrawn(code=875) yields len77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0043 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(875);
      logInfo(`reportDrawn(code=875): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(77);
      logInfo(`reportDrawn(code=875): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=875): actual.substring(45)=${actual.substring(45)}`);
      expect(actual.substring(45)).assertEqual('d, code is 875, message is error');
      logInfo(`reportDrawn(code=875) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`reportDrawn(code=875) state: subject.lastMessage.substring(0...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=875) state: subject.lastMessage.substring(45)=${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 875, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0043 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0044
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0044
     * @tc.desc      UiExtensionPageState.reportDrawn(code=900) yields len77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0044 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(900);
      logInfo(`reportDrawn(code=900): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(77);
      logInfo(`reportDrawn(code=900): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=900): actual.substring(45)=${actual.substring(45)}`);
      expect(actual.substring(45)).assertEqual('d, code is 900, message is error');
      logInfo(`reportDrawn(code=900) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`reportDrawn(code=900) state: subject.lastMessage.substring(0...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=900) state: subject.lastMessage.substring(45)=${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 900, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0044 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0045
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0045
     * @tc.desc      UiExtensionPageState.reportDrawn(code=925) yields len77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0045 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(925);
      logInfo(`reportDrawn(code=925): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(77);
      logInfo(`reportDrawn(code=925): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=925): actual.substring(45)=${actual.substring(45)}`);
      expect(actual.substring(45)).assertEqual('d, code is 925, message is error');
      logInfo(`reportDrawn(code=925) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`reportDrawn(code=925) state: subject.lastMessage.substring(0...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=925) state: subject.lastMessage.substring(45)=${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 925, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0045 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0046
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0046
     * @tc.desc      UiExtensionPageState.reportDrawn(code=950) yields len77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0046 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(950);
      logInfo(`reportDrawn(code=950): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(77);
      logInfo(`reportDrawn(code=950): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=950): actual.substring(45)=${actual.substring(45)}`);
      expect(actual.substring(45)).assertEqual('d, code is 950, message is error');
      logInfo(`reportDrawn(code=950) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`reportDrawn(code=950) state: subject.lastMessage.substring(0...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=950) state: subject.lastMessage.substring(45)=${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 950, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0046 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0047
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0047
     * @tc.desc      UiExtensionPageState.reportDrawn(code=975) yields len77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0047 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(975);
      logInfo(`reportDrawn(code=975): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(77);
      logInfo(`reportDrawn(code=975): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=975): actual.substring(45)=${actual.substring(45)}`);
      expect(actual.substring(45)).assertEqual('d, code is 975, message is error');
      logInfo(`reportDrawn(code=975) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`reportDrawn(code=975) state: subject.lastMessage.substring(0...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=975) state: subject.lastMessage.substring(45)=${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 975, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0047 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0048
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0048
     * @tc.desc      UiExtensionPageState.reportDrawn(code=1000) yields len78
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0048 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(1000);
      logInfo(`reportDrawn(code=1000): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(78);
      logInfo(`reportDrawn(code=1000): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=1000): actual.substring(46)=${actual.substring(46)}`);
      expect(actual.substring(46)).assertEqual(', code is 1000, message is error');
      logInfo(`reportDrawn(code=1000) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(78);
      logInfo(`reportDrawn(code=1000) state: subject.lastMessage.substring(...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=1000) state: subject.lastMessage.substring(46)=${subject.lastMessage.substring(46)}`);
      expect(subject.lastMessage.substring(46)).assertEqual(', code is 1000, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0048 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0049
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0049
     * @tc.desc      UiExtensionPageState.reportDrawn(code=515) yields len77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0049 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(515);
      logInfo(`reportDrawn(code=515): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(77);
      logInfo(`reportDrawn(code=515): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=515): actual.substring(45)=${actual.substring(45)}`);
      expect(actual.substring(45)).assertEqual('d, code is 515, message is error');
      logInfo(`reportDrawn(code=515) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`reportDrawn(code=515) state: subject.lastMessage.substring(0...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=515) state: subject.lastMessage.substring(45)=${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 515, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0049 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0050
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0050
     * @tc.desc      UiExtensionPageState.reportDrawn(code=63) yields len76
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0050 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(63);
      logInfo(`reportDrawn(code=63): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(76);
      logInfo(`reportDrawn(code=63): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=63): actual.substring(44)=${actual.substring(44)}`);
      expect(actual.substring(44)).assertEqual('ed, code is 63, message is error');
      logInfo(`reportDrawn(code=63) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(76);
      logInfo(`reportDrawn(code=63) state: subject.lastMessage.substring(0,...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=63) state: subject.lastMessage.substring(44)=${subject.lastMessage.substring(44)}`);
      expect(subject.lastMessage.substring(44)).assertEqual('ed, code is 63, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0050 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0051
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0051
     * @tc.desc      UiExtensionPageState.reportDrawn(code=229) yields len77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0051 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(229);
      logInfo(`reportDrawn(code=229): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(77);
      logInfo(`reportDrawn(code=229): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=229): actual.substring(45)=${actual.substring(45)}`);
      expect(actual.substring(45)).assertEqual('d, code is 229, message is error');
      logInfo(`reportDrawn(code=229) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`reportDrawn(code=229) state: subject.lastMessage.substring(0...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=229) state: subject.lastMessage.substring(45)=${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 229, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0051 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0052
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0052
     * @tc.desc      UiExtensionPageState.reportDrawn(code=703) yields len77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0052 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(703);
      logInfo(`reportDrawn(code=703): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(77);
      logInfo(`reportDrawn(code=703): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=703): actual.substring(45)=${actual.substring(45)}`);
      expect(actual.substring(45)).assertEqual('d, code is 703, message is error');
      logInfo(`reportDrawn(code=703) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`reportDrawn(code=703) state: subject.lastMessage.substring(0...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=703) state: subject.lastMessage.substring(45)=${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 703, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0052 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0053
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0053
     * @tc.desc      UiExtensionPageState.reportDrawn(code=739) yields len77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0053 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(739);
      logInfo(`reportDrawn(code=739): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(77);
      logInfo(`reportDrawn(code=739): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=739): actual.substring(45)=${actual.substring(45)}`);
      expect(actual.substring(45)).assertEqual('d, code is 739, message is error');
      logInfo(`reportDrawn(code=739) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`reportDrawn(code=739) state: subject.lastMessage.substring(0...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=739) state: subject.lastMessage.substring(45)=${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 739, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0053 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0054
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0054
     * @tc.desc      UiExtensionPageState.reportDrawn(code=277.13) yields len80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0054 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(277.13);
      logInfo(`reportDrawn(code=277.13): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(80);
      logInfo(`reportDrawn(code=277.13): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=277.13): actual.substring(48)=${actual.substring(48)}`);
      expect(actual.substring(48)).assertEqual('code is 277.13, message is error');
      logInfo(`reportDrawn(code=277.13) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(80);
      logInfo(`reportDrawn(code=277.13) state: subject.lastMessage.substrin...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=277.13) state: subject.lastMessage.substring(48)=${subject.lastMessage.substring(48)}`);
      expect(subject.lastMessage.substring(48)).assertEqual('code is 277.13, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0054 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0055
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0055
     * @tc.desc      UiExtensionPageState.reportDrawn(code=195) yields len77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0055 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(195);
      logInfo(`reportDrawn(code=195): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(77);
      logInfo(`reportDrawn(code=195): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=195): actual.substring(45)=${actual.substring(45)}`);
      expect(actual.substring(45)).assertEqual('d, code is 195, message is error');
      logInfo(`reportDrawn(code=195) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`reportDrawn(code=195) state: subject.lastMessage.substring(0...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=195) state: subject.lastMessage.substring(45)=${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 195, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0055 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0056
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0056
     * @tc.desc      UiExtensionPageState.reportDrawn(code=843) yields len77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0056 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(843);
      logInfo(`reportDrawn(code=843): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(77);
      logInfo(`reportDrawn(code=843): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=843): actual.substring(45)=${actual.substring(45)}`);
      expect(actual.substring(45)).assertEqual('d, code is 843, message is error');
      logInfo(`reportDrawn(code=843) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`reportDrawn(code=843) state: subject.lastMessage.substring(0...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=843) state: subject.lastMessage.substring(45)=${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 843, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0056 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0057
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0057
     * @tc.desc      UiExtensionPageState.reportDrawn(code=191) yields len77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0057 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(191);
      logInfo(`reportDrawn(code=191): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(77);
      logInfo(`reportDrawn(code=191): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=191): actual.substring(45)=${actual.substring(45)}`);
      expect(actual.substring(45)).assertEqual('d, code is 191, message is error');
      logInfo(`reportDrawn(code=191) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`reportDrawn(code=191) state: subject.lastMessage.substring(0...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=191) state: subject.lastMessage.substring(45)=${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 191, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0057 end`);
    });
  });
}
