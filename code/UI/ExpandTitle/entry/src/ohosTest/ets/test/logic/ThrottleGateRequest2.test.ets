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
import { ThrottleGate } from '../model/TitleExpansionLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ExpandTitle]';
const BUNDLE: string = 'ExpandTitle_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for ThrottleGate.request (53 cases). */
export default function throttleGateRequest2Test(): void {
  describe('ThrottleGateRequest2Test', () => {
    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0068
     * @tc.name      ExpandTitle_ThrottleGateRequest_0068
     * @tc.desc      ThrottleGate.request(now=44.42) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0068 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(44.42);
      logInfo(`request(now=44.42): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=44.42) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=44.42) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertClose(44.42, PRECISION);
      logInfo(`request(now=44.42) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0068 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0069
     * @tc.name      ExpandTitle_ThrottleGateRequest_0069
     * @tc.desc      ThrottleGate.request(now=57) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0069 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(57);
      logInfo(`request(now=57): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=57) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=57) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(57);
      logInfo(`request(now=57) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0069 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0070
     * @tc.name      ExpandTitle_ThrottleGateRequest_0070
     * @tc.desc      ThrottleGate.request(now=38.94) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0070 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(38.94);
      logInfo(`request(now=38.94): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=38.94) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=38.94) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertClose(38.94, PRECISION);
      logInfo(`request(now=38.94) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0070 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0071
     * @tc.name      ExpandTitle_ThrottleGateRequest_0071
     * @tc.desc      ThrottleGate.request(now=137) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0071 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(137);
      logInfo(`request(now=137): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=137) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=137) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(137);
      logInfo(`request(now=137) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0071 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0072
     * @tc.name      ExpandTitle_ThrottleGateRequest_0072
     * @tc.desc      ThrottleGate.request(now=90.84) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0072 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(90.84);
      logInfo(`request(now=90.84): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=90.84) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=90.84) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertClose(90.84, PRECISION);
      logInfo(`request(now=90.84) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0072 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0073
     * @tc.name      ExpandTitle_ThrottleGateRequest_0073
     * @tc.desc      ThrottleGate.request(now=59) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0073 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(59);
      logInfo(`request(now=59): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=59) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=59) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(59);
      logInfo(`request(now=59) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0073 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0074
     * @tc.name      ExpandTitle_ThrottleGateRequest_0074
     * @tc.desc      ThrottleGate.request(now=-66) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ThrottleGateRequest_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0074 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(-66);
      logInfo(`request(now=-66): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=-66) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=-66) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(-66);
      logInfo(`request(now=-66) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0074 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0075
     * @tc.name      ExpandTitle_ThrottleGateRequest_0075
     * @tc.desc      ThrottleGate.request(now=49) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0075 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(49);
      logInfo(`request(now=49): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=49) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=49) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(49);
      logInfo(`request(now=49) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0075 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0076
     * @tc.name      ExpandTitle_ThrottleGateRequest_0076
     * @tc.desc      ThrottleGate.request(now=148) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0076 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(148);
      logInfo(`request(now=148): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=148) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=148) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(148);
      logInfo(`request(now=148) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0076 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0077
     * @tc.name      ExpandTitle_ThrottleGateRequest_0077
     * @tc.desc      ThrottleGate.request(now=182) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0077 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(182);
      logInfo(`request(now=182): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=182) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=182) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(182);
      logInfo(`request(now=182) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0077 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0078
     * @tc.name      ExpandTitle_ThrottleGateRequest_0078
     * @tc.desc      ThrottleGate.request(now=-22) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ThrottleGateRequest_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0078 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(-22);
      logInfo(`request(now=-22): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=-22) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=-22) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(-22);
      logInfo(`request(now=-22) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0078 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0079
     * @tc.name      ExpandTitle_ThrottleGateRequest_0079
     * @tc.desc      ThrottleGate.request(now=94) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0079 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(94);
      logInfo(`request(now=94): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=94) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=94) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(94);
      logInfo(`request(now=94) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0079 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0080
     * @tc.name      ExpandTitle_ThrottleGateRequest_0080
     * @tc.desc      ThrottleGate.request(now=16) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0080 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(16);
      logInfo(`request(now=16): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=16) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=16) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(16);
      logInfo(`request(now=16) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0080 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0081
     * @tc.name      ExpandTitle_ThrottleGateRequest_0081
     * @tc.desc      ThrottleGate.request(now=92) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0081 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(92);
      logInfo(`request(now=92): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=92) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=92) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(92);
      logInfo(`request(now=92) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0081 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0082
     * @tc.name      ExpandTitle_ThrottleGateRequest_0082
     * @tc.desc      ThrottleGate.request(now=-76) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ThrottleGateRequest_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0082 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(-76);
      logInfo(`request(now=-76): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=-76) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=-76) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(-76);
      logInfo(`request(now=-76) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0082 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0083
     * @tc.name      ExpandTitle_ThrottleGateRequest_0083
     * @tc.desc      ThrottleGate.request(now=-18) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ThrottleGateRequest_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0083 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(-18);
      logInfo(`request(now=-18): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=-18) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=-18) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(-18);
      logInfo(`request(now=-18) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0083 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0084
     * @tc.name      ExpandTitle_ThrottleGateRequest_0084
     * @tc.desc      ThrottleGate.request(now=70.05) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0084 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(70.05);
      logInfo(`request(now=70.05): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=70.05) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=70.05) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertClose(70.05, PRECISION);
      logInfo(`request(now=70.05) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0084 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0085
     * @tc.name      ExpandTitle_ThrottleGateRequest_0085
     * @tc.desc      ThrottleGate.request(now=29) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0085 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(29);
      logInfo(`request(now=29): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=29) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=29) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(29);
      logInfo(`request(now=29) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0085 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0086
     * @tc.name      ExpandTitle_ThrottleGateRequest_0086
     * @tc.desc      ThrottleGate.request(now=72) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0086 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(72);
      logInfo(`request(now=72): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=72) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=72) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(72);
      logInfo(`request(now=72) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0086 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0087
     * @tc.name      ExpandTitle_ThrottleGateRequest_0087
     * @tc.desc      ThrottleGate.request(now=-86) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ThrottleGateRequest_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0087 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(-86);
      logInfo(`request(now=-86): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=-86) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=-86) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(-86);
      logInfo(`request(now=-86) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0087 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0088
     * @tc.name      ExpandTitle_ThrottleGateRequest_0088
     * @tc.desc      ThrottleGate.request(now=187) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0088 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(187);
      logInfo(`request(now=187): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=187) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=187) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(187);
      logInfo(`request(now=187) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0088 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0089
     * @tc.name      ExpandTitle_ThrottleGateRequest_0089
     * @tc.desc      ThrottleGate.request(now=28.81) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0089 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(28.81);
      logInfo(`request(now=28.81): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=28.81) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=28.81) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertClose(28.81, PRECISION);
      logInfo(`request(now=28.81) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0089 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0090
     * @tc.name      ExpandTitle_ThrottleGateRequest_0090
     * @tc.desc      ThrottleGate.request(now=-23) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ThrottleGateRequest_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0090 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(-23);
      logInfo(`request(now=-23): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=-23) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=-23) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(-23);
      logInfo(`request(now=-23) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0090 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0091
     * @tc.name      ExpandTitle_ThrottleGateRequest_0091
     * @tc.desc      ThrottleGate.request(now=9.95) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0091 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(9.95);
      logInfo(`request(now=9.95): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=9.95) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=9.95) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertClose(9.95, PRECISION);
      logInfo(`request(now=9.95) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0091 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0092
     * @tc.name      ExpandTitle_ThrottleGateRequest_0092
     * @tc.desc      ThrottleGate.request(now=56) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0092 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(56);
      logInfo(`request(now=56): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=56) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=56) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(56);
      logInfo(`request(now=56) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0092 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0093
     * @tc.name      ExpandTitle_ThrottleGateRequest_0093
     * @tc.desc      ThrottleGate.request(now=-59) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ThrottleGateRequest_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0093 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(-59);
      logInfo(`request(now=-59): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=-59) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=-59) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(-59);
      logInfo(`request(now=-59) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0093 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0094
     * @tc.name      ExpandTitle_ThrottleGateRequest_0094
     * @tc.desc      ThrottleGate.request(now=50.17) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0094 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(50.17);
      logInfo(`request(now=50.17): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=50.17) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=50.17) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertClose(50.17, PRECISION);
      logInfo(`request(now=50.17) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0094 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0095
     * @tc.name      ExpandTitle_ThrottleGateRequest_0095
     * @tc.desc      ThrottleGate.request(now=47.73) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0095 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(47.73);
      logInfo(`request(now=47.73): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=47.73) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=47.73) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertClose(47.73, PRECISION);
      logInfo(`request(now=47.73) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0095 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0096
     * @tc.name      ExpandTitle_ThrottleGateRequest_0096
     * @tc.desc      ThrottleGate.request(now=72.56) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0096 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(72.56);
      logInfo(`request(now=72.56): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=72.56) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=72.56) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertClose(72.56, PRECISION);
      logInfo(`request(now=72.56) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0096 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0097
     * @tc.name      ExpandTitle_ThrottleGateRequest_0097
     * @tc.desc      ThrottleGate.request(now=-25) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ThrottleGateRequest_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0097 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(-25);
      logInfo(`request(now=-25): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=-25) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=-25) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(-25);
      logInfo(`request(now=-25) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0097 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0098
     * @tc.name      ExpandTitle_ThrottleGateRequest_0098
     * @tc.desc      ThrottleGate.request(now=-51) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ThrottleGateRequest_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0098 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(-51);
      logInfo(`request(now=-51): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=-51) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=-51) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(-51);
      logInfo(`request(now=-51) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0098 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0099
     * @tc.name      ExpandTitle_ThrottleGateRequest_0099
     * @tc.desc      ThrottleGate.request(now=33) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0099 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(33);
      logInfo(`request(now=33): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=33) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=33) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(33);
      logInfo(`request(now=33) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0099 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0100
     * @tc.name      ExpandTitle_ThrottleGateRequest_0100
     * @tc.desc      ThrottleGate.request(now=41.88) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0100 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(41.88);
      logInfo(`request(now=41.88): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=41.88) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=41.88) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertClose(41.88, PRECISION);
      logInfo(`request(now=41.88) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0100 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0101
     * @tc.name      ExpandTitle_ThrottleGateRequest_0101
     * @tc.desc      ThrottleGate.request(now=163) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0101 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(163);
      logInfo(`request(now=163): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=163) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=163) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(163);
      logInfo(`request(now=163) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0101 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0102
     * @tc.name      ExpandTitle_ThrottleGateRequest_0102
     * @tc.desc      ThrottleGate.request(now=64.73) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0102 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(64.73);
      logInfo(`request(now=64.73): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=64.73) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=64.73) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertClose(64.73, PRECISION);
      logInfo(`request(now=64.73) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0102 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0103
     * @tc.name      ExpandTitle_ThrottleGateRequest_0103
     * @tc.desc      ThrottleGate.request(now=-2) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ThrottleGateRequest_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0103 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(-2);
      logInfo(`request(now=-2): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=-2) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=-2) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(-2);
      logInfo(`request(now=-2) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0103 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0104
     * @tc.name      ExpandTitle_ThrottleGateRequest_0104
     * @tc.desc      ThrottleGate.request(now=164) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0104 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(164);
      logInfo(`request(now=164): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=164) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=164) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(164);
      logInfo(`request(now=164) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0104 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0105
     * @tc.name      ExpandTitle_ThrottleGateRequest_0105
     * @tc.desc      ThrottleGate.request(now=-40) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ThrottleGateRequest_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0105 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(-40);
      logInfo(`request(now=-40): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=-40) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=-40) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(-40);
      logInfo(`request(now=-40) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0105 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0106
     * @tc.name      ExpandTitle_ThrottleGateRequest_0106
     * @tc.desc      ThrottleGate.request(now=-54) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ThrottleGateRequest_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0106 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(-54);
      logInfo(`request(now=-54): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=-54) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=-54) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(-54);
      logInfo(`request(now=-54) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0106 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0107
     * @tc.name      ExpandTitle_ThrottleGateRequest_0107
     * @tc.desc      ThrottleGate.request(now=17) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0107 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(17);
      logInfo(`request(now=17): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=17) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=17) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(17);
      logInfo(`request(now=17) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0107 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0108
     * @tc.name      ExpandTitle_ThrottleGateRequest_0108
     * @tc.desc      ThrottleGate.request(now=81.59) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0108 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(81.59);
      logInfo(`request(now=81.59): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=81.59) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=81.59) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertClose(81.59, PRECISION);
      logInfo(`request(now=81.59) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0108 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0109
     * @tc.name      ExpandTitle_ThrottleGateRequest_0109
     * @tc.desc      ThrottleGate.request(now=194) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0109 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(194);
      logInfo(`request(now=194): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=194) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=194) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(194);
      logInfo(`request(now=194) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0109 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0110
     * @tc.name      ExpandTitle_ThrottleGateRequest_0110
     * @tc.desc      ThrottleGate.request(now=79) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0110 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(79);
      logInfo(`request(now=79): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=79) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=79) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(79);
      logInfo(`request(now=79) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0110 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0111
     * @tc.name      ExpandTitle_ThrottleGateRequest_0111
     * @tc.desc      ThrottleGate.request(now=69.15) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0111 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(69.15);
      logInfo(`request(now=69.15): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=69.15) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=69.15) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertClose(69.15, PRECISION);
      logInfo(`request(now=69.15) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0111 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0112
     * @tc.name      ExpandTitle_ThrottleGateRequest_0112
     * @tc.desc      ThrottleGate.request(now=87.16) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0112 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(87.16);
      logInfo(`request(now=87.16): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=87.16) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=87.16) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertClose(87.16, PRECISION);
      logInfo(`request(now=87.16) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0112 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0113
     * @tc.name      ExpandTitle_ThrottleGateRequest_0113
     * @tc.desc      ThrottleGate.request(now=54.97) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0113 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(54.97);
      logInfo(`request(now=54.97): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=54.97) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=54.97) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertClose(54.97, PRECISION);
      logInfo(`request(now=54.97) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0113 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0114
     * @tc.name      ExpandTitle_ThrottleGateRequest_0114
     * @tc.desc      ThrottleGate.request(now=33.25) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0114 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(33.25);
      logInfo(`request(now=33.25): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=33.25) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=33.25) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertClose(33.25, PRECISION);
      logInfo(`request(now=33.25) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0114 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0115
     * @tc.name      ExpandTitle_ThrottleGateRequest_0115
     * @tc.desc      ThrottleGate.request(now=-62) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ThrottleGateRequest_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0115 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(-62);
      logInfo(`request(now=-62): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=-62) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=-62) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(-62);
      logInfo(`request(now=-62) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0115 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0116
     * @tc.name      ExpandTitle_ThrottleGateRequest_0116
     * @tc.desc      ThrottleGate.request(now=-75) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ThrottleGateRequest_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0116 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(-75);
      logInfo(`request(now=-75): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=-75) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=-75) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(-75);
      logInfo(`request(now=-75) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0116 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0117
     * @tc.name      ExpandTitle_ThrottleGateRequest_0117
     * @tc.desc      ThrottleGate.request(now=124) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0117 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(124);
      logInfo(`request(now=124): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=124) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=124) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(124);
      logInfo(`request(now=124) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0117 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0118
     * @tc.name      ExpandTitle_ThrottleGateRequest_0118
     * @tc.desc      ThrottleGate.request(now=146) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0118 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(146);
      logInfo(`request(now=146): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=146) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=146) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(146);
      logInfo(`request(now=146) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0118 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0119
     * @tc.name      ExpandTitle_ThrottleGateRequest_0119
     * @tc.desc      ThrottleGate.request(now=-7) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ThrottleGateRequest_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0119 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(-7);
      logInfo(`request(now=-7): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=-7) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=-7) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(-7);
      logInfo(`request(now=-7) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0119 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0120
     * @tc.name      ExpandTitle_ThrottleGateRequest_0120
     * @tc.desc      ThrottleGate.request(now=39) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0120 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(39);
      logInfo(`request(now=39): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=39) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=39) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(39);
      logInfo(`request(now=39) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0120 end`);
    });
  });
}
