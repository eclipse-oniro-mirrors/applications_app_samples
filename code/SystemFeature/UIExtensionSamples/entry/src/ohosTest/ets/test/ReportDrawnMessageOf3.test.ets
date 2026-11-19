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
import { reportDrawnMessageOf } from './model/UiExtensionLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_UIExtensionSamples]';
const BUNDLE: string = 'UIExtensionSamples_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for reportDrawnMessageOf (68 cases). */
export default function reportDrawnMessageOf3Test(): void {
  describe('ReportDrawnMessageOf3Test', () => {
    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0155
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0155
     * @tc.desc      reportDrawnMessageOf(code=3, message="hello world") returns "ode is 3, message is hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0155 begin`);
      const actual: string = reportDrawnMessageOf(3, 'hello world');
      logInfo(`reportDrawnMessageOf(code=3, message="hel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(81);
      logInfo(`reportDrawnMessageOf(code=3, message="hel...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=3, message="hel...: actual.substring(49)=${actual.substring(49)}`);
      expect(actual.substring(49)).assertEqual('ode is 3, message is hello world');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0155 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0156
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0156
     * @tc.desc      reportDrawnMessageOf(code=3, message="") returns "d failed, code is 3, message is "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0156 begin`);
      const actual: string = reportDrawnMessageOf(3, '');
      logInfo(`reportDrawnMessageOf(code=3, message=""): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(70);
      logInfo(`reportDrawnMessageOf(code=3, message=""): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=3, message=""): actual.substring(38)=${actual.substring(38)}`);
      expect(actual.substring(38)).assertEqual('d failed, code is 3, message is ');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0156 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0157
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0157
     * @tc.desc      reportDrawnMessageOf(code=3, message=" ") returns " failed, code is 3, message is  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0157 begin`);
      const actual: string = reportDrawnMessageOf(3, ' ');
      logInfo(`reportDrawnMessageOf(code=3, message=" "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(71);
      logInfo(`reportDrawnMessageOf(code=3, message=" "): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=3, message=" "): actual.substring(39)=${actual.substring(39)}`);
      expect(actual.substring(39)).assertEqual(' failed, code is 3, message is  ');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0157 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0158
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0158
     * @tc.desc      reportDrawnMessageOf(code=3, message="A") returns " failed, code is 3, message is A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0158 begin`);
      const actual: string = reportDrawnMessageOf(3, 'A');
      logInfo(`reportDrawnMessageOf(code=3, message="A"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(71);
      logInfo(`reportDrawnMessageOf(code=3, message="A"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=3, message="A"): actual.substring(39)=${actual.substring(39)}`);
      expect(actual.substring(39)).assertEqual(' failed, code is 3, message is A');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0158 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0159
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0159
     * @tc.desc      reportDrawnMessageOf(code=3, message="Sample Title 123") returns "s 3, message is Sample Title 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0159 begin`);
      const actual: string = reportDrawnMessageOf(3, 'Sample Title 123');
      logInfo(`reportDrawnMessageOf(code=3, message="Sam...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(86);
      logInfo(`reportDrawnMessageOf(code=3, message="Sam...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=3, message="Sam...: actual.substring(54)=${actual.substring(54)}`);
      expect(actual.substring(54)).assertEqual('s 3, message is Sample Title 123');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0159 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0160
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0160
     * @tc.desc      reportDrawnMessageOf(code=3, message="??") returns "ed, code is 3, message is ??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0160 begin`);
      const actual: string = reportDrawnMessageOf(3, '\u4e2d\u6587');
      logInfo(`reportDrawnMessageOf(code=3, message="??"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(72);
      logInfo(`reportDrawnMessageOf(code=3, message="??"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=3, message="??"): actual.substring(44)=${actual.substring(44)}`);
      expect(actual.substring(44)).assertEqual('ed, code is 3, message is \u4e2d\u6587');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0160 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0161
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0161
     * @tc.desc      reportDrawnMessageOf(code=3, message="a") returns " failed, code is 3, message is a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0161 begin`);
      const actual: string = reportDrawnMessageOf(3, 'a');
      logInfo(`reportDrawnMessageOf(code=3, message="a"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(71);
      logInfo(`reportDrawnMessageOf(code=3, message="a"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=3, message="a"): actual.substring(39)=${actual.substring(39)}`);
      expect(actual.substring(39)).assertEqual(' failed, code is 3, message is a');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0161 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0162
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0162
     * @tc.desc      reportDrawnMessageOf(code=3, message="abc") returns "ailed, code is 3, message is abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0162 begin`);
      const actual: string = reportDrawnMessageOf(3, 'abc');
      logInfo(`reportDrawnMessageOf(code=3, message="abc"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(73);
      logInfo(`reportDrawnMessageOf(code=3, message="abc"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=3, message="abc"): actual.substring(41)=${actual.substring(41)}`);
      expect(actual.substring(41)).assertEqual('ailed, code is 3, message is abc');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0162 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0163
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0163
     * @tc.desc      reportDrawnMessageOf(code=3, message="Hello World") returns "ode is 3, message is Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0163 begin`);
      const actual: string = reportDrawnMessageOf(3, 'Hello World');
      logInfo(`reportDrawnMessageOf(code=3, message="Hel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(81);
      logInfo(`reportDrawnMessageOf(code=3, message="Hel...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=3, message="Hel...: actual.substring(49)=${actual.substring(49)}`);
      expect(actual.substring(49)).assertEqual('ode is 3, message is Hello World');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0163 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0164
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0164
     * @tc.desc      reportDrawnMessageOf(code=3, message="123") returns "ailed, code is 3, message is 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0164 begin`);
      const actual: string = reportDrawnMessageOf(3, '123');
      logInfo(`reportDrawnMessageOf(code=3, message="123"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(73);
      logInfo(`reportDrawnMessageOf(code=3, message="123"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=3, message="123"): actual.substring(41)=${actual.substring(41)}`);
      expect(actual.substring(41)).assertEqual('ailed, code is 3, message is 123');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0164 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0165
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0165
     * @tc.desc      reportDrawnMessageOf(code=3, message=" Hello ") returns "d, code is 3, message is  Hello "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0165 begin`);
      const actual: string = reportDrawnMessageOf(3, ' Hello ');
      logInfo(`reportDrawnMessageOf(code=3, message=" He...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(77);
      logInfo(`reportDrawnMessageOf(code=3, message=" He...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=3, message=" He...: actual.substring(45)=${actual.substring(45)}`);
      expect(actual.substring(45)).assertEqual('d, code is 3, message is  Hello ');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0165 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0166
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0166
     * @tc.desc      reportDrawnMessageOf(code=3, message="HelloHello") returns "code is 3, message is HelloHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0166 begin`);
      const actual: string = reportDrawnMessageOf(3, 'HelloHello');
      logInfo(`reportDrawnMessageOf(code=3, message="Hel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(80);
      logInfo(`reportDrawnMessageOf(code=3, message="Hel...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=3, message="Hel...: actual.substring(48)=${actual.substring(48)}`);
      expect(actual.substring(48)).assertEqual('code is 3, message is HelloHello');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0166 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0167
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0167
     * @tc.desc      reportDrawnMessageOf(code=3, message="Hello_1") returns "d, code is 3, message is Hello_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0167 begin`);
      const actual: string = reportDrawnMessageOf(3, 'Hello_1');
      logInfo(`reportDrawnMessageOf(code=3, message="Hel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(77);
      logInfo(`reportDrawnMessageOf(code=3, message="Hel...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=3, message="Hel...: actual.substring(45)=${actual.substring(45)}`);
      expect(actual.substring(45)).assertEqual('d, code is 3, message is Hello_1');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0167 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0168
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0168
     * @tc.desc      reportDrawnMessageOf(code=3, message="xHello") returns "ed, code is 3, message is xHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0168 begin`);
      const actual: string = reportDrawnMessageOf(3, 'xHello');
      logInfo(`reportDrawnMessageOf(code=3, message="xHe...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(76);
      logInfo(`reportDrawnMessageOf(code=3, message="xHe...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=3, message="xHe...: actual.substring(44)=${actual.substring(44)}`);
      expect(actual.substring(44)).assertEqual('ed, code is 3, message is xHello');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0168 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0169
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0169
     * @tc.desc      reportDrawnMessageOf(code=3, message=" hello world ") returns "e is 3, message is  hello world "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0169 begin`);
      const actual: string = reportDrawnMessageOf(3, ' hello world ');
      logInfo(`reportDrawnMessageOf(code=3, message=" he...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(83);
      logInfo(`reportDrawnMessageOf(code=3, message=" he...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=3, message=" he...: actual.substring(51)=${actual.substring(51)}`);
      expect(actual.substring(51)).assertEqual('e is 3, message is  hello world ');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0169 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0170
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0170
     * @tc.desc      reportDrawnMessageOf(code=3, message="hello world_1") returns "e is 3, message is hello world_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0170 begin`);
      const actual: string = reportDrawnMessageOf(3, 'hello world_1');
      logInfo(`reportDrawnMessageOf(code=3, message="hel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(83);
      logInfo(`reportDrawnMessageOf(code=3, message="hel...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=3, message="hel...: actual.substring(51)=${actual.substring(51)}`);
      expect(actual.substring(51)).assertEqual('e is 3, message is hello world_1');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0170 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0171
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0171
     * @tc.desc      reportDrawnMessageOf(code=3, message="xhello world") returns "de is 3, message is xhello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0171 begin`);
      const actual: string = reportDrawnMessageOf(3, 'xhello world');
      logInfo(`reportDrawnMessageOf(code=3, message="xhe...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(82);
      logInfo(`reportDrawnMessageOf(code=3, message="xhe...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=3, message="xhe...: actual.substring(50)=${actual.substring(50)}`);
      expect(actual.substring(50)).assertEqual('de is 3, message is xhello world');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0171 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0172
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0172
     * @tc.desc      reportDrawnMessageOf(code=3, message="   ") returns "ailed, code is 3, message is    "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0172 begin`);
      const actual: string = reportDrawnMessageOf(3, '   ');
      logInfo(`reportDrawnMessageOf(code=3, message="   "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(73);
      logInfo(`reportDrawnMessageOf(code=3, message="   "): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=3, message="   "): actual.substring(41)=${actual.substring(41)}`);
      expect(actual.substring(41)).assertEqual('ailed, code is 3, message is    ');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0172 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0173
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0173
     * @tc.desc      reportDrawnMessageOf(code=3, message="  ") returns "failed, code is 3, message is   "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0173 begin`);
      const actual: string = reportDrawnMessageOf(3, '  ');
      logInfo(`reportDrawnMessageOf(code=3, message="  "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(72);
      logInfo(`reportDrawnMessageOf(code=3, message="  "): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=3, message="  "): actual.substring(40)=${actual.substring(40)}`);
      expect(actual.substring(40)).assertEqual('failed, code is 3, message is   ');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0173 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0174
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0174
     * @tc.desc      reportDrawnMessageOf(code=10, message="Hello") returns "ed, code is 10, message is Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0174 begin`);
      const actual: string = reportDrawnMessageOf(10, 'Hello');
      logInfo(`reportDrawnMessageOf(code=10, message="He...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(76);
      logInfo(`reportDrawnMessageOf(code=10, message="He...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=10, message="He...: actual.substring(44)=${actual.substring(44)}`);
      expect(actual.substring(44)).assertEqual('ed, code is 10, message is Hello');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0174 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0175
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0175
     * @tc.desc      reportDrawnMessageOf(code=10, message="hello world") returns "de is 10, message is hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0175 begin`);
      const actual: string = reportDrawnMessageOf(10, 'hello world');
      logInfo(`reportDrawnMessageOf(code=10, message="he...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(82);
      logInfo(`reportDrawnMessageOf(code=10, message="he...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=10, message="he...: actual.substring(50)=${actual.substring(50)}`);
      expect(actual.substring(50)).assertEqual('de is 10, message is hello world');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0175 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0176
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0176
     * @tc.desc      reportDrawnMessageOf(code=10, message="") returns " failed, code is 10, message is "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0176 begin`);
      const actual: string = reportDrawnMessageOf(10, '');
      logInfo(`reportDrawnMessageOf(code=10, message=""): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(71);
      logInfo(`reportDrawnMessageOf(code=10, message=""): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=10, message=""): actual.substring(39)=${actual.substring(39)}`);
      expect(actual.substring(39)).assertEqual(' failed, code is 10, message is ');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0176 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0177
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0177
     * @tc.desc      reportDrawnMessageOf(code=10, message=" ") returns "failed, code is 10, message is  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0177 begin`);
      const actual: string = reportDrawnMessageOf(10, ' ');
      logInfo(`reportDrawnMessageOf(code=10, message=" "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(72);
      logInfo(`reportDrawnMessageOf(code=10, message=" "): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=10, message=" "): actual.substring(40)=${actual.substring(40)}`);
      expect(actual.substring(40)).assertEqual('failed, code is 10, message is  ');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0177 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0178
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0178
     * @tc.desc      reportDrawnMessageOf(code=10, message="A") returns "failed, code is 10, message is A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0178 begin`);
      const actual: string = reportDrawnMessageOf(10, 'A');
      logInfo(`reportDrawnMessageOf(code=10, message="A"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(72);
      logInfo(`reportDrawnMessageOf(code=10, message="A"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=10, message="A"): actual.substring(40)=${actual.substring(40)}`);
      expect(actual.substring(40)).assertEqual('failed, code is 10, message is A');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0178 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0179
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0179
     * @tc.desc      reportDrawnMessageOf(code=10, message="Sample Title 123") returns " 10, message is Sample Title ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0179 begin`);
      const actual: string = reportDrawnMessageOf(10, 'Sample Title 123');
      logInfo(`reportDrawnMessageOf(code=10, message="Sa...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(87);
      logInfo(`reportDrawnMessageOf(code=10, message="Sa...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=10, message="Sa...: actual.substring(55)=${actual.substring(55)}`);
      expect(actual.substring(55)).assertEqual(' 10, message is Sample Title 123');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0179 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0180
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0180
     * @tc.desc      reportDrawnMessageOf(code=10, message="??") returns "d, code is 10, message is ??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0180 begin`);
      const actual: string = reportDrawnMessageOf(10, '\u4e2d\u6587');
      logInfo(`reportDrawnMessageOf(code=10, message="??"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(73);
      logInfo(`reportDrawnMessageOf(code=10, message="??"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=10, message="??"): actual.substring(45)=${actual.substring(45)}`);
      expect(actual.substring(45)).assertEqual('d, code is 10, message is \u4e2d\u6587');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0180 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0181
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0181
     * @tc.desc      reportDrawnMessageOf(code=10, message="a") returns "failed, code is 10, message is a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0181 begin`);
      const actual: string = reportDrawnMessageOf(10, 'a');
      logInfo(`reportDrawnMessageOf(code=10, message="a"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(72);
      logInfo(`reportDrawnMessageOf(code=10, message="a"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=10, message="a"): actual.substring(40)=${actual.substring(40)}`);
      expect(actual.substring(40)).assertEqual('failed, code is 10, message is a');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0181 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0182
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0182
     * @tc.desc      reportDrawnMessageOf(code=10, message="abc") returns "iled, code is 10, message is abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0182 begin`);
      const actual: string = reportDrawnMessageOf(10, 'abc');
      logInfo(`reportDrawnMessageOf(code=10, message="abc"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(74);
      logInfo(`reportDrawnMessageOf(code=10, message="abc"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=10, message="abc"): actual.substring(42)=${actual.substring(42)}`);
      expect(actual.substring(42)).assertEqual('iled, code is 10, message is abc');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0182 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0183
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0183
     * @tc.desc      reportDrawnMessageOf(code=10, message="Hello World") returns "de is 10, message is Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0183 begin`);
      const actual: string = reportDrawnMessageOf(10, 'Hello World');
      logInfo(`reportDrawnMessageOf(code=10, message="He...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(82);
      logInfo(`reportDrawnMessageOf(code=10, message="He...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=10, message="He...: actual.substring(50)=${actual.substring(50)}`);
      expect(actual.substring(50)).assertEqual('de is 10, message is Hello World');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0183 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0184
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0184
     * @tc.desc      reportDrawnMessageOf(code=10, message="123") returns "iled, code is 10, message is 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0184 begin`);
      const actual: string = reportDrawnMessageOf(10, '123');
      logInfo(`reportDrawnMessageOf(code=10, message="123"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(74);
      logInfo(`reportDrawnMessageOf(code=10, message="123"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=10, message="123"): actual.substring(42)=${actual.substring(42)}`);
      expect(actual.substring(42)).assertEqual('iled, code is 10, message is 123');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0184 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0185
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0185
     * @tc.desc      reportDrawnMessageOf(code=10, message=" Hello ") returns ", code is 10, message is  Hello "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0185 begin`);
      const actual: string = reportDrawnMessageOf(10, ' Hello ');
      logInfo(`reportDrawnMessageOf(code=10, message=" H...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(78);
      logInfo(`reportDrawnMessageOf(code=10, message=" H...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=10, message=" H...: actual.substring(46)=${actual.substring(46)}`);
      expect(actual.substring(46)).assertEqual(', code is 10, message is  Hello ');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0185 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0186
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0186
     * @tc.desc      reportDrawnMessageOf(code=10, message="HelloHello") returns "ode is 10, message is HelloHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0186 begin`);
      const actual: string = reportDrawnMessageOf(10, 'HelloHello');
      logInfo(`reportDrawnMessageOf(code=10, message="He...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(81);
      logInfo(`reportDrawnMessageOf(code=10, message="He...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=10, message="He...: actual.substring(49)=${actual.substring(49)}`);
      expect(actual.substring(49)).assertEqual('ode is 10, message is HelloHello');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0186 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0187
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0187
     * @tc.desc      reportDrawnMessageOf(code=10, message="Hello_1") returns ", code is 10, message is Hello_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0187 begin`);
      const actual: string = reportDrawnMessageOf(10, 'Hello_1');
      logInfo(`reportDrawnMessageOf(code=10, message="He...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(78);
      logInfo(`reportDrawnMessageOf(code=10, message="He...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=10, message="He...: actual.substring(46)=${actual.substring(46)}`);
      expect(actual.substring(46)).assertEqual(', code is 10, message is Hello_1');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0187 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0188
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0188
     * @tc.desc      reportDrawnMessageOf(code=10, message="xHello") returns "d, code is 10, message is xHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0188 begin`);
      const actual: string = reportDrawnMessageOf(10, 'xHello');
      logInfo(`reportDrawnMessageOf(code=10, message="xH...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(77);
      logInfo(`reportDrawnMessageOf(code=10, message="xH...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=10, message="xH...: actual.substring(45)=${actual.substring(45)}`);
      expect(actual.substring(45)).assertEqual('d, code is 10, message is xHello');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0188 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0189
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0189
     * @tc.desc      reportDrawnMessageOf(code=10, message=" hello world ") returns " is 10, message is  hello world "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0189 begin`);
      const actual: string = reportDrawnMessageOf(10, ' hello world ');
      logInfo(`reportDrawnMessageOf(code=10, message=" h...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(84);
      logInfo(`reportDrawnMessageOf(code=10, message=" h...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=10, message=" h...: actual.substring(52)=${actual.substring(52)}`);
      expect(actual.substring(52)).assertEqual(' is 10, message is  hello world ');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0189 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0190
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0190
     * @tc.desc      reportDrawnMessageOf(code=10, message="hello world_1") returns " is 10, message is hello world_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0190 begin`);
      const actual: string = reportDrawnMessageOf(10, 'hello world_1');
      logInfo(`reportDrawnMessageOf(code=10, message="he...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(84);
      logInfo(`reportDrawnMessageOf(code=10, message="he...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=10, message="he...: actual.substring(52)=${actual.substring(52)}`);
      expect(actual.substring(52)).assertEqual(' is 10, message is hello world_1');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0190 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0191
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0191
     * @tc.desc      reportDrawnMessageOf(code=10, message="xhello world") returns "e is 10, message is xhello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0191 begin`);
      const actual: string = reportDrawnMessageOf(10, 'xhello world');
      logInfo(`reportDrawnMessageOf(code=10, message="xh...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(83);
      logInfo(`reportDrawnMessageOf(code=10, message="xh...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=10, message="xh...: actual.substring(51)=${actual.substring(51)}`);
      expect(actual.substring(51)).assertEqual('e is 10, message is xhello world');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0191 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0192
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0192
     * @tc.desc      reportDrawnMessageOf(code=10, message="   ") returns "iled, code is 10, message is    "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0192 begin`);
      const actual: string = reportDrawnMessageOf(10, '   ');
      logInfo(`reportDrawnMessageOf(code=10, message="   "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(74);
      logInfo(`reportDrawnMessageOf(code=10, message="   "): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=10, message="   "): actual.substring(42)=${actual.substring(42)}`);
      expect(actual.substring(42)).assertEqual('iled, code is 10, message is    ');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0192 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0193
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0193
     * @tc.desc      reportDrawnMessageOf(code=10, message="  ") returns "ailed, code is 10, message is   "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0193 begin`);
      const actual: string = reportDrawnMessageOf(10, '  ');
      logInfo(`reportDrawnMessageOf(code=10, message="  "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(73);
      logInfo(`reportDrawnMessageOf(code=10, message="  "): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=10, message="  "): actual.substring(41)=${actual.substring(41)}`);
      expect(actual.substring(41)).assertEqual('ailed, code is 10, message is   ');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0193 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0194
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0194
     * @tc.desc      reportDrawnMessageOf(code=100, message="Hello") returns "d, code is 100, message is Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0194 begin`);
      const actual: string = reportDrawnMessageOf(100, 'Hello');
      logInfo(`reportDrawnMessageOf(code=100, message="H...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(77);
      logInfo(`reportDrawnMessageOf(code=100, message="H...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=100, message="H...: actual.substring(45)=${actual.substring(45)}`);
      expect(actual.substring(45)).assertEqual('d, code is 100, message is Hello');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0194 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0195
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0195
     * @tc.desc      reportDrawnMessageOf(code=100, message="hello world") returns "e is 100, message is hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0195 begin`);
      const actual: string = reportDrawnMessageOf(100, 'hello world');
      logInfo(`reportDrawnMessageOf(code=100, message="h...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(83);
      logInfo(`reportDrawnMessageOf(code=100, message="h...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=100, message="h...: actual.substring(51)=${actual.substring(51)}`);
      expect(actual.substring(51)).assertEqual('e is 100, message is hello world');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0195 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0196
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0196
     * @tc.desc      reportDrawnMessageOf(code=100, message="") returns "failed, code is 100, message is "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0196 begin`);
      const actual: string = reportDrawnMessageOf(100, '');
      logInfo(`reportDrawnMessageOf(code=100, message=""): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(72);
      logInfo(`reportDrawnMessageOf(code=100, message=""): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=100, message=""): actual.substring(40)=${actual.substring(40)}`);
      expect(actual.substring(40)).assertEqual('failed, code is 100, message is ');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0196 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0197
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0197
     * @tc.desc      reportDrawnMessageOf(code=100, message=" ") returns "ailed, code is 100, message is  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0197 begin`);
      const actual: string = reportDrawnMessageOf(100, ' ');
      logInfo(`reportDrawnMessageOf(code=100, message=" "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(73);
      logInfo(`reportDrawnMessageOf(code=100, message=" "): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=100, message=" "): actual.substring(41)=${actual.substring(41)}`);
      expect(actual.substring(41)).assertEqual('ailed, code is 100, message is  ');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0197 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0198
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0198
     * @tc.desc      reportDrawnMessageOf(code=100, message="A") returns "ailed, code is 100, message is A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0198 begin`);
      const actual: string = reportDrawnMessageOf(100, 'A');
      logInfo(`reportDrawnMessageOf(code=100, message="A"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(73);
      logInfo(`reportDrawnMessageOf(code=100, message="A"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=100, message="A"): actual.substring(41)=${actual.substring(41)}`);
      expect(actual.substring(41)).assertEqual('ailed, code is 100, message is A');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0198 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0199
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0199
     * @tc.desc      reportDrawnMessageOf(code=100, message="Sample Title 123") returns "100, message is Sample Title...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0199 begin`);
      const actual: string = reportDrawnMessageOf(100, 'Sample Title 123');
      logInfo(`reportDrawnMessageOf(code=100, message="S...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(88);
      logInfo(`reportDrawnMessageOf(code=100, message="S...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=100, message="S...: actual.substring(56)=${actual.substring(56)}`);
      expect(actual.substring(56)).assertEqual('100, message is Sample Title 123');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0199 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0200
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0200
     * @tc.desc      reportDrawnMessageOf(code=100, message="??") returns ", code is 100, message is ??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0200 begin`);
      const actual: string = reportDrawnMessageOf(100, '\u4e2d\u6587');
      logInfo(`reportDrawnMessageOf(code=100, message="??"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(74);
      logInfo(`reportDrawnMessageOf(code=100, message="??"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=100, message="??"): actual.substring(46)=${actual.substring(46)}`);
      expect(actual.substring(46)).assertEqual(', code is 100, message is \u4e2d\u6587');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0200 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0201
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0201
     * @tc.desc      reportDrawnMessageOf(code=100, message="a") returns "ailed, code is 100, message is a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0201 begin`);
      const actual: string = reportDrawnMessageOf(100, 'a');
      logInfo(`reportDrawnMessageOf(code=100, message="a"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(73);
      logInfo(`reportDrawnMessageOf(code=100, message="a"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=100, message="a"): actual.substring(41)=${actual.substring(41)}`);
      expect(actual.substring(41)).assertEqual('ailed, code is 100, message is a');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0201 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0202
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0202
     * @tc.desc      reportDrawnMessageOf(code=100, message="abc") returns "led, code is 100, message is abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0202 begin`);
      const actual: string = reportDrawnMessageOf(100, 'abc');
      logInfo(`reportDrawnMessageOf(code=100, message="a...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(75);
      logInfo(`reportDrawnMessageOf(code=100, message="a...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=100, message="a...: actual.substring(43)=${actual.substring(43)}`);
      expect(actual.substring(43)).assertEqual('led, code is 100, message is abc');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0202 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0203
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0203
     * @tc.desc      reportDrawnMessageOf(code=100, message="Hello World") returns "e is 100, message is Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0203 begin`);
      const actual: string = reportDrawnMessageOf(100, 'Hello World');
      logInfo(`reportDrawnMessageOf(code=100, message="H...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(83);
      logInfo(`reportDrawnMessageOf(code=100, message="H...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=100, message="H...: actual.substring(51)=${actual.substring(51)}`);
      expect(actual.substring(51)).assertEqual('e is 100, message is Hello World');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0203 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0204
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0204
     * @tc.desc      reportDrawnMessageOf(code=100, message="123") returns "led, code is 100, message is 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0204 begin`);
      const actual: string = reportDrawnMessageOf(100, '123');
      logInfo(`reportDrawnMessageOf(code=100, message="1...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(75);
      logInfo(`reportDrawnMessageOf(code=100, message="1...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=100, message="1...: actual.substring(43)=${actual.substring(43)}`);
      expect(actual.substring(43)).assertEqual('led, code is 100, message is 123');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0204 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0205
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0205
     * @tc.desc      reportDrawnMessageOf(code=100, message=" Hello ") returns " code is 100, message is  Hello "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0205 begin`);
      const actual: string = reportDrawnMessageOf(100, ' Hello ');
      logInfo(`reportDrawnMessageOf(code=100, message=" ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(79);
      logInfo(`reportDrawnMessageOf(code=100, message=" ...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=100, message=" ...: actual.substring(47)=${actual.substring(47)}`);
      expect(actual.substring(47)).assertEqual(' code is 100, message is  Hello ');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0205 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0206
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0206
     * @tc.desc      reportDrawnMessageOf(code=100, message="HelloHello") returns "de is 100, message is HelloHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0206 begin`);
      const actual: string = reportDrawnMessageOf(100, 'HelloHello');
      logInfo(`reportDrawnMessageOf(code=100, message="H...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(82);
      logInfo(`reportDrawnMessageOf(code=100, message="H...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=100, message="H...: actual.substring(50)=${actual.substring(50)}`);
      expect(actual.substring(50)).assertEqual('de is 100, message is HelloHello');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0206 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0207
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0207
     * @tc.desc      reportDrawnMessageOf(code=100, message="Hello_1") returns " code is 100, message is Hello_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0207 begin`);
      const actual: string = reportDrawnMessageOf(100, 'Hello_1');
      logInfo(`reportDrawnMessageOf(code=100, message="H...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(79);
      logInfo(`reportDrawnMessageOf(code=100, message="H...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=100, message="H...: actual.substring(47)=${actual.substring(47)}`);
      expect(actual.substring(47)).assertEqual(' code is 100, message is Hello_1');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0207 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0208
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0208
     * @tc.desc      reportDrawnMessageOf(code=100, message="xHello") returns ", code is 100, message is xHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0208 begin`);
      const actual: string = reportDrawnMessageOf(100, 'xHello');
      logInfo(`reportDrawnMessageOf(code=100, message="x...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(78);
      logInfo(`reportDrawnMessageOf(code=100, message="x...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=100, message="x...: actual.substring(46)=${actual.substring(46)}`);
      expect(actual.substring(46)).assertEqual(', code is 100, message is xHello');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0208 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0209
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0209
     * @tc.desc      reportDrawnMessageOf(code=100, message=" hello world ") returns "is 100, message is  hello world "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0209 begin`);
      const actual: string = reportDrawnMessageOf(100, ' hello world ');
      logInfo(`reportDrawnMessageOf(code=100, message=" ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(85);
      logInfo(`reportDrawnMessageOf(code=100, message=" ...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=100, message=" ...: actual.substring(53)=${actual.substring(53)}`);
      expect(actual.substring(53)).assertEqual('is 100, message is  hello world ');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0209 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0210
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0210
     * @tc.desc      reportDrawnMessageOf(code=100, message="hello world_1") returns "is 100, message is hello world_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0210 begin`);
      const actual: string = reportDrawnMessageOf(100, 'hello world_1');
      logInfo(`reportDrawnMessageOf(code=100, message="h...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(85);
      logInfo(`reportDrawnMessageOf(code=100, message="h...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=100, message="h...: actual.substring(53)=${actual.substring(53)}`);
      expect(actual.substring(53)).assertEqual('is 100, message is hello world_1');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0210 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0211
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0211
     * @tc.desc      reportDrawnMessageOf(code=100, message="xhello world") returns " is 100, message is xhello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0211 begin`);
      const actual: string = reportDrawnMessageOf(100, 'xhello world');
      logInfo(`reportDrawnMessageOf(code=100, message="x...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(84);
      logInfo(`reportDrawnMessageOf(code=100, message="x...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=100, message="x...: actual.substring(52)=${actual.substring(52)}`);
      expect(actual.substring(52)).assertEqual(' is 100, message is xhello world');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0211 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0212
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0212
     * @tc.desc      reportDrawnMessageOf(code=100, message="   ") returns "led, code is 100, message is    "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0212 begin`);
      const actual: string = reportDrawnMessageOf(100, '   ');
      logInfo(`reportDrawnMessageOf(code=100, message=" ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(75);
      logInfo(`reportDrawnMessageOf(code=100, message=" ...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=100, message=" ...: actual.substring(43)=${actual.substring(43)}`);
      expect(actual.substring(43)).assertEqual('led, code is 100, message is    ');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0212 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0213
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0213
     * @tc.desc      reportDrawnMessageOf(code=100, message="  ") returns "iled, code is 100, message is   "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0213 begin`);
      const actual: string = reportDrawnMessageOf(100, '  ');
      logInfo(`reportDrawnMessageOf(code=100, message="  "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(74);
      logInfo(`reportDrawnMessageOf(code=100, message="  "): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=100, message="  "): actual.substring(42)=${actual.substring(42)}`);
      expect(actual.substring(42)).assertEqual('iled, code is 100, message is   ');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0213 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0214
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0214
     * @tc.desc      reportDrawnMessageOf(code=25, message="Hello") returns "ed, code is 25, message is Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0214 begin`);
      const actual: string = reportDrawnMessageOf(25, 'Hello');
      logInfo(`reportDrawnMessageOf(code=25, message="He...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(76);
      logInfo(`reportDrawnMessageOf(code=25, message="He...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=25, message="He...: actual.substring(44)=${actual.substring(44)}`);
      expect(actual.substring(44)).assertEqual('ed, code is 25, message is Hello');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0214 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0215
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0215
     * @tc.desc      reportDrawnMessageOf(code=25, message="hello world") returns "de is 25, message is hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0215 begin`);
      const actual: string = reportDrawnMessageOf(25, 'hello world');
      logInfo(`reportDrawnMessageOf(code=25, message="he...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(82);
      logInfo(`reportDrawnMessageOf(code=25, message="he...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=25, message="he...: actual.substring(50)=${actual.substring(50)}`);
      expect(actual.substring(50)).assertEqual('de is 25, message is hello world');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0215 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0216
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0216
     * @tc.desc      reportDrawnMessageOf(code=25, message="") returns " failed, code is 25, message is "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0216 begin`);
      const actual: string = reportDrawnMessageOf(25, '');
      logInfo(`reportDrawnMessageOf(code=25, message=""): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(71);
      logInfo(`reportDrawnMessageOf(code=25, message=""): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=25, message=""): actual.substring(39)=${actual.substring(39)}`);
      expect(actual.substring(39)).assertEqual(' failed, code is 25, message is ');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0216 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0217
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0217
     * @tc.desc      reportDrawnMessageOf(code=25, message=" ") returns "failed, code is 25, message is  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0217 begin`);
      const actual: string = reportDrawnMessageOf(25, ' ');
      logInfo(`reportDrawnMessageOf(code=25, message=" "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(72);
      logInfo(`reportDrawnMessageOf(code=25, message=" "): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=25, message=" "): actual.substring(40)=${actual.substring(40)}`);
      expect(actual.substring(40)).assertEqual('failed, code is 25, message is  ');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0217 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0218
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0218
     * @tc.desc      reportDrawnMessageOf(code=25, message="A") returns "failed, code is 25, message is A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0218 begin`);
      const actual: string = reportDrawnMessageOf(25, 'A');
      logInfo(`reportDrawnMessageOf(code=25, message="A"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(72);
      logInfo(`reportDrawnMessageOf(code=25, message="A"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=25, message="A"): actual.substring(40)=${actual.substring(40)}`);
      expect(actual.substring(40)).assertEqual('failed, code is 25, message is A');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0218 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0219
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0219
     * @tc.desc      reportDrawnMessageOf(code=25, message="Sample Title 123") returns " 25, message is Sample Title ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0219 begin`);
      const actual: string = reportDrawnMessageOf(25, 'Sample Title 123');
      logInfo(`reportDrawnMessageOf(code=25, message="Sa...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(87);
      logInfo(`reportDrawnMessageOf(code=25, message="Sa...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=25, message="Sa...: actual.substring(55)=${actual.substring(55)}`);
      expect(actual.substring(55)).assertEqual(' 25, message is Sample Title 123');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0219 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0220
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0220
     * @tc.desc      reportDrawnMessageOf(code=25, message="??") returns "d, code is 25, message is ??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0220 begin`);
      const actual: string = reportDrawnMessageOf(25, '\u4e2d\u6587');
      logInfo(`reportDrawnMessageOf(code=25, message="??"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(73);
      logInfo(`reportDrawnMessageOf(code=25, message="??"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=25, message="??"): actual.substring(45)=${actual.substring(45)}`);
      expect(actual.substring(45)).assertEqual('d, code is 25, message is \u4e2d\u6587');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0220 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0221
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0221
     * @tc.desc      reportDrawnMessageOf(code=25, message="a") returns "failed, code is 25, message is a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0221 begin`);
      const actual: string = reportDrawnMessageOf(25, 'a');
      logInfo(`reportDrawnMessageOf(code=25, message="a"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(72);
      logInfo(`reportDrawnMessageOf(code=25, message="a"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=25, message="a"): actual.substring(40)=${actual.substring(40)}`);
      expect(actual.substring(40)).assertEqual('failed, code is 25, message is a');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0221 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0222
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0222
     * @tc.desc      reportDrawnMessageOf(code=25, message="abc") returns "iled, code is 25, message is abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0222 begin`);
      const actual: string = reportDrawnMessageOf(25, 'abc');
      logInfo(`reportDrawnMessageOf(code=25, message="abc"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(74);
      logInfo(`reportDrawnMessageOf(code=25, message="abc"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=25, message="abc"): actual.substring(42)=${actual.substring(42)}`);
      expect(actual.substring(42)).assertEqual('iled, code is 25, message is abc');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0222 end`);
    });
  });
}
