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

/** Logic checks for reportDrawnMessageOf (77 cases). */
export default function reportDrawnMessageOf2Test(): void {
  describe('ReportDrawnMessageOf2Test', () => {
    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0078
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0078
     * @tc.desc      reportDrawnMessageOf(code=401, message="A") returns "ailed, code is 401, message is A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0078 begin`);
      const actual: string = reportDrawnMessageOf(401, 'A');
      logInfo(`reportDrawnMessageOf(code=401, message="A"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(73);
      logInfo(`reportDrawnMessageOf(code=401, message="A"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=401, message="A"): actual.substring(41)=${actual.substring(41)}`);
      expect(actual.substring(41)).assertEqual('ailed, code is 401, message is A');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0078 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0079
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0079
     * @tc.desc      reportDrawnMessageOf(code=401, message="Sample Title 123") returns "401, message is Sample Title...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0079 begin`);
      const actual: string = reportDrawnMessageOf(401, 'Sample Title 123');
      logInfo(`reportDrawnMessageOf(code=401, message="S...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(88);
      logInfo(`reportDrawnMessageOf(code=401, message="S...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=401, message="S...: actual.substring(56)=${actual.substring(56)}`);
      expect(actual.substring(56)).assertEqual('401, message is Sample Title 123');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0079 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0080
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0080
     * @tc.desc      reportDrawnMessageOf(code=401, message="??") returns ", code is 401, message is ??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0080 begin`);
      const actual: string = reportDrawnMessageOf(401, '\u4e2d\u6587');
      logInfo(`reportDrawnMessageOf(code=401, message="??"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(74);
      logInfo(`reportDrawnMessageOf(code=401, message="??"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=401, message="??"): actual.substring(46)=${actual.substring(46)}`);
      expect(actual.substring(46)).assertEqual(', code is 401, message is \u4e2d\u6587');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0080 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0081
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0081
     * @tc.desc      reportDrawnMessageOf(code=401, message="a") returns "ailed, code is 401, message is a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0081 begin`);
      const actual: string = reportDrawnMessageOf(401, 'a');
      logInfo(`reportDrawnMessageOf(code=401, message="a"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(73);
      logInfo(`reportDrawnMessageOf(code=401, message="a"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=401, message="a"): actual.substring(41)=${actual.substring(41)}`);
      expect(actual.substring(41)).assertEqual('ailed, code is 401, message is a');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0081 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0082
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0082
     * @tc.desc      reportDrawnMessageOf(code=401, message="abc") returns "led, code is 401, message is abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0082 begin`);
      const actual: string = reportDrawnMessageOf(401, 'abc');
      logInfo(`reportDrawnMessageOf(code=401, message="a...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(75);
      logInfo(`reportDrawnMessageOf(code=401, message="a...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=401, message="a...: actual.substring(43)=${actual.substring(43)}`);
      expect(actual.substring(43)).assertEqual('led, code is 401, message is abc');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0082 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0083
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0083
     * @tc.desc      reportDrawnMessageOf(code=401, message="Hello World") returns "e is 401, message is Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0083 begin`);
      const actual: string = reportDrawnMessageOf(401, 'Hello World');
      logInfo(`reportDrawnMessageOf(code=401, message="H...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(83);
      logInfo(`reportDrawnMessageOf(code=401, message="H...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=401, message="H...: actual.substring(51)=${actual.substring(51)}`);
      expect(actual.substring(51)).assertEqual('e is 401, message is Hello World');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0083 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0084
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0084
     * @tc.desc      reportDrawnMessageOf(code=401, message="123") returns "led, code is 401, message is 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0084 begin`);
      const actual: string = reportDrawnMessageOf(401, '123');
      logInfo(`reportDrawnMessageOf(code=401, message="1...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(75);
      logInfo(`reportDrawnMessageOf(code=401, message="1...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=401, message="1...: actual.substring(43)=${actual.substring(43)}`);
      expect(actual.substring(43)).assertEqual('led, code is 401, message is 123');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0084 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0085
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0085
     * @tc.desc      reportDrawnMessageOf(code=401, message=" Hello ") returns " code is 401, message is  Hello "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0085 begin`);
      const actual: string = reportDrawnMessageOf(401, ' Hello ');
      logInfo(`reportDrawnMessageOf(code=401, message=" ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(79);
      logInfo(`reportDrawnMessageOf(code=401, message=" ...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=401, message=" ...: actual.substring(47)=${actual.substring(47)}`);
      expect(actual.substring(47)).assertEqual(' code is 401, message is  Hello ');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0085 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0086
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0086
     * @tc.desc      reportDrawnMessageOf(code=401, message="HelloHello") returns "de is 401, message is HelloHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0086 begin`);
      const actual: string = reportDrawnMessageOf(401, 'HelloHello');
      logInfo(`reportDrawnMessageOf(code=401, message="H...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(82);
      logInfo(`reportDrawnMessageOf(code=401, message="H...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=401, message="H...: actual.substring(50)=${actual.substring(50)}`);
      expect(actual.substring(50)).assertEqual('de is 401, message is HelloHello');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0086 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0087
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0087
     * @tc.desc      reportDrawnMessageOf(code=401, message="Hello_1") returns " code is 401, message is Hello_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0087 begin`);
      const actual: string = reportDrawnMessageOf(401, 'Hello_1');
      logInfo(`reportDrawnMessageOf(code=401, message="H...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(79);
      logInfo(`reportDrawnMessageOf(code=401, message="H...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=401, message="H...: actual.substring(47)=${actual.substring(47)}`);
      expect(actual.substring(47)).assertEqual(' code is 401, message is Hello_1');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0087 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0088
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0088
     * @tc.desc      reportDrawnMessageOf(code=401, message="xHello") returns ", code is 401, message is xHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0088 begin`);
      const actual: string = reportDrawnMessageOf(401, 'xHello');
      logInfo(`reportDrawnMessageOf(code=401, message="x...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(78);
      logInfo(`reportDrawnMessageOf(code=401, message="x...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=401, message="x...: actual.substring(46)=${actual.substring(46)}`);
      expect(actual.substring(46)).assertEqual(', code is 401, message is xHello');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0088 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0089
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0089
     * @tc.desc      reportDrawnMessageOf(code=401, message=" hello world ") returns "is 401, message is  hello world "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0089 begin`);
      const actual: string = reportDrawnMessageOf(401, ' hello world ');
      logInfo(`reportDrawnMessageOf(code=401, message=" ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(85);
      logInfo(`reportDrawnMessageOf(code=401, message=" ...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=401, message=" ...: actual.substring(53)=${actual.substring(53)}`);
      expect(actual.substring(53)).assertEqual('is 401, message is  hello world ');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0089 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0090
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0090
     * @tc.desc      reportDrawnMessageOf(code=401, message="hello world_1") returns "is 401, message is hello world_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0090 begin`);
      const actual: string = reportDrawnMessageOf(401, 'hello world_1');
      logInfo(`reportDrawnMessageOf(code=401, message="h...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(85);
      logInfo(`reportDrawnMessageOf(code=401, message="h...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=401, message="h...: actual.substring(53)=${actual.substring(53)}`);
      expect(actual.substring(53)).assertEqual('is 401, message is hello world_1');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0090 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0091
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0091
     * @tc.desc      reportDrawnMessageOf(code=401, message="xhello world") returns " is 401, message is xhello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0091 begin`);
      const actual: string = reportDrawnMessageOf(401, 'xhello world');
      logInfo(`reportDrawnMessageOf(code=401, message="x...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(84);
      logInfo(`reportDrawnMessageOf(code=401, message="x...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=401, message="x...: actual.substring(52)=${actual.substring(52)}`);
      expect(actual.substring(52)).assertEqual(' is 401, message is xhello world');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0091 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0092
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0092
     * @tc.desc      reportDrawnMessageOf(code=401, message="   ") returns "led, code is 401, message is    "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0092 begin`);
      const actual: string = reportDrawnMessageOf(401, '   ');
      logInfo(`reportDrawnMessageOf(code=401, message=" ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(75);
      logInfo(`reportDrawnMessageOf(code=401, message=" ...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=401, message=" ...: actual.substring(43)=${actual.substring(43)}`);
      expect(actual.substring(43)).assertEqual('led, code is 401, message is    ');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0092 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0093
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0093
     * @tc.desc      reportDrawnMessageOf(code=401, message="  ") returns "iled, code is 401, message is   "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0093 begin`);
      const actual: string = reportDrawnMessageOf(401, '  ');
      logInfo(`reportDrawnMessageOf(code=401, message="  "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(74);
      logInfo(`reportDrawnMessageOf(code=401, message="  "): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=401, message="  "): actual.substring(42)=${actual.substring(42)}`);
      expect(actual.substring(42)).assertEqual('iled, code is 401, message is   ');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0093 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0094
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0094
     * @tc.desc      reportDrawnMessageOf(code=404, message="Hello") returns "d, code is 404, message is Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0094 begin`);
      const actual: string = reportDrawnMessageOf(404, 'Hello');
      logInfo(`reportDrawnMessageOf(code=404, message="H...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(77);
      logInfo(`reportDrawnMessageOf(code=404, message="H...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=404, message="H...: actual.substring(45)=${actual.substring(45)}`);
      expect(actual.substring(45)).assertEqual('d, code is 404, message is Hello');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0094 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0095
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0095
     * @tc.desc      reportDrawnMessageOf(code=404, message="hello world") returns "e is 404, message is hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0095 begin`);
      const actual: string = reportDrawnMessageOf(404, 'hello world');
      logInfo(`reportDrawnMessageOf(code=404, message="h...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(83);
      logInfo(`reportDrawnMessageOf(code=404, message="h...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=404, message="h...: actual.substring(51)=${actual.substring(51)}`);
      expect(actual.substring(51)).assertEqual('e is 404, message is hello world');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0095 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0096
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0096
     * @tc.desc      reportDrawnMessageOf(code=404, message="") returns "failed, code is 404, message is "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0096 begin`);
      const actual: string = reportDrawnMessageOf(404, '');
      logInfo(`reportDrawnMessageOf(code=404, message=""): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(72);
      logInfo(`reportDrawnMessageOf(code=404, message=""): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=404, message=""): actual.substring(40)=${actual.substring(40)}`);
      expect(actual.substring(40)).assertEqual('failed, code is 404, message is ');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0096 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0097
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0097
     * @tc.desc      reportDrawnMessageOf(code=404, message=" ") returns "ailed, code is 404, message is  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0097 begin`);
      const actual: string = reportDrawnMessageOf(404, ' ');
      logInfo(`reportDrawnMessageOf(code=404, message=" "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(73);
      logInfo(`reportDrawnMessageOf(code=404, message=" "): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=404, message=" "): actual.substring(41)=${actual.substring(41)}`);
      expect(actual.substring(41)).assertEqual('ailed, code is 404, message is  ');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0097 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0098
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0098
     * @tc.desc      reportDrawnMessageOf(code=404, message="A") returns "ailed, code is 404, message is A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0098 begin`);
      const actual: string = reportDrawnMessageOf(404, 'A');
      logInfo(`reportDrawnMessageOf(code=404, message="A"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(73);
      logInfo(`reportDrawnMessageOf(code=404, message="A"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=404, message="A"): actual.substring(41)=${actual.substring(41)}`);
      expect(actual.substring(41)).assertEqual('ailed, code is 404, message is A');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0098 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0099
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0099
     * @tc.desc      reportDrawnMessageOf(code=404, message="Sample Title 123") returns "404, message is Sample Title...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0099 begin`);
      const actual: string = reportDrawnMessageOf(404, 'Sample Title 123');
      logInfo(`reportDrawnMessageOf(code=404, message="S...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(88);
      logInfo(`reportDrawnMessageOf(code=404, message="S...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=404, message="S...: actual.substring(56)=${actual.substring(56)}`);
      expect(actual.substring(56)).assertEqual('404, message is Sample Title 123');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0099 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0100
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0100
     * @tc.desc      reportDrawnMessageOf(code=404, message="??") returns ", code is 404, message is ??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0100 begin`);
      const actual: string = reportDrawnMessageOf(404, '\u4e2d\u6587');
      logInfo(`reportDrawnMessageOf(code=404, message="??"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(74);
      logInfo(`reportDrawnMessageOf(code=404, message="??"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=404, message="??"): actual.substring(46)=${actual.substring(46)}`);
      expect(actual.substring(46)).assertEqual(', code is 404, message is \u4e2d\u6587');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0100 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0101
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0101
     * @tc.desc      reportDrawnMessageOf(code=404, message="a") returns "ailed, code is 404, message is a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0101 begin`);
      const actual: string = reportDrawnMessageOf(404, 'a');
      logInfo(`reportDrawnMessageOf(code=404, message="a"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(73);
      logInfo(`reportDrawnMessageOf(code=404, message="a"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=404, message="a"): actual.substring(41)=${actual.substring(41)}`);
      expect(actual.substring(41)).assertEqual('ailed, code is 404, message is a');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0101 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0102
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0102
     * @tc.desc      reportDrawnMessageOf(code=404, message="abc") returns "led, code is 404, message is abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0102 begin`);
      const actual: string = reportDrawnMessageOf(404, 'abc');
      logInfo(`reportDrawnMessageOf(code=404, message="a...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(75);
      logInfo(`reportDrawnMessageOf(code=404, message="a...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=404, message="a...: actual.substring(43)=${actual.substring(43)}`);
      expect(actual.substring(43)).assertEqual('led, code is 404, message is abc');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0102 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0103
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0103
     * @tc.desc      reportDrawnMessageOf(code=404, message="Hello World") returns "e is 404, message is Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0103 begin`);
      const actual: string = reportDrawnMessageOf(404, 'Hello World');
      logInfo(`reportDrawnMessageOf(code=404, message="H...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(83);
      logInfo(`reportDrawnMessageOf(code=404, message="H...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=404, message="H...: actual.substring(51)=${actual.substring(51)}`);
      expect(actual.substring(51)).assertEqual('e is 404, message is Hello World');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0103 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0104
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0104
     * @tc.desc      reportDrawnMessageOf(code=404, message="123") returns "led, code is 404, message is 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0104 begin`);
      const actual: string = reportDrawnMessageOf(404, '123');
      logInfo(`reportDrawnMessageOf(code=404, message="1...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(75);
      logInfo(`reportDrawnMessageOf(code=404, message="1...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=404, message="1...: actual.substring(43)=${actual.substring(43)}`);
      expect(actual.substring(43)).assertEqual('led, code is 404, message is 123');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0104 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0105
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0105
     * @tc.desc      reportDrawnMessageOf(code=404, message=" Hello ") returns " code is 404, message is  Hello "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0105 begin`);
      const actual: string = reportDrawnMessageOf(404, ' Hello ');
      logInfo(`reportDrawnMessageOf(code=404, message=" ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(79);
      logInfo(`reportDrawnMessageOf(code=404, message=" ...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=404, message=" ...: actual.substring(47)=${actual.substring(47)}`);
      expect(actual.substring(47)).assertEqual(' code is 404, message is  Hello ');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0105 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0106
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0106
     * @tc.desc      reportDrawnMessageOf(code=404, message="HelloHello") returns "de is 404, message is HelloHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0106 begin`);
      const actual: string = reportDrawnMessageOf(404, 'HelloHello');
      logInfo(`reportDrawnMessageOf(code=404, message="H...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(82);
      logInfo(`reportDrawnMessageOf(code=404, message="H...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=404, message="H...: actual.substring(50)=${actual.substring(50)}`);
      expect(actual.substring(50)).assertEqual('de is 404, message is HelloHello');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0106 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0107
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0107
     * @tc.desc      reportDrawnMessageOf(code=404, message="Hello_1") returns " code is 404, message is Hello_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0107 begin`);
      const actual: string = reportDrawnMessageOf(404, 'Hello_1');
      logInfo(`reportDrawnMessageOf(code=404, message="H...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(79);
      logInfo(`reportDrawnMessageOf(code=404, message="H...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=404, message="H...: actual.substring(47)=${actual.substring(47)}`);
      expect(actual.substring(47)).assertEqual(' code is 404, message is Hello_1');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0107 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0108
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0108
     * @tc.desc      reportDrawnMessageOf(code=404, message="xHello") returns ", code is 404, message is xHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0108 begin`);
      const actual: string = reportDrawnMessageOf(404, 'xHello');
      logInfo(`reportDrawnMessageOf(code=404, message="x...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(78);
      logInfo(`reportDrawnMessageOf(code=404, message="x...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=404, message="x...: actual.substring(46)=${actual.substring(46)}`);
      expect(actual.substring(46)).assertEqual(', code is 404, message is xHello');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0108 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0109
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0109
     * @tc.desc      reportDrawnMessageOf(code=404, message=" hello world ") returns "is 404, message is  hello world "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0109 begin`);
      const actual: string = reportDrawnMessageOf(404, ' hello world ');
      logInfo(`reportDrawnMessageOf(code=404, message=" ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(85);
      logInfo(`reportDrawnMessageOf(code=404, message=" ...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=404, message=" ...: actual.substring(53)=${actual.substring(53)}`);
      expect(actual.substring(53)).assertEqual('is 404, message is  hello world ');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0109 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0110
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0110
     * @tc.desc      reportDrawnMessageOf(code=404, message="hello world_1") returns "is 404, message is hello world_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0110 begin`);
      const actual: string = reportDrawnMessageOf(404, 'hello world_1');
      logInfo(`reportDrawnMessageOf(code=404, message="h...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(85);
      logInfo(`reportDrawnMessageOf(code=404, message="h...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=404, message="h...: actual.substring(53)=${actual.substring(53)}`);
      expect(actual.substring(53)).assertEqual('is 404, message is hello world_1');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0110 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0111
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0111
     * @tc.desc      reportDrawnMessageOf(code=404, message="xhello world") returns " is 404, message is xhello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0111 begin`);
      const actual: string = reportDrawnMessageOf(404, 'xhello world');
      logInfo(`reportDrawnMessageOf(code=404, message="x...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(84);
      logInfo(`reportDrawnMessageOf(code=404, message="x...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=404, message="x...: actual.substring(52)=${actual.substring(52)}`);
      expect(actual.substring(52)).assertEqual(' is 404, message is xhello world');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0111 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0112
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0112
     * @tc.desc      reportDrawnMessageOf(code=404, message="   ") returns "led, code is 404, message is    "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0112 begin`);
      const actual: string = reportDrawnMessageOf(404, '   ');
      logInfo(`reportDrawnMessageOf(code=404, message=" ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(75);
      logInfo(`reportDrawnMessageOf(code=404, message=" ...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=404, message=" ...: actual.substring(43)=${actual.substring(43)}`);
      expect(actual.substring(43)).assertEqual('led, code is 404, message is    ');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0112 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0113
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0113
     * @tc.desc      reportDrawnMessageOf(code=404, message="  ") returns "iled, code is 404, message is   "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0113 begin`);
      const actual: string = reportDrawnMessageOf(404, '  ');
      logInfo(`reportDrawnMessageOf(code=404, message="  "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(74);
      logInfo(`reportDrawnMessageOf(code=404, message="  "): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=404, message="  "): actual.substring(42)=${actual.substring(42)}`);
      expect(actual.substring(42)).assertEqual('iled, code is 404, message is   ');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0113 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0114
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0114
     * @tc.desc      reportDrawnMessageOf(code=500, message="Hello") returns "d, code is 500, message is Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0114 begin`);
      const actual: string = reportDrawnMessageOf(500, 'Hello');
      logInfo(`reportDrawnMessageOf(code=500, message="H...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(77);
      logInfo(`reportDrawnMessageOf(code=500, message="H...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=500, message="H...: actual.substring(45)=${actual.substring(45)}`);
      expect(actual.substring(45)).assertEqual('d, code is 500, message is Hello');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0114 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0115
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0115
     * @tc.desc      reportDrawnMessageOf(code=500, message="hello world") returns "e is 500, message is hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0115 begin`);
      const actual: string = reportDrawnMessageOf(500, 'hello world');
      logInfo(`reportDrawnMessageOf(code=500, message="h...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(83);
      logInfo(`reportDrawnMessageOf(code=500, message="h...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=500, message="h...: actual.substring(51)=${actual.substring(51)}`);
      expect(actual.substring(51)).assertEqual('e is 500, message is hello world');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0115 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0116
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0116
     * @tc.desc      reportDrawnMessageOf(code=500, message="") returns "failed, code is 500, message is "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0116 begin`);
      const actual: string = reportDrawnMessageOf(500, '');
      logInfo(`reportDrawnMessageOf(code=500, message=""): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(72);
      logInfo(`reportDrawnMessageOf(code=500, message=""): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=500, message=""): actual.substring(40)=${actual.substring(40)}`);
      expect(actual.substring(40)).assertEqual('failed, code is 500, message is ');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0116 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0117
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0117
     * @tc.desc      reportDrawnMessageOf(code=500, message=" ") returns "ailed, code is 500, message is  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0117 begin`);
      const actual: string = reportDrawnMessageOf(500, ' ');
      logInfo(`reportDrawnMessageOf(code=500, message=" "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(73);
      logInfo(`reportDrawnMessageOf(code=500, message=" "): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=500, message=" "): actual.substring(41)=${actual.substring(41)}`);
      expect(actual.substring(41)).assertEqual('ailed, code is 500, message is  ');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0117 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0118
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0118
     * @tc.desc      reportDrawnMessageOf(code=500, message="A") returns "ailed, code is 500, message is A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0118 begin`);
      const actual: string = reportDrawnMessageOf(500, 'A');
      logInfo(`reportDrawnMessageOf(code=500, message="A"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(73);
      logInfo(`reportDrawnMessageOf(code=500, message="A"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=500, message="A"): actual.substring(41)=${actual.substring(41)}`);
      expect(actual.substring(41)).assertEqual('ailed, code is 500, message is A');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0118 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0119
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0119
     * @tc.desc      reportDrawnMessageOf(code=500, message="Sample Title 123") returns "500, message is Sample Title...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0119 begin`);
      const actual: string = reportDrawnMessageOf(500, 'Sample Title 123');
      logInfo(`reportDrawnMessageOf(code=500, message="S...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(88);
      logInfo(`reportDrawnMessageOf(code=500, message="S...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=500, message="S...: actual.substring(56)=${actual.substring(56)}`);
      expect(actual.substring(56)).assertEqual('500, message is Sample Title 123');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0119 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0120
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0120
     * @tc.desc      reportDrawnMessageOf(code=500, message="??") returns ", code is 500, message is ??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0120 begin`);
      const actual: string = reportDrawnMessageOf(500, '\u4e2d\u6587');
      logInfo(`reportDrawnMessageOf(code=500, message="??"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(74);
      logInfo(`reportDrawnMessageOf(code=500, message="??"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=500, message="??"): actual.substring(46)=${actual.substring(46)}`);
      expect(actual.substring(46)).assertEqual(', code is 500, message is \u4e2d\u6587');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0120 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0121
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0121
     * @tc.desc      reportDrawnMessageOf(code=500, message="a") returns "ailed, code is 500, message is a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0121 begin`);
      const actual: string = reportDrawnMessageOf(500, 'a');
      logInfo(`reportDrawnMessageOf(code=500, message="a"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(73);
      logInfo(`reportDrawnMessageOf(code=500, message="a"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=500, message="a"): actual.substring(41)=${actual.substring(41)}`);
      expect(actual.substring(41)).assertEqual('ailed, code is 500, message is a');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0121 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0122
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0122
     * @tc.desc      reportDrawnMessageOf(code=500, message="abc") returns "led, code is 500, message is abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0122 begin`);
      const actual: string = reportDrawnMessageOf(500, 'abc');
      logInfo(`reportDrawnMessageOf(code=500, message="a...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(75);
      logInfo(`reportDrawnMessageOf(code=500, message="a...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=500, message="a...: actual.substring(43)=${actual.substring(43)}`);
      expect(actual.substring(43)).assertEqual('led, code is 500, message is abc');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0122 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0123
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0123
     * @tc.desc      reportDrawnMessageOf(code=500, message="Hello World") returns "e is 500, message is Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0123 begin`);
      const actual: string = reportDrawnMessageOf(500, 'Hello World');
      logInfo(`reportDrawnMessageOf(code=500, message="H...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(83);
      logInfo(`reportDrawnMessageOf(code=500, message="H...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=500, message="H...: actual.substring(51)=${actual.substring(51)}`);
      expect(actual.substring(51)).assertEqual('e is 500, message is Hello World');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0123 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0124
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0124
     * @tc.desc      reportDrawnMessageOf(code=500, message="123") returns "led, code is 500, message is 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0124 begin`);
      const actual: string = reportDrawnMessageOf(500, '123');
      logInfo(`reportDrawnMessageOf(code=500, message="1...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(75);
      logInfo(`reportDrawnMessageOf(code=500, message="1...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=500, message="1...: actual.substring(43)=${actual.substring(43)}`);
      expect(actual.substring(43)).assertEqual('led, code is 500, message is 123');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0124 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0125
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0125
     * @tc.desc      reportDrawnMessageOf(code=500, message=" Hello ") returns " code is 500, message is  Hello "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0125 begin`);
      const actual: string = reportDrawnMessageOf(500, ' Hello ');
      logInfo(`reportDrawnMessageOf(code=500, message=" ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(79);
      logInfo(`reportDrawnMessageOf(code=500, message=" ...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=500, message=" ...: actual.substring(47)=${actual.substring(47)}`);
      expect(actual.substring(47)).assertEqual(' code is 500, message is  Hello ');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0125 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0126
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0126
     * @tc.desc      reportDrawnMessageOf(code=500, message="HelloHello") returns "de is 500, message is HelloHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0126 begin`);
      const actual: string = reportDrawnMessageOf(500, 'HelloHello');
      logInfo(`reportDrawnMessageOf(code=500, message="H...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(82);
      logInfo(`reportDrawnMessageOf(code=500, message="H...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=500, message="H...: actual.substring(50)=${actual.substring(50)}`);
      expect(actual.substring(50)).assertEqual('de is 500, message is HelloHello');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0126 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0127
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0127
     * @tc.desc      reportDrawnMessageOf(code=500, message="Hello_1") returns " code is 500, message is Hello_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0127 begin`);
      const actual: string = reportDrawnMessageOf(500, 'Hello_1');
      logInfo(`reportDrawnMessageOf(code=500, message="H...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(79);
      logInfo(`reportDrawnMessageOf(code=500, message="H...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=500, message="H...: actual.substring(47)=${actual.substring(47)}`);
      expect(actual.substring(47)).assertEqual(' code is 500, message is Hello_1');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0127 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0128
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0128
     * @tc.desc      reportDrawnMessageOf(code=500, message="xHello") returns ", code is 500, message is xHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0128 begin`);
      const actual: string = reportDrawnMessageOf(500, 'xHello');
      logInfo(`reportDrawnMessageOf(code=500, message="x...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(78);
      logInfo(`reportDrawnMessageOf(code=500, message="x...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=500, message="x...: actual.substring(46)=${actual.substring(46)}`);
      expect(actual.substring(46)).assertEqual(', code is 500, message is xHello');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0128 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0129
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0129
     * @tc.desc      reportDrawnMessageOf(code=500, message=" hello world ") returns "is 500, message is  hello world "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0129 begin`);
      const actual: string = reportDrawnMessageOf(500, ' hello world ');
      logInfo(`reportDrawnMessageOf(code=500, message=" ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(85);
      logInfo(`reportDrawnMessageOf(code=500, message=" ...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=500, message=" ...: actual.substring(53)=${actual.substring(53)}`);
      expect(actual.substring(53)).assertEqual('is 500, message is  hello world ');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0129 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0130
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0130
     * @tc.desc      reportDrawnMessageOf(code=500, message="hello world_1") returns "is 500, message is hello world_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0130 begin`);
      const actual: string = reportDrawnMessageOf(500, 'hello world_1');
      logInfo(`reportDrawnMessageOf(code=500, message="h...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(85);
      logInfo(`reportDrawnMessageOf(code=500, message="h...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=500, message="h...: actual.substring(53)=${actual.substring(53)}`);
      expect(actual.substring(53)).assertEqual('is 500, message is hello world_1');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0130 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0131
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0131
     * @tc.desc      reportDrawnMessageOf(code=500, message="xhello world") returns " is 500, message is xhello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0131 begin`);
      const actual: string = reportDrawnMessageOf(500, 'xhello world');
      logInfo(`reportDrawnMessageOf(code=500, message="x...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(84);
      logInfo(`reportDrawnMessageOf(code=500, message="x...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=500, message="x...: actual.substring(52)=${actual.substring(52)}`);
      expect(actual.substring(52)).assertEqual(' is 500, message is xhello world');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0131 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0132
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0132
     * @tc.desc      reportDrawnMessageOf(code=500, message="   ") returns "led, code is 500, message is    "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0132 begin`);
      const actual: string = reportDrawnMessageOf(500, '   ');
      logInfo(`reportDrawnMessageOf(code=500, message=" ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(75);
      logInfo(`reportDrawnMessageOf(code=500, message=" ...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=500, message=" ...: actual.substring(43)=${actual.substring(43)}`);
      expect(actual.substring(43)).assertEqual('led, code is 500, message is    ');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0132 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0133
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0133
     * @tc.desc      reportDrawnMessageOf(code=500, message="  ") returns "iled, code is 500, message is   "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0133 begin`);
      const actual: string = reportDrawnMessageOf(500, '  ');
      logInfo(`reportDrawnMessageOf(code=500, message="  "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(74);
      logInfo(`reportDrawnMessageOf(code=500, message="  "): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=500, message="  "): actual.substring(42)=${actual.substring(42)}`);
      expect(actual.substring(42)).assertEqual('iled, code is 500, message is   ');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0133 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0134
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0134
     * @tc.desc      reportDrawnMessageOf(code=2, message="Hello") returns "led, code is 2, message is Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0134 begin`);
      const actual: string = reportDrawnMessageOf(2, 'Hello');
      logInfo(`reportDrawnMessageOf(code=2, message="Hel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(75);
      logInfo(`reportDrawnMessageOf(code=2, message="Hel...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=2, message="Hel...: actual.substring(43)=${actual.substring(43)}`);
      expect(actual.substring(43)).assertEqual('led, code is 2, message is Hello');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0134 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0135
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0135
     * @tc.desc      reportDrawnMessageOf(code=2, message="hello world") returns "ode is 2, message is hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0135 begin`);
      const actual: string = reportDrawnMessageOf(2, 'hello world');
      logInfo(`reportDrawnMessageOf(code=2, message="hel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(81);
      logInfo(`reportDrawnMessageOf(code=2, message="hel...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=2, message="hel...: actual.substring(49)=${actual.substring(49)}`);
      expect(actual.substring(49)).assertEqual('ode is 2, message is hello world');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0135 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0136
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0136
     * @tc.desc      reportDrawnMessageOf(code=2, message="") returns "d failed, code is 2, message is "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0136 begin`);
      const actual: string = reportDrawnMessageOf(2, '');
      logInfo(`reportDrawnMessageOf(code=2, message=""): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(70);
      logInfo(`reportDrawnMessageOf(code=2, message=""): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=2, message=""): actual.substring(38)=${actual.substring(38)}`);
      expect(actual.substring(38)).assertEqual('d failed, code is 2, message is ');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0136 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0137
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0137
     * @tc.desc      reportDrawnMessageOf(code=2, message=" ") returns " failed, code is 2, message is  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0137 begin`);
      const actual: string = reportDrawnMessageOf(2, ' ');
      logInfo(`reportDrawnMessageOf(code=2, message=" "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(71);
      logInfo(`reportDrawnMessageOf(code=2, message=" "): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=2, message=" "): actual.substring(39)=${actual.substring(39)}`);
      expect(actual.substring(39)).assertEqual(' failed, code is 2, message is  ');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0137 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0138
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0138
     * @tc.desc      reportDrawnMessageOf(code=2, message="A") returns " failed, code is 2, message is A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0138 begin`);
      const actual: string = reportDrawnMessageOf(2, 'A');
      logInfo(`reportDrawnMessageOf(code=2, message="A"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(71);
      logInfo(`reportDrawnMessageOf(code=2, message="A"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=2, message="A"): actual.substring(39)=${actual.substring(39)}`);
      expect(actual.substring(39)).assertEqual(' failed, code is 2, message is A');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0138 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0139
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0139
     * @tc.desc      reportDrawnMessageOf(code=2, message="Sample Title 123") returns "s 2, message is Sample Title 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0139 begin`);
      const actual: string = reportDrawnMessageOf(2, 'Sample Title 123');
      logInfo(`reportDrawnMessageOf(code=2, message="Sam...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(86);
      logInfo(`reportDrawnMessageOf(code=2, message="Sam...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=2, message="Sam...: actual.substring(54)=${actual.substring(54)}`);
      expect(actual.substring(54)).assertEqual('s 2, message is Sample Title 123');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0139 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0140
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0140
     * @tc.desc      reportDrawnMessageOf(code=2, message="??") returns "ed, code is 2, message is ??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0140 begin`);
      const actual: string = reportDrawnMessageOf(2, '\u4e2d\u6587');
      logInfo(`reportDrawnMessageOf(code=2, message="??"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(72);
      logInfo(`reportDrawnMessageOf(code=2, message="??"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=2, message="??"): actual.substring(44)=${actual.substring(44)}`);
      expect(actual.substring(44)).assertEqual('ed, code is 2, message is \u4e2d\u6587');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0140 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0141
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0141
     * @tc.desc      reportDrawnMessageOf(code=2, message="a") returns " failed, code is 2, message is a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0141 begin`);
      const actual: string = reportDrawnMessageOf(2, 'a');
      logInfo(`reportDrawnMessageOf(code=2, message="a"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(71);
      logInfo(`reportDrawnMessageOf(code=2, message="a"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=2, message="a"): actual.substring(39)=${actual.substring(39)}`);
      expect(actual.substring(39)).assertEqual(' failed, code is 2, message is a');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0141 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0142
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0142
     * @tc.desc      reportDrawnMessageOf(code=2, message="abc") returns "ailed, code is 2, message is abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0142 begin`);
      const actual: string = reportDrawnMessageOf(2, 'abc');
      logInfo(`reportDrawnMessageOf(code=2, message="abc"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(73);
      logInfo(`reportDrawnMessageOf(code=2, message="abc"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=2, message="abc"): actual.substring(41)=${actual.substring(41)}`);
      expect(actual.substring(41)).assertEqual('ailed, code is 2, message is abc');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0142 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0143
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0143
     * @tc.desc      reportDrawnMessageOf(code=2, message="Hello World") returns "ode is 2, message is Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0143 begin`);
      const actual: string = reportDrawnMessageOf(2, 'Hello World');
      logInfo(`reportDrawnMessageOf(code=2, message="Hel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(81);
      logInfo(`reportDrawnMessageOf(code=2, message="Hel...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=2, message="Hel...: actual.substring(49)=${actual.substring(49)}`);
      expect(actual.substring(49)).assertEqual('ode is 2, message is Hello World');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0143 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0144
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0144
     * @tc.desc      reportDrawnMessageOf(code=2, message="123") returns "ailed, code is 2, message is 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0144 begin`);
      const actual: string = reportDrawnMessageOf(2, '123');
      logInfo(`reportDrawnMessageOf(code=2, message="123"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(73);
      logInfo(`reportDrawnMessageOf(code=2, message="123"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=2, message="123"): actual.substring(41)=${actual.substring(41)}`);
      expect(actual.substring(41)).assertEqual('ailed, code is 2, message is 123');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0144 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0145
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0145
     * @tc.desc      reportDrawnMessageOf(code=2, message=" Hello ") returns "d, code is 2, message is  Hello "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0145 begin`);
      const actual: string = reportDrawnMessageOf(2, ' Hello ');
      logInfo(`reportDrawnMessageOf(code=2, message=" He...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(77);
      logInfo(`reportDrawnMessageOf(code=2, message=" He...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=2, message=" He...: actual.substring(45)=${actual.substring(45)}`);
      expect(actual.substring(45)).assertEqual('d, code is 2, message is  Hello ');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0145 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0146
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0146
     * @tc.desc      reportDrawnMessageOf(code=2, message="HelloHello") returns "code is 2, message is HelloHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0146 begin`);
      const actual: string = reportDrawnMessageOf(2, 'HelloHello');
      logInfo(`reportDrawnMessageOf(code=2, message="Hel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(80);
      logInfo(`reportDrawnMessageOf(code=2, message="Hel...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=2, message="Hel...: actual.substring(48)=${actual.substring(48)}`);
      expect(actual.substring(48)).assertEqual('code is 2, message is HelloHello');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0146 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0147
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0147
     * @tc.desc      reportDrawnMessageOf(code=2, message="Hello_1") returns "d, code is 2, message is Hello_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0147 begin`);
      const actual: string = reportDrawnMessageOf(2, 'Hello_1');
      logInfo(`reportDrawnMessageOf(code=2, message="Hel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(77);
      logInfo(`reportDrawnMessageOf(code=2, message="Hel...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=2, message="Hel...: actual.substring(45)=${actual.substring(45)}`);
      expect(actual.substring(45)).assertEqual('d, code is 2, message is Hello_1');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0147 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0148
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0148
     * @tc.desc      reportDrawnMessageOf(code=2, message="xHello") returns "ed, code is 2, message is xHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0148 begin`);
      const actual: string = reportDrawnMessageOf(2, 'xHello');
      logInfo(`reportDrawnMessageOf(code=2, message="xHe...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(76);
      logInfo(`reportDrawnMessageOf(code=2, message="xHe...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=2, message="xHe...: actual.substring(44)=${actual.substring(44)}`);
      expect(actual.substring(44)).assertEqual('ed, code is 2, message is xHello');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0148 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0149
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0149
     * @tc.desc      reportDrawnMessageOf(code=2, message=" hello world ") returns "e is 2, message is  hello world "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0149 begin`);
      const actual: string = reportDrawnMessageOf(2, ' hello world ');
      logInfo(`reportDrawnMessageOf(code=2, message=" he...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(83);
      logInfo(`reportDrawnMessageOf(code=2, message=" he...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=2, message=" he...: actual.substring(51)=${actual.substring(51)}`);
      expect(actual.substring(51)).assertEqual('e is 2, message is  hello world ');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0149 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0150
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0150
     * @tc.desc      reportDrawnMessageOf(code=2, message="hello world_1") returns "e is 2, message is hello world_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0150 begin`);
      const actual: string = reportDrawnMessageOf(2, 'hello world_1');
      logInfo(`reportDrawnMessageOf(code=2, message="hel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(83);
      logInfo(`reportDrawnMessageOf(code=2, message="hel...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=2, message="hel...: actual.substring(51)=${actual.substring(51)}`);
      expect(actual.substring(51)).assertEqual('e is 2, message is hello world_1');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0150 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0151
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0151
     * @tc.desc      reportDrawnMessageOf(code=2, message="xhello world") returns "de is 2, message is xhello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0151 begin`);
      const actual: string = reportDrawnMessageOf(2, 'xhello world');
      logInfo(`reportDrawnMessageOf(code=2, message="xhe...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(82);
      logInfo(`reportDrawnMessageOf(code=2, message="xhe...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=2, message="xhe...: actual.substring(50)=${actual.substring(50)}`);
      expect(actual.substring(50)).assertEqual('de is 2, message is xhello world');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0151 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0152
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0152
     * @tc.desc      reportDrawnMessageOf(code=2, message="   ") returns "ailed, code is 2, message is    "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0152 begin`);
      const actual: string = reportDrawnMessageOf(2, '   ');
      logInfo(`reportDrawnMessageOf(code=2, message="   "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(73);
      logInfo(`reportDrawnMessageOf(code=2, message="   "): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=2, message="   "): actual.substring(41)=${actual.substring(41)}`);
      expect(actual.substring(41)).assertEqual('ailed, code is 2, message is    ');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0152 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0153
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0153
     * @tc.desc      reportDrawnMessageOf(code=2, message="  ") returns "failed, code is 2, message is   "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0153 begin`);
      const actual: string = reportDrawnMessageOf(2, '  ');
      logInfo(`reportDrawnMessageOf(code=2, message="  "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(72);
      logInfo(`reportDrawnMessageOf(code=2, message="  "): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=2, message="  "): actual.substring(40)=${actual.substring(40)}`);
      expect(actual.substring(40)).assertEqual('failed, code is 2, message is   ');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0153 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0154
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0154
     * @tc.desc      reportDrawnMessageOf(code=3, message="Hello") returns "led, code is 3, message is Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0154 begin`);
      const actual: string = reportDrawnMessageOf(3, 'Hello');
      logInfo(`reportDrawnMessageOf(code=3, message="Hel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(75);
      logInfo(`reportDrawnMessageOf(code=3, message="Hel...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=3, message="Hel...: actual.substring(43)=${actual.substring(43)}`);
      expect(actual.substring(43)).assertEqual('led, code is 3, message is Hello');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0154 end`);
    });
  });
}
