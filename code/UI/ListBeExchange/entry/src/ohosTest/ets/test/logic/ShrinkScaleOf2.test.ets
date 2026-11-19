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

/** Logic checks for shrinkScaleOf (24 cases). */
export default function shrinkScaleOf2Test(): void {
  describe('ShrinkScaleOf2Test', (): void => {
    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0097
     * @tc.name      ListBeExchange_ShrinkScaleOf_0097
     * @tc.desc      shrinkScaleOf(curveValue=-38) returns 4.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_ShrinkScaleOf_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0097 begin`);
      const actual: number = shrinkScaleOf(-38);
      logInfo(`shrinkScaleOf(curveValue=-38): actual=${actual}`);
      expect(actual).assertClose(4.8, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0097 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0098
     * @tc.name      ListBeExchange_ShrinkScaleOf_0098
     * @tc.desc      shrinkScaleOf(curveValue=25.81) returns -1.581
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0098 begin`);
      const actual: number = shrinkScaleOf(25.81);
      logInfo(`shrinkScaleOf(curveValue=25.81): actual=${actual}`);
      expect(actual).assertClose(-1.581, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0098 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0099
     * @tc.name      ListBeExchange_ShrinkScaleOf_0099
     * @tc.desc      shrinkScaleOf(curveValue=-63) returns 7.3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_ShrinkScaleOf_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0099 begin`);
      const actual: number = shrinkScaleOf(-63);
      logInfo(`shrinkScaleOf(curveValue=-63): actual=${actual}`);
      expect(actual).assertClose(7.3, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0099 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0100
     * @tc.name      ListBeExchange_ShrinkScaleOf_0100
     * @tc.desc      shrinkScaleOf(curveValue=53.02) returns -4.3020000000000005
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0100 begin`);
      const actual: number = shrinkScaleOf(53.02);
      logInfo(`shrinkScaleOf(curveValue=53.02): actual=${actual}`);
      expect(actual).assertClose(-4.3020000000000005, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0100 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0101
     * @tc.name      ListBeExchange_ShrinkScaleOf_0101
     * @tc.desc      shrinkScaleOf(curveValue=-79) returns 8.9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_ShrinkScaleOf_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0101 begin`);
      const actual: number = shrinkScaleOf(-79);
      logInfo(`shrinkScaleOf(curveValue=-79): actual=${actual}`);
      expect(actual).assertClose(8.9, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0101 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0102
     * @tc.name      ListBeExchange_ShrinkScaleOf_0102
     * @tc.desc      shrinkScaleOf(curveValue=22.56) returns -1.2559999999999998
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0102 begin`);
      const actual: number = shrinkScaleOf(22.56);
      logInfo(`shrinkScaleOf(curveValue=22.56): actual=${actual}`);
      expect(actual).assertClose(-1.2559999999999998, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0102 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0103
     * @tc.name      ListBeExchange_ShrinkScaleOf_0103
     * @tc.desc      shrinkScaleOf(curveValue=48.67) returns -3.867
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0103 begin`);
      const actual: number = shrinkScaleOf(48.67);
      logInfo(`shrinkScaleOf(curveValue=48.67): actual=${actual}`);
      expect(actual).assertClose(-3.867, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0103 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0104
     * @tc.name      ListBeExchange_ShrinkScaleOf_0104
     * @tc.desc      shrinkScaleOf(curveValue=13) returns -0.30000000000000004
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0104 begin`);
      const actual: number = shrinkScaleOf(13);
      logInfo(`shrinkScaleOf(curveValue=13): actual=${actual}`);
      expect(actual).assertClose(-0.30000000000000004, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0104 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0105
     * @tc.name      ListBeExchange_ShrinkScaleOf_0105
     * @tc.desc      shrinkScaleOf(curveValue=176) returns -16.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0105 begin`);
      const actual: number = shrinkScaleOf(176);
      logInfo(`shrinkScaleOf(curveValue=176): actual=${actual}`);
      expect(actual).assertClose(-16.6, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0105 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0106
     * @tc.name      ListBeExchange_ShrinkScaleOf_0106
     * @tc.desc      shrinkScaleOf(curveValue=56) returns -4.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0106 begin`);
      const actual: number = shrinkScaleOf(56);
      logInfo(`shrinkScaleOf(curveValue=56): actual=${actual}`);
      expect(actual).assertClose(-4.6, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0106 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0107
     * @tc.name      ListBeExchange_ShrinkScaleOf_0107
     * @tc.desc      shrinkScaleOf(curveValue=198) returns -18.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0107 begin`);
      const actual: number = shrinkScaleOf(198);
      logInfo(`shrinkScaleOf(curveValue=198): actual=${actual}`);
      expect(actual).assertClose(-18.8, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0107 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0108
     * @tc.name      ListBeExchange_ShrinkScaleOf_0108
     * @tc.desc      shrinkScaleOf(curveValue=166) returns -15.600000000000001
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0108 begin`);
      const actual: number = shrinkScaleOf(166);
      logInfo(`shrinkScaleOf(curveValue=166): actual=${actual}`);
      expect(actual).assertClose(-15.600000000000001, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0108 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0109
     * @tc.name      ListBeExchange_ShrinkScaleOf_0109
     * @tc.desc      shrinkScaleOf(curveValue=36.03) returns -2.603
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0109 begin`);
      const actual: number = shrinkScaleOf(36.03);
      logInfo(`shrinkScaleOf(curveValue=36.03): actual=${actual}`);
      expect(actual).assertClose(-2.603, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0109 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0110
     * @tc.name      ListBeExchange_ShrinkScaleOf_0110
     * @tc.desc      shrinkScaleOf(curveValue=5.78) returns 0.42199999999999993
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0110 begin`);
      const actual: number = shrinkScaleOf(5.78);
      logInfo(`shrinkScaleOf(curveValue=5.78): actual=${actual}`);
      expect(actual).assertClose(0.42199999999999993, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0110 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0111
     * @tc.name      ListBeExchange_ShrinkScaleOf_0111
     * @tc.desc      shrinkScaleOf(curveValue=9.45) returns 0.05500000000000005
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0111 begin`);
      const actual: number = shrinkScaleOf(9.45);
      logInfo(`shrinkScaleOf(curveValue=9.45): actual=${actual}`);
      expect(actual).assertClose(0.05500000000000005, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0111 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0112
     * @tc.name      ListBeExchange_ShrinkScaleOf_0112
     * @tc.desc      shrinkScaleOf(curveValue=-2) returns 1.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_ShrinkScaleOf_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0112 begin`);
      const actual: number = shrinkScaleOf(-2);
      logInfo(`shrinkScaleOf(curveValue=-2): actual=${actual}`);
      expect(actual).assertClose(1.2, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0112 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0113
     * @tc.name      ListBeExchange_ShrinkScaleOf_0113
     * @tc.desc      shrinkScaleOf(curveValue=93.14) returns -8.314
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0113 begin`);
      const actual: number = shrinkScaleOf(93.14);
      logInfo(`shrinkScaleOf(curveValue=93.14): actual=${actual}`);
      expect(actual).assertClose(-8.314, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0113 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0114
     * @tc.name      ListBeExchange_ShrinkScaleOf_0114
     * @tc.desc      shrinkScaleOf(curveValue=72) returns -6.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0114 begin`);
      const actual: number = shrinkScaleOf(72);
      logInfo(`shrinkScaleOf(curveValue=72): actual=${actual}`);
      expect(actual).assertClose(-6.2, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0114 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0115
     * @tc.name      ListBeExchange_ShrinkScaleOf_0115
     * @tc.desc      shrinkScaleOf(curveValue=39.95) returns -2.995
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0115 begin`);
      const actual: number = shrinkScaleOf(39.95);
      logInfo(`shrinkScaleOf(curveValue=39.95): actual=${actual}`);
      expect(actual).assertClose(-2.995, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0115 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0116
     * @tc.name      ListBeExchange_ShrinkScaleOf_0116
     * @tc.desc      shrinkScaleOf(curveValue=-43) returns 5.3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_ShrinkScaleOf_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0116 begin`);
      const actual: number = shrinkScaleOf(-43);
      logInfo(`shrinkScaleOf(curveValue=-43): actual=${actual}`);
      expect(actual).assertClose(5.3, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0116 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0117
     * @tc.name      ListBeExchange_ShrinkScaleOf_0117
     * @tc.desc      shrinkScaleOf(curveValue=-57) returns 6.7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_ShrinkScaleOf_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0117 begin`);
      const actual: number = shrinkScaleOf(-57);
      logInfo(`shrinkScaleOf(curveValue=-57): actual=${actual}`);
      expect(actual).assertClose(6.7, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0117 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0118
     * @tc.name      ListBeExchange_ShrinkScaleOf_0118
     * @tc.desc      shrinkScaleOf(curveValue=137) returns -12.7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0118 begin`);
      const actual: number = shrinkScaleOf(137);
      logInfo(`shrinkScaleOf(curveValue=137): actual=${actual}`);
      expect(actual).assertClose(-12.7, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0118 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0119
     * @tc.name      ListBeExchange_ShrinkScaleOf_0119
     * @tc.desc      shrinkScaleOf(curveValue=74.05) returns -6.404999999999999
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0119 begin`);
      const actual: number = shrinkScaleOf(74.05);
      logInfo(`shrinkScaleOf(curveValue=74.05): actual=${actual}`);
      expect(actual).assertClose(-6.404999999999999, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0119 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_SHRINK_SCALE_OF_0120
     * @tc.name      ListBeExchange_ShrinkScaleOf_0120
     * @tc.desc      shrinkScaleOf(curveValue=87.51) returns -7.751000000000001
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ListBeExchange_ShrinkScaleOf_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ShrinkScaleOf_0120 begin`);
      const actual: number = shrinkScaleOf(87.51);
      logInfo(`shrinkScaleOf(curveValue=87.51): actual=${actual}`);
      expect(actual).assertClose(-7.751000000000001, PRECISION);
      logInfo(`${BUNDLE}ShrinkScaleOf_0120 end`);
    });
  });
}
