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
import { curveInputOf } from '../model/ListExchangeLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ListBeExchange]';
const BUNDLE: string = 'ListBeExchange_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for curveInputOf (96 cases). */
export default function curveInputOfTest(): void {
  describe('CurveInputOfTest', (): void => {
    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0001
     * @tc.name      ListBeExchange_CurveInputOf_0001
     * @tc.desc      curveInputOf(offsetY=-100) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ListBeExchange_CurveInputOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0001 begin`);
      const actual: number = curveInputOf(-100);
      logInfo(`curveInputOf(offsetY=-100): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}CurveInputOf_0001 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0002
     * @tc.name      ListBeExchange_CurveInputOf_0002
     * @tc.desc      curveInputOf(offsetY=-1) returns 0.02
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ListBeExchange_CurveInputOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0002 begin`);
      const actual: number = curveInputOf(-1);
      logInfo(`curveInputOf(offsetY=-1): actual=${actual}`);
      expect(actual).assertClose(0.02, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0002 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0003
     * @tc.name      ListBeExchange_CurveInputOf_0003
     * @tc.desc      curveInputOf(offsetY=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0003 begin`);
      const actual: number = curveInputOf(0);
      logInfo(`curveInputOf(offsetY=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CurveInputOf_0003 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0004
     * @tc.name      ListBeExchange_CurveInputOf_0004
     * @tc.desc      curveInputOf(offsetY=50) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0004 begin`);
      const actual: number = curveInputOf(50);
      logInfo(`curveInputOf(offsetY=50): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}CurveInputOf_0004 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0005
     * @tc.name      ListBeExchange_CurveInputOf_0005
     * @tc.desc      curveInputOf(offsetY=2) returns 0.04
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0005 begin`);
      const actual: number = curveInputOf(2);
      logInfo(`curveInputOf(offsetY=2): actual=${actual}`);
      expect(actual).assertClose(0.04, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0005 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0006
     * @tc.name      ListBeExchange_CurveInputOf_0006
     * @tc.desc      curveInputOf(offsetY=3) returns 0.06
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0006 begin`);
      const actual: number = curveInputOf(3);
      logInfo(`curveInputOf(offsetY=3): actual=${actual}`);
      expect(actual).assertClose(0.06, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0006 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0007
     * @tc.name      ListBeExchange_CurveInputOf_0007
     * @tc.desc      curveInputOf(offsetY=10) returns 0.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0007 begin`);
      const actual: number = curveInputOf(10);
      logInfo(`curveInputOf(offsetY=10): actual=${actual}`);
      expect(actual).assertClose(0.2, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0007 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0008
     * @tc.name      ListBeExchange_CurveInputOf_0008
     * @tc.desc      curveInputOf(offsetY=5) returns 0.1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0008 begin`);
      const actual: number = curveInputOf(5);
      logInfo(`curveInputOf(offsetY=5): actual=${actual}`);
      expect(actual).assertClose(0.1, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0008 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0009
     * @tc.name      ListBeExchange_CurveInputOf_0009
     * @tc.desc      curveInputOf(offsetY=15) returns 0.3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0009 begin`);
      const actual: number = curveInputOf(15);
      logInfo(`curveInputOf(offsetY=15): actual=${actual}`);
      expect(actual).assertClose(0.3, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0009 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0010
     * @tc.name      ListBeExchange_CurveInputOf_0010
     * @tc.desc      curveInputOf(offsetY=20) returns 0.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0010 begin`);
      const actual: number = curveInputOf(20);
      logInfo(`curveInputOf(offsetY=20): actual=${actual}`);
      expect(actual).assertClose(0.4, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0010 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0011
     * @tc.name      ListBeExchange_CurveInputOf_0011
     * @tc.desc      curveInputOf(offsetY=25) returns 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0011 begin`);
      const actual: number = curveInputOf(25);
      logInfo(`curveInputOf(offsetY=25): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0011 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0012
     * @tc.name      ListBeExchange_CurveInputOf_0012
     * @tc.desc      curveInputOf(offsetY=30) returns 0.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0012 begin`);
      const actual: number = curveInputOf(30);
      logInfo(`curveInputOf(offsetY=30): actual=${actual}`);
      expect(actual).assertClose(0.6, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0012 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0013
     * @tc.name      ListBeExchange_CurveInputOf_0013
     * @tc.desc      curveInputOf(offsetY=35) returns 0.7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0013 begin`);
      const actual: number = curveInputOf(35);
      logInfo(`curveInputOf(offsetY=35): actual=${actual}`);
      expect(actual).assertClose(0.7, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0013 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0014
     * @tc.name      ListBeExchange_CurveInputOf_0014
     * @tc.desc      curveInputOf(offsetY=40) returns 0.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0014 begin`);
      const actual: number = curveInputOf(40);
      logInfo(`curveInputOf(offsetY=40): actual=${actual}`);
      expect(actual).assertClose(0.8, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0014 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0015
     * @tc.name      ListBeExchange_CurveInputOf_0015
     * @tc.desc      curveInputOf(offsetY=45) returns 0.9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0015 begin`);
      const actual: number = curveInputOf(45);
      logInfo(`curveInputOf(offsetY=45): actual=${actual}`);
      expect(actual).assertClose(0.9, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0015 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0016
     * @tc.name      ListBeExchange_CurveInputOf_0016
     * @tc.desc      curveInputOf(offsetY=55) returns 1.1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0016 begin`);
      const actual: number = curveInputOf(55);
      logInfo(`curveInputOf(offsetY=55): actual=${actual}`);
      expect(actual).assertClose(1.1, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0016 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0017
     * @tc.name      ListBeExchange_CurveInputOf_0017
     * @tc.desc      curveInputOf(offsetY=60) returns 1.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0017 begin`);
      const actual: number = curveInputOf(60);
      logInfo(`curveInputOf(offsetY=60): actual=${actual}`);
      expect(actual).assertClose(1.2, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0017 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0018
     * @tc.name      ListBeExchange_CurveInputOf_0018
     * @tc.desc      curveInputOf(offsetY=65) returns 1.3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0018 begin`);
      const actual: number = curveInputOf(65);
      logInfo(`curveInputOf(offsetY=65): actual=${actual}`);
      expect(actual).assertClose(1.3, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0018 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0019
     * @tc.name      ListBeExchange_CurveInputOf_0019
     * @tc.desc      curveInputOf(offsetY=70) returns 1.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0019 begin`);
      const actual: number = curveInputOf(70);
      logInfo(`curveInputOf(offsetY=70): actual=${actual}`);
      expect(actual).assertClose(1.4, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0019 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0020
     * @tc.name      ListBeExchange_CurveInputOf_0020
     * @tc.desc      curveInputOf(offsetY=75) returns 1.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0020 begin`);
      const actual: number = curveInputOf(75);
      logInfo(`curveInputOf(offsetY=75): actual=${actual}`);
      expect(actual).assertClose(1.5, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0020 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0021
     * @tc.name      ListBeExchange_CurveInputOf_0021
     * @tc.desc      curveInputOf(offsetY=80) returns 1.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0021 begin`);
      const actual: number = curveInputOf(80);
      logInfo(`curveInputOf(offsetY=80): actual=${actual}`);
      expect(actual).assertClose(1.6, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0021 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0022
     * @tc.name      ListBeExchange_CurveInputOf_0022
     * @tc.desc      curveInputOf(offsetY=85) returns 1.7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0022 begin`);
      const actual: number = curveInputOf(85);
      logInfo(`curveInputOf(offsetY=85): actual=${actual}`);
      expect(actual).assertClose(1.7, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0022 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0023
     * @tc.name      ListBeExchange_CurveInputOf_0023
     * @tc.desc      curveInputOf(offsetY=90) returns 1.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0023 begin`);
      const actual: number = curveInputOf(90);
      logInfo(`curveInputOf(offsetY=90): actual=${actual}`);
      expect(actual).assertClose(1.8, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0023 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0024
     * @tc.name      ListBeExchange_CurveInputOf_0024
     * @tc.desc      curveInputOf(offsetY=95) returns 1.9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0024 begin`);
      const actual: number = curveInputOf(95);
      logInfo(`curveInputOf(offsetY=95): actual=${actual}`);
      expect(actual).assertClose(1.9, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0024 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0025
     * @tc.name      ListBeExchange_CurveInputOf_0025
     * @tc.desc      curveInputOf(offsetY=105) returns 2.1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0025 begin`);
      const actual: number = curveInputOf(105);
      logInfo(`curveInputOf(offsetY=105): actual=${actual}`);
      expect(actual).assertClose(2.1, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0025 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0026
     * @tc.name      ListBeExchange_CurveInputOf_0026
     * @tc.desc      curveInputOf(offsetY=110) returns 2.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0026 begin`);
      const actual: number = curveInputOf(110);
      logInfo(`curveInputOf(offsetY=110): actual=${actual}`);
      expect(actual).assertClose(2.2, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0026 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0027
     * @tc.name      ListBeExchange_CurveInputOf_0027
     * @tc.desc      curveInputOf(offsetY=115) returns 2.3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0027 begin`);
      const actual: number = curveInputOf(115);
      logInfo(`curveInputOf(offsetY=115): actual=${actual}`);
      expect(actual).assertClose(2.3, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0027 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0028
     * @tc.name      ListBeExchange_CurveInputOf_0028
     * @tc.desc      curveInputOf(offsetY=120) returns 2.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0028 begin`);
      const actual: number = curveInputOf(120);
      logInfo(`curveInputOf(offsetY=120): actual=${actual}`);
      expect(actual).assertClose(2.4, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0028 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0029
     * @tc.name      ListBeExchange_CurveInputOf_0029
     * @tc.desc      curveInputOf(offsetY=125) returns 2.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0029 begin`);
      const actual: number = curveInputOf(125);
      logInfo(`curveInputOf(offsetY=125): actual=${actual}`);
      expect(actual).assertClose(2.5, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0029 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0030
     * @tc.name      ListBeExchange_CurveInputOf_0030
     * @tc.desc      curveInputOf(offsetY=130) returns 2.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0030 begin`);
      const actual: number = curveInputOf(130);
      logInfo(`curveInputOf(offsetY=130): actual=${actual}`);
      expect(actual).assertClose(2.6, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0030 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0031
     * @tc.name      ListBeExchange_CurveInputOf_0031
     * @tc.desc      curveInputOf(offsetY=135) returns 2.7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0031 begin`);
      const actual: number = curveInputOf(135);
      logInfo(`curveInputOf(offsetY=135): actual=${actual}`);
      expect(actual).assertClose(2.7, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0031 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0032
     * @tc.name      ListBeExchange_CurveInputOf_0032
     * @tc.desc      curveInputOf(offsetY=140) returns 2.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0032 begin`);
      const actual: number = curveInputOf(140);
      logInfo(`curveInputOf(offsetY=140): actual=${actual}`);
      expect(actual).assertClose(2.8, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0032 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0033
     * @tc.name      ListBeExchange_CurveInputOf_0033
     * @tc.desc      curveInputOf(offsetY=145) returns 2.9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0033 begin`);
      const actual: number = curveInputOf(145);
      logInfo(`curveInputOf(offsetY=145): actual=${actual}`);
      expect(actual).assertClose(2.9, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0033 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0034
     * @tc.name      ListBeExchange_CurveInputOf_0034
     * @tc.desc      curveInputOf(offsetY=150) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0034 begin`);
      const actual: number = curveInputOf(150);
      logInfo(`curveInputOf(offsetY=150): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}CurveInputOf_0034 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0035
     * @tc.name      ListBeExchange_CurveInputOf_0035
     * @tc.desc      curveInputOf(offsetY=155) returns 3.1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0035 begin`);
      const actual: number = curveInputOf(155);
      logInfo(`curveInputOf(offsetY=155): actual=${actual}`);
      expect(actual).assertClose(3.1, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0035 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0036
     * @tc.name      ListBeExchange_CurveInputOf_0036
     * @tc.desc      curveInputOf(offsetY=160) returns 3.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0036 begin`);
      const actual: number = curveInputOf(160);
      logInfo(`curveInputOf(offsetY=160): actual=${actual}`);
      expect(actual).assertClose(3.2, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0036 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0037
     * @tc.name      ListBeExchange_CurveInputOf_0037
     * @tc.desc      curveInputOf(offsetY=165) returns 3.3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0037 begin`);
      const actual: number = curveInputOf(165);
      logInfo(`curveInputOf(offsetY=165): actual=${actual}`);
      expect(actual).assertClose(3.3, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0037 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0038
     * @tc.name      ListBeExchange_CurveInputOf_0038
     * @tc.desc      curveInputOf(offsetY=170) returns 3.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0038 begin`);
      const actual: number = curveInputOf(170);
      logInfo(`curveInputOf(offsetY=170): actual=${actual}`);
      expect(actual).assertClose(3.4, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0038 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0039
     * @tc.name      ListBeExchange_CurveInputOf_0039
     * @tc.desc      curveInputOf(offsetY=175) returns 3.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0039 begin`);
      const actual: number = curveInputOf(175);
      logInfo(`curveInputOf(offsetY=175): actual=${actual}`);
      expect(actual).assertClose(3.5, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0039 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0040
     * @tc.name      ListBeExchange_CurveInputOf_0040
     * @tc.desc      curveInputOf(offsetY=180) returns 3.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0040 begin`);
      const actual: number = curveInputOf(180);
      logInfo(`curveInputOf(offsetY=180): actual=${actual}`);
      expect(actual).assertClose(3.6, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0040 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0041
     * @tc.name      ListBeExchange_CurveInputOf_0041
     * @tc.desc      curveInputOf(offsetY=185) returns 3.7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0041 begin`);
      const actual: number = curveInputOf(185);
      logInfo(`curveInputOf(offsetY=185): actual=${actual}`);
      expect(actual).assertClose(3.7, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0041 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0042
     * @tc.name      ListBeExchange_CurveInputOf_0042
     * @tc.desc      curveInputOf(offsetY=190) returns 3.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0042 begin`);
      const actual: number = curveInputOf(190);
      logInfo(`curveInputOf(offsetY=190): actual=${actual}`);
      expect(actual).assertClose(3.8, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0042 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0043
     * @tc.name      ListBeExchange_CurveInputOf_0043
     * @tc.desc      curveInputOf(offsetY=195) returns 3.9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0043 begin`);
      const actual: number = curveInputOf(195);
      logInfo(`curveInputOf(offsetY=195): actual=${actual}`);
      expect(actual).assertClose(3.9, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0043 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0044
     * @tc.name      ListBeExchange_CurveInputOf_0044
     * @tc.desc      curveInputOf(offsetY=200) returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0044 begin`);
      const actual: number = curveInputOf(200);
      logInfo(`curveInputOf(offsetY=200): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}CurveInputOf_0044 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0045
     * @tc.name      ListBeExchange_CurveInputOf_0045
     * @tc.desc      curveInputOf(offsetY=-13) returns 0.26
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_CurveInputOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0045 begin`);
      const actual: number = curveInputOf(-13);
      logInfo(`curveInputOf(offsetY=-13): actual=${actual}`);
      expect(actual).assertClose(0.26, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0045 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0046
     * @tc.name      ListBeExchange_CurveInputOf_0046
     * @tc.desc      curveInputOf(offsetY=34) returns 0.68
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0046 begin`);
      const actual: number = curveInputOf(34);
      logInfo(`curveInputOf(offsetY=34): actual=${actual}`);
      expect(actual).assertClose(0.68, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0046 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0047
     * @tc.name      ListBeExchange_CurveInputOf_0047
     * @tc.desc      curveInputOf(offsetY=188) returns 3.76
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0047 begin`);
      const actual: number = curveInputOf(188);
      logInfo(`curveInputOf(offsetY=188): actual=${actual}`);
      expect(actual).assertClose(3.76, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0047 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0048
     * @tc.name      ListBeExchange_CurveInputOf_0048
     * @tc.desc      curveInputOf(offsetY=-6) returns 0.12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_CurveInputOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0048 begin`);
      const actual: number = curveInputOf(-6);
      logInfo(`curveInputOf(offsetY=-6): actual=${actual}`);
      expect(actual).assertClose(0.12, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0048 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0049
     * @tc.name      ListBeExchange_CurveInputOf_0049
     * @tc.desc      curveInputOf(offsetY=36.91) returns 0.7382
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0049 begin`);
      const actual: number = curveInputOf(36.91);
      logInfo(`curveInputOf(offsetY=36.91): actual=${actual}`);
      expect(actual).assertClose(0.7382, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0049 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0050
     * @tc.name      ListBeExchange_CurveInputOf_0050
     * @tc.desc      curveInputOf(offsetY=58.16) returns 1.1632
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0050 begin`);
      const actual: number = curveInputOf(58.16);
      logInfo(`curveInputOf(offsetY=58.16): actual=${actual}`);
      expect(actual).assertClose(1.1632, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0050 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0051
     * @tc.name      ListBeExchange_CurveInputOf_0051
     * @tc.desc      curveInputOf(offsetY=-16) returns 0.32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_CurveInputOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0051 begin`);
      const actual: number = curveInputOf(-16);
      logInfo(`curveInputOf(offsetY=-16): actual=${actual}`);
      expect(actual).assertClose(0.32, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0051 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0052
     * @tc.name      ListBeExchange_CurveInputOf_0052
     * @tc.desc      curveInputOf(offsetY=88.59) returns 1.7718
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0052 begin`);
      const actual: number = curveInputOf(88.59);
      logInfo(`curveInputOf(offsetY=88.59): actual=${actual}`);
      expect(actual).assertClose(1.7718, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0052 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0053
     * @tc.name      ListBeExchange_CurveInputOf_0053
     * @tc.desc      curveInputOf(offsetY=77) returns 1.54
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0053 begin`);
      const actual: number = curveInputOf(77);
      logInfo(`curveInputOf(offsetY=77): actual=${actual}`);
      expect(actual).assertClose(1.54, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0053 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0054
     * @tc.name      ListBeExchange_CurveInputOf_0054
     * @tc.desc      curveInputOf(offsetY=173) returns 3.46
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0054 begin`);
      const actual: number = curveInputOf(173);
      logInfo(`curveInputOf(offsetY=173): actual=${actual}`);
      expect(actual).assertClose(3.46, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0054 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0055
     * @tc.name      ListBeExchange_CurveInputOf_0055
     * @tc.desc      curveInputOf(offsetY=108) returns 2.16
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0055 begin`);
      const actual: number = curveInputOf(108);
      logInfo(`curveInputOf(offsetY=108): actual=${actual}`);
      expect(actual).assertClose(2.16, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0055 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0056
     * @tc.name      ListBeExchange_CurveInputOf_0056
     * @tc.desc      curveInputOf(offsetY=167) returns 3.34
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0056 begin`);
      const actual: number = curveInputOf(167);
      logInfo(`curveInputOf(offsetY=167): actual=${actual}`);
      expect(actual).assertClose(3.34, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0056 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0057
     * @tc.name      ListBeExchange_CurveInputOf_0057
     * @tc.desc      curveInputOf(offsetY=17) returns 0.34
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0057 begin`);
      const actual: number = curveInputOf(17);
      logInfo(`curveInputOf(offsetY=17): actual=${actual}`);
      expect(actual).assertClose(0.34, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0057 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0058
     * @tc.name      ListBeExchange_CurveInputOf_0058
     * @tc.desc      curveInputOf(offsetY=-79) returns 1.58
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_CurveInputOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0058 begin`);
      const actual: number = curveInputOf(-79);
      logInfo(`curveInputOf(offsetY=-79): actual=${actual}`);
      expect(actual).assertClose(1.58, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0058 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0059
     * @tc.name      ListBeExchange_CurveInputOf_0059
     * @tc.desc      curveInputOf(offsetY=31.82) returns 0.6364
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0059 begin`);
      const actual: number = curveInputOf(31.82);
      logInfo(`curveInputOf(offsetY=31.82): actual=${actual}`);
      expect(actual).assertClose(0.6364, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0059 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0060
     * @tc.name      ListBeExchange_CurveInputOf_0060
     * @tc.desc      curveInputOf(offsetY=17.46) returns 0.3492
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0060 begin`);
      const actual: number = curveInputOf(17.46);
      logInfo(`curveInputOf(offsetY=17.46): actual=${actual}`);
      expect(actual).assertClose(0.3492, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0060 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0061
     * @tc.name      ListBeExchange_CurveInputOf_0061
     * @tc.desc      curveInputOf(offsetY=62.39) returns 1.2478
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0061 begin`);
      const actual: number = curveInputOf(62.39);
      logInfo(`curveInputOf(offsetY=62.39): actual=${actual}`);
      expect(actual).assertClose(1.2478, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0061 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0062
     * @tc.name      ListBeExchange_CurveInputOf_0062
     * @tc.desc      curveInputOf(offsetY=97) returns 1.94
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0062 begin`);
      const actual: number = curveInputOf(97);
      logInfo(`curveInputOf(offsetY=97): actual=${actual}`);
      expect(actual).assertClose(1.94, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0062 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0063
     * @tc.name      ListBeExchange_CurveInputOf_0063
     * @tc.desc      curveInputOf(offsetY=39) returns 0.78
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0063 begin`);
      const actual: number = curveInputOf(39);
      logInfo(`curveInputOf(offsetY=39): actual=${actual}`);
      expect(actual).assertClose(0.78, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0063 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0064
     * @tc.name      ListBeExchange_CurveInputOf_0064
     * @tc.desc      curveInputOf(offsetY=157) returns 3.14
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0064 begin`);
      const actual: number = curveInputOf(157);
      logInfo(`curveInputOf(offsetY=157): actual=${actual}`);
      expect(actual).assertClose(3.14, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0064 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0065
     * @tc.name      ListBeExchange_CurveInputOf_0065
     * @tc.desc      curveInputOf(offsetY=113) returns 2.26
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0065 begin`);
      const actual: number = curveInputOf(113);
      logInfo(`curveInputOf(offsetY=113): actual=${actual}`);
      expect(actual).assertClose(2.26, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0065 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0066
     * @tc.name      ListBeExchange_CurveInputOf_0066
     * @tc.desc      curveInputOf(offsetY=-18) returns 0.36
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_CurveInputOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0066 begin`);
      const actual: number = curveInputOf(-18);
      logInfo(`curveInputOf(offsetY=-18): actual=${actual}`);
      expect(actual).assertClose(0.36, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0066 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0067
     * @tc.name      ListBeExchange_CurveInputOf_0067
     * @tc.desc      curveInputOf(offsetY=52.56) returns 1.0512000000000001
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0067 begin`);
      const actual: number = curveInputOf(52.56);
      logInfo(`curveInputOf(offsetY=52.56): actual=${actual}`);
      expect(actual).assertClose(1.0512000000000001, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0067 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0068
     * @tc.name      ListBeExchange_CurveInputOf_0068
     * @tc.desc      curveInputOf(offsetY=23) returns 0.46
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0068 begin`);
      const actual: number = curveInputOf(23);
      logInfo(`curveInputOf(offsetY=23): actual=${actual}`);
      expect(actual).assertClose(0.46, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0068 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0069
     * @tc.name      ListBeExchange_CurveInputOf_0069
     * @tc.desc      curveInputOf(offsetY=36) returns 0.72
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0069 begin`);
      const actual: number = curveInputOf(36);
      logInfo(`curveInputOf(offsetY=36): actual=${actual}`);
      expect(actual).assertClose(0.72, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0069 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0070
     * @tc.name      ListBeExchange_CurveInputOf_0070
     * @tc.desc      curveInputOf(offsetY=101) returns 2.02
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0070 begin`);
      const actual: number = curveInputOf(101);
      logInfo(`curveInputOf(offsetY=101): actual=${actual}`);
      expect(actual).assertClose(2.02, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0070 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0071
     * @tc.name      ListBeExchange_CurveInputOf_0071
     * @tc.desc      curveInputOf(offsetY=37) returns 0.74
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0071 begin`);
      const actual: number = curveInputOf(37);
      logInfo(`curveInputOf(offsetY=37): actual=${actual}`);
      expect(actual).assertClose(0.74, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0071 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0072
     * @tc.name      ListBeExchange_CurveInputOf_0072
     * @tc.desc      curveInputOf(offsetY=161) returns 3.22
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0072 begin`);
      const actual: number = curveInputOf(161);
      logInfo(`curveInputOf(offsetY=161): actual=${actual}`);
      expect(actual).assertClose(3.22, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0072 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0073
     * @tc.name      ListBeExchange_CurveInputOf_0073
     * @tc.desc      curveInputOf(offsetY=158) returns 3.16
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0073 begin`);
      const actual: number = curveInputOf(158);
      logInfo(`curveInputOf(offsetY=158): actual=${actual}`);
      expect(actual).assertClose(3.16, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0073 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0074
     * @tc.name      ListBeExchange_CurveInputOf_0074
     * @tc.desc      curveInputOf(offsetY=84) returns 1.68
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0074 begin`);
      const actual: number = curveInputOf(84);
      logInfo(`curveInputOf(offsetY=84): actual=${actual}`);
      expect(actual).assertClose(1.68, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0074 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0075
     * @tc.name      ListBeExchange_CurveInputOf_0075
     * @tc.desc      curveInputOf(offsetY=59) returns 1.18
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0075 begin`);
      const actual: number = curveInputOf(59);
      logInfo(`curveInputOf(offsetY=59): actual=${actual}`);
      expect(actual).assertClose(1.18, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0075 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0076
     * @tc.name      ListBeExchange_CurveInputOf_0076
     * @tc.desc      curveInputOf(offsetY=51) returns 1.02
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0076 begin`);
      const actual: number = curveInputOf(51);
      logInfo(`curveInputOf(offsetY=51): actual=${actual}`);
      expect(actual).assertClose(1.02, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0076 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0077
     * @tc.name      ListBeExchange_CurveInputOf_0077
     * @tc.desc      curveInputOf(offsetY=8.93) returns 0.17859999999999998
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0077 begin`);
      const actual: number = curveInputOf(8.93);
      logInfo(`curveInputOf(offsetY=8.93): actual=${actual}`);
      expect(actual).assertClose(0.17859999999999998, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0077 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0078
     * @tc.name      ListBeExchange_CurveInputOf_0078
     * @tc.desc      curveInputOf(offsetY=92.77) returns 1.8554
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0078 begin`);
      const actual: number = curveInputOf(92.77);
      logInfo(`curveInputOf(offsetY=92.77): actual=${actual}`);
      expect(actual).assertClose(1.8554, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0078 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0079
     * @tc.name      ListBeExchange_CurveInputOf_0079
     * @tc.desc      curveInputOf(offsetY=166) returns 3.32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0079 begin`);
      const actual: number = curveInputOf(166);
      logInfo(`curveInputOf(offsetY=166): actual=${actual}`);
      expect(actual).assertClose(3.32, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0079 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0080
     * @tc.name      ListBeExchange_CurveInputOf_0080
     * @tc.desc      curveInputOf(offsetY=49.71) returns 0.9942
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0080 begin`);
      const actual: number = curveInputOf(49.71);
      logInfo(`curveInputOf(offsetY=49.71): actual=${actual}`);
      expect(actual).assertClose(0.9942, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0080 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0081
     * @tc.name      ListBeExchange_CurveInputOf_0081
     * @tc.desc      curveInputOf(offsetY=-57) returns 1.14
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_CurveInputOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0081 begin`);
      const actual: number = curveInputOf(-57);
      logInfo(`curveInputOf(offsetY=-57): actual=${actual}`);
      expect(actual).assertClose(1.14, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0081 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0082
     * @tc.name      ListBeExchange_CurveInputOf_0082
     * @tc.desc      curveInputOf(offsetY=147) returns 2.94
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0082 begin`);
      const actual: number = curveInputOf(147);
      logInfo(`curveInputOf(offsetY=147): actual=${actual}`);
      expect(actual).assertClose(2.94, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0082 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0083
     * @tc.name      ListBeExchange_CurveInputOf_0083
     * @tc.desc      curveInputOf(offsetY=-98) returns 1.96
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_CurveInputOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0083 begin`);
      const actual: number = curveInputOf(-98);
      logInfo(`curveInputOf(offsetY=-98): actual=${actual}`);
      expect(actual).assertClose(1.96, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0083 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0084
     * @tc.name      ListBeExchange_CurveInputOf_0084
     * @tc.desc      curveInputOf(offsetY=64.26) returns 1.2852000000000001
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0084 begin`);
      const actual: number = curveInputOf(64.26);
      logInfo(`curveInputOf(offsetY=64.26): actual=${actual}`);
      expect(actual).assertClose(1.2852000000000001, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0084 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0085
     * @tc.name      ListBeExchange_CurveInputOf_0085
     * @tc.desc      curveInputOf(offsetY=78.75) returns 1.575
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0085 begin`);
      const actual: number = curveInputOf(78.75);
      logInfo(`curveInputOf(offsetY=78.75): actual=${actual}`);
      expect(actual).assertClose(1.575, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0085 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0086
     * @tc.name      ListBeExchange_CurveInputOf_0086
     * @tc.desc      curveInputOf(offsetY=47) returns 0.94
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0086 begin`);
      const actual: number = curveInputOf(47);
      logInfo(`curveInputOf(offsetY=47): actual=${actual}`);
      expect(actual).assertClose(0.94, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0086 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0087
     * @tc.name      ListBeExchange_CurveInputOf_0087
     * @tc.desc      curveInputOf(offsetY=66) returns 1.32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0087 begin`);
      const actual: number = curveInputOf(66);
      logInfo(`curveInputOf(offsetY=66): actual=${actual}`);
      expect(actual).assertClose(1.32, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0087 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0088
     * @tc.name      ListBeExchange_CurveInputOf_0088
     * @tc.desc      curveInputOf(offsetY=-53) returns 1.06
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_CurveInputOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0088 begin`);
      const actual: number = curveInputOf(-53);
      logInfo(`curveInputOf(offsetY=-53): actual=${actual}`);
      expect(actual).assertClose(1.06, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0088 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0089
     * @tc.name      ListBeExchange_CurveInputOf_0089
     * @tc.desc      curveInputOf(offsetY=63) returns 1.26
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0089 begin`);
      const actual: number = curveInputOf(63);
      logInfo(`curveInputOf(offsetY=63): actual=${actual}`);
      expect(actual).assertClose(1.26, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0089 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0090
     * @tc.name      ListBeExchange_CurveInputOf_0090
     * @tc.desc      curveInputOf(offsetY=44.86) returns 0.8972
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0090 begin`);
      const actual: number = curveInputOf(44.86);
      logInfo(`curveInputOf(offsetY=44.86): actual=${actual}`);
      expect(actual).assertClose(0.8972, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0090 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0091
     * @tc.name      ListBeExchange_CurveInputOf_0091
     * @tc.desc      curveInputOf(offsetY=-32) returns 0.64
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_CurveInputOf_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0091 begin`);
      const actual: number = curveInputOf(-32);
      logInfo(`curveInputOf(offsetY=-32): actual=${actual}`);
      expect(actual).assertClose(0.64, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0091 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0092
     * @tc.name      ListBeExchange_CurveInputOf_0092
     * @tc.desc      curveInputOf(offsetY=4.07) returns 0.0814
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0092 begin`);
      const actual: number = curveInputOf(4.07);
      logInfo(`curveInputOf(offsetY=4.07): actual=${actual}`);
      expect(actual).assertClose(0.0814, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0092 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0093
     * @tc.name      ListBeExchange_CurveInputOf_0093
     * @tc.desc      curveInputOf(offsetY=70.8) returns 1.416
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0093 begin`);
      const actual: number = curveInputOf(70.8);
      logInfo(`curveInputOf(offsetY=70.8): actual=${actual}`);
      expect(actual).assertClose(1.416, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0093 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0094
     * @tc.name      ListBeExchange_CurveInputOf_0094
     * @tc.desc      curveInputOf(offsetY=60.74) returns 1.2148
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0094 begin`);
      const actual: number = curveInputOf(60.74);
      logInfo(`curveInputOf(offsetY=60.74): actual=${actual}`);
      expect(actual).assertClose(1.2148, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0094 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0095
     * @tc.name      ListBeExchange_CurveInputOf_0095
     * @tc.desc      curveInputOf(offsetY=82.39) returns 1.6478
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0095 begin`);
      const actual: number = curveInputOf(82.39);
      logInfo(`curveInputOf(offsetY=82.39): actual=${actual}`);
      expect(actual).assertClose(1.6478, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0095 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0096
     * @tc.name      ListBeExchange_CurveInputOf_0096
     * @tc.desc      curveInputOf(offsetY=-52) returns 1.04
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_CurveInputOf_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0096 begin`);
      const actual: number = curveInputOf(-52);
      logInfo(`curveInputOf(offsetY=-52): actual=${actual}`);
      expect(actual).assertClose(1.04, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0096 end`);
    });
  });
}
