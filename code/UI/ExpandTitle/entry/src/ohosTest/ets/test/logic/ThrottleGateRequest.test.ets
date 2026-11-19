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

/** Logic checks for ThrottleGate.request (67 cases). */
export default function throttleGateRequestTest(): void {
  describe('ThrottleGateRequestTest', () => {
    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0001
     * @tc.name      ExpandTitle_ThrottleGateRequest_0001
     * @tc.desc      ThrottleGate.request(now=0) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ExpandTitle_ThrottleGateRequest_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0001 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(0);
      logInfo(`request(now=0): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=0) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=0) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0001 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0002
     * @tc.name      ExpandTitle_ThrottleGateRequest_0002
     * @tc.desc      ThrottleGate.request(now=1) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ExpandTitle_ThrottleGateRequest_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0002 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(1);
      logInfo(`request(now=1): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=1) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=1) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(1);
      logInfo(`request(now=1) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0002 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0003
     * @tc.name      ExpandTitle_ThrottleGateRequest_0003
     * @tc.desc      ThrottleGate.request(now=-1) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ThrottleGateRequest_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0003 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(-1);
      logInfo(`request(now=-1): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=-1) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=-1) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(-1);
      logInfo(`request(now=-1) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0003 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0004
     * @tc.name      ExpandTitle_ThrottleGateRequest_0004
     * @tc.desc      ThrottleGate.request(now=2) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0004 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(2);
      logInfo(`request(now=2): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=2) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=2) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(2);
      logInfo(`request(now=2) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0004 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0005
     * @tc.name      ExpandTitle_ThrottleGateRequest_0005
     * @tc.desc      ThrottleGate.request(now=3) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0005 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(3);
      logInfo(`request(now=3): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=3) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=3) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(3);
      logInfo(`request(now=3) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0005 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0006
     * @tc.name      ExpandTitle_ThrottleGateRequest_0006
     * @tc.desc      ThrottleGate.request(now=10) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0006 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(10);
      logInfo(`request(now=10): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=10) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=10) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(10);
      logInfo(`request(now=10) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0006 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0007
     * @tc.name      ExpandTitle_ThrottleGateRequest_0007
     * @tc.desc      ThrottleGate.request(now=100) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0007 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(100);
      logInfo(`request(now=100): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=100) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=100) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(100);
      logInfo(`request(now=100) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0007 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0008
     * @tc.name      ExpandTitle_ThrottleGateRequest_0008
     * @tc.desc      ThrottleGate.request(now=5) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0008 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(5);
      logInfo(`request(now=5): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=5) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=5) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(5);
      logInfo(`request(now=5) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0008 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0009
     * @tc.name      ExpandTitle_ThrottleGateRequest_0009
     * @tc.desc      ThrottleGate.request(now=15) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0009 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(15);
      logInfo(`request(now=15): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=15) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=15) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(15);
      logInfo(`request(now=15) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0009 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0010
     * @tc.name      ExpandTitle_ThrottleGateRequest_0010
     * @tc.desc      ThrottleGate.request(now=20) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0010 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(20);
      logInfo(`request(now=20): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=20) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=20) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(20);
      logInfo(`request(now=20) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0010 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0011
     * @tc.name      ExpandTitle_ThrottleGateRequest_0011
     * @tc.desc      ThrottleGate.request(now=25) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0011 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(25);
      logInfo(`request(now=25): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=25) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=25) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(25);
      logInfo(`request(now=25) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0011 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0012
     * @tc.name      ExpandTitle_ThrottleGateRequest_0012
     * @tc.desc      ThrottleGate.request(now=30) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0012 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(30);
      logInfo(`request(now=30): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=30) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=30) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(30);
      logInfo(`request(now=30) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0012 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0013
     * @tc.name      ExpandTitle_ThrottleGateRequest_0013
     * @tc.desc      ThrottleGate.request(now=35) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0013 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(35);
      logInfo(`request(now=35): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=35) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=35) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(35);
      logInfo(`request(now=35) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0013 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0014
     * @tc.name      ExpandTitle_ThrottleGateRequest_0014
     * @tc.desc      ThrottleGate.request(now=40) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0014 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(40);
      logInfo(`request(now=40): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=40) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=40) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(40);
      logInfo(`request(now=40) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0014 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0015
     * @tc.name      ExpandTitle_ThrottleGateRequest_0015
     * @tc.desc      ThrottleGate.request(now=45) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0015 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(45);
      logInfo(`request(now=45): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=45) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=45) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(45);
      logInfo(`request(now=45) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0015 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0016
     * @tc.name      ExpandTitle_ThrottleGateRequest_0016
     * @tc.desc      ThrottleGate.request(now=50) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0016 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(50);
      logInfo(`request(now=50): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=50) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=50) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(50);
      logInfo(`request(now=50) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0016 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0017
     * @tc.name      ExpandTitle_ThrottleGateRequest_0017
     * @tc.desc      ThrottleGate.request(now=55) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0017 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(55);
      logInfo(`request(now=55): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=55) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=55) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(55);
      logInfo(`request(now=55) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0017 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0018
     * @tc.name      ExpandTitle_ThrottleGateRequest_0018
     * @tc.desc      ThrottleGate.request(now=60) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0018 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(60);
      logInfo(`request(now=60): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=60) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=60) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(60);
      logInfo(`request(now=60) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0018 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0019
     * @tc.name      ExpandTitle_ThrottleGateRequest_0019
     * @tc.desc      ThrottleGate.request(now=65) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0019 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(65);
      logInfo(`request(now=65): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=65) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=65) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(65);
      logInfo(`request(now=65) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0019 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0020
     * @tc.name      ExpandTitle_ThrottleGateRequest_0020
     * @tc.desc      ThrottleGate.request(now=70) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0020 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(70);
      logInfo(`request(now=70): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=70) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=70) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(70);
      logInfo(`request(now=70) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0020 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0021
     * @tc.name      ExpandTitle_ThrottleGateRequest_0021
     * @tc.desc      ThrottleGate.request(now=75) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0021 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(75);
      logInfo(`request(now=75): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=75) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=75) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(75);
      logInfo(`request(now=75) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0021 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0022
     * @tc.name      ExpandTitle_ThrottleGateRequest_0022
     * @tc.desc      ThrottleGate.request(now=80) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0022 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(80);
      logInfo(`request(now=80): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=80) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=80) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(80);
      logInfo(`request(now=80) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0022 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0023
     * @tc.name      ExpandTitle_ThrottleGateRequest_0023
     * @tc.desc      ThrottleGate.request(now=85) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0023 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(85);
      logInfo(`request(now=85): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=85) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=85) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(85);
      logInfo(`request(now=85) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0023 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0024
     * @tc.name      ExpandTitle_ThrottleGateRequest_0024
     * @tc.desc      ThrottleGate.request(now=90) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0024 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(90);
      logInfo(`request(now=90): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=90) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=90) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(90);
      logInfo(`request(now=90) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0024 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0025
     * @tc.name      ExpandTitle_ThrottleGateRequest_0025
     * @tc.desc      ThrottleGate.request(now=95) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0025 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(95);
      logInfo(`request(now=95): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=95) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=95) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(95);
      logInfo(`request(now=95) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0025 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0026
     * @tc.name      ExpandTitle_ThrottleGateRequest_0026
     * @tc.desc      ThrottleGate.request(now=105) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0026 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(105);
      logInfo(`request(now=105): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=105) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=105) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(105);
      logInfo(`request(now=105) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0026 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0027
     * @tc.name      ExpandTitle_ThrottleGateRequest_0027
     * @tc.desc      ThrottleGate.request(now=110) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0027 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(110);
      logInfo(`request(now=110): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=110) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=110) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(110);
      logInfo(`request(now=110) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0027 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0028
     * @tc.name      ExpandTitle_ThrottleGateRequest_0028
     * @tc.desc      ThrottleGate.request(now=115) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0028 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(115);
      logInfo(`request(now=115): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=115) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=115) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(115);
      logInfo(`request(now=115) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0028 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0029
     * @tc.name      ExpandTitle_ThrottleGateRequest_0029
     * @tc.desc      ThrottleGate.request(now=120) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0029 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(120);
      logInfo(`request(now=120): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=120) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=120) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(120);
      logInfo(`request(now=120) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0029 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0030
     * @tc.name      ExpandTitle_ThrottleGateRequest_0030
     * @tc.desc      ThrottleGate.request(now=125) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0030 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(125);
      logInfo(`request(now=125): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=125) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=125) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(125);
      logInfo(`request(now=125) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0030 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0031
     * @tc.name      ExpandTitle_ThrottleGateRequest_0031
     * @tc.desc      ThrottleGate.request(now=130) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0031 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(130);
      logInfo(`request(now=130): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=130) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=130) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(130);
      logInfo(`request(now=130) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0031 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0032
     * @tc.name      ExpandTitle_ThrottleGateRequest_0032
     * @tc.desc      ThrottleGate.request(now=135) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0032 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(135);
      logInfo(`request(now=135): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=135) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=135) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(135);
      logInfo(`request(now=135) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0032 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0033
     * @tc.name      ExpandTitle_ThrottleGateRequest_0033
     * @tc.desc      ThrottleGate.request(now=140) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0033 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(140);
      logInfo(`request(now=140): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=140) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=140) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(140);
      logInfo(`request(now=140) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0033 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0034
     * @tc.name      ExpandTitle_ThrottleGateRequest_0034
     * @tc.desc      ThrottleGate.request(now=145) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0034 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(145);
      logInfo(`request(now=145): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=145) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=145) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(145);
      logInfo(`request(now=145) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0034 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0035
     * @tc.name      ExpandTitle_ThrottleGateRequest_0035
     * @tc.desc      ThrottleGate.request(now=150) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0035 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(150);
      logInfo(`request(now=150): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=150) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=150) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(150);
      logInfo(`request(now=150) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0035 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0036
     * @tc.name      ExpandTitle_ThrottleGateRequest_0036
     * @tc.desc      ThrottleGate.request(now=155) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0036 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(155);
      logInfo(`request(now=155): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=155) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=155) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(155);
      logInfo(`request(now=155) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0036 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0037
     * @tc.name      ExpandTitle_ThrottleGateRequest_0037
     * @tc.desc      ThrottleGate.request(now=160) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0037 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(160);
      logInfo(`request(now=160): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=160) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=160) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(160);
      logInfo(`request(now=160) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0037 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0038
     * @tc.name      ExpandTitle_ThrottleGateRequest_0038
     * @tc.desc      ThrottleGate.request(now=165) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0038 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(165);
      logInfo(`request(now=165): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=165) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=165) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(165);
      logInfo(`request(now=165) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0038 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0039
     * @tc.name      ExpandTitle_ThrottleGateRequest_0039
     * @tc.desc      ThrottleGate.request(now=170) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0039 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(170);
      logInfo(`request(now=170): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=170) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=170) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(170);
      logInfo(`request(now=170) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0039 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0040
     * @tc.name      ExpandTitle_ThrottleGateRequest_0040
     * @tc.desc      ThrottleGate.request(now=175) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0040 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(175);
      logInfo(`request(now=175): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=175) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=175) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(175);
      logInfo(`request(now=175) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0040 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0041
     * @tc.name      ExpandTitle_ThrottleGateRequest_0041
     * @tc.desc      ThrottleGate.request(now=180) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0041 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(180);
      logInfo(`request(now=180): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=180) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=180) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(180);
      logInfo(`request(now=180) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0041 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0042
     * @tc.name      ExpandTitle_ThrottleGateRequest_0042
     * @tc.desc      ThrottleGate.request(now=185) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0042 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(185);
      logInfo(`request(now=185): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=185) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=185) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(185);
      logInfo(`request(now=185) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0042 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0043
     * @tc.name      ExpandTitle_ThrottleGateRequest_0043
     * @tc.desc      ThrottleGate.request(now=190) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0043 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(190);
      logInfo(`request(now=190): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=190) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=190) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(190);
      logInfo(`request(now=190) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0043 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0044
     * @tc.name      ExpandTitle_ThrottleGateRequest_0044
     * @tc.desc      ThrottleGate.request(now=195) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0044 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(195);
      logInfo(`request(now=195): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=195) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=195) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(195);
      logInfo(`request(now=195) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0044 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0045
     * @tc.name      ExpandTitle_ThrottleGateRequest_0045
     * @tc.desc      ThrottleGate.request(now=200) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0045 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(200);
      logInfo(`request(now=200): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=200) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=200) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(200);
      logInfo(`request(now=200) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0045 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0046
     * @tc.name      ExpandTitle_ThrottleGateRequest_0046
     * @tc.desc      ThrottleGate.request(now=28.27) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0046 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(28.27);
      logInfo(`request(now=28.27): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=28.27) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=28.27) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertClose(28.27, PRECISION);
      logInfo(`request(now=28.27) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0046 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0047
     * @tc.name      ExpandTitle_ThrottleGateRequest_0047
     * @tc.desc      ThrottleGate.request(now=71) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0047 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(71);
      logInfo(`request(now=71): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=71) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=71) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(71);
      logInfo(`request(now=71) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0047 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0048
     * @tc.name      ExpandTitle_ThrottleGateRequest_0048
     * @tc.desc      ThrottleGate.request(now=133) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0048 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(133);
      logInfo(`request(now=133): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=133) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=133) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(133);
      logInfo(`request(now=133) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0048 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0049
     * @tc.name      ExpandTitle_ThrottleGateRequest_0049
     * @tc.desc      ThrottleGate.request(now=82) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0049 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(82);
      logInfo(`request(now=82): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=82) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=82) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(82);
      logInfo(`request(now=82) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0049 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0050
     * @tc.name      ExpandTitle_ThrottleGateRequest_0050
     * @tc.desc      ThrottleGate.request(now=-31) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ThrottleGateRequest_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0050 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(-31);
      logInfo(`request(now=-31): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=-31) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=-31) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(-31);
      logInfo(`request(now=-31) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0050 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0051
     * @tc.name      ExpandTitle_ThrottleGateRequest_0051
     * @tc.desc      ThrottleGate.request(now=60.92) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0051 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(60.92);
      logInfo(`request(now=60.92): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=60.92) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=60.92) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertClose(60.92, PRECISION);
      logInfo(`request(now=60.92) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0051 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0052
     * @tc.name      ExpandTitle_ThrottleGateRequest_0052
     * @tc.desc      ThrottleGate.request(now=127) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0052 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(127);
      logInfo(`request(now=127): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=127) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=127) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(127);
      logInfo(`request(now=127) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0052 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0053
     * @tc.name      ExpandTitle_ThrottleGateRequest_0053
     * @tc.desc      ThrottleGate.request(now=60.61) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0053 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(60.61);
      logInfo(`request(now=60.61): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=60.61) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=60.61) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertClose(60.61, PRECISION);
      logInfo(`request(now=60.61) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0053 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0054
     * @tc.name      ExpandTitle_ThrottleGateRequest_0054
     * @tc.desc      ThrottleGate.request(now=28) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0054 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(28);
      logInfo(`request(now=28): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=28) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=28) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(28);
      logInfo(`request(now=28) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0054 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0055
     * @tc.name      ExpandTitle_ThrottleGateRequest_0055
     * @tc.desc      ThrottleGate.request(now=34) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0055 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(34);
      logInfo(`request(now=34): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=34) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=34) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(34);
      logInfo(`request(now=34) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0055 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0056
     * @tc.name      ExpandTitle_ThrottleGateRequest_0056
     * @tc.desc      ThrottleGate.request(now=199) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0056 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(199);
      logInfo(`request(now=199): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=199) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=199) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(199);
      logInfo(`request(now=199) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0056 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0057
     * @tc.name      ExpandTitle_ThrottleGateRequest_0057
     * @tc.desc      ThrottleGate.request(now=97) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0057 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(97);
      logInfo(`request(now=97): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=97) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=97) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(97);
      logInfo(`request(now=97) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0057 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0058
     * @tc.name      ExpandTitle_ThrottleGateRequest_0058
     * @tc.desc      ThrottleGate.request(now=-12) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ThrottleGateRequest_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0058 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(-12);
      logInfo(`request(now=-12): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=-12) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=-12) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(-12);
      logInfo(`request(now=-12) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0058 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0059
     * @tc.name      ExpandTitle_ThrottleGateRequest_0059
     * @tc.desc      ThrottleGate.request(now=26) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0059 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(26);
      logInfo(`request(now=26): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=26) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=26) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(26);
      logInfo(`request(now=26) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0059 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0060
     * @tc.name      ExpandTitle_ThrottleGateRequest_0060
     * @tc.desc      ThrottleGate.request(now=176) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0060 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(176);
      logInfo(`request(now=176): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=176) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=176) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(176);
      logInfo(`request(now=176) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0060 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0061
     * @tc.name      ExpandTitle_ThrottleGateRequest_0061
     * @tc.desc      ThrottleGate.request(now=95.17) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0061 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(95.17);
      logInfo(`request(now=95.17): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=95.17) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=95.17) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertClose(95.17, PRECISION);
      logInfo(`request(now=95.17) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0061 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0062
     * @tc.name      ExpandTitle_ThrottleGateRequest_0062
     * @tc.desc      ThrottleGate.request(now=177) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0062 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(177);
      logInfo(`request(now=177): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=177) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=177) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(177);
      logInfo(`request(now=177) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0062 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0063
     * @tc.name      ExpandTitle_ThrottleGateRequest_0063
     * @tc.desc      ThrottleGate.request(now=20.27) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0063 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(20.27);
      logInfo(`request(now=20.27): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=20.27) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=20.27) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertClose(20.27, PRECISION);
      logInfo(`request(now=20.27) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0063 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0064
     * @tc.name      ExpandTitle_ThrottleGateRequest_0064
     * @tc.desc      ThrottleGate.request(now=18) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0064 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(18);
      logInfo(`request(now=18): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=18) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=18) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(18);
      logInfo(`request(now=18) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0064 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0065
     * @tc.name      ExpandTitle_ThrottleGateRequest_0065
     * @tc.desc      ThrottleGate.request(now=89.64) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0065 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(89.64);
      logInfo(`request(now=89.64): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=89.64) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=89.64) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertClose(89.64, PRECISION);
      logInfo(`request(now=89.64) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0065 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0066
     * @tc.name      ExpandTitle_ThrottleGateRequest_0066
     * @tc.desc      ThrottleGate.request(now=168) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ThrottleGateRequest_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0066 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(168);
      logInfo(`request(now=168): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=168) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=168) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(168);
      logInfo(`request(now=168) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0066 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_THROTTLE_GATE_REQUEST_0067
     * @tc.name      ExpandTitle_ThrottleGateRequest_0067
     * @tc.desc      ThrottleGate.request(now=-42) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ThrottleGateRequest_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ThrottleGateRequest_0067 begin`);
      const subject: ThrottleGate = new ThrottleGate();
      const actual: boolean = subject.request(-42);
      logInfo(`request(now=-42): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`request(now=-42) state: subject.open=${subject.open}`);
      expect(subject.open).assertFalse();
      logInfo(`request(now=-42) state: subject.openedAt=${subject.openedAt}`);
      expect(subject.openedAt).assertEqual(-42);
      logInfo(`request(now=-42) state: subject.passed=${subject.passed}`);
      expect(subject.passed).assertEqual(1);
      logInfo(`${BUNDLE}ThrottleGateRequest_0067 end`);
    });
  });
}
