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
import { padZero } from './model/FormExtLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_FormExtAbility]';
const BUNDLE: string = 'FormExtAbility_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for padZero (96 cases). */
export default function padZeroTest(): void {
  describe('PadZeroTest', (): void => {
    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0001
     * @tc.name      FormExtAbility_PadZero_0001
     * @tc.desc      padZero(num=0) returns "00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('FormExtAbility_PadZero_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}PadZero_0001 begin`);
      const actual: string = padZero(0);
      logInfo(`padZero(num=0): actual=${actual}`);
      expect(actual).assertEqual('00');
      logInfo(`${BUNDLE}PadZero_0001 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0002
     * @tc.name      FormExtAbility_PadZero_0002
     * @tc.desc      padZero(num=1) returns "01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('FormExtAbility_PadZero_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}PadZero_0002 begin`);
      const actual: string = padZero(1);
      logInfo(`padZero(num=1): actual=${actual}`);
      expect(actual).assertEqual('01');
      logInfo(`${BUNDLE}PadZero_0002 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0003
     * @tc.name      FormExtAbility_PadZero_0003
     * @tc.desc      padZero(num=10) returns "10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FormExtAbility_PadZero_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}PadZero_0003 begin`);
      const actual: string = padZero(10);
      logInfo(`padZero(num=10): actual=${actual}`);
      expect(actual).assertEqual('10');
      logInfo(`${BUNDLE}PadZero_0003 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0004
     * @tc.name      FormExtAbility_PadZero_0004
     * @tc.desc      padZero(num=9) returns "09"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FormExtAbility_PadZero_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}PadZero_0004 begin`);
      const actual: string = padZero(9);
      logInfo(`padZero(num=9): actual=${actual}`);
      expect(actual).assertEqual('09');
      logInfo(`${BUNDLE}PadZero_0004 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0005
     * @tc.name      FormExtAbility_PadZero_0005
     * @tc.desc      padZero(num=11) returns "11"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FormExtAbility_PadZero_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}PadZero_0005 begin`);
      const actual: string = padZero(11);
      logInfo(`padZero(num=11): actual=${actual}`);
      expect(actual).assertEqual('11');
      logInfo(`${BUNDLE}PadZero_0005 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0006
     * @tc.name      FormExtAbility_PadZero_0006
     * @tc.desc      padZero(num=20) returns "20"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PadZero_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PadZero_0006 begin`);
      const actual: string = padZero(20);
      logInfo(`padZero(num=20): actual=${actual}`);
      expect(actual).assertEqual('20');
      logInfo(`${BUNDLE}PadZero_0006 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0007
     * @tc.name      FormExtAbility_PadZero_0007
     * @tc.desc      padZero(num=5) returns "05"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PadZero_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PadZero_0007 begin`);
      const actual: string = padZero(5);
      logInfo(`padZero(num=5): actual=${actual}`);
      expect(actual).assertEqual('05');
      logInfo(`${BUNDLE}PadZero_0007 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0008
     * @tc.name      FormExtAbility_PadZero_0008
     * @tc.desc      padZero(num=2) returns "02"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PadZero_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PadZero_0008 begin`);
      const actual: string = padZero(2);
      logInfo(`padZero(num=2): actual=${actual}`);
      expect(actual).assertEqual('02');
      logInfo(`${BUNDLE}PadZero_0008 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0009
     * @tc.name      FormExtAbility_PadZero_0009
     * @tc.desc      padZero(num=100) returns "100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PadZero_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PadZero_0009 begin`);
      const actual: string = padZero(100);
      logInfo(`padZero(num=100): actual=${actual}`);
      expect(actual).assertEqual('100');
      logInfo(`${BUNDLE}PadZero_0009 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0010
     * @tc.name      FormExtAbility_PadZero_0010
     * @tc.desc      padZero(num=-1) returns "0-1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_PadZero_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PadZero_0010 begin`);
      const actual: string = padZero(-1);
      logInfo(`padZero(num=-1): actual=${actual}`);
      expect(actual).assertEqual('0-1');
      logInfo(`${BUNDLE}PadZero_0010 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0011
     * @tc.name      FormExtAbility_PadZero_0011
     * @tc.desc      padZero(num=3) returns "03"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PadZero_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PadZero_0011 begin`);
      const actual: string = padZero(3);
      logInfo(`padZero(num=3): actual=${actual}`);
      expect(actual).assertEqual('03');
      logInfo(`${BUNDLE}PadZero_0011 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0012
     * @tc.name      FormExtAbility_PadZero_0012
     * @tc.desc      padZero(num=15) returns "15"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PadZero_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PadZero_0012 begin`);
      const actual: string = padZero(15);
      logInfo(`padZero(num=15): actual=${actual}`);
      expect(actual).assertEqual('15');
      logInfo(`${BUNDLE}PadZero_0012 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0013
     * @tc.name      FormExtAbility_PadZero_0013
     * @tc.desc      padZero(num=25) returns "25"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PadZero_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PadZero_0013 begin`);
      const actual: string = padZero(25);
      logInfo(`padZero(num=25): actual=${actual}`);
      expect(actual).assertEqual('25');
      logInfo(`${BUNDLE}PadZero_0013 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0014
     * @tc.name      FormExtAbility_PadZero_0014
     * @tc.desc      padZero(num=30) returns "30"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PadZero_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PadZero_0014 begin`);
      const actual: string = padZero(30);
      logInfo(`padZero(num=30): actual=${actual}`);
      expect(actual).assertEqual('30');
      logInfo(`${BUNDLE}PadZero_0014 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0015
     * @tc.name      FormExtAbility_PadZero_0015
     * @tc.desc      padZero(num=35) returns "35"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PadZero_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PadZero_0015 begin`);
      const actual: string = padZero(35);
      logInfo(`padZero(num=35): actual=${actual}`);
      expect(actual).assertEqual('35');
      logInfo(`${BUNDLE}PadZero_0015 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0016
     * @tc.name      FormExtAbility_PadZero_0016
     * @tc.desc      padZero(num=40) returns "40"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PadZero_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PadZero_0016 begin`);
      const actual: string = padZero(40);
      logInfo(`padZero(num=40): actual=${actual}`);
      expect(actual).assertEqual('40');
      logInfo(`${BUNDLE}PadZero_0016 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0017
     * @tc.name      FormExtAbility_PadZero_0017
     * @tc.desc      padZero(num=45) returns "45"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PadZero_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PadZero_0017 begin`);
      const actual: string = padZero(45);
      logInfo(`padZero(num=45): actual=${actual}`);
      expect(actual).assertEqual('45');
      logInfo(`${BUNDLE}PadZero_0017 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0018
     * @tc.name      FormExtAbility_PadZero_0018
     * @tc.desc      padZero(num=50) returns "50"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PadZero_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PadZero_0018 begin`);
      const actual: string = padZero(50);
      logInfo(`padZero(num=50): actual=${actual}`);
      expect(actual).assertEqual('50');
      logInfo(`${BUNDLE}PadZero_0018 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0019
     * @tc.name      FormExtAbility_PadZero_0019
     * @tc.desc      padZero(num=55) returns "55"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PadZero_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PadZero_0019 begin`);
      const actual: string = padZero(55);
      logInfo(`padZero(num=55): actual=${actual}`);
      expect(actual).assertEqual('55');
      logInfo(`${BUNDLE}PadZero_0019 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0020
     * @tc.name      FormExtAbility_PadZero_0020
     * @tc.desc      padZero(num=60) returns "60"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PadZero_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PadZero_0020 begin`);
      const actual: string = padZero(60);
      logInfo(`padZero(num=60): actual=${actual}`);
      expect(actual).assertEqual('60');
      logInfo(`${BUNDLE}PadZero_0020 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0021
     * @tc.name      FormExtAbility_PadZero_0021
     * @tc.desc      padZero(num=65) returns "65"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PadZero_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PadZero_0021 begin`);
      const actual: string = padZero(65);
      logInfo(`padZero(num=65): actual=${actual}`);
      expect(actual).assertEqual('65');
      logInfo(`${BUNDLE}PadZero_0021 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0022
     * @tc.name      FormExtAbility_PadZero_0022
     * @tc.desc      padZero(num=70) returns "70"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PadZero_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PadZero_0022 begin`);
      const actual: string = padZero(70);
      logInfo(`padZero(num=70): actual=${actual}`);
      expect(actual).assertEqual('70');
      logInfo(`${BUNDLE}PadZero_0022 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0023
     * @tc.name      FormExtAbility_PadZero_0023
     * @tc.desc      padZero(num=75) returns "75"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PadZero_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PadZero_0023 begin`);
      const actual: string = padZero(75);
      logInfo(`padZero(num=75): actual=${actual}`);
      expect(actual).assertEqual('75');
      logInfo(`${BUNDLE}PadZero_0023 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0024
     * @tc.name      FormExtAbility_PadZero_0024
     * @tc.desc      padZero(num=80) returns "80"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PadZero_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PadZero_0024 begin`);
      const actual: string = padZero(80);
      logInfo(`padZero(num=80): actual=${actual}`);
      expect(actual).assertEqual('80');
      logInfo(`${BUNDLE}PadZero_0024 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0025
     * @tc.name      FormExtAbility_PadZero_0025
     * @tc.desc      padZero(num=85) returns "85"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PadZero_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PadZero_0025 begin`);
      const actual: string = padZero(85);
      logInfo(`padZero(num=85): actual=${actual}`);
      expect(actual).assertEqual('85');
      logInfo(`${BUNDLE}PadZero_0025 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0026
     * @tc.name      FormExtAbility_PadZero_0026
     * @tc.desc      padZero(num=90) returns "90"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PadZero_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PadZero_0026 begin`);
      const actual: string = padZero(90);
      logInfo(`padZero(num=90): actual=${actual}`);
      expect(actual).assertEqual('90');
      logInfo(`${BUNDLE}PadZero_0026 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0027
     * @tc.name      FormExtAbility_PadZero_0027
     * @tc.desc      padZero(num=95) returns "95"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PadZero_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PadZero_0027 begin`);
      const actual: string = padZero(95);
      logInfo(`padZero(num=95): actual=${actual}`);
      expect(actual).assertEqual('95');
      logInfo(`${BUNDLE}PadZero_0027 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0028
     * @tc.name      FormExtAbility_PadZero_0028
     * @tc.desc      padZero(num=105) returns "105"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PadZero_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PadZero_0028 begin`);
      const actual: string = padZero(105);
      logInfo(`padZero(num=105): actual=${actual}`);
      expect(actual).assertEqual('105');
      logInfo(`${BUNDLE}PadZero_0028 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0029
     * @tc.name      FormExtAbility_PadZero_0029
     * @tc.desc      padZero(num=110) returns "110"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PadZero_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PadZero_0029 begin`);
      const actual: string = padZero(110);
      logInfo(`padZero(num=110): actual=${actual}`);
      expect(actual).assertEqual('110');
      logInfo(`${BUNDLE}PadZero_0029 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0030
     * @tc.name      FormExtAbility_PadZero_0030
     * @tc.desc      padZero(num=115) returns "115"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PadZero_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PadZero_0030 begin`);
      const actual: string = padZero(115);
      logInfo(`padZero(num=115): actual=${actual}`);
      expect(actual).assertEqual('115');
      logInfo(`${BUNDLE}PadZero_0030 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0031
     * @tc.name      FormExtAbility_PadZero_0031
     * @tc.desc      padZero(num=120) returns "120"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PadZero_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PadZero_0031 begin`);
      const actual: string = padZero(120);
      logInfo(`padZero(num=120): actual=${actual}`);
      expect(actual).assertEqual('120');
      logInfo(`${BUNDLE}PadZero_0031 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0032
     * @tc.name      FormExtAbility_PadZero_0032
     * @tc.desc      padZero(num=125) returns "125"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PadZero_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PadZero_0032 begin`);
      const actual: string = padZero(125);
      logInfo(`padZero(num=125): actual=${actual}`);
      expect(actual).assertEqual('125');
      logInfo(`${BUNDLE}PadZero_0032 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0033
     * @tc.name      FormExtAbility_PadZero_0033
     * @tc.desc      padZero(num=130) returns "130"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PadZero_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PadZero_0033 begin`);
      const actual: string = padZero(130);
      logInfo(`padZero(num=130): actual=${actual}`);
      expect(actual).assertEqual('130');
      logInfo(`${BUNDLE}PadZero_0033 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0034
     * @tc.name      FormExtAbility_PadZero_0034
     * @tc.desc      padZero(num=135) returns "135"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PadZero_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PadZero_0034 begin`);
      const actual: string = padZero(135);
      logInfo(`padZero(num=135): actual=${actual}`);
      expect(actual).assertEqual('135');
      logInfo(`${BUNDLE}PadZero_0034 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0035
     * @tc.name      FormExtAbility_PadZero_0035
     * @tc.desc      padZero(num=140) returns "140"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PadZero_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PadZero_0035 begin`);
      const actual: string = padZero(140);
      logInfo(`padZero(num=140): actual=${actual}`);
      expect(actual).assertEqual('140');
      logInfo(`${BUNDLE}PadZero_0035 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0036
     * @tc.name      FormExtAbility_PadZero_0036
     * @tc.desc      padZero(num=145) returns "145"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PadZero_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PadZero_0036 begin`);
      const actual: string = padZero(145);
      logInfo(`padZero(num=145): actual=${actual}`);
      expect(actual).assertEqual('145');
      logInfo(`${BUNDLE}PadZero_0036 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0037
     * @tc.name      FormExtAbility_PadZero_0037
     * @tc.desc      padZero(num=150) returns "150"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PadZero_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PadZero_0037 begin`);
      const actual: string = padZero(150);
      logInfo(`padZero(num=150): actual=${actual}`);
      expect(actual).assertEqual('150');
      logInfo(`${BUNDLE}PadZero_0037 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0038
     * @tc.name      FormExtAbility_PadZero_0038
     * @tc.desc      padZero(num=155) returns "155"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PadZero_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PadZero_0038 begin`);
      const actual: string = padZero(155);
      logInfo(`padZero(num=155): actual=${actual}`);
      expect(actual).assertEqual('155');
      logInfo(`${BUNDLE}PadZero_0038 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0039
     * @tc.name      FormExtAbility_PadZero_0039
     * @tc.desc      padZero(num=160) returns "160"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PadZero_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PadZero_0039 begin`);
      const actual: string = padZero(160);
      logInfo(`padZero(num=160): actual=${actual}`);
      expect(actual).assertEqual('160');
      logInfo(`${BUNDLE}PadZero_0039 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0040
     * @tc.name      FormExtAbility_PadZero_0040
     * @tc.desc      padZero(num=165) returns "165"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PadZero_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PadZero_0040 begin`);
      const actual: string = padZero(165);
      logInfo(`padZero(num=165): actual=${actual}`);
      expect(actual).assertEqual('165');
      logInfo(`${BUNDLE}PadZero_0040 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0041
     * @tc.name      FormExtAbility_PadZero_0041
     * @tc.desc      padZero(num=170) returns "170"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PadZero_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PadZero_0041 begin`);
      const actual: string = padZero(170);
      logInfo(`padZero(num=170): actual=${actual}`);
      expect(actual).assertEqual('170');
      logInfo(`${BUNDLE}PadZero_0041 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0042
     * @tc.name      FormExtAbility_PadZero_0042
     * @tc.desc      padZero(num=175) returns "175"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PadZero_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PadZero_0042 begin`);
      const actual: string = padZero(175);
      logInfo(`padZero(num=175): actual=${actual}`);
      expect(actual).assertEqual('175');
      logInfo(`${BUNDLE}PadZero_0042 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0043
     * @tc.name      FormExtAbility_PadZero_0043
     * @tc.desc      padZero(num=180) returns "180"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PadZero_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PadZero_0043 begin`);
      const actual: string = padZero(180);
      logInfo(`padZero(num=180): actual=${actual}`);
      expect(actual).assertEqual('180');
      logInfo(`${BUNDLE}PadZero_0043 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0044
     * @tc.name      FormExtAbility_PadZero_0044
     * @tc.desc      padZero(num=185) returns "185"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PadZero_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PadZero_0044 begin`);
      const actual: string = padZero(185);
      logInfo(`padZero(num=185): actual=${actual}`);
      expect(actual).assertEqual('185');
      logInfo(`${BUNDLE}PadZero_0044 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0045
     * @tc.name      FormExtAbility_PadZero_0045
     * @tc.desc      padZero(num=190) returns "190"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PadZero_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PadZero_0045 begin`);
      const actual: string = padZero(190);
      logInfo(`padZero(num=190): actual=${actual}`);
      expect(actual).assertEqual('190');
      logInfo(`${BUNDLE}PadZero_0045 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0046
     * @tc.name      FormExtAbility_PadZero_0046
     * @tc.desc      padZero(num=195) returns "195"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PadZero_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PadZero_0046 begin`);
      const actual: string = padZero(195);
      logInfo(`padZero(num=195): actual=${actual}`);
      expect(actual).assertEqual('195');
      logInfo(`${BUNDLE}PadZero_0046 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0047
     * @tc.name      FormExtAbility_PadZero_0047
     * @tc.desc      padZero(num=200) returns "200"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PadZero_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PadZero_0047 begin`);
      const actual: string = padZero(200);
      logInfo(`padZero(num=200): actual=${actual}`);
      expect(actual).assertEqual('200');
      logInfo(`${BUNDLE}PadZero_0047 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0048
     * @tc.name      FormExtAbility_PadZero_0048
     * @tc.desc      padZero(num=-5) returns "0-5"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_PadZero_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PadZero_0048 begin`);
      const actual: string = padZero(-5);
      logInfo(`padZero(num=-5): actual=${actual}`);
      expect(actual).assertEqual('0-5');
      logInfo(`${BUNDLE}PadZero_0048 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0049
     * @tc.name      FormExtAbility_PadZero_0049
     * @tc.desc      padZero(num=57) returns "57"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PadZero_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PadZero_0049 begin`);
      const actual: string = padZero(57);
      logInfo(`padZero(num=57): actual=${actual}`);
      expect(actual).assertEqual('57');
      logInfo(`${BUNDLE}PadZero_0049 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0050
     * @tc.name      FormExtAbility_PadZero_0050
     * @tc.desc      padZero(num=-86) returns "0-86"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_PadZero_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PadZero_0050 begin`);
      const actual: string = padZero(-86);
      logInfo(`padZero(num=-86): actual=${actual}`);
      expect(actual).assertEqual('0-86');
      logInfo(`${BUNDLE}PadZero_0050 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0051
     * @tc.name      FormExtAbility_PadZero_0051
     * @tc.desc      padZero(num=34.67) returns "34.67"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PadZero_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PadZero_0051 begin`);
      const actual: string = padZero(34.67);
      logInfo(`padZero(num=34.67): actual=${actual}`);
      expect(actual).assertEqual('34.67');
      logInfo(`${BUNDLE}PadZero_0051 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0052
     * @tc.name      FormExtAbility_PadZero_0052
     * @tc.desc      padZero(num=61.47) returns "61.47"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PadZero_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PadZero_0052 begin`);
      const actual: string = padZero(61.47);
      logInfo(`padZero(num=61.47): actual=${actual}`);
      expect(actual).assertEqual('61.47');
      logInfo(`${BUNDLE}PadZero_0052 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0053
     * @tc.name      FormExtAbility_PadZero_0053
     * @tc.desc      padZero(num=31) returns "31"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PadZero_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PadZero_0053 begin`);
      const actual: string = padZero(31);
      logInfo(`padZero(num=31): actual=${actual}`);
      expect(actual).assertEqual('31');
      logInfo(`${BUNDLE}PadZero_0053 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0054
     * @tc.name      FormExtAbility_PadZero_0054
     * @tc.desc      padZero(num=-69) returns "0-69"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_PadZero_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PadZero_0054 begin`);
      const actual: string = padZero(-69);
      logInfo(`padZero(num=-69): actual=${actual}`);
      expect(actual).assertEqual('0-69');
      logInfo(`${BUNDLE}PadZero_0054 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0055
     * @tc.name      FormExtAbility_PadZero_0055
     * @tc.desc      padZero(num=-14) returns "0-14"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_PadZero_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PadZero_0055 begin`);
      const actual: string = padZero(-14);
      logInfo(`padZero(num=-14): actual=${actual}`);
      expect(actual).assertEqual('0-14');
      logInfo(`${BUNDLE}PadZero_0055 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0056
     * @tc.name      FormExtAbility_PadZero_0056
     * @tc.desc      padZero(num=49.35) returns "49.35"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PadZero_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PadZero_0056 begin`);
      const actual: string = padZero(49.35);
      logInfo(`padZero(num=49.35): actual=${actual}`);
      expect(actual).assertEqual('49.35');
      logInfo(`${BUNDLE}PadZero_0056 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0057
     * @tc.name      FormExtAbility_PadZero_0057
     * @tc.desc      padZero(num=197) returns "197"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PadZero_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PadZero_0057 begin`);
      const actual: string = padZero(197);
      logInfo(`padZero(num=197): actual=${actual}`);
      expect(actual).assertEqual('197');
      logInfo(`${BUNDLE}PadZero_0057 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0058
     * @tc.name      FormExtAbility_PadZero_0058
     * @tc.desc      padZero(num=144) returns "144"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PadZero_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PadZero_0058 begin`);
      const actual: string = padZero(144);
      logInfo(`padZero(num=144): actual=${actual}`);
      expect(actual).assertEqual('144');
      logInfo(`${BUNDLE}PadZero_0058 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0059
     * @tc.name      FormExtAbility_PadZero_0059
     * @tc.desc      padZero(num=-42) returns "0-42"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_PadZero_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PadZero_0059 begin`);
      const actual: string = padZero(-42);
      logInfo(`padZero(num=-42): actual=${actual}`);
      expect(actual).assertEqual('0-42');
      logInfo(`${BUNDLE}PadZero_0059 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0060
     * @tc.name      FormExtAbility_PadZero_0060
     * @tc.desc      padZero(num=162) returns "162"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PadZero_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PadZero_0060 begin`);
      const actual: string = padZero(162);
      logInfo(`padZero(num=162): actual=${actual}`);
      expect(actual).assertEqual('162');
      logInfo(`${BUNDLE}PadZero_0060 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0061
     * @tc.name      FormExtAbility_PadZero_0061
     * @tc.desc      padZero(num=81.33) returns "81.33"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PadZero_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PadZero_0061 begin`);
      const actual: string = padZero(81.33);
      logInfo(`padZero(num=81.33): actual=${actual}`);
      expect(actual).assertEqual('81.33');
      logInfo(`${BUNDLE}PadZero_0061 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0062
     * @tc.name      FormExtAbility_PadZero_0062
     * @tc.desc      padZero(num=-74) returns "0-74"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_PadZero_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PadZero_0062 begin`);
      const actual: string = padZero(-74);
      logInfo(`padZero(num=-74): actual=${actual}`);
      expect(actual).assertEqual('0-74');
      logInfo(`${BUNDLE}PadZero_0062 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0063
     * @tc.name      FormExtAbility_PadZero_0063
     * @tc.desc      padZero(num=49) returns "49"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PadZero_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PadZero_0063 begin`);
      const actual: string = padZero(49);
      logInfo(`padZero(num=49): actual=${actual}`);
      expect(actual).assertEqual('49');
      logInfo(`${BUNDLE}PadZero_0063 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0064
     * @tc.name      FormExtAbility_PadZero_0064
     * @tc.desc      padZero(num=4) returns "04"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PadZero_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PadZero_0064 begin`);
      const actual: string = padZero(4);
      logInfo(`padZero(num=4): actual=${actual}`);
      expect(actual).assertEqual('04');
      logInfo(`${BUNDLE}PadZero_0064 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0065
     * @tc.name      FormExtAbility_PadZero_0065
     * @tc.desc      padZero(num=-24) returns "0-24"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_PadZero_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PadZero_0065 begin`);
      const actual: string = padZero(-24);
      logInfo(`padZero(num=-24): actual=${actual}`);
      expect(actual).assertEqual('0-24');
      logInfo(`${BUNDLE}PadZero_0065 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0066
     * @tc.name      FormExtAbility_PadZero_0066
     * @tc.desc      padZero(num=148) returns "148"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PadZero_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PadZero_0066 begin`);
      const actual: string = padZero(148);
      logInfo(`padZero(num=148): actual=${actual}`);
      expect(actual).assertEqual('148');
      logInfo(`${BUNDLE}PadZero_0066 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0067
     * @tc.name      FormExtAbility_PadZero_0067
     * @tc.desc      padZero(num=51.28) returns "51.28"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PadZero_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PadZero_0067 begin`);
      const actual: string = padZero(51.28);
      logInfo(`padZero(num=51.28): actual=${actual}`);
      expect(actual).assertEqual('51.28');
      logInfo(`${BUNDLE}PadZero_0067 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0068
     * @tc.name      FormExtAbility_PadZero_0068
     * @tc.desc      padZero(num=73) returns "73"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PadZero_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PadZero_0068 begin`);
      const actual: string = padZero(73);
      logInfo(`padZero(num=73): actual=${actual}`);
      expect(actual).assertEqual('73');
      logInfo(`${BUNDLE}PadZero_0068 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0069
     * @tc.name      FormExtAbility_PadZero_0069
     * @tc.desc      padZero(num=-96) returns "0-96"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_PadZero_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PadZero_0069 begin`);
      const actual: string = padZero(-96);
      logInfo(`padZero(num=-96): actual=${actual}`);
      expect(actual).assertEqual('0-96');
      logInfo(`${BUNDLE}PadZero_0069 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0070
     * @tc.name      FormExtAbility_PadZero_0070
     * @tc.desc      padZero(num=69) returns "69"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PadZero_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PadZero_0070 begin`);
      const actual: string = padZero(69);
      logInfo(`padZero(num=69): actual=${actual}`);
      expect(actual).assertEqual('69');
      logInfo(`${BUNDLE}PadZero_0070 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0071
     * @tc.name      FormExtAbility_PadZero_0071
     * @tc.desc      padZero(num=-67) returns "0-67"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_PadZero_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PadZero_0071 begin`);
      const actual: string = padZero(-67);
      logInfo(`padZero(num=-67): actual=${actual}`);
      expect(actual).assertEqual('0-67');
      logInfo(`${BUNDLE}PadZero_0071 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0072
     * @tc.name      FormExtAbility_PadZero_0072
     * @tc.desc      padZero(num=119) returns "119"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PadZero_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PadZero_0072 begin`);
      const actual: string = padZero(119);
      logInfo(`padZero(num=119): actual=${actual}`);
      expect(actual).assertEqual('119');
      logInfo(`${BUNDLE}PadZero_0072 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0073
     * @tc.name      FormExtAbility_PadZero_0073
     * @tc.desc      padZero(num=19.98) returns "19.98"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PadZero_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PadZero_0073 begin`);
      const actual: string = padZero(19.98);
      logInfo(`padZero(num=19.98): actual=${actual}`);
      expect(actual).assertEqual('19.98');
      logInfo(`${BUNDLE}PadZero_0073 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0074
     * @tc.name      FormExtAbility_PadZero_0074
     * @tc.desc      padZero(num=-32) returns "0-32"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_PadZero_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PadZero_0074 begin`);
      const actual: string = padZero(-32);
      logInfo(`padZero(num=-32): actual=${actual}`);
      expect(actual).assertEqual('0-32');
      logInfo(`${BUNDLE}PadZero_0074 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0075
     * @tc.name      FormExtAbility_PadZero_0075
     * @tc.desc      padZero(num=-52) returns "0-52"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_PadZero_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PadZero_0075 begin`);
      const actual: string = padZero(-52);
      logInfo(`padZero(num=-52): actual=${actual}`);
      expect(actual).assertEqual('0-52');
      logInfo(`${BUNDLE}PadZero_0075 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0076
     * @tc.name      FormExtAbility_PadZero_0076
     * @tc.desc      padZero(num=51.56) returns "51.56"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PadZero_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PadZero_0076 begin`);
      const actual: string = padZero(51.56);
      logInfo(`padZero(num=51.56): actual=${actual}`);
      expect(actual).assertEqual('51.56');
      logInfo(`${BUNDLE}PadZero_0076 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0077
     * @tc.name      FormExtAbility_PadZero_0077
     * @tc.desc      padZero(num=-9) returns "0-9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_PadZero_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PadZero_0077 begin`);
      const actual: string = padZero(-9);
      logInfo(`padZero(num=-9): actual=${actual}`);
      expect(actual).assertEqual('0-9');
      logInfo(`${BUNDLE}PadZero_0077 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0078
     * @tc.name      FormExtAbility_PadZero_0078
     * @tc.desc      padZero(num=78) returns "78"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PadZero_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PadZero_0078 begin`);
      const actual: string = padZero(78);
      logInfo(`padZero(num=78): actual=${actual}`);
      expect(actual).assertEqual('78');
      logInfo(`${BUNDLE}PadZero_0078 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0079
     * @tc.name      FormExtAbility_PadZero_0079
     * @tc.desc      padZero(num=43.37) returns "43.37"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PadZero_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PadZero_0079 begin`);
      const actual: string = padZero(43.37);
      logInfo(`padZero(num=43.37): actual=${actual}`);
      expect(actual).assertEqual('43.37');
      logInfo(`${BUNDLE}PadZero_0079 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0080
     * @tc.name      FormExtAbility_PadZero_0080
     * @tc.desc      padZero(num=47) returns "47"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PadZero_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PadZero_0080 begin`);
      const actual: string = padZero(47);
      logInfo(`padZero(num=47): actual=${actual}`);
      expect(actual).assertEqual('47');
      logInfo(`${BUNDLE}PadZero_0080 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0081
     * @tc.name      FormExtAbility_PadZero_0081
     * @tc.desc      padZero(num=-19) returns "0-19"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_PadZero_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PadZero_0081 begin`);
      const actual: string = padZero(-19);
      logInfo(`padZero(num=-19): actual=${actual}`);
      expect(actual).assertEqual('0-19');
      logInfo(`${BUNDLE}PadZero_0081 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0082
     * @tc.name      FormExtAbility_PadZero_0082
     * @tc.desc      padZero(num=37) returns "37"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PadZero_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PadZero_0082 begin`);
      const actual: string = padZero(37);
      logInfo(`padZero(num=37): actual=${actual}`);
      expect(actual).assertEqual('37');
      logInfo(`${BUNDLE}PadZero_0082 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0083
     * @tc.name      FormExtAbility_PadZero_0083
     * @tc.desc      padZero(num=196) returns "196"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PadZero_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PadZero_0083 begin`);
      const actual: string = padZero(196);
      logInfo(`padZero(num=196): actual=${actual}`);
      expect(actual).assertEqual('196');
      logInfo(`${BUNDLE}PadZero_0083 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0084
     * @tc.name      FormExtAbility_PadZero_0084
     * @tc.desc      padZero(num=-15) returns "0-15"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_PadZero_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PadZero_0084 begin`);
      const actual: string = padZero(-15);
      logInfo(`padZero(num=-15): actual=${actual}`);
      expect(actual).assertEqual('0-15');
      logInfo(`${BUNDLE}PadZero_0084 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0085
     * @tc.name      FormExtAbility_PadZero_0085
     * @tc.desc      padZero(num=-11) returns "0-11"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_PadZero_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PadZero_0085 begin`);
      const actual: string = padZero(-11);
      logInfo(`padZero(num=-11): actual=${actual}`);
      expect(actual).assertEqual('0-11');
      logInfo(`${BUNDLE}PadZero_0085 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0086
     * @tc.name      FormExtAbility_PadZero_0086
     * @tc.desc      padZero(num=16.81) returns "16.81"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PadZero_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PadZero_0086 begin`);
      const actual: string = padZero(16.81);
      logInfo(`padZero(num=16.81): actual=${actual}`);
      expect(actual).assertEqual('16.81');
      logInfo(`${BUNDLE}PadZero_0086 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0087
     * @tc.name      FormExtAbility_PadZero_0087
     * @tc.desc      padZero(num=64.1) returns "64.1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PadZero_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PadZero_0087 begin`);
      const actual: string = padZero(64.1);
      logInfo(`padZero(num=64.1): actual=${actual}`);
      expect(actual).assertEqual('64.1');
      logInfo(`${BUNDLE}PadZero_0087 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0088
     * @tc.name      FormExtAbility_PadZero_0088
     * @tc.desc      padZero(num=84) returns "84"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PadZero_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PadZero_0088 begin`);
      const actual: string = padZero(84);
      logInfo(`padZero(num=84): actual=${actual}`);
      expect(actual).assertEqual('84');
      logInfo(`${BUNDLE}PadZero_0088 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0089
     * @tc.name      FormExtAbility_PadZero_0089
     * @tc.desc      padZero(num=78.51) returns "78.51"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PadZero_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PadZero_0089 begin`);
      const actual: string = padZero(78.51);
      logInfo(`padZero(num=78.51): actual=${actual}`);
      expect(actual).assertEqual('78.51');
      logInfo(`${BUNDLE}PadZero_0089 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0090
     * @tc.name      FormExtAbility_PadZero_0090
     * @tc.desc      padZero(num=88) returns "88"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PadZero_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PadZero_0090 begin`);
      const actual: string = padZero(88);
      logInfo(`padZero(num=88): actual=${actual}`);
      expect(actual).assertEqual('88');
      logInfo(`${BUNDLE}PadZero_0090 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0091
     * @tc.name      FormExtAbility_PadZero_0091
     * @tc.desc      padZero(num=21) returns "21"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PadZero_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PadZero_0091 begin`);
      const actual: string = padZero(21);
      logInfo(`padZero(num=21): actual=${actual}`);
      expect(actual).assertEqual('21');
      logInfo(`${BUNDLE}PadZero_0091 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0092
     * @tc.name      FormExtAbility_PadZero_0092
     * @tc.desc      padZero(num=179) returns "179"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PadZero_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PadZero_0092 begin`);
      const actual: string = padZero(179);
      logInfo(`padZero(num=179): actual=${actual}`);
      expect(actual).assertEqual('179');
      logInfo(`${BUNDLE}PadZero_0092 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0093
     * @tc.name      FormExtAbility_PadZero_0093
     * @tc.desc      padZero(num=96) returns "96"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PadZero_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PadZero_0093 begin`);
      const actual: string = padZero(96);
      logInfo(`padZero(num=96): actual=${actual}`);
      expect(actual).assertEqual('96');
      logInfo(`${BUNDLE}PadZero_0093 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0094
     * @tc.name      FormExtAbility_PadZero_0094
     * @tc.desc      padZero(num=24) returns "24"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PadZero_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PadZero_0094 begin`);
      const actual: string = padZero(24);
      logInfo(`padZero(num=24): actual=${actual}`);
      expect(actual).assertEqual('24');
      logInfo(`${BUNDLE}PadZero_0094 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0095
     * @tc.name      FormExtAbility_PadZero_0095
     * @tc.desc      padZero(num=19.16) returns "19.16"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PadZero_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PadZero_0095 begin`);
      const actual: string = padZero(19.16);
      logInfo(`padZero(num=19.16): actual=${actual}`);
      expect(actual).assertEqual('19.16');
      logInfo(`${BUNDLE}PadZero_0095 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0096
     * @tc.name      FormExtAbility_PadZero_0096
     * @tc.desc      padZero(num=-65) returns "0-65"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_PadZero_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PadZero_0096 begin`);
      const actual: string = padZero(-65);
      logInfo(`padZero(num=-65): actual=${actual}`);
      expect(actual).assertEqual('0-65');
      logInfo(`${BUNDLE}PadZero_0096 end`);
    });
  });
}
