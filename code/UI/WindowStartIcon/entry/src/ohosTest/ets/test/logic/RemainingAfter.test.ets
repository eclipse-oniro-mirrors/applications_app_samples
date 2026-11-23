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

import { beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { yieldToEventLoop } from '../YieldToEventLoop';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { remainingAfter } from '../model/AdvertisingLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_WindowStartIcon]';
const BUNDLE: string = 'WindowStartIcon_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for remainingAfter (96 cases). */
export default function remainingAfterTest(): void {
  describe('RemainingAfterTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0001
     * @tc.name      WindowStartIcon_RemainingAfter_0001
     * @tc.desc      remainingAfter(ticks=0, initial=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('WindowStartIcon_RemainingAfter_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RemainingAfter_0001 begin`);
      const actual: number = remainingAfter(0, 0);
      logInfo(`remainingAfter(ticks=0, initial=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0001 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0002
     * @tc.name      WindowStartIcon_RemainingAfter_0002
     * @tc.desc      remainingAfter(ticks=0, initial=-1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('WindowStartIcon_RemainingAfter_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RemainingAfter_0002 begin`);
      const actual: number = remainingAfter(0, -1);
      logInfo(`remainingAfter(ticks=0, initial=-1): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}RemainingAfter_0002 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0003
     * @tc.name      WindowStartIcon_RemainingAfter_0003
     * @tc.desc      remainingAfter(ticks=0, initial=1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0003 begin`);
      const actual: number = remainingAfter(0, 1);
      logInfo(`remainingAfter(ticks=0, initial=1): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}RemainingAfter_0003 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0004
     * @tc.name      WindowStartIcon_RemainingAfter_0004
     * @tc.desc      remainingAfter(ticks=0, initial=2) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0004 begin`);
      const actual: number = remainingAfter(0, 2);
      logInfo(`remainingAfter(ticks=0, initial=2): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}RemainingAfter_0004 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0005
     * @tc.name      WindowStartIcon_RemainingAfter_0005
     * @tc.desc      remainingAfter(ticks=0, initial=3) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0005 begin`);
      const actual: number = remainingAfter(0, 3);
      logInfo(`remainingAfter(ticks=0, initial=3): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}RemainingAfter_0005 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0006
     * @tc.name      WindowStartIcon_RemainingAfter_0006
     * @tc.desc      remainingAfter(ticks=0, initial=10) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0006 begin`);
      const actual: number = remainingAfter(0, 10);
      logInfo(`remainingAfter(ticks=0, initial=10): actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}RemainingAfter_0006 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0007
     * @tc.name      WindowStartIcon_RemainingAfter_0007
     * @tc.desc      remainingAfter(ticks=0, initial=100) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0007 begin`);
      const actual: number = remainingAfter(0, 100);
      logInfo(`remainingAfter(ticks=0, initial=100): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}RemainingAfter_0007 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0008
     * @tc.name      WindowStartIcon_RemainingAfter_0008
     * @tc.desc      remainingAfter(ticks=0, initial=5) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0008 begin`);
      const actual: number = remainingAfter(0, 5);
      logInfo(`remainingAfter(ticks=0, initial=5): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}RemainingAfter_0008 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0009
     * @tc.name      WindowStartIcon_RemainingAfter_0009
     * @tc.desc      remainingAfter(ticks=0, initial=15) returns 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0009 begin`);
      const actual: number = remainingAfter(0, 15);
      logInfo(`remainingAfter(ticks=0, initial=15): actual=${actual}`);
      expect(actual).assertEqual(15);
      logInfo(`${BUNDLE}RemainingAfter_0009 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0010
     * @tc.name      WindowStartIcon_RemainingAfter_0010
     * @tc.desc      remainingAfter(ticks=0, initial=20) returns 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0010 begin`);
      const actual: number = remainingAfter(0, 20);
      logInfo(`remainingAfter(ticks=0, initial=20): actual=${actual}`);
      expect(actual).assertEqual(20);
      logInfo(`${BUNDLE}RemainingAfter_0010 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0011
     * @tc.name      WindowStartIcon_RemainingAfter_0011
     * @tc.desc      remainingAfter(ticks=0, initial=25) returns 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0011 begin`);
      const actual: number = remainingAfter(0, 25);
      logInfo(`remainingAfter(ticks=0, initial=25): actual=${actual}`);
      expect(actual).assertEqual(25);
      logInfo(`${BUNDLE}RemainingAfter_0011 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0012
     * @tc.name      WindowStartIcon_RemainingAfter_0012
     * @tc.desc      remainingAfter(ticks=0, initial=30) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0012 begin`);
      const actual: number = remainingAfter(0, 30);
      logInfo(`remainingAfter(ticks=0, initial=30): actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}RemainingAfter_0012 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0013
     * @tc.name      WindowStartIcon_RemainingAfter_0013
     * @tc.desc      remainingAfter(ticks=0, initial=35) returns 35
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0013 begin`);
      const actual: number = remainingAfter(0, 35);
      logInfo(`remainingAfter(ticks=0, initial=35): actual=${actual}`);
      expect(actual).assertEqual(35);
      logInfo(`${BUNDLE}RemainingAfter_0013 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0014
     * @tc.name      WindowStartIcon_RemainingAfter_0014
     * @tc.desc      remainingAfter(ticks=0, initial=40) returns 40
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0014 begin`);
      const actual: number = remainingAfter(0, 40);
      logInfo(`remainingAfter(ticks=0, initial=40): actual=${actual}`);
      expect(actual).assertEqual(40);
      logInfo(`${BUNDLE}RemainingAfter_0014 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0015
     * @tc.name      WindowStartIcon_RemainingAfter_0015
     * @tc.desc      remainingAfter(ticks=0, initial=45) returns 45
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0015 begin`);
      const actual: number = remainingAfter(0, 45);
      logInfo(`remainingAfter(ticks=0, initial=45): actual=${actual}`);
      expect(actual).assertEqual(45);
      logInfo(`${BUNDLE}RemainingAfter_0015 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0016
     * @tc.name      WindowStartIcon_RemainingAfter_0016
     * @tc.desc      remainingAfter(ticks=0, initial=50) returns 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0016 begin`);
      const actual: number = remainingAfter(0, 50);
      logInfo(`remainingAfter(ticks=0, initial=50): actual=${actual}`);
      expect(actual).assertEqual(50);
      logInfo(`${BUNDLE}RemainingAfter_0016 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0017
     * @tc.name      WindowStartIcon_RemainingAfter_0017
     * @tc.desc      remainingAfter(ticks=0, initial=55) returns 55
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0017 begin`);
      const actual: number = remainingAfter(0, 55);
      logInfo(`remainingAfter(ticks=0, initial=55): actual=${actual}`);
      expect(actual).assertEqual(55);
      logInfo(`${BUNDLE}RemainingAfter_0017 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0018
     * @tc.name      WindowStartIcon_RemainingAfter_0018
     * @tc.desc      remainingAfter(ticks=0, initial=60) returns 60
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0018 begin`);
      const actual: number = remainingAfter(0, 60);
      logInfo(`remainingAfter(ticks=0, initial=60): actual=${actual}`);
      expect(actual).assertEqual(60);
      logInfo(`${BUNDLE}RemainingAfter_0018 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0019
     * @tc.name      WindowStartIcon_RemainingAfter_0019
     * @tc.desc      remainingAfter(ticks=0, initial=65) returns 65
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0019 begin`);
      const actual: number = remainingAfter(0, 65);
      logInfo(`remainingAfter(ticks=0, initial=65): actual=${actual}`);
      expect(actual).assertEqual(65);
      logInfo(`${BUNDLE}RemainingAfter_0019 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0020
     * @tc.name      WindowStartIcon_RemainingAfter_0020
     * @tc.desc      remainingAfter(ticks=0, initial=70) returns 70
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0020 begin`);
      const actual: number = remainingAfter(0, 70);
      logInfo(`remainingAfter(ticks=0, initial=70): actual=${actual}`);
      expect(actual).assertEqual(70);
      logInfo(`${BUNDLE}RemainingAfter_0020 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0021
     * @tc.name      WindowStartIcon_RemainingAfter_0021
     * @tc.desc      remainingAfter(ticks=0, initial=75) returns 75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0021 begin`);
      const actual: number = remainingAfter(0, 75);
      logInfo(`remainingAfter(ticks=0, initial=75): actual=${actual}`);
      expect(actual).assertEqual(75);
      logInfo(`${BUNDLE}RemainingAfter_0021 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0022
     * @tc.name      WindowStartIcon_RemainingAfter_0022
     * @tc.desc      remainingAfter(ticks=0, initial=80) returns 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0022 begin`);
      const actual: number = remainingAfter(0, 80);
      logInfo(`remainingAfter(ticks=0, initial=80): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}RemainingAfter_0022 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0023
     * @tc.name      WindowStartIcon_RemainingAfter_0023
     * @tc.desc      remainingAfter(ticks=0, initial=85) returns 85
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0023 begin`);
      const actual: number = remainingAfter(0, 85);
      logInfo(`remainingAfter(ticks=0, initial=85): actual=${actual}`);
      expect(actual).assertEqual(85);
      logInfo(`${BUNDLE}RemainingAfter_0023 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0024
     * @tc.name      WindowStartIcon_RemainingAfter_0024
     * @tc.desc      remainingAfter(ticks=0, initial=90) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0024 begin`);
      const actual: number = remainingAfter(0, 90);
      logInfo(`remainingAfter(ticks=0, initial=90): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}RemainingAfter_0024 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0025
     * @tc.name      WindowStartIcon_RemainingAfter_0025
     * @tc.desc      remainingAfter(ticks=0, initial=95) returns 95
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0025 begin`);
      const actual: number = remainingAfter(0, 95);
      logInfo(`remainingAfter(ticks=0, initial=95): actual=${actual}`);
      expect(actual).assertEqual(95);
      logInfo(`${BUNDLE}RemainingAfter_0025 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0026
     * @tc.name      WindowStartIcon_RemainingAfter_0026
     * @tc.desc      remainingAfter(ticks=0, initial=105) returns 105
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0026 begin`);
      const actual: number = remainingAfter(0, 105);
      logInfo(`remainingAfter(ticks=0, initial=105): actual=${actual}`);
      expect(actual).assertEqual(105);
      logInfo(`${BUNDLE}RemainingAfter_0026 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0027
     * @tc.name      WindowStartIcon_RemainingAfter_0027
     * @tc.desc      remainingAfter(ticks=0, initial=110) returns 110
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0027 begin`);
      const actual: number = remainingAfter(0, 110);
      logInfo(`remainingAfter(ticks=0, initial=110): actual=${actual}`);
      expect(actual).assertEqual(110);
      logInfo(`${BUNDLE}RemainingAfter_0027 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0028
     * @tc.name      WindowStartIcon_RemainingAfter_0028
     * @tc.desc      remainingAfter(ticks=0, initial=115) returns 115
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0028 begin`);
      const actual: number = remainingAfter(0, 115);
      logInfo(`remainingAfter(ticks=0, initial=115): actual=${actual}`);
      expect(actual).assertEqual(115);
      logInfo(`${BUNDLE}RemainingAfter_0028 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0029
     * @tc.name      WindowStartIcon_RemainingAfter_0029
     * @tc.desc      remainingAfter(ticks=0, initial=120) returns 120
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0029 begin`);
      const actual: number = remainingAfter(0, 120);
      logInfo(`remainingAfter(ticks=0, initial=120): actual=${actual}`);
      expect(actual).assertEqual(120);
      logInfo(`${BUNDLE}RemainingAfter_0029 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0030
     * @tc.name      WindowStartIcon_RemainingAfter_0030
     * @tc.desc      remainingAfter(ticks=0, initial=125) returns 125
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0030 begin`);
      const actual: number = remainingAfter(0, 125);
      logInfo(`remainingAfter(ticks=0, initial=125): actual=${actual}`);
      expect(actual).assertEqual(125);
      logInfo(`${BUNDLE}RemainingAfter_0030 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0031
     * @tc.name      WindowStartIcon_RemainingAfter_0031
     * @tc.desc      remainingAfter(ticks=0, initial=130) returns 130
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0031 begin`);
      const actual: number = remainingAfter(0, 130);
      logInfo(`remainingAfter(ticks=0, initial=130): actual=${actual}`);
      expect(actual).assertEqual(130);
      logInfo(`${BUNDLE}RemainingAfter_0031 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0032
     * @tc.name      WindowStartIcon_RemainingAfter_0032
     * @tc.desc      remainingAfter(ticks=0, initial=135) returns 135
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0032 begin`);
      const actual: number = remainingAfter(0, 135);
      logInfo(`remainingAfter(ticks=0, initial=135): actual=${actual}`);
      expect(actual).assertEqual(135);
      logInfo(`${BUNDLE}RemainingAfter_0032 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0033
     * @tc.name      WindowStartIcon_RemainingAfter_0033
     * @tc.desc      remainingAfter(ticks=0, initial=140) returns 140
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0033 begin`);
      const actual: number = remainingAfter(0, 140);
      logInfo(`remainingAfter(ticks=0, initial=140): actual=${actual}`);
      expect(actual).assertEqual(140);
      logInfo(`${BUNDLE}RemainingAfter_0033 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0034
     * @tc.name      WindowStartIcon_RemainingAfter_0034
     * @tc.desc      remainingAfter(ticks=0, initial=145) returns 145
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0034 begin`);
      const actual: number = remainingAfter(0, 145);
      logInfo(`remainingAfter(ticks=0, initial=145): actual=${actual}`);
      expect(actual).assertEqual(145);
      logInfo(`${BUNDLE}RemainingAfter_0034 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0035
     * @tc.name      WindowStartIcon_RemainingAfter_0035
     * @tc.desc      remainingAfter(ticks=0, initial=150) returns 150
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0035 begin`);
      const actual: number = remainingAfter(0, 150);
      logInfo(`remainingAfter(ticks=0, initial=150): actual=${actual}`);
      expect(actual).assertEqual(150);
      logInfo(`${BUNDLE}RemainingAfter_0035 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0036
     * @tc.name      WindowStartIcon_RemainingAfter_0036
     * @tc.desc      remainingAfter(ticks=0, initial=155) returns 155
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0036 begin`);
      const actual: number = remainingAfter(0, 155);
      logInfo(`remainingAfter(ticks=0, initial=155): actual=${actual}`);
      expect(actual).assertEqual(155);
      logInfo(`${BUNDLE}RemainingAfter_0036 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0037
     * @tc.name      WindowStartIcon_RemainingAfter_0037
     * @tc.desc      remainingAfter(ticks=0, initial=160) returns 160
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0037 begin`);
      const actual: number = remainingAfter(0, 160);
      logInfo(`remainingAfter(ticks=0, initial=160): actual=${actual}`);
      expect(actual).assertEqual(160);
      logInfo(`${BUNDLE}RemainingAfter_0037 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0038
     * @tc.name      WindowStartIcon_RemainingAfter_0038
     * @tc.desc      remainingAfter(ticks=0, initial=165) returns 165
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0038 begin`);
      const actual: number = remainingAfter(0, 165);
      logInfo(`remainingAfter(ticks=0, initial=165): actual=${actual}`);
      expect(actual).assertEqual(165);
      logInfo(`${BUNDLE}RemainingAfter_0038 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0039
     * @tc.name      WindowStartIcon_RemainingAfter_0039
     * @tc.desc      remainingAfter(ticks=0, initial=170) returns 170
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0039 begin`);
      const actual: number = remainingAfter(0, 170);
      logInfo(`remainingAfter(ticks=0, initial=170): actual=${actual}`);
      expect(actual).assertEqual(170);
      logInfo(`${BUNDLE}RemainingAfter_0039 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0040
     * @tc.name      WindowStartIcon_RemainingAfter_0040
     * @tc.desc      remainingAfter(ticks=0, initial=175) returns 175
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0040 begin`);
      const actual: number = remainingAfter(0, 175);
      logInfo(`remainingAfter(ticks=0, initial=175): actual=${actual}`);
      expect(actual).assertEqual(175);
      logInfo(`${BUNDLE}RemainingAfter_0040 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0041
     * @tc.name      WindowStartIcon_RemainingAfter_0041
     * @tc.desc      remainingAfter(ticks=0, initial=180) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0041 begin`);
      const actual: number = remainingAfter(0, 180);
      logInfo(`remainingAfter(ticks=0, initial=180): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}RemainingAfter_0041 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0042
     * @tc.name      WindowStartIcon_RemainingAfter_0042
     * @tc.desc      remainingAfter(ticks=0, initial=185) returns 185
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0042 begin`);
      const actual: number = remainingAfter(0, 185);
      logInfo(`remainingAfter(ticks=0, initial=185): actual=${actual}`);
      expect(actual).assertEqual(185);
      logInfo(`${BUNDLE}RemainingAfter_0042 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0043
     * @tc.name      WindowStartIcon_RemainingAfter_0043
     * @tc.desc      remainingAfter(ticks=0, initial=190) returns 190
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0043 begin`);
      const actual: number = remainingAfter(0, 190);
      logInfo(`remainingAfter(ticks=0, initial=190): actual=${actual}`);
      expect(actual).assertEqual(190);
      logInfo(`${BUNDLE}RemainingAfter_0043 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0044
     * @tc.name      WindowStartIcon_RemainingAfter_0044
     * @tc.desc      remainingAfter(ticks=0, initial=195) returns 195
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0044 begin`);
      const actual: number = remainingAfter(0, 195);
      logInfo(`remainingAfter(ticks=0, initial=195): actual=${actual}`);
      expect(actual).assertEqual(195);
      logInfo(`${BUNDLE}RemainingAfter_0044 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0045
     * @tc.name      WindowStartIcon_RemainingAfter_0045
     * @tc.desc      remainingAfter(ticks=0, initial=200) returns 200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0045 begin`);
      const actual: number = remainingAfter(0, 200);
      logInfo(`remainingAfter(ticks=0, initial=200): actual=${actual}`);
      expect(actual).assertEqual(200);
      logInfo(`${BUNDLE}RemainingAfter_0045 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0046
     * @tc.name      WindowStartIcon_RemainingAfter_0046
     * @tc.desc      remainingAfter(ticks=0, initial=61) returns 61
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0046 begin`);
      const actual: number = remainingAfter(0, 61);
      logInfo(`remainingAfter(ticks=0, initial=61): actual=${actual}`);
      expect(actual).assertEqual(61);
      logInfo(`${BUNDLE}RemainingAfter_0046 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0047
     * @tc.name      WindowStartIcon_RemainingAfter_0047
     * @tc.desc      remainingAfter(ticks=0, initial=-73) returns -73
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_RemainingAfter_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RemainingAfter_0047 begin`);
      const actual: number = remainingAfter(0, -73);
      logInfo(`remainingAfter(ticks=0, initial=-73): actual=${actual}`);
      expect(actual).assertEqual(-73);
      logInfo(`${BUNDLE}RemainingAfter_0047 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0048
     * @tc.name      WindowStartIcon_RemainingAfter_0048
     * @tc.desc      remainingAfter(ticks=0, initial=142) returns 142
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0048 begin`);
      const actual: number = remainingAfter(0, 142);
      logInfo(`remainingAfter(ticks=0, initial=142): actual=${actual}`);
      expect(actual).assertEqual(142);
      logInfo(`${BUNDLE}RemainingAfter_0048 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0049
     * @tc.name      WindowStartIcon_RemainingAfter_0049
     * @tc.desc      remainingAfter(ticks=0, initial=133) returns 133
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0049 begin`);
      const actual: number = remainingAfter(0, 133);
      logInfo(`remainingAfter(ticks=0, initial=133): actual=${actual}`);
      expect(actual).assertEqual(133);
      logInfo(`${BUNDLE}RemainingAfter_0049 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0050
     * @tc.name      WindowStartIcon_RemainingAfter_0050
     * @tc.desc      remainingAfter(ticks=0, initial=91) returns 91
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0050 begin`);
      const actual: number = remainingAfter(0, 91);
      logInfo(`remainingAfter(ticks=0, initial=91): actual=${actual}`);
      expect(actual).assertEqual(91);
      logInfo(`${BUNDLE}RemainingAfter_0050 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0051
     * @tc.name      WindowStartIcon_RemainingAfter_0051
     * @tc.desc      remainingAfter(ticks=0, initial=176) returns 176
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0051 begin`);
      const actual: number = remainingAfter(0, 176);
      logInfo(`remainingAfter(ticks=0, initial=176): actual=${actual}`);
      expect(actual).assertEqual(176);
      logInfo(`${BUNDLE}RemainingAfter_0051 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0052
     * @tc.name      WindowStartIcon_RemainingAfter_0052
     * @tc.desc      remainingAfter(ticks=0, initial=-92) returns -92
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_RemainingAfter_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RemainingAfter_0052 begin`);
      const actual: number = remainingAfter(0, -92);
      logInfo(`remainingAfter(ticks=0, initial=-92): actual=${actual}`);
      expect(actual).assertEqual(-92);
      logInfo(`${BUNDLE}RemainingAfter_0052 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0053
     * @tc.name      WindowStartIcon_RemainingAfter_0053
     * @tc.desc      remainingAfter(ticks=0, initial=75.76) returns 75.76
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0053 begin`);
      const actual: number = remainingAfter(0, 75.76);
      logInfo(`remainingAfter(ticks=0, initial=75.76): actual=${actual}`);
      expect(actual).assertClose(75.76, PRECISION);
      logInfo(`${BUNDLE}RemainingAfter_0053 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0054
     * @tc.name      WindowStartIcon_RemainingAfter_0054
     * @tc.desc      remainingAfter(ticks=0, initial=136) returns 136
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0054 begin`);
      const actual: number = remainingAfter(0, 136);
      logInfo(`remainingAfter(ticks=0, initial=136): actual=${actual}`);
      expect(actual).assertEqual(136);
      logInfo(`${BUNDLE}RemainingAfter_0054 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0055
     * @tc.name      WindowStartIcon_RemainingAfter_0055
     * @tc.desc      remainingAfter(ticks=0, initial=-47) returns -47
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_RemainingAfter_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RemainingAfter_0055 begin`);
      const actual: number = remainingAfter(0, -47);
      logInfo(`remainingAfter(ticks=0, initial=-47): actual=${actual}`);
      expect(actual).assertEqual(-47);
      logInfo(`${BUNDLE}RemainingAfter_0055 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0056
     * @tc.name      WindowStartIcon_RemainingAfter_0056
     * @tc.desc      remainingAfter(ticks=0, initial=41.89) returns 41.89
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0056 begin`);
      const actual: number = remainingAfter(0, 41.89);
      logInfo(`remainingAfter(ticks=0, initial=41.89): actual=${actual}`);
      expect(actual).assertClose(41.89, PRECISION);
      logInfo(`${BUNDLE}RemainingAfter_0056 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0057
     * @tc.name      WindowStartIcon_RemainingAfter_0057
     * @tc.desc      remainingAfter(ticks=0, initial=96.17) returns 96.17
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0057 begin`);
      const actual: number = remainingAfter(0, 96.17);
      logInfo(`remainingAfter(ticks=0, initial=96.17): actual=${actual}`);
      expect(actual).assertClose(96.17, PRECISION);
      logInfo(`${BUNDLE}RemainingAfter_0057 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0058
     * @tc.name      WindowStartIcon_RemainingAfter_0058
     * @tc.desc      remainingAfter(ticks=0, initial=159) returns 159
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0058 begin`);
      const actual: number = remainingAfter(0, 159);
      logInfo(`remainingAfter(ticks=0, initial=159): actual=${actual}`);
      expect(actual).assertEqual(159);
      logInfo(`${BUNDLE}RemainingAfter_0058 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0059
     * @tc.name      WindowStartIcon_RemainingAfter_0059
     * @tc.desc      remainingAfter(ticks=0, initial=67.03) returns 67.03
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0059 begin`);
      const actual: number = remainingAfter(0, 67.03);
      logInfo(`remainingAfter(ticks=0, initial=67.03): actual=${actual}`);
      expect(actual).assertClose(67.03, PRECISION);
      logInfo(`${BUNDLE}RemainingAfter_0059 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0060
     * @tc.name      WindowStartIcon_RemainingAfter_0060
     * @tc.desc      remainingAfter(ticks=0, initial=-26) returns -26
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_RemainingAfter_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RemainingAfter_0060 begin`);
      const actual: number = remainingAfter(0, -26);
      logInfo(`remainingAfter(ticks=0, initial=-26): actual=${actual}`);
      expect(actual).assertEqual(-26);
      logInfo(`${BUNDLE}RemainingAfter_0060 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0061
     * @tc.name      WindowStartIcon_RemainingAfter_0061
     * @tc.desc      remainingAfter(ticks=21, initial=40) returns 19
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0061 begin`);
      const actual: number = remainingAfter(21, 40);
      logInfo(`remainingAfter(ticks=21, initial=40): actual=${actual}`);
      expect(actual).assertEqual(19);
      logInfo(`${BUNDLE}RemainingAfter_0061 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0062
     * @tc.name      WindowStartIcon_RemainingAfter_0062
     * @tc.desc      remainingAfter(ticks=97, initial=150) returns 53
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0062 begin`);
      const actual: number = remainingAfter(97, 150);
      logInfo(`remainingAfter(ticks=97, initial=150): actual=${actual}`);
      expect(actual).assertEqual(53);
      logInfo(`${BUNDLE}RemainingAfter_0062 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0063
     * @tc.name      WindowStartIcon_RemainingAfter_0063
     * @tc.desc      remainingAfter(ticks=40, initial=67.03) returns 27.03
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0063 begin`);
      const actual: number = remainingAfter(40, 67.03);
      logInfo(`remainingAfter(ticks=40, initial=67.03): actual=${actual}`);
      expect(actual).assertClose(27.03, PRECISION);
      logInfo(`${BUNDLE}RemainingAfter_0063 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0064
     * @tc.name      WindowStartIcon_RemainingAfter_0064
     * @tc.desc      remainingAfter(ticks=58.09, initial=95) returns 37
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0064 begin`);
      const actual: number = remainingAfter(58.09, 95);
      logInfo(`remainingAfter(ticks=58.09, initial=95): actual=${actual}`);
      expect(actual).assertEqual(37);
      logInfo(`${BUNDLE}RemainingAfter_0064 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0065
     * @tc.name      WindowStartIcon_RemainingAfter_0065
     * @tc.desc      remainingAfter(ticks=191, initial=195) returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0065 begin`);
      const actual: number = remainingAfter(191, 195);
      logInfo(`remainingAfter(ticks=191, initial=195): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}RemainingAfter_0065 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0066
     * @tc.name      WindowStartIcon_RemainingAfter_0066
     * @tc.desc      remainingAfter(ticks=44, initial=80) returns 36
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0066 begin`);
      const actual: number = remainingAfter(44, 80);
      logInfo(`remainingAfter(ticks=44, initial=80): actual=${actual}`);
      expect(actual).assertEqual(36);
      logInfo(`${BUNDLE}RemainingAfter_0066 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0067
     * @tc.name      WindowStartIcon_RemainingAfter_0067
     * @tc.desc      remainingAfter(ticks=44, initial=195) returns 151
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0067 begin`);
      const actual: number = remainingAfter(44, 195);
      logInfo(`remainingAfter(ticks=44, initial=195): actual=${actual}`);
      expect(actual).assertEqual(151);
      logInfo(`${BUNDLE}RemainingAfter_0067 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0068
     * @tc.name      WindowStartIcon_RemainingAfter_0068
     * @tc.desc      remainingAfter(ticks=97, initial=136) returns 39
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0068 begin`);
      const actual: number = remainingAfter(97, 136);
      logInfo(`remainingAfter(ticks=97, initial=136): actual=${actual}`);
      expect(actual).assertEqual(39);
      logInfo(`${BUNDLE}RemainingAfter_0068 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0069
     * @tc.name      WindowStartIcon_RemainingAfter_0069
     * @tc.desc      remainingAfter(ticks=3, initial=35) returns 32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0069 begin`);
      const actual: number = remainingAfter(3, 35);
      logInfo(`remainingAfter(ticks=3, initial=35): actual=${actual}`);
      expect(actual).assertEqual(32);
      logInfo(`${BUNDLE}RemainingAfter_0069 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0070
     * @tc.name      WindowStartIcon_RemainingAfter_0070
     * @tc.desc      remainingAfter(ticks=1, initial=30) returns 29
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0070 begin`);
      const actual: number = remainingAfter(1, 30);
      logInfo(`remainingAfter(ticks=1, initial=30): actual=${actual}`);
      expect(actual).assertEqual(29);
      logInfo(`${BUNDLE}RemainingAfter_0070 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0071
     * @tc.name      WindowStartIcon_RemainingAfter_0071
     * @tc.desc      remainingAfter(ticks=50.37, initial=61) returns 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0071 begin`);
      const actual: number = remainingAfter(50.37, 61);
      logInfo(`remainingAfter(ticks=50.37, initial=61): actual=${actual}`);
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}RemainingAfter_0071 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0072
     * @tc.name      WindowStartIcon_RemainingAfter_0072
     * @tc.desc      remainingAfter(ticks=4, initial=136) returns 132
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0072 begin`);
      const actual: number = remainingAfter(4, 136);
      logInfo(`remainingAfter(ticks=4, initial=136): actual=${actual}`);
      expect(actual).assertEqual(132);
      logInfo(`${BUNDLE}RemainingAfter_0072 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0073
     * @tc.name      WindowStartIcon_RemainingAfter_0073
     * @tc.desc      remainingAfter(ticks=4, initial=190) returns 186
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0073 begin`);
      const actual: number = remainingAfter(4, 190);
      logInfo(`remainingAfter(ticks=4, initial=190): actual=${actual}`);
      expect(actual).assertEqual(186);
      logInfo(`${BUNDLE}RemainingAfter_0073 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0074
     * @tc.name      WindowStartIcon_RemainingAfter_0074
     * @tc.desc      remainingAfter(ticks=1, initial=70) returns 69
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0074 begin`);
      const actual: number = remainingAfter(1, 70);
      logInfo(`remainingAfter(ticks=1, initial=70): actual=${actual}`);
      expect(actual).assertEqual(69);
      logInfo(`${BUNDLE}RemainingAfter_0074 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0075
     * @tc.name      WindowStartIcon_RemainingAfter_0075
     * @tc.desc      remainingAfter(ticks=30, initial=133) returns 103
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0075 begin`);
      const actual: number = remainingAfter(30, 133);
      logInfo(`remainingAfter(ticks=30, initial=133): actual=${actual}`);
      expect(actual).assertEqual(103);
      logInfo(`${BUNDLE}RemainingAfter_0075 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0076
     * @tc.name      WindowStartIcon_RemainingAfter_0076
     * @tc.desc      remainingAfter(ticks=70, initial=96.17) returns 26.17
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0076 begin`);
      const actual: number = remainingAfter(70, 96.17);
      logInfo(`remainingAfter(ticks=70, initial=96.17): actual=${actual}`);
      expect(actual).assertClose(26.17, PRECISION);
      logInfo(`${BUNDLE}RemainingAfter_0076 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0077
     * @tc.name      WindowStartIcon_RemainingAfter_0077
     * @tc.desc      remainingAfter(ticks=1, initial=15) returns 14
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0077 begin`);
      const actual: number = remainingAfter(1, 15);
      logInfo(`remainingAfter(ticks=1, initial=15): actual=${actual}`);
      expect(actual).assertEqual(14);
      logInfo(`${BUNDLE}RemainingAfter_0077 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0078
     * @tc.name      WindowStartIcon_RemainingAfter_0078
     * @tc.desc      remainingAfter(ticks=85, initial=136) returns 51
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0078 begin`);
      const actual: number = remainingAfter(85, 136);
      logInfo(`remainingAfter(ticks=85, initial=136): actual=${actual}`);
      expect(actual).assertEqual(51);
      logInfo(`${BUNDLE}RemainingAfter_0078 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0079
     * @tc.name      WindowStartIcon_RemainingAfter_0079
     * @tc.desc      remainingAfter(ticks=40, initial=61) returns 21
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0079 begin`);
      const actual: number = remainingAfter(40, 61);
      logInfo(`remainingAfter(ticks=40, initial=61): actual=${actual}`);
      expect(actual).assertEqual(21);
      logInfo(`${BUNDLE}RemainingAfter_0079 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0080
     * @tc.name      WindowStartIcon_RemainingAfter_0080
     * @tc.desc      remainingAfter(ticks=21, initial=120) returns 99
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0080 begin`);
      const actual: number = remainingAfter(21, 120);
      logInfo(`remainingAfter(ticks=21, initial=120): actual=${actual}`);
      expect(actual).assertEqual(99);
      logInfo(`${BUNDLE}RemainingAfter_0080 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0081
     * @tc.name      WindowStartIcon_RemainingAfter_0081
     * @tc.desc      remainingAfter(ticks=60, initial=176) returns 116
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0081 begin`);
      const actual: number = remainingAfter(60, 176);
      logInfo(`remainingAfter(ticks=60, initial=176): actual=${actual}`);
      expect(actual).assertEqual(116);
      logInfo(`${BUNDLE}RemainingAfter_0081 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0082
     * @tc.name      WindowStartIcon_RemainingAfter_0082
     * @tc.desc      remainingAfter(ticks=1, initial=170) returns 169
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0082 begin`);
      const actual: number = remainingAfter(1, 170);
      logInfo(`remainingAfter(ticks=1, initial=170): actual=${actual}`);
      expect(actual).assertEqual(169);
      logInfo(`${BUNDLE}RemainingAfter_0082 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0083
     * @tc.name      WindowStartIcon_RemainingAfter_0083
     * @tc.desc      remainingAfter(ticks=58.09, initial=150) returns 92
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0083 begin`);
      const actual: number = remainingAfter(58.09, 150);
      logInfo(`remainingAfter(ticks=58.09, initial=150): actual=${actual}`);
      expect(actual).assertEqual(92);
      logInfo(`${BUNDLE}RemainingAfter_0083 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0084
     * @tc.name      WindowStartIcon_RemainingAfter_0084
     * @tc.desc      remainingAfter(ticks=58.09, initial=75.76) returns 17.760000000000005
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0084 begin`);
      const actual: number = remainingAfter(58.09, 75.76);
      logInfo(`remainingAfter(ticks=58.09, initial=75.76): actual=${actual}`);
      expect(actual).assertClose(17.760000000000005, PRECISION);
      logInfo(`${BUNDLE}RemainingAfter_0084 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0085
     * @tc.name      WindowStartIcon_RemainingAfter_0085
     * @tc.desc      remainingAfter(ticks=85, initial=91) returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0085 begin`);
      const actual: number = remainingAfter(85, 91);
      logInfo(`remainingAfter(ticks=85, initial=91): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}RemainingAfter_0085 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0086
     * @tc.name      WindowStartIcon_RemainingAfter_0086
     * @tc.desc      remainingAfter(ticks=70, initial=159) returns 89
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0086 begin`);
      const actual: number = remainingAfter(70, 159);
      logInfo(`remainingAfter(ticks=70, initial=159): actual=${actual}`);
      expect(actual).assertEqual(89);
      logInfo(`${BUNDLE}RemainingAfter_0086 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0087
     * @tc.name      WindowStartIcon_RemainingAfter_0087
     * @tc.desc      remainingAfter(ticks=95, initial=133) returns 38
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0087 begin`);
      const actual: number = remainingAfter(95, 133);
      logInfo(`remainingAfter(ticks=95, initial=133): actual=${actual}`);
      expect(actual).assertEqual(38);
      logInfo(`${BUNDLE}RemainingAfter_0087 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0088
     * @tc.name      WindowStartIcon_RemainingAfter_0088
     * @tc.desc      remainingAfter(ticks=2, initial=75) returns 73
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0088 begin`);
      const actual: number = remainingAfter(2, 75);
      logInfo(`remainingAfter(ticks=2, initial=75): actual=${actual}`);
      expect(actual).assertEqual(73);
      logInfo(`${BUNDLE}RemainingAfter_0088 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0089
     * @tc.name      WindowStartIcon_RemainingAfter_0089
     * @tc.desc      remainingAfter(ticks=10, initial=159) returns 149
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0089 begin`);
      const actual: number = remainingAfter(10, 159);
      logInfo(`remainingAfter(ticks=10, initial=159): actual=${actual}`);
      expect(actual).assertEqual(149);
      logInfo(`${BUNDLE}RemainingAfter_0089 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0090
     * @tc.name      WindowStartIcon_RemainingAfter_0090
     * @tc.desc      remainingAfter(ticks=3, initial=65) returns 62
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0090 begin`);
      const actual: number = remainingAfter(3, 65);
      logInfo(`remainingAfter(ticks=3, initial=65): actual=${actual}`);
      expect(actual).assertEqual(62);
      logInfo(`${BUNDLE}RemainingAfter_0090 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0091
     * @tc.name      WindowStartIcon_RemainingAfter_0091
     * @tc.desc      remainingAfter(ticks=162, initial=175) returns 13
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0091 begin`);
      const actual: number = remainingAfter(162, 175);
      logInfo(`remainingAfter(ticks=162, initial=175): actual=${actual}`);
      expect(actual).assertEqual(13);
      logInfo(`${BUNDLE}RemainingAfter_0091 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0092
     * @tc.name      WindowStartIcon_RemainingAfter_0092
     * @tc.desc      remainingAfter(ticks=1, initial=130) returns 129
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0092 begin`);
      const actual: number = remainingAfter(1, 130);
      logInfo(`remainingAfter(ticks=1, initial=130): actual=${actual}`);
      expect(actual).assertEqual(129);
      logInfo(`${BUNDLE}RemainingAfter_0092 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0093
     * @tc.name      WindowStartIcon_RemainingAfter_0093
     * @tc.desc      remainingAfter(ticks=95, initial=159) returns 64
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0093 begin`);
      const actual: number = remainingAfter(95, 159);
      logInfo(`remainingAfter(ticks=95, initial=159): actual=${actual}`);
      expect(actual).assertEqual(64);
      logInfo(`${BUNDLE}RemainingAfter_0093 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0094
     * @tc.name      WindowStartIcon_RemainingAfter_0094
     * @tc.desc      remainingAfter(ticks=35, initial=41.89) returns 6.890000000000001
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0094 begin`);
      const actual: number = remainingAfter(35, 41.89);
      logInfo(`remainingAfter(ticks=35, initial=41.89): actual=${actual}`);
      expect(actual).assertClose(6.890000000000001, PRECISION);
      logInfo(`${BUNDLE}RemainingAfter_0094 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0095
     * @tc.name      WindowStartIcon_RemainingAfter_0095
     * @tc.desc      remainingAfter(ticks=75, initial=142) returns 67
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0095 begin`);
      const actual: number = remainingAfter(75, 142);
      logInfo(`remainingAfter(ticks=75, initial=142): actual=${actual}`);
      expect(actual).assertEqual(67);
      logInfo(`${BUNDLE}RemainingAfter_0095 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0096
     * @tc.name      WindowStartIcon_RemainingAfter_0096
     * @tc.desc      remainingAfter(ticks=2, initial=160) returns 158
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0096 begin`);
      const actual: number = remainingAfter(2, 160);
      logInfo(`remainingAfter(ticks=2, initial=160): actual=${actual}`);
      expect(actual).assertEqual(158);
      logInfo(`${BUNDLE}RemainingAfter_0096 end`);
    });
  });
}
