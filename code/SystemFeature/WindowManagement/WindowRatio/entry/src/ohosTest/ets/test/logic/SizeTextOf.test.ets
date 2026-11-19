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
import { sizeTextOf } from '../model/WindowRatioLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_WindowRatio]';
const BUNDLE: string = 'WindowRatio_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for sizeTextOf (96 cases). */
export default function sizeTextOfTest(): void {
  describe('SizeTextOfTest', () => {
    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0001
     * @tc.name      WindowRatio_SizeTextOf_0001
     * @tc.desc      sizeTextOf(value=0) returns "0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('WindowRatio_SizeTextOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SizeTextOf_0001 begin`);
      const actual: string = sizeTextOf(0);
      logInfo(`sizeTextOf(value=0): actual=${actual}`);
      expect(actual).assertEqual('0');
      logInfo(`${BUNDLE}SizeTextOf_0001 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0002
     * @tc.name      WindowRatio_SizeTextOf_0002
     * @tc.desc      sizeTextOf(value=1) returns "1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('WindowRatio_SizeTextOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SizeTextOf_0002 begin`);
      const actual: string = sizeTextOf(1);
      logInfo(`sizeTextOf(value=1): actual=${actual}`);
      expect(actual).assertEqual('1');
      logInfo(`${BUNDLE}SizeTextOf_0002 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0003
     * @tc.name      WindowRatio_SizeTextOf_0003
     * @tc.desc      sizeTextOf(value=-1) returns "-1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_SizeTextOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SizeTextOf_0003 begin`);
      const actual: string = sizeTextOf(-1);
      logInfo(`sizeTextOf(value=-1): actual=${actual}`);
      expect(actual).assertEqual('-1');
      logInfo(`${BUNDLE}SizeTextOf_0003 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0004
     * @tc.name      WindowRatio_SizeTextOf_0004
     * @tc.desc      sizeTextOf(value=2) returns "2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0004 begin`);
      const actual: string = sizeTextOf(2);
      logInfo(`sizeTextOf(value=2): actual=${actual}`);
      expect(actual).assertEqual('2');
      logInfo(`${BUNDLE}SizeTextOf_0004 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0005
     * @tc.name      WindowRatio_SizeTextOf_0005
     * @tc.desc      sizeTextOf(value=3) returns "3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0005 begin`);
      const actual: string = sizeTextOf(3);
      logInfo(`sizeTextOf(value=3): actual=${actual}`);
      expect(actual).assertEqual('3');
      logInfo(`${BUNDLE}SizeTextOf_0005 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0006
     * @tc.name      WindowRatio_SizeTextOf_0006
     * @tc.desc      sizeTextOf(value=10) returns "10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0006 begin`);
      const actual: string = sizeTextOf(10);
      logInfo(`sizeTextOf(value=10): actual=${actual}`);
      expect(actual).assertEqual('10');
      logInfo(`${BUNDLE}SizeTextOf_0006 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0007
     * @tc.name      WindowRatio_SizeTextOf_0007
     * @tc.desc      sizeTextOf(value=100) returns "100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0007 begin`);
      const actual: string = sizeTextOf(100);
      logInfo(`sizeTextOf(value=100): actual=${actual}`);
      expect(actual).assertEqual('100');
      logInfo(`${BUNDLE}SizeTextOf_0007 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0008
     * @tc.name      WindowRatio_SizeTextOf_0008
     * @tc.desc      sizeTextOf(value=5) returns "5"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0008 begin`);
      const actual: string = sizeTextOf(5);
      logInfo(`sizeTextOf(value=5): actual=${actual}`);
      expect(actual).assertEqual('5');
      logInfo(`${BUNDLE}SizeTextOf_0008 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0009
     * @tc.name      WindowRatio_SizeTextOf_0009
     * @tc.desc      sizeTextOf(value=15) returns "15"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0009 begin`);
      const actual: string = sizeTextOf(15);
      logInfo(`sizeTextOf(value=15): actual=${actual}`);
      expect(actual).assertEqual('15');
      logInfo(`${BUNDLE}SizeTextOf_0009 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0010
     * @tc.name      WindowRatio_SizeTextOf_0010
     * @tc.desc      sizeTextOf(value=20) returns "20"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0010 begin`);
      const actual: string = sizeTextOf(20);
      logInfo(`sizeTextOf(value=20): actual=${actual}`);
      expect(actual).assertEqual('20');
      logInfo(`${BUNDLE}SizeTextOf_0010 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0011
     * @tc.name      WindowRatio_SizeTextOf_0011
     * @tc.desc      sizeTextOf(value=25) returns "25"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0011 begin`);
      const actual: string = sizeTextOf(25);
      logInfo(`sizeTextOf(value=25): actual=${actual}`);
      expect(actual).assertEqual('25');
      logInfo(`${BUNDLE}SizeTextOf_0011 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0012
     * @tc.name      WindowRatio_SizeTextOf_0012
     * @tc.desc      sizeTextOf(value=30) returns "30"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0012 begin`);
      const actual: string = sizeTextOf(30);
      logInfo(`sizeTextOf(value=30): actual=${actual}`);
      expect(actual).assertEqual('30');
      logInfo(`${BUNDLE}SizeTextOf_0012 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0013
     * @tc.name      WindowRatio_SizeTextOf_0013
     * @tc.desc      sizeTextOf(value=35) returns "35"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0013 begin`);
      const actual: string = sizeTextOf(35);
      logInfo(`sizeTextOf(value=35): actual=${actual}`);
      expect(actual).assertEqual('35');
      logInfo(`${BUNDLE}SizeTextOf_0013 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0014
     * @tc.name      WindowRatio_SizeTextOf_0014
     * @tc.desc      sizeTextOf(value=40) returns "40"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0014 begin`);
      const actual: string = sizeTextOf(40);
      logInfo(`sizeTextOf(value=40): actual=${actual}`);
      expect(actual).assertEqual('40');
      logInfo(`${BUNDLE}SizeTextOf_0014 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0015
     * @tc.name      WindowRatio_SizeTextOf_0015
     * @tc.desc      sizeTextOf(value=45) returns "45"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0015 begin`);
      const actual: string = sizeTextOf(45);
      logInfo(`sizeTextOf(value=45): actual=${actual}`);
      expect(actual).assertEqual('45');
      logInfo(`${BUNDLE}SizeTextOf_0015 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0016
     * @tc.name      WindowRatio_SizeTextOf_0016
     * @tc.desc      sizeTextOf(value=50) returns "50"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0016 begin`);
      const actual: string = sizeTextOf(50);
      logInfo(`sizeTextOf(value=50): actual=${actual}`);
      expect(actual).assertEqual('50');
      logInfo(`${BUNDLE}SizeTextOf_0016 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0017
     * @tc.name      WindowRatio_SizeTextOf_0017
     * @tc.desc      sizeTextOf(value=55) returns "55"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0017 begin`);
      const actual: string = sizeTextOf(55);
      logInfo(`sizeTextOf(value=55): actual=${actual}`);
      expect(actual).assertEqual('55');
      logInfo(`${BUNDLE}SizeTextOf_0017 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0018
     * @tc.name      WindowRatio_SizeTextOf_0018
     * @tc.desc      sizeTextOf(value=60) returns "60"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0018 begin`);
      const actual: string = sizeTextOf(60);
      logInfo(`sizeTextOf(value=60): actual=${actual}`);
      expect(actual).assertEqual('60');
      logInfo(`${BUNDLE}SizeTextOf_0018 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0019
     * @tc.name      WindowRatio_SizeTextOf_0019
     * @tc.desc      sizeTextOf(value=65) returns "65"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0019 begin`);
      const actual: string = sizeTextOf(65);
      logInfo(`sizeTextOf(value=65): actual=${actual}`);
      expect(actual).assertEqual('65');
      logInfo(`${BUNDLE}SizeTextOf_0019 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0020
     * @tc.name      WindowRatio_SizeTextOf_0020
     * @tc.desc      sizeTextOf(value=70) returns "70"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0020 begin`);
      const actual: string = sizeTextOf(70);
      logInfo(`sizeTextOf(value=70): actual=${actual}`);
      expect(actual).assertEqual('70');
      logInfo(`${BUNDLE}SizeTextOf_0020 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0021
     * @tc.name      WindowRatio_SizeTextOf_0021
     * @tc.desc      sizeTextOf(value=75) returns "75"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0021 begin`);
      const actual: string = sizeTextOf(75);
      logInfo(`sizeTextOf(value=75): actual=${actual}`);
      expect(actual).assertEqual('75');
      logInfo(`${BUNDLE}SizeTextOf_0021 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0022
     * @tc.name      WindowRatio_SizeTextOf_0022
     * @tc.desc      sizeTextOf(value=80) returns "80"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0022 begin`);
      const actual: string = sizeTextOf(80);
      logInfo(`sizeTextOf(value=80): actual=${actual}`);
      expect(actual).assertEqual('80');
      logInfo(`${BUNDLE}SizeTextOf_0022 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0023
     * @tc.name      WindowRatio_SizeTextOf_0023
     * @tc.desc      sizeTextOf(value=85) returns "85"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0023 begin`);
      const actual: string = sizeTextOf(85);
      logInfo(`sizeTextOf(value=85): actual=${actual}`);
      expect(actual).assertEqual('85');
      logInfo(`${BUNDLE}SizeTextOf_0023 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0024
     * @tc.name      WindowRatio_SizeTextOf_0024
     * @tc.desc      sizeTextOf(value=90) returns "90"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0024 begin`);
      const actual: string = sizeTextOf(90);
      logInfo(`sizeTextOf(value=90): actual=${actual}`);
      expect(actual).assertEqual('90');
      logInfo(`${BUNDLE}SizeTextOf_0024 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0025
     * @tc.name      WindowRatio_SizeTextOf_0025
     * @tc.desc      sizeTextOf(value=95) returns "95"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0025 begin`);
      const actual: string = sizeTextOf(95);
      logInfo(`sizeTextOf(value=95): actual=${actual}`);
      expect(actual).assertEqual('95');
      logInfo(`${BUNDLE}SizeTextOf_0025 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0026
     * @tc.name      WindowRatio_SizeTextOf_0026
     * @tc.desc      sizeTextOf(value=105) returns "105"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0026 begin`);
      const actual: string = sizeTextOf(105);
      logInfo(`sizeTextOf(value=105): actual=${actual}`);
      expect(actual).assertEqual('105');
      logInfo(`${BUNDLE}SizeTextOf_0026 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0027
     * @tc.name      WindowRatio_SizeTextOf_0027
     * @tc.desc      sizeTextOf(value=110) returns "110"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0027 begin`);
      const actual: string = sizeTextOf(110);
      logInfo(`sizeTextOf(value=110): actual=${actual}`);
      expect(actual).assertEqual('110');
      logInfo(`${BUNDLE}SizeTextOf_0027 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0028
     * @tc.name      WindowRatio_SizeTextOf_0028
     * @tc.desc      sizeTextOf(value=115) returns "115"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0028 begin`);
      const actual: string = sizeTextOf(115);
      logInfo(`sizeTextOf(value=115): actual=${actual}`);
      expect(actual).assertEqual('115');
      logInfo(`${BUNDLE}SizeTextOf_0028 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0029
     * @tc.name      WindowRatio_SizeTextOf_0029
     * @tc.desc      sizeTextOf(value=120) returns "120"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0029 begin`);
      const actual: string = sizeTextOf(120);
      logInfo(`sizeTextOf(value=120): actual=${actual}`);
      expect(actual).assertEqual('120');
      logInfo(`${BUNDLE}SizeTextOf_0029 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0030
     * @tc.name      WindowRatio_SizeTextOf_0030
     * @tc.desc      sizeTextOf(value=125) returns "125"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0030 begin`);
      const actual: string = sizeTextOf(125);
      logInfo(`sizeTextOf(value=125): actual=${actual}`);
      expect(actual).assertEqual('125');
      logInfo(`${BUNDLE}SizeTextOf_0030 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0031
     * @tc.name      WindowRatio_SizeTextOf_0031
     * @tc.desc      sizeTextOf(value=130) returns "130"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0031 begin`);
      const actual: string = sizeTextOf(130);
      logInfo(`sizeTextOf(value=130): actual=${actual}`);
      expect(actual).assertEqual('130');
      logInfo(`${BUNDLE}SizeTextOf_0031 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0032
     * @tc.name      WindowRatio_SizeTextOf_0032
     * @tc.desc      sizeTextOf(value=135) returns "135"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0032 begin`);
      const actual: string = sizeTextOf(135);
      logInfo(`sizeTextOf(value=135): actual=${actual}`);
      expect(actual).assertEqual('135');
      logInfo(`${BUNDLE}SizeTextOf_0032 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0033
     * @tc.name      WindowRatio_SizeTextOf_0033
     * @tc.desc      sizeTextOf(value=140) returns "140"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0033 begin`);
      const actual: string = sizeTextOf(140);
      logInfo(`sizeTextOf(value=140): actual=${actual}`);
      expect(actual).assertEqual('140');
      logInfo(`${BUNDLE}SizeTextOf_0033 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0034
     * @tc.name      WindowRatio_SizeTextOf_0034
     * @tc.desc      sizeTextOf(value=145) returns "145"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0034 begin`);
      const actual: string = sizeTextOf(145);
      logInfo(`sizeTextOf(value=145): actual=${actual}`);
      expect(actual).assertEqual('145');
      logInfo(`${BUNDLE}SizeTextOf_0034 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0035
     * @tc.name      WindowRatio_SizeTextOf_0035
     * @tc.desc      sizeTextOf(value=150) returns "150"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0035 begin`);
      const actual: string = sizeTextOf(150);
      logInfo(`sizeTextOf(value=150): actual=${actual}`);
      expect(actual).assertEqual('150');
      logInfo(`${BUNDLE}SizeTextOf_0035 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0036
     * @tc.name      WindowRatio_SizeTextOf_0036
     * @tc.desc      sizeTextOf(value=155) returns "155"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0036 begin`);
      const actual: string = sizeTextOf(155);
      logInfo(`sizeTextOf(value=155): actual=${actual}`);
      expect(actual).assertEqual('155');
      logInfo(`${BUNDLE}SizeTextOf_0036 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0037
     * @tc.name      WindowRatio_SizeTextOf_0037
     * @tc.desc      sizeTextOf(value=160) returns "160"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0037 begin`);
      const actual: string = sizeTextOf(160);
      logInfo(`sizeTextOf(value=160): actual=${actual}`);
      expect(actual).assertEqual('160');
      logInfo(`${BUNDLE}SizeTextOf_0037 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0038
     * @tc.name      WindowRatio_SizeTextOf_0038
     * @tc.desc      sizeTextOf(value=165) returns "165"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0038 begin`);
      const actual: string = sizeTextOf(165);
      logInfo(`sizeTextOf(value=165): actual=${actual}`);
      expect(actual).assertEqual('165');
      logInfo(`${BUNDLE}SizeTextOf_0038 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0039
     * @tc.name      WindowRatio_SizeTextOf_0039
     * @tc.desc      sizeTextOf(value=170) returns "170"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0039 begin`);
      const actual: string = sizeTextOf(170);
      logInfo(`sizeTextOf(value=170): actual=${actual}`);
      expect(actual).assertEqual('170');
      logInfo(`${BUNDLE}SizeTextOf_0039 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0040
     * @tc.name      WindowRatio_SizeTextOf_0040
     * @tc.desc      sizeTextOf(value=175) returns "175"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0040 begin`);
      const actual: string = sizeTextOf(175);
      logInfo(`sizeTextOf(value=175): actual=${actual}`);
      expect(actual).assertEqual('175');
      logInfo(`${BUNDLE}SizeTextOf_0040 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0041
     * @tc.name      WindowRatio_SizeTextOf_0041
     * @tc.desc      sizeTextOf(value=180) returns "180"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0041 begin`);
      const actual: string = sizeTextOf(180);
      logInfo(`sizeTextOf(value=180): actual=${actual}`);
      expect(actual).assertEqual('180');
      logInfo(`${BUNDLE}SizeTextOf_0041 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0042
     * @tc.name      WindowRatio_SizeTextOf_0042
     * @tc.desc      sizeTextOf(value=185) returns "185"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0042 begin`);
      const actual: string = sizeTextOf(185);
      logInfo(`sizeTextOf(value=185): actual=${actual}`);
      expect(actual).assertEqual('185');
      logInfo(`${BUNDLE}SizeTextOf_0042 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0043
     * @tc.name      WindowRatio_SizeTextOf_0043
     * @tc.desc      sizeTextOf(value=190) returns "190"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0043 begin`);
      const actual: string = sizeTextOf(190);
      logInfo(`sizeTextOf(value=190): actual=${actual}`);
      expect(actual).assertEqual('190');
      logInfo(`${BUNDLE}SizeTextOf_0043 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0044
     * @tc.name      WindowRatio_SizeTextOf_0044
     * @tc.desc      sizeTextOf(value=195) returns "195"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0044 begin`);
      const actual: string = sizeTextOf(195);
      logInfo(`sizeTextOf(value=195): actual=${actual}`);
      expect(actual).assertEqual('195');
      logInfo(`${BUNDLE}SizeTextOf_0044 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0045
     * @tc.name      WindowRatio_SizeTextOf_0045
     * @tc.desc      sizeTextOf(value=200) returns "200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0045 begin`);
      const actual: string = sizeTextOf(200);
      logInfo(`sizeTextOf(value=200): actual=${actual}`);
      expect(actual).assertEqual('200');
      logInfo(`${BUNDLE}SizeTextOf_0045 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0046
     * @tc.name      WindowRatio_SizeTextOf_0046
     * @tc.desc      sizeTextOf(value=42) returns "42"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0046 begin`);
      const actual: string = sizeTextOf(42);
      logInfo(`sizeTextOf(value=42): actual=${actual}`);
      expect(actual).assertEqual('42');
      logInfo(`${BUNDLE}SizeTextOf_0046 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0047
     * @tc.name      WindowRatio_SizeTextOf_0047
     * @tc.desc      sizeTextOf(value=113) returns "113"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0047 begin`);
      const actual: string = sizeTextOf(113);
      logInfo(`sizeTextOf(value=113): actual=${actual}`);
      expect(actual).assertEqual('113');
      logInfo(`${BUNDLE}SizeTextOf_0047 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0048
     * @tc.name      WindowRatio_SizeTextOf_0048
     * @tc.desc      sizeTextOf(value=142) returns "142"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0048 begin`);
      const actual: string = sizeTextOf(142);
      logInfo(`sizeTextOf(value=142): actual=${actual}`);
      expect(actual).assertEqual('142');
      logInfo(`${BUNDLE}SizeTextOf_0048 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0049
     * @tc.name      WindowRatio_SizeTextOf_0049
     * @tc.desc      sizeTextOf(value=139) returns "139"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0049 begin`);
      const actual: string = sizeTextOf(139);
      logInfo(`sizeTextOf(value=139): actual=${actual}`);
      expect(actual).assertEqual('139');
      logInfo(`${BUNDLE}SizeTextOf_0049 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0050
     * @tc.name      WindowRatio_SizeTextOf_0050
     * @tc.desc      sizeTextOf(value=-42) returns "-42"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_SizeTextOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SizeTextOf_0050 begin`);
      const actual: string = sizeTextOf(-42);
      logInfo(`sizeTextOf(value=-42): actual=${actual}`);
      expect(actual).assertEqual('-42');
      logInfo(`${BUNDLE}SizeTextOf_0050 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0051
     * @tc.name      WindowRatio_SizeTextOf_0051
     * @tc.desc      sizeTextOf(value=-7) returns "-7"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_SizeTextOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SizeTextOf_0051 begin`);
      const actual: string = sizeTextOf(-7);
      logInfo(`sizeTextOf(value=-7): actual=${actual}`);
      expect(actual).assertEqual('-7');
      logInfo(`${BUNDLE}SizeTextOf_0051 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0052
     * @tc.name      WindowRatio_SizeTextOf_0052
     * @tc.desc      sizeTextOf(value=33) returns "33"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0052 begin`);
      const actual: string = sizeTextOf(33);
      logInfo(`sizeTextOf(value=33): actual=${actual}`);
      expect(actual).assertEqual('33');
      logInfo(`${BUNDLE}SizeTextOf_0052 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0053
     * @tc.name      WindowRatio_SizeTextOf_0053
     * @tc.desc      sizeTextOf(value=-59) returns "-59"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_SizeTextOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SizeTextOf_0053 begin`);
      const actual: string = sizeTextOf(-59);
      logInfo(`sizeTextOf(value=-59): actual=${actual}`);
      expect(actual).assertEqual('-59');
      logInfo(`${BUNDLE}SizeTextOf_0053 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0054
     * @tc.name      WindowRatio_SizeTextOf_0054
     * @tc.desc      sizeTextOf(value=86) returns "86"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0054 begin`);
      const actual: string = sizeTextOf(86);
      logInfo(`sizeTextOf(value=86): actual=${actual}`);
      expect(actual).assertEqual('86');
      logInfo(`${BUNDLE}SizeTextOf_0054 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0055
     * @tc.name      WindowRatio_SizeTextOf_0055
     * @tc.desc      sizeTextOf(value=-53) returns "-53"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_SizeTextOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SizeTextOf_0055 begin`);
      const actual: string = sizeTextOf(-53);
      logInfo(`sizeTextOf(value=-53): actual=${actual}`);
      expect(actual).assertEqual('-53');
      logInfo(`${BUNDLE}SizeTextOf_0055 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0056
     * @tc.name      WindowRatio_SizeTextOf_0056
     * @tc.desc      sizeTextOf(value=68.88) returns "68.88"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0056 begin`);
      const actual: string = sizeTextOf(68.88);
      logInfo(`sizeTextOf(value=68.88): actual=${actual}`);
      expect(actual).assertEqual('68.88');
      logInfo(`${BUNDLE}SizeTextOf_0056 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0057
     * @tc.name      WindowRatio_SizeTextOf_0057
     * @tc.desc      sizeTextOf(value=199) returns "199"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0057 begin`);
      const actual: string = sizeTextOf(199);
      logInfo(`sizeTextOf(value=199): actual=${actual}`);
      expect(actual).assertEqual('199');
      logInfo(`${BUNDLE}SizeTextOf_0057 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0058
     * @tc.name      WindowRatio_SizeTextOf_0058
     * @tc.desc      sizeTextOf(value=20.77) returns "20.77"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0058 begin`);
      const actual: string = sizeTextOf(20.77);
      logInfo(`sizeTextOf(value=20.77): actual=${actual}`);
      expect(actual).assertEqual('20.77');
      logInfo(`${BUNDLE}SizeTextOf_0058 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0059
     * @tc.name      WindowRatio_SizeTextOf_0059
     * @tc.desc      sizeTextOf(value=16) returns "16"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0059 begin`);
      const actual: string = sizeTextOf(16);
      logInfo(`sizeTextOf(value=16): actual=${actual}`);
      expect(actual).assertEqual('16');
      logInfo(`${BUNDLE}SizeTextOf_0059 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0060
     * @tc.name      WindowRatio_SizeTextOf_0060
     * @tc.desc      sizeTextOf(value=52) returns "52"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0060 begin`);
      const actual: string = sizeTextOf(52);
      logInfo(`sizeTextOf(value=52): actual=${actual}`);
      expect(actual).assertEqual('52');
      logInfo(`${BUNDLE}SizeTextOf_0060 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0061
     * @tc.name      WindowRatio_SizeTextOf_0061
     * @tc.desc      sizeTextOf(value=173) returns "173"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0061 begin`);
      const actual: string = sizeTextOf(173);
      logInfo(`sizeTextOf(value=173): actual=${actual}`);
      expect(actual).assertEqual('173');
      logInfo(`${BUNDLE}SizeTextOf_0061 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0062
     * @tc.name      WindowRatio_SizeTextOf_0062
     * @tc.desc      sizeTextOf(value=192) returns "192"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0062 begin`);
      const actual: string = sizeTextOf(192);
      logInfo(`sizeTextOf(value=192): actual=${actual}`);
      expect(actual).assertEqual('192');
      logInfo(`${BUNDLE}SizeTextOf_0062 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0063
     * @tc.name      WindowRatio_SizeTextOf_0063
     * @tc.desc      sizeTextOf(value=70.57) returns "70.57"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0063 begin`);
      const actual: string = sizeTextOf(70.57);
      logInfo(`sizeTextOf(value=70.57): actual=${actual}`);
      expect(actual).assertEqual('70.57');
      logInfo(`${BUNDLE}SizeTextOf_0063 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0064
     * @tc.name      WindowRatio_SizeTextOf_0064
     * @tc.desc      sizeTextOf(value=-24) returns "-24"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_SizeTextOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SizeTextOf_0064 begin`);
      const actual: string = sizeTextOf(-24);
      logInfo(`sizeTextOf(value=-24): actual=${actual}`);
      expect(actual).assertEqual('-24');
      logInfo(`${BUNDLE}SizeTextOf_0064 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0065
     * @tc.name      WindowRatio_SizeTextOf_0065
     * @tc.desc      sizeTextOf(value=2.45) returns "2.45"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0065 begin`);
      const actual: string = sizeTextOf(2.45);
      logInfo(`sizeTextOf(value=2.45): actual=${actual}`);
      expect(actual).assertEqual('2.45');
      logInfo(`${BUNDLE}SizeTextOf_0065 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0066
     * @tc.name      WindowRatio_SizeTextOf_0066
     * @tc.desc      sizeTextOf(value=-3) returns "-3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_SizeTextOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SizeTextOf_0066 begin`);
      const actual: string = sizeTextOf(-3);
      logInfo(`sizeTextOf(value=-3): actual=${actual}`);
      expect(actual).assertEqual('-3');
      logInfo(`${BUNDLE}SizeTextOf_0066 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0067
     * @tc.name      WindowRatio_SizeTextOf_0067
     * @tc.desc      sizeTextOf(value=53) returns "53"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0067 begin`);
      const actual: string = sizeTextOf(53);
      logInfo(`sizeTextOf(value=53): actual=${actual}`);
      expect(actual).assertEqual('53');
      logInfo(`${BUNDLE}SizeTextOf_0067 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0068
     * @tc.name      WindowRatio_SizeTextOf_0068
     * @tc.desc      sizeTextOf(value=-91) returns "-91"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_SizeTextOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SizeTextOf_0068 begin`);
      const actual: string = sizeTextOf(-91);
      logInfo(`sizeTextOf(value=-91): actual=${actual}`);
      expect(actual).assertEqual('-91');
      logInfo(`${BUNDLE}SizeTextOf_0068 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0069
     * @tc.name      WindowRatio_SizeTextOf_0069
     * @tc.desc      sizeTextOf(value=18) returns "18"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0069 begin`);
      const actual: string = sizeTextOf(18);
      logInfo(`sizeTextOf(value=18): actual=${actual}`);
      expect(actual).assertEqual('18');
      logInfo(`${BUNDLE}SizeTextOf_0069 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0070
     * @tc.name      WindowRatio_SizeTextOf_0070
     * @tc.desc      sizeTextOf(value=116) returns "116"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0070 begin`);
      const actual: string = sizeTextOf(116);
      logInfo(`sizeTextOf(value=116): actual=${actual}`);
      expect(actual).assertEqual('116');
      logInfo(`${BUNDLE}SizeTextOf_0070 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0071
     * @tc.name      WindowRatio_SizeTextOf_0071
     * @tc.desc      sizeTextOf(value=11.43) returns "11.43"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0071 begin`);
      const actual: string = sizeTextOf(11.43);
      logInfo(`sizeTextOf(value=11.43): actual=${actual}`);
      expect(actual).assertEqual('11.43');
      logInfo(`${BUNDLE}SizeTextOf_0071 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0072
     * @tc.name      WindowRatio_SizeTextOf_0072
     * @tc.desc      sizeTextOf(value=33.48) returns "33.48"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0072 begin`);
      const actual: string = sizeTextOf(33.48);
      logInfo(`sizeTextOf(value=33.48): actual=${actual}`);
      expect(actual).assertEqual('33.48');
      logInfo(`${BUNDLE}SizeTextOf_0072 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0073
     * @tc.name      WindowRatio_SizeTextOf_0073
     * @tc.desc      sizeTextOf(value=59.33) returns "59.33"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0073 begin`);
      const actual: string = sizeTextOf(59.33);
      logInfo(`sizeTextOf(value=59.33): actual=${actual}`);
      expect(actual).assertEqual('59.33');
      logInfo(`${BUNDLE}SizeTextOf_0073 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0074
     * @tc.name      WindowRatio_SizeTextOf_0074
     * @tc.desc      sizeTextOf(value=33.68) returns "33.68"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0074 begin`);
      const actual: string = sizeTextOf(33.68);
      logInfo(`sizeTextOf(value=33.68): actual=${actual}`);
      expect(actual).assertEqual('33.68');
      logInfo(`${BUNDLE}SizeTextOf_0074 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0075
     * @tc.name      WindowRatio_SizeTextOf_0075
     * @tc.desc      sizeTextOf(value=14.39) returns "14.39"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0075 begin`);
      const actual: string = sizeTextOf(14.39);
      logInfo(`sizeTextOf(value=14.39): actual=${actual}`);
      expect(actual).assertEqual('14.39');
      logInfo(`${BUNDLE}SizeTextOf_0075 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0076
     * @tc.name      WindowRatio_SizeTextOf_0076
     * @tc.desc      sizeTextOf(value=72) returns "72"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0076 begin`);
      const actual: string = sizeTextOf(72);
      logInfo(`sizeTextOf(value=72): actual=${actual}`);
      expect(actual).assertEqual('72');
      logInfo(`${BUNDLE}SizeTextOf_0076 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0077
     * @tc.name      WindowRatio_SizeTextOf_0077
     * @tc.desc      sizeTextOf(value=169) returns "169"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0077 begin`);
      const actual: string = sizeTextOf(169);
      logInfo(`sizeTextOf(value=169): actual=${actual}`);
      expect(actual).assertEqual('169');
      logInfo(`${BUNDLE}SizeTextOf_0077 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0078
     * @tc.name      WindowRatio_SizeTextOf_0078
     * @tc.desc      sizeTextOf(value=-8) returns "-8"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_SizeTextOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SizeTextOf_0078 begin`);
      const actual: string = sizeTextOf(-8);
      logInfo(`sizeTextOf(value=-8): actual=${actual}`);
      expect(actual).assertEqual('-8');
      logInfo(`${BUNDLE}SizeTextOf_0078 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0079
     * @tc.name      WindowRatio_SizeTextOf_0079
     * @tc.desc      sizeTextOf(value=-71) returns "-71"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_SizeTextOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SizeTextOf_0079 begin`);
      const actual: string = sizeTextOf(-71);
      logInfo(`sizeTextOf(value=-71): actual=${actual}`);
      expect(actual).assertEqual('-71');
      logInfo(`${BUNDLE}SizeTextOf_0079 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0080
     * @tc.name      WindowRatio_SizeTextOf_0080
     * @tc.desc      sizeTextOf(value=4.11) returns "4.11"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0080 begin`);
      const actual: string = sizeTextOf(4.11);
      logInfo(`sizeTextOf(value=4.11): actual=${actual}`);
      expect(actual).assertEqual('4.11');
      logInfo(`${BUNDLE}SizeTextOf_0080 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0081
     * @tc.name      WindowRatio_SizeTextOf_0081
     * @tc.desc      sizeTextOf(value=119) returns "119"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0081 begin`);
      const actual: string = sizeTextOf(119);
      logInfo(`sizeTextOf(value=119): actual=${actual}`);
      expect(actual).assertEqual('119');
      logInfo(`${BUNDLE}SizeTextOf_0081 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0082
     * @tc.name      WindowRatio_SizeTextOf_0082
     * @tc.desc      sizeTextOf(value=-93) returns "-93"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_SizeTextOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SizeTextOf_0082 begin`);
      const actual: string = sizeTextOf(-93);
      logInfo(`sizeTextOf(value=-93): actual=${actual}`);
      expect(actual).assertEqual('-93');
      logInfo(`${BUNDLE}SizeTextOf_0082 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0083
     * @tc.name      WindowRatio_SizeTextOf_0083
     * @tc.desc      sizeTextOf(value=183) returns "183"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0083 begin`);
      const actual: string = sizeTextOf(183);
      logInfo(`sizeTextOf(value=183): actual=${actual}`);
      expect(actual).assertEqual('183');
      logInfo(`${BUNDLE}SizeTextOf_0083 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0084
     * @tc.name      WindowRatio_SizeTextOf_0084
     * @tc.desc      sizeTextOf(value=-16) returns "-16"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_SizeTextOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SizeTextOf_0084 begin`);
      const actual: string = sizeTextOf(-16);
      logInfo(`sizeTextOf(value=-16): actual=${actual}`);
      expect(actual).assertEqual('-16');
      logInfo(`${BUNDLE}SizeTextOf_0084 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0085
     * @tc.name      WindowRatio_SizeTextOf_0085
     * @tc.desc      sizeTextOf(value=37) returns "37"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0085 begin`);
      const actual: string = sizeTextOf(37);
      logInfo(`sizeTextOf(value=37): actual=${actual}`);
      expect(actual).assertEqual('37');
      logInfo(`${BUNDLE}SizeTextOf_0085 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0086
     * @tc.name      WindowRatio_SizeTextOf_0086
     * @tc.desc      sizeTextOf(value=-13) returns "-13"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_SizeTextOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SizeTextOf_0086 begin`);
      const actual: string = sizeTextOf(-13);
      logInfo(`sizeTextOf(value=-13): actual=${actual}`);
      expect(actual).assertEqual('-13');
      logInfo(`${BUNDLE}SizeTextOf_0086 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0087
     * @tc.name      WindowRatio_SizeTextOf_0087
     * @tc.desc      sizeTextOf(value=37.15) returns "37.15"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0087 begin`);
      const actual: string = sizeTextOf(37.15);
      logInfo(`sizeTextOf(value=37.15): actual=${actual}`);
      expect(actual).assertEqual('37.15');
      logInfo(`${BUNDLE}SizeTextOf_0087 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0088
     * @tc.name      WindowRatio_SizeTextOf_0088
     * @tc.desc      sizeTextOf(value=54.54) returns "54.54"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0088 begin`);
      const actual: string = sizeTextOf(54.54);
      logInfo(`sizeTextOf(value=54.54): actual=${actual}`);
      expect(actual).assertEqual('54.54');
      logInfo(`${BUNDLE}SizeTextOf_0088 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0089
     * @tc.name      WindowRatio_SizeTextOf_0089
     * @tc.desc      sizeTextOf(value=189) returns "189"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0089 begin`);
      const actual: string = sizeTextOf(189);
      logInfo(`sizeTextOf(value=189): actual=${actual}`);
      expect(actual).assertEqual('189');
      logInfo(`${BUNDLE}SizeTextOf_0089 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0090
     * @tc.name      WindowRatio_SizeTextOf_0090
     * @tc.desc      sizeTextOf(value=-6) returns "-6"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_SizeTextOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SizeTextOf_0090 begin`);
      const actual: string = sizeTextOf(-6);
      logInfo(`sizeTextOf(value=-6): actual=${actual}`);
      expect(actual).assertEqual('-6');
      logInfo(`${BUNDLE}SizeTextOf_0090 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0091
     * @tc.name      WindowRatio_SizeTextOf_0091
     * @tc.desc      sizeTextOf(value=43.21) returns "43.21"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0091 begin`);
      const actual: string = sizeTextOf(43.21);
      logInfo(`sizeTextOf(value=43.21): actual=${actual}`);
      expect(actual).assertEqual('43.21');
      logInfo(`${BUNDLE}SizeTextOf_0091 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0092
     * @tc.name      WindowRatio_SizeTextOf_0092
     * @tc.desc      sizeTextOf(value=194) returns "194"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0092 begin`);
      const actual: string = sizeTextOf(194);
      logInfo(`sizeTextOf(value=194): actual=${actual}`);
      expect(actual).assertEqual('194');
      logInfo(`${BUNDLE}SizeTextOf_0092 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0093
     * @tc.name      WindowRatio_SizeTextOf_0093
     * @tc.desc      sizeTextOf(value=81) returns "81"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0093 begin`);
      const actual: string = sizeTextOf(81);
      logInfo(`sizeTextOf(value=81): actual=${actual}`);
      expect(actual).assertEqual('81');
      logInfo(`${BUNDLE}SizeTextOf_0093 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0094
     * @tc.name      WindowRatio_SizeTextOf_0094
     * @tc.desc      sizeTextOf(value=196) returns "196"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0094 begin`);
      const actual: string = sizeTextOf(196);
      logInfo(`sizeTextOf(value=196): actual=${actual}`);
      expect(actual).assertEqual('196');
      logInfo(`${BUNDLE}SizeTextOf_0094 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0095
     * @tc.name      WindowRatio_SizeTextOf_0095
     * @tc.desc      sizeTextOf(value=152) returns "152"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0095 begin`);
      const actual: string = sizeTextOf(152);
      logInfo(`sizeTextOf(value=152): actual=${actual}`);
      expect(actual).assertEqual('152');
      logInfo(`${BUNDLE}SizeTextOf_0095 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0096
     * @tc.name      WindowRatio_SizeTextOf_0096
     * @tc.desc      sizeTextOf(value=15.93) returns "15.93"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0096 begin`);
      const actual: string = sizeTextOf(15.93);
      logInfo(`sizeTextOf(value=15.93): actual=${actual}`);
      expect(actual).assertEqual('15.93');
      logInfo(`${BUNDLE}SizeTextOf_0096 end`);
    });
  });
}
