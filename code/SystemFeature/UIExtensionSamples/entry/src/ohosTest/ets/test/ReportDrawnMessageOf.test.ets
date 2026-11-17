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
export default function reportDrawnMessageOfTest(): void {
  describe('ReportDrawnMessageOfTest', () => {
    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0001
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0001
     * @tc.desc      reportDrawnMessageOf(code=0, message="UIExtensionContent.reportDrawnComple...) returns "UIExtens...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0001 begin`);
      const actual: string = reportDrawnMessageOf(0, 'UIExtensionContent.reportDrawnCompleted succeed.');
      logInfo(`reportDrawnMessageOf(code=0, message="UIE...: actual=${actual}`);
      expect(actual).assertEqual('UIExtensionContent.reportDrawnCompleted succeed.');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0001 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0002
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0002
     * @tc.desc      reportDrawnMessageOf(code=200, message="UIExtensionContent.reportDrawnComple...) returns "nt.rep...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0002 begin`);
      const actual: string = reportDrawnMessageOf(200, 'UIExtensionContent.reportDrawnCompleted succeed.');
      logInfo(`reportDrawnMessageOf(code=200, message="U...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(120);
      logInfo(`reportDrawnMessageOf(code=200, message="U...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=200, message="U...: actual.substring(88)=${actual.substring(88)}`);
      expect(actual.substring(88)).assertEqual('nt.reportDrawnCompleted succeed.');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0002 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0003
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0003
     * @tc.desc      reportDrawnMessageOf(code=200, message="UIEXTENSIONCONTENT.REPORTDRAWNCOMPLE...) returns "NT.REP...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0003 begin`);
      const actual: string = reportDrawnMessageOf(200, 'UIEXTENSIONCONTENT.REPORTDRAWNCOMPLETED SUCCEED.');
      logInfo(`reportDrawnMessageOf(code=200, message="U...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(120);
      logInfo(`reportDrawnMessageOf(code=200, message="U...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=200, message="U...: actual.substring(88)=${actual.substring(88)}`);
      expect(actual.substring(88)).assertEqual('NT.REPORTDRAWNCOMPLETED SUCCEED.');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0003 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0004
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0004
     * @tc.desc      reportDrawnMessageOf(code=200, message="UIExtensionContent.reportDrawnComple...) returns "ent.re...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0004 begin`);
      const actual: string = reportDrawnMessageOf(200, 'UIExtensionContent.reportDrawnCompleted succeed');
      logInfo(`reportDrawnMessageOf(code=200, message="U...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(119);
      logInfo(`reportDrawnMessageOf(code=200, message="U...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=200, message="U...: actual.substring(87)=${actual.substring(87)}`);
      expect(actual.substring(87)).assertEqual('ent.reportDrawnCompleted succeed');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0004 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0005
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0005
     * @tc.desc      reportDrawnMessageOf(code=200, message="Hello") returns "d, code is 200, message is Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0005 begin`);
      const actual: string = reportDrawnMessageOf(200, 'Hello');
      logInfo(`reportDrawnMessageOf(code=200, message="H...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(77);
      logInfo(`reportDrawnMessageOf(code=200, message="H...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=200, message="H...: actual.substring(45)=${actual.substring(45)}`);
      expect(actual.substring(45)).assertEqual('d, code is 200, message is Hello');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0005 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0006
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0006
     * @tc.desc      reportDrawnMessageOf(code=200, message="hello world") returns "e is 200, message is hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0006 begin`);
      const actual: string = reportDrawnMessageOf(200, 'hello world');
      logInfo(`reportDrawnMessageOf(code=200, message="h...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(83);
      logInfo(`reportDrawnMessageOf(code=200, message="h...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=200, message="h...: actual.substring(51)=${actual.substring(51)}`);
      expect(actual.substring(51)).assertEqual('e is 200, message is hello world');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0006 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0007
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0007
     * @tc.desc      reportDrawnMessageOf(code=200, message="") returns "failed, code is 200, message is "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0007 begin`);
      const actual: string = reportDrawnMessageOf(200, '');
      logInfo(`reportDrawnMessageOf(code=200, message=""): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(72);
      logInfo(`reportDrawnMessageOf(code=200, message=""): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=200, message=""): actual.substring(40)=${actual.substring(40)}`);
      expect(actual.substring(40)).assertEqual('failed, code is 200, message is ');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0007 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0008
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0008
     * @tc.desc      reportDrawnMessageOf(code=200, message=" ") returns "ailed, code is 200, message is  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0008 begin`);
      const actual: string = reportDrawnMessageOf(200, ' ');
      logInfo(`reportDrawnMessageOf(code=200, message=" "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(73);
      logInfo(`reportDrawnMessageOf(code=200, message=" "): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=200, message=" "): actual.substring(41)=${actual.substring(41)}`);
      expect(actual.substring(41)).assertEqual('ailed, code is 200, message is  ');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0008 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0009
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0009
     * @tc.desc      reportDrawnMessageOf(code=200, message="A") returns "ailed, code is 200, message is A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0009 begin`);
      const actual: string = reportDrawnMessageOf(200, 'A');
      logInfo(`reportDrawnMessageOf(code=200, message="A"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(73);
      logInfo(`reportDrawnMessageOf(code=200, message="A"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=200, message="A"): actual.substring(41)=${actual.substring(41)}`);
      expect(actual.substring(41)).assertEqual('ailed, code is 200, message is A');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0009 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0010
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0010
     * @tc.desc      reportDrawnMessageOf(code=200, message="Sample Title 123") returns "200, message is Sample Title...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0010 begin`);
      const actual: string = reportDrawnMessageOf(200, 'Sample Title 123');
      logInfo(`reportDrawnMessageOf(code=200, message="S...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(88);
      logInfo(`reportDrawnMessageOf(code=200, message="S...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=200, message="S...: actual.substring(56)=${actual.substring(56)}`);
      expect(actual.substring(56)).assertEqual('200, message is Sample Title 123');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0010 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0011
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0011
     * @tc.desc      reportDrawnMessageOf(code=200, message="??") returns ", code is 200, message is ??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0011 begin`);
      const actual: string = reportDrawnMessageOf(200, '\u4e2d\u6587');
      logInfo(`reportDrawnMessageOf(code=200, message="??"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(74);
      logInfo(`reportDrawnMessageOf(code=200, message="??"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=200, message="??"): actual.substring(46)=${actual.substring(46)}`);
      expect(actual.substring(46)).assertEqual(', code is 200, message is \u4e2d\u6587');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0011 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0012
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0012
     * @tc.desc      reportDrawnMessageOf(code=200, message="a") returns "ailed, code is 200, message is a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0012 begin`);
      const actual: string = reportDrawnMessageOf(200, 'a');
      logInfo(`reportDrawnMessageOf(code=200, message="a"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(73);
      logInfo(`reportDrawnMessageOf(code=200, message="a"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=200, message="a"): actual.substring(41)=${actual.substring(41)}`);
      expect(actual.substring(41)).assertEqual('ailed, code is 200, message is a');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0012 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0013
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0013
     * @tc.desc      reportDrawnMessageOf(code=200, message="abc") returns "led, code is 200, message is abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0013 begin`);
      const actual: string = reportDrawnMessageOf(200, 'abc');
      logInfo(`reportDrawnMessageOf(code=200, message="a...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(75);
      logInfo(`reportDrawnMessageOf(code=200, message="a...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=200, message="a...: actual.substring(43)=${actual.substring(43)}`);
      expect(actual.substring(43)).assertEqual('led, code is 200, message is abc');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0013 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0014
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0014
     * @tc.desc      reportDrawnMessageOf(code=200, message="Hello World") returns "e is 200, message is Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0014 begin`);
      const actual: string = reportDrawnMessageOf(200, 'Hello World');
      logInfo(`reportDrawnMessageOf(code=200, message="H...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(83);
      logInfo(`reportDrawnMessageOf(code=200, message="H...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=200, message="H...: actual.substring(51)=${actual.substring(51)}`);
      expect(actual.substring(51)).assertEqual('e is 200, message is Hello World');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0014 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0015
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0015
     * @tc.desc      reportDrawnMessageOf(code=200, message="123") returns "led, code is 200, message is 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0015 begin`);
      const actual: string = reportDrawnMessageOf(200, '123');
      logInfo(`reportDrawnMessageOf(code=200, message="1...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(75);
      logInfo(`reportDrawnMessageOf(code=200, message="1...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=200, message="1...: actual.substring(43)=${actual.substring(43)}`);
      expect(actual.substring(43)).assertEqual('led, code is 200, message is 123');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0015 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0016
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0016
     * @tc.desc      reportDrawnMessageOf(code=200, message=" Hello ") returns " code is 200, message is  Hello "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0016 begin`);
      const actual: string = reportDrawnMessageOf(200, ' Hello ');
      logInfo(`reportDrawnMessageOf(code=200, message=" ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(79);
      logInfo(`reportDrawnMessageOf(code=200, message=" ...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=200, message=" ...: actual.substring(47)=${actual.substring(47)}`);
      expect(actual.substring(47)).assertEqual(' code is 200, message is  Hello ');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0016 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0017
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0017
     * @tc.desc      reportDrawnMessageOf(code=200, message="HelloHello") returns "de is 200, message is HelloHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0017 begin`);
      const actual: string = reportDrawnMessageOf(200, 'HelloHello');
      logInfo(`reportDrawnMessageOf(code=200, message="H...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(82);
      logInfo(`reportDrawnMessageOf(code=200, message="H...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=200, message="H...: actual.substring(50)=${actual.substring(50)}`);
      expect(actual.substring(50)).assertEqual('de is 200, message is HelloHello');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0017 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0018
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0018
     * @tc.desc      reportDrawnMessageOf(code=200, message="Hello_1") returns " code is 200, message is Hello_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0018 begin`);
      const actual: string = reportDrawnMessageOf(200, 'Hello_1');
      logInfo(`reportDrawnMessageOf(code=200, message="H...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(79);
      logInfo(`reportDrawnMessageOf(code=200, message="H...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=200, message="H...: actual.substring(47)=${actual.substring(47)}`);
      expect(actual.substring(47)).assertEqual(' code is 200, message is Hello_1');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0018 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0019
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0019
     * @tc.desc      reportDrawnMessageOf(code=200, message="xHello") returns ", code is 200, message is xHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0019 begin`);
      const actual: string = reportDrawnMessageOf(200, 'xHello');
      logInfo(`reportDrawnMessageOf(code=200, message="x...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(78);
      logInfo(`reportDrawnMessageOf(code=200, message="x...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=200, message="x...: actual.substring(46)=${actual.substring(46)}`);
      expect(actual.substring(46)).assertEqual(', code is 200, message is xHello');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0019 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0020
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0020
     * @tc.desc      reportDrawnMessageOf(code=200, message=" hello world ") returns "is 200, message is  hello world "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0020 begin`);
      const actual: string = reportDrawnMessageOf(200, ' hello world ');
      logInfo(`reportDrawnMessageOf(code=200, message=" ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(85);
      logInfo(`reportDrawnMessageOf(code=200, message=" ...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=200, message=" ...: actual.substring(53)=${actual.substring(53)}`);
      expect(actual.substring(53)).assertEqual('is 200, message is  hello world ');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0020 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0021
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0021
     * @tc.desc      reportDrawnMessageOf(code=200, message="hello worldhello world") returns "essage is hello worldh...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0021 begin`);
      const actual: string = reportDrawnMessageOf(200, 'hello worldhello world');
      logInfo(`reportDrawnMessageOf(code=200, message="h...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(94);
      logInfo(`reportDrawnMessageOf(code=200, message="h...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=200, message="h...: actual.substring(62)=${actual.substring(62)}`);
      expect(actual.substring(62)).assertEqual('essage is hello worldhello world');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0021 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0022
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0022
     * @tc.desc      reportDrawnMessageOf(code=200, message="hello world_1") returns "is 200, message is hello world_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0022 begin`);
      const actual: string = reportDrawnMessageOf(200, 'hello world_1');
      logInfo(`reportDrawnMessageOf(code=200, message="h...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(85);
      logInfo(`reportDrawnMessageOf(code=200, message="h...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=200, message="h...: actual.substring(53)=${actual.substring(53)}`);
      expect(actual.substring(53)).assertEqual('is 200, message is hello world_1');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0022 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0023
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0023
     * @tc.desc      reportDrawnMessageOf(code=200, message="xhello world") returns " is 200, message is xhello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0023 begin`);
      const actual: string = reportDrawnMessageOf(200, 'xhello world');
      logInfo(`reportDrawnMessageOf(code=200, message="x...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(84);
      logInfo(`reportDrawnMessageOf(code=200, message="x...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=200, message="x...: actual.substring(52)=${actual.substring(52)}`);
      expect(actual.substring(52)).assertEqual(' is 200, message is xhello world');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0023 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0024
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0024
     * @tc.desc      reportDrawnMessageOf(code=200, message="   ") returns "led, code is 200, message is    "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0024 begin`);
      const actual: string = reportDrawnMessageOf(200, '   ');
      logInfo(`reportDrawnMessageOf(code=200, message=" ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(75);
      logInfo(`reportDrawnMessageOf(code=200, message=" ...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=200, message=" ...: actual.substring(43)=${actual.substring(43)}`);
      expect(actual.substring(43)).assertEqual('led, code is 200, message is    ');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0024 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0025
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0025
     * @tc.desc      reportDrawnMessageOf(code=200, message="  ") returns "iled, code is 200, message is   "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0025 begin`);
      const actual: string = reportDrawnMessageOf(200, '  ');
      logInfo(`reportDrawnMessageOf(code=200, message="  "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(74);
      logInfo(`reportDrawnMessageOf(code=200, message="  "): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=200, message="  "): actual.substring(42)=${actual.substring(42)}`);
      expect(actual.substring(42)).assertEqual('iled, code is 200, message is   ');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0025 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0026
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0026
     * @tc.desc      reportDrawnMessageOf(code=-1, message="UIExtensionContent.reportDrawnComple...) returns "nt.repo...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0026 begin`);
      const actual: string = reportDrawnMessageOf(-1, 'UIExtensionContent.reportDrawnCompleted succeed.');
      logInfo(`reportDrawnMessageOf(code=-1, message="UI...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(119);
      logInfo(`reportDrawnMessageOf(code=-1, message="UI...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=-1, message="UI...: actual.substring(87)=${actual.substring(87)}`);
      expect(actual.substring(87)).assertEqual('nt.reportDrawnCompleted succeed.');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0026 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0027
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0027
     * @tc.desc      reportDrawnMessageOf(code=-1, message="UIEXTENSIONCONTENT.REPORTDRAWNCOMPLE...) returns "NT.REPO...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0027 begin`);
      const actual: string = reportDrawnMessageOf(-1, 'UIEXTENSIONCONTENT.REPORTDRAWNCOMPLETED SUCCEED.');
      logInfo(`reportDrawnMessageOf(code=-1, message="UI...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(119);
      logInfo(`reportDrawnMessageOf(code=-1, message="UI...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=-1, message="UI...: actual.substring(87)=${actual.substring(87)}`);
      expect(actual.substring(87)).assertEqual('NT.REPORTDRAWNCOMPLETED SUCCEED.');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0027 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0028
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0028
     * @tc.desc      reportDrawnMessageOf(code=-1, message="UIExtensionContent.reportDrawnComple...) returns "ent.rep...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0028 begin`);
      const actual: string = reportDrawnMessageOf(-1, 'UIExtensionContent.reportDrawnCompleted succeed');
      logInfo(`reportDrawnMessageOf(code=-1, message="UI...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(118);
      logInfo(`reportDrawnMessageOf(code=-1, message="UI...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=-1, message="UI...: actual.substring(86)=${actual.substring(86)}`);
      expect(actual.substring(86)).assertEqual('ent.reportDrawnCompleted succeed');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0028 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0029
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0029
     * @tc.desc      reportDrawnMessageOf(code=-1, message="Hello") returns "ed, code is -1, message is Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0029 begin`);
      const actual: string = reportDrawnMessageOf(-1, 'Hello');
      logInfo(`reportDrawnMessageOf(code=-1, message="He...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(76);
      logInfo(`reportDrawnMessageOf(code=-1, message="He...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=-1, message="He...: actual.substring(44)=${actual.substring(44)}`);
      expect(actual.substring(44)).assertEqual('ed, code is -1, message is Hello');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0029 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0030
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0030
     * @tc.desc      reportDrawnMessageOf(code=-1, message="hello world") returns "de is -1, message is hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0030 begin`);
      const actual: string = reportDrawnMessageOf(-1, 'hello world');
      logInfo(`reportDrawnMessageOf(code=-1, message="he...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(82);
      logInfo(`reportDrawnMessageOf(code=-1, message="he...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=-1, message="he...: actual.substring(50)=${actual.substring(50)}`);
      expect(actual.substring(50)).assertEqual('de is -1, message is hello world');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0030 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0031
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0031
     * @tc.desc      reportDrawnMessageOf(code=-1, message="") returns " failed, code is -1, message is "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0031 begin`);
      const actual: string = reportDrawnMessageOf(-1, '');
      logInfo(`reportDrawnMessageOf(code=-1, message=""): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(71);
      logInfo(`reportDrawnMessageOf(code=-1, message=""): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=-1, message=""): actual.substring(39)=${actual.substring(39)}`);
      expect(actual.substring(39)).assertEqual(' failed, code is -1, message is ');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0031 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0032
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0032
     * @tc.desc      reportDrawnMessageOf(code=-1, message=" ") returns "failed, code is -1, message is  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0032 begin`);
      const actual: string = reportDrawnMessageOf(-1, ' ');
      logInfo(`reportDrawnMessageOf(code=-1, message=" "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(72);
      logInfo(`reportDrawnMessageOf(code=-1, message=" "): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=-1, message=" "): actual.substring(40)=${actual.substring(40)}`);
      expect(actual.substring(40)).assertEqual('failed, code is -1, message is  ');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0032 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0033
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0033
     * @tc.desc      reportDrawnMessageOf(code=-1, message="A") returns "failed, code is -1, message is A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0033 begin`);
      const actual: string = reportDrawnMessageOf(-1, 'A');
      logInfo(`reportDrawnMessageOf(code=-1, message="A"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(72);
      logInfo(`reportDrawnMessageOf(code=-1, message="A"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=-1, message="A"): actual.substring(40)=${actual.substring(40)}`);
      expect(actual.substring(40)).assertEqual('failed, code is -1, message is A');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0033 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0034
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0034
     * @tc.desc      reportDrawnMessageOf(code=-1, message="Sample Title 123") returns " -1, message is Sample Title ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0034 begin`);
      const actual: string = reportDrawnMessageOf(-1, 'Sample Title 123');
      logInfo(`reportDrawnMessageOf(code=-1, message="Sa...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(87);
      logInfo(`reportDrawnMessageOf(code=-1, message="Sa...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=-1, message="Sa...: actual.substring(55)=${actual.substring(55)}`);
      expect(actual.substring(55)).assertEqual(' -1, message is Sample Title 123');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0034 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0035
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0035
     * @tc.desc      reportDrawnMessageOf(code=-1, message="??") returns "d, code is -1, message is ??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0035 begin`);
      const actual: string = reportDrawnMessageOf(-1, '\u4e2d\u6587');
      logInfo(`reportDrawnMessageOf(code=-1, message="??"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(73);
      logInfo(`reportDrawnMessageOf(code=-1, message="??"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=-1, message="??"): actual.substring(45)=${actual.substring(45)}`);
      expect(actual.substring(45)).assertEqual('d, code is -1, message is \u4e2d\u6587');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0035 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0036
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0036
     * @tc.desc      reportDrawnMessageOf(code=-1, message="a") returns "failed, code is -1, message is a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0036 begin`);
      const actual: string = reportDrawnMessageOf(-1, 'a');
      logInfo(`reportDrawnMessageOf(code=-1, message="a"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(72);
      logInfo(`reportDrawnMessageOf(code=-1, message="a"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=-1, message="a"): actual.substring(40)=${actual.substring(40)}`);
      expect(actual.substring(40)).assertEqual('failed, code is -1, message is a');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0036 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0037
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0037
     * @tc.desc      reportDrawnMessageOf(code=-1, message="abc") returns "iled, code is -1, message is abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0037 begin`);
      const actual: string = reportDrawnMessageOf(-1, 'abc');
      logInfo(`reportDrawnMessageOf(code=-1, message="abc"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(74);
      logInfo(`reportDrawnMessageOf(code=-1, message="abc"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=-1, message="abc"): actual.substring(42)=${actual.substring(42)}`);
      expect(actual.substring(42)).assertEqual('iled, code is -1, message is abc');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0037 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0038
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0038
     * @tc.desc      reportDrawnMessageOf(code=-1, message="Hello World") returns "de is -1, message is Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0038 begin`);
      const actual: string = reportDrawnMessageOf(-1, 'Hello World');
      logInfo(`reportDrawnMessageOf(code=-1, message="He...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(82);
      logInfo(`reportDrawnMessageOf(code=-1, message="He...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=-1, message="He...: actual.substring(50)=${actual.substring(50)}`);
      expect(actual.substring(50)).assertEqual('de is -1, message is Hello World');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0038 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0039
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0039
     * @tc.desc      reportDrawnMessageOf(code=-1, message="123") returns "iled, code is -1, message is 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0039 begin`);
      const actual: string = reportDrawnMessageOf(-1, '123');
      logInfo(`reportDrawnMessageOf(code=-1, message="123"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(74);
      logInfo(`reportDrawnMessageOf(code=-1, message="123"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=-1, message="123"): actual.substring(42)=${actual.substring(42)}`);
      expect(actual.substring(42)).assertEqual('iled, code is -1, message is 123');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0039 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0040
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0040
     * @tc.desc      reportDrawnMessageOf(code=-1, message=" Hello ") returns ", code is -1, message is  Hello "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0040 begin`);
      const actual: string = reportDrawnMessageOf(-1, ' Hello ');
      logInfo(`reportDrawnMessageOf(code=-1, message=" H...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(78);
      logInfo(`reportDrawnMessageOf(code=-1, message=" H...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=-1, message=" H...: actual.substring(46)=${actual.substring(46)}`);
      expect(actual.substring(46)).assertEqual(', code is -1, message is  Hello ');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0040 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0041
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0041
     * @tc.desc      reportDrawnMessageOf(code=-1, message="HelloHello") returns "ode is -1, message is HelloHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0041 begin`);
      const actual: string = reportDrawnMessageOf(-1, 'HelloHello');
      logInfo(`reportDrawnMessageOf(code=-1, message="He...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(81);
      logInfo(`reportDrawnMessageOf(code=-1, message="He...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=-1, message="He...: actual.substring(49)=${actual.substring(49)}`);
      expect(actual.substring(49)).assertEqual('ode is -1, message is HelloHello');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0041 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0042
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0042
     * @tc.desc      reportDrawnMessageOf(code=-1, message="Hello_1") returns ", code is -1, message is Hello_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0042 begin`);
      const actual: string = reportDrawnMessageOf(-1, 'Hello_1');
      logInfo(`reportDrawnMessageOf(code=-1, message="He...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(78);
      logInfo(`reportDrawnMessageOf(code=-1, message="He...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=-1, message="He...: actual.substring(46)=${actual.substring(46)}`);
      expect(actual.substring(46)).assertEqual(', code is -1, message is Hello_1');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0042 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0043
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0043
     * @tc.desc      reportDrawnMessageOf(code=-1, message="xHello") returns "d, code is -1, message is xHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0043 begin`);
      const actual: string = reportDrawnMessageOf(-1, 'xHello');
      logInfo(`reportDrawnMessageOf(code=-1, message="xH...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(77);
      logInfo(`reportDrawnMessageOf(code=-1, message="xH...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=-1, message="xH...: actual.substring(45)=${actual.substring(45)}`);
      expect(actual.substring(45)).assertEqual('d, code is -1, message is xHello');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0043 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0044
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0044
     * @tc.desc      reportDrawnMessageOf(code=-1, message=" hello world ") returns " is -1, message is  hello world "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0044 begin`);
      const actual: string = reportDrawnMessageOf(-1, ' hello world ');
      logInfo(`reportDrawnMessageOf(code=-1, message=" h...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(84);
      logInfo(`reportDrawnMessageOf(code=-1, message=" h...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=-1, message=" h...: actual.substring(52)=${actual.substring(52)}`);
      expect(actual.substring(52)).assertEqual(' is -1, message is  hello world ');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0044 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0045
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0045
     * @tc.desc      reportDrawnMessageOf(code=-1, message="hello worldhello world") returns "essage is hello worldhe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0045 begin`);
      const actual: string = reportDrawnMessageOf(-1, 'hello worldhello world');
      logInfo(`reportDrawnMessageOf(code=-1, message="he...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(93);
      logInfo(`reportDrawnMessageOf(code=-1, message="he...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=-1, message="he...: actual.substring(61)=${actual.substring(61)}`);
      expect(actual.substring(61)).assertEqual('essage is hello worldhello world');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0045 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0046
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0046
     * @tc.desc      reportDrawnMessageOf(code=-1, message="hello world_1") returns " is -1, message is hello world_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0046 begin`);
      const actual: string = reportDrawnMessageOf(-1, 'hello world_1');
      logInfo(`reportDrawnMessageOf(code=-1, message="he...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(84);
      logInfo(`reportDrawnMessageOf(code=-1, message="he...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=-1, message="he...: actual.substring(52)=${actual.substring(52)}`);
      expect(actual.substring(52)).assertEqual(' is -1, message is hello world_1');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0046 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0047
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0047
     * @tc.desc      reportDrawnMessageOf(code=-1, message="xhello world") returns "e is -1, message is xhello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0047 begin`);
      const actual: string = reportDrawnMessageOf(-1, 'xhello world');
      logInfo(`reportDrawnMessageOf(code=-1, message="xh...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(83);
      logInfo(`reportDrawnMessageOf(code=-1, message="xh...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=-1, message="xh...: actual.substring(51)=${actual.substring(51)}`);
      expect(actual.substring(51)).assertEqual('e is -1, message is xhello world');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0047 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0048
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0048
     * @tc.desc      reportDrawnMessageOf(code=-1, message="   ") returns "iled, code is -1, message is    "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0048 begin`);
      const actual: string = reportDrawnMessageOf(-1, '   ');
      logInfo(`reportDrawnMessageOf(code=-1, message="   "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(74);
      logInfo(`reportDrawnMessageOf(code=-1, message="   "): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=-1, message="   "): actual.substring(42)=${actual.substring(42)}`);
      expect(actual.substring(42)).assertEqual('iled, code is -1, message is    ');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0048 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0049
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0049
     * @tc.desc      reportDrawnMessageOf(code=-1, message="  ") returns "ailed, code is -1, message is   "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0049 begin`);
      const actual: string = reportDrawnMessageOf(-1, '  ');
      logInfo(`reportDrawnMessageOf(code=-1, message="  "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(73);
      logInfo(`reportDrawnMessageOf(code=-1, message="  "): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=-1, message="  "): actual.substring(41)=${actual.substring(41)}`);
      expect(actual.substring(41)).assertEqual('ailed, code is -1, message is   ');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0049 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0050
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0050
     * @tc.desc      reportDrawnMessageOf(code=1, message="UIExtensionContent.reportDrawnComple...) returns "nt.repor...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0050 begin`);
      const actual: string = reportDrawnMessageOf(1, 'UIExtensionContent.reportDrawnCompleted succeed.');
      logInfo(`reportDrawnMessageOf(code=1, message="UIE...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(118);
      logInfo(`reportDrawnMessageOf(code=1, message="UIE...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=1, message="UIE...: actual.substring(86)=${actual.substring(86)}`);
      expect(actual.substring(86)).assertEqual('nt.reportDrawnCompleted succeed.');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0050 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0051
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0051
     * @tc.desc      reportDrawnMessageOf(code=1, message="UIEXTENSIONCONTENT.REPORTDRAWNCOMPLE...) returns "NT.REPOR...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0051 begin`);
      const actual: string = reportDrawnMessageOf(1, 'UIEXTENSIONCONTENT.REPORTDRAWNCOMPLETED SUCCEED.');
      logInfo(`reportDrawnMessageOf(code=1, message="UIE...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(118);
      logInfo(`reportDrawnMessageOf(code=1, message="UIE...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=1, message="UIE...: actual.substring(86)=${actual.substring(86)}`);
      expect(actual.substring(86)).assertEqual('NT.REPORTDRAWNCOMPLETED SUCCEED.');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0051 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0052
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0052
     * @tc.desc      reportDrawnMessageOf(code=1, message="UIExtensionContent.reportDrawnComple...) returns "ent.repo...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0052 begin`);
      const actual: string = reportDrawnMessageOf(1, 'UIExtensionContent.reportDrawnCompleted succeed');
      logInfo(`reportDrawnMessageOf(code=1, message="UIE...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(117);
      logInfo(`reportDrawnMessageOf(code=1, message="UIE...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=1, message="UIE...: actual.substring(85)=${actual.substring(85)}`);
      expect(actual.substring(85)).assertEqual('ent.reportDrawnCompleted succeed');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0052 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0053
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0053
     * @tc.desc      reportDrawnMessageOf(code=1, message="Hello") returns "led, code is 1, message is Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0053 begin`);
      const actual: string = reportDrawnMessageOf(1, 'Hello');
      logInfo(`reportDrawnMessageOf(code=1, message="Hel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(75);
      logInfo(`reportDrawnMessageOf(code=1, message="Hel...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=1, message="Hel...: actual.substring(43)=${actual.substring(43)}`);
      expect(actual.substring(43)).assertEqual('led, code is 1, message is Hello');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0053 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0054
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0054
     * @tc.desc      reportDrawnMessageOf(code=1, message="hello world") returns "ode is 1, message is hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0054 begin`);
      const actual: string = reportDrawnMessageOf(1, 'hello world');
      logInfo(`reportDrawnMessageOf(code=1, message="hel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(81);
      logInfo(`reportDrawnMessageOf(code=1, message="hel...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=1, message="hel...: actual.substring(49)=${actual.substring(49)}`);
      expect(actual.substring(49)).assertEqual('ode is 1, message is hello world');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0054 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0055
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0055
     * @tc.desc      reportDrawnMessageOf(code=1, message="") returns "d failed, code is 1, message is "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0055 begin`);
      const actual: string = reportDrawnMessageOf(1, '');
      logInfo(`reportDrawnMessageOf(code=1, message=""): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(70);
      logInfo(`reportDrawnMessageOf(code=1, message=""): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=1, message=""): actual.substring(38)=${actual.substring(38)}`);
      expect(actual.substring(38)).assertEqual('d failed, code is 1, message is ');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0055 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0056
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0056
     * @tc.desc      reportDrawnMessageOf(code=1, message=" ") returns " failed, code is 1, message is  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0056 begin`);
      const actual: string = reportDrawnMessageOf(1, ' ');
      logInfo(`reportDrawnMessageOf(code=1, message=" "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(71);
      logInfo(`reportDrawnMessageOf(code=1, message=" "): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=1, message=" "): actual.substring(39)=${actual.substring(39)}`);
      expect(actual.substring(39)).assertEqual(' failed, code is 1, message is  ');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0056 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0057
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0057
     * @tc.desc      reportDrawnMessageOf(code=1, message="A") returns " failed, code is 1, message is A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0057 begin`);
      const actual: string = reportDrawnMessageOf(1, 'A');
      logInfo(`reportDrawnMessageOf(code=1, message="A"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(71);
      logInfo(`reportDrawnMessageOf(code=1, message="A"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=1, message="A"): actual.substring(39)=${actual.substring(39)}`);
      expect(actual.substring(39)).assertEqual(' failed, code is 1, message is A');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0057 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0058
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0058
     * @tc.desc      reportDrawnMessageOf(code=1, message="Sample Title 123") returns "s 1, message is Sample Title 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0058 begin`);
      const actual: string = reportDrawnMessageOf(1, 'Sample Title 123');
      logInfo(`reportDrawnMessageOf(code=1, message="Sam...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(86);
      logInfo(`reportDrawnMessageOf(code=1, message="Sam...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=1, message="Sam...: actual.substring(54)=${actual.substring(54)}`);
      expect(actual.substring(54)).assertEqual('s 1, message is Sample Title 123');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0058 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0059
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0059
     * @tc.desc      reportDrawnMessageOf(code=1, message="??") returns "ed, code is 1, message is ??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0059 begin`);
      const actual: string = reportDrawnMessageOf(1, '\u4e2d\u6587');
      logInfo(`reportDrawnMessageOf(code=1, message="??"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(72);
      logInfo(`reportDrawnMessageOf(code=1, message="??"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=1, message="??"): actual.substring(44)=${actual.substring(44)}`);
      expect(actual.substring(44)).assertEqual('ed, code is 1, message is \u4e2d\u6587');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0059 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0060
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0060
     * @tc.desc      reportDrawnMessageOf(code=1, message="a") returns " failed, code is 1, message is a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0060 begin`);
      const actual: string = reportDrawnMessageOf(1, 'a');
      logInfo(`reportDrawnMessageOf(code=1, message="a"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(71);
      logInfo(`reportDrawnMessageOf(code=1, message="a"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=1, message="a"): actual.substring(39)=${actual.substring(39)}`);
      expect(actual.substring(39)).assertEqual(' failed, code is 1, message is a');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0060 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0061
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0061
     * @tc.desc      reportDrawnMessageOf(code=1, message="abc") returns "ailed, code is 1, message is abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0061 begin`);
      const actual: string = reportDrawnMessageOf(1, 'abc');
      logInfo(`reportDrawnMessageOf(code=1, message="abc"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(73);
      logInfo(`reportDrawnMessageOf(code=1, message="abc"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=1, message="abc"): actual.substring(41)=${actual.substring(41)}`);
      expect(actual.substring(41)).assertEqual('ailed, code is 1, message is abc');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0061 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0062
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0062
     * @tc.desc      reportDrawnMessageOf(code=1, message="Hello World") returns "ode is 1, message is Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0062 begin`);
      const actual: string = reportDrawnMessageOf(1, 'Hello World');
      logInfo(`reportDrawnMessageOf(code=1, message="Hel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(81);
      logInfo(`reportDrawnMessageOf(code=1, message="Hel...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=1, message="Hel...: actual.substring(49)=${actual.substring(49)}`);
      expect(actual.substring(49)).assertEqual('ode is 1, message is Hello World');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0062 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0063
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0063
     * @tc.desc      reportDrawnMessageOf(code=1, message="123") returns "ailed, code is 1, message is 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0063 begin`);
      const actual: string = reportDrawnMessageOf(1, '123');
      logInfo(`reportDrawnMessageOf(code=1, message="123"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(73);
      logInfo(`reportDrawnMessageOf(code=1, message="123"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=1, message="123"): actual.substring(41)=${actual.substring(41)}`);
      expect(actual.substring(41)).assertEqual('ailed, code is 1, message is 123');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0063 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0064
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0064
     * @tc.desc      reportDrawnMessageOf(code=1, message=" Hello ") returns "d, code is 1, message is  Hello "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0064 begin`);
      const actual: string = reportDrawnMessageOf(1, ' Hello ');
      logInfo(`reportDrawnMessageOf(code=1, message=" He...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(77);
      logInfo(`reportDrawnMessageOf(code=1, message=" He...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=1, message=" He...: actual.substring(45)=${actual.substring(45)}`);
      expect(actual.substring(45)).assertEqual('d, code is 1, message is  Hello ');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0064 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0065
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0065
     * @tc.desc      reportDrawnMessageOf(code=1, message="HelloHello") returns "code is 1, message is HelloHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0065 begin`);
      const actual: string = reportDrawnMessageOf(1, 'HelloHello');
      logInfo(`reportDrawnMessageOf(code=1, message="Hel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(80);
      logInfo(`reportDrawnMessageOf(code=1, message="Hel...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=1, message="Hel...: actual.substring(48)=${actual.substring(48)}`);
      expect(actual.substring(48)).assertEqual('code is 1, message is HelloHello');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0065 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0066
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0066
     * @tc.desc      reportDrawnMessageOf(code=1, message="Hello_1") returns "d, code is 1, message is Hello_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0066 begin`);
      const actual: string = reportDrawnMessageOf(1, 'Hello_1');
      logInfo(`reportDrawnMessageOf(code=1, message="Hel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(77);
      logInfo(`reportDrawnMessageOf(code=1, message="Hel...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=1, message="Hel...: actual.substring(45)=${actual.substring(45)}`);
      expect(actual.substring(45)).assertEqual('d, code is 1, message is Hello_1');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0066 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0067
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0067
     * @tc.desc      reportDrawnMessageOf(code=1, message="xHello") returns "ed, code is 1, message is xHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0067 begin`);
      const actual: string = reportDrawnMessageOf(1, 'xHello');
      logInfo(`reportDrawnMessageOf(code=1, message="xHe...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(76);
      logInfo(`reportDrawnMessageOf(code=1, message="xHe...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=1, message="xHe...: actual.substring(44)=${actual.substring(44)}`);
      expect(actual.substring(44)).assertEqual('ed, code is 1, message is xHello');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0067 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0068
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0068
     * @tc.desc      reportDrawnMessageOf(code=1, message=" hello world ") returns "e is 1, message is  hello world "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0068 begin`);
      const actual: string = reportDrawnMessageOf(1, ' hello world ');
      logInfo(`reportDrawnMessageOf(code=1, message=" he...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(83);
      logInfo(`reportDrawnMessageOf(code=1, message=" he...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=1, message=" he...: actual.substring(51)=${actual.substring(51)}`);
      expect(actual.substring(51)).assertEqual('e is 1, message is  hello world ');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0068 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0069
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0069
     * @tc.desc      reportDrawnMessageOf(code=1, message="hello worldhello world") returns "essage is hello worldhel...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0069 begin`);
      const actual: string = reportDrawnMessageOf(1, 'hello worldhello world');
      logInfo(`reportDrawnMessageOf(code=1, message="hel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(92);
      logInfo(`reportDrawnMessageOf(code=1, message="hel...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=1, message="hel...: actual.substring(60)=${actual.substring(60)}`);
      expect(actual.substring(60)).assertEqual('essage is hello worldhello world');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0069 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0070
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0070
     * @tc.desc      reportDrawnMessageOf(code=1, message="hello world_1") returns "e is 1, message is hello world_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0070 begin`);
      const actual: string = reportDrawnMessageOf(1, 'hello world_1');
      logInfo(`reportDrawnMessageOf(code=1, message="hel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(83);
      logInfo(`reportDrawnMessageOf(code=1, message="hel...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=1, message="hel...: actual.substring(51)=${actual.substring(51)}`);
      expect(actual.substring(51)).assertEqual('e is 1, message is hello world_1');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0070 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0071
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0071
     * @tc.desc      reportDrawnMessageOf(code=1, message="xhello world") returns "de is 1, message is xhello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0071 begin`);
      const actual: string = reportDrawnMessageOf(1, 'xhello world');
      logInfo(`reportDrawnMessageOf(code=1, message="xhe...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(82);
      logInfo(`reportDrawnMessageOf(code=1, message="xhe...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=1, message="xhe...: actual.substring(50)=${actual.substring(50)}`);
      expect(actual.substring(50)).assertEqual('de is 1, message is xhello world');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0071 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0072
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0072
     * @tc.desc      reportDrawnMessageOf(code=1, message="   ") returns "ailed, code is 1, message is    "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0072 begin`);
      const actual: string = reportDrawnMessageOf(1, '   ');
      logInfo(`reportDrawnMessageOf(code=1, message="   "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(73);
      logInfo(`reportDrawnMessageOf(code=1, message="   "): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=1, message="   "): actual.substring(41)=${actual.substring(41)}`);
      expect(actual.substring(41)).assertEqual('ailed, code is 1, message is    ');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0072 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0073
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0073
     * @tc.desc      reportDrawnMessageOf(code=1, message="  ") returns "failed, code is 1, message is   "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0073 begin`);
      const actual: string = reportDrawnMessageOf(1, '  ');
      logInfo(`reportDrawnMessageOf(code=1, message="  "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(72);
      logInfo(`reportDrawnMessageOf(code=1, message="  "): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=1, message="  "): actual.substring(40)=${actual.substring(40)}`);
      expect(actual.substring(40)).assertEqual('failed, code is 1, message is   ');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0073 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0074
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0074
     * @tc.desc      reportDrawnMessageOf(code=401, message="Hello") returns "d, code is 401, message is Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0074 begin`);
      const actual: string = reportDrawnMessageOf(401, 'Hello');
      logInfo(`reportDrawnMessageOf(code=401, message="H...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(77);
      logInfo(`reportDrawnMessageOf(code=401, message="H...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=401, message="H...: actual.substring(45)=${actual.substring(45)}`);
      expect(actual.substring(45)).assertEqual('d, code is 401, message is Hello');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0074 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0075
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0075
     * @tc.desc      reportDrawnMessageOf(code=401, message="hello world") returns "e is 401, message is hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0075 begin`);
      const actual: string = reportDrawnMessageOf(401, 'hello world');
      logInfo(`reportDrawnMessageOf(code=401, message="h...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(83);
      logInfo(`reportDrawnMessageOf(code=401, message="h...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=401, message="h...: actual.substring(51)=${actual.substring(51)}`);
      expect(actual.substring(51)).assertEqual('e is 401, message is hello world');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0075 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0076
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0076
     * @tc.desc      reportDrawnMessageOf(code=401, message="") returns "failed, code is 401, message is "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0076 begin`);
      const actual: string = reportDrawnMessageOf(401, '');
      logInfo(`reportDrawnMessageOf(code=401, message=""): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(72);
      logInfo(`reportDrawnMessageOf(code=401, message=""): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=401, message=""): actual.substring(40)=${actual.substring(40)}`);
      expect(actual.substring(40)).assertEqual('failed, code is 401, message is ');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0076 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_REPORT_DRAWN_MESSAGE_OF_0077
     * @tc.name      UIExtensionSamples_ReportDrawnMessageOf_0077
     * @tc.desc      reportDrawnMessageOf(code=401, message=" ") returns "ailed, code is 401, message is  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ReportDrawnMessageOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0077 begin`);
      const actual: string = reportDrawnMessageOf(401, ' ');
      logInfo(`reportDrawnMessageOf(code=401, message=" "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(73);
      logInfo(`reportDrawnMessageOf(code=401, message=" "): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContent.reportDrawnCo');
      logInfo(`reportDrawnMessageOf(code=401, message=" "): actual.substring(41)=${actual.substring(41)}`);
      expect(actual.substring(41)).assertEqual('ailed, code is 401, message is  ');
      logInfo(`${BUNDLE}ReportDrawnMessageOf_0077 end`);
    });
  });
}
