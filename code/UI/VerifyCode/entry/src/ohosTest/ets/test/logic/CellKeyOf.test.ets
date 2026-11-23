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
import { yieldToEventLoop } from '../TestExecution';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { cellKeyOf } from '../model/VerifyCodeLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_VerifyCode]';
const BUNDLE: string = 'VerifyCode_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for cellKeyOf (96 cases). */
export default function cellKeyOfTest(): void {
  describe('CellKeyOfTest', () => {
    beforeEach(yieldToEventLoop);

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0001
     * @tc.name      VerifyCode_CellKeyOf_0001
     * @tc.desc      cellKeyOf(item=0) returns "0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VerifyCode_CellKeyOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CellKeyOf_0001 begin`);
      const actual: string = cellKeyOf(0);
      logInfo(`cellKeyOf(item=0): actual=${actual}`);
      expect(actual).assertEqual('0');
      logInfo(`${BUNDLE}CellKeyOf_0001 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0002
     * @tc.name      VerifyCode_CellKeyOf_0002
     * @tc.desc      cellKeyOf(item=1) returns "1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VerifyCode_CellKeyOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CellKeyOf_0002 begin`);
      const actual: string = cellKeyOf(1);
      logInfo(`cellKeyOf(item=1): actual=${actual}`);
      expect(actual).assertEqual('1');
      logInfo(`${BUNDLE}CellKeyOf_0002 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0003
     * @tc.name      VerifyCode_CellKeyOf_0003
     * @tc.desc      cellKeyOf(item=-1) returns "-1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellKeyOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellKeyOf_0003 begin`);
      const actual: string = cellKeyOf(-1);
      logInfo(`cellKeyOf(item=-1): actual=${actual}`);
      expect(actual).assertEqual('-1');
      logInfo(`${BUNDLE}CellKeyOf_0003 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0004
     * @tc.name      VerifyCode_CellKeyOf_0004
     * @tc.desc      cellKeyOf(item=2) returns "2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0004 begin`);
      const actual: string = cellKeyOf(2);
      logInfo(`cellKeyOf(item=2): actual=${actual}`);
      expect(actual).assertEqual('2');
      logInfo(`${BUNDLE}CellKeyOf_0004 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0005
     * @tc.name      VerifyCode_CellKeyOf_0005
     * @tc.desc      cellKeyOf(item=3) returns "3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0005 begin`);
      const actual: string = cellKeyOf(3);
      logInfo(`cellKeyOf(item=3): actual=${actual}`);
      expect(actual).assertEqual('3');
      logInfo(`${BUNDLE}CellKeyOf_0005 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0006
     * @tc.name      VerifyCode_CellKeyOf_0006
     * @tc.desc      cellKeyOf(item=10) returns "10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0006 begin`);
      const actual: string = cellKeyOf(10);
      logInfo(`cellKeyOf(item=10): actual=${actual}`);
      expect(actual).assertEqual('10');
      logInfo(`${BUNDLE}CellKeyOf_0006 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0007
     * @tc.name      VerifyCode_CellKeyOf_0007
     * @tc.desc      cellKeyOf(item=100) returns "100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0007 begin`);
      const actual: string = cellKeyOf(100);
      logInfo(`cellKeyOf(item=100): actual=${actual}`);
      expect(actual).assertEqual('100');
      logInfo(`${BUNDLE}CellKeyOf_0007 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0008
     * @tc.name      VerifyCode_CellKeyOf_0008
     * @tc.desc      cellKeyOf(item=5) returns "5"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0008 begin`);
      const actual: string = cellKeyOf(5);
      logInfo(`cellKeyOf(item=5): actual=${actual}`);
      expect(actual).assertEqual('5');
      logInfo(`${BUNDLE}CellKeyOf_0008 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0009
     * @tc.name      VerifyCode_CellKeyOf_0009
     * @tc.desc      cellKeyOf(item=15) returns "15"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0009 begin`);
      const actual: string = cellKeyOf(15);
      logInfo(`cellKeyOf(item=15): actual=${actual}`);
      expect(actual).assertEqual('15');
      logInfo(`${BUNDLE}CellKeyOf_0009 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0010
     * @tc.name      VerifyCode_CellKeyOf_0010
     * @tc.desc      cellKeyOf(item=20) returns "20"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0010 begin`);
      const actual: string = cellKeyOf(20);
      logInfo(`cellKeyOf(item=20): actual=${actual}`);
      expect(actual).assertEqual('20');
      logInfo(`${BUNDLE}CellKeyOf_0010 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0011
     * @tc.name      VerifyCode_CellKeyOf_0011
     * @tc.desc      cellKeyOf(item=25) returns "25"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0011 begin`);
      const actual: string = cellKeyOf(25);
      logInfo(`cellKeyOf(item=25): actual=${actual}`);
      expect(actual).assertEqual('25');
      logInfo(`${BUNDLE}CellKeyOf_0011 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0012
     * @tc.name      VerifyCode_CellKeyOf_0012
     * @tc.desc      cellKeyOf(item=30) returns "30"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0012 begin`);
      const actual: string = cellKeyOf(30);
      logInfo(`cellKeyOf(item=30): actual=${actual}`);
      expect(actual).assertEqual('30');
      logInfo(`${BUNDLE}CellKeyOf_0012 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0013
     * @tc.name      VerifyCode_CellKeyOf_0013
     * @tc.desc      cellKeyOf(item=35) returns "35"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0013 begin`);
      const actual: string = cellKeyOf(35);
      logInfo(`cellKeyOf(item=35): actual=${actual}`);
      expect(actual).assertEqual('35');
      logInfo(`${BUNDLE}CellKeyOf_0013 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0014
     * @tc.name      VerifyCode_CellKeyOf_0014
     * @tc.desc      cellKeyOf(item=40) returns "40"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0014 begin`);
      const actual: string = cellKeyOf(40);
      logInfo(`cellKeyOf(item=40): actual=${actual}`);
      expect(actual).assertEqual('40');
      logInfo(`${BUNDLE}CellKeyOf_0014 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0015
     * @tc.name      VerifyCode_CellKeyOf_0015
     * @tc.desc      cellKeyOf(item=45) returns "45"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0015 begin`);
      const actual: string = cellKeyOf(45);
      logInfo(`cellKeyOf(item=45): actual=${actual}`);
      expect(actual).assertEqual('45');
      logInfo(`${BUNDLE}CellKeyOf_0015 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0016
     * @tc.name      VerifyCode_CellKeyOf_0016
     * @tc.desc      cellKeyOf(item=50) returns "50"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0016 begin`);
      const actual: string = cellKeyOf(50);
      logInfo(`cellKeyOf(item=50): actual=${actual}`);
      expect(actual).assertEqual('50');
      logInfo(`${BUNDLE}CellKeyOf_0016 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0017
     * @tc.name      VerifyCode_CellKeyOf_0017
     * @tc.desc      cellKeyOf(item=55) returns "55"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0017 begin`);
      const actual: string = cellKeyOf(55);
      logInfo(`cellKeyOf(item=55): actual=${actual}`);
      expect(actual).assertEqual('55');
      logInfo(`${BUNDLE}CellKeyOf_0017 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0018
     * @tc.name      VerifyCode_CellKeyOf_0018
     * @tc.desc      cellKeyOf(item=60) returns "60"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0018 begin`);
      const actual: string = cellKeyOf(60);
      logInfo(`cellKeyOf(item=60): actual=${actual}`);
      expect(actual).assertEqual('60');
      logInfo(`${BUNDLE}CellKeyOf_0018 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0019
     * @tc.name      VerifyCode_CellKeyOf_0019
     * @tc.desc      cellKeyOf(item=65) returns "65"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0019 begin`);
      const actual: string = cellKeyOf(65);
      logInfo(`cellKeyOf(item=65): actual=${actual}`);
      expect(actual).assertEqual('65');
      logInfo(`${BUNDLE}CellKeyOf_0019 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0020
     * @tc.name      VerifyCode_CellKeyOf_0020
     * @tc.desc      cellKeyOf(item=70) returns "70"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0020 begin`);
      const actual: string = cellKeyOf(70);
      logInfo(`cellKeyOf(item=70): actual=${actual}`);
      expect(actual).assertEqual('70');
      logInfo(`${BUNDLE}CellKeyOf_0020 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0021
     * @tc.name      VerifyCode_CellKeyOf_0021
     * @tc.desc      cellKeyOf(item=75) returns "75"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0021 begin`);
      const actual: string = cellKeyOf(75);
      logInfo(`cellKeyOf(item=75): actual=${actual}`);
      expect(actual).assertEqual('75');
      logInfo(`${BUNDLE}CellKeyOf_0021 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0022
     * @tc.name      VerifyCode_CellKeyOf_0022
     * @tc.desc      cellKeyOf(item=80) returns "80"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0022 begin`);
      const actual: string = cellKeyOf(80);
      logInfo(`cellKeyOf(item=80): actual=${actual}`);
      expect(actual).assertEqual('80');
      logInfo(`${BUNDLE}CellKeyOf_0022 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0023
     * @tc.name      VerifyCode_CellKeyOf_0023
     * @tc.desc      cellKeyOf(item=85) returns "85"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0023 begin`);
      const actual: string = cellKeyOf(85);
      logInfo(`cellKeyOf(item=85): actual=${actual}`);
      expect(actual).assertEqual('85');
      logInfo(`${BUNDLE}CellKeyOf_0023 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0024
     * @tc.name      VerifyCode_CellKeyOf_0024
     * @tc.desc      cellKeyOf(item=90) returns "90"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0024 begin`);
      const actual: string = cellKeyOf(90);
      logInfo(`cellKeyOf(item=90): actual=${actual}`);
      expect(actual).assertEqual('90');
      logInfo(`${BUNDLE}CellKeyOf_0024 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0025
     * @tc.name      VerifyCode_CellKeyOf_0025
     * @tc.desc      cellKeyOf(item=95) returns "95"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0025 begin`);
      const actual: string = cellKeyOf(95);
      logInfo(`cellKeyOf(item=95): actual=${actual}`);
      expect(actual).assertEqual('95');
      logInfo(`${BUNDLE}CellKeyOf_0025 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0026
     * @tc.name      VerifyCode_CellKeyOf_0026
     * @tc.desc      cellKeyOf(item=105) returns "105"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0026 begin`);
      const actual: string = cellKeyOf(105);
      logInfo(`cellKeyOf(item=105): actual=${actual}`);
      expect(actual).assertEqual('105');
      logInfo(`${BUNDLE}CellKeyOf_0026 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0027
     * @tc.name      VerifyCode_CellKeyOf_0027
     * @tc.desc      cellKeyOf(item=110) returns "110"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0027 begin`);
      const actual: string = cellKeyOf(110);
      logInfo(`cellKeyOf(item=110): actual=${actual}`);
      expect(actual).assertEqual('110');
      logInfo(`${BUNDLE}CellKeyOf_0027 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0028
     * @tc.name      VerifyCode_CellKeyOf_0028
     * @tc.desc      cellKeyOf(item=115) returns "115"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0028 begin`);
      const actual: string = cellKeyOf(115);
      logInfo(`cellKeyOf(item=115): actual=${actual}`);
      expect(actual).assertEqual('115');
      logInfo(`${BUNDLE}CellKeyOf_0028 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0029
     * @tc.name      VerifyCode_CellKeyOf_0029
     * @tc.desc      cellKeyOf(item=120) returns "120"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0029 begin`);
      const actual: string = cellKeyOf(120);
      logInfo(`cellKeyOf(item=120): actual=${actual}`);
      expect(actual).assertEqual('120');
      logInfo(`${BUNDLE}CellKeyOf_0029 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0030
     * @tc.name      VerifyCode_CellKeyOf_0030
     * @tc.desc      cellKeyOf(item=125) returns "125"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0030 begin`);
      const actual: string = cellKeyOf(125);
      logInfo(`cellKeyOf(item=125): actual=${actual}`);
      expect(actual).assertEqual('125');
      logInfo(`${BUNDLE}CellKeyOf_0030 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0031
     * @tc.name      VerifyCode_CellKeyOf_0031
     * @tc.desc      cellKeyOf(item=130) returns "130"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0031 begin`);
      const actual: string = cellKeyOf(130);
      logInfo(`cellKeyOf(item=130): actual=${actual}`);
      expect(actual).assertEqual('130');
      logInfo(`${BUNDLE}CellKeyOf_0031 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0032
     * @tc.name      VerifyCode_CellKeyOf_0032
     * @tc.desc      cellKeyOf(item=135) returns "135"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0032 begin`);
      const actual: string = cellKeyOf(135);
      logInfo(`cellKeyOf(item=135): actual=${actual}`);
      expect(actual).assertEqual('135');
      logInfo(`${BUNDLE}CellKeyOf_0032 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0033
     * @tc.name      VerifyCode_CellKeyOf_0033
     * @tc.desc      cellKeyOf(item=140) returns "140"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0033 begin`);
      const actual: string = cellKeyOf(140);
      logInfo(`cellKeyOf(item=140): actual=${actual}`);
      expect(actual).assertEqual('140');
      logInfo(`${BUNDLE}CellKeyOf_0033 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0034
     * @tc.name      VerifyCode_CellKeyOf_0034
     * @tc.desc      cellKeyOf(item=145) returns "145"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0034 begin`);
      const actual: string = cellKeyOf(145);
      logInfo(`cellKeyOf(item=145): actual=${actual}`);
      expect(actual).assertEqual('145');
      logInfo(`${BUNDLE}CellKeyOf_0034 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0035
     * @tc.name      VerifyCode_CellKeyOf_0035
     * @tc.desc      cellKeyOf(item=150) returns "150"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0035 begin`);
      const actual: string = cellKeyOf(150);
      logInfo(`cellKeyOf(item=150): actual=${actual}`);
      expect(actual).assertEqual('150');
      logInfo(`${BUNDLE}CellKeyOf_0035 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0036
     * @tc.name      VerifyCode_CellKeyOf_0036
     * @tc.desc      cellKeyOf(item=155) returns "155"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0036 begin`);
      const actual: string = cellKeyOf(155);
      logInfo(`cellKeyOf(item=155): actual=${actual}`);
      expect(actual).assertEqual('155');
      logInfo(`${BUNDLE}CellKeyOf_0036 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0037
     * @tc.name      VerifyCode_CellKeyOf_0037
     * @tc.desc      cellKeyOf(item=160) returns "160"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0037 begin`);
      const actual: string = cellKeyOf(160);
      logInfo(`cellKeyOf(item=160): actual=${actual}`);
      expect(actual).assertEqual('160');
      logInfo(`${BUNDLE}CellKeyOf_0037 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0038
     * @tc.name      VerifyCode_CellKeyOf_0038
     * @tc.desc      cellKeyOf(item=165) returns "165"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0038 begin`);
      const actual: string = cellKeyOf(165);
      logInfo(`cellKeyOf(item=165): actual=${actual}`);
      expect(actual).assertEqual('165');
      logInfo(`${BUNDLE}CellKeyOf_0038 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0039
     * @tc.name      VerifyCode_CellKeyOf_0039
     * @tc.desc      cellKeyOf(item=170) returns "170"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0039 begin`);
      const actual: string = cellKeyOf(170);
      logInfo(`cellKeyOf(item=170): actual=${actual}`);
      expect(actual).assertEqual('170');
      logInfo(`${BUNDLE}CellKeyOf_0039 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0040
     * @tc.name      VerifyCode_CellKeyOf_0040
     * @tc.desc      cellKeyOf(item=175) returns "175"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0040 begin`);
      const actual: string = cellKeyOf(175);
      logInfo(`cellKeyOf(item=175): actual=${actual}`);
      expect(actual).assertEqual('175');
      logInfo(`${BUNDLE}CellKeyOf_0040 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0041
     * @tc.name      VerifyCode_CellKeyOf_0041
     * @tc.desc      cellKeyOf(item=180) returns "180"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0041 begin`);
      const actual: string = cellKeyOf(180);
      logInfo(`cellKeyOf(item=180): actual=${actual}`);
      expect(actual).assertEqual('180');
      logInfo(`${BUNDLE}CellKeyOf_0041 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0042
     * @tc.name      VerifyCode_CellKeyOf_0042
     * @tc.desc      cellKeyOf(item=185) returns "185"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0042 begin`);
      const actual: string = cellKeyOf(185);
      logInfo(`cellKeyOf(item=185): actual=${actual}`);
      expect(actual).assertEqual('185');
      logInfo(`${BUNDLE}CellKeyOf_0042 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0043
     * @tc.name      VerifyCode_CellKeyOf_0043
     * @tc.desc      cellKeyOf(item=190) returns "190"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0043 begin`);
      const actual: string = cellKeyOf(190);
      logInfo(`cellKeyOf(item=190): actual=${actual}`);
      expect(actual).assertEqual('190');
      logInfo(`${BUNDLE}CellKeyOf_0043 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0044
     * @tc.name      VerifyCode_CellKeyOf_0044
     * @tc.desc      cellKeyOf(item=195) returns "195"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0044 begin`);
      const actual: string = cellKeyOf(195);
      logInfo(`cellKeyOf(item=195): actual=${actual}`);
      expect(actual).assertEqual('195');
      logInfo(`${BUNDLE}CellKeyOf_0044 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0045
     * @tc.name      VerifyCode_CellKeyOf_0045
     * @tc.desc      cellKeyOf(item=200) returns "200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0045 begin`);
      const actual: string = cellKeyOf(200);
      logInfo(`cellKeyOf(item=200): actual=${actual}`);
      expect(actual).assertEqual('200');
      logInfo(`${BUNDLE}CellKeyOf_0045 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0046
     * @tc.name      VerifyCode_CellKeyOf_0046
     * @tc.desc      cellKeyOf(item=12.76) returns "12.76"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0046 begin`);
      const actual: string = cellKeyOf(12.76);
      logInfo(`cellKeyOf(item=12.76): actual=${actual}`);
      expect(actual).assertEqual('12.76');
      logInfo(`${BUNDLE}CellKeyOf_0046 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0047
     * @tc.name      VerifyCode_CellKeyOf_0047
     * @tc.desc      cellKeyOf(item=177) returns "177"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0047 begin`);
      const actual: string = cellKeyOf(177);
      logInfo(`cellKeyOf(item=177): actual=${actual}`);
      expect(actual).assertEqual('177');
      logInfo(`${BUNDLE}CellKeyOf_0047 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0048
     * @tc.name      VerifyCode_CellKeyOf_0048
     * @tc.desc      cellKeyOf(item=147) returns "147"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0048 begin`);
      const actual: string = cellKeyOf(147);
      logInfo(`cellKeyOf(item=147): actual=${actual}`);
      expect(actual).assertEqual('147');
      logInfo(`${BUNDLE}CellKeyOf_0048 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0049
     * @tc.name      VerifyCode_CellKeyOf_0049
     * @tc.desc      cellKeyOf(item=-6) returns "-6"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellKeyOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellKeyOf_0049 begin`);
      const actual: string = cellKeyOf(-6);
      logInfo(`cellKeyOf(item=-6): actual=${actual}`);
      expect(actual).assertEqual('-6');
      logInfo(`${BUNDLE}CellKeyOf_0049 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0050
     * @tc.name      VerifyCode_CellKeyOf_0050
     * @tc.desc      cellKeyOf(item=86) returns "86"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0050 begin`);
      const actual: string = cellKeyOf(86);
      logInfo(`cellKeyOf(item=86): actual=${actual}`);
      expect(actual).assertEqual('86');
      logInfo(`${BUNDLE}CellKeyOf_0050 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0051
     * @tc.name      VerifyCode_CellKeyOf_0051
     * @tc.desc      cellKeyOf(item=92) returns "92"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0051 begin`);
      const actual: string = cellKeyOf(92);
      logInfo(`cellKeyOf(item=92): actual=${actual}`);
      expect(actual).assertEqual('92');
      logInfo(`${BUNDLE}CellKeyOf_0051 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0052
     * @tc.name      VerifyCode_CellKeyOf_0052
     * @tc.desc      cellKeyOf(item=4) returns "4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0052 begin`);
      const actual: string = cellKeyOf(4);
      logInfo(`cellKeyOf(item=4): actual=${actual}`);
      expect(actual).assertEqual('4');
      logInfo(`${BUNDLE}CellKeyOf_0052 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0053
     * @tc.name      VerifyCode_CellKeyOf_0053
     * @tc.desc      cellKeyOf(item=-34) returns "-34"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellKeyOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellKeyOf_0053 begin`);
      const actual: string = cellKeyOf(-34);
      logInfo(`cellKeyOf(item=-34): actual=${actual}`);
      expect(actual).assertEqual('-34');
      logInfo(`${BUNDLE}CellKeyOf_0053 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0054
     * @tc.name      VerifyCode_CellKeyOf_0054
     * @tc.desc      cellKeyOf(item=64) returns "64"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0054 begin`);
      const actual: string = cellKeyOf(64);
      logInfo(`cellKeyOf(item=64): actual=${actual}`);
      expect(actual).assertEqual('64');
      logInfo(`${BUNDLE}CellKeyOf_0054 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0055
     * @tc.name      VerifyCode_CellKeyOf_0055
     * @tc.desc      cellKeyOf(item=38) returns "38"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0055 begin`);
      const actual: string = cellKeyOf(38);
      logInfo(`cellKeyOf(item=38): actual=${actual}`);
      expect(actual).assertEqual('38');
      logInfo(`${BUNDLE}CellKeyOf_0055 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0056
     * @tc.name      VerifyCode_CellKeyOf_0056
     * @tc.desc      cellKeyOf(item=-18) returns "-18"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellKeyOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellKeyOf_0056 begin`);
      const actual: string = cellKeyOf(-18);
      logInfo(`cellKeyOf(item=-18): actual=${actual}`);
      expect(actual).assertEqual('-18');
      logInfo(`${BUNDLE}CellKeyOf_0056 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0057
     * @tc.name      VerifyCode_CellKeyOf_0057
     * @tc.desc      cellKeyOf(item=68.33) returns "68.33"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0057 begin`);
      const actual: string = cellKeyOf(68.33);
      logInfo(`cellKeyOf(item=68.33): actual=${actual}`);
      expect(actual).assertEqual('68.33');
      logInfo(`${BUNDLE}CellKeyOf_0057 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0058
     * @tc.name      VerifyCode_CellKeyOf_0058
     * @tc.desc      cellKeyOf(item=-43) returns "-43"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellKeyOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellKeyOf_0058 begin`);
      const actual: string = cellKeyOf(-43);
      logInfo(`cellKeyOf(item=-43): actual=${actual}`);
      expect(actual).assertEqual('-43');
      logInfo(`${BUNDLE}CellKeyOf_0058 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0059
     * @tc.name      VerifyCode_CellKeyOf_0059
     * @tc.desc      cellKeyOf(item=-27) returns "-27"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellKeyOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellKeyOf_0059 begin`);
      const actual: string = cellKeyOf(-27);
      logInfo(`cellKeyOf(item=-27): actual=${actual}`);
      expect(actual).assertEqual('-27');
      logInfo(`${BUNDLE}CellKeyOf_0059 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0060
     * @tc.name      VerifyCode_CellKeyOf_0060
     * @tc.desc      cellKeyOf(item=15.77) returns "15.77"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0060 begin`);
      const actual: string = cellKeyOf(15.77);
      logInfo(`cellKeyOf(item=15.77): actual=${actual}`);
      expect(actual).assertEqual('15.77');
      logInfo(`${BUNDLE}CellKeyOf_0060 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0061
     * @tc.name      VerifyCode_CellKeyOf_0061
     * @tc.desc      cellKeyOf(item=161) returns "161"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0061 begin`);
      const actual: string = cellKeyOf(161);
      logInfo(`cellKeyOf(item=161): actual=${actual}`);
      expect(actual).assertEqual('161');
      logInfo(`${BUNDLE}CellKeyOf_0061 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0062
     * @tc.name      VerifyCode_CellKeyOf_0062
     * @tc.desc      cellKeyOf(item=-37) returns "-37"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellKeyOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellKeyOf_0062 begin`);
      const actual: string = cellKeyOf(-37);
      logInfo(`cellKeyOf(item=-37): actual=${actual}`);
      expect(actual).assertEqual('-37');
      logInfo(`${BUNDLE}CellKeyOf_0062 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0063
     * @tc.name      VerifyCode_CellKeyOf_0063
     * @tc.desc      cellKeyOf(item=132) returns "132"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0063 begin`);
      const actual: string = cellKeyOf(132);
      logInfo(`cellKeyOf(item=132): actual=${actual}`);
      expect(actual).assertEqual('132');
      logInfo(`${BUNDLE}CellKeyOf_0063 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0064
     * @tc.name      VerifyCode_CellKeyOf_0064
     * @tc.desc      cellKeyOf(item=-9) returns "-9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellKeyOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellKeyOf_0064 begin`);
      const actual: string = cellKeyOf(-9);
      logInfo(`cellKeyOf(item=-9): actual=${actual}`);
      expect(actual).assertEqual('-9');
      logInfo(`${BUNDLE}CellKeyOf_0064 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0065
     * @tc.name      VerifyCode_CellKeyOf_0065
     * @tc.desc      cellKeyOf(item=-35) returns "-35"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellKeyOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellKeyOf_0065 begin`);
      const actual: string = cellKeyOf(-35);
      logInfo(`cellKeyOf(item=-35): actual=${actual}`);
      expect(actual).assertEqual('-35');
      logInfo(`${BUNDLE}CellKeyOf_0065 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0066
     * @tc.name      VerifyCode_CellKeyOf_0066
     * @tc.desc      cellKeyOf(item=106) returns "106"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0066 begin`);
      const actual: string = cellKeyOf(106);
      logInfo(`cellKeyOf(item=106): actual=${actual}`);
      expect(actual).assertEqual('106');
      logInfo(`${BUNDLE}CellKeyOf_0066 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0067
     * @tc.name      VerifyCode_CellKeyOf_0067
     * @tc.desc      cellKeyOf(item=-60) returns "-60"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellKeyOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellKeyOf_0067 begin`);
      const actual: string = cellKeyOf(-60);
      logInfo(`cellKeyOf(item=-60): actual=${actual}`);
      expect(actual).assertEqual('-60');
      logInfo(`${BUNDLE}CellKeyOf_0067 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0068
     * @tc.name      VerifyCode_CellKeyOf_0068
     * @tc.desc      cellKeyOf(item=-56) returns "-56"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellKeyOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellKeyOf_0068 begin`);
      const actual: string = cellKeyOf(-56);
      logInfo(`cellKeyOf(item=-56): actual=${actual}`);
      expect(actual).assertEqual('-56');
      logInfo(`${BUNDLE}CellKeyOf_0068 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0069
     * @tc.name      VerifyCode_CellKeyOf_0069
     * @tc.desc      cellKeyOf(item=62) returns "62"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0069 begin`);
      const actual: string = cellKeyOf(62);
      logInfo(`cellKeyOf(item=62): actual=${actual}`);
      expect(actual).assertEqual('62');
      logInfo(`${BUNDLE}CellKeyOf_0069 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0070
     * @tc.name      VerifyCode_CellKeyOf_0070
     * @tc.desc      cellKeyOf(item=95.67) returns "95.67"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0070 begin`);
      const actual: string = cellKeyOf(95.67);
      logInfo(`cellKeyOf(item=95.67): actual=${actual}`);
      expect(actual).assertEqual('95.67');
      logInfo(`${BUNDLE}CellKeyOf_0070 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0071
     * @tc.name      VerifyCode_CellKeyOf_0071
     * @tc.desc      cellKeyOf(item=-78) returns "-78"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellKeyOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellKeyOf_0071 begin`);
      const actual: string = cellKeyOf(-78);
      logInfo(`cellKeyOf(item=-78): actual=${actual}`);
      expect(actual).assertEqual('-78');
      logInfo(`${BUNDLE}CellKeyOf_0071 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0072
     * @tc.name      VerifyCode_CellKeyOf_0072
     * @tc.desc      cellKeyOf(item=36.09) returns "36.09"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0072 begin`);
      const actual: string = cellKeyOf(36.09);
      logInfo(`cellKeyOf(item=36.09): actual=${actual}`);
      expect(actual).assertEqual('36.09');
      logInfo(`${BUNDLE}CellKeyOf_0072 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0073
     * @tc.name      VerifyCode_CellKeyOf_0073
     * @tc.desc      cellKeyOf(item=80.94) returns "80.94"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0073 begin`);
      const actual: string = cellKeyOf(80.94);
      logInfo(`cellKeyOf(item=80.94): actual=${actual}`);
      expect(actual).assertEqual('80.94');
      logInfo(`${BUNDLE}CellKeyOf_0073 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0074
     * @tc.name      VerifyCode_CellKeyOf_0074
     * @tc.desc      cellKeyOf(item=194) returns "194"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0074 begin`);
      const actual: string = cellKeyOf(194);
      logInfo(`cellKeyOf(item=194): actual=${actual}`);
      expect(actual).assertEqual('194');
      logInfo(`${BUNDLE}CellKeyOf_0074 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0075
     * @tc.name      VerifyCode_CellKeyOf_0075
     * @tc.desc      cellKeyOf(item=97.33) returns "97.33"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0075 begin`);
      const actual: string = cellKeyOf(97.33);
      logInfo(`cellKeyOf(item=97.33): actual=${actual}`);
      expect(actual).assertEqual('97.33');
      logInfo(`${BUNDLE}CellKeyOf_0075 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0076
     * @tc.name      VerifyCode_CellKeyOf_0076
     * @tc.desc      cellKeyOf(item=69) returns "69"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0076 begin`);
      const actual: string = cellKeyOf(69);
      logInfo(`cellKeyOf(item=69): actual=${actual}`);
      expect(actual).assertEqual('69');
      logInfo(`${BUNDLE}CellKeyOf_0076 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0077
     * @tc.name      VerifyCode_CellKeyOf_0077
     * @tc.desc      cellKeyOf(item=59.83) returns "59.83"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0077 begin`);
      const actual: string = cellKeyOf(59.83);
      logInfo(`cellKeyOf(item=59.83): actual=${actual}`);
      expect(actual).assertEqual('59.83');
      logInfo(`${BUNDLE}CellKeyOf_0077 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0078
     * @tc.name      VerifyCode_CellKeyOf_0078
     * @tc.desc      cellKeyOf(item=146) returns "146"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0078 begin`);
      const actual: string = cellKeyOf(146);
      logInfo(`cellKeyOf(item=146): actual=${actual}`);
      expect(actual).assertEqual('146');
      logInfo(`${BUNDLE}CellKeyOf_0078 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0079
     * @tc.name      VerifyCode_CellKeyOf_0079
     * @tc.desc      cellKeyOf(item=184) returns "184"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0079 begin`);
      const actual: string = cellKeyOf(184);
      logInfo(`cellKeyOf(item=184): actual=${actual}`);
      expect(actual).assertEqual('184');
      logInfo(`${BUNDLE}CellKeyOf_0079 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0080
     * @tc.name      VerifyCode_CellKeyOf_0080
     * @tc.desc      cellKeyOf(item=-12) returns "-12"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellKeyOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellKeyOf_0080 begin`);
      const actual: string = cellKeyOf(-12);
      logInfo(`cellKeyOf(item=-12): actual=${actual}`);
      expect(actual).assertEqual('-12');
      logInfo(`${BUNDLE}CellKeyOf_0080 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0081
     * @tc.name      VerifyCode_CellKeyOf_0081
     * @tc.desc      cellKeyOf(item=-53) returns "-53"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellKeyOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellKeyOf_0081 begin`);
      const actual: string = cellKeyOf(-53);
      logInfo(`cellKeyOf(item=-53): actual=${actual}`);
      expect(actual).assertEqual('-53');
      logInfo(`${BUNDLE}CellKeyOf_0081 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0082
     * @tc.name      VerifyCode_CellKeyOf_0082
     * @tc.desc      cellKeyOf(item=-95) returns "-95"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellKeyOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellKeyOf_0082 begin`);
      const actual: string = cellKeyOf(-95);
      logInfo(`cellKeyOf(item=-95): actual=${actual}`);
      expect(actual).assertEqual('-95');
      logInfo(`${BUNDLE}CellKeyOf_0082 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0083
     * @tc.name      VerifyCode_CellKeyOf_0083
     * @tc.desc      cellKeyOf(item=19) returns "19"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0083 begin`);
      const actual: string = cellKeyOf(19);
      logInfo(`cellKeyOf(item=19): actual=${actual}`);
      expect(actual).assertEqual('19');
      logInfo(`${BUNDLE}CellKeyOf_0083 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0084
     * @tc.name      VerifyCode_CellKeyOf_0084
     * @tc.desc      cellKeyOf(item=-49) returns "-49"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellKeyOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellKeyOf_0084 begin`);
      const actual: string = cellKeyOf(-49);
      logInfo(`cellKeyOf(item=-49): actual=${actual}`);
      expect(actual).assertEqual('-49');
      logInfo(`${BUNDLE}CellKeyOf_0084 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0085
     * @tc.name      VerifyCode_CellKeyOf_0085
     * @tc.desc      cellKeyOf(item=144) returns "144"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0085 begin`);
      const actual: string = cellKeyOf(144);
      logInfo(`cellKeyOf(item=144): actual=${actual}`);
      expect(actual).assertEqual('144');
      logInfo(`${BUNDLE}CellKeyOf_0085 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0086
     * @tc.name      VerifyCode_CellKeyOf_0086
     * @tc.desc      cellKeyOf(item=38.77) returns "38.77"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0086 begin`);
      const actual: string = cellKeyOf(38.77);
      logInfo(`cellKeyOf(item=38.77): actual=${actual}`);
      expect(actual).assertEqual('38.77');
      logInfo(`${BUNDLE}CellKeyOf_0086 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0087
     * @tc.name      VerifyCode_CellKeyOf_0087
     * @tc.desc      cellKeyOf(item=12.99) returns "12.99"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0087 begin`);
      const actual: string = cellKeyOf(12.99);
      logInfo(`cellKeyOf(item=12.99): actual=${actual}`);
      expect(actual).assertEqual('12.99');
      logInfo(`${BUNDLE}CellKeyOf_0087 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0088
     * @tc.name      VerifyCode_CellKeyOf_0088
     * @tc.desc      cellKeyOf(item=57) returns "57"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0088 begin`);
      const actual: string = cellKeyOf(57);
      logInfo(`cellKeyOf(item=57): actual=${actual}`);
      expect(actual).assertEqual('57');
      logInfo(`${BUNDLE}CellKeyOf_0088 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0089
     * @tc.name      VerifyCode_CellKeyOf_0089
     * @tc.desc      cellKeyOf(item=6.69) returns "6.69"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0089 begin`);
      const actual: string = cellKeyOf(6.69);
      logInfo(`cellKeyOf(item=6.69): actual=${actual}`);
      expect(actual).assertEqual('6.69');
      logInfo(`${BUNDLE}CellKeyOf_0089 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0090
     * @tc.name      VerifyCode_CellKeyOf_0090
     * @tc.desc      cellKeyOf(item=-30) returns "-30"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellKeyOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellKeyOf_0090 begin`);
      const actual: string = cellKeyOf(-30);
      logInfo(`cellKeyOf(item=-30): actual=${actual}`);
      expect(actual).assertEqual('-30');
      logInfo(`${BUNDLE}CellKeyOf_0090 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0091
     * @tc.name      VerifyCode_CellKeyOf_0091
     * @tc.desc      cellKeyOf(item=27) returns "27"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0091 begin`);
      const actual: string = cellKeyOf(27);
      logInfo(`cellKeyOf(item=27): actual=${actual}`);
      expect(actual).assertEqual('27');
      logInfo(`${BUNDLE}CellKeyOf_0091 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0092
     * @tc.name      VerifyCode_CellKeyOf_0092
     * @tc.desc      cellKeyOf(item=-68) returns "-68"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellKeyOf_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellKeyOf_0092 begin`);
      const actual: string = cellKeyOf(-68);
      logInfo(`cellKeyOf(item=-68): actual=${actual}`);
      expect(actual).assertEqual('-68');
      logInfo(`${BUNDLE}CellKeyOf_0092 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0093
     * @tc.name      VerifyCode_CellKeyOf_0093
     * @tc.desc      cellKeyOf(item=-71) returns "-71"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellKeyOf_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellKeyOf_0093 begin`);
      const actual: string = cellKeyOf(-71);
      logInfo(`cellKeyOf(item=-71): actual=${actual}`);
      expect(actual).assertEqual('-71');
      logInfo(`${BUNDLE}CellKeyOf_0093 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0094
     * @tc.name      VerifyCode_CellKeyOf_0094
     * @tc.desc      cellKeyOf(item=-77) returns "-77"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellKeyOf_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellKeyOf_0094 begin`);
      const actual: string = cellKeyOf(-77);
      logInfo(`cellKeyOf(item=-77): actual=${actual}`);
      expect(actual).assertEqual('-77');
      logInfo(`${BUNDLE}CellKeyOf_0094 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0095
     * @tc.name      VerifyCode_CellKeyOf_0095
     * @tc.desc      cellKeyOf(item=51) returns "51"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0095 begin`);
      const actual: string = cellKeyOf(51);
      logInfo(`cellKeyOf(item=51): actual=${actual}`);
      expect(actual).assertEqual('51');
      logInfo(`${BUNDLE}CellKeyOf_0095 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0096
     * @tc.name      VerifyCode_CellKeyOf_0096
     * @tc.desc      cellKeyOf(item=-4) returns "-4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellKeyOf_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellKeyOf_0096 begin`);
      const actual: string = cellKeyOf(-4);
      logInfo(`cellKeyOf(item=-4): actual=${actual}`);
      expect(actual).assertEqual('-4');
      logInfo(`${BUNDLE}CellKeyOf_0096 end`);
    });
  });
}
