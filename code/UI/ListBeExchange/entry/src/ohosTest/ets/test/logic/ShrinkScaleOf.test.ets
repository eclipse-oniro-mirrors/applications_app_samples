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
import { shrinkScaleOf } from '../model/ListExchangeLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ListBeExchange]';
const BUNDLE: string = 'ListBeExchange_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for shrinkScaleOf (96 cases). */
export default function shrinkScaleOfTest(): void {
  describe('ShrinkScaleOfTest', (): void => {
    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0001
     * @tc.name      ListBeExchange_ShrinkScaleOf_0001
     * @tc.desc      shrinkScaleOf(curveValue=1) returns 0.9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ListBeExchange_ShrinkScaleOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0001 begin`);
      const actual: number = shrinkScaleOf(1);
      logInfo(`shrinkScaleOf(curveValue=1): actual=${actual}`);
      expect(actual).assertClose(0.9, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0001 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0002
     * @tc.name      ListBeExchange_ShrinkScaleOf_0002
     * @tc.desc      shrinkScaleOf(curveValue=0) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ListBeExchange_ShrinkScaleOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0002 begin`);
      const actual: number = shrinkScaleOf(0);
      logInfo(`shrinkScaleOf(curveValue=0): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ShrinkScaleOf_0002 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0003
     * @tc.name      ListBeExchange_ShrinkScaleOf_0003
     * @tc.desc      shrinkScaleOf(curveValue=2) returns 0.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_ShrinkScaleOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0003 begin`);
      const actual: number = shrinkScaleOf(2);
      logInfo(`shrinkScaleOf(curveValue=2): actual=${actual}`);
      expect(actual).assertClose(0.8, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0003 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0004
     * @tc.name      ListBeExchange_ShrinkScaleOf_0004
     * @tc.desc      shrinkScaleOf(curveValue=10) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_ShrinkScaleOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0004 begin`);
      const actual: number = shrinkScaleOf(10);
      logInfo(`shrinkScaleOf(curveValue=10): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ShrinkScaleOf_0004 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0005
     * @tc.name      ListBeExchange_ShrinkScaleOf_0005
     * @tc.desc      shrinkScaleOf(curveValue=9) returns 0.09999999999999998
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_ShrinkScaleOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0005 begin`);
      const actual: number = shrinkScaleOf(9);
      logInfo(`shrinkScaleOf(curveValue=9): actual=${actual}`);
      expect(actual).assertClose(0.09999999999999998, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0005 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0006
     * @tc.name      ListBeExchange_ShrinkScaleOf_0006
     * @tc.desc      shrinkScaleOf(curveValue=11) returns -0.10000000000000009
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_ShrinkScaleOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0006 begin`);
      const actual: number = shrinkScaleOf(11);
      logInfo(`shrinkScaleOf(curveValue=11): actual=${actual}`);
      expect(actual).assertClose(-0.10000000000000009, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0006 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0007
     * @tc.name      ListBeExchange_ShrinkScaleOf_0007
     * @tc.desc      shrinkScaleOf(curveValue=20) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0007 begin`);
      const actual: number = shrinkScaleOf(20);
      logInfo(`shrinkScaleOf(curveValue=20): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ShrinkScaleOf_0007 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0008
     * @tc.name      ListBeExchange_ShrinkScaleOf_0008
     * @tc.desc      shrinkScaleOf(curveValue=5) returns 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0008 begin`);
      const actual: number = shrinkScaleOf(5);
      logInfo(`shrinkScaleOf(curveValue=5): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0008 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0009
     * @tc.name      ListBeExchange_ShrinkScaleOf_0009
     * @tc.desc      shrinkScaleOf(curveValue=-1) returns 1.1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_ShrinkScaleOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0009 begin`);
      const actual: number = shrinkScaleOf(-1);
      logInfo(`shrinkScaleOf(curveValue=-1): actual=${actual}`);
      expect(actual).assertClose(1.1, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0009 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0010
     * @tc.name      ListBeExchange_ShrinkScaleOf_0010
     * @tc.desc      shrinkScaleOf(curveValue=3) returns 0.7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0010 begin`);
      const actual: number = shrinkScaleOf(3);
      logInfo(`shrinkScaleOf(curveValue=3): actual=${actual}`);
      expect(actual).assertClose(0.7, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0010 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0011
     * @tc.name      ListBeExchange_ShrinkScaleOf_0011
     * @tc.desc      shrinkScaleOf(curveValue=100) returns -9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0011 begin`);
      const actual: number = shrinkScaleOf(100);
      logInfo(`shrinkScaleOf(curveValue=100): actual=${actual}`);
      expect(actual).assertEqual(-9);
      logInfo(`${BUNDLE}ShrinkScaleOf_0011 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0012
     * @tc.name      ListBeExchange_ShrinkScaleOf_0012
     * @tc.desc      shrinkScaleOf(curveValue=15) returns -0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0012 begin`);
      const actual: number = shrinkScaleOf(15);
      logInfo(`shrinkScaleOf(curveValue=15): actual=${actual}`);
      expect(actual).assertClose(-0.5, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0012 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0013
     * @tc.name      ListBeExchange_ShrinkScaleOf_0013
     * @tc.desc      shrinkScaleOf(curveValue=25) returns -1.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0013 begin`);
      const actual: number = shrinkScaleOf(25);
      logInfo(`shrinkScaleOf(curveValue=25): actual=${actual}`);
      expect(actual).assertClose(-1.5, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0013 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0014
     * @tc.name      ListBeExchange_ShrinkScaleOf_0014
     * @tc.desc      shrinkScaleOf(curveValue=30) returns -2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0014 begin`);
      const actual: number = shrinkScaleOf(30);
      logInfo(`shrinkScaleOf(curveValue=30): actual=${actual}`);
      expect(actual).assertEqual(-2);
      logInfo(`${BUNDLE}ShrinkScaleOf_0014 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0015
     * @tc.name      ListBeExchange_ShrinkScaleOf_0015
     * @tc.desc      shrinkScaleOf(curveValue=35) returns -2.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0015 begin`);
      const actual: number = shrinkScaleOf(35);
      logInfo(`shrinkScaleOf(curveValue=35): actual=${actual}`);
      expect(actual).assertClose(-2.5, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0015 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0016
     * @tc.name      ListBeExchange_ShrinkScaleOf_0016
     * @tc.desc      shrinkScaleOf(curveValue=40) returns -3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0016 begin`);
      const actual: number = shrinkScaleOf(40);
      logInfo(`shrinkScaleOf(curveValue=40): actual=${actual}`);
      expect(actual).assertEqual(-3);
      logInfo(`${BUNDLE}ShrinkScaleOf_0016 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0017
     * @tc.name      ListBeExchange_ShrinkScaleOf_0017
     * @tc.desc      shrinkScaleOf(curveValue=45) returns -3.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0017 begin`);
      const actual: number = shrinkScaleOf(45);
      logInfo(`shrinkScaleOf(curveValue=45): actual=${actual}`);
      expect(actual).assertClose(-3.5, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0017 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0018
     * @tc.name      ListBeExchange_ShrinkScaleOf_0018
     * @tc.desc      shrinkScaleOf(curveValue=50) returns -4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0018 begin`);
      const actual: number = shrinkScaleOf(50);
      logInfo(`shrinkScaleOf(curveValue=50): actual=${actual}`);
      expect(actual).assertEqual(-4);
      logInfo(`${BUNDLE}ShrinkScaleOf_0018 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0019
     * @tc.name      ListBeExchange_ShrinkScaleOf_0019
     * @tc.desc      shrinkScaleOf(curveValue=55) returns -4.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0019 begin`);
      const actual: number = shrinkScaleOf(55);
      logInfo(`shrinkScaleOf(curveValue=55): actual=${actual}`);
      expect(actual).assertClose(-4.5, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0019 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0020
     * @tc.name      ListBeExchange_ShrinkScaleOf_0020
     * @tc.desc      shrinkScaleOf(curveValue=60) returns -5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0020 begin`);
      const actual: number = shrinkScaleOf(60);
      logInfo(`shrinkScaleOf(curveValue=60): actual=${actual}`);
      expect(actual).assertEqual(-5);
      logInfo(`${BUNDLE}ShrinkScaleOf_0020 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0021
     * @tc.name      ListBeExchange_ShrinkScaleOf_0021
     * @tc.desc      shrinkScaleOf(curveValue=65) returns -5.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0021 begin`);
      const actual: number = shrinkScaleOf(65);
      logInfo(`shrinkScaleOf(curveValue=65): actual=${actual}`);
      expect(actual).assertClose(-5.5, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0021 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0022
     * @tc.name      ListBeExchange_ShrinkScaleOf_0022
     * @tc.desc      shrinkScaleOf(curveValue=70) returns -6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0022 begin`);
      const actual: number = shrinkScaleOf(70);
      logInfo(`shrinkScaleOf(curveValue=70): actual=${actual}`);
      expect(actual).assertEqual(-6);
      logInfo(`${BUNDLE}ShrinkScaleOf_0022 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0023
     * @tc.name      ListBeExchange_ShrinkScaleOf_0023
     * @tc.desc      shrinkScaleOf(curveValue=75) returns -6.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0023 begin`);
      const actual: number = shrinkScaleOf(75);
      logInfo(`shrinkScaleOf(curveValue=75): actual=${actual}`);
      expect(actual).assertClose(-6.5, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0023 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0024
     * @tc.name      ListBeExchange_ShrinkScaleOf_0024
     * @tc.desc      shrinkScaleOf(curveValue=80) returns -7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0024 begin`);
      const actual: number = shrinkScaleOf(80);
      logInfo(`shrinkScaleOf(curveValue=80): actual=${actual}`);
      expect(actual).assertEqual(-7);
      logInfo(`${BUNDLE}ShrinkScaleOf_0024 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0025
     * @tc.name      ListBeExchange_ShrinkScaleOf_0025
     * @tc.desc      shrinkScaleOf(curveValue=85) returns -7.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0025 begin`);
      const actual: number = shrinkScaleOf(85);
      logInfo(`shrinkScaleOf(curveValue=85): actual=${actual}`);
      expect(actual).assertClose(-7.5, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0025 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0026
     * @tc.name      ListBeExchange_ShrinkScaleOf_0026
     * @tc.desc      shrinkScaleOf(curveValue=90) returns -8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0026 begin`);
      const actual: number = shrinkScaleOf(90);
      logInfo(`shrinkScaleOf(curveValue=90): actual=${actual}`);
      expect(actual).assertEqual(-8);
      logInfo(`${BUNDLE}ShrinkScaleOf_0026 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0027
     * @tc.name      ListBeExchange_ShrinkScaleOf_0027
     * @tc.desc      shrinkScaleOf(curveValue=95) returns -8.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0027 begin`);
      const actual: number = shrinkScaleOf(95);
      logInfo(`shrinkScaleOf(curveValue=95): actual=${actual}`);
      expect(actual).assertClose(-8.5, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0027 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0028
     * @tc.name      ListBeExchange_ShrinkScaleOf_0028
     * @tc.desc      shrinkScaleOf(curveValue=105) returns -9.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0028 begin`);
      const actual: number = shrinkScaleOf(105);
      logInfo(`shrinkScaleOf(curveValue=105): actual=${actual}`);
      expect(actual).assertClose(-9.5, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0028 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0029
     * @tc.name      ListBeExchange_ShrinkScaleOf_0029
     * @tc.desc      shrinkScaleOf(curveValue=110) returns -10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0029 begin`);
      const actual: number = shrinkScaleOf(110);
      logInfo(`shrinkScaleOf(curveValue=110): actual=${actual}`);
      expect(actual).assertEqual(-10);
      logInfo(`${BUNDLE}ShrinkScaleOf_0029 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0030
     * @tc.name      ListBeExchange_ShrinkScaleOf_0030
     * @tc.desc      shrinkScaleOf(curveValue=115) returns -10.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0030 begin`);
      const actual: number = shrinkScaleOf(115);
      logInfo(`shrinkScaleOf(curveValue=115): actual=${actual}`);
      expect(actual).assertClose(-10.5, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0030 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0031
     * @tc.name      ListBeExchange_ShrinkScaleOf_0031
     * @tc.desc      shrinkScaleOf(curveValue=120) returns -11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0031 begin`);
      const actual: number = shrinkScaleOf(120);
      logInfo(`shrinkScaleOf(curveValue=120): actual=${actual}`);
      expect(actual).assertEqual(-11);
      logInfo(`${BUNDLE}ShrinkScaleOf_0031 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0032
     * @tc.name      ListBeExchange_ShrinkScaleOf_0032
     * @tc.desc      shrinkScaleOf(curveValue=125) returns -11.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0032 begin`);
      const actual: number = shrinkScaleOf(125);
      logInfo(`shrinkScaleOf(curveValue=125): actual=${actual}`);
      expect(actual).assertClose(-11.5, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0032 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0033
     * @tc.name      ListBeExchange_ShrinkScaleOf_0033
     * @tc.desc      shrinkScaleOf(curveValue=130) returns -12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0033 begin`);
      const actual: number = shrinkScaleOf(130);
      logInfo(`shrinkScaleOf(curveValue=130): actual=${actual}`);
      expect(actual).assertEqual(-12);
      logInfo(`${BUNDLE}ShrinkScaleOf_0033 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0034
     * @tc.name      ListBeExchange_ShrinkScaleOf_0034
     * @tc.desc      shrinkScaleOf(curveValue=135) returns -12.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0034 begin`);
      const actual: number = shrinkScaleOf(135);
      logInfo(`shrinkScaleOf(curveValue=135): actual=${actual}`);
      expect(actual).assertClose(-12.5, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0034 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0035
     * @tc.name      ListBeExchange_ShrinkScaleOf_0035
     * @tc.desc      shrinkScaleOf(curveValue=140) returns -13
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0035 begin`);
      const actual: number = shrinkScaleOf(140);
      logInfo(`shrinkScaleOf(curveValue=140): actual=${actual}`);
      expect(actual).assertEqual(-13);
      logInfo(`${BUNDLE}ShrinkScaleOf_0035 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0036
     * @tc.name      ListBeExchange_ShrinkScaleOf_0036
     * @tc.desc      shrinkScaleOf(curveValue=145) returns -13.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0036 begin`);
      const actual: number = shrinkScaleOf(145);
      logInfo(`shrinkScaleOf(curveValue=145): actual=${actual}`);
      expect(actual).assertClose(-13.5, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0036 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0037
     * @tc.name      ListBeExchange_ShrinkScaleOf_0037
     * @tc.desc      shrinkScaleOf(curveValue=150) returns -14
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0037 begin`);
      const actual: number = shrinkScaleOf(150);
      logInfo(`shrinkScaleOf(curveValue=150): actual=${actual}`);
      expect(actual).assertEqual(-14);
      logInfo(`${BUNDLE}ShrinkScaleOf_0037 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0038
     * @tc.name      ListBeExchange_ShrinkScaleOf_0038
     * @tc.desc      shrinkScaleOf(curveValue=155) returns -14.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0038 begin`);
      const actual: number = shrinkScaleOf(155);
      logInfo(`shrinkScaleOf(curveValue=155): actual=${actual}`);
      expect(actual).assertClose(-14.5, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0038 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0039
     * @tc.name      ListBeExchange_ShrinkScaleOf_0039
     * @tc.desc      shrinkScaleOf(curveValue=160) returns -15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0039 begin`);
      const actual: number = shrinkScaleOf(160);
      logInfo(`shrinkScaleOf(curveValue=160): actual=${actual}`);
      expect(actual).assertEqual(-15);
      logInfo(`${BUNDLE}ShrinkScaleOf_0039 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0040
     * @tc.name      ListBeExchange_ShrinkScaleOf_0040
     * @tc.desc      shrinkScaleOf(curveValue=165) returns -15.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0040 begin`);
      const actual: number = shrinkScaleOf(165);
      logInfo(`shrinkScaleOf(curveValue=165): actual=${actual}`);
      expect(actual).assertClose(-15.5, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0040 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0041
     * @tc.name      ListBeExchange_ShrinkScaleOf_0041
     * @tc.desc      shrinkScaleOf(curveValue=170) returns -16
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0041 begin`);
      const actual: number = shrinkScaleOf(170);
      logInfo(`shrinkScaleOf(curveValue=170): actual=${actual}`);
      expect(actual).assertEqual(-16);
      logInfo(`${BUNDLE}ShrinkScaleOf_0041 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0042
     * @tc.name      ListBeExchange_ShrinkScaleOf_0042
     * @tc.desc      shrinkScaleOf(curveValue=175) returns -16.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0042 begin`);
      const actual: number = shrinkScaleOf(175);
      logInfo(`shrinkScaleOf(curveValue=175): actual=${actual}`);
      expect(actual).assertClose(-16.5, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0042 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0043
     * @tc.name      ListBeExchange_ShrinkScaleOf_0043
     * @tc.desc      shrinkScaleOf(curveValue=180) returns -17
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0043 begin`);
      const actual: number = shrinkScaleOf(180);
      logInfo(`shrinkScaleOf(curveValue=180): actual=${actual}`);
      expect(actual).assertEqual(-17);
      logInfo(`${BUNDLE}ShrinkScaleOf_0043 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0044
     * @tc.name      ListBeExchange_ShrinkScaleOf_0044
     * @tc.desc      shrinkScaleOf(curveValue=185) returns -17.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0044 begin`);
      const actual: number = shrinkScaleOf(185);
      logInfo(`shrinkScaleOf(curveValue=185): actual=${actual}`);
      expect(actual).assertClose(-17.5, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0044 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0045
     * @tc.name      ListBeExchange_ShrinkScaleOf_0045
     * @tc.desc      shrinkScaleOf(curveValue=190) returns -18
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0045 begin`);
      const actual: number = shrinkScaleOf(190);
      logInfo(`shrinkScaleOf(curveValue=190): actual=${actual}`);
      expect(actual).assertEqual(-18);
      logInfo(`${BUNDLE}ShrinkScaleOf_0045 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0046
     * @tc.name      ListBeExchange_ShrinkScaleOf_0046
     * @tc.desc      shrinkScaleOf(curveValue=195) returns -18.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0046 begin`);
      const actual: number = shrinkScaleOf(195);
      logInfo(`shrinkScaleOf(curveValue=195): actual=${actual}`);
      expect(actual).assertClose(-18.5, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0046 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0047
     * @tc.name      ListBeExchange_ShrinkScaleOf_0047
     * @tc.desc      shrinkScaleOf(curveValue=200) returns -19
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0047 begin`);
      const actual: number = shrinkScaleOf(200);
      logInfo(`shrinkScaleOf(curveValue=200): actual=${actual}`);
      expect(actual).assertEqual(-19);
      logInfo(`${BUNDLE}ShrinkScaleOf_0047 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0048
     * @tc.name      ListBeExchange_ShrinkScaleOf_0048
     * @tc.desc      shrinkScaleOf(curveValue=84) returns -7.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0048 begin`);
      const actual: number = shrinkScaleOf(84);
      logInfo(`shrinkScaleOf(curveValue=84): actual=${actual}`);
      expect(actual).assertClose(-7.4, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0048 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0049
     * @tc.name      ListBeExchange_ShrinkScaleOf_0049
     * @tc.desc      shrinkScaleOf(curveValue=147) returns -13.7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0049 begin`);
      const actual: number = shrinkScaleOf(147);
      logInfo(`shrinkScaleOf(curveValue=147): actual=${actual}`);
      expect(actual).assertClose(-13.7, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0049 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0050
     * @tc.name      ListBeExchange_ShrinkScaleOf_0050
     * @tc.desc      shrinkScaleOf(curveValue=85.33) returns -7.5329999999999995
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0050 begin`);
      const actual: number = shrinkScaleOf(85.33);
      logInfo(`shrinkScaleOf(curveValue=85.33): actual=${actual}`);
      expect(actual).assertClose(-7.5329999999999995, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0050 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0051
     * @tc.name      ListBeExchange_ShrinkScaleOf_0051
     * @tc.desc      shrinkScaleOf(curveValue=58) returns -4.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0051 begin`);
      const actual: number = shrinkScaleOf(58);
      logInfo(`shrinkScaleOf(curveValue=58): actual=${actual}`);
      expect(actual).assertClose(-4.8, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0051 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0052
     * @tc.name      ListBeExchange_ShrinkScaleOf_0052
     * @tc.desc      shrinkScaleOf(curveValue=31.01) returns -2.101
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0052 begin`);
      const actual: number = shrinkScaleOf(31.01);
      logInfo(`shrinkScaleOf(curveValue=31.01): actual=${actual}`);
      expect(actual).assertClose(-2.101, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0052 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0053
     * @tc.name      ListBeExchange_ShrinkScaleOf_0053
     * @tc.desc      shrinkScaleOf(curveValue=179) returns -16.9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0053 begin`);
      const actual: number = shrinkScaleOf(179);
      logInfo(`shrinkScaleOf(curveValue=179): actual=${actual}`);
      expect(actual).assertClose(-16.9, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0053 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0054
     * @tc.name      ListBeExchange_ShrinkScaleOf_0054
     * @tc.desc      shrinkScaleOf(curveValue=-82) returns 9.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_ShrinkScaleOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0054 begin`);
      const actual: number = shrinkScaleOf(-82);
      logInfo(`shrinkScaleOf(curveValue=-82): actual=${actual}`);
      expect(actual).assertClose(9.2, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0054 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0055
     * @tc.name      ListBeExchange_ShrinkScaleOf_0055
     * @tc.desc      shrinkScaleOf(curveValue=50.97) returns -4.0969999999999995
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0055 begin`);
      const actual: number = shrinkScaleOf(50.97);
      logInfo(`shrinkScaleOf(curveValue=50.97): actual=${actual}`);
      expect(actual).assertClose(-4.0969999999999995, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0055 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0056
     * @tc.name      ListBeExchange_ShrinkScaleOf_0056
     * @tc.desc      shrinkScaleOf(curveValue=132) returns -12.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0056 begin`);
      const actual: number = shrinkScaleOf(132);
      logInfo(`shrinkScaleOf(curveValue=132): actual=${actual}`);
      expect(actual).assertClose(-12.2, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0056 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0057
     * @tc.name      ListBeExchange_ShrinkScaleOf_0057
     * @tc.desc      shrinkScaleOf(curveValue=126) returns -11.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0057 begin`);
      const actual: number = shrinkScaleOf(126);
      logInfo(`shrinkScaleOf(curveValue=126): actual=${actual}`);
      expect(actual).assertClose(-11.6, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0057 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0058
     * @tc.name      ListBeExchange_ShrinkScaleOf_0058
     * @tc.desc      shrinkScaleOf(curveValue=102) returns -9.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0058 begin`);
      const actual: number = shrinkScaleOf(102);
      logInfo(`shrinkScaleOf(curveValue=102): actual=${actual}`);
      expect(actual).assertClose(-9.2, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0058 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0059
     * @tc.name      ListBeExchange_ShrinkScaleOf_0059
     * @tc.desc      shrinkScaleOf(curveValue=35.32) returns -2.532
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0059 begin`);
      const actual: number = shrinkScaleOf(35.32);
      logInfo(`shrinkScaleOf(curveValue=35.32): actual=${actual}`);
      expect(actual).assertClose(-2.532, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0059 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0060
     * @tc.name      ListBeExchange_ShrinkScaleOf_0060
     * @tc.desc      shrinkScaleOf(curveValue=169) returns -15.899999999999999
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0060 begin`);
      const actual: number = shrinkScaleOf(169);
      logInfo(`shrinkScaleOf(curveValue=169): actual=${actual}`);
      expect(actual).assertClose(-15.899999999999999, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0060 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0061
     * @tc.name      ListBeExchange_ShrinkScaleOf_0061
     * @tc.desc      shrinkScaleOf(curveValue=86) returns -7.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0061 begin`);
      const actual: number = shrinkScaleOf(86);
      logInfo(`shrinkScaleOf(curveValue=86): actual=${actual}`);
      expect(actual).assertClose(-7.6, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0061 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0062
     * @tc.name      ListBeExchange_ShrinkScaleOf_0062
     * @tc.desc      shrinkScaleOf(curveValue=73.35) returns -6.334999999999999
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0062 begin`);
      const actual: number = shrinkScaleOf(73.35);
      logInfo(`shrinkScaleOf(curveValue=73.35): actual=${actual}`);
      expect(actual).assertClose(-6.334999999999999, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0062 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0063
     * @tc.name      ListBeExchange_ShrinkScaleOf_0063
     * @tc.desc      shrinkScaleOf(curveValue=-12) returns 2.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_ShrinkScaleOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0063 begin`);
      const actual: number = shrinkScaleOf(-12);
      logInfo(`shrinkScaleOf(curveValue=-12): actual=${actual}`);
      expect(actual).assertClose(2.2, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0063 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0064
     * @tc.name      ListBeExchange_ShrinkScaleOf_0064
     * @tc.desc      shrinkScaleOf(curveValue=78.83) returns -6.883
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0064 begin`);
      const actual: number = shrinkScaleOf(78.83);
      logInfo(`shrinkScaleOf(curveValue=78.83): actual=${actual}`);
      expect(actual).assertClose(-6.883, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0064 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0065
     * @tc.name      ListBeExchange_ShrinkScaleOf_0065
     * @tc.desc      shrinkScaleOf(curveValue=71) returns -6.1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0065 begin`);
      const actual: number = shrinkScaleOf(71);
      logInfo(`shrinkScaleOf(curveValue=71): actual=${actual}`);
      expect(actual).assertClose(-6.1, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0065 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0066
     * @tc.name      ListBeExchange_ShrinkScaleOf_0066
     * @tc.desc      shrinkScaleOf(curveValue=-86) returns 9.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_ShrinkScaleOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0066 begin`);
      const actual: number = shrinkScaleOf(-86);
      logInfo(`shrinkScaleOf(curveValue=-86): actual=${actual}`);
      expect(actual).assertClose(9.6, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0066 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0067
     * @tc.name      ListBeExchange_ShrinkScaleOf_0067
     * @tc.desc      shrinkScaleOf(curveValue=152) returns -14.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0067 begin`);
      const actual: number = shrinkScaleOf(152);
      logInfo(`shrinkScaleOf(curveValue=152): actual=${actual}`);
      expect(actual).assertClose(-14.2, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0067 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0068
     * @tc.name      ListBeExchange_ShrinkScaleOf_0068
     * @tc.desc      shrinkScaleOf(curveValue=188) returns -17.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0068 begin`);
      const actual: number = shrinkScaleOf(188);
      logInfo(`shrinkScaleOf(curveValue=188): actual=${actual}`);
      expect(actual).assertClose(-17.8, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0068 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0069
     * @tc.name      ListBeExchange_ShrinkScaleOf_0069
     * @tc.desc      shrinkScaleOf(curveValue=29.81) returns -1.9809999999999999
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0069 begin`);
      const actual: number = shrinkScaleOf(29.81);
      logInfo(`shrinkScaleOf(curveValue=29.81): actual=${actual}`);
      expect(actual).assertClose(-1.9809999999999999, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0069 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0070
     * @tc.name      ListBeExchange_ShrinkScaleOf_0070
     * @tc.desc      shrinkScaleOf(curveValue=14) returns -0.3999999999999999
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0070 begin`);
      const actual: number = shrinkScaleOf(14);
      logInfo(`shrinkScaleOf(curveValue=14): actual=${actual}`);
      expect(actual).assertClose(-0.3999999999999999, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0070 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0071
     * @tc.name      ListBeExchange_ShrinkScaleOf_0071
     * @tc.desc      shrinkScaleOf(curveValue=5.5) returns 0.44999999999999996
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0071 begin`);
      const actual: number = shrinkScaleOf(5.5);
      logInfo(`shrinkScaleOf(curveValue=5.5): actual=${actual}`);
      expect(actual).assertClose(0.44999999999999996, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0071 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0072
     * @tc.name      ListBeExchange_ShrinkScaleOf_0072
     * @tc.desc      shrinkScaleOf(curveValue=41) returns -3.0999999999999996
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0072 begin`);
      const actual: number = shrinkScaleOf(41);
      logInfo(`shrinkScaleOf(curveValue=41): actual=${actual}`);
      expect(actual).assertClose(-3.0999999999999996, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0072 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0073
     * @tc.name      ListBeExchange_ShrinkScaleOf_0073
     * @tc.desc      shrinkScaleOf(curveValue=-9) returns 1.9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_ShrinkScaleOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0073 begin`);
      const actual: number = shrinkScaleOf(-9);
      logInfo(`shrinkScaleOf(curveValue=-9): actual=${actual}`);
      expect(actual).assertClose(1.9, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0073 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0074
     * @tc.name      ListBeExchange_ShrinkScaleOf_0074
     * @tc.desc      shrinkScaleOf(curveValue=39.76) returns -2.976
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0074 begin`);
      const actual: number = shrinkScaleOf(39.76);
      logInfo(`shrinkScaleOf(curveValue=39.76): actual=${actual}`);
      expect(actual).assertClose(-2.976, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0074 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0075
     * @tc.name      ListBeExchange_ShrinkScaleOf_0075
     * @tc.desc      shrinkScaleOf(curveValue=32) returns -2.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0075 begin`);
      const actual: number = shrinkScaleOf(32);
      logInfo(`shrinkScaleOf(curveValue=32): actual=${actual}`);
      expect(actual).assertClose(-2.2, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0075 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0076
     * @tc.name      ListBeExchange_ShrinkScaleOf_0076
     * @tc.desc      shrinkScaleOf(curveValue=7.33) returns 0.267
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0076 begin`);
      const actual: number = shrinkScaleOf(7.33);
      logInfo(`shrinkScaleOf(curveValue=7.33): actual=${actual}`);
      expect(actual).assertClose(0.267, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0076 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0077
     * @tc.name      ListBeExchange_ShrinkScaleOf_0077
     * @tc.desc      shrinkScaleOf(curveValue=42.08) returns -3.208
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0077 begin`);
      const actual: number = shrinkScaleOf(42.08);
      logInfo(`shrinkScaleOf(curveValue=42.08): actual=${actual}`);
      expect(actual).assertClose(-3.208, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0077 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0078
     * @tc.name      ListBeExchange_ShrinkScaleOf_0078
     * @tc.desc      shrinkScaleOf(curveValue=196) returns -18.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0078 begin`);
      const actual: number = shrinkScaleOf(196);
      logInfo(`shrinkScaleOf(curveValue=196): actual=${actual}`);
      expect(actual).assertClose(-18.6, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0078 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0079
     * @tc.name      ListBeExchange_ShrinkScaleOf_0079
     * @tc.desc      shrinkScaleOf(curveValue=159) returns -14.9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0079 begin`);
      const actual: number = shrinkScaleOf(159);
      logInfo(`shrinkScaleOf(curveValue=159): actual=${actual}`);
      expect(actual).assertClose(-14.9, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0079 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0080
     * @tc.name      ListBeExchange_ShrinkScaleOf_0080
     * @tc.desc      shrinkScaleOf(curveValue=29) returns -1.9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0080 begin`);
      const actual: number = shrinkScaleOf(29);
      logInfo(`shrinkScaleOf(curveValue=29): actual=${actual}`);
      expect(actual).assertClose(-1.9, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0080 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0081
     * @tc.name      ListBeExchange_ShrinkScaleOf_0081
     * @tc.desc      shrinkScaleOf(curveValue=66.72) returns -5.672
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0081 begin`);
      const actual: number = shrinkScaleOf(66.72);
      logInfo(`shrinkScaleOf(curveValue=66.72): actual=${actual}`);
      expect(actual).assertClose(-5.672, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0081 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0082
     * @tc.name      ListBeExchange_ShrinkScaleOf_0082
     * @tc.desc      shrinkScaleOf(curveValue=38.58) returns -2.8579999999999997
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0082 begin`);
      const actual: number = shrinkScaleOf(38.58);
      logInfo(`shrinkScaleOf(curveValue=38.58): actual=${actual}`);
      expect(actual).assertClose(-2.8579999999999997, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0082 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0083
     * @tc.name      ListBeExchange_ShrinkScaleOf_0083
     * @tc.desc      shrinkScaleOf(curveValue=197) returns -18.7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0083 begin`);
      const actual: number = shrinkScaleOf(197);
      logInfo(`shrinkScaleOf(curveValue=197): actual=${actual}`);
      expect(actual).assertClose(-18.7, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0083 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0084
     * @tc.name      ListBeExchange_ShrinkScaleOf_0084
     * @tc.desc      shrinkScaleOf(curveValue=56.29) returns -4.629
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0084 begin`);
      const actual: number = shrinkScaleOf(56.29);
      logInfo(`shrinkScaleOf(curveValue=56.29): actual=${actual}`);
      expect(actual).assertClose(-4.629, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0084 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0085
     * @tc.name      ListBeExchange_ShrinkScaleOf_0085
     * @tc.desc      shrinkScaleOf(curveValue=8) returns 0.19999999999999996
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0085 begin`);
      const actual: number = shrinkScaleOf(8);
      logInfo(`shrinkScaleOf(curveValue=8): actual=${actual}`);
      expect(actual).assertClose(0.19999999999999996, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0085 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0086
     * @tc.name      ListBeExchange_ShrinkScaleOf_0086
     * @tc.desc      shrinkScaleOf(curveValue=-56) returns 6.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_ShrinkScaleOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0086 begin`);
      const actual: number = shrinkScaleOf(-56);
      logInfo(`shrinkScaleOf(curveValue=-56): actual=${actual}`);
      expect(actual).assertClose(6.6, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0086 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0087
     * @tc.name      ListBeExchange_ShrinkScaleOf_0087
     * @tc.desc      shrinkScaleOf(curveValue=173) returns -16.3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0087 begin`);
      const actual: number = shrinkScaleOf(173);
      logInfo(`shrinkScaleOf(curveValue=173): actual=${actual}`);
      expect(actual).assertClose(-16.3, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0087 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0088
     * @tc.name      ListBeExchange_ShrinkScaleOf_0088
     * @tc.desc      shrinkScaleOf(curveValue=15.06) returns -0.506
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0088 begin`);
      const actual: number = shrinkScaleOf(15.06);
      logInfo(`shrinkScaleOf(curveValue=15.06): actual=${actual}`);
      expect(actual).assertClose(-0.506, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0088 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0089
     * @tc.name      ListBeExchange_ShrinkScaleOf_0089
     * @tc.desc      shrinkScaleOf(curveValue=44) returns -3.4000000000000004
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0089 begin`);
      const actual: number = shrinkScaleOf(44);
      logInfo(`shrinkScaleOf(curveValue=44): actual=${actual}`);
      expect(actual).assertClose(-3.4000000000000004, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0089 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0090
     * @tc.name      ListBeExchange_ShrinkScaleOf_0090
     * @tc.desc      shrinkScaleOf(curveValue=-20) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_ShrinkScaleOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0090 begin`);
      const actual: number = shrinkScaleOf(-20);
      logInfo(`shrinkScaleOf(curveValue=-20): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}ShrinkScaleOf_0090 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0091
     * @tc.name      ListBeExchange_ShrinkScaleOf_0091
     * @tc.desc      shrinkScaleOf(curveValue=-62) returns 7.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_ShrinkScaleOf_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0091 begin`);
      const actual: number = shrinkScaleOf(-62);
      logInfo(`shrinkScaleOf(curveValue=-62): actual=${actual}`);
      expect(actual).assertClose(7.2, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0091 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0092
     * @tc.name      ListBeExchange_ShrinkScaleOf_0092
     * @tc.desc      shrinkScaleOf(curveValue=177) returns -16.7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0092 begin`);
      const actual: number = shrinkScaleOf(177);
      logInfo(`shrinkScaleOf(curveValue=177): actual=${actual}`);
      expect(actual).assertClose(-16.7, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0092 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0093
     * @tc.name      ListBeExchange_ShrinkScaleOf_0093
     * @tc.desc      shrinkScaleOf(curveValue=-17) returns 2.7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_ShrinkScaleOf_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0093 begin`);
      const actual: number = shrinkScaleOf(-17);
      logInfo(`shrinkScaleOf(curveValue=-17): actual=${actual}`);
      expect(actual).assertClose(2.7, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0093 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0094
     * @tc.name      ListBeExchange_ShrinkScaleOf_0094
     * @tc.desc      shrinkScaleOf(curveValue=4) returns 0.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0094 begin`);
      const actual: number = shrinkScaleOf(4);
      logInfo(`shrinkScaleOf(curveValue=4): actual=${actual}`);
      expect(actual).assertClose(0.6, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0094 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0095
     * @tc.name      ListBeExchange_ShrinkScaleOf_0095
     * @tc.desc      shrinkScaleOf(curveValue=-4) returns 1.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_ShrinkScaleOf_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0095 begin`);
      const actual: number = shrinkScaleOf(-4);
      logInfo(`shrinkScaleOf(curveValue=-4): actual=${actual}`);
      expect(actual).assertClose(1.4, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0095 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0096
     * @tc.name      ListBeExchange_ShrinkScaleOf_0096
     * @tc.desc      shrinkScaleOf(curveValue=89) returns -7.9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0096 begin`);
      const actual: number = shrinkScaleOf(89);
      logInfo(`shrinkScaleOf(curveValue=89): actual=${actual}`);
      expect(actual).assertClose(-7.9, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0096 end`);
    });
  });
}
