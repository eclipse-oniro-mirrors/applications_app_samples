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
import { px2vpAt } from '../model/NdkNotificationLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_NdkNotification]';
const BUNDLE: string = 'NdkNotification_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for px2vpAt (96 cases). */
export default function px2vpAt2Test(): void {
  describe('Px2vpAt2Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0097
     * @tc.name      NdkNotification_Px2vpAt_0097
     * @tc.desc      px2vpAt(px=10, density=35) returns 0.2857142857142857
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0097 begin`);
      const actual: number = px2vpAt(10, 35);
      logInfo(`px2vpAt(px=10, density=35): actual=${actual}`);
      expect(actual).assertClose(0.2857142857142857, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0097 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0098
     * @tc.name      NdkNotification_Px2vpAt_0098
     * @tc.desc      px2vpAt(px=10, density=40) returns 0.25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0098 begin`);
      const actual: number = px2vpAt(10, 40);
      logInfo(`px2vpAt(px=10, density=40): actual=${actual}`);
      expect(actual).assertClose(0.25, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0098 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0099
     * @tc.name      NdkNotification_Px2vpAt_0099
     * @tc.desc      px2vpAt(px=10, density=45) returns 0.2222222222222222
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0099 begin`);
      const actual: number = px2vpAt(10, 45);
      logInfo(`px2vpAt(px=10, density=45): actual=${actual}`);
      expect(actual).assertClose(0.2222222222222222, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0099 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0100
     * @tc.name      NdkNotification_Px2vpAt_0100
     * @tc.desc      px2vpAt(px=10, density=55) returns 0.18181818181818182
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0100 begin`);
      const actual: number = px2vpAt(10, 55);
      logInfo(`px2vpAt(px=10, density=55): actual=${actual}`);
      expect(actual).assertClose(0.18181818181818182, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0100 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0101
     * @tc.name      NdkNotification_Px2vpAt_0101
     * @tc.desc      px2vpAt(px=10, density=60) returns 0.16666666666666666
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0101 begin`);
      const actual: number = px2vpAt(10, 60);
      logInfo(`px2vpAt(px=10, density=60): actual=${actual}`);
      expect(actual).assertClose(0.16666666666666666, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0101 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0102
     * @tc.name      NdkNotification_Px2vpAt_0102
     * @tc.desc      px2vpAt(px=10, density=65) returns 0.15384615384615385
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0102 begin`);
      const actual: number = px2vpAt(10, 65);
      logInfo(`px2vpAt(px=10, density=65): actual=${actual}`);
      expect(actual).assertClose(0.15384615384615385, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0102 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0103
     * @tc.name      NdkNotification_Px2vpAt_0103
     * @tc.desc      px2vpAt(px=10, density=70) returns 0.14285714285714285
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0103 begin`);
      const actual: number = px2vpAt(10, 70);
      logInfo(`px2vpAt(px=10, density=70): actual=${actual}`);
      expect(actual).assertClose(0.14285714285714285, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0103 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0104
     * @tc.name      NdkNotification_Px2vpAt_0104
     * @tc.desc      px2vpAt(px=10, density=80) returns 0.125
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0104 begin`);
      const actual: number = px2vpAt(10, 80);
      logInfo(`px2vpAt(px=10, density=80): actual=${actual}`);
      expect(actual).assertClose(0.125, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0104 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0105
     * @tc.name      NdkNotification_Px2vpAt_0105
     * @tc.desc      px2vpAt(px=10, density=85) returns 0.11764705882352941
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0105 begin`);
      const actual: number = px2vpAt(10, 85);
      logInfo(`px2vpAt(px=10, density=85): actual=${actual}`);
      expect(actual).assertClose(0.11764705882352941, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0105 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0106
     * @tc.name      NdkNotification_Px2vpAt_0106
     * @tc.desc      px2vpAt(px=10, density=90) returns 0.1111111111111111
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0106 begin`);
      const actual: number = px2vpAt(10, 90);
      logInfo(`px2vpAt(px=10, density=90): actual=${actual}`);
      expect(actual).assertClose(0.1111111111111111, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0106 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0107
     * @tc.name      NdkNotification_Px2vpAt_0107
     * @tc.desc      px2vpAt(px=10, density=95) returns 0.10526315789473684
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0107 begin`);
      const actual: number = px2vpAt(10, 95);
      logInfo(`px2vpAt(px=10, density=95): actual=${actual}`);
      expect(actual).assertClose(0.10526315789473684, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0107 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0108
     * @tc.name      NdkNotification_Px2vpAt_0108
     * @tc.desc      px2vpAt(px=10, density=105) returns 0.09523809523809523
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0108 begin`);
      const actual: number = px2vpAt(10, 105);
      logInfo(`px2vpAt(px=10, density=105): actual=${actual}`);
      expect(actual).assertClose(0.09523809523809523, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0108 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0109
     * @tc.name      NdkNotification_Px2vpAt_0109
     * @tc.desc      px2vpAt(px=10, density=110) returns 0.09090909090909091
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0109 begin`);
      const actual: number = px2vpAt(10, 110);
      logInfo(`px2vpAt(px=10, density=110): actual=${actual}`);
      expect(actual).assertClose(0.09090909090909091, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0109 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0110
     * @tc.name      NdkNotification_Px2vpAt_0110
     * @tc.desc      px2vpAt(px=10, density=115) returns 0.08695652173913043
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0110 begin`);
      const actual: number = px2vpAt(10, 115);
      logInfo(`px2vpAt(px=10, density=115): actual=${actual}`);
      expect(actual).assertClose(0.08695652173913043, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0110 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0111
     * @tc.name      NdkNotification_Px2vpAt_0111
     * @tc.desc      px2vpAt(px=10, density=38) returns 0.2631578947368421
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0111 begin`);
      const actual: number = px2vpAt(10, 38);
      logInfo(`px2vpAt(px=10, density=38): actual=${actual}`);
      expect(actual).assertClose(0.2631578947368421, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0111 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0112
     * @tc.name      NdkNotification_Px2vpAt_0112
     * @tc.desc      px2vpAt(px=10, density=152) returns 0.06578947368421052
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0112 begin`);
      const actual: number = px2vpAt(10, 152);
      logInfo(`px2vpAt(px=10, density=152): actual=${actual}`);
      expect(actual).assertClose(0.06578947368421052, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0112 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0113
     * @tc.name      NdkNotification_Px2vpAt_0113
     * @tc.desc      px2vpAt(px=100, density=1) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_Px2vpAt_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}Px2vpAt_0113 begin`);
      const actual: number = px2vpAt(100, 1);
      logInfo(`px2vpAt(px=100, density=1): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}Px2vpAt_0113 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0114
     * @tc.name      NdkNotification_Px2vpAt_0114
     * @tc.desc      px2vpAt(px=100, density=2) returns 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0114 begin`);
      const actual: number = px2vpAt(100, 2);
      logInfo(`px2vpAt(px=100, density=2): actual=${actual}`);
      expect(actual).assertEqual(50);
      logInfo(`${BUNDLE}Px2vpAt_0114 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0115
     * @tc.name      NdkNotification_Px2vpAt_0115
     * @tc.desc      px2vpAt(px=100, density=3) returns 33.333333333333336
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0115 begin`);
      const actual: number = px2vpAt(100, 3);
      logInfo(`px2vpAt(px=100, density=3): actual=${actual}`);
      expect(actual).assertClose(33.333333333333336, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0115 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0116
     * @tc.name      NdkNotification_Px2vpAt_0116
     * @tc.desc      px2vpAt(px=100, density=5) returns 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0116 begin`);
      const actual: number = px2vpAt(100, 5);
      logInfo(`px2vpAt(px=100, density=5): actual=${actual}`);
      expect(actual).assertEqual(20);
      logInfo(`${BUNDLE}Px2vpAt_0116 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0117
     * @tc.name      NdkNotification_Px2vpAt_0117
     * @tc.desc      px2vpAt(px=100, density=15) returns 6.666666666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0117 begin`);
      const actual: number = px2vpAt(100, 15);
      logInfo(`px2vpAt(px=100, density=15): actual=${actual}`);
      expect(actual).assertClose(6.666666666666667, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0117 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0118
     * @tc.name      NdkNotification_Px2vpAt_0118
     * @tc.desc      px2vpAt(px=100, density=25) returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0118 begin`);
      const actual: number = px2vpAt(100, 25);
      logInfo(`px2vpAt(px=100, density=25): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}Px2vpAt_0118 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0119
     * @tc.name      NdkNotification_Px2vpAt_0119
     * @tc.desc      px2vpAt(px=100, density=35) returns 2.857142857142857
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0119 begin`);
      const actual: number = px2vpAt(100, 35);
      logInfo(`px2vpAt(px=100, density=35): actual=${actual}`);
      expect(actual).assertClose(2.857142857142857, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0119 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0120
     * @tc.name      NdkNotification_Px2vpAt_0120
     * @tc.desc      px2vpAt(px=100, density=40) returns 2.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0120 begin`);
      const actual: number = px2vpAt(100, 40);
      logInfo(`px2vpAt(px=100, density=40): actual=${actual}`);
      expect(actual).assertClose(2.5, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0120 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0121
     * @tc.name      NdkNotification_Px2vpAt_0121
     * @tc.desc      px2vpAt(px=100, density=45) returns 2.2222222222222223
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0121 begin`);
      const actual: number = px2vpAt(100, 45);
      logInfo(`px2vpAt(px=100, density=45): actual=${actual}`);
      expect(actual).assertClose(2.2222222222222223, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0121 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0122
     * @tc.name      NdkNotification_Px2vpAt_0122
     * @tc.desc      px2vpAt(px=100, density=55) returns 1.8181818181818181
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0122 begin`);
      const actual: number = px2vpAt(100, 55);
      logInfo(`px2vpAt(px=100, density=55): actual=${actual}`);
      expect(actual).assertClose(1.8181818181818181, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0122 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0123
     * @tc.name      NdkNotification_Px2vpAt_0123
     * @tc.desc      px2vpAt(px=100, density=60) returns 1.6666666666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0123 begin`);
      const actual: number = px2vpAt(100, 60);
      logInfo(`px2vpAt(px=100, density=60): actual=${actual}`);
      expect(actual).assertClose(1.6666666666666667, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0123 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0124
     * @tc.name      NdkNotification_Px2vpAt_0124
     * @tc.desc      px2vpAt(px=100, density=65) returns 1.5384615384615385
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0124 begin`);
      const actual: number = px2vpAt(100, 65);
      logInfo(`px2vpAt(px=100, density=65): actual=${actual}`);
      expect(actual).assertClose(1.5384615384615385, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0124 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0125
     * @tc.name      NdkNotification_Px2vpAt_0125
     * @tc.desc      px2vpAt(px=100, density=70) returns 1.4285714285714286
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0125 begin`);
      const actual: number = px2vpAt(100, 70);
      logInfo(`px2vpAt(px=100, density=70): actual=${actual}`);
      expect(actual).assertClose(1.4285714285714286, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0125 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0126
     * @tc.name      NdkNotification_Px2vpAt_0126
     * @tc.desc      px2vpAt(px=100, density=75) returns 1.3333333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0126 begin`);
      const actual: number = px2vpAt(100, 75);
      logInfo(`px2vpAt(px=100, density=75): actual=${actual}`);
      expect(actual).assertClose(1.3333333333333333, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0126 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0127
     * @tc.name      NdkNotification_Px2vpAt_0127
     * @tc.desc      px2vpAt(px=100, density=80) returns 1.25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0127 begin`);
      const actual: number = px2vpAt(100, 80);
      logInfo(`px2vpAt(px=100, density=80): actual=${actual}`);
      expect(actual).assertClose(1.25, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0127 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0128
     * @tc.name      NdkNotification_Px2vpAt_0128
     * @tc.desc      px2vpAt(px=100, density=85) returns 1.1764705882352942
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0128 begin`);
      const actual: number = px2vpAt(100, 85);
      logInfo(`px2vpAt(px=100, density=85): actual=${actual}`);
      expect(actual).assertClose(1.1764705882352942, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0128 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0129
     * @tc.name      NdkNotification_Px2vpAt_0129
     * @tc.desc      px2vpAt(px=100, density=90) returns 1.1111111111111112
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0129 begin`);
      const actual: number = px2vpAt(100, 90);
      logInfo(`px2vpAt(px=100, density=90): actual=${actual}`);
      expect(actual).assertClose(1.1111111111111112, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0129 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0130
     * @tc.name      NdkNotification_Px2vpAt_0130
     * @tc.desc      px2vpAt(px=100, density=95) returns 1.0526315789473684
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0130 begin`);
      const actual: number = px2vpAt(100, 95);
      logInfo(`px2vpAt(px=100, density=95): actual=${actual}`);
      expect(actual).assertClose(1.0526315789473684, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0130 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0131
     * @tc.name      NdkNotification_Px2vpAt_0131
     * @tc.desc      px2vpAt(px=100, density=105) returns 0.9523809523809523
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0131 begin`);
      const actual: number = px2vpAt(100, 105);
      logInfo(`px2vpAt(px=100, density=105): actual=${actual}`);
      expect(actual).assertClose(0.9523809523809523, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0131 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0132
     * @tc.name      NdkNotification_Px2vpAt_0132
     * @tc.desc      px2vpAt(px=100, density=110) returns 0.9090909090909091
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0132 begin`);
      const actual: number = px2vpAt(100, 110);
      logInfo(`px2vpAt(px=100, density=110): actual=${actual}`);
      expect(actual).assertClose(0.9090909090909091, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0132 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0133
     * @tc.name      NdkNotification_Px2vpAt_0133
     * @tc.desc      px2vpAt(px=100, density=115) returns 0.8695652173913043
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0133 begin`);
      const actual: number = px2vpAt(100, 115);
      logInfo(`px2vpAt(px=100, density=115): actual=${actual}`);
      expect(actual).assertClose(0.8695652173913043, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0133 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0134
     * @tc.name      NdkNotification_Px2vpAt_0134
     * @tc.desc      px2vpAt(px=100, density=38) returns 2.6315789473684212
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0134 begin`);
      const actual: number = px2vpAt(100, 38);
      logInfo(`px2vpAt(px=100, density=38): actual=${actual}`);
      expect(actual).assertClose(2.6315789473684212, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0134 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0135
     * @tc.name      NdkNotification_Px2vpAt_0135
     * @tc.desc      px2vpAt(px=100, density=152) returns 0.6578947368421053
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0135 begin`);
      const actual: number = px2vpAt(100, 152);
      logInfo(`px2vpAt(px=100, density=152): actual=${actual}`);
      expect(actual).assertClose(0.6578947368421053, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0135 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0136
     * @tc.name      NdkNotification_Px2vpAt_0136
     * @tc.desc      px2vpAt(px=5, density=60) returns 0.08333333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0136 begin`);
      const actual: number = px2vpAt(5, 60);
      logInfo(`px2vpAt(px=5, density=60): actual=${actual}`);
      expect(actual).assertClose(0.08333333333333333, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0136 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0137
     * @tc.name      NdkNotification_Px2vpAt_0137
     * @tc.desc      px2vpAt(px=5, density=65) returns 0.07692307692307693
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0137 begin`);
      const actual: number = px2vpAt(5, 65);
      logInfo(`px2vpAt(px=5, density=65): actual=${actual}`);
      expect(actual).assertClose(0.07692307692307693, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0137 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0138
     * @tc.name      NdkNotification_Px2vpAt_0138
     * @tc.desc      px2vpAt(px=5, density=70) returns 0.07142857142857142
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0138 begin`);
      const actual: number = px2vpAt(5, 70);
      logInfo(`px2vpAt(px=5, density=70): actual=${actual}`);
      expect(actual).assertClose(0.07142857142857142, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0138 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0139
     * @tc.name      NdkNotification_Px2vpAt_0139
     * @tc.desc      px2vpAt(px=5, density=80) returns 0.0625
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0139 begin`);
      const actual: number = px2vpAt(5, 80);
      logInfo(`px2vpAt(px=5, density=80): actual=${actual}`);
      expect(actual).assertClose(0.0625, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0139 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0140
     * @tc.name      NdkNotification_Px2vpAt_0140
     * @tc.desc      px2vpAt(px=5, density=85) returns 0.058823529411764705
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0140 begin`);
      const actual: number = px2vpAt(5, 85);
      logInfo(`px2vpAt(px=5, density=85): actual=${actual}`);
      expect(actual).assertClose(0.058823529411764705, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0140 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0141
     * @tc.name      NdkNotification_Px2vpAt_0141
     * @tc.desc      px2vpAt(px=5, density=90) returns 0.05555555555555555
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0141 begin`);
      const actual: number = px2vpAt(5, 90);
      logInfo(`px2vpAt(px=5, density=90): actual=${actual}`);
      expect(actual).assertClose(0.05555555555555555, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0141 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0142
     * @tc.name      NdkNotification_Px2vpAt_0142
     * @tc.desc      px2vpAt(px=5, density=105) returns 0.047619047619047616
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0142 begin`);
      const actual: number = px2vpAt(5, 105);
      logInfo(`px2vpAt(px=5, density=105): actual=${actual}`);
      expect(actual).assertClose(0.047619047619047616, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0142 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0143
     * @tc.name      NdkNotification_Px2vpAt_0143
     * @tc.desc      px2vpAt(px=5, density=110) returns 0.045454545454545456
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0143 begin`);
      const actual: number = px2vpAt(5, 110);
      logInfo(`px2vpAt(px=5, density=110): actual=${actual}`);
      expect(actual).assertClose(0.045454545454545456, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0143 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0144
     * @tc.name      NdkNotification_Px2vpAt_0144
     * @tc.desc      px2vpAt(px=5, density=115) returns 0.043478260869565216
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0144 begin`);
      const actual: number = px2vpAt(5, 115);
      logInfo(`px2vpAt(px=5, density=115): actual=${actual}`);
      expect(actual).assertClose(0.043478260869565216, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0144 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0145
     * @tc.name      NdkNotification_Px2vpAt_0145
     * @tc.desc      px2vpAt(px=5, density=38) returns 0.13157894736842105
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0145 begin`);
      const actual: number = px2vpAt(5, 38);
      logInfo(`px2vpAt(px=5, density=38): actual=${actual}`);
      expect(actual).assertClose(0.13157894736842105, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0145 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0146
     * @tc.name      NdkNotification_Px2vpAt_0146
     * @tc.desc      px2vpAt(px=5, density=152) returns 0.03289473684210526
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0146 begin`);
      const actual: number = px2vpAt(5, 152);
      logInfo(`px2vpAt(px=5, density=152): actual=${actual}`);
      expect(actual).assertClose(0.03289473684210526, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0146 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0147
     * @tc.name      NdkNotification_Px2vpAt_0147
     * @tc.desc      px2vpAt(px=15, density=1) returns 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_Px2vpAt_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}Px2vpAt_0147 begin`);
      const actual: number = px2vpAt(15, 1);
      logInfo(`px2vpAt(px=15, density=1): actual=${actual}`);
      expect(actual).assertEqual(15);
      logInfo(`${BUNDLE}Px2vpAt_0147 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0148
     * @tc.name      NdkNotification_Px2vpAt_0148
     * @tc.desc      px2vpAt(px=15, density=2) returns 7.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0148 begin`);
      const actual: number = px2vpAt(15, 2);
      logInfo(`px2vpAt(px=15, density=2): actual=${actual}`);
      expect(actual).assertClose(7.5, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0148 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0149
     * @tc.name      NdkNotification_Px2vpAt_0149
     * @tc.desc      px2vpAt(px=15, density=20) returns 0.75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0149 begin`);
      const actual: number = px2vpAt(15, 20);
      logInfo(`px2vpAt(px=15, density=20): actual=${actual}`);
      expect(actual).assertClose(0.75, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0149 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0150
     * @tc.name      NdkNotification_Px2vpAt_0150
     * @tc.desc      px2vpAt(px=15, density=35) returns 0.42857142857142855
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0150 begin`);
      const actual: number = px2vpAt(15, 35);
      logInfo(`px2vpAt(px=15, density=35): actual=${actual}`);
      expect(actual).assertClose(0.42857142857142855, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0150 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0151
     * @tc.name      NdkNotification_Px2vpAt_0151
     * @tc.desc      px2vpAt(px=15, density=40) returns 0.375
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0151 begin`);
      const actual: number = px2vpAt(15, 40);
      logInfo(`px2vpAt(px=15, density=40): actual=${actual}`);
      expect(actual).assertClose(0.375, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0151 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0152
     * @tc.name      NdkNotification_Px2vpAt_0152
     * @tc.desc      px2vpAt(px=15, density=55) returns 0.2727272727272727
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0152 begin`);
      const actual: number = px2vpAt(15, 55);
      logInfo(`px2vpAt(px=15, density=55): actual=${actual}`);
      expect(actual).assertClose(0.2727272727272727, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0152 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0153
     * @tc.name      NdkNotification_Px2vpAt_0153
     * @tc.desc      px2vpAt(px=15, density=65) returns 0.23076923076923078
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0153 begin`);
      const actual: number = px2vpAt(15, 65);
      logInfo(`px2vpAt(px=15, density=65): actual=${actual}`);
      expect(actual).assertClose(0.23076923076923078, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0153 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0154
     * @tc.name      NdkNotification_Px2vpAt_0154
     * @tc.desc      px2vpAt(px=15, density=70) returns 0.21428571428571427
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0154 begin`);
      const actual: number = px2vpAt(15, 70);
      logInfo(`px2vpAt(px=15, density=70): actual=${actual}`);
      expect(actual).assertClose(0.21428571428571427, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0154 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0155
     * @tc.name      NdkNotification_Px2vpAt_0155
     * @tc.desc      px2vpAt(px=15, density=80) returns 0.1875
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0155 begin`);
      const actual: number = px2vpAt(15, 80);
      logInfo(`px2vpAt(px=15, density=80): actual=${actual}`);
      expect(actual).assertClose(0.1875, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0155 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0156
     * @tc.name      NdkNotification_Px2vpAt_0156
     * @tc.desc      px2vpAt(px=15, density=85) returns 0.17647058823529413
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0156 begin`);
      const actual: number = px2vpAt(15, 85);
      logInfo(`px2vpAt(px=15, density=85): actual=${actual}`);
      expect(actual).assertClose(0.17647058823529413, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0156 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0157
     * @tc.name      NdkNotification_Px2vpAt_0157
     * @tc.desc      px2vpAt(px=15, density=95) returns 0.15789473684210525
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0157 begin`);
      const actual: number = px2vpAt(15, 95);
      logInfo(`px2vpAt(px=15, density=95): actual=${actual}`);
      expect(actual).assertClose(0.15789473684210525, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0157 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0158
     * @tc.name      NdkNotification_Px2vpAt_0158
     * @tc.desc      px2vpAt(px=15, density=110) returns 0.13636363636363635
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0158 begin`);
      const actual: number = px2vpAt(15, 110);
      logInfo(`px2vpAt(px=15, density=110): actual=${actual}`);
      expect(actual).assertClose(0.13636363636363635, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0158 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0159
     * @tc.name      NdkNotification_Px2vpAt_0159
     * @tc.desc      px2vpAt(px=15, density=115) returns 0.13043478260869565
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0159 begin`);
      const actual: number = px2vpAt(15, 115);
      logInfo(`px2vpAt(px=15, density=115): actual=${actual}`);
      expect(actual).assertClose(0.13043478260869565, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0159 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0160
     * @tc.name      NdkNotification_Px2vpAt_0160
     * @tc.desc      px2vpAt(px=15, density=38) returns 0.39473684210526316
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0160 begin`);
      const actual: number = px2vpAt(15, 38);
      logInfo(`px2vpAt(px=15, density=38): actual=${actual}`);
      expect(actual).assertClose(0.39473684210526316, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0160 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0161
     * @tc.name      NdkNotification_Px2vpAt_0161
     * @tc.desc      px2vpAt(px=15, density=152) returns 0.09868421052631579
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0161 begin`);
      const actual: number = px2vpAt(15, 152);
      logInfo(`px2vpAt(px=15, density=152): actual=${actual}`);
      expect(actual).assertClose(0.09868421052631579, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0161 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0162
     * @tc.name      NdkNotification_Px2vpAt_0162
     * @tc.desc      px2vpAt(px=20, density=25) returns 0.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0162 begin`);
      const actual: number = px2vpAt(20, 25);
      logInfo(`px2vpAt(px=20, density=25): actual=${actual}`);
      expect(actual).assertClose(0.8, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0162 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0163
     * @tc.name      NdkNotification_Px2vpAt_0163
     * @tc.desc      px2vpAt(px=20, density=35) returns 0.5714285714285714
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0163 begin`);
      const actual: number = px2vpAt(20, 35);
      logInfo(`px2vpAt(px=20, density=35): actual=${actual}`);
      expect(actual).assertClose(0.5714285714285714, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0163 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0164
     * @tc.name      NdkNotification_Px2vpAt_0164
     * @tc.desc      px2vpAt(px=20, density=45) returns 0.4444444444444444
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0164 begin`);
      const actual: number = px2vpAt(20, 45);
      logInfo(`px2vpAt(px=20, density=45): actual=${actual}`);
      expect(actual).assertClose(0.4444444444444444, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0164 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0165
     * @tc.name      NdkNotification_Px2vpAt_0165
     * @tc.desc      px2vpAt(px=20, density=55) returns 0.36363636363636365
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0165 begin`);
      const actual: number = px2vpAt(20, 55);
      logInfo(`px2vpAt(px=20, density=55): actual=${actual}`);
      expect(actual).assertClose(0.36363636363636365, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0165 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0166
     * @tc.name      NdkNotification_Px2vpAt_0166
     * @tc.desc      px2vpAt(px=20, density=65) returns 0.3076923076923077
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0166 begin`);
      const actual: number = px2vpAt(20, 65);
      logInfo(`px2vpAt(px=20, density=65): actual=${actual}`);
      expect(actual).assertClose(0.3076923076923077, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0166 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0167
     * @tc.name      NdkNotification_Px2vpAt_0167
     * @tc.desc      px2vpAt(px=20, density=75) returns 0.26666666666666666
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0167 begin`);
      const actual: number = px2vpAt(20, 75);
      logInfo(`px2vpAt(px=20, density=75): actual=${actual}`);
      expect(actual).assertClose(0.26666666666666666, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0167 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0168
     * @tc.name      NdkNotification_Px2vpAt_0168
     * @tc.desc      px2vpAt(px=20, density=85) returns 0.23529411764705882
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0168 begin`);
      const actual: number = px2vpAt(20, 85);
      logInfo(`px2vpAt(px=20, density=85): actual=${actual}`);
      expect(actual).assertClose(0.23529411764705882, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0168 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0169
     * @tc.name      NdkNotification_Px2vpAt_0169
     * @tc.desc      px2vpAt(px=20, density=95) returns 0.21052631578947367
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0169 begin`);
      const actual: number = px2vpAt(20, 95);
      logInfo(`px2vpAt(px=20, density=95): actual=${actual}`);
      expect(actual).assertClose(0.21052631578947367, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0169 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0170
     * @tc.name      NdkNotification_Px2vpAt_0170
     * @tc.desc      px2vpAt(px=20, density=105) returns 0.19047619047619047
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0170 begin`);
      const actual: number = px2vpAt(20, 105);
      logInfo(`px2vpAt(px=20, density=105): actual=${actual}`);
      expect(actual).assertClose(0.19047619047619047, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0170 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0171
     * @tc.name      NdkNotification_Px2vpAt_0171
     * @tc.desc      px2vpAt(px=20, density=115) returns 0.17391304347826086
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0171 begin`);
      const actual: number = px2vpAt(20, 115);
      logInfo(`px2vpAt(px=20, density=115): actual=${actual}`);
      expect(actual).assertClose(0.17391304347826086, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0171 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0172
     * @tc.name      NdkNotification_Px2vpAt_0172
     * @tc.desc      px2vpAt(px=20, density=38) returns 0.5263157894736842
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0172 begin`);
      const actual: number = px2vpAt(20, 38);
      logInfo(`px2vpAt(px=20, density=38): actual=${actual}`);
      expect(actual).assertClose(0.5263157894736842, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0172 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0173
     * @tc.name      NdkNotification_Px2vpAt_0173
     * @tc.desc      px2vpAt(px=25, density=1) returns 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_Px2vpAt_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}Px2vpAt_0173 begin`);
      const actual: number = px2vpAt(25, 1);
      logInfo(`px2vpAt(px=25, density=1): actual=${actual}`);
      expect(actual).assertEqual(25);
      logInfo(`${BUNDLE}Px2vpAt_0173 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0174
     * @tc.name      NdkNotification_Px2vpAt_0174
     * @tc.desc      px2vpAt(px=25, density=2) returns 12.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0174 begin`);
      const actual: number = px2vpAt(25, 2);
      logInfo(`px2vpAt(px=25, density=2): actual=${actual}`);
      expect(actual).assertClose(12.5, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0174 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0175
     * @tc.name      NdkNotification_Px2vpAt_0175
     * @tc.desc      px2vpAt(px=25, density=3) returns 8.333333333333334
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0175 begin`);
      const actual: number = px2vpAt(25, 3);
      logInfo(`px2vpAt(px=25, density=3): actual=${actual}`);
      expect(actual).assertClose(8.333333333333334, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0175 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0176
     * @tc.name      NdkNotification_Px2vpAt_0176
     * @tc.desc      px2vpAt(px=25, density=30) returns 0.8333333333333334
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0176 begin`);
      const actual: number = px2vpAt(25, 30);
      logInfo(`px2vpAt(px=25, density=30): actual=${actual}`);
      expect(actual).assertClose(0.8333333333333334, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0176 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0177
     * @tc.name      NdkNotification_Px2vpAt_0177
     * @tc.desc      px2vpAt(px=25, density=35) returns 0.7142857142857143
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0177 begin`);
      const actual: number = px2vpAt(25, 35);
      logInfo(`px2vpAt(px=25, density=35): actual=${actual}`);
      expect(actual).assertClose(0.7142857142857143, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0177 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0178
     * @tc.name      NdkNotification_Px2vpAt_0178
     * @tc.desc      px2vpAt(px=25, density=40) returns 0.625
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0178 begin`);
      const actual: number = px2vpAt(25, 40);
      logInfo(`px2vpAt(px=25, density=40): actual=${actual}`);
      expect(actual).assertClose(0.625, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0178 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0179
     * @tc.name      NdkNotification_Px2vpAt_0179
     * @tc.desc      px2vpAt(px=25, density=45) returns 0.5555555555555556
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0179 begin`);
      const actual: number = px2vpAt(25, 45);
      logInfo(`px2vpAt(px=25, density=45): actual=${actual}`);
      expect(actual).assertClose(0.5555555555555556, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0179 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0180
     * @tc.name      NdkNotification_Px2vpAt_0180
     * @tc.desc      px2vpAt(px=25, density=55) returns 0.45454545454545453
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0180 begin`);
      const actual: number = px2vpAt(25, 55);
      logInfo(`px2vpAt(px=25, density=55): actual=${actual}`);
      expect(actual).assertClose(0.45454545454545453, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0180 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0181
     * @tc.name      NdkNotification_Px2vpAt_0181
     * @tc.desc      px2vpAt(px=25, density=60) returns 0.4166666666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0181 begin`);
      const actual: number = px2vpAt(25, 60);
      logInfo(`px2vpAt(px=25, density=60): actual=${actual}`);
      expect(actual).assertClose(0.4166666666666667, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0181 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0182
     * @tc.name      NdkNotification_Px2vpAt_0182
     * @tc.desc      px2vpAt(px=25, density=65) returns 0.38461538461538464
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0182 begin`);
      const actual: number = px2vpAt(25, 65);
      logInfo(`px2vpAt(px=25, density=65): actual=${actual}`);
      expect(actual).assertClose(0.38461538461538464, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0182 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0183
     * @tc.name      NdkNotification_Px2vpAt_0183
     * @tc.desc      px2vpAt(px=25, density=70) returns 0.35714285714285715
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0183 begin`);
      const actual: number = px2vpAt(25, 70);
      logInfo(`px2vpAt(px=25, density=70): actual=${actual}`);
      expect(actual).assertClose(0.35714285714285715, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0183 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0184
     * @tc.name      NdkNotification_Px2vpAt_0184
     * @tc.desc      px2vpAt(px=25, density=80) returns 0.3125
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0184 begin`);
      const actual: number = px2vpAt(25, 80);
      logInfo(`px2vpAt(px=25, density=80): actual=${actual}`);
      expect(actual).assertClose(0.3125, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0184 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0185
     * @tc.name      NdkNotification_Px2vpAt_0185
     * @tc.desc      px2vpAt(px=25, density=85) returns 0.29411764705882354
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0185 begin`);
      const actual: number = px2vpAt(25, 85);
      logInfo(`px2vpAt(px=25, density=85): actual=${actual}`);
      expect(actual).assertClose(0.29411764705882354, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0185 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0186
     * @tc.name      NdkNotification_Px2vpAt_0186
     * @tc.desc      px2vpAt(px=25, density=90) returns 0.2777777777777778
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0186 begin`);
      const actual: number = px2vpAt(25, 90);
      logInfo(`px2vpAt(px=25, density=90): actual=${actual}`);
      expect(actual).assertClose(0.2777777777777778, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0186 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0187
     * @tc.name      NdkNotification_Px2vpAt_0187
     * @tc.desc      px2vpAt(px=25, density=105) returns 0.23809523809523808
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0187 begin`);
      const actual: number = px2vpAt(25, 105);
      logInfo(`px2vpAt(px=25, density=105): actual=${actual}`);
      expect(actual).assertClose(0.23809523809523808, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0187 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0188
     * @tc.name      NdkNotification_Px2vpAt_0188
     * @tc.desc      px2vpAt(px=25, density=110) returns 0.22727272727272727
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0188 begin`);
      const actual: number = px2vpAt(25, 110);
      logInfo(`px2vpAt(px=25, density=110): actual=${actual}`);
      expect(actual).assertClose(0.22727272727272727, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0188 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0189
     * @tc.name      NdkNotification_Px2vpAt_0189
     * @tc.desc      px2vpAt(px=25, density=115) returns 0.21739130434782608
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0189 begin`);
      const actual: number = px2vpAt(25, 115);
      logInfo(`px2vpAt(px=25, density=115): actual=${actual}`);
      expect(actual).assertClose(0.21739130434782608, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0189 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0190
     * @tc.name      NdkNotification_Px2vpAt_0190
     * @tc.desc      px2vpAt(px=25, density=152) returns 0.16447368421052633
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0190 begin`);
      const actual: number = px2vpAt(25, 152);
      logInfo(`px2vpAt(px=25, density=152): actual=${actual}`);
      expect(actual).assertClose(0.16447368421052633, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0190 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0191
     * @tc.name      NdkNotification_Px2vpAt_0191
     * @tc.desc      px2vpAt(px=30, density=1) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_Px2vpAt_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}Px2vpAt_0191 begin`);
      const actual: number = px2vpAt(30, 1);
      logInfo(`px2vpAt(px=30, density=1): actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}Px2vpAt_0191 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0192
     * @tc.name      NdkNotification_Px2vpAt_0192
     * @tc.desc      px2vpAt(px=30, density=5) returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0192 begin`);
      const actual: number = px2vpAt(30, 5);
      logInfo(`px2vpAt(px=30, density=5): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}Px2vpAt_0192 end`);
    });
  });
}
