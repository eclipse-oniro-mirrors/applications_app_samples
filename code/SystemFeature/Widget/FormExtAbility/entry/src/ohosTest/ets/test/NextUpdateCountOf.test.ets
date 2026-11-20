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
import { nextUpdateCountOf } from './model/FormExtLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_FormExtAbility]';
const BUNDLE: string = 'FormExtAbility_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for nextUpdateCountOf (96 cases). */
export default function nextUpdateCountOfTest(): void {
  describe('NextUpdateCountOfTest', (): void => {
    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0001
     * @tc.name      FormExtAbility_NextUpdateCountOf_0001
     * @tc.desc      nextUpdateCountOf(updateCount=1) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('FormExtAbility_NextUpdateCountOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0001 begin`);
      const actual: number = nextUpdateCountOf(1);
      logInfo(`nextUpdateCountOf(updateCount=1): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}NextUpdateCountOf_0001 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0002
     * @tc.name      FormExtAbility_NextUpdateCountOf_0002
     * @tc.desc      nextUpdateCountOf(updateCount=15) returns 16
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('FormExtAbility_NextUpdateCountOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0002 begin`);
      const actual: number = nextUpdateCountOf(15);
      logInfo(`nextUpdateCountOf(updateCount=15): actual=${actual}`);
      expect(actual).assertEqual(16);
      logInfo(`${BUNDLE}NextUpdateCountOf_0002 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0003
     * @tc.name      FormExtAbility_NextUpdateCountOf_0003
     * @tc.desc      nextUpdateCountOf(updateCount=0) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FormExtAbility_NextUpdateCountOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0003 begin`);
      const actual: number = nextUpdateCountOf(0);
      logInfo(`nextUpdateCountOf(updateCount=0): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NextUpdateCountOf_0003 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0004
     * @tc.name      FormExtAbility_NextUpdateCountOf_0004
     * @tc.desc      nextUpdateCountOf(updateCount=2) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FormExtAbility_NextUpdateCountOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0004 begin`);
      const actual: number = nextUpdateCountOf(2);
      logInfo(`nextUpdateCountOf(updateCount=2): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}NextUpdateCountOf_0004 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0005
     * @tc.name      FormExtAbility_NextUpdateCountOf_0005
     * @tc.desc      nextUpdateCountOf(updateCount=28) returns 29
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_NextUpdateCountOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0005 begin`);
      const actual: number = nextUpdateCountOf(28);
      logInfo(`nextUpdateCountOf(updateCount=28): actual=${actual}`);
      expect(actual).assertEqual(29);
      logInfo(`${BUNDLE}NextUpdateCountOf_0005 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0006
     * @tc.name      FormExtAbility_NextUpdateCountOf_0006
     * @tc.desc      nextUpdateCountOf(updateCount=29) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_NextUpdateCountOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0006 begin`);
      const actual: number = nextUpdateCountOf(29);
      logInfo(`nextUpdateCountOf(updateCount=29): actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}NextUpdateCountOf_0006 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0007
     * @tc.name      FormExtAbility_NextUpdateCountOf_0007
     * @tc.desc      nextUpdateCountOf(updateCount=30) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_NextUpdateCountOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0007 begin`);
      const actual: number = nextUpdateCountOf(30);
      logInfo(`nextUpdateCountOf(updateCount=30): actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}NextUpdateCountOf_0007 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0008
     * @tc.name      FormExtAbility_NextUpdateCountOf_0008
     * @tc.desc      nextUpdateCountOf(updateCount=31) returns 32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_NextUpdateCountOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0008 begin`);
      const actual: number = nextUpdateCountOf(31);
      logInfo(`nextUpdateCountOf(updateCount=31): actual=${actual}`);
      expect(actual).assertEqual(32);
      logInfo(`${BUNDLE}NextUpdateCountOf_0008 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0009
     * @tc.name      FormExtAbility_NextUpdateCountOf_0009
     * @tc.desc      nextUpdateCountOf(updateCount=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_NextUpdateCountOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0009 begin`);
      const actual: number = nextUpdateCountOf(-1);
      logInfo(`nextUpdateCountOf(updateCount=-1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}NextUpdateCountOf_0009 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0010
     * @tc.name      FormExtAbility_NextUpdateCountOf_0010
     * @tc.desc      nextUpdateCountOf(updateCount=3) returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_NextUpdateCountOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0010 begin`);
      const actual: number = nextUpdateCountOf(3);
      logInfo(`nextUpdateCountOf(updateCount=3): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}NextUpdateCountOf_0010 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0011
     * @tc.name      FormExtAbility_NextUpdateCountOf_0011
     * @tc.desc      nextUpdateCountOf(updateCount=10) returns 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_NextUpdateCountOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0011 begin`);
      const actual: number = nextUpdateCountOf(10);
      logInfo(`nextUpdateCountOf(updateCount=10): actual=${actual}`);
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}NextUpdateCountOf_0011 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0012
     * @tc.name      FormExtAbility_NextUpdateCountOf_0012
     * @tc.desc      nextUpdateCountOf(updateCount=100) returns 101
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_NextUpdateCountOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0012 begin`);
      const actual: number = nextUpdateCountOf(100);
      logInfo(`nextUpdateCountOf(updateCount=100): actual=${actual}`);
      expect(actual).assertEqual(101);
      logInfo(`${BUNDLE}NextUpdateCountOf_0012 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0013
     * @tc.name      FormExtAbility_NextUpdateCountOf_0013
     * @tc.desc      nextUpdateCountOf(updateCount=5) returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_NextUpdateCountOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0013 begin`);
      const actual: number = nextUpdateCountOf(5);
      logInfo(`nextUpdateCountOf(updateCount=5): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}NextUpdateCountOf_0013 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0014
     * @tc.name      FormExtAbility_NextUpdateCountOf_0014
     * @tc.desc      nextUpdateCountOf(updateCount=20) returns 21
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_NextUpdateCountOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0014 begin`);
      const actual: number = nextUpdateCountOf(20);
      logInfo(`nextUpdateCountOf(updateCount=20): actual=${actual}`);
      expect(actual).assertEqual(21);
      logInfo(`${BUNDLE}NextUpdateCountOf_0014 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0015
     * @tc.name      FormExtAbility_NextUpdateCountOf_0015
     * @tc.desc      nextUpdateCountOf(updateCount=25) returns 26
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_NextUpdateCountOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0015 begin`);
      const actual: number = nextUpdateCountOf(25);
      logInfo(`nextUpdateCountOf(updateCount=25): actual=${actual}`);
      expect(actual).assertEqual(26);
      logInfo(`${BUNDLE}NextUpdateCountOf_0015 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0016
     * @tc.name      FormExtAbility_NextUpdateCountOf_0016
     * @tc.desc      nextUpdateCountOf(updateCount=35) returns 36
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_NextUpdateCountOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0016 begin`);
      const actual: number = nextUpdateCountOf(35);
      logInfo(`nextUpdateCountOf(updateCount=35): actual=${actual}`);
      expect(actual).assertEqual(36);
      logInfo(`${BUNDLE}NextUpdateCountOf_0016 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0017
     * @tc.name      FormExtAbility_NextUpdateCountOf_0017
     * @tc.desc      nextUpdateCountOf(updateCount=40) returns 41
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_NextUpdateCountOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0017 begin`);
      const actual: number = nextUpdateCountOf(40);
      logInfo(`nextUpdateCountOf(updateCount=40): actual=${actual}`);
      expect(actual).assertEqual(41);
      logInfo(`${BUNDLE}NextUpdateCountOf_0017 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0018
     * @tc.name      FormExtAbility_NextUpdateCountOf_0018
     * @tc.desc      nextUpdateCountOf(updateCount=45) returns 46
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_NextUpdateCountOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0018 begin`);
      const actual: number = nextUpdateCountOf(45);
      logInfo(`nextUpdateCountOf(updateCount=45): actual=${actual}`);
      expect(actual).assertEqual(46);
      logInfo(`${BUNDLE}NextUpdateCountOf_0018 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0019
     * @tc.name      FormExtAbility_NextUpdateCountOf_0019
     * @tc.desc      nextUpdateCountOf(updateCount=50) returns 51
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_NextUpdateCountOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0019 begin`);
      const actual: number = nextUpdateCountOf(50);
      logInfo(`nextUpdateCountOf(updateCount=50): actual=${actual}`);
      expect(actual).assertEqual(51);
      logInfo(`${BUNDLE}NextUpdateCountOf_0019 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0020
     * @tc.name      FormExtAbility_NextUpdateCountOf_0020
     * @tc.desc      nextUpdateCountOf(updateCount=55) returns 56
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_NextUpdateCountOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0020 begin`);
      const actual: number = nextUpdateCountOf(55);
      logInfo(`nextUpdateCountOf(updateCount=55): actual=${actual}`);
      expect(actual).assertEqual(56);
      logInfo(`${BUNDLE}NextUpdateCountOf_0020 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0021
     * @tc.name      FormExtAbility_NextUpdateCountOf_0021
     * @tc.desc      nextUpdateCountOf(updateCount=60) returns 61
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_NextUpdateCountOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0021 begin`);
      const actual: number = nextUpdateCountOf(60);
      logInfo(`nextUpdateCountOf(updateCount=60): actual=${actual}`);
      expect(actual).assertEqual(61);
      logInfo(`${BUNDLE}NextUpdateCountOf_0021 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0022
     * @tc.name      FormExtAbility_NextUpdateCountOf_0022
     * @tc.desc      nextUpdateCountOf(updateCount=65) returns 66
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_NextUpdateCountOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0022 begin`);
      const actual: number = nextUpdateCountOf(65);
      logInfo(`nextUpdateCountOf(updateCount=65): actual=${actual}`);
      expect(actual).assertEqual(66);
      logInfo(`${BUNDLE}NextUpdateCountOf_0022 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0023
     * @tc.name      FormExtAbility_NextUpdateCountOf_0023
     * @tc.desc      nextUpdateCountOf(updateCount=70) returns 71
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_NextUpdateCountOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0023 begin`);
      const actual: number = nextUpdateCountOf(70);
      logInfo(`nextUpdateCountOf(updateCount=70): actual=${actual}`);
      expect(actual).assertEqual(71);
      logInfo(`${BUNDLE}NextUpdateCountOf_0023 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0024
     * @tc.name      FormExtAbility_NextUpdateCountOf_0024
     * @tc.desc      nextUpdateCountOf(updateCount=75) returns 76
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_NextUpdateCountOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0024 begin`);
      const actual: number = nextUpdateCountOf(75);
      logInfo(`nextUpdateCountOf(updateCount=75): actual=${actual}`);
      expect(actual).assertEqual(76);
      logInfo(`${BUNDLE}NextUpdateCountOf_0024 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0025
     * @tc.name      FormExtAbility_NextUpdateCountOf_0025
     * @tc.desc      nextUpdateCountOf(updateCount=80) returns 81
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_NextUpdateCountOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0025 begin`);
      const actual: number = nextUpdateCountOf(80);
      logInfo(`nextUpdateCountOf(updateCount=80): actual=${actual}`);
      expect(actual).assertEqual(81);
      logInfo(`${BUNDLE}NextUpdateCountOf_0025 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0026
     * @tc.name      FormExtAbility_NextUpdateCountOf_0026
     * @tc.desc      nextUpdateCountOf(updateCount=85) returns 86
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_NextUpdateCountOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0026 begin`);
      const actual: number = nextUpdateCountOf(85);
      logInfo(`nextUpdateCountOf(updateCount=85): actual=${actual}`);
      expect(actual).assertEqual(86);
      logInfo(`${BUNDLE}NextUpdateCountOf_0026 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0027
     * @tc.name      FormExtAbility_NextUpdateCountOf_0027
     * @tc.desc      nextUpdateCountOf(updateCount=90) returns 91
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_NextUpdateCountOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0027 begin`);
      const actual: number = nextUpdateCountOf(90);
      logInfo(`nextUpdateCountOf(updateCount=90): actual=${actual}`);
      expect(actual).assertEqual(91);
      logInfo(`${BUNDLE}NextUpdateCountOf_0027 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0028
     * @tc.name      FormExtAbility_NextUpdateCountOf_0028
     * @tc.desc      nextUpdateCountOf(updateCount=95) returns 96
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_NextUpdateCountOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0028 begin`);
      const actual: number = nextUpdateCountOf(95);
      logInfo(`nextUpdateCountOf(updateCount=95): actual=${actual}`);
      expect(actual).assertEqual(96);
      logInfo(`${BUNDLE}NextUpdateCountOf_0028 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0029
     * @tc.name      FormExtAbility_NextUpdateCountOf_0029
     * @tc.desc      nextUpdateCountOf(updateCount=105) returns 106
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_NextUpdateCountOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0029 begin`);
      const actual: number = nextUpdateCountOf(105);
      logInfo(`nextUpdateCountOf(updateCount=105): actual=${actual}`);
      expect(actual).assertEqual(106);
      logInfo(`${BUNDLE}NextUpdateCountOf_0029 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0030
     * @tc.name      FormExtAbility_NextUpdateCountOf_0030
     * @tc.desc      nextUpdateCountOf(updateCount=110) returns 111
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_NextUpdateCountOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0030 begin`);
      const actual: number = nextUpdateCountOf(110);
      logInfo(`nextUpdateCountOf(updateCount=110): actual=${actual}`);
      expect(actual).assertEqual(111);
      logInfo(`${BUNDLE}NextUpdateCountOf_0030 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0031
     * @tc.name      FormExtAbility_NextUpdateCountOf_0031
     * @tc.desc      nextUpdateCountOf(updateCount=115) returns 116
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_NextUpdateCountOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0031 begin`);
      const actual: number = nextUpdateCountOf(115);
      logInfo(`nextUpdateCountOf(updateCount=115): actual=${actual}`);
      expect(actual).assertEqual(116);
      logInfo(`${BUNDLE}NextUpdateCountOf_0031 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0032
     * @tc.name      FormExtAbility_NextUpdateCountOf_0032
     * @tc.desc      nextUpdateCountOf(updateCount=120) returns 121
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_NextUpdateCountOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0032 begin`);
      const actual: number = nextUpdateCountOf(120);
      logInfo(`nextUpdateCountOf(updateCount=120): actual=${actual}`);
      expect(actual).assertEqual(121);
      logInfo(`${BUNDLE}NextUpdateCountOf_0032 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0033
     * @tc.name      FormExtAbility_NextUpdateCountOf_0033
     * @tc.desc      nextUpdateCountOf(updateCount=125) returns 126
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_NextUpdateCountOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0033 begin`);
      const actual: number = nextUpdateCountOf(125);
      logInfo(`nextUpdateCountOf(updateCount=125): actual=${actual}`);
      expect(actual).assertEqual(126);
      logInfo(`${BUNDLE}NextUpdateCountOf_0033 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0034
     * @tc.name      FormExtAbility_NextUpdateCountOf_0034
     * @tc.desc      nextUpdateCountOf(updateCount=130) returns 131
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_NextUpdateCountOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0034 begin`);
      const actual: number = nextUpdateCountOf(130);
      logInfo(`nextUpdateCountOf(updateCount=130): actual=${actual}`);
      expect(actual).assertEqual(131);
      logInfo(`${BUNDLE}NextUpdateCountOf_0034 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0035
     * @tc.name      FormExtAbility_NextUpdateCountOf_0035
     * @tc.desc      nextUpdateCountOf(updateCount=135) returns 136
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_NextUpdateCountOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0035 begin`);
      const actual: number = nextUpdateCountOf(135);
      logInfo(`nextUpdateCountOf(updateCount=135): actual=${actual}`);
      expect(actual).assertEqual(136);
      logInfo(`${BUNDLE}NextUpdateCountOf_0035 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0036
     * @tc.name      FormExtAbility_NextUpdateCountOf_0036
     * @tc.desc      nextUpdateCountOf(updateCount=140) returns 141
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_NextUpdateCountOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0036 begin`);
      const actual: number = nextUpdateCountOf(140);
      logInfo(`nextUpdateCountOf(updateCount=140): actual=${actual}`);
      expect(actual).assertEqual(141);
      logInfo(`${BUNDLE}NextUpdateCountOf_0036 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0037
     * @tc.name      FormExtAbility_NextUpdateCountOf_0037
     * @tc.desc      nextUpdateCountOf(updateCount=145) returns 146
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_NextUpdateCountOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0037 begin`);
      const actual: number = nextUpdateCountOf(145);
      logInfo(`nextUpdateCountOf(updateCount=145): actual=${actual}`);
      expect(actual).assertEqual(146);
      logInfo(`${BUNDLE}NextUpdateCountOf_0037 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0038
     * @tc.name      FormExtAbility_NextUpdateCountOf_0038
     * @tc.desc      nextUpdateCountOf(updateCount=150) returns 151
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_NextUpdateCountOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0038 begin`);
      const actual: number = nextUpdateCountOf(150);
      logInfo(`nextUpdateCountOf(updateCount=150): actual=${actual}`);
      expect(actual).assertEqual(151);
      logInfo(`${BUNDLE}NextUpdateCountOf_0038 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0039
     * @tc.name      FormExtAbility_NextUpdateCountOf_0039
     * @tc.desc      nextUpdateCountOf(updateCount=155) returns 156
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_NextUpdateCountOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0039 begin`);
      const actual: number = nextUpdateCountOf(155);
      logInfo(`nextUpdateCountOf(updateCount=155): actual=${actual}`);
      expect(actual).assertEqual(156);
      logInfo(`${BUNDLE}NextUpdateCountOf_0039 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0040
     * @tc.name      FormExtAbility_NextUpdateCountOf_0040
     * @tc.desc      nextUpdateCountOf(updateCount=160) returns 161
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_NextUpdateCountOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0040 begin`);
      const actual: number = nextUpdateCountOf(160);
      logInfo(`nextUpdateCountOf(updateCount=160): actual=${actual}`);
      expect(actual).assertEqual(161);
      logInfo(`${BUNDLE}NextUpdateCountOf_0040 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0041
     * @tc.name      FormExtAbility_NextUpdateCountOf_0041
     * @tc.desc      nextUpdateCountOf(updateCount=165) returns 166
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_NextUpdateCountOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0041 begin`);
      const actual: number = nextUpdateCountOf(165);
      logInfo(`nextUpdateCountOf(updateCount=165): actual=${actual}`);
      expect(actual).assertEqual(166);
      logInfo(`${BUNDLE}NextUpdateCountOf_0041 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0042
     * @tc.name      FormExtAbility_NextUpdateCountOf_0042
     * @tc.desc      nextUpdateCountOf(updateCount=170) returns 171
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_NextUpdateCountOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0042 begin`);
      const actual: number = nextUpdateCountOf(170);
      logInfo(`nextUpdateCountOf(updateCount=170): actual=${actual}`);
      expect(actual).assertEqual(171);
      logInfo(`${BUNDLE}NextUpdateCountOf_0042 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0043
     * @tc.name      FormExtAbility_NextUpdateCountOf_0043
     * @tc.desc      nextUpdateCountOf(updateCount=175) returns 176
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_NextUpdateCountOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0043 begin`);
      const actual: number = nextUpdateCountOf(175);
      logInfo(`nextUpdateCountOf(updateCount=175): actual=${actual}`);
      expect(actual).assertEqual(176);
      logInfo(`${BUNDLE}NextUpdateCountOf_0043 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0044
     * @tc.name      FormExtAbility_NextUpdateCountOf_0044
     * @tc.desc      nextUpdateCountOf(updateCount=180) returns 181
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_NextUpdateCountOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0044 begin`);
      const actual: number = nextUpdateCountOf(180);
      logInfo(`nextUpdateCountOf(updateCount=180): actual=${actual}`);
      expect(actual).assertEqual(181);
      logInfo(`${BUNDLE}NextUpdateCountOf_0044 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0045
     * @tc.name      FormExtAbility_NextUpdateCountOf_0045
     * @tc.desc      nextUpdateCountOf(updateCount=185) returns 186
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_NextUpdateCountOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0045 begin`);
      const actual: number = nextUpdateCountOf(185);
      logInfo(`nextUpdateCountOf(updateCount=185): actual=${actual}`);
      expect(actual).assertEqual(186);
      logInfo(`${BUNDLE}NextUpdateCountOf_0045 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0046
     * @tc.name      FormExtAbility_NextUpdateCountOf_0046
     * @tc.desc      nextUpdateCountOf(updateCount=190) returns 191
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_NextUpdateCountOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0046 begin`);
      const actual: number = nextUpdateCountOf(190);
      logInfo(`nextUpdateCountOf(updateCount=190): actual=${actual}`);
      expect(actual).assertEqual(191);
      logInfo(`${BUNDLE}NextUpdateCountOf_0046 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0047
     * @tc.name      FormExtAbility_NextUpdateCountOf_0047
     * @tc.desc      nextUpdateCountOf(updateCount=195) returns 196
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_NextUpdateCountOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0047 begin`);
      const actual: number = nextUpdateCountOf(195);
      logInfo(`nextUpdateCountOf(updateCount=195): actual=${actual}`);
      expect(actual).assertEqual(196);
      logInfo(`${BUNDLE}NextUpdateCountOf_0047 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0048
     * @tc.name      FormExtAbility_NextUpdateCountOf_0048
     * @tc.desc      nextUpdateCountOf(updateCount=200) returns 201
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_NextUpdateCountOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0048 begin`);
      const actual: number = nextUpdateCountOf(200);
      logInfo(`nextUpdateCountOf(updateCount=200): actual=${actual}`);
      expect(actual).assertEqual(201);
      logInfo(`${BUNDLE}NextUpdateCountOf_0048 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0049
     * @tc.name      FormExtAbility_NextUpdateCountOf_0049
     * @tc.desc      nextUpdateCountOf(updateCount=-15) returns -14
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_NextUpdateCountOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0049 begin`);
      const actual: number = nextUpdateCountOf(-15);
      logInfo(`nextUpdateCountOf(updateCount=-15): actual=${actual}`);
      expect(actual).assertEqual(-14);
      logInfo(`${BUNDLE}NextUpdateCountOf_0049 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0050
     * @tc.name      FormExtAbility_NextUpdateCountOf_0050
     * @tc.desc      nextUpdateCountOf(updateCount=74) returns 75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_NextUpdateCountOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0050 begin`);
      const actual: number = nextUpdateCountOf(74);
      logInfo(`nextUpdateCountOf(updateCount=74): actual=${actual}`);
      expect(actual).assertEqual(75);
      logInfo(`${BUNDLE}NextUpdateCountOf_0050 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0051
     * @tc.name      FormExtAbility_NextUpdateCountOf_0051
     * @tc.desc      nextUpdateCountOf(updateCount=-80) returns -79
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_NextUpdateCountOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0051 begin`);
      const actual: number = nextUpdateCountOf(-80);
      logInfo(`nextUpdateCountOf(updateCount=-80): actual=${actual}`);
      expect(actual).assertEqual(-79);
      logInfo(`${BUNDLE}NextUpdateCountOf_0051 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0052
     * @tc.name      FormExtAbility_NextUpdateCountOf_0052
     * @tc.desc      nextUpdateCountOf(updateCount=-3) returns -2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_NextUpdateCountOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0052 begin`);
      const actual: number = nextUpdateCountOf(-3);
      logInfo(`nextUpdateCountOf(updateCount=-3): actual=${actual}`);
      expect(actual).assertEqual(-2);
      logInfo(`${BUNDLE}NextUpdateCountOf_0052 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0053
     * @tc.name      FormExtAbility_NextUpdateCountOf_0053
     * @tc.desc      nextUpdateCountOf(updateCount=-37) returns -36
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_NextUpdateCountOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0053 begin`);
      const actual: number = nextUpdateCountOf(-37);
      logInfo(`nextUpdateCountOf(updateCount=-37): actual=${actual}`);
      expect(actual).assertEqual(-36);
      logInfo(`${BUNDLE}NextUpdateCountOf_0053 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0054
     * @tc.name      FormExtAbility_NextUpdateCountOf_0054
     * @tc.desc      nextUpdateCountOf(updateCount=42.79) returns 43.79
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_NextUpdateCountOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0054 begin`);
      const actual: number = nextUpdateCountOf(42.79);
      logInfo(`nextUpdateCountOf(updateCount=42.79): actual=${actual}`);
      expect(actual).assertClose(43.79, PRECISION);
      logInfo(`${BUNDLE}NextUpdateCountOf_0054 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0055
     * @tc.name      FormExtAbility_NextUpdateCountOf_0055
     * @tc.desc      nextUpdateCountOf(updateCount=51.78) returns 52.78
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_NextUpdateCountOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0055 begin`);
      const actual: number = nextUpdateCountOf(51.78);
      logInfo(`nextUpdateCountOf(updateCount=51.78): actual=${actual}`);
      expect(actual).assertClose(52.78, PRECISION);
      logInfo(`${BUNDLE}NextUpdateCountOf_0055 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0056
     * @tc.name      FormExtAbility_NextUpdateCountOf_0056
     * @tc.desc      nextUpdateCountOf(updateCount=-5) returns -4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_NextUpdateCountOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0056 begin`);
      const actual: number = nextUpdateCountOf(-5);
      logInfo(`nextUpdateCountOf(updateCount=-5): actual=${actual}`);
      expect(actual).assertEqual(-4);
      logInfo(`${BUNDLE}NextUpdateCountOf_0056 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0057
     * @tc.name      FormExtAbility_NextUpdateCountOf_0057
     * @tc.desc      nextUpdateCountOf(updateCount=-10) returns -9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_NextUpdateCountOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0057 begin`);
      const actual: number = nextUpdateCountOf(-10);
      logInfo(`nextUpdateCountOf(updateCount=-10): actual=${actual}`);
      expect(actual).assertEqual(-9);
      logInfo(`${BUNDLE}NextUpdateCountOf_0057 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0058
     * @tc.name      FormExtAbility_NextUpdateCountOf_0058
     * @tc.desc      nextUpdateCountOf(updateCount=-8) returns -7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_NextUpdateCountOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0058 begin`);
      const actual: number = nextUpdateCountOf(-8);
      logInfo(`nextUpdateCountOf(updateCount=-8): actual=${actual}`);
      expect(actual).assertEqual(-7);
      logInfo(`${BUNDLE}NextUpdateCountOf_0058 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0059
     * @tc.name      FormExtAbility_NextUpdateCountOf_0059
     * @tc.desc      nextUpdateCountOf(updateCount=94.14) returns 95.14
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_NextUpdateCountOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0059 begin`);
      const actual: number = nextUpdateCountOf(94.14);
      logInfo(`nextUpdateCountOf(updateCount=94.14): actual=${actual}`);
      expect(actual).assertClose(95.14, PRECISION);
      logInfo(`${BUNDLE}NextUpdateCountOf_0059 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0060
     * @tc.name      FormExtAbility_NextUpdateCountOf_0060
     * @tc.desc      nextUpdateCountOf(updateCount=107) returns 108
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_NextUpdateCountOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0060 begin`);
      const actual: number = nextUpdateCountOf(107);
      logInfo(`nextUpdateCountOf(updateCount=107): actual=${actual}`);
      expect(actual).assertEqual(108);
      logInfo(`${BUNDLE}NextUpdateCountOf_0060 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0061
     * @tc.name      FormExtAbility_NextUpdateCountOf_0061
     * @tc.desc      nextUpdateCountOf(updateCount=43) returns 44
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_NextUpdateCountOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0061 begin`);
      const actual: number = nextUpdateCountOf(43);
      logInfo(`nextUpdateCountOf(updateCount=43): actual=${actual}`);
      expect(actual).assertEqual(44);
      logInfo(`${BUNDLE}NextUpdateCountOf_0061 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0062
     * @tc.name      FormExtAbility_NextUpdateCountOf_0062
     * @tc.desc      nextUpdateCountOf(updateCount=94) returns 95
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_NextUpdateCountOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0062 begin`);
      const actual: number = nextUpdateCountOf(94);
      logInfo(`nextUpdateCountOf(updateCount=94): actual=${actual}`);
      expect(actual).assertEqual(95);
      logInfo(`${BUNDLE}NextUpdateCountOf_0062 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0063
     * @tc.name      FormExtAbility_NextUpdateCountOf_0063
     * @tc.desc      nextUpdateCountOf(updateCount=0.38) returns 1.38
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_NextUpdateCountOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0063 begin`);
      const actual: number = nextUpdateCountOf(0.38);
      logInfo(`nextUpdateCountOf(updateCount=0.38): actual=${actual}`);
      expect(actual).assertClose(1.38, PRECISION);
      logInfo(`${BUNDLE}NextUpdateCountOf_0063 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0064
     * @tc.name      FormExtAbility_NextUpdateCountOf_0064
     * @tc.desc      nextUpdateCountOf(updateCount=73) returns 74
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_NextUpdateCountOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0064 begin`);
      const actual: number = nextUpdateCountOf(73);
      logInfo(`nextUpdateCountOf(updateCount=73): actual=${actual}`);
      expect(actual).assertEqual(74);
      logInfo(`${BUNDLE}NextUpdateCountOf_0064 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0065
     * @tc.name      FormExtAbility_NextUpdateCountOf_0065
     * @tc.desc      nextUpdateCountOf(updateCount=-45) returns -44
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_NextUpdateCountOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0065 begin`);
      const actual: number = nextUpdateCountOf(-45);
      logInfo(`nextUpdateCountOf(updateCount=-45): actual=${actual}`);
      expect(actual).assertEqual(-44);
      logInfo(`${BUNDLE}NextUpdateCountOf_0065 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0066
     * @tc.name      FormExtAbility_NextUpdateCountOf_0066
     * @tc.desc      nextUpdateCountOf(updateCount=127) returns 128
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_NextUpdateCountOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0066 begin`);
      const actual: number = nextUpdateCountOf(127);
      logInfo(`nextUpdateCountOf(updateCount=127): actual=${actual}`);
      expect(actual).assertEqual(128);
      logInfo(`${BUNDLE}NextUpdateCountOf_0066 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0067
     * @tc.name      FormExtAbility_NextUpdateCountOf_0067
     * @tc.desc      nextUpdateCountOf(updateCount=-4) returns -3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_NextUpdateCountOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0067 begin`);
      const actual: number = nextUpdateCountOf(-4);
      logInfo(`nextUpdateCountOf(updateCount=-4): actual=${actual}`);
      expect(actual).assertEqual(-3);
      logInfo(`${BUNDLE}NextUpdateCountOf_0067 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0068
     * @tc.name      FormExtAbility_NextUpdateCountOf_0068
     * @tc.desc      nextUpdateCountOf(updateCount=40.38) returns 41.38
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_NextUpdateCountOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0068 begin`);
      const actual: number = nextUpdateCountOf(40.38);
      logInfo(`nextUpdateCountOf(updateCount=40.38): actual=${actual}`);
      expect(actual).assertClose(41.38, PRECISION);
      logInfo(`${BUNDLE}NextUpdateCountOf_0068 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0069
     * @tc.name      FormExtAbility_NextUpdateCountOf_0069
     * @tc.desc      nextUpdateCountOf(updateCount=-71) returns -70
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_NextUpdateCountOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0069 begin`);
      const actual: number = nextUpdateCountOf(-71);
      logInfo(`nextUpdateCountOf(updateCount=-71): actual=${actual}`);
      expect(actual).assertEqual(-70);
      logInfo(`${BUNDLE}NextUpdateCountOf_0069 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0070
     * @tc.name      FormExtAbility_NextUpdateCountOf_0070
     * @tc.desc      nextUpdateCountOf(updateCount=-7) returns -6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_NextUpdateCountOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0070 begin`);
      const actual: number = nextUpdateCountOf(-7);
      logInfo(`nextUpdateCountOf(updateCount=-7): actual=${actual}`);
      expect(actual).assertEqual(-6);
      logInfo(`${BUNDLE}NextUpdateCountOf_0070 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0071
     * @tc.name      FormExtAbility_NextUpdateCountOf_0071
     * @tc.desc      nextUpdateCountOf(updateCount=188) returns 189
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_NextUpdateCountOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0071 begin`);
      const actual: number = nextUpdateCountOf(188);
      logInfo(`nextUpdateCountOf(updateCount=188): actual=${actual}`);
      expect(actual).assertEqual(189);
      logInfo(`${BUNDLE}NextUpdateCountOf_0071 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0072
     * @tc.name      FormExtAbility_NextUpdateCountOf_0072
     * @tc.desc      nextUpdateCountOf(updateCount=77.29) returns 78.29
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_NextUpdateCountOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0072 begin`);
      const actual: number = nextUpdateCountOf(77.29);
      logInfo(`nextUpdateCountOf(updateCount=77.29): actual=${actual}`);
      expect(actual).assertClose(78.29, PRECISION);
      logInfo(`${BUNDLE}NextUpdateCountOf_0072 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0073
     * @tc.name      FormExtAbility_NextUpdateCountOf_0073
     * @tc.desc      nextUpdateCountOf(updateCount=27.87) returns 28.87
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_NextUpdateCountOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0073 begin`);
      const actual: number = nextUpdateCountOf(27.87);
      logInfo(`nextUpdateCountOf(updateCount=27.87): actual=${actual}`);
      expect(actual).assertClose(28.87, PRECISION);
      logInfo(`${BUNDLE}NextUpdateCountOf_0073 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0074
     * @tc.name      FormExtAbility_NextUpdateCountOf_0074
     * @tc.desc      nextUpdateCountOf(updateCount=-32) returns -31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_NextUpdateCountOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0074 begin`);
      const actual: number = nextUpdateCountOf(-32);
      logInfo(`nextUpdateCountOf(updateCount=-32): actual=${actual}`);
      expect(actual).assertEqual(-31);
      logInfo(`${BUNDLE}NextUpdateCountOf_0074 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0075
     * @tc.name      FormExtAbility_NextUpdateCountOf_0075
     * @tc.desc      nextUpdateCountOf(updateCount=26) returns 27
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_NextUpdateCountOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0075 begin`);
      const actual: number = nextUpdateCountOf(26);
      logInfo(`nextUpdateCountOf(updateCount=26): actual=${actual}`);
      expect(actual).assertEqual(27);
      logInfo(`${BUNDLE}NextUpdateCountOf_0075 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0076
     * @tc.name      FormExtAbility_NextUpdateCountOf_0076
     * @tc.desc      nextUpdateCountOf(updateCount=178) returns 179
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_NextUpdateCountOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0076 begin`);
      const actual: number = nextUpdateCountOf(178);
      logInfo(`nextUpdateCountOf(updateCount=178): actual=${actual}`);
      expect(actual).assertEqual(179);
      logInfo(`${BUNDLE}NextUpdateCountOf_0076 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0077
     * @tc.name      FormExtAbility_NextUpdateCountOf_0077
     * @tc.desc      nextUpdateCountOf(updateCount=69.13) returns 70.13
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_NextUpdateCountOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0077 begin`);
      const actual: number = nextUpdateCountOf(69.13);
      logInfo(`nextUpdateCountOf(updateCount=69.13): actual=${actual}`);
      expect(actual).assertClose(70.13, PRECISION);
      logInfo(`${BUNDLE}NextUpdateCountOf_0077 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0078
     * @tc.name      FormExtAbility_NextUpdateCountOf_0078
     * @tc.desc      nextUpdateCountOf(updateCount=-38) returns -37
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_NextUpdateCountOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0078 begin`);
      const actual: number = nextUpdateCountOf(-38);
      logInfo(`nextUpdateCountOf(updateCount=-38): actual=${actual}`);
      expect(actual).assertEqual(-37);
      logInfo(`${BUNDLE}NextUpdateCountOf_0078 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0079
     * @tc.name      FormExtAbility_NextUpdateCountOf_0079
     * @tc.desc      nextUpdateCountOf(updateCount=77) returns 78
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_NextUpdateCountOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0079 begin`);
      const actual: number = nextUpdateCountOf(77);
      logInfo(`nextUpdateCountOf(updateCount=77): actual=${actual}`);
      expect(actual).assertEqual(78);
      logInfo(`${BUNDLE}NextUpdateCountOf_0079 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0080
     * @tc.name      FormExtAbility_NextUpdateCountOf_0080
     * @tc.desc      nextUpdateCountOf(updateCount=79.89) returns 80.89
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_NextUpdateCountOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0080 begin`);
      const actual: number = nextUpdateCountOf(79.89);
      logInfo(`nextUpdateCountOf(updateCount=79.89): actual=${actual}`);
      expect(actual).assertClose(80.89, PRECISION);
      logInfo(`${BUNDLE}NextUpdateCountOf_0080 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0081
     * @tc.name      FormExtAbility_NextUpdateCountOf_0081
     * @tc.desc      nextUpdateCountOf(updateCount=186) returns 187
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_NextUpdateCountOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0081 begin`);
      const actual: number = nextUpdateCountOf(186);
      logInfo(`nextUpdateCountOf(updateCount=186): actual=${actual}`);
      expect(actual).assertEqual(187);
      logInfo(`${BUNDLE}NextUpdateCountOf_0081 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0082
     * @tc.name      FormExtAbility_NextUpdateCountOf_0082
     * @tc.desc      nextUpdateCountOf(updateCount=174) returns 175
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_NextUpdateCountOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0082 begin`);
      const actual: number = nextUpdateCountOf(174);
      logInfo(`nextUpdateCountOf(updateCount=174): actual=${actual}`);
      expect(actual).assertEqual(175);
      logInfo(`${BUNDLE}NextUpdateCountOf_0082 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0083
     * @tc.name      FormExtAbility_NextUpdateCountOf_0083
     * @tc.desc      nextUpdateCountOf(updateCount=66) returns 67
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_NextUpdateCountOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0083 begin`);
      const actual: number = nextUpdateCountOf(66);
      logInfo(`nextUpdateCountOf(updateCount=66): actual=${actual}`);
      expect(actual).assertEqual(67);
      logInfo(`${BUNDLE}NextUpdateCountOf_0083 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0084
     * @tc.name      FormExtAbility_NextUpdateCountOf_0084
     * @tc.desc      nextUpdateCountOf(updateCount=16.02) returns 17.02
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_NextUpdateCountOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0084 begin`);
      const actual: number = nextUpdateCountOf(16.02);
      logInfo(`nextUpdateCountOf(updateCount=16.02): actual=${actual}`);
      expect(actual).assertClose(17.02, PRECISION);
      logInfo(`${BUNDLE}NextUpdateCountOf_0084 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0085
     * @tc.name      FormExtAbility_NextUpdateCountOf_0085
     * @tc.desc      nextUpdateCountOf(updateCount=18) returns 19
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_NextUpdateCountOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0085 begin`);
      const actual: number = nextUpdateCountOf(18);
      logInfo(`nextUpdateCountOf(updateCount=18): actual=${actual}`);
      expect(actual).assertEqual(19);
      logInfo(`${BUNDLE}NextUpdateCountOf_0085 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0086
     * @tc.name      FormExtAbility_NextUpdateCountOf_0086
     * @tc.desc      nextUpdateCountOf(updateCount=48) returns 49
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_NextUpdateCountOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0086 begin`);
      const actual: number = nextUpdateCountOf(48);
      logInfo(`nextUpdateCountOf(updateCount=48): actual=${actual}`);
      expect(actual).assertEqual(49);
      logInfo(`${BUNDLE}NextUpdateCountOf_0086 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0087
     * @tc.name      FormExtAbility_NextUpdateCountOf_0087
     * @tc.desc      nextUpdateCountOf(updateCount=99) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_NextUpdateCountOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0087 begin`);
      const actual: number = nextUpdateCountOf(99);
      logInfo(`nextUpdateCountOf(updateCount=99): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}NextUpdateCountOf_0087 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0088
     * @tc.name      FormExtAbility_NextUpdateCountOf_0088
     * @tc.desc      nextUpdateCountOf(updateCount=92.09) returns 93.09
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_NextUpdateCountOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0088 begin`);
      const actual: number = nextUpdateCountOf(92.09);
      logInfo(`nextUpdateCountOf(updateCount=92.09): actual=${actual}`);
      expect(actual).assertClose(93.09, PRECISION);
      logInfo(`${BUNDLE}NextUpdateCountOf_0088 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0089
     * @tc.name      FormExtAbility_NextUpdateCountOf_0089
     * @tc.desc      nextUpdateCountOf(updateCount=81.41) returns 82.41
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_NextUpdateCountOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0089 begin`);
      const actual: number = nextUpdateCountOf(81.41);
      logInfo(`nextUpdateCountOf(updateCount=81.41): actual=${actual}`);
      expect(actual).assertClose(82.41, PRECISION);
      logInfo(`${BUNDLE}NextUpdateCountOf_0089 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0090
     * @tc.name      FormExtAbility_NextUpdateCountOf_0090
     * @tc.desc      nextUpdateCountOf(updateCount=-94) returns -93
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_NextUpdateCountOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0090 begin`);
      const actual: number = nextUpdateCountOf(-94);
      logInfo(`nextUpdateCountOf(updateCount=-94): actual=${actual}`);
      expect(actual).assertEqual(-93);
      logInfo(`${BUNDLE}NextUpdateCountOf_0090 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0091
     * @tc.name      FormExtAbility_NextUpdateCountOf_0091
     * @tc.desc      nextUpdateCountOf(updateCount=88) returns 89
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_NextUpdateCountOf_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0091 begin`);
      const actual: number = nextUpdateCountOf(88);
      logInfo(`nextUpdateCountOf(updateCount=88): actual=${actual}`);
      expect(actual).assertEqual(89);
      logInfo(`${BUNDLE}NextUpdateCountOf_0091 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0092
     * @tc.name      FormExtAbility_NextUpdateCountOf_0092
     * @tc.desc      nextUpdateCountOf(updateCount=124) returns 125
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_NextUpdateCountOf_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0092 begin`);
      const actual: number = nextUpdateCountOf(124);
      logInfo(`nextUpdateCountOf(updateCount=124): actual=${actual}`);
      expect(actual).assertEqual(125);
      logInfo(`${BUNDLE}NextUpdateCountOf_0092 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0093
     * @tc.name      FormExtAbility_NextUpdateCountOf_0093
     * @tc.desc      nextUpdateCountOf(updateCount=194) returns 195
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_NextUpdateCountOf_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0093 begin`);
      const actual: number = nextUpdateCountOf(194);
      logInfo(`nextUpdateCountOf(updateCount=194): actual=${actual}`);
      expect(actual).assertEqual(195);
      logInfo(`${BUNDLE}NextUpdateCountOf_0093 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0094
     * @tc.name      FormExtAbility_NextUpdateCountOf_0094
     * @tc.desc      nextUpdateCountOf(updateCount=129) returns 130
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_NextUpdateCountOf_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0094 begin`);
      const actual: number = nextUpdateCountOf(129);
      logInfo(`nextUpdateCountOf(updateCount=129): actual=${actual}`);
      expect(actual).assertEqual(130);
      logInfo(`${BUNDLE}NextUpdateCountOf_0094 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0095
     * @tc.name      FormExtAbility_NextUpdateCountOf_0095
     * @tc.desc      nextUpdateCountOf(updateCount=-27) returns -26
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_NextUpdateCountOf_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0095 begin`);
      const actual: number = nextUpdateCountOf(-27);
      logInfo(`nextUpdateCountOf(updateCount=-27): actual=${actual}`);
      expect(actual).assertEqual(-26);
      logInfo(`${BUNDLE}NextUpdateCountOf_0095 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_NEXT_UPDATE_COUNT_OF_0096
     * @tc.name      FormExtAbility_NextUpdateCountOf_0096
     * @tc.desc      nextUpdateCountOf(updateCount=104) returns 105
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_NextUpdateCountOf_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NextUpdateCountOf_0096 begin`);
      const actual: number = nextUpdateCountOf(104);
      logInfo(`nextUpdateCountOf(updateCount=104): actual=${actual}`);
      expect(actual).assertEqual(105);
      logInfo(`${BUNDLE}NextUpdateCountOf_0096 end`);
    });
  });
}
