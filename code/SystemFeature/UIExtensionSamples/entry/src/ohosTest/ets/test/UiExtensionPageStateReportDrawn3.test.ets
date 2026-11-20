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

/** Logic checks for UiExtensionPageState.reportDrawn (6 cases). */
export default function uiExtensionPageStateReportDrawn3Test(): void {
  describe('UiExtensionPageStateReportDrawn3Test', () => {
    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0115
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0115
     * @tc.desc      UiExtensionPageState.reportDrawn(code=984) yields len77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0115 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(984);
      logInfo(`reportDrawn(code=984): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(77);
      logInfo(`reportDrawn(code=984): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=984): actual.substring(45)=${actual.substring(45)}`);
      expect(actual.substring(45)).assertEqual('d, code is 984, message is error');
      logInfo(`reportDrawn(code=984) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`reportDrawn(code=984) state: subject.lastMessage.substring(0...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=984) state: subject.lastMessage.substring(45)=${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 984, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0115 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0116
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0116
     * @tc.desc      UiExtensionPageState.reportDrawn(code=803) yields len77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0116 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(803);
      logInfo(`reportDrawn(code=803): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(77);
      logInfo(`reportDrawn(code=803): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=803): actual.substring(45)=${actual.substring(45)}`);
      expect(actual.substring(45)).assertEqual('d, code is 803, message is error');
      logInfo(`reportDrawn(code=803) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`reportDrawn(code=803) state: subject.lastMessage.substring(0...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=803) state: subject.lastMessage.substring(45)=${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 803, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0116 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0117
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0117
     * @tc.desc      UiExtensionPageState.reportDrawn(code=143) yields len77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0117 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(143);
      logInfo(`reportDrawn(code=143): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(77);
      logInfo(`reportDrawn(code=143): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=143): actual.substring(45)=${actual.substring(45)}`);
      expect(actual.substring(45)).assertEqual('d, code is 143, message is error');
      logInfo(`reportDrawn(code=143) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`reportDrawn(code=143) state: subject.lastMessage.substring(0...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=143) state: subject.lastMessage.substring(45)=${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 143, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0117 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0118
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0118
     * @tc.desc      UiExtensionPageState.reportDrawn(code=57.92) yields len79
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0118 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(57.92);
      logInfo(`reportDrawn(code=57.92): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(79);
      logInfo(`reportDrawn(code=57.92): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=57.92): actual.substring(47)=${actual.substring(47)}`);
      expect(actual.substring(47)).assertEqual(' code is 57.92, message is error');
      logInfo(`reportDrawn(code=57.92) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(79);
      logInfo(`reportDrawn(code=57.92) state: subject.lastMessage.substring...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=57.92) state: subject.lastMessage.substring(47)=${subject.lastMessage.substring(47)}`);
      expect(subject.lastMessage.substring(47)).assertEqual(' code is 57.92, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0118 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0119
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0119
     * @tc.desc      UiExtensionPageState.reportDrawn(code=140.56) yields len80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0119 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(140.56);
      logInfo(`reportDrawn(code=140.56): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(80);
      logInfo(`reportDrawn(code=140.56): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=140.56): actual.substring(48)=${actual.substring(48)}`);
      expect(actual.substring(48)).assertEqual('code is 140.56, message is error');
      logInfo(`reportDrawn(code=140.56) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(80);
      logInfo(`reportDrawn(code=140.56) state: subject.lastMessage.substrin...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=140.56) state: subject.lastMessage.substring(48)=${subject.lastMessage.substring(48)}`);
      expect(subject.lastMessage.substring(48)).assertEqual('code is 140.56, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0119 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_UI_EXTENSION_PAGE_STATE_REPORT_DRAWN_0120
     * @tc.name      UIExtensionSamples_UiExtensionPageStateReportDrawn_0120
     * @tc.desc      UiExtensionPageState.reportDrawn(code=223) yields len77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_UiExtensionPageStateReportDrawn_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0120 begin`);
      const subject: UiExtensionPageState = new UiExtensionPageState();
      const actual: string = subject.reportDrawn(223);
      logInfo(`reportDrawn(code=223): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(77);
      logInfo(`reportDrawn(code=223): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=223): actual.substring(45)=${actual.substring(45)}`);
      expect(actual.substring(45)).assertEqual('d, code is 223, message is error');
      logInfo(`reportDrawn(code=223) state: subject.lastMessage.length=${subject.lastMessage.length}`);
      expect(subject.lastMessage.length).assertEqual(77);
      logInfo(`reportDrawn(code=223) state: subject.lastMessage.substring(0...${subject.lastMessage.substring(0, 32)}`);
      expect(subject.lastMessage.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawn(code=223) state: subject.lastMessage.substring(45)=${subject.lastMessage.substring(45)}`);
      expect(subject.lastMessage.substring(45)).assertEqual('d, code is 223, message is error');
      logInfo(`${BUNDLE}UiExtensionPageStateReportDrawn_0120 end`);
    });
  });
}
