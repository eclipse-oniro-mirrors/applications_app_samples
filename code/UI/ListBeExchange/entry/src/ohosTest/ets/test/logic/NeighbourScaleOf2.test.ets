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
import { neighbourScaleOf } from '../model/ListExchangeLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ListBeExchange]';
const BUNDLE: string = 'ListBeExchange_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for neighbourScaleOf (96 cases). */
export default function neighbourScaleOf2Test(): void {
  describe('NeighbourScaleOf2Test', (): void => {
    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0097
     * @tc.name      ListBeExchange_NeighbourScaleOf_0097
     * @tc.desc      neighbourScaleOf(isNext=true, direction=15, shrinkScale=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0097 begin`);
      const actual: number = neighbourScaleOf(true, 15, 0);
      logInfo(`neighbourScaleOf(isNext=true, direction=1...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}NeighbourScaleOf_0097 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0098
     * @tc.name      ListBeExchange_NeighbourScaleOf_0098
     * @tc.desc      neighbourScaleOf(isNext=true, direction=15, shrinkScale=0.25) returns 0.25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0098 begin`);
      const actual: number = neighbourScaleOf(true, 15, 0.25);
      logInfo(`neighbourScaleOf(isNext=true, direction=1...: actual=${actual}`);
      expect(actual).assertClose(0.25, PRECISION);
      logInfo(`${BUNDLE}NeighbourScaleOf_0098 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0099
     * @tc.name      ListBeExchange_NeighbourScaleOf_0099
     * @tc.desc      neighbourScaleOf(isNext=true, direction=15, shrinkScale=-1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0099 begin`);
      const actual: number = neighbourScaleOf(true, 15, -1);
      logInfo(`neighbourScaleOf(isNext=true, direction=1...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0099 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0100
     * @tc.name      ListBeExchange_NeighbourScaleOf_0100
     * @tc.desc      neighbourScaleOf(isNext=true, direction=15, shrinkScale=1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0100 begin`);
      const actual: number = neighbourScaleOf(true, 15, 1);
      logInfo(`neighbourScaleOf(isNext=true, direction=1...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0100 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0101
     * @tc.name      ListBeExchange_NeighbourScaleOf_0101
     * @tc.desc      neighbourScaleOf(isNext=true, direction=15, shrinkScale=2) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0101 begin`);
      const actual: number = neighbourScaleOf(true, 15, 2);
      logInfo(`neighbourScaleOf(isNext=true, direction=1...: actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}NeighbourScaleOf_0101 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0102
     * @tc.name      ListBeExchange_NeighbourScaleOf_0102
     * @tc.desc      neighbourScaleOf(isNext=true, direction=15, shrinkScale=0.5) returns 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0102 begin`);
      const actual: number = neighbourScaleOf(true, 15, 0.5);
      logInfo(`neighbourScaleOf(isNext=true, direction=1...: actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}NeighbourScaleOf_0102 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0103
     * @tc.name      ListBeExchange_NeighbourScaleOf_0103
     * @tc.desc      neighbourScaleOf(isNext=true, direction=15, shrinkScale=1.5) returns 1.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0103 begin`);
      const actual: number = neighbourScaleOf(true, 15, 1.5);
      logInfo(`neighbourScaleOf(isNext=true, direction=1...: actual=${actual}`);
      expect(actual).assertClose(1.5, PRECISION);
      logInfo(`${BUNDLE}NeighbourScaleOf_0103 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0104
     * @tc.name      ListBeExchange_NeighbourScaleOf_0104
     * @tc.desc      neighbourScaleOf(isNext=true, direction=15, shrinkScale=3) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0104 begin`);
      const actual: number = neighbourScaleOf(true, 15, 3);
      logInfo(`neighbourScaleOf(isNext=true, direction=1...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}NeighbourScaleOf_0104 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0105
     * @tc.name      ListBeExchange_NeighbourScaleOf_0105
     * @tc.desc      neighbourScaleOf(isNext=true, direction=15, shrinkScale=10) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0105 begin`);
      const actual: number = neighbourScaleOf(true, 15, 10);
      logInfo(`neighbourScaleOf(isNext=true, direction=1...: actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}NeighbourScaleOf_0105 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0106
     * @tc.name      ListBeExchange_NeighbourScaleOf_0106
     * @tc.desc      neighbourScaleOf(isNext=true, direction=15, shrinkScale=100) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0106 begin`);
      const actual: number = neighbourScaleOf(true, 15, 100);
      logInfo(`neighbourScaleOf(isNext=true, direction=1...: actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}NeighbourScaleOf_0106 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0107
     * @tc.name      ListBeExchange_NeighbourScaleOf_0107
     * @tc.desc      neighbourScaleOf(isNext=true, direction=15, shrinkScale=5) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0107 begin`);
      const actual: number = neighbourScaleOf(true, 15, 5);
      logInfo(`neighbourScaleOf(isNext=true, direction=1...: actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}NeighbourScaleOf_0107 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0108
     * @tc.name      ListBeExchange_NeighbourScaleOf_0108
     * @tc.desc      neighbourScaleOf(isNext=true, direction=15, shrinkScale=-18) returns -18
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_NeighbourScaleOf_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0108 begin`);
      const actual: number = neighbourScaleOf(true, 15, -18);
      logInfo(`neighbourScaleOf(isNext=true, direction=1...: actual=${actual}`);
      expect(actual).assertEqual(-18);
      logInfo(`${BUNDLE}NeighbourScaleOf_0108 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0109
     * @tc.name      ListBeExchange_NeighbourScaleOf_0109
     * @tc.desc      neighbourScaleOf(isNext=true, direction=20, shrinkScale=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0109 begin`);
      const actual: number = neighbourScaleOf(true, 20, 0);
      logInfo(`neighbourScaleOf(isNext=true, direction=2...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}NeighbourScaleOf_0109 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0110
     * @tc.name      ListBeExchange_NeighbourScaleOf_0110
     * @tc.desc      neighbourScaleOf(isNext=true, direction=20, shrinkScale=0.25) returns 0.25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0110 begin`);
      const actual: number = neighbourScaleOf(true, 20, 0.25);
      logInfo(`neighbourScaleOf(isNext=true, direction=2...: actual=${actual}`);
      expect(actual).assertClose(0.25, PRECISION);
      logInfo(`${BUNDLE}NeighbourScaleOf_0110 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0111
     * @tc.name      ListBeExchange_NeighbourScaleOf_0111
     * @tc.desc      neighbourScaleOf(isNext=true, direction=20, shrinkScale=-1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0111 begin`);
      const actual: number = neighbourScaleOf(true, 20, -1);
      logInfo(`neighbourScaleOf(isNext=true, direction=2...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0111 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0112
     * @tc.name      ListBeExchange_NeighbourScaleOf_0112
     * @tc.desc      neighbourScaleOf(isNext=true, direction=20, shrinkScale=1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0112 begin`);
      const actual: number = neighbourScaleOf(true, 20, 1);
      logInfo(`neighbourScaleOf(isNext=true, direction=2...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0112 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0113
     * @tc.name      ListBeExchange_NeighbourScaleOf_0113
     * @tc.desc      neighbourScaleOf(isNext=true, direction=20, shrinkScale=2) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0113 begin`);
      const actual: number = neighbourScaleOf(true, 20, 2);
      logInfo(`neighbourScaleOf(isNext=true, direction=2...: actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}NeighbourScaleOf_0113 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0114
     * @tc.name      ListBeExchange_NeighbourScaleOf_0114
     * @tc.desc      neighbourScaleOf(isNext=true, direction=20, shrinkScale=0.5) returns 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0114 begin`);
      const actual: number = neighbourScaleOf(true, 20, 0.5);
      logInfo(`neighbourScaleOf(isNext=true, direction=2...: actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}NeighbourScaleOf_0114 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0115
     * @tc.name      ListBeExchange_NeighbourScaleOf_0115
     * @tc.desc      neighbourScaleOf(isNext=true, direction=20, shrinkScale=1.5) returns 1.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0115 begin`);
      const actual: number = neighbourScaleOf(true, 20, 1.5);
      logInfo(`neighbourScaleOf(isNext=true, direction=2...: actual=${actual}`);
      expect(actual).assertClose(1.5, PRECISION);
      logInfo(`${BUNDLE}NeighbourScaleOf_0115 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0116
     * @tc.name      ListBeExchange_NeighbourScaleOf_0116
     * @tc.desc      neighbourScaleOf(isNext=true, direction=20, shrinkScale=3) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0116 begin`);
      const actual: number = neighbourScaleOf(true, 20, 3);
      logInfo(`neighbourScaleOf(isNext=true, direction=2...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}NeighbourScaleOf_0116 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0117
     * @tc.name      ListBeExchange_NeighbourScaleOf_0117
     * @tc.desc      neighbourScaleOf(isNext=true, direction=20, shrinkScale=10) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0117 begin`);
      const actual: number = neighbourScaleOf(true, 20, 10);
      logInfo(`neighbourScaleOf(isNext=true, direction=2...: actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}NeighbourScaleOf_0117 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0118
     * @tc.name      ListBeExchange_NeighbourScaleOf_0118
     * @tc.desc      neighbourScaleOf(isNext=true, direction=20, shrinkScale=100) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0118 begin`);
      const actual: number = neighbourScaleOf(true, 20, 100);
      logInfo(`neighbourScaleOf(isNext=true, direction=2...: actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}NeighbourScaleOf_0118 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0119
     * @tc.name      ListBeExchange_NeighbourScaleOf_0119
     * @tc.desc      neighbourScaleOf(isNext=true, direction=20, shrinkScale=5) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0119 begin`);
      const actual: number = neighbourScaleOf(true, 20, 5);
      logInfo(`neighbourScaleOf(isNext=true, direction=2...: actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}NeighbourScaleOf_0119 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0120
     * @tc.name      ListBeExchange_NeighbourScaleOf_0120
     * @tc.desc      neighbourScaleOf(isNext=true, direction=20, shrinkScale=-18) returns -18
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_NeighbourScaleOf_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0120 begin`);
      const actual: number = neighbourScaleOf(true, 20, -18);
      logInfo(`neighbourScaleOf(isNext=true, direction=2...: actual=${actual}`);
      expect(actual).assertEqual(-18);
      logInfo(`${BUNDLE}NeighbourScaleOf_0120 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0121
     * @tc.name      ListBeExchange_NeighbourScaleOf_0121
     * @tc.desc      neighbourScaleOf(isNext=true, direction=25, shrinkScale=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0121 begin`);
      const actual: number = neighbourScaleOf(true, 25, 0);
      logInfo(`neighbourScaleOf(isNext=true, direction=2...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}NeighbourScaleOf_0121 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0122
     * @tc.name      ListBeExchange_NeighbourScaleOf_0122
     * @tc.desc      neighbourScaleOf(isNext=true, direction=25, shrinkScale=0.25) returns 0.25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0122 begin`);
      const actual: number = neighbourScaleOf(true, 25, 0.25);
      logInfo(`neighbourScaleOf(isNext=true, direction=2...: actual=${actual}`);
      expect(actual).assertClose(0.25, PRECISION);
      logInfo(`${BUNDLE}NeighbourScaleOf_0122 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0123
     * @tc.name      ListBeExchange_NeighbourScaleOf_0123
     * @tc.desc      neighbourScaleOf(isNext=true, direction=25, shrinkScale=-1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0123 begin`);
      const actual: number = neighbourScaleOf(true, 25, -1);
      logInfo(`neighbourScaleOf(isNext=true, direction=2...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0123 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0124
     * @tc.name      ListBeExchange_NeighbourScaleOf_0124
     * @tc.desc      neighbourScaleOf(isNext=true, direction=25, shrinkScale=1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0124 begin`);
      const actual: number = neighbourScaleOf(true, 25, 1);
      logInfo(`neighbourScaleOf(isNext=true, direction=2...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0124 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0125
     * @tc.name      ListBeExchange_NeighbourScaleOf_0125
     * @tc.desc      neighbourScaleOf(isNext=true, direction=25, shrinkScale=2) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0125 begin`);
      const actual: number = neighbourScaleOf(true, 25, 2);
      logInfo(`neighbourScaleOf(isNext=true, direction=2...: actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}NeighbourScaleOf_0125 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0126
     * @tc.name      ListBeExchange_NeighbourScaleOf_0126
     * @tc.desc      neighbourScaleOf(isNext=true, direction=25, shrinkScale=0.5) returns 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0126 begin`);
      const actual: number = neighbourScaleOf(true, 25, 0.5);
      logInfo(`neighbourScaleOf(isNext=true, direction=2...: actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}NeighbourScaleOf_0126 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0127
     * @tc.name      ListBeExchange_NeighbourScaleOf_0127
     * @tc.desc      neighbourScaleOf(isNext=true, direction=25, shrinkScale=1.5) returns 1.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0127 begin`);
      const actual: number = neighbourScaleOf(true, 25, 1.5);
      logInfo(`neighbourScaleOf(isNext=true, direction=2...: actual=${actual}`);
      expect(actual).assertClose(1.5, PRECISION);
      logInfo(`${BUNDLE}NeighbourScaleOf_0127 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0128
     * @tc.name      ListBeExchange_NeighbourScaleOf_0128
     * @tc.desc      neighbourScaleOf(isNext=true, direction=25, shrinkScale=3) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0128 begin`);
      const actual: number = neighbourScaleOf(true, 25, 3);
      logInfo(`neighbourScaleOf(isNext=true, direction=2...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}NeighbourScaleOf_0128 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0129
     * @tc.name      ListBeExchange_NeighbourScaleOf_0129
     * @tc.desc      neighbourScaleOf(isNext=true, direction=25, shrinkScale=10) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0129 begin`);
      const actual: number = neighbourScaleOf(true, 25, 10);
      logInfo(`neighbourScaleOf(isNext=true, direction=2...: actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}NeighbourScaleOf_0129 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0130
     * @tc.name      ListBeExchange_NeighbourScaleOf_0130
     * @tc.desc      neighbourScaleOf(isNext=true, direction=25, shrinkScale=100) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0130 begin`);
      const actual: number = neighbourScaleOf(true, 25, 100);
      logInfo(`neighbourScaleOf(isNext=true, direction=2...: actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}NeighbourScaleOf_0130 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0131
     * @tc.name      ListBeExchange_NeighbourScaleOf_0131
     * @tc.desc      neighbourScaleOf(isNext=true, direction=25, shrinkScale=5) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0131 begin`);
      const actual: number = neighbourScaleOf(true, 25, 5);
      logInfo(`neighbourScaleOf(isNext=true, direction=2...: actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}NeighbourScaleOf_0131 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0132
     * @tc.name      ListBeExchange_NeighbourScaleOf_0132
     * @tc.desc      neighbourScaleOf(isNext=true, direction=25, shrinkScale=-18) returns -18
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_NeighbourScaleOf_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0132 begin`);
      const actual: number = neighbourScaleOf(true, 25, -18);
      logInfo(`neighbourScaleOf(isNext=true, direction=2...: actual=${actual}`);
      expect(actual).assertEqual(-18);
      logInfo(`${BUNDLE}NeighbourScaleOf_0132 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0133
     * @tc.name      ListBeExchange_NeighbourScaleOf_0133
     * @tc.desc      neighbourScaleOf(isNext=true, direction=5.65, shrinkScale=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0133 begin`);
      const actual: number = neighbourScaleOf(true, 5.65, 0);
      logInfo(`neighbourScaleOf(isNext=true, direction=5...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}NeighbourScaleOf_0133 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0134
     * @tc.name      ListBeExchange_NeighbourScaleOf_0134
     * @tc.desc      neighbourScaleOf(isNext=true, direction=5.65, shrinkScale=0.25) returns 0.25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0134 begin`);
      const actual: number = neighbourScaleOf(true, 5.65, 0.25);
      logInfo(`neighbourScaleOf(isNext=true, direction=5...: actual=${actual}`);
      expect(actual).assertClose(0.25, PRECISION);
      logInfo(`${BUNDLE}NeighbourScaleOf_0134 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0135
     * @tc.name      ListBeExchange_NeighbourScaleOf_0135
     * @tc.desc      neighbourScaleOf(isNext=true, direction=5.65, shrinkScale=-1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0135 begin`);
      const actual: number = neighbourScaleOf(true, 5.65, -1);
      logInfo(`neighbourScaleOf(isNext=true, direction=5...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0135 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0136
     * @tc.name      ListBeExchange_NeighbourScaleOf_0136
     * @tc.desc      neighbourScaleOf(isNext=true, direction=5.65, shrinkScale=1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0136 begin`);
      const actual: number = neighbourScaleOf(true, 5.65, 1);
      logInfo(`neighbourScaleOf(isNext=true, direction=5...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0136 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0137
     * @tc.name      ListBeExchange_NeighbourScaleOf_0137
     * @tc.desc      neighbourScaleOf(isNext=true, direction=5.65, shrinkScale=2) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0137 begin`);
      const actual: number = neighbourScaleOf(true, 5.65, 2);
      logInfo(`neighbourScaleOf(isNext=true, direction=5...: actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}NeighbourScaleOf_0137 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0138
     * @tc.name      ListBeExchange_NeighbourScaleOf_0138
     * @tc.desc      neighbourScaleOf(isNext=true, direction=5.65, shrinkScale=0.5) returns 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0138 begin`);
      const actual: number = neighbourScaleOf(true, 5.65, 0.5);
      logInfo(`neighbourScaleOf(isNext=true, direction=5...: actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}NeighbourScaleOf_0138 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0139
     * @tc.name      ListBeExchange_NeighbourScaleOf_0139
     * @tc.desc      neighbourScaleOf(isNext=true, direction=5.65, shrinkScale=1.5) returns 1.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0139 begin`);
      const actual: number = neighbourScaleOf(true, 5.65, 1.5);
      logInfo(`neighbourScaleOf(isNext=true, direction=5...: actual=${actual}`);
      expect(actual).assertClose(1.5, PRECISION);
      logInfo(`${BUNDLE}NeighbourScaleOf_0139 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0140
     * @tc.name      ListBeExchange_NeighbourScaleOf_0140
     * @tc.desc      neighbourScaleOf(isNext=true, direction=5.65, shrinkScale=3) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0140 begin`);
      const actual: number = neighbourScaleOf(true, 5.65, 3);
      logInfo(`neighbourScaleOf(isNext=true, direction=5...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}NeighbourScaleOf_0140 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0141
     * @tc.name      ListBeExchange_NeighbourScaleOf_0141
     * @tc.desc      neighbourScaleOf(isNext=true, direction=5.65, shrinkScale=10) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0141 begin`);
      const actual: number = neighbourScaleOf(true, 5.65, 10);
      logInfo(`neighbourScaleOf(isNext=true, direction=5...: actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}NeighbourScaleOf_0141 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0142
     * @tc.name      ListBeExchange_NeighbourScaleOf_0142
     * @tc.desc      neighbourScaleOf(isNext=true, direction=5.65, shrinkScale=100) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0142 begin`);
      const actual: number = neighbourScaleOf(true, 5.65, 100);
      logInfo(`neighbourScaleOf(isNext=true, direction=5...: actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}NeighbourScaleOf_0142 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0143
     * @tc.name      ListBeExchange_NeighbourScaleOf_0143
     * @tc.desc      neighbourScaleOf(isNext=true, direction=5.65, shrinkScale=5) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_NeighbourScaleOf_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0143 begin`);
      const actual: number = neighbourScaleOf(true, 5.65, 5);
      logInfo(`neighbourScaleOf(isNext=true, direction=5...: actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}NeighbourScaleOf_0143 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0144
     * @tc.name      ListBeExchange_NeighbourScaleOf_0144
     * @tc.desc      neighbourScaleOf(isNext=true, direction=5.65, shrinkScale=-18) returns -18
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_NeighbourScaleOf_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0144 begin`);
      const actual: number = neighbourScaleOf(true, 5.65, -18);
      logInfo(`neighbourScaleOf(isNext=true, direction=5...: actual=${actual}`);
      expect(actual).assertEqual(-18);
      logInfo(`${BUNDLE}NeighbourScaleOf_0144 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0145
     * @tc.name      ListBeExchange_NeighbourScaleOf_0145
     * @tc.desc      neighbourScaleOf(isNext=false, direction=0, shrinkScale=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0145 begin`);
      const actual: number = neighbourScaleOf(false, 0, 0);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}NeighbourScaleOf_0145 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0146
     * @tc.name      ListBeExchange_NeighbourScaleOf_0146
     * @tc.desc      neighbourScaleOf(isNext=false, direction=0, shrinkScale=0.25) returns 0.25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0146 begin`);
      const actual: number = neighbourScaleOf(false, 0, 0.25);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertClose(0.25, PRECISION);
      logInfo(`${BUNDLE}NeighbourScaleOf_0146 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0147
     * @tc.name      ListBeExchange_NeighbourScaleOf_0147
     * @tc.desc      neighbourScaleOf(isNext=false, direction=0, shrinkScale=-1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0147 begin`);
      const actual: number = neighbourScaleOf(false, 0, -1);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0147 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0148
     * @tc.name      ListBeExchange_NeighbourScaleOf_0148
     * @tc.desc      neighbourScaleOf(isNext=false, direction=0, shrinkScale=1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0148 begin`);
      const actual: number = neighbourScaleOf(false, 0, 1);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0148 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0149
     * @tc.name      ListBeExchange_NeighbourScaleOf_0149
     * @tc.desc      neighbourScaleOf(isNext=false, direction=0, shrinkScale=2) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0149 begin`);
      const actual: number = neighbourScaleOf(false, 0, 2);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}NeighbourScaleOf_0149 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0150
     * @tc.name      ListBeExchange_NeighbourScaleOf_0150
     * @tc.desc      neighbourScaleOf(isNext=false, direction=0, shrinkScale=0.5) returns 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0150 begin`);
      const actual: number = neighbourScaleOf(false, 0, 0.5);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}NeighbourScaleOf_0150 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0151
     * @tc.name      ListBeExchange_NeighbourScaleOf_0151
     * @tc.desc      neighbourScaleOf(isNext=false, direction=0, shrinkScale=1.5) returns 1.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0151 begin`);
      const actual: number = neighbourScaleOf(false, 0, 1.5);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertClose(1.5, PRECISION);
      logInfo(`${BUNDLE}NeighbourScaleOf_0151 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0152
     * @tc.name      ListBeExchange_NeighbourScaleOf_0152
     * @tc.desc      neighbourScaleOf(isNext=false, direction=0, shrinkScale=3) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0152 begin`);
      const actual: number = neighbourScaleOf(false, 0, 3);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}NeighbourScaleOf_0152 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0153
     * @tc.name      ListBeExchange_NeighbourScaleOf_0153
     * @tc.desc      neighbourScaleOf(isNext=false, direction=0, shrinkScale=10) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0153 begin`);
      const actual: number = neighbourScaleOf(false, 0, 10);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}NeighbourScaleOf_0153 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0154
     * @tc.name      ListBeExchange_NeighbourScaleOf_0154
     * @tc.desc      neighbourScaleOf(isNext=false, direction=0, shrinkScale=100) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0154 begin`);
      const actual: number = neighbourScaleOf(false, 0, 100);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}NeighbourScaleOf_0154 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0155
     * @tc.name      ListBeExchange_NeighbourScaleOf_0155
     * @tc.desc      neighbourScaleOf(isNext=false, direction=0, shrinkScale=5) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0155 begin`);
      const actual: number = neighbourScaleOf(false, 0, 5);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}NeighbourScaleOf_0155 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0156
     * @tc.name      ListBeExchange_NeighbourScaleOf_0156
     * @tc.desc      neighbourScaleOf(isNext=false, direction=0, shrinkScale=-18) returns -18
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_NeighbourScaleOf_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0156 begin`);
      const actual: number = neighbourScaleOf(false, 0, -18);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(-18);
      logInfo(`${BUNDLE}NeighbourScaleOf_0156 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0157
     * @tc.name      ListBeExchange_NeighbourScaleOf_0157
     * @tc.desc      neighbourScaleOf(isNext=false, direction=-1, shrinkScale=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0157 begin`);
      const actual: number = neighbourScaleOf(false, -1, 0);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}NeighbourScaleOf_0157 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0158
     * @tc.name      ListBeExchange_NeighbourScaleOf_0158
     * @tc.desc      neighbourScaleOf(isNext=false, direction=-1, shrinkScale=0.25) returns 0.25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0158 begin`);
      const actual: number = neighbourScaleOf(false, -1, 0.25);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertClose(0.25, PRECISION);
      logInfo(`${BUNDLE}NeighbourScaleOf_0158 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0159
     * @tc.name      ListBeExchange_NeighbourScaleOf_0159
     * @tc.desc      neighbourScaleOf(isNext=false, direction=-1, shrinkScale=-1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0159 begin`);
      const actual: number = neighbourScaleOf(false, -1, -1);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0159 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0160
     * @tc.name      ListBeExchange_NeighbourScaleOf_0160
     * @tc.desc      neighbourScaleOf(isNext=false, direction=-1, shrinkScale=1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0160 begin`);
      const actual: number = neighbourScaleOf(false, -1, 1);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0160 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0161
     * @tc.name      ListBeExchange_NeighbourScaleOf_0161
     * @tc.desc      neighbourScaleOf(isNext=false, direction=-1, shrinkScale=2) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0161 begin`);
      const actual: number = neighbourScaleOf(false, -1, 2);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}NeighbourScaleOf_0161 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0162
     * @tc.name      ListBeExchange_NeighbourScaleOf_0162
     * @tc.desc      neighbourScaleOf(isNext=false, direction=-1, shrinkScale=0.5) returns 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0162 begin`);
      const actual: number = neighbourScaleOf(false, -1, 0.5);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}NeighbourScaleOf_0162 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0163
     * @tc.name      ListBeExchange_NeighbourScaleOf_0163
     * @tc.desc      neighbourScaleOf(isNext=false, direction=-1, shrinkScale=1.5) returns 1.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0163 begin`);
      const actual: number = neighbourScaleOf(false, -1, 1.5);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertClose(1.5, PRECISION);
      logInfo(`${BUNDLE}NeighbourScaleOf_0163 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0164
     * @tc.name      ListBeExchange_NeighbourScaleOf_0164
     * @tc.desc      neighbourScaleOf(isNext=false, direction=-1, shrinkScale=3) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0164 begin`);
      const actual: number = neighbourScaleOf(false, -1, 3);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}NeighbourScaleOf_0164 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0165
     * @tc.name      ListBeExchange_NeighbourScaleOf_0165
     * @tc.desc      neighbourScaleOf(isNext=false, direction=-1, shrinkScale=10) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0165 begin`);
      const actual: number = neighbourScaleOf(false, -1, 10);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}NeighbourScaleOf_0165 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0166
     * @tc.name      ListBeExchange_NeighbourScaleOf_0166
     * @tc.desc      neighbourScaleOf(isNext=false, direction=-1, shrinkScale=100) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0166 begin`);
      const actual: number = neighbourScaleOf(false, -1, 100);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}NeighbourScaleOf_0166 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0167
     * @tc.name      ListBeExchange_NeighbourScaleOf_0167
     * @tc.desc      neighbourScaleOf(isNext=false, direction=-1, shrinkScale=5) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0167 begin`);
      const actual: number = neighbourScaleOf(false, -1, 5);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}NeighbourScaleOf_0167 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0168
     * @tc.name      ListBeExchange_NeighbourScaleOf_0168
     * @tc.desc      neighbourScaleOf(isNext=false, direction=-1, shrinkScale=-18) returns -18
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_NeighbourScaleOf_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0168 begin`);
      const actual: number = neighbourScaleOf(false, -1, -18);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(-18);
      logInfo(`${BUNDLE}NeighbourScaleOf_0168 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0169
     * @tc.name      ListBeExchange_NeighbourScaleOf_0169
     * @tc.desc      neighbourScaleOf(isNext=false, direction=1, shrinkScale=0) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0169 begin`);
      const actual: number = neighbourScaleOf(false, 1, 0);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0169 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0170
     * @tc.name      ListBeExchange_NeighbourScaleOf_0170
     * @tc.desc      neighbourScaleOf(isNext=false, direction=1, shrinkScale=0.25) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0170 begin`);
      const actual: number = neighbourScaleOf(false, 1, 0.25);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0170 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0171
     * @tc.name      ListBeExchange_NeighbourScaleOf_0171
     * @tc.desc      neighbourScaleOf(isNext=false, direction=1, shrinkScale=-1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0171 begin`);
      const actual: number = neighbourScaleOf(false, 1, -1);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0171 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0172
     * @tc.name      ListBeExchange_NeighbourScaleOf_0172
     * @tc.desc      neighbourScaleOf(isNext=false, direction=1, shrinkScale=1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0172 begin`);
      const actual: number = neighbourScaleOf(false, 1, 1);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0172 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0173
     * @tc.name      ListBeExchange_NeighbourScaleOf_0173
     * @tc.desc      neighbourScaleOf(isNext=false, direction=1, shrinkScale=2) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0173 begin`);
      const actual: number = neighbourScaleOf(false, 1, 2);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0173 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0174
     * @tc.name      ListBeExchange_NeighbourScaleOf_0174
     * @tc.desc      neighbourScaleOf(isNext=false, direction=1, shrinkScale=0.5) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0174 begin`);
      const actual: number = neighbourScaleOf(false, 1, 0.5);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0174 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0175
     * @tc.name      ListBeExchange_NeighbourScaleOf_0175
     * @tc.desc      neighbourScaleOf(isNext=false, direction=1, shrinkScale=1.5) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0175 begin`);
      const actual: number = neighbourScaleOf(false, 1, 1.5);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0175 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0176
     * @tc.name      ListBeExchange_NeighbourScaleOf_0176
     * @tc.desc      neighbourScaleOf(isNext=false, direction=1, shrinkScale=3) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0176 begin`);
      const actual: number = neighbourScaleOf(false, 1, 3);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0176 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0177
     * @tc.name      ListBeExchange_NeighbourScaleOf_0177
     * @tc.desc      neighbourScaleOf(isNext=false, direction=1, shrinkScale=10) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0177 begin`);
      const actual: number = neighbourScaleOf(false, 1, 10);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0177 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0178
     * @tc.name      ListBeExchange_NeighbourScaleOf_0178
     * @tc.desc      neighbourScaleOf(isNext=false, direction=1, shrinkScale=100) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0178 begin`);
      const actual: number = neighbourScaleOf(false, 1, 100);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0178 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0179
     * @tc.name      ListBeExchange_NeighbourScaleOf_0179
     * @tc.desc      neighbourScaleOf(isNext=false, direction=1, shrinkScale=5) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0179 begin`);
      const actual: number = neighbourScaleOf(false, 1, 5);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0179 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0180
     * @tc.name      ListBeExchange_NeighbourScaleOf_0180
     * @tc.desc      neighbourScaleOf(isNext=false, direction=1, shrinkScale=-18) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_NeighbourScaleOf_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0180 begin`);
      const actual: number = neighbourScaleOf(false, 1, -18);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0180 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0181
     * @tc.name      ListBeExchange_NeighbourScaleOf_0181
     * @tc.desc      neighbourScaleOf(isNext=false, direction=2, shrinkScale=0) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0181 begin`);
      const actual: number = neighbourScaleOf(false, 2, 0);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0181 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0182
     * @tc.name      ListBeExchange_NeighbourScaleOf_0182
     * @tc.desc      neighbourScaleOf(isNext=false, direction=2, shrinkScale=0.25) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0182 begin`);
      const actual: number = neighbourScaleOf(false, 2, 0.25);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0182 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0183
     * @tc.name      ListBeExchange_NeighbourScaleOf_0183
     * @tc.desc      neighbourScaleOf(isNext=false, direction=2, shrinkScale=-1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0183 begin`);
      const actual: number = neighbourScaleOf(false, 2, -1);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0183 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0184
     * @tc.name      ListBeExchange_NeighbourScaleOf_0184
     * @tc.desc      neighbourScaleOf(isNext=false, direction=2, shrinkScale=1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0184 begin`);
      const actual: number = neighbourScaleOf(false, 2, 1);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0184 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0185
     * @tc.name      ListBeExchange_NeighbourScaleOf_0185
     * @tc.desc      neighbourScaleOf(isNext=false, direction=2, shrinkScale=2) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0185 begin`);
      const actual: number = neighbourScaleOf(false, 2, 2);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0185 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0186
     * @tc.name      ListBeExchange_NeighbourScaleOf_0186
     * @tc.desc      neighbourScaleOf(isNext=false, direction=2, shrinkScale=0.5) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0186 begin`);
      const actual: number = neighbourScaleOf(false, 2, 0.5);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0186 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0187
     * @tc.name      ListBeExchange_NeighbourScaleOf_0187
     * @tc.desc      neighbourScaleOf(isNext=false, direction=2, shrinkScale=1.5) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0187 begin`);
      const actual: number = neighbourScaleOf(false, 2, 1.5);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0187 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0188
     * @tc.name      ListBeExchange_NeighbourScaleOf_0188
     * @tc.desc      neighbourScaleOf(isNext=false, direction=2, shrinkScale=3) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0188 begin`);
      const actual: number = neighbourScaleOf(false, 2, 3);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0188 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0189
     * @tc.name      ListBeExchange_NeighbourScaleOf_0189
     * @tc.desc      neighbourScaleOf(isNext=false, direction=2, shrinkScale=10) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0189 begin`);
      const actual: number = neighbourScaleOf(false, 2, 10);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0189 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0190
     * @tc.name      ListBeExchange_NeighbourScaleOf_0190
     * @tc.desc      neighbourScaleOf(isNext=false, direction=2, shrinkScale=100) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0190 begin`);
      const actual: number = neighbourScaleOf(false, 2, 100);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0190 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0191
     * @tc.name      ListBeExchange_NeighbourScaleOf_0191
     * @tc.desc      neighbourScaleOf(isNext=false, direction=2, shrinkScale=5) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ListBeExchange_NeighbourScaleOf_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0191 begin`);
      const actual: number = neighbourScaleOf(false, 2, 5);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0191 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_NEIGHBOUR_SCALE_OF_0192
     * @tc.name      ListBeExchange_NeighbourScaleOf_0192
     * @tc.desc      neighbourScaleOf(isNext=false, direction=2, shrinkScale=-18) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_NeighbourScaleOf_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}NeighbourScaleOf_0192 begin`);
      const actual: number = neighbourScaleOf(false, 2, -18);
      logInfo(`neighbourScaleOf(isNext=false, direction=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NeighbourScaleOf_0192 end`);
    });
  });
}
