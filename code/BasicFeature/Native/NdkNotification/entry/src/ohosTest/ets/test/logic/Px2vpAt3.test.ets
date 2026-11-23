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
export default function px2vpAt3Test(): void {
  describe('Px2vpAt3Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0193
     * @tc.name      NdkNotification_Px2vpAt_0193
     * @tc.desc      px2vpAt(px=30, density=25) returns 1.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0193 begin`);
      const actual: number = px2vpAt(30, 25);
      logInfo(`px2vpAt(px=30, density=25): actual=${actual}`);
      expect(actual).assertClose(1.2, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0193 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0194
     * @tc.name      NdkNotification_Px2vpAt_0194
     * @tc.desc      px2vpAt(px=30, density=35) returns 0.8571428571428571
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0194 begin`);
      const actual: number = px2vpAt(30, 35);
      logInfo(`px2vpAt(px=30, density=35): actual=${actual}`);
      expect(actual).assertClose(0.8571428571428571, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0194 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0195
     * @tc.name      NdkNotification_Px2vpAt_0195
     * @tc.desc      px2vpAt(px=30, density=55) returns 0.5454545454545454
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0195 begin`);
      const actual: number = px2vpAt(30, 55);
      logInfo(`px2vpAt(px=30, density=55): actual=${actual}`);
      expect(actual).assertClose(0.5454545454545454, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0195 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0196
     * @tc.name      NdkNotification_Px2vpAt_0196
     * @tc.desc      px2vpAt(px=30, density=65) returns 0.46153846153846156
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0196 begin`);
      const actual: number = px2vpAt(30, 65);
      logInfo(`px2vpAt(px=30, density=65): actual=${actual}`);
      expect(actual).assertClose(0.46153846153846156, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0196 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0197
     * @tc.name      NdkNotification_Px2vpAt_0197
     * @tc.desc      px2vpAt(px=30, density=85) returns 0.35294117647058826
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0197 begin`);
      const actual: number = px2vpAt(30, 85);
      logInfo(`px2vpAt(px=30, density=85): actual=${actual}`);
      expect(actual).assertClose(0.35294117647058826, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0197 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0198
     * @tc.name      NdkNotification_Px2vpAt_0198
     * @tc.desc      px2vpAt(px=30, density=95) returns 0.3157894736842105
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0198 begin`);
      const actual: number = px2vpAt(30, 95);
      logInfo(`px2vpAt(px=30, density=95): actual=${actual}`);
      expect(actual).assertClose(0.3157894736842105, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0198 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0199
     * @tc.name      NdkNotification_Px2vpAt_0199
     * @tc.desc      px2vpAt(px=30, density=115) returns 0.2608695652173913
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0199 begin`);
      const actual: number = px2vpAt(30, 115);
      logInfo(`px2vpAt(px=30, density=115): actual=${actual}`);
      expect(actual).assertClose(0.2608695652173913, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0199 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0200
     * @tc.name      NdkNotification_Px2vpAt_0200
     * @tc.desc      px2vpAt(px=30, density=38) returns 0.7894736842105263
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0200 begin`);
      const actual: number = px2vpAt(30, 38);
      logInfo(`px2vpAt(px=30, density=38): actual=${actual}`);
      expect(actual).assertClose(0.7894736842105263, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0200 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0201
     * @tc.name      NdkNotification_Px2vpAt_0201
     * @tc.desc      px2vpAt(px=30, density=152) returns 0.19736842105263158
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0201 begin`);
      const actual: number = px2vpAt(30, 152);
      logInfo(`px2vpAt(px=30, density=152): actual=${actual}`);
      expect(actual).assertClose(0.19736842105263158, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0201 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0202
     * @tc.name      NdkNotification_Px2vpAt_0202
     * @tc.desc      px2vpAt(px=35, density=1) returns 35
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_Px2vpAt_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}Px2vpAt_0202 begin`);
      const actual: number = px2vpAt(35, 1);
      logInfo(`px2vpAt(px=35, density=1): actual=${actual}`);
      expect(actual).assertEqual(35);
      logInfo(`${BUNDLE}Px2vpAt_0202 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0203
     * @tc.name      NdkNotification_Px2vpAt_0203
     * @tc.desc      px2vpAt(px=35, density=2) returns 17.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0203 begin`);
      const actual: number = px2vpAt(35, 2);
      logInfo(`px2vpAt(px=35, density=2): actual=${actual}`);
      expect(actual).assertClose(17.5, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0203 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0204
     * @tc.name      NdkNotification_Px2vpAt_0204
     * @tc.desc      px2vpAt(px=35, density=3) returns 11.666666666666666
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0204 begin`);
      const actual: number = px2vpAt(35, 3);
      logInfo(`px2vpAt(px=35, density=3): actual=${actual}`);
      expect(actual).assertClose(11.666666666666666, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0204 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0205
     * @tc.name      NdkNotification_Px2vpAt_0205
     * @tc.desc      px2vpAt(px=35, density=10) returns 3.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0205 begin`);
      const actual: number = px2vpAt(35, 10);
      logInfo(`px2vpAt(px=35, density=10): actual=${actual}`);
      expect(actual).assertClose(3.5, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0205 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0206
     * @tc.name      NdkNotification_Px2vpAt_0206
     * @tc.desc      px2vpAt(px=35, density=100) returns 0.35
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0206 begin`);
      const actual: number = px2vpAt(35, 100);
      logInfo(`px2vpAt(px=35, density=100): actual=${actual}`);
      expect(actual).assertClose(0.35, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0206 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0207
     * @tc.name      NdkNotification_Px2vpAt_0207
     * @tc.desc      px2vpAt(px=35, density=5) returns 7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0207 begin`);
      const actual: number = px2vpAt(35, 5);
      logInfo(`px2vpAt(px=35, density=5): actual=${actual}`);
      expect(actual).assertEqual(7);
      logInfo(`${BUNDLE}Px2vpAt_0207 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0208
     * @tc.name      NdkNotification_Px2vpAt_0208
     * @tc.desc      px2vpAt(px=35, density=15) returns 2.3333333333333335
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0208 begin`);
      const actual: number = px2vpAt(35, 15);
      logInfo(`px2vpAt(px=35, density=15): actual=${actual}`);
      expect(actual).assertClose(2.3333333333333335, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0208 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0209
     * @tc.name      NdkNotification_Px2vpAt_0209
     * @tc.desc      px2vpAt(px=35, density=20) returns 1.75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0209 begin`);
      const actual: number = px2vpAt(35, 20);
      logInfo(`px2vpAt(px=35, density=20): actual=${actual}`);
      expect(actual).assertClose(1.75, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0209 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0210
     * @tc.name      NdkNotification_Px2vpAt_0210
     * @tc.desc      px2vpAt(px=35, density=25) returns 1.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0210 begin`);
      const actual: number = px2vpAt(35, 25);
      logInfo(`px2vpAt(px=35, density=25): actual=${actual}`);
      expect(actual).assertClose(1.4, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0210 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0211
     * @tc.name      NdkNotification_Px2vpAt_0211
     * @tc.desc      px2vpAt(px=35, density=30) returns 1.1666666666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0211 begin`);
      const actual: number = px2vpAt(35, 30);
      logInfo(`px2vpAt(px=35, density=30): actual=${actual}`);
      expect(actual).assertClose(1.1666666666666667, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0211 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0212
     * @tc.name      NdkNotification_Px2vpAt_0212
     * @tc.desc      px2vpAt(px=35, density=40) returns 0.875
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0212 begin`);
      const actual: number = px2vpAt(35, 40);
      logInfo(`px2vpAt(px=35, density=40): actual=${actual}`);
      expect(actual).assertClose(0.875, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0212 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0213
     * @tc.name      NdkNotification_Px2vpAt_0213
     * @tc.desc      px2vpAt(px=35, density=45) returns 0.7777777777777778
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0213 begin`);
      const actual: number = px2vpAt(35, 45);
      logInfo(`px2vpAt(px=35, density=45): actual=${actual}`);
      expect(actual).assertClose(0.7777777777777778, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0213 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0214
     * @tc.name      NdkNotification_Px2vpAt_0214
     * @tc.desc      px2vpAt(px=35, density=50) returns 0.7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0214 begin`);
      const actual: number = px2vpAt(35, 50);
      logInfo(`px2vpAt(px=35, density=50): actual=${actual}`);
      expect(actual).assertClose(0.7, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0214 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0215
     * @tc.name      NdkNotification_Px2vpAt_0215
     * @tc.desc      px2vpAt(px=35, density=55) returns 0.6363636363636364
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0215 begin`);
      const actual: number = px2vpAt(35, 55);
      logInfo(`px2vpAt(px=35, density=55): actual=${actual}`);
      expect(actual).assertClose(0.6363636363636364, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0215 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0216
     * @tc.name      NdkNotification_Px2vpAt_0216
     * @tc.desc      px2vpAt(px=35, density=60) returns 0.5833333333333334
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0216 begin`);
      const actual: number = px2vpAt(35, 60);
      logInfo(`px2vpAt(px=35, density=60): actual=${actual}`);
      expect(actual).assertClose(0.5833333333333334, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0216 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0217
     * @tc.name      NdkNotification_Px2vpAt_0217
     * @tc.desc      px2vpAt(px=35, density=65) returns 0.5384615384615384
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0217 begin`);
      const actual: number = px2vpAt(35, 65);
      logInfo(`px2vpAt(px=35, density=65): actual=${actual}`);
      expect(actual).assertClose(0.5384615384615384, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0217 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0218
     * @tc.name      NdkNotification_Px2vpAt_0218
     * @tc.desc      px2vpAt(px=35, density=75) returns 0.4666666666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0218 begin`);
      const actual: number = px2vpAt(35, 75);
      logInfo(`px2vpAt(px=35, density=75): actual=${actual}`);
      expect(actual).assertClose(0.4666666666666667, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0218 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0219
     * @tc.name      NdkNotification_Px2vpAt_0219
     * @tc.desc      px2vpAt(px=35, density=80) returns 0.4375
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0219 begin`);
      const actual: number = px2vpAt(35, 80);
      logInfo(`px2vpAt(px=35, density=80): actual=${actual}`);
      expect(actual).assertClose(0.4375, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0219 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0220
     * @tc.name      NdkNotification_Px2vpAt_0220
     * @tc.desc      px2vpAt(px=35, density=85) returns 0.4117647058823529
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0220 begin`);
      const actual: number = px2vpAt(35, 85);
      logInfo(`px2vpAt(px=35, density=85): actual=${actual}`);
      expect(actual).assertClose(0.4117647058823529, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0220 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0221
     * @tc.name      NdkNotification_Px2vpAt_0221
     * @tc.desc      px2vpAt(px=35, density=90) returns 0.3888888888888889
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0221 begin`);
      const actual: number = px2vpAt(35, 90);
      logInfo(`px2vpAt(px=35, density=90): actual=${actual}`);
      expect(actual).assertClose(0.3888888888888889, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0221 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0222
     * @tc.name      NdkNotification_Px2vpAt_0222
     * @tc.desc      px2vpAt(px=35, density=95) returns 0.3684210526315789
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0222 begin`);
      const actual: number = px2vpAt(35, 95);
      logInfo(`px2vpAt(px=35, density=95): actual=${actual}`);
      expect(actual).assertClose(0.3684210526315789, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0222 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0223
     * @tc.name      NdkNotification_Px2vpAt_0223
     * @tc.desc      px2vpAt(px=35, density=110) returns 0.3181818181818182
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0223 begin`);
      const actual: number = px2vpAt(35, 110);
      logInfo(`px2vpAt(px=35, density=110): actual=${actual}`);
      expect(actual).assertClose(0.3181818181818182, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0223 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0224
     * @tc.name      NdkNotification_Px2vpAt_0224
     * @tc.desc      px2vpAt(px=35, density=115) returns 0.30434782608695654
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0224 begin`);
      const actual: number = px2vpAt(35, 115);
      logInfo(`px2vpAt(px=35, density=115): actual=${actual}`);
      expect(actual).assertClose(0.30434782608695654, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0224 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0225
     * @tc.name      NdkNotification_Px2vpAt_0225
     * @tc.desc      px2vpAt(px=35, density=38) returns 0.9210526315789473
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0225 begin`);
      const actual: number = px2vpAt(35, 38);
      logInfo(`px2vpAt(px=35, density=38): actual=${actual}`);
      expect(actual).assertClose(0.9210526315789473, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0225 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0226
     * @tc.name      NdkNotification_Px2vpAt_0226
     * @tc.desc      px2vpAt(px=35, density=152) returns 0.23026315789473684
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0226 begin`);
      const actual: number = px2vpAt(35, 152);
      logInfo(`px2vpAt(px=35, density=152): actual=${actual}`);
      expect(actual).assertClose(0.23026315789473684, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0226 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0227
     * @tc.name      NdkNotification_Px2vpAt_0227
     * @tc.desc      px2vpAt(px=40, density=1) returns 40
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_Px2vpAt_0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}Px2vpAt_0227 begin`);
      const actual: number = px2vpAt(40, 1);
      logInfo(`px2vpAt(px=40, density=1): actual=${actual}`);
      expect(actual).assertEqual(40);
      logInfo(`${BUNDLE}Px2vpAt_0227 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0228
     * @tc.name      NdkNotification_Px2vpAt_0228
     * @tc.desc      px2vpAt(px=40, density=3) returns 13.333333333333334
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0228 begin`);
      const actual: number = px2vpAt(40, 3);
      logInfo(`px2vpAt(px=40, density=3): actual=${actual}`);
      expect(actual).assertClose(13.333333333333334, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0228 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0229
     * @tc.name      NdkNotification_Px2vpAt_0229
     * @tc.desc      px2vpAt(px=40, density=5) returns 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0229 begin`);
      const actual: number = px2vpAt(40, 5);
      logInfo(`px2vpAt(px=40, density=5): actual=${actual}`);
      expect(actual).assertEqual(8);
      logInfo(`${BUNDLE}Px2vpAt_0229 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0230
     * @tc.name      NdkNotification_Px2vpAt_0230
     * @tc.desc      px2vpAt(px=40, density=15) returns 2.6666666666666665
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0230 begin`);
      const actual: number = px2vpAt(40, 15);
      logInfo(`px2vpAt(px=40, density=15): actual=${actual}`);
      expect(actual).assertClose(2.6666666666666665, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0230 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0231
     * @tc.name      NdkNotification_Px2vpAt_0231
     * @tc.desc      px2vpAt(px=40, density=25) returns 1.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0231 begin`);
      const actual: number = px2vpAt(40, 25);
      logInfo(`px2vpAt(px=40, density=25): actual=${actual}`);
      expect(actual).assertClose(1.6, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0231 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0232
     * @tc.name      NdkNotification_Px2vpAt_0232
     * @tc.desc      px2vpAt(px=40, density=35) returns 1.1428571428571428
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0232 begin`);
      const actual: number = px2vpAt(40, 35);
      logInfo(`px2vpAt(px=40, density=35): actual=${actual}`);
      expect(actual).assertClose(1.1428571428571428, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0232 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0233
     * @tc.name      NdkNotification_Px2vpAt_0233
     * @tc.desc      px2vpAt(px=40, density=45) returns 0.8888888888888888
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0233 begin`);
      const actual: number = px2vpAt(40, 45);
      logInfo(`px2vpAt(px=40, density=45): actual=${actual}`);
      expect(actual).assertClose(0.8888888888888888, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0233 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0234
     * @tc.name      NdkNotification_Px2vpAt_0234
     * @tc.desc      px2vpAt(px=40, density=55) returns 0.7272727272727273
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0234 begin`);
      const actual: number = px2vpAt(40, 55);
      logInfo(`px2vpAt(px=40, density=55): actual=${actual}`);
      expect(actual).assertClose(0.7272727272727273, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0234 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0235
     * @tc.name      NdkNotification_Px2vpAt_0235
     * @tc.desc      px2vpAt(px=40, density=65) returns 0.6153846153846154
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0235 begin`);
      const actual: number = px2vpAt(40, 65);
      logInfo(`px2vpAt(px=40, density=65): actual=${actual}`);
      expect(actual).assertClose(0.6153846153846154, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0235 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0236
     * @tc.name      NdkNotification_Px2vpAt_0236
     * @tc.desc      px2vpAt(px=40, density=75) returns 0.5333333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0236 begin`);
      const actual: number = px2vpAt(40, 75);
      logInfo(`px2vpAt(px=40, density=75): actual=${actual}`);
      expect(actual).assertClose(0.5333333333333333, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0236 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0237
     * @tc.name      NdkNotification_Px2vpAt_0237
     * @tc.desc      px2vpAt(px=40, density=85) returns 0.47058823529411764
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0237 begin`);
      const actual: number = px2vpAt(40, 85);
      logInfo(`px2vpAt(px=40, density=85): actual=${actual}`);
      expect(actual).assertClose(0.47058823529411764, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0237 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0238
     * @tc.name      NdkNotification_Px2vpAt_0238
     * @tc.desc      px2vpAt(px=40, density=95) returns 0.42105263157894735
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0238 begin`);
      const actual: number = px2vpAt(40, 95);
      logInfo(`px2vpAt(px=40, density=95): actual=${actual}`);
      expect(actual).assertClose(0.42105263157894735, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0238 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0239
     * @tc.name      NdkNotification_Px2vpAt_0239
     * @tc.desc      px2vpAt(px=40, density=105) returns 0.38095238095238093
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0239 begin`);
      const actual: number = px2vpAt(40, 105);
      logInfo(`px2vpAt(px=40, density=105): actual=${actual}`);
      expect(actual).assertClose(0.38095238095238093, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0239 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0240
     * @tc.name      NdkNotification_Px2vpAt_0240
     * @tc.desc      px2vpAt(px=40, density=115) returns 0.34782608695652173
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0240 begin`);
      const actual: number = px2vpAt(40, 115);
      logInfo(`px2vpAt(px=40, density=115): actual=${actual}`);
      expect(actual).assertClose(0.34782608695652173, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0240 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0241
     * @tc.name      NdkNotification_Px2vpAt_0241
     * @tc.desc      px2vpAt(px=45, density=1) returns 45
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_Px2vpAt_0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}Px2vpAt_0241 begin`);
      const actual: number = px2vpAt(45, 1);
      logInfo(`px2vpAt(px=45, density=1): actual=${actual}`);
      expect(actual).assertEqual(45);
      logInfo(`${BUNDLE}Px2vpAt_0241 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0242
     * @tc.name      NdkNotification_Px2vpAt_0242
     * @tc.desc      px2vpAt(px=45, density=2) returns 22.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0242 begin`);
      const actual: number = px2vpAt(45, 2);
      logInfo(`px2vpAt(px=45, density=2): actual=${actual}`);
      expect(actual).assertClose(22.5, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0242 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0243
     * @tc.name      NdkNotification_Px2vpAt_0243
     * @tc.desc      px2vpAt(px=45, density=10) returns 4.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0243 begin`);
      const actual: number = px2vpAt(45, 10);
      logInfo(`px2vpAt(px=45, density=10): actual=${actual}`);
      expect(actual).assertClose(4.5, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0243 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0244
     * @tc.name      NdkNotification_Px2vpAt_0244
     * @tc.desc      px2vpAt(px=45, density=100) returns 0.45
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0244 begin`);
      const actual: number = px2vpAt(45, 100);
      logInfo(`px2vpAt(px=45, density=100): actual=${actual}`);
      expect(actual).assertClose(0.45, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0244 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0245
     * @tc.name      NdkNotification_Px2vpAt_0245
     * @tc.desc      px2vpAt(px=45, density=5) returns 9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0245 begin`);
      const actual: number = px2vpAt(45, 5);
      logInfo(`px2vpAt(px=45, density=5): actual=${actual}`);
      expect(actual).assertEqual(9);
      logInfo(`${BUNDLE}Px2vpAt_0245 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0246
     * @tc.name      NdkNotification_Px2vpAt_0246
     * @tc.desc      px2vpAt(px=45, density=20) returns 2.25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0246 begin`);
      const actual: number = px2vpAt(45, 20);
      logInfo(`px2vpAt(px=45, density=20): actual=${actual}`);
      expect(actual).assertClose(2.25, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0246 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0247
     * @tc.name      NdkNotification_Px2vpAt_0247
     * @tc.desc      px2vpAt(px=45, density=25) returns 1.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0247 begin`);
      const actual: number = px2vpAt(45, 25);
      logInfo(`px2vpAt(px=45, density=25): actual=${actual}`);
      expect(actual).assertClose(1.8, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0247 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0248
     * @tc.name      NdkNotification_Px2vpAt_0248
     * @tc.desc      px2vpAt(px=45, density=35) returns 1.2857142857142858
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0248 begin`);
      const actual: number = px2vpAt(45, 35);
      logInfo(`px2vpAt(px=45, density=35): actual=${actual}`);
      expect(actual).assertClose(1.2857142857142858, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0248 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0249
     * @tc.name      NdkNotification_Px2vpAt_0249
     * @tc.desc      px2vpAt(px=45, density=40) returns 1.125
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0249 begin`);
      const actual: number = px2vpAt(45, 40);
      logInfo(`px2vpAt(px=45, density=40): actual=${actual}`);
      expect(actual).assertClose(1.125, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0249 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0250
     * @tc.name      NdkNotification_Px2vpAt_0250
     * @tc.desc      px2vpAt(px=45, density=50) returns 0.9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0250 begin`);
      const actual: number = px2vpAt(45, 50);
      logInfo(`px2vpAt(px=45, density=50): actual=${actual}`);
      expect(actual).assertClose(0.9, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0250 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0251
     * @tc.name      NdkNotification_Px2vpAt_0251
     * @tc.desc      px2vpAt(px=45, density=55) returns 0.8181818181818182
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0251 begin`);
      const actual: number = px2vpAt(45, 55);
      logInfo(`px2vpAt(px=45, density=55): actual=${actual}`);
      expect(actual).assertClose(0.8181818181818182, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0251 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0252
     * @tc.name      NdkNotification_Px2vpAt_0252
     * @tc.desc      px2vpAt(px=45, density=65) returns 0.6923076923076923
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0252 begin`);
      const actual: number = px2vpAt(45, 65);
      logInfo(`px2vpAt(px=45, density=65): actual=${actual}`);
      expect(actual).assertClose(0.6923076923076923, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0252 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0253
     * @tc.name      NdkNotification_Px2vpAt_0253
     * @tc.desc      px2vpAt(px=45, density=70) returns 0.6428571428571429
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0253 begin`);
      const actual: number = px2vpAt(45, 70);
      logInfo(`px2vpAt(px=45, density=70): actual=${actual}`);
      expect(actual).assertClose(0.6428571428571429, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0253 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0254
     * @tc.name      NdkNotification_Px2vpAt_0254
     * @tc.desc      px2vpAt(px=45, density=80) returns 0.5625
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0254 begin`);
      const actual: number = px2vpAt(45, 80);
      logInfo(`px2vpAt(px=45, density=80): actual=${actual}`);
      expect(actual).assertClose(0.5625, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0254 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0255
     * @tc.name      NdkNotification_Px2vpAt_0255
     * @tc.desc      px2vpAt(px=45, density=85) returns 0.5294117647058824
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0255 begin`);
      const actual: number = px2vpAt(45, 85);
      logInfo(`px2vpAt(px=45, density=85): actual=${actual}`);
      expect(actual).assertClose(0.5294117647058824, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0255 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0256
     * @tc.name      NdkNotification_Px2vpAt_0256
     * @tc.desc      px2vpAt(px=45, density=95) returns 0.47368421052631576
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0256 begin`);
      const actual: number = px2vpAt(45, 95);
      logInfo(`px2vpAt(px=45, density=95): actual=${actual}`);
      expect(actual).assertClose(0.47368421052631576, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0256 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0257
     * @tc.name      NdkNotification_Px2vpAt_0257
     * @tc.desc      px2vpAt(px=45, density=110) returns 0.4090909090909091
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0257', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0257 begin`);
      const actual: number = px2vpAt(45, 110);
      logInfo(`px2vpAt(px=45, density=110): actual=${actual}`);
      expect(actual).assertClose(0.4090909090909091, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0257 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0258
     * @tc.name      NdkNotification_Px2vpAt_0258
     * @tc.desc      px2vpAt(px=45, density=115) returns 0.391304347826087
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0258', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0258 begin`);
      const actual: number = px2vpAt(45, 115);
      logInfo(`px2vpAt(px=45, density=115): actual=${actual}`);
      expect(actual).assertClose(0.391304347826087, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0258 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0259
     * @tc.name      NdkNotification_Px2vpAt_0259
     * @tc.desc      px2vpAt(px=45, density=38) returns 1.1842105263157894
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0259', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0259 begin`);
      const actual: number = px2vpAt(45, 38);
      logInfo(`px2vpAt(px=45, density=38): actual=${actual}`);
      expect(actual).assertClose(1.1842105263157894, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0259 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0260
     * @tc.name      NdkNotification_Px2vpAt_0260
     * @tc.desc      px2vpAt(px=45, density=152) returns 0.29605263157894735
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0260', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0260 begin`);
      const actual: number = px2vpAt(45, 152);
      logInfo(`px2vpAt(px=45, density=152): actual=${actual}`);
      expect(actual).assertClose(0.29605263157894735, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0260 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0261
     * @tc.name      NdkNotification_Px2vpAt_0261
     * @tc.desc      px2vpAt(px=50, density=3) returns 16.666666666666668
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0261', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0261 begin`);
      const actual: number = px2vpAt(50, 3);
      logInfo(`px2vpAt(px=50, density=3): actual=${actual}`);
      expect(actual).assertClose(16.666666666666668, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0261 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0262
     * @tc.name      NdkNotification_Px2vpAt_0262
     * @tc.desc      px2vpAt(px=50, density=65) returns 0.7692307692307693
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0262', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0262 begin`);
      const actual: number = px2vpAt(50, 65);
      logInfo(`px2vpAt(px=50, density=65): actual=${actual}`);
      expect(actual).assertClose(0.7692307692307693, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0262 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0263
     * @tc.name      NdkNotification_Px2vpAt_0263
     * @tc.desc      px2vpAt(px=50, density=85) returns 0.5882352941176471
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0263', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0263 begin`);
      const actual: number = px2vpAt(50, 85);
      logInfo(`px2vpAt(px=50, density=85): actual=${actual}`);
      expect(actual).assertClose(0.5882352941176471, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0263 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0264
     * @tc.name      NdkNotification_Px2vpAt_0264
     * @tc.desc      px2vpAt(px=50, density=105) returns 0.47619047619047616
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0264', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0264 begin`);
      const actual: number = px2vpAt(50, 105);
      logInfo(`px2vpAt(px=50, density=105): actual=${actual}`);
      expect(actual).assertClose(0.47619047619047616, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0264 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0265
     * @tc.name      NdkNotification_Px2vpAt_0265
     * @tc.desc      px2vpAt(px=50, density=115) returns 0.43478260869565216
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0265', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0265 begin`);
      const actual: number = px2vpAt(50, 115);
      logInfo(`px2vpAt(px=50, density=115): actual=${actual}`);
      expect(actual).assertClose(0.43478260869565216, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0265 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0266
     * @tc.name      NdkNotification_Px2vpAt_0266
     * @tc.desc      px2vpAt(px=50, density=38) returns 1.3157894736842106
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0266', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0266 begin`);
      const actual: number = px2vpAt(50, 38);
      logInfo(`px2vpAt(px=50, density=38): actual=${actual}`);
      expect(actual).assertClose(1.3157894736842106, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0266 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0267
     * @tc.name      NdkNotification_Px2vpAt_0267
     * @tc.desc      px2vpAt(px=50, density=152) returns 0.32894736842105265
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0267', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0267 begin`);
      const actual: number = px2vpAt(50, 152);
      logInfo(`px2vpAt(px=50, density=152): actual=${actual}`);
      expect(actual).assertClose(0.32894736842105265, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0267 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0268
     * @tc.name      NdkNotification_Px2vpAt_0268
     * @tc.desc      px2vpAt(px=55, density=1) returns 55
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_Px2vpAt_0268', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}Px2vpAt_0268 begin`);
      const actual: number = px2vpAt(55, 1);
      logInfo(`px2vpAt(px=55, density=1): actual=${actual}`);
      expect(actual).assertEqual(55);
      logInfo(`${BUNDLE}Px2vpAt_0268 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0269
     * @tc.name      NdkNotification_Px2vpAt_0269
     * @tc.desc      px2vpAt(px=55, density=2) returns 27.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0269', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0269 begin`);
      const actual: number = px2vpAt(55, 2);
      logInfo(`px2vpAt(px=55, density=2): actual=${actual}`);
      expect(actual).assertClose(27.5, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0269 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0270
     * @tc.name      NdkNotification_Px2vpAt_0270
     * @tc.desc      px2vpAt(px=55, density=3) returns 18.333333333333332
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0270', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0270 begin`);
      const actual: number = px2vpAt(55, 3);
      logInfo(`px2vpAt(px=55, density=3): actual=${actual}`);
      expect(actual).assertClose(18.333333333333332, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0270 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0271
     * @tc.name      NdkNotification_Px2vpAt_0271
     * @tc.desc      px2vpAt(px=55, density=10) returns 5.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0271', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0271 begin`);
      const actual: number = px2vpAt(55, 10);
      logInfo(`px2vpAt(px=55, density=10): actual=${actual}`);
      expect(actual).assertClose(5.5, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0271 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0272
     * @tc.name      NdkNotification_Px2vpAt_0272
     * @tc.desc      px2vpAt(px=55, density=100) returns 0.55
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0272', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0272 begin`);
      const actual: number = px2vpAt(55, 100);
      logInfo(`px2vpAt(px=55, density=100): actual=${actual}`);
      expect(actual).assertClose(0.55, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0272 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0273
     * @tc.name      NdkNotification_Px2vpAt_0273
     * @tc.desc      px2vpAt(px=55, density=5) returns 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0273', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0273 begin`);
      const actual: number = px2vpAt(55, 5);
      logInfo(`px2vpAt(px=55, density=5): actual=${actual}`);
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}Px2vpAt_0273 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0274
     * @tc.name      NdkNotification_Px2vpAt_0274
     * @tc.desc      px2vpAt(px=55, density=15) returns 3.6666666666666665
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0274', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0274 begin`);
      const actual: number = px2vpAt(55, 15);
      logInfo(`px2vpAt(px=55, density=15): actual=${actual}`);
      expect(actual).assertClose(3.6666666666666665, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0274 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0275
     * @tc.name      NdkNotification_Px2vpAt_0275
     * @tc.desc      px2vpAt(px=55, density=20) returns 2.75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0275', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0275 begin`);
      const actual: number = px2vpAt(55, 20);
      logInfo(`px2vpAt(px=55, density=20): actual=${actual}`);
      expect(actual).assertClose(2.75, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0275 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0276
     * @tc.name      NdkNotification_Px2vpAt_0276
     * @tc.desc      px2vpAt(px=55, density=25) returns 2.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0276', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0276 begin`);
      const actual: number = px2vpAt(55, 25);
      logInfo(`px2vpAt(px=55, density=25): actual=${actual}`);
      expect(actual).assertClose(2.2, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0276 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0277
     * @tc.name      NdkNotification_Px2vpAt_0277
     * @tc.desc      px2vpAt(px=55, density=30) returns 1.8333333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0277', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0277 begin`);
      const actual: number = px2vpAt(55, 30);
      logInfo(`px2vpAt(px=55, density=30): actual=${actual}`);
      expect(actual).assertClose(1.8333333333333333, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0277 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0278
     * @tc.name      NdkNotification_Px2vpAt_0278
     * @tc.desc      px2vpAt(px=55, density=35) returns 1.5714285714285714
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0278', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0278 begin`);
      const actual: number = px2vpAt(55, 35);
      logInfo(`px2vpAt(px=55, density=35): actual=${actual}`);
      expect(actual).assertClose(1.5714285714285714, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0278 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0279
     * @tc.name      NdkNotification_Px2vpAt_0279
     * @tc.desc      px2vpAt(px=55, density=40) returns 1.375
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0279', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0279 begin`);
      const actual: number = px2vpAt(55, 40);
      logInfo(`px2vpAt(px=55, density=40): actual=${actual}`);
      expect(actual).assertClose(1.375, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0279 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0280
     * @tc.name      NdkNotification_Px2vpAt_0280
     * @tc.desc      px2vpAt(px=55, density=45) returns 1.2222222222222223
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0280', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0280 begin`);
      const actual: number = px2vpAt(55, 45);
      logInfo(`px2vpAt(px=55, density=45): actual=${actual}`);
      expect(actual).assertClose(1.2222222222222223, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0280 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0281
     * @tc.name      NdkNotification_Px2vpAt_0281
     * @tc.desc      px2vpAt(px=55, density=50) returns 1.1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0281', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0281 begin`);
      const actual: number = px2vpAt(55, 50);
      logInfo(`px2vpAt(px=55, density=50): actual=${actual}`);
      expect(actual).assertClose(1.1, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0281 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0282
     * @tc.name      NdkNotification_Px2vpAt_0282
     * @tc.desc      px2vpAt(px=55, density=60) returns 0.9166666666666666
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0282', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0282 begin`);
      const actual: number = px2vpAt(55, 60);
      logInfo(`px2vpAt(px=55, density=60): actual=${actual}`);
      expect(actual).assertClose(0.9166666666666666, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0282 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0283
     * @tc.name      NdkNotification_Px2vpAt_0283
     * @tc.desc      px2vpAt(px=55, density=65) returns 0.8461538461538461
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0283', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0283 begin`);
      const actual: number = px2vpAt(55, 65);
      logInfo(`px2vpAt(px=55, density=65): actual=${actual}`);
      expect(actual).assertClose(0.8461538461538461, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0283 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0284
     * @tc.name      NdkNotification_Px2vpAt_0284
     * @tc.desc      px2vpAt(px=55, density=70) returns 0.7857142857142857
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0284', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0284 begin`);
      const actual: number = px2vpAt(55, 70);
      logInfo(`px2vpAt(px=55, density=70): actual=${actual}`);
      expect(actual).assertClose(0.7857142857142857, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0284 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0285
     * @tc.name      NdkNotification_Px2vpAt_0285
     * @tc.desc      px2vpAt(px=55, density=75) returns 0.7333333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0285', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0285 begin`);
      const actual: number = px2vpAt(55, 75);
      logInfo(`px2vpAt(px=55, density=75): actual=${actual}`);
      expect(actual).assertClose(0.7333333333333333, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0285 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0286
     * @tc.name      NdkNotification_Px2vpAt_0286
     * @tc.desc      px2vpAt(px=55, density=80) returns 0.6875
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0286', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0286 begin`);
      const actual: number = px2vpAt(55, 80);
      logInfo(`px2vpAt(px=55, density=80): actual=${actual}`);
      expect(actual).assertClose(0.6875, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0286 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0287
     * @tc.name      NdkNotification_Px2vpAt_0287
     * @tc.desc      px2vpAt(px=55, density=85) returns 0.6470588235294118
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0287', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0287 begin`);
      const actual: number = px2vpAt(55, 85);
      logInfo(`px2vpAt(px=55, density=85): actual=${actual}`);
      expect(actual).assertClose(0.6470588235294118, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0287 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0288
     * @tc.name      NdkNotification_Px2vpAt_0288
     * @tc.desc      px2vpAt(px=55, density=90) returns 0.6111111111111112
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0288', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0288 begin`);
      const actual: number = px2vpAt(55, 90);
      logInfo(`px2vpAt(px=55, density=90): actual=${actual}`);
      expect(actual).assertClose(0.6111111111111112, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0288 end`);
    });
  });
}
