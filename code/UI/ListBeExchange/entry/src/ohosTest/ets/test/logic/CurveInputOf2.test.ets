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

/** Logic checks for curveInputOf (24 cases). */
export default function curveInputOf2Test(): void {
  describe('CurveInputOf2Test', (): void => {
    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0097
     * @tc.name      ListBeExchange_CurveInputOf_0097
     * @tc.desc      curveInputOf(offsetY=16.99) returns 0.3398
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0097 begin`);
      const actual: number = curveInputOf(16.99);
      logInfo(`curveInputOf(offsetY=16.99): actual=${actual}`);
      expect(actual).assertClose(0.3398, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0097 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0098
     * @tc.name      ListBeExchange_CurveInputOf_0098
     * @tc.desc      curveInputOf(offsetY=8.73) returns 0.1746
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0098 begin`);
      const actual: number = curveInputOf(8.73);
      logInfo(`curveInputOf(offsetY=8.73): actual=${actual}`);
      expect(actual).assertClose(0.1746, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0098 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0099
     * @tc.name      ListBeExchange_CurveInputOf_0099
     * @tc.desc      curveInputOf(offsetY=42.99) returns 0.8598
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0099 begin`);
      const actual: number = curveInputOf(42.99);
      logInfo(`curveInputOf(offsetY=42.99): actual=${actual}`);
      expect(actual).assertClose(0.8598, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0099 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0100
     * @tc.name      ListBeExchange_CurveInputOf_0100
     * @tc.desc      curveInputOf(offsetY=21) returns 0.42
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0100 begin`);
      const actual: number = curveInputOf(21);
      logInfo(`curveInputOf(offsetY=21): actual=${actual}`);
      expect(actual).assertClose(0.42, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0100 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0101
     * @tc.name      ListBeExchange_CurveInputOf_0101
     * @tc.desc      curveInputOf(offsetY=43) returns 0.86
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0101 begin`);
      const actual: number = curveInputOf(43);
      logInfo(`curveInputOf(offsetY=43): actual=${actual}`);
      expect(actual).assertClose(0.86, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0101 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0102
     * @tc.name      ListBeExchange_CurveInputOf_0102
     * @tc.desc      curveInputOf(offsetY=45.69) returns 0.9138
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0102 begin`);
      const actual: number = curveInputOf(45.69);
      logInfo(`curveInputOf(offsetY=45.69): actual=${actual}`);
      expect(actual).assertClose(0.9138, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0102 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0103
     * @tc.name      ListBeExchange_CurveInputOf_0103
     * @tc.desc      curveInputOf(offsetY=123) returns 2.46
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0103 begin`);
      const actual: number = curveInputOf(123);
      logInfo(`curveInputOf(offsetY=123): actual=${actual}`);
      expect(actual).assertClose(2.46, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0103 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0104
     * @tc.name      ListBeExchange_CurveInputOf_0104
     * @tc.desc      curveInputOf(offsetY=49.87) returns 0.9974
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0104 begin`);
      const actual: number = curveInputOf(49.87);
      logInfo(`curveInputOf(offsetY=49.87): actual=${actual}`);
      expect(actual).assertClose(0.9974, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0104 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0105
     * @tc.name      ListBeExchange_CurveInputOf_0105
     * @tc.desc      curveInputOf(offsetY=194) returns 3.88
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0105 begin`);
      const actual: number = curveInputOf(194);
      logInfo(`curveInputOf(offsetY=194): actual=${actual}`);
      expect(actual).assertClose(3.88, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0105 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0106
     * @tc.name      ListBeExchange_CurveInputOf_0106
     * @tc.desc      curveInputOf(offsetY=-4) returns 0.08
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_CurveInputOf_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0106 begin`);
      const actual: number = curveInputOf(-4);
      logInfo(`curveInputOf(offsetY=-4): actual=${actual}`);
      expect(actual).assertClose(0.08, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0106 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0107
     * @tc.name      ListBeExchange_CurveInputOf_0107
     * @tc.desc      curveInputOf(offsetY=99.11) returns 1.9822
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0107 begin`);
      const actual: number = curveInputOf(99.11);
      logInfo(`curveInputOf(offsetY=99.11): actual=${actual}`);
      expect(actual).assertClose(1.9822, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0107 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0108
     * @tc.name      ListBeExchange_CurveInputOf_0108
     * @tc.desc      curveInputOf(offsetY=99) returns 1.98
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0108 begin`);
      const actual: number = curveInputOf(99);
      logInfo(`curveInputOf(offsetY=99): actual=${actual}`);
      expect(actual).assertClose(1.98, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0108 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0109
     * @tc.name      ListBeExchange_CurveInputOf_0109
     * @tc.desc      curveInputOf(offsetY=102) returns 2.04
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0109 begin`);
      const actual: number = curveInputOf(102);
      logInfo(`curveInputOf(offsetY=102): actual=${actual}`);
      expect(actual).assertClose(2.04, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0109 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0110
     * @tc.name      ListBeExchange_CurveInputOf_0110
     * @tc.desc      curveInputOf(offsetY=139) returns 2.78
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0110 begin`);
      const actual: number = curveInputOf(139);
      logInfo(`curveInputOf(offsetY=139): actual=${actual}`);
      expect(actual).assertClose(2.78, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0110 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0111
     * @tc.name      ListBeExchange_CurveInputOf_0111
     * @tc.desc      curveInputOf(offsetY=1) returns 0.02
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0111 begin`);
      const actual: number = curveInputOf(1);
      logInfo(`curveInputOf(offsetY=1): actual=${actual}`);
      expect(actual).assertClose(0.02, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0111 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0112
     * @tc.name      ListBeExchange_CurveInputOf_0112
     * @tc.desc      curveInputOf(offsetY=100) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0112 begin`);
      const actual: number = curveInputOf(100);
      logInfo(`curveInputOf(offsetY=100): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}CurveInputOf_0112 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0113
     * @tc.name      ListBeExchange_CurveInputOf_0113
     * @tc.desc      curveInputOf(offsetY=-10) returns 0.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_CurveInputOf_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0113 begin`);
      const actual: number = curveInputOf(-10);
      logInfo(`curveInputOf(offsetY=-10): actual=${actual}`);
      expect(actual).assertClose(0.2, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0113 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0114
     * @tc.name      ListBeExchange_CurveInputOf_0114
     * @tc.desc      curveInputOf(offsetY=13) returns 0.26
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_CurveInputOf_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0114 begin`);
      const actual: number = curveInputOf(13);
      logInfo(`curveInputOf(offsetY=13): actual=${actual}`);
      expect(actual).assertClose(0.26, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0114 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0115
     * @tc.name      ListBeExchange_CurveInputOf_0115
     * @tc.desc      curveInputOf(offsetY=-65) returns 1.3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_CurveInputOf_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0115 begin`);
      const actual: number = curveInputOf(-65);
      logInfo(`curveInputOf(offsetY=-65): actual=${actual}`);
      expect(actual).assertClose(1.3, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0115 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0116
     * @tc.name      ListBeExchange_CurveInputOf_0116
     * @tc.desc      curveInputOf(offsetY=-90) returns 1.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_CurveInputOf_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0116 begin`);
      const actual: number = curveInputOf(-90);
      logInfo(`curveInputOf(offsetY=-90): actual=${actual}`);
      expect(actual).assertClose(1.8, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0116 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0117
     * @tc.name      ListBeExchange_CurveInputOf_0117
     * @tc.desc      curveInputOf(offsetY=-23) returns 0.46
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_CurveInputOf_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0117 begin`);
      const actual: number = curveInputOf(-23);
      logInfo(`curveInputOf(offsetY=-23): actual=${actual}`);
      expect(actual).assertClose(0.46, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0117 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0118
     * @tc.name      ListBeExchange_CurveInputOf_0118
     * @tc.desc      curveInputOf(offsetY=-60) returns 1.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_CurveInputOf_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0118 begin`);
      const actual: number = curveInputOf(-60);
      logInfo(`curveInputOf(offsetY=-60): actual=${actual}`);
      expect(actual).assertClose(1.2, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0118 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0119
     * @tc.name      ListBeExchange_CurveInputOf_0119
     * @tc.desc      curveInputOf(offsetY=-97) returns 1.94
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_CurveInputOf_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0119 begin`);
      const actual: number = curveInputOf(-97);
      logInfo(`curveInputOf(offsetY=-97): actual=${actual}`);
      expect(actual).assertClose(1.94, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0119 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CURVE_INPUT_OF_0120
     * @tc.name      ListBeExchange_CurveInputOf_0120
     * @tc.desc      curveInputOf(offsetY=-15) returns 0.3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_CurveInputOf_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}CurveInputOf_0120 begin`);
      const actual: number = curveInputOf(-15);
      logInfo(`curveInputOf(offsetY=-15): actual=${actual}`);
      expect(actual).assertClose(0.3, PRECISION);
      logInfo(`${BUNDLE}CurveInputOf_0120 end`);
    });
  });
}
