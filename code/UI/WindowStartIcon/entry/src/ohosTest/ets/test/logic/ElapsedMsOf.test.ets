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
import { elapsedMsOf } from '../model/AdvertisingLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_WindowStartIcon]';
const BUNDLE: string = 'WindowStartIcon_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for elapsedMsOf (96 cases). */
export default function elapsedMsOfTest(): void {
  describe('ElapsedMsOfTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0001
     * @tc.name      WindowStartIcon_ElapsedMsOf_0001
     * @tc.desc      elapsedMsOf(ticks=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('WindowStartIcon_ElapsedMsOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0001 begin`);
      const actual: number = elapsedMsOf(0);
      logInfo(`elapsedMsOf(ticks=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ElapsedMsOf_0001 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0002
     * @tc.name      WindowStartIcon_ElapsedMsOf_0002
     * @tc.desc      elapsedMsOf(ticks=1) returns 1000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('WindowStartIcon_ElapsedMsOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0002 begin`);
      const actual: number = elapsedMsOf(1);
      logInfo(`elapsedMsOf(ticks=1): actual=${actual}`);
      expect(actual).assertEqual(1000);
      logInfo(`${BUNDLE}ElapsedMsOf_0002 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0003
     * @tc.name      WindowStartIcon_ElapsedMsOf_0003
     * @tc.desc      elapsedMsOf(ticks=2) returns 2000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0003 begin`);
      const actual: number = elapsedMsOf(2);
      logInfo(`elapsedMsOf(ticks=2): actual=${actual}`);
      expect(actual).assertEqual(2000);
      logInfo(`${BUNDLE}ElapsedMsOf_0003 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0004
     * @tc.name      WindowStartIcon_ElapsedMsOf_0004
     * @tc.desc      elapsedMsOf(ticks=3) returns 3000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0004 begin`);
      const actual: number = elapsedMsOf(3);
      logInfo(`elapsedMsOf(ticks=3): actual=${actual}`);
      expect(actual).assertEqual(3000);
      logInfo(`${BUNDLE}ElapsedMsOf_0004 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0005
     * @tc.name      WindowStartIcon_ElapsedMsOf_0005
     * @tc.desc      elapsedMsOf(ticks=10) returns 10000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0005 begin`);
      const actual: number = elapsedMsOf(10);
      logInfo(`elapsedMsOf(ticks=10): actual=${actual}`);
      expect(actual).assertEqual(10000);
      logInfo(`${BUNDLE}ElapsedMsOf_0005 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0006
     * @tc.name      WindowStartIcon_ElapsedMsOf_0006
     * @tc.desc      elapsedMsOf(ticks=100) returns 100000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0006 begin`);
      const actual: number = elapsedMsOf(100);
      logInfo(`elapsedMsOf(ticks=100): actual=${actual}`);
      expect(actual).assertEqual(100000);
      logInfo(`${BUNDLE}ElapsedMsOf_0006 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0007
     * @tc.name      WindowStartIcon_ElapsedMsOf_0007
     * @tc.desc      elapsedMsOf(ticks=5) returns 5000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0007 begin`);
      const actual: number = elapsedMsOf(5);
      logInfo(`elapsedMsOf(ticks=5): actual=${actual}`);
      expect(actual).assertEqual(5000);
      logInfo(`${BUNDLE}ElapsedMsOf_0007 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0008
     * @tc.name      WindowStartIcon_ElapsedMsOf_0008
     * @tc.desc      elapsedMsOf(ticks=15) returns 15000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0008 begin`);
      const actual: number = elapsedMsOf(15);
      logInfo(`elapsedMsOf(ticks=15): actual=${actual}`);
      expect(actual).assertEqual(15000);
      logInfo(`${BUNDLE}ElapsedMsOf_0008 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0009
     * @tc.name      WindowStartIcon_ElapsedMsOf_0009
     * @tc.desc      elapsedMsOf(ticks=20) returns 20000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0009 begin`);
      const actual: number = elapsedMsOf(20);
      logInfo(`elapsedMsOf(ticks=20): actual=${actual}`);
      expect(actual).assertEqual(20000);
      logInfo(`${BUNDLE}ElapsedMsOf_0009 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0010
     * @tc.name      WindowStartIcon_ElapsedMsOf_0010
     * @tc.desc      elapsedMsOf(ticks=25) returns 25000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0010 begin`);
      const actual: number = elapsedMsOf(25);
      logInfo(`elapsedMsOf(ticks=25): actual=${actual}`);
      expect(actual).assertEqual(25000);
      logInfo(`${BUNDLE}ElapsedMsOf_0010 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0011
     * @tc.name      WindowStartIcon_ElapsedMsOf_0011
     * @tc.desc      elapsedMsOf(ticks=30) returns 30000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0011 begin`);
      const actual: number = elapsedMsOf(30);
      logInfo(`elapsedMsOf(ticks=30): actual=${actual}`);
      expect(actual).assertEqual(30000);
      logInfo(`${BUNDLE}ElapsedMsOf_0011 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0012
     * @tc.name      WindowStartIcon_ElapsedMsOf_0012
     * @tc.desc      elapsedMsOf(ticks=35) returns 35000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0012 begin`);
      const actual: number = elapsedMsOf(35);
      logInfo(`elapsedMsOf(ticks=35): actual=${actual}`);
      expect(actual).assertEqual(35000);
      logInfo(`${BUNDLE}ElapsedMsOf_0012 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0013
     * @tc.name      WindowStartIcon_ElapsedMsOf_0013
     * @tc.desc      elapsedMsOf(ticks=40) returns 40000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0013 begin`);
      const actual: number = elapsedMsOf(40);
      logInfo(`elapsedMsOf(ticks=40): actual=${actual}`);
      expect(actual).assertEqual(40000);
      logInfo(`${BUNDLE}ElapsedMsOf_0013 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0014
     * @tc.name      WindowStartIcon_ElapsedMsOf_0014
     * @tc.desc      elapsedMsOf(ticks=45) returns 45000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0014 begin`);
      const actual: number = elapsedMsOf(45);
      logInfo(`elapsedMsOf(ticks=45): actual=${actual}`);
      expect(actual).assertEqual(45000);
      logInfo(`${BUNDLE}ElapsedMsOf_0014 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0015
     * @tc.name      WindowStartIcon_ElapsedMsOf_0015
     * @tc.desc      elapsedMsOf(ticks=50) returns 50000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0015 begin`);
      const actual: number = elapsedMsOf(50);
      logInfo(`elapsedMsOf(ticks=50): actual=${actual}`);
      expect(actual).assertEqual(50000);
      logInfo(`${BUNDLE}ElapsedMsOf_0015 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0016
     * @tc.name      WindowStartIcon_ElapsedMsOf_0016
     * @tc.desc      elapsedMsOf(ticks=55) returns 55000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0016 begin`);
      const actual: number = elapsedMsOf(55);
      logInfo(`elapsedMsOf(ticks=55): actual=${actual}`);
      expect(actual).assertEqual(55000);
      logInfo(`${BUNDLE}ElapsedMsOf_0016 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0017
     * @tc.name      WindowStartIcon_ElapsedMsOf_0017
     * @tc.desc      elapsedMsOf(ticks=60) returns 60000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0017 begin`);
      const actual: number = elapsedMsOf(60);
      logInfo(`elapsedMsOf(ticks=60): actual=${actual}`);
      expect(actual).assertEqual(60000);
      logInfo(`${BUNDLE}ElapsedMsOf_0017 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0018
     * @tc.name      WindowStartIcon_ElapsedMsOf_0018
     * @tc.desc      elapsedMsOf(ticks=65) returns 65000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0018 begin`);
      const actual: number = elapsedMsOf(65);
      logInfo(`elapsedMsOf(ticks=65): actual=${actual}`);
      expect(actual).assertEqual(65000);
      logInfo(`${BUNDLE}ElapsedMsOf_0018 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0019
     * @tc.name      WindowStartIcon_ElapsedMsOf_0019
     * @tc.desc      elapsedMsOf(ticks=70) returns 70000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0019 begin`);
      const actual: number = elapsedMsOf(70);
      logInfo(`elapsedMsOf(ticks=70): actual=${actual}`);
      expect(actual).assertEqual(70000);
      logInfo(`${BUNDLE}ElapsedMsOf_0019 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0020
     * @tc.name      WindowStartIcon_ElapsedMsOf_0020
     * @tc.desc      elapsedMsOf(ticks=75) returns 75000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0020 begin`);
      const actual: number = elapsedMsOf(75);
      logInfo(`elapsedMsOf(ticks=75): actual=${actual}`);
      expect(actual).assertEqual(75000);
      logInfo(`${BUNDLE}ElapsedMsOf_0020 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0021
     * @tc.name      WindowStartIcon_ElapsedMsOf_0021
     * @tc.desc      elapsedMsOf(ticks=80) returns 80000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0021 begin`);
      const actual: number = elapsedMsOf(80);
      logInfo(`elapsedMsOf(ticks=80): actual=${actual}`);
      expect(actual).assertEqual(80000);
      logInfo(`${BUNDLE}ElapsedMsOf_0021 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0022
     * @tc.name      WindowStartIcon_ElapsedMsOf_0022
     * @tc.desc      elapsedMsOf(ticks=85) returns 85000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0022 begin`);
      const actual: number = elapsedMsOf(85);
      logInfo(`elapsedMsOf(ticks=85): actual=${actual}`);
      expect(actual).assertEqual(85000);
      logInfo(`${BUNDLE}ElapsedMsOf_0022 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0023
     * @tc.name      WindowStartIcon_ElapsedMsOf_0023
     * @tc.desc      elapsedMsOf(ticks=90) returns 90000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0023 begin`);
      const actual: number = elapsedMsOf(90);
      logInfo(`elapsedMsOf(ticks=90): actual=${actual}`);
      expect(actual).assertEqual(90000);
      logInfo(`${BUNDLE}ElapsedMsOf_0023 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0024
     * @tc.name      WindowStartIcon_ElapsedMsOf_0024
     * @tc.desc      elapsedMsOf(ticks=95) returns 95000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0024 begin`);
      const actual: number = elapsedMsOf(95);
      logInfo(`elapsedMsOf(ticks=95): actual=${actual}`);
      expect(actual).assertEqual(95000);
      logInfo(`${BUNDLE}ElapsedMsOf_0024 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0025
     * @tc.name      WindowStartIcon_ElapsedMsOf_0025
     * @tc.desc      elapsedMsOf(ticks=105) returns 105000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0025 begin`);
      const actual: number = elapsedMsOf(105);
      logInfo(`elapsedMsOf(ticks=105): actual=${actual}`);
      expect(actual).assertEqual(105000);
      logInfo(`${BUNDLE}ElapsedMsOf_0025 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0026
     * @tc.name      WindowStartIcon_ElapsedMsOf_0026
     * @tc.desc      elapsedMsOf(ticks=110) returns 110000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0026 begin`);
      const actual: number = elapsedMsOf(110);
      logInfo(`elapsedMsOf(ticks=110): actual=${actual}`);
      expect(actual).assertEqual(110000);
      logInfo(`${BUNDLE}ElapsedMsOf_0026 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0027
     * @tc.name      WindowStartIcon_ElapsedMsOf_0027
     * @tc.desc      elapsedMsOf(ticks=115) returns 115000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0027 begin`);
      const actual: number = elapsedMsOf(115);
      logInfo(`elapsedMsOf(ticks=115): actual=${actual}`);
      expect(actual).assertEqual(115000);
      logInfo(`${BUNDLE}ElapsedMsOf_0027 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0028
     * @tc.name      WindowStartIcon_ElapsedMsOf_0028
     * @tc.desc      elapsedMsOf(ticks=120) returns 120000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0028 begin`);
      const actual: number = elapsedMsOf(120);
      logInfo(`elapsedMsOf(ticks=120): actual=${actual}`);
      expect(actual).assertEqual(120000);
      logInfo(`${BUNDLE}ElapsedMsOf_0028 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0029
     * @tc.name      WindowStartIcon_ElapsedMsOf_0029
     * @tc.desc      elapsedMsOf(ticks=125) returns 125000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0029 begin`);
      const actual: number = elapsedMsOf(125);
      logInfo(`elapsedMsOf(ticks=125): actual=${actual}`);
      expect(actual).assertEqual(125000);
      logInfo(`${BUNDLE}ElapsedMsOf_0029 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0030
     * @tc.name      WindowStartIcon_ElapsedMsOf_0030
     * @tc.desc      elapsedMsOf(ticks=130) returns 130000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0030 begin`);
      const actual: number = elapsedMsOf(130);
      logInfo(`elapsedMsOf(ticks=130): actual=${actual}`);
      expect(actual).assertEqual(130000);
      logInfo(`${BUNDLE}ElapsedMsOf_0030 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0031
     * @tc.name      WindowStartIcon_ElapsedMsOf_0031
     * @tc.desc      elapsedMsOf(ticks=135) returns 135000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0031 begin`);
      const actual: number = elapsedMsOf(135);
      logInfo(`elapsedMsOf(ticks=135): actual=${actual}`);
      expect(actual).assertEqual(135000);
      logInfo(`${BUNDLE}ElapsedMsOf_0031 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0032
     * @tc.name      WindowStartIcon_ElapsedMsOf_0032
     * @tc.desc      elapsedMsOf(ticks=140) returns 140000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0032 begin`);
      const actual: number = elapsedMsOf(140);
      logInfo(`elapsedMsOf(ticks=140): actual=${actual}`);
      expect(actual).assertEqual(140000);
      logInfo(`${BUNDLE}ElapsedMsOf_0032 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0033
     * @tc.name      WindowStartIcon_ElapsedMsOf_0033
     * @tc.desc      elapsedMsOf(ticks=145) returns 145000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0033 begin`);
      const actual: number = elapsedMsOf(145);
      logInfo(`elapsedMsOf(ticks=145): actual=${actual}`);
      expect(actual).assertEqual(145000);
      logInfo(`${BUNDLE}ElapsedMsOf_0033 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0034
     * @tc.name      WindowStartIcon_ElapsedMsOf_0034
     * @tc.desc      elapsedMsOf(ticks=150) returns 150000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0034 begin`);
      const actual: number = elapsedMsOf(150);
      logInfo(`elapsedMsOf(ticks=150): actual=${actual}`);
      expect(actual).assertEqual(150000);
      logInfo(`${BUNDLE}ElapsedMsOf_0034 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0035
     * @tc.name      WindowStartIcon_ElapsedMsOf_0035
     * @tc.desc      elapsedMsOf(ticks=155) returns 155000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0035 begin`);
      const actual: number = elapsedMsOf(155);
      logInfo(`elapsedMsOf(ticks=155): actual=${actual}`);
      expect(actual).assertEqual(155000);
      logInfo(`${BUNDLE}ElapsedMsOf_0035 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0036
     * @tc.name      WindowStartIcon_ElapsedMsOf_0036
     * @tc.desc      elapsedMsOf(ticks=160) returns 160000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0036 begin`);
      const actual: number = elapsedMsOf(160);
      logInfo(`elapsedMsOf(ticks=160): actual=${actual}`);
      expect(actual).assertEqual(160000);
      logInfo(`${BUNDLE}ElapsedMsOf_0036 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0037
     * @tc.name      WindowStartIcon_ElapsedMsOf_0037
     * @tc.desc      elapsedMsOf(ticks=165) returns 165000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0037 begin`);
      const actual: number = elapsedMsOf(165);
      logInfo(`elapsedMsOf(ticks=165): actual=${actual}`);
      expect(actual).assertEqual(165000);
      logInfo(`${BUNDLE}ElapsedMsOf_0037 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0038
     * @tc.name      WindowStartIcon_ElapsedMsOf_0038
     * @tc.desc      elapsedMsOf(ticks=170) returns 170000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0038 begin`);
      const actual: number = elapsedMsOf(170);
      logInfo(`elapsedMsOf(ticks=170): actual=${actual}`);
      expect(actual).assertEqual(170000);
      logInfo(`${BUNDLE}ElapsedMsOf_0038 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0039
     * @tc.name      WindowStartIcon_ElapsedMsOf_0039
     * @tc.desc      elapsedMsOf(ticks=175) returns 175000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0039 begin`);
      const actual: number = elapsedMsOf(175);
      logInfo(`elapsedMsOf(ticks=175): actual=${actual}`);
      expect(actual).assertEqual(175000);
      logInfo(`${BUNDLE}ElapsedMsOf_0039 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0040
     * @tc.name      WindowStartIcon_ElapsedMsOf_0040
     * @tc.desc      elapsedMsOf(ticks=180) returns 180000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0040 begin`);
      const actual: number = elapsedMsOf(180);
      logInfo(`elapsedMsOf(ticks=180): actual=${actual}`);
      expect(actual).assertEqual(180000);
      logInfo(`${BUNDLE}ElapsedMsOf_0040 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0041
     * @tc.name      WindowStartIcon_ElapsedMsOf_0041
     * @tc.desc      elapsedMsOf(ticks=185) returns 185000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0041 begin`);
      const actual: number = elapsedMsOf(185);
      logInfo(`elapsedMsOf(ticks=185): actual=${actual}`);
      expect(actual).assertEqual(185000);
      logInfo(`${BUNDLE}ElapsedMsOf_0041 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0042
     * @tc.name      WindowStartIcon_ElapsedMsOf_0042
     * @tc.desc      elapsedMsOf(ticks=190) returns 190000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0042 begin`);
      const actual: number = elapsedMsOf(190);
      logInfo(`elapsedMsOf(ticks=190): actual=${actual}`);
      expect(actual).assertEqual(190000);
      logInfo(`${BUNDLE}ElapsedMsOf_0042 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0043
     * @tc.name      WindowStartIcon_ElapsedMsOf_0043
     * @tc.desc      elapsedMsOf(ticks=195) returns 195000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0043 begin`);
      const actual: number = elapsedMsOf(195);
      logInfo(`elapsedMsOf(ticks=195): actual=${actual}`);
      expect(actual).assertEqual(195000);
      logInfo(`${BUNDLE}ElapsedMsOf_0043 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0044
     * @tc.name      WindowStartIcon_ElapsedMsOf_0044
     * @tc.desc      elapsedMsOf(ticks=200) returns 200000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0044 begin`);
      const actual: number = elapsedMsOf(200);
      logInfo(`elapsedMsOf(ticks=200): actual=${actual}`);
      expect(actual).assertEqual(200000);
      logInfo(`${BUNDLE}ElapsedMsOf_0044 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0045
     * @tc.name      WindowStartIcon_ElapsedMsOf_0045
     * @tc.desc      elapsedMsOf(ticks=134) returns 134000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0045 begin`);
      const actual: number = elapsedMsOf(134);
      logInfo(`elapsedMsOf(ticks=134): actual=${actual}`);
      expect(actual).assertEqual(134000);
      logInfo(`${BUNDLE}ElapsedMsOf_0045 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0046
     * @tc.name      WindowStartIcon_ElapsedMsOf_0046
     * @tc.desc      elapsedMsOf(ticks=9.74) returns 9000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0046 begin`);
      const actual: number = elapsedMsOf(9.74);
      logInfo(`elapsedMsOf(ticks=9.74): actual=${actual}`);
      expect(actual).assertEqual(9000);
      logInfo(`${BUNDLE}ElapsedMsOf_0046 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0047
     * @tc.name      WindowStartIcon_ElapsedMsOf_0047
     * @tc.desc      elapsedMsOf(ticks=74.12) returns 74000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0047 begin`);
      const actual: number = elapsedMsOf(74.12);
      logInfo(`elapsedMsOf(ticks=74.12): actual=${actual}`);
      expect(actual).assertEqual(74000);
      logInfo(`${BUNDLE}ElapsedMsOf_0047 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0048
     * @tc.name      WindowStartIcon_ElapsedMsOf_0048
     * @tc.desc      elapsedMsOf(ticks=93) returns 93000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0048 begin`);
      const actual: number = elapsedMsOf(93);
      logInfo(`elapsedMsOf(ticks=93): actual=${actual}`);
      expect(actual).assertEqual(93000);
      logInfo(`${BUNDLE}ElapsedMsOf_0048 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0049
     * @tc.name      WindowStartIcon_ElapsedMsOf_0049
     * @tc.desc      elapsedMsOf(ticks=4) returns 4000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0049 begin`);
      const actual: number = elapsedMsOf(4);
      logInfo(`elapsedMsOf(ticks=4): actual=${actual}`);
      expect(actual).assertEqual(4000);
      logInfo(`${BUNDLE}ElapsedMsOf_0049 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0050
     * @tc.name      WindowStartIcon_ElapsedMsOf_0050
     * @tc.desc      elapsedMsOf(ticks=57) returns 57000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0050 begin`);
      const actual: number = elapsedMsOf(57);
      logInfo(`elapsedMsOf(ticks=57): actual=${actual}`);
      expect(actual).assertEqual(57000);
      logInfo(`${BUNDLE}ElapsedMsOf_0050 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0051
     * @tc.name      WindowStartIcon_ElapsedMsOf_0051
     * @tc.desc      elapsedMsOf(ticks=67) returns 67000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0051 begin`);
      const actual: number = elapsedMsOf(67);
      logInfo(`elapsedMsOf(ticks=67): actual=${actual}`);
      expect(actual).assertEqual(67000);
      logInfo(`${BUNDLE}ElapsedMsOf_0051 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0052
     * @tc.name      WindowStartIcon_ElapsedMsOf_0052
     * @tc.desc      elapsedMsOf(ticks=56.68) returns 56000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0052 begin`);
      const actual: number = elapsedMsOf(56.68);
      logInfo(`elapsedMsOf(ticks=56.68): actual=${actual}`);
      expect(actual).assertEqual(56000);
      logInfo(`${BUNDLE}ElapsedMsOf_0052 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0053
     * @tc.name      WindowStartIcon_ElapsedMsOf_0053
     * @tc.desc      elapsedMsOf(ticks=164) returns 164000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0053 begin`);
      const actual: number = elapsedMsOf(164);
      logInfo(`elapsedMsOf(ticks=164): actual=${actual}`);
      expect(actual).assertEqual(164000);
      logInfo(`${BUNDLE}ElapsedMsOf_0053 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0054
     * @tc.name      WindowStartIcon_ElapsedMsOf_0054
     * @tc.desc      elapsedMsOf(ticks=28.07) returns 28000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0054 begin`);
      const actual: number = elapsedMsOf(28.07);
      logInfo(`elapsedMsOf(ticks=28.07): actual=${actual}`);
      expect(actual).assertEqual(28000);
      logInfo(`${BUNDLE}ElapsedMsOf_0054 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0055
     * @tc.name      WindowStartIcon_ElapsedMsOf_0055
     * @tc.desc      elapsedMsOf(ticks=193) returns 193000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0055 begin`);
      const actual: number = elapsedMsOf(193);
      logInfo(`elapsedMsOf(ticks=193): actual=${actual}`);
      expect(actual).assertEqual(193000);
      logInfo(`${BUNDLE}ElapsedMsOf_0055 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0056
     * @tc.name      WindowStartIcon_ElapsedMsOf_0056
     * @tc.desc      elapsedMsOf(ticks=87) returns 87000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0056 begin`);
      const actual: number = elapsedMsOf(87);
      logInfo(`elapsedMsOf(ticks=87): actual=${actual}`);
      expect(actual).assertEqual(87000);
      logInfo(`${BUNDLE}ElapsedMsOf_0056 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0057
     * @tc.name      WindowStartIcon_ElapsedMsOf_0057
     * @tc.desc      elapsedMsOf(ticks=73) returns 73000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0057 begin`);
      const actual: number = elapsedMsOf(73);
      logInfo(`elapsedMsOf(ticks=73): actual=${actual}`);
      expect(actual).assertEqual(73000);
      logInfo(`${BUNDLE}ElapsedMsOf_0057 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0058
     * @tc.name      WindowStartIcon_ElapsedMsOf_0058
     * @tc.desc      elapsedMsOf(ticks=42.12) returns 42000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0058 begin`);
      const actual: number = elapsedMsOf(42.12);
      logInfo(`elapsedMsOf(ticks=42.12): actual=${actual}`);
      expect(actual).assertEqual(42000);
      logInfo(`${BUNDLE}ElapsedMsOf_0058 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0059
     * @tc.name      WindowStartIcon_ElapsedMsOf_0059
     * @tc.desc      elapsedMsOf(ticks=96.99) returns 96000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0059 begin`);
      const actual: number = elapsedMsOf(96.99);
      logInfo(`elapsedMsOf(ticks=96.99): actual=${actual}`);
      expect(actual).assertEqual(96000);
      logInfo(`${BUNDLE}ElapsedMsOf_0059 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0060
     * @tc.name      WindowStartIcon_ElapsedMsOf_0060
     * @tc.desc      elapsedMsOf(ticks=36) returns 36000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0060 begin`);
      const actual: number = elapsedMsOf(36);
      logInfo(`elapsedMsOf(ticks=36): actual=${actual}`);
      expect(actual).assertEqual(36000);
      logInfo(`${BUNDLE}ElapsedMsOf_0060 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0061
     * @tc.name      WindowStartIcon_ElapsedMsOf_0061
     * @tc.desc      elapsedMsOf(ticks=142) returns 142000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0061 begin`);
      const actual: number = elapsedMsOf(142);
      logInfo(`elapsedMsOf(ticks=142): actual=${actual}`);
      expect(actual).assertEqual(142000);
      logInfo(`${BUNDLE}ElapsedMsOf_0061 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0062
     * @tc.name      WindowStartIcon_ElapsedMsOf_0062
     * @tc.desc      elapsedMsOf(ticks=27) returns 27000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0062 begin`);
      const actual: number = elapsedMsOf(27);
      logInfo(`elapsedMsOf(ticks=27): actual=${actual}`);
      expect(actual).assertEqual(27000);
      logInfo(`${BUNDLE}ElapsedMsOf_0062 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0063
     * @tc.name      WindowStartIcon_ElapsedMsOf_0063
     * @tc.desc      elapsedMsOf(ticks=21.65) returns 21000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0063 begin`);
      const actual: number = elapsedMsOf(21.65);
      logInfo(`elapsedMsOf(ticks=21.65): actual=${actual}`);
      expect(actual).assertEqual(21000);
      logInfo(`${BUNDLE}ElapsedMsOf_0063 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0064
     * @tc.name      WindowStartIcon_ElapsedMsOf_0064
     * @tc.desc      elapsedMsOf(ticks=54) returns 54000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0064 begin`);
      const actual: number = elapsedMsOf(54);
      logInfo(`elapsedMsOf(ticks=54): actual=${actual}`);
      expect(actual).assertEqual(54000);
      logInfo(`${BUNDLE}ElapsedMsOf_0064 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0065
     * @tc.name      WindowStartIcon_ElapsedMsOf_0065
     * @tc.desc      elapsedMsOf(ticks=17.99) returns 17000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0065 begin`);
      const actual: number = elapsedMsOf(17.99);
      logInfo(`elapsedMsOf(ticks=17.99): actual=${actual}`);
      expect(actual).assertEqual(17000);
      logInfo(`${BUNDLE}ElapsedMsOf_0065 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0066
     * @tc.name      WindowStartIcon_ElapsedMsOf_0066
     * @tc.desc      elapsedMsOf(ticks=68) returns 68000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0066 begin`);
      const actual: number = elapsedMsOf(68);
      logInfo(`elapsedMsOf(ticks=68): actual=${actual}`);
      expect(actual).assertEqual(68000);
      logInfo(`${BUNDLE}ElapsedMsOf_0066 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0067
     * @tc.name      WindowStartIcon_ElapsedMsOf_0067
     * @tc.desc      elapsedMsOf(ticks=148) returns 148000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0067 begin`);
      const actual: number = elapsedMsOf(148);
      logInfo(`elapsedMsOf(ticks=148): actual=${actual}`);
      expect(actual).assertEqual(148000);
      logInfo(`${BUNDLE}ElapsedMsOf_0067 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0068
     * @tc.name      WindowStartIcon_ElapsedMsOf_0068
     * @tc.desc      elapsedMsOf(ticks=53.37) returns 53000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0068 begin`);
      const actual: number = elapsedMsOf(53.37);
      logInfo(`elapsedMsOf(ticks=53.37): actual=${actual}`);
      expect(actual).assertEqual(53000);
      logInfo(`${BUNDLE}ElapsedMsOf_0068 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0069
     * @tc.name      WindowStartIcon_ElapsedMsOf_0069
     * @tc.desc      elapsedMsOf(ticks=197) returns 197000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0069 begin`);
      const actual: number = elapsedMsOf(197);
      logInfo(`elapsedMsOf(ticks=197): actual=${actual}`);
      expect(actual).assertEqual(197000);
      logInfo(`${BUNDLE}ElapsedMsOf_0069 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0070
     * @tc.name      WindowStartIcon_ElapsedMsOf_0070
     * @tc.desc      elapsedMsOf(ticks=198) returns 198000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0070 begin`);
      const actual: number = elapsedMsOf(198);
      logInfo(`elapsedMsOf(ticks=198): actual=${actual}`);
      expect(actual).assertEqual(198000);
      logInfo(`${BUNDLE}ElapsedMsOf_0070 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0071
     * @tc.name      WindowStartIcon_ElapsedMsOf_0071
     * @tc.desc      elapsedMsOf(ticks=112) returns 112000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0071 begin`);
      const actual: number = elapsedMsOf(112);
      logInfo(`elapsedMsOf(ticks=112): actual=${actual}`);
      expect(actual).assertEqual(112000);
      logInfo(`${BUNDLE}ElapsedMsOf_0071 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0072
     * @tc.name      WindowStartIcon_ElapsedMsOf_0072
     * @tc.desc      elapsedMsOf(ticks=97.75) returns 97000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0072 begin`);
      const actual: number = elapsedMsOf(97.75);
      logInfo(`elapsedMsOf(ticks=97.75): actual=${actual}`);
      expect(actual).assertEqual(97000);
      logInfo(`${BUNDLE}ElapsedMsOf_0072 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0073
     * @tc.name      WindowStartIcon_ElapsedMsOf_0073
     * @tc.desc      elapsedMsOf(ticks=47) returns 47000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0073 begin`);
      const actual: number = elapsedMsOf(47);
      logInfo(`elapsedMsOf(ticks=47): actual=${actual}`);
      expect(actual).assertEqual(47000);
      logInfo(`${BUNDLE}ElapsedMsOf_0073 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0074
     * @tc.name      WindowStartIcon_ElapsedMsOf_0074
     * @tc.desc      elapsedMsOf(ticks=66) returns 66000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0074 begin`);
      const actual: number = elapsedMsOf(66);
      logInfo(`elapsedMsOf(ticks=66): actual=${actual}`);
      expect(actual).assertEqual(66000);
      logInfo(`${BUNDLE}ElapsedMsOf_0074 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0075
     * @tc.name      WindowStartIcon_ElapsedMsOf_0075
     * @tc.desc      elapsedMsOf(ticks=59) returns 59000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0075 begin`);
      const actual: number = elapsedMsOf(59);
      logInfo(`elapsedMsOf(ticks=59): actual=${actual}`);
      expect(actual).assertEqual(59000);
      logInfo(`${BUNDLE}ElapsedMsOf_0075 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0076
     * @tc.name      WindowStartIcon_ElapsedMsOf_0076
     * @tc.desc      elapsedMsOf(ticks=92.07) returns 92000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0076 begin`);
      const actual: number = elapsedMsOf(92.07);
      logInfo(`elapsedMsOf(ticks=92.07): actual=${actual}`);
      expect(actual).assertEqual(92000);
      logInfo(`${BUNDLE}ElapsedMsOf_0076 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0077
     * @tc.name      WindowStartIcon_ElapsedMsOf_0077
     * @tc.desc      elapsedMsOf(ticks=191) returns 191000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0077 begin`);
      const actual: number = elapsedMsOf(191);
      logInfo(`elapsedMsOf(ticks=191): actual=${actual}`);
      expect(actual).assertEqual(191000);
      logInfo(`${BUNDLE}ElapsedMsOf_0077 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0078
     * @tc.name      WindowStartIcon_ElapsedMsOf_0078
     * @tc.desc      elapsedMsOf(ticks=44) returns 44000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0078 begin`);
      const actual: number = elapsedMsOf(44);
      logInfo(`elapsedMsOf(ticks=44): actual=${actual}`);
      expect(actual).assertEqual(44000);
      logInfo(`${BUNDLE}ElapsedMsOf_0078 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0079
     * @tc.name      WindowStartIcon_ElapsedMsOf_0079
     * @tc.desc      elapsedMsOf(ticks=199) returns 199000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0079 begin`);
      const actual: number = elapsedMsOf(199);
      logInfo(`elapsedMsOf(ticks=199): actual=${actual}`);
      expect(actual).assertEqual(199000);
      logInfo(`${BUNDLE}ElapsedMsOf_0079 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0080
     * @tc.name      WindowStartIcon_ElapsedMsOf_0080
     * @tc.desc      elapsedMsOf(ticks=109) returns 109000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0080 begin`);
      const actual: number = elapsedMsOf(109);
      logInfo(`elapsedMsOf(ticks=109): actual=${actual}`);
      expect(actual).assertEqual(109000);
      logInfo(`${BUNDLE}ElapsedMsOf_0080 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0081
     * @tc.name      WindowStartIcon_ElapsedMsOf_0081
     * @tc.desc      elapsedMsOf(ticks=37.79) returns 37000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0081 begin`);
      const actual: number = elapsedMsOf(37.79);
      logInfo(`elapsedMsOf(ticks=37.79): actual=${actual}`);
      expect(actual).assertEqual(37000);
      logInfo(`${BUNDLE}ElapsedMsOf_0081 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0082
     * @tc.name      WindowStartIcon_ElapsedMsOf_0082
     * @tc.desc      elapsedMsOf(ticks=132) returns 132000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0082 begin`);
      const actual: number = elapsedMsOf(132);
      logInfo(`elapsedMsOf(ticks=132): actual=${actual}`);
      expect(actual).assertEqual(132000);
      logInfo(`${BUNDLE}ElapsedMsOf_0082 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0083
     * @tc.name      WindowStartIcon_ElapsedMsOf_0083
     * @tc.desc      elapsedMsOf(ticks=149) returns 149000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0083 begin`);
      const actual: number = elapsedMsOf(149);
      logInfo(`elapsedMsOf(ticks=149): actual=${actual}`);
      expect(actual).assertEqual(149000);
      logInfo(`${BUNDLE}ElapsedMsOf_0083 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0084
     * @tc.name      WindowStartIcon_ElapsedMsOf_0084
     * @tc.desc      elapsedMsOf(ticks=52.97) returns 52000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0084 begin`);
      const actual: number = elapsedMsOf(52.97);
      logInfo(`elapsedMsOf(ticks=52.97): actual=${actual}`);
      expect(actual).assertEqual(52000);
      logInfo(`${BUNDLE}ElapsedMsOf_0084 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0085
     * @tc.name      WindowStartIcon_ElapsedMsOf_0085
     * @tc.desc      elapsedMsOf(ticks=157) returns 157000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0085 begin`);
      const actual: number = elapsedMsOf(157);
      logInfo(`elapsedMsOf(ticks=157): actual=${actual}`);
      expect(actual).assertEqual(157000);
      logInfo(`${BUNDLE}ElapsedMsOf_0085 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0086
     * @tc.name      WindowStartIcon_ElapsedMsOf_0086
     * @tc.desc      elapsedMsOf(ticks=101) returns 101000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0086 begin`);
      const actual: number = elapsedMsOf(101);
      logInfo(`elapsedMsOf(ticks=101): actual=${actual}`);
      expect(actual).assertEqual(101000);
      logInfo(`${BUNDLE}ElapsedMsOf_0086 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0087
     * @tc.name      WindowStartIcon_ElapsedMsOf_0087
     * @tc.desc      elapsedMsOf(ticks=133) returns 133000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0087 begin`);
      const actual: number = elapsedMsOf(133);
      logInfo(`elapsedMsOf(ticks=133): actual=${actual}`);
      expect(actual).assertEqual(133000);
      logInfo(`${BUNDLE}ElapsedMsOf_0087 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0088
     * @tc.name      WindowStartIcon_ElapsedMsOf_0088
     * @tc.desc      elapsedMsOf(ticks=151) returns 151000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0088 begin`);
      const actual: number = elapsedMsOf(151);
      logInfo(`elapsedMsOf(ticks=151): actual=${actual}`);
      expect(actual).assertEqual(151000);
      logInfo(`${BUNDLE}ElapsedMsOf_0088 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0089
     * @tc.name      WindowStartIcon_ElapsedMsOf_0089
     * @tc.desc      elapsedMsOf(ticks=162) returns 162000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0089 begin`);
      const actual: number = elapsedMsOf(162);
      logInfo(`elapsedMsOf(ticks=162): actual=${actual}`);
      expect(actual).assertEqual(162000);
      logInfo(`${BUNDLE}ElapsedMsOf_0089 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0090
     * @tc.name      WindowStartIcon_ElapsedMsOf_0090
     * @tc.desc      elapsedMsOf(ticks=121) returns 121000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0090 begin`);
      const actual: number = elapsedMsOf(121);
      logInfo(`elapsedMsOf(ticks=121): actual=${actual}`);
      expect(actual).assertEqual(121000);
      logInfo(`${BUNDLE}ElapsedMsOf_0090 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0091
     * @tc.name      WindowStartIcon_ElapsedMsOf_0091
     * @tc.desc      elapsedMsOf(ticks=46.46) returns 46000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0091 begin`);
      const actual: number = elapsedMsOf(46.46);
      logInfo(`elapsedMsOf(ticks=46.46): actual=${actual}`);
      expect(actual).assertEqual(46000);
      logInfo(`${BUNDLE}ElapsedMsOf_0091 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0092
     * @tc.name      WindowStartIcon_ElapsedMsOf_0092
     * @tc.desc      elapsedMsOf(ticks=179) returns 179000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0092 begin`);
      const actual: number = elapsedMsOf(179);
      logInfo(`elapsedMsOf(ticks=179): actual=${actual}`);
      expect(actual).assertEqual(179000);
      logInfo(`${BUNDLE}ElapsedMsOf_0092 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0093
     * @tc.name      WindowStartIcon_ElapsedMsOf_0093
     * @tc.desc      elapsedMsOf(ticks=173) returns 173000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0093 begin`);
      const actual: number = elapsedMsOf(173);
      logInfo(`elapsedMsOf(ticks=173): actual=${actual}`);
      expect(actual).assertEqual(173000);
      logInfo(`${BUNDLE}ElapsedMsOf_0093 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0094
     * @tc.name      WindowStartIcon_ElapsedMsOf_0094
     * @tc.desc      elapsedMsOf(ticks=32) returns 32000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0094 begin`);
      const actual: number = elapsedMsOf(32);
      logInfo(`elapsedMsOf(ticks=32): actual=${actual}`);
      expect(actual).assertEqual(32000);
      logInfo(`${BUNDLE}ElapsedMsOf_0094 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0095
     * @tc.name      WindowStartIcon_ElapsedMsOf_0095
     * @tc.desc      elapsedMsOf(ticks=152) returns 152000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0095 begin`);
      const actual: number = elapsedMsOf(152);
      logInfo(`elapsedMsOf(ticks=152): actual=${actual}`);
      expect(actual).assertEqual(152000);
      logInfo(`${BUNDLE}ElapsedMsOf_0095 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0096
     * @tc.name      WindowStartIcon_ElapsedMsOf_0096
     * @tc.desc      elapsedMsOf(ticks=163) returns 163000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0096 begin`);
      const actual: number = elapsedMsOf(163);
      logInfo(`elapsedMsOf(ticks=163): actual=${actual}`);
      expect(actual).assertEqual(163000);
      logInfo(`${BUNDLE}ElapsedMsOf_0096 end`);
    });
  });
}
