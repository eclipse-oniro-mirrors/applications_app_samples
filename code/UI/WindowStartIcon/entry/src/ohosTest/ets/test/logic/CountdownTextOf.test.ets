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
import { countdownTextOf } from '../model/AdvertisingLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_WindowStartIcon]';
const BUNDLE: string = 'WindowStartIcon_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for countdownTextOf (96 cases). */
export default function countdownTextOfTest(): void {
  describe('CountdownTextOfTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0001
     * @tc.name      WindowStartIcon_CountdownTextOf_0001
     * @tc.desc      countdownTextOf(count=0) returns "0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('WindowStartIcon_CountdownTextOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0001 begin`);
      const actual: string = countdownTextOf(0);
      logInfo(`countdownTextOf(count=0): actual=${actual}`);
      expect(actual).assertEqual('0');
      logInfo(`${BUNDLE}CountdownTextOf_0001 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0002
     * @tc.name      WindowStartIcon_CountdownTextOf_0002
     * @tc.desc      countdownTextOf(count=1) returns "1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('WindowStartIcon_CountdownTextOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0002 begin`);
      const actual: string = countdownTextOf(1);
      logInfo(`countdownTextOf(count=1): actual=${actual}`);
      expect(actual).assertEqual('1');
      logInfo(`${BUNDLE}CountdownTextOf_0002 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0003
     * @tc.name      WindowStartIcon_CountdownTextOf_0003
     * @tc.desc      countdownTextOf(count=2) returns "2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0003 begin`);
      const actual: string = countdownTextOf(2);
      logInfo(`countdownTextOf(count=2): actual=${actual}`);
      expect(actual).assertEqual('2');
      logInfo(`${BUNDLE}CountdownTextOf_0003 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0004
     * @tc.name      WindowStartIcon_CountdownTextOf_0004
     * @tc.desc      countdownTextOf(count=5) returns "5"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0004 begin`);
      const actual: string = countdownTextOf(5);
      logInfo(`countdownTextOf(count=5): actual=${actual}`);
      expect(actual).assertEqual('5');
      logInfo(`${BUNDLE}CountdownTextOf_0004 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0005
     * @tc.name      WindowStartIcon_CountdownTextOf_0005
     * @tc.desc      countdownTextOf(count=10) returns "10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0005 begin`);
      const actual: string = countdownTextOf(10);
      logInfo(`countdownTextOf(count=10): actual=${actual}`);
      expect(actual).assertEqual('10');
      logInfo(`${BUNDLE}CountdownTextOf_0005 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0006
     * @tc.name      WindowStartIcon_CountdownTextOf_0006
     * @tc.desc      countdownTextOf(count=100) returns "100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0006 begin`);
      const actual: string = countdownTextOf(100);
      logInfo(`countdownTextOf(count=100): actual=${actual}`);
      expect(actual).assertEqual('100');
      logInfo(`${BUNDLE}CountdownTextOf_0006 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0007
     * @tc.name      WindowStartIcon_CountdownTextOf_0007
     * @tc.desc      countdownTextOf(count=-1) returns "-1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_CountdownTextOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0007 begin`);
      const actual: string = countdownTextOf(-1);
      logInfo(`countdownTextOf(count=-1): actual=${actual}`);
      expect(actual).assertEqual('-1');
      logInfo(`${BUNDLE}CountdownTextOf_0007 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0008
     * @tc.name      WindowStartIcon_CountdownTextOf_0008
     * @tc.desc      countdownTextOf(count=3) returns "3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0008 begin`);
      const actual: string = countdownTextOf(3);
      logInfo(`countdownTextOf(count=3): actual=${actual}`);
      expect(actual).assertEqual('3');
      logInfo(`${BUNDLE}CountdownTextOf_0008 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0009
     * @tc.name      WindowStartIcon_CountdownTextOf_0009
     * @tc.desc      countdownTextOf(count=15) returns "15"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0009 begin`);
      const actual: string = countdownTextOf(15);
      logInfo(`countdownTextOf(count=15): actual=${actual}`);
      expect(actual).assertEqual('15');
      logInfo(`${BUNDLE}CountdownTextOf_0009 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0010
     * @tc.name      WindowStartIcon_CountdownTextOf_0010
     * @tc.desc      countdownTextOf(count=20) returns "20"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0010 begin`);
      const actual: string = countdownTextOf(20);
      logInfo(`countdownTextOf(count=20): actual=${actual}`);
      expect(actual).assertEqual('20');
      logInfo(`${BUNDLE}CountdownTextOf_0010 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0011
     * @tc.name      WindowStartIcon_CountdownTextOf_0011
     * @tc.desc      countdownTextOf(count=25) returns "25"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0011 begin`);
      const actual: string = countdownTextOf(25);
      logInfo(`countdownTextOf(count=25): actual=${actual}`);
      expect(actual).assertEqual('25');
      logInfo(`${BUNDLE}CountdownTextOf_0011 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0012
     * @tc.name      WindowStartIcon_CountdownTextOf_0012
     * @tc.desc      countdownTextOf(count=30) returns "30"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0012 begin`);
      const actual: string = countdownTextOf(30);
      logInfo(`countdownTextOf(count=30): actual=${actual}`);
      expect(actual).assertEqual('30');
      logInfo(`${BUNDLE}CountdownTextOf_0012 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0013
     * @tc.name      WindowStartIcon_CountdownTextOf_0013
     * @tc.desc      countdownTextOf(count=35) returns "35"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0013 begin`);
      const actual: string = countdownTextOf(35);
      logInfo(`countdownTextOf(count=35): actual=${actual}`);
      expect(actual).assertEqual('35');
      logInfo(`${BUNDLE}CountdownTextOf_0013 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0014
     * @tc.name      WindowStartIcon_CountdownTextOf_0014
     * @tc.desc      countdownTextOf(count=40) returns "40"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0014 begin`);
      const actual: string = countdownTextOf(40);
      logInfo(`countdownTextOf(count=40): actual=${actual}`);
      expect(actual).assertEqual('40');
      logInfo(`${BUNDLE}CountdownTextOf_0014 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0015
     * @tc.name      WindowStartIcon_CountdownTextOf_0015
     * @tc.desc      countdownTextOf(count=45) returns "45"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0015 begin`);
      const actual: string = countdownTextOf(45);
      logInfo(`countdownTextOf(count=45): actual=${actual}`);
      expect(actual).assertEqual('45');
      logInfo(`${BUNDLE}CountdownTextOf_0015 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0016
     * @tc.name      WindowStartIcon_CountdownTextOf_0016
     * @tc.desc      countdownTextOf(count=50) returns "50"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0016 begin`);
      const actual: string = countdownTextOf(50);
      logInfo(`countdownTextOf(count=50): actual=${actual}`);
      expect(actual).assertEqual('50');
      logInfo(`${BUNDLE}CountdownTextOf_0016 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0017
     * @tc.name      WindowStartIcon_CountdownTextOf_0017
     * @tc.desc      countdownTextOf(count=55) returns "55"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0017 begin`);
      const actual: string = countdownTextOf(55);
      logInfo(`countdownTextOf(count=55): actual=${actual}`);
      expect(actual).assertEqual('55');
      logInfo(`${BUNDLE}CountdownTextOf_0017 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0018
     * @tc.name      WindowStartIcon_CountdownTextOf_0018
     * @tc.desc      countdownTextOf(count=60) returns "60"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0018 begin`);
      const actual: string = countdownTextOf(60);
      logInfo(`countdownTextOf(count=60): actual=${actual}`);
      expect(actual).assertEqual('60');
      logInfo(`${BUNDLE}CountdownTextOf_0018 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0019
     * @tc.name      WindowStartIcon_CountdownTextOf_0019
     * @tc.desc      countdownTextOf(count=65) returns "65"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0019 begin`);
      const actual: string = countdownTextOf(65);
      logInfo(`countdownTextOf(count=65): actual=${actual}`);
      expect(actual).assertEqual('65');
      logInfo(`${BUNDLE}CountdownTextOf_0019 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0020
     * @tc.name      WindowStartIcon_CountdownTextOf_0020
     * @tc.desc      countdownTextOf(count=70) returns "70"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0020 begin`);
      const actual: string = countdownTextOf(70);
      logInfo(`countdownTextOf(count=70): actual=${actual}`);
      expect(actual).assertEqual('70');
      logInfo(`${BUNDLE}CountdownTextOf_0020 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0021
     * @tc.name      WindowStartIcon_CountdownTextOf_0021
     * @tc.desc      countdownTextOf(count=75) returns "75"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0021 begin`);
      const actual: string = countdownTextOf(75);
      logInfo(`countdownTextOf(count=75): actual=${actual}`);
      expect(actual).assertEqual('75');
      logInfo(`${BUNDLE}CountdownTextOf_0021 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0022
     * @tc.name      WindowStartIcon_CountdownTextOf_0022
     * @tc.desc      countdownTextOf(count=80) returns "80"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0022 begin`);
      const actual: string = countdownTextOf(80);
      logInfo(`countdownTextOf(count=80): actual=${actual}`);
      expect(actual).assertEqual('80');
      logInfo(`${BUNDLE}CountdownTextOf_0022 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0023
     * @tc.name      WindowStartIcon_CountdownTextOf_0023
     * @tc.desc      countdownTextOf(count=85) returns "85"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0023 begin`);
      const actual: string = countdownTextOf(85);
      logInfo(`countdownTextOf(count=85): actual=${actual}`);
      expect(actual).assertEqual('85');
      logInfo(`${BUNDLE}CountdownTextOf_0023 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0024
     * @tc.name      WindowStartIcon_CountdownTextOf_0024
     * @tc.desc      countdownTextOf(count=90) returns "90"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0024 begin`);
      const actual: string = countdownTextOf(90);
      logInfo(`countdownTextOf(count=90): actual=${actual}`);
      expect(actual).assertEqual('90');
      logInfo(`${BUNDLE}CountdownTextOf_0024 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0025
     * @tc.name      WindowStartIcon_CountdownTextOf_0025
     * @tc.desc      countdownTextOf(count=95) returns "95"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0025 begin`);
      const actual: string = countdownTextOf(95);
      logInfo(`countdownTextOf(count=95): actual=${actual}`);
      expect(actual).assertEqual('95');
      logInfo(`${BUNDLE}CountdownTextOf_0025 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0026
     * @tc.name      WindowStartIcon_CountdownTextOf_0026
     * @tc.desc      countdownTextOf(count=105) returns "105"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0026 begin`);
      const actual: string = countdownTextOf(105);
      logInfo(`countdownTextOf(count=105): actual=${actual}`);
      expect(actual).assertEqual('105');
      logInfo(`${BUNDLE}CountdownTextOf_0026 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0027
     * @tc.name      WindowStartIcon_CountdownTextOf_0027
     * @tc.desc      countdownTextOf(count=110) returns "110"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0027 begin`);
      const actual: string = countdownTextOf(110);
      logInfo(`countdownTextOf(count=110): actual=${actual}`);
      expect(actual).assertEqual('110');
      logInfo(`${BUNDLE}CountdownTextOf_0027 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0028
     * @tc.name      WindowStartIcon_CountdownTextOf_0028
     * @tc.desc      countdownTextOf(count=115) returns "115"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0028 begin`);
      const actual: string = countdownTextOf(115);
      logInfo(`countdownTextOf(count=115): actual=${actual}`);
      expect(actual).assertEqual('115');
      logInfo(`${BUNDLE}CountdownTextOf_0028 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0029
     * @tc.name      WindowStartIcon_CountdownTextOf_0029
     * @tc.desc      countdownTextOf(count=120) returns "120"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0029 begin`);
      const actual: string = countdownTextOf(120);
      logInfo(`countdownTextOf(count=120): actual=${actual}`);
      expect(actual).assertEqual('120');
      logInfo(`${BUNDLE}CountdownTextOf_0029 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0030
     * @tc.name      WindowStartIcon_CountdownTextOf_0030
     * @tc.desc      countdownTextOf(count=125) returns "125"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0030 begin`);
      const actual: string = countdownTextOf(125);
      logInfo(`countdownTextOf(count=125): actual=${actual}`);
      expect(actual).assertEqual('125');
      logInfo(`${BUNDLE}CountdownTextOf_0030 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0031
     * @tc.name      WindowStartIcon_CountdownTextOf_0031
     * @tc.desc      countdownTextOf(count=130) returns "130"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0031 begin`);
      const actual: string = countdownTextOf(130);
      logInfo(`countdownTextOf(count=130): actual=${actual}`);
      expect(actual).assertEqual('130');
      logInfo(`${BUNDLE}CountdownTextOf_0031 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0032
     * @tc.name      WindowStartIcon_CountdownTextOf_0032
     * @tc.desc      countdownTextOf(count=135) returns "135"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0032 begin`);
      const actual: string = countdownTextOf(135);
      logInfo(`countdownTextOf(count=135): actual=${actual}`);
      expect(actual).assertEqual('135');
      logInfo(`${BUNDLE}CountdownTextOf_0032 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0033
     * @tc.name      WindowStartIcon_CountdownTextOf_0033
     * @tc.desc      countdownTextOf(count=140) returns "140"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0033 begin`);
      const actual: string = countdownTextOf(140);
      logInfo(`countdownTextOf(count=140): actual=${actual}`);
      expect(actual).assertEqual('140');
      logInfo(`${BUNDLE}CountdownTextOf_0033 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0034
     * @tc.name      WindowStartIcon_CountdownTextOf_0034
     * @tc.desc      countdownTextOf(count=145) returns "145"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0034 begin`);
      const actual: string = countdownTextOf(145);
      logInfo(`countdownTextOf(count=145): actual=${actual}`);
      expect(actual).assertEqual('145');
      logInfo(`${BUNDLE}CountdownTextOf_0034 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0035
     * @tc.name      WindowStartIcon_CountdownTextOf_0035
     * @tc.desc      countdownTextOf(count=150) returns "150"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0035 begin`);
      const actual: string = countdownTextOf(150);
      logInfo(`countdownTextOf(count=150): actual=${actual}`);
      expect(actual).assertEqual('150');
      logInfo(`${BUNDLE}CountdownTextOf_0035 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0036
     * @tc.name      WindowStartIcon_CountdownTextOf_0036
     * @tc.desc      countdownTextOf(count=155) returns "155"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0036 begin`);
      const actual: string = countdownTextOf(155);
      logInfo(`countdownTextOf(count=155): actual=${actual}`);
      expect(actual).assertEqual('155');
      logInfo(`${BUNDLE}CountdownTextOf_0036 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0037
     * @tc.name      WindowStartIcon_CountdownTextOf_0037
     * @tc.desc      countdownTextOf(count=160) returns "160"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0037 begin`);
      const actual: string = countdownTextOf(160);
      logInfo(`countdownTextOf(count=160): actual=${actual}`);
      expect(actual).assertEqual('160');
      logInfo(`${BUNDLE}CountdownTextOf_0037 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0038
     * @tc.name      WindowStartIcon_CountdownTextOf_0038
     * @tc.desc      countdownTextOf(count=165) returns "165"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0038 begin`);
      const actual: string = countdownTextOf(165);
      logInfo(`countdownTextOf(count=165): actual=${actual}`);
      expect(actual).assertEqual('165');
      logInfo(`${BUNDLE}CountdownTextOf_0038 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0039
     * @tc.name      WindowStartIcon_CountdownTextOf_0039
     * @tc.desc      countdownTextOf(count=170) returns "170"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0039 begin`);
      const actual: string = countdownTextOf(170);
      logInfo(`countdownTextOf(count=170): actual=${actual}`);
      expect(actual).assertEqual('170');
      logInfo(`${BUNDLE}CountdownTextOf_0039 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0040
     * @tc.name      WindowStartIcon_CountdownTextOf_0040
     * @tc.desc      countdownTextOf(count=175) returns "175"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0040 begin`);
      const actual: string = countdownTextOf(175);
      logInfo(`countdownTextOf(count=175): actual=${actual}`);
      expect(actual).assertEqual('175');
      logInfo(`${BUNDLE}CountdownTextOf_0040 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0041
     * @tc.name      WindowStartIcon_CountdownTextOf_0041
     * @tc.desc      countdownTextOf(count=180) returns "180"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0041 begin`);
      const actual: string = countdownTextOf(180);
      logInfo(`countdownTextOf(count=180): actual=${actual}`);
      expect(actual).assertEqual('180');
      logInfo(`${BUNDLE}CountdownTextOf_0041 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0042
     * @tc.name      WindowStartIcon_CountdownTextOf_0042
     * @tc.desc      countdownTextOf(count=185) returns "185"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0042 begin`);
      const actual: string = countdownTextOf(185);
      logInfo(`countdownTextOf(count=185): actual=${actual}`);
      expect(actual).assertEqual('185');
      logInfo(`${BUNDLE}CountdownTextOf_0042 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0043
     * @tc.name      WindowStartIcon_CountdownTextOf_0043
     * @tc.desc      countdownTextOf(count=190) returns "190"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0043 begin`);
      const actual: string = countdownTextOf(190);
      logInfo(`countdownTextOf(count=190): actual=${actual}`);
      expect(actual).assertEqual('190');
      logInfo(`${BUNDLE}CountdownTextOf_0043 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0044
     * @tc.name      WindowStartIcon_CountdownTextOf_0044
     * @tc.desc      countdownTextOf(count=195) returns "195"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0044 begin`);
      const actual: string = countdownTextOf(195);
      logInfo(`countdownTextOf(count=195): actual=${actual}`);
      expect(actual).assertEqual('195');
      logInfo(`${BUNDLE}CountdownTextOf_0044 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0045
     * @tc.name      WindowStartIcon_CountdownTextOf_0045
     * @tc.desc      countdownTextOf(count=200) returns "200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0045 begin`);
      const actual: string = countdownTextOf(200);
      logInfo(`countdownTextOf(count=200): actual=${actual}`);
      expect(actual).assertEqual('200');
      logInfo(`${BUNDLE}CountdownTextOf_0045 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0046
     * @tc.name      WindowStartIcon_CountdownTextOf_0046
     * @tc.desc      countdownTextOf(count=118) returns "118"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0046 begin`);
      const actual: string = countdownTextOf(118);
      logInfo(`countdownTextOf(count=118): actual=${actual}`);
      expect(actual).assertEqual('118');
      logInfo(`${BUNDLE}CountdownTextOf_0046 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0047
     * @tc.name      WindowStartIcon_CountdownTextOf_0047
     * @tc.desc      countdownTextOf(count=29) returns "29"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0047 begin`);
      const actual: string = countdownTextOf(29);
      logInfo(`countdownTextOf(count=29): actual=${actual}`);
      expect(actual).assertEqual('29');
      logInfo(`${BUNDLE}CountdownTextOf_0047 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0048
     * @tc.name      WindowStartIcon_CountdownTextOf_0048
     * @tc.desc      countdownTextOf(count=41.48) returns "41.48"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0048 begin`);
      const actual: string = countdownTextOf(41.48);
      logInfo(`countdownTextOf(count=41.48): actual=${actual}`);
      expect(actual).assertEqual('41.48');
      logInfo(`${BUNDLE}CountdownTextOf_0048 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0049
     * @tc.name      WindowStartIcon_CountdownTextOf_0049
     * @tc.desc      countdownTextOf(count=92.05) returns "92.05"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0049 begin`);
      const actual: string = countdownTextOf(92.05);
      logInfo(`countdownTextOf(count=92.05): actual=${actual}`);
      expect(actual).assertEqual('92.05');
      logInfo(`${BUNDLE}CountdownTextOf_0049 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0050
     * @tc.name      WindowStartIcon_CountdownTextOf_0050
     * @tc.desc      countdownTextOf(count=107) returns "107"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0050 begin`);
      const actual: string = countdownTextOf(107);
      logInfo(`countdownTextOf(count=107): actual=${actual}`);
      expect(actual).assertEqual('107');
      logInfo(`${BUNDLE}CountdownTextOf_0050 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0051
     * @tc.name      WindowStartIcon_CountdownTextOf_0051
     * @tc.desc      countdownTextOf(count=196) returns "196"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0051 begin`);
      const actual: string = countdownTextOf(196);
      logInfo(`countdownTextOf(count=196): actual=${actual}`);
      expect(actual).assertEqual('196');
      logInfo(`${BUNDLE}CountdownTextOf_0051 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0052
     * @tc.name      WindowStartIcon_CountdownTextOf_0052
     * @tc.desc      countdownTextOf(count=87) returns "87"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0052 begin`);
      const actual: string = countdownTextOf(87);
      logInfo(`countdownTextOf(count=87): actual=${actual}`);
      expect(actual).assertEqual('87');
      logInfo(`${BUNDLE}CountdownTextOf_0052 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0053
     * @tc.name      WindowStartIcon_CountdownTextOf_0053
     * @tc.desc      countdownTextOf(count=54.4) returns "54.4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0053 begin`);
      const actual: string = countdownTextOf(54.4);
      logInfo(`countdownTextOf(count=54.4): actual=${actual}`);
      expect(actual).assertEqual('54.4');
      logInfo(`${BUNDLE}CountdownTextOf_0053 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0054
     * @tc.name      WindowStartIcon_CountdownTextOf_0054
     * @tc.desc      countdownTextOf(count=21.65) returns "21.65"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0054 begin`);
      const actual: string = countdownTextOf(21.65);
      logInfo(`countdownTextOf(count=21.65): actual=${actual}`);
      expect(actual).assertEqual('21.65');
      logInfo(`${BUNDLE}CountdownTextOf_0054 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0055
     * @tc.name      WindowStartIcon_CountdownTextOf_0055
     * @tc.desc      countdownTextOf(count=77) returns "77"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0055 begin`);
      const actual: string = countdownTextOf(77);
      logInfo(`countdownTextOf(count=77): actual=${actual}`);
      expect(actual).assertEqual('77');
      logInfo(`${BUNDLE}CountdownTextOf_0055 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0056
     * @tc.name      WindowStartIcon_CountdownTextOf_0056
     * @tc.desc      countdownTextOf(count=36.14) returns "36.14"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0056 begin`);
      const actual: string = countdownTextOf(36.14);
      logInfo(`countdownTextOf(count=36.14): actual=${actual}`);
      expect(actual).assertEqual('36.14');
      logInfo(`${BUNDLE}CountdownTextOf_0056 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0057
     * @tc.name      WindowStartIcon_CountdownTextOf_0057
     * @tc.desc      countdownTextOf(count=29.7) returns "29.7"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0057 begin`);
      const actual: string = countdownTextOf(29.7);
      logInfo(`countdownTextOf(count=29.7): actual=${actual}`);
      expect(actual).assertEqual('29.7');
      logInfo(`${BUNDLE}CountdownTextOf_0057 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0058
     * @tc.name      WindowStartIcon_CountdownTextOf_0058
     * @tc.desc      countdownTextOf(count=188) returns "188"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0058 begin`);
      const actual: string = countdownTextOf(188);
      logInfo(`countdownTextOf(count=188): actual=${actual}`);
      expect(actual).assertEqual('188');
      logInfo(`${BUNDLE}CountdownTextOf_0058 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0059
     * @tc.name      WindowStartIcon_CountdownTextOf_0059
     * @tc.desc      countdownTextOf(count=-87) returns "-87"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_CountdownTextOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0059 begin`);
      const actual: string = countdownTextOf(-87);
      logInfo(`countdownTextOf(count=-87): actual=${actual}`);
      expect(actual).assertEqual('-87');
      logInfo(`${BUNDLE}CountdownTextOf_0059 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0060
     * @tc.name      WindowStartIcon_CountdownTextOf_0060
     * @tc.desc      countdownTextOf(count=47) returns "47"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0060 begin`);
      const actual: string = countdownTextOf(47);
      logInfo(`countdownTextOf(count=47): actual=${actual}`);
      expect(actual).assertEqual('47');
      logInfo(`${BUNDLE}CountdownTextOf_0060 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0061
     * @tc.name      WindowStartIcon_CountdownTextOf_0061
     * @tc.desc      countdownTextOf(count=51) returns "51"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0061 begin`);
      const actual: string = countdownTextOf(51);
      logInfo(`countdownTextOf(count=51): actual=${actual}`);
      expect(actual).assertEqual('51');
      logInfo(`${BUNDLE}CountdownTextOf_0061 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0062
     * @tc.name      WindowStartIcon_CountdownTextOf_0062
     * @tc.desc      countdownTextOf(count=-99) returns "-99"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_CountdownTextOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0062 begin`);
      const actual: string = countdownTextOf(-99);
      logInfo(`countdownTextOf(count=-99): actual=${actual}`);
      expect(actual).assertEqual('-99');
      logInfo(`${BUNDLE}CountdownTextOf_0062 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0063
     * @tc.name      WindowStartIcon_CountdownTextOf_0063
     * @tc.desc      countdownTextOf(count=69.01) returns "69.01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0063 begin`);
      const actual: string = countdownTextOf(69.01);
      logInfo(`countdownTextOf(count=69.01): actual=${actual}`);
      expect(actual).assertEqual('69.01');
      logInfo(`${BUNDLE}CountdownTextOf_0063 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0064
     * @tc.name      WindowStartIcon_CountdownTextOf_0064
     * @tc.desc      countdownTextOf(count=-16) returns "-16"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_CountdownTextOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0064 begin`);
      const actual: string = countdownTextOf(-16);
      logInfo(`countdownTextOf(count=-16): actual=${actual}`);
      expect(actual).assertEqual('-16');
      logInfo(`${BUNDLE}CountdownTextOf_0064 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0065
     * @tc.name      WindowStartIcon_CountdownTextOf_0065
     * @tc.desc      countdownTextOf(count=156) returns "156"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0065 begin`);
      const actual: string = countdownTextOf(156);
      logInfo(`countdownTextOf(count=156): actual=${actual}`);
      expect(actual).assertEqual('156');
      logInfo(`${BUNDLE}CountdownTextOf_0065 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0066
     * @tc.name      WindowStartIcon_CountdownTextOf_0066
     * @tc.desc      countdownTextOf(count=53.99) returns "53.99"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0066 begin`);
      const actual: string = countdownTextOf(53.99);
      logInfo(`countdownTextOf(count=53.99): actual=${actual}`);
      expect(actual).assertEqual('53.99');
      logInfo(`${BUNDLE}CountdownTextOf_0066 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0067
     * @tc.name      WindowStartIcon_CountdownTextOf_0067
     * @tc.desc      countdownTextOf(count=4.08) returns "4.08"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0067 begin`);
      const actual: string = countdownTextOf(4.08);
      logInfo(`countdownTextOf(count=4.08): actual=${actual}`);
      expect(actual).assertEqual('4.08');
      logInfo(`${BUNDLE}CountdownTextOf_0067 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0068
     * @tc.name      WindowStartIcon_CountdownTextOf_0068
     * @tc.desc      countdownTextOf(count=-17) returns "-17"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_CountdownTextOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0068 begin`);
      const actual: string = countdownTextOf(-17);
      logInfo(`countdownTextOf(count=-17): actual=${actual}`);
      expect(actual).assertEqual('-17');
      logInfo(`${BUNDLE}CountdownTextOf_0068 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0069
     * @tc.name      WindowStartIcon_CountdownTextOf_0069
     * @tc.desc      countdownTextOf(count=28) returns "28"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0069 begin`);
      const actual: string = countdownTextOf(28);
      logInfo(`countdownTextOf(count=28): actual=${actual}`);
      expect(actual).assertEqual('28');
      logInfo(`${BUNDLE}CountdownTextOf_0069 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0070
     * @tc.name      WindowStartIcon_CountdownTextOf_0070
     * @tc.desc      countdownTextOf(count=189) returns "189"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0070 begin`);
      const actual: string = countdownTextOf(189);
      logInfo(`countdownTextOf(count=189): actual=${actual}`);
      expect(actual).assertEqual('189');
      logInfo(`${BUNDLE}CountdownTextOf_0070 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0071
     * @tc.name      WindowStartIcon_CountdownTextOf_0071
     * @tc.desc      countdownTextOf(count=16.93) returns "16.93"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0071 begin`);
      const actual: string = countdownTextOf(16.93);
      logInfo(`countdownTextOf(count=16.93): actual=${actual}`);
      expect(actual).assertEqual('16.93');
      logInfo(`${BUNDLE}CountdownTextOf_0071 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0072
     * @tc.name      WindowStartIcon_CountdownTextOf_0072
     * @tc.desc      countdownTextOf(count=168) returns "168"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0072 begin`);
      const actual: string = countdownTextOf(168);
      logInfo(`countdownTextOf(count=168): actual=${actual}`);
      expect(actual).assertEqual('168');
      logInfo(`${BUNDLE}CountdownTextOf_0072 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0073
     * @tc.name      WindowStartIcon_CountdownTextOf_0073
     * @tc.desc      countdownTextOf(count=39.02) returns "39.02"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0073 begin`);
      const actual: string = countdownTextOf(39.02);
      logInfo(`countdownTextOf(count=39.02): actual=${actual}`);
      expect(actual).assertEqual('39.02');
      logInfo(`${BUNDLE}CountdownTextOf_0073 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0074
     * @tc.name      WindowStartIcon_CountdownTextOf_0074
     * @tc.desc      countdownTextOf(count=85.38) returns "85.38"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0074 begin`);
      const actual: string = countdownTextOf(85.38);
      logInfo(`countdownTextOf(count=85.38): actual=${actual}`);
      expect(actual).assertEqual('85.38');
      logInfo(`${BUNDLE}CountdownTextOf_0074 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0075
     * @tc.name      WindowStartIcon_CountdownTextOf_0075
     * @tc.desc      countdownTextOf(count=-61) returns "-61"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_CountdownTextOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0075 begin`);
      const actual: string = countdownTextOf(-61);
      logInfo(`countdownTextOf(count=-61): actual=${actual}`);
      expect(actual).assertEqual('-61');
      logInfo(`${BUNDLE}CountdownTextOf_0075 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0076
     * @tc.name      WindowStartIcon_CountdownTextOf_0076
     * @tc.desc      countdownTextOf(count=113) returns "113"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0076 begin`);
      const actual: string = countdownTextOf(113);
      logInfo(`countdownTextOf(count=113): actual=${actual}`);
      expect(actual).assertEqual('113');
      logInfo(`${BUNDLE}CountdownTextOf_0076 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0077
     * @tc.name      WindowStartIcon_CountdownTextOf_0077
     * @tc.desc      countdownTextOf(count=187) returns "187"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0077 begin`);
      const actual: string = countdownTextOf(187);
      logInfo(`countdownTextOf(count=187): actual=${actual}`);
      expect(actual).assertEqual('187');
      logInfo(`${BUNDLE}CountdownTextOf_0077 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0078
     * @tc.name      WindowStartIcon_CountdownTextOf_0078
     * @tc.desc      countdownTextOf(count=-9) returns "-9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_CountdownTextOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0078 begin`);
      const actual: string = countdownTextOf(-9);
      logInfo(`countdownTextOf(count=-9): actual=${actual}`);
      expect(actual).assertEqual('-9');
      logInfo(`${BUNDLE}CountdownTextOf_0078 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0079
     * @tc.name      WindowStartIcon_CountdownTextOf_0079
     * @tc.desc      countdownTextOf(count=-62) returns "-62"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_CountdownTextOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0079 begin`);
      const actual: string = countdownTextOf(-62);
      logInfo(`countdownTextOf(count=-62): actual=${actual}`);
      expect(actual).assertEqual('-62');
      logInfo(`${BUNDLE}CountdownTextOf_0079 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0080
     * @tc.name      WindowStartIcon_CountdownTextOf_0080
     * @tc.desc      countdownTextOf(count=98) returns "98"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0080 begin`);
      const actual: string = countdownTextOf(98);
      logInfo(`countdownTextOf(count=98): actual=${actual}`);
      expect(actual).assertEqual('98');
      logInfo(`${BUNDLE}CountdownTextOf_0080 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0081
     * @tc.name      WindowStartIcon_CountdownTextOf_0081
     * @tc.desc      countdownTextOf(count=-92) returns "-92"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_CountdownTextOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0081 begin`);
      const actual: string = countdownTextOf(-92);
      logInfo(`countdownTextOf(count=-92): actual=${actual}`);
      expect(actual).assertEqual('-92');
      logInfo(`${BUNDLE}CountdownTextOf_0081 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0082
     * @tc.name      WindowStartIcon_CountdownTextOf_0082
     * @tc.desc      countdownTextOf(count=143) returns "143"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0082 begin`);
      const actual: string = countdownTextOf(143);
      logInfo(`countdownTextOf(count=143): actual=${actual}`);
      expect(actual).assertEqual('143');
      logInfo(`${BUNDLE}CountdownTextOf_0082 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0083
     * @tc.name      WindowStartIcon_CountdownTextOf_0083
     * @tc.desc      countdownTextOf(count=133) returns "133"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0083 begin`);
      const actual: string = countdownTextOf(133);
      logInfo(`countdownTextOf(count=133): actual=${actual}`);
      expect(actual).assertEqual('133');
      logInfo(`${BUNDLE}CountdownTextOf_0083 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0084
     * @tc.name      WindowStartIcon_CountdownTextOf_0084
     * @tc.desc      countdownTextOf(count=147) returns "147"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0084 begin`);
      const actual: string = countdownTextOf(147);
      logInfo(`countdownTextOf(count=147): actual=${actual}`);
      expect(actual).assertEqual('147');
      logInfo(`${BUNDLE}CountdownTextOf_0084 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0085
     * @tc.name      WindowStartIcon_CountdownTextOf_0085
     * @tc.desc      countdownTextOf(count=163) returns "163"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0085 begin`);
      const actual: string = countdownTextOf(163);
      logInfo(`countdownTextOf(count=163): actual=${actual}`);
      expect(actual).assertEqual('163');
      logInfo(`${BUNDLE}CountdownTextOf_0085 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0086
     * @tc.name      WindowStartIcon_CountdownTextOf_0086
     * @tc.desc      countdownTextOf(count=63.52) returns "63.52"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0086 begin`);
      const actual: string = countdownTextOf(63.52);
      logInfo(`countdownTextOf(count=63.52): actual=${actual}`);
      expect(actual).assertEqual('63.52');
      logInfo(`${BUNDLE}CountdownTextOf_0086 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0087
     * @tc.name      WindowStartIcon_CountdownTextOf_0087
     * @tc.desc      countdownTextOf(count=66.3) returns "66.3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0087 begin`);
      const actual: string = countdownTextOf(66.3);
      logInfo(`countdownTextOf(count=66.3): actual=${actual}`);
      expect(actual).assertEqual('66.3');
      logInfo(`${BUNDLE}CountdownTextOf_0087 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0088
     * @tc.name      WindowStartIcon_CountdownTextOf_0088
     * @tc.desc      countdownTextOf(count=15.71) returns "15.71"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0088 begin`);
      const actual: string = countdownTextOf(15.71);
      logInfo(`countdownTextOf(count=15.71): actual=${actual}`);
      expect(actual).assertEqual('15.71');
      logInfo(`${BUNDLE}CountdownTextOf_0088 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0089
     * @tc.name      WindowStartIcon_CountdownTextOf_0089
     * @tc.desc      countdownTextOf(count=99.08) returns "99.08"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0089 begin`);
      const actual: string = countdownTextOf(99.08);
      logInfo(`countdownTextOf(count=99.08): actual=${actual}`);
      expect(actual).assertEqual('99.08');
      logInfo(`${BUNDLE}CountdownTextOf_0089 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0090
     * @tc.name      WindowStartIcon_CountdownTextOf_0090
     * @tc.desc      countdownTextOf(count=-59) returns "-59"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_CountdownTextOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0090 begin`);
      const actual: string = countdownTextOf(-59);
      logInfo(`countdownTextOf(count=-59): actual=${actual}`);
      expect(actual).assertEqual('-59');
      logInfo(`${BUNDLE}CountdownTextOf_0090 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0091
     * @tc.name      WindowStartIcon_CountdownTextOf_0091
     * @tc.desc      countdownTextOf(count=-13) returns "-13"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_CountdownTextOf_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0091 begin`);
      const actual: string = countdownTextOf(-13);
      logInfo(`countdownTextOf(count=-13): actual=${actual}`);
      expect(actual).assertEqual('-13');
      logInfo(`${BUNDLE}CountdownTextOf_0091 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0092
     * @tc.name      WindowStartIcon_CountdownTextOf_0092
     * @tc.desc      countdownTextOf(count=6.23) returns "6.23"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0092 begin`);
      const actual: string = countdownTextOf(6.23);
      logInfo(`countdownTextOf(count=6.23): actual=${actual}`);
      expect(actual).assertEqual('6.23');
      logInfo(`${BUNDLE}CountdownTextOf_0092 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0093
     * @tc.name      WindowStartIcon_CountdownTextOf_0093
     * @tc.desc      countdownTextOf(count=38) returns "38"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0093 begin`);
      const actual: string = countdownTextOf(38);
      logInfo(`countdownTextOf(count=38): actual=${actual}`);
      expect(actual).assertEqual('38');
      logInfo(`${BUNDLE}CountdownTextOf_0093 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0094
     * @tc.name      WindowStartIcon_CountdownTextOf_0094
     * @tc.desc      countdownTextOf(count=-30) returns "-30"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_CountdownTextOf_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0094 begin`);
      const actual: string = countdownTextOf(-30);
      logInfo(`countdownTextOf(count=-30): actual=${actual}`);
      expect(actual).assertEqual('-30');
      logInfo(`${BUNDLE}CountdownTextOf_0094 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0095
     * @tc.name      WindowStartIcon_CountdownTextOf_0095
     * @tc.desc      countdownTextOf(count=42.35) returns "42.35"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0095 begin`);
      const actual: string = countdownTextOf(42.35);
      logInfo(`countdownTextOf(count=42.35): actual=${actual}`);
      expect(actual).assertEqual('42.35');
      logInfo(`${BUNDLE}CountdownTextOf_0095 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0096
     * @tc.name      WindowStartIcon_CountdownTextOf_0096
     * @tc.desc      countdownTextOf(count=64) returns "64"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0096 begin`);
      const actual: string = countdownTextOf(64);
      logInfo(`countdownTextOf(count=64): actual=${actual}`);
      expect(actual).assertEqual('64');
      logInfo(`${BUNDLE}CountdownTextOf_0096 end`);
    });
  });
}
