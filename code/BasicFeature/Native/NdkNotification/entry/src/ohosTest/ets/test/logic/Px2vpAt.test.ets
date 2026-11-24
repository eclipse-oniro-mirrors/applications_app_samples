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
export default function px2vpAtTest(): void {
  describe('Px2vpAtTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0001
     * @tc.name      NdkNotification_Px2vpAt_0001
     * @tc.desc      px2vpAt(px=0, density=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('NdkNotification_Px2vpAt_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Px2vpAt_0001 begin`);
      const actual: number = px2vpAt(0, 0);
      logInfo(`px2vpAt(px=0, density=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}Px2vpAt_0001 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0002
     * @tc.name      NdkNotification_Px2vpAt_0002
     * @tc.desc      px2vpAt(px=-1, density=1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('NdkNotification_Px2vpAt_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Px2vpAt_0002 begin`);
      const actual: number = px2vpAt(-1, 1);
      logInfo(`px2vpAt(px=-1, density=1): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}Px2vpAt_0002 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0003
     * @tc.name      NdkNotification_Px2vpAt_0003
     * @tc.desc      px2vpAt(px=-1, density=2) returns -0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_Px2vpAt_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}Px2vpAt_0003 begin`);
      const actual: number = px2vpAt(-1, 2);
      logInfo(`px2vpAt(px=-1, density=2): actual=${actual}`);
      expect(actual).assertClose(-0.5, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0003 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0004
     * @tc.name      NdkNotification_Px2vpAt_0004
     * @tc.desc      px2vpAt(px=-1, density=3) returns -0.3333333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_Px2vpAt_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}Px2vpAt_0004 begin`);
      const actual: number = px2vpAt(-1, 3);
      logInfo(`px2vpAt(px=-1, density=3): actual=${actual}`);
      expect(actual).assertClose(-0.3333333333333333, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0004 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0005
     * @tc.name      NdkNotification_Px2vpAt_0005
     * @tc.desc      px2vpAt(px=-1, density=10) returns -0.1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_Px2vpAt_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}Px2vpAt_0005 begin`);
      const actual: number = px2vpAt(-1, 10);
      logInfo(`px2vpAt(px=-1, density=10): actual=${actual}`);
      expect(actual).assertClose(-0.1, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0005 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0006
     * @tc.name      NdkNotification_Px2vpAt_0006
     * @tc.desc      px2vpAt(px=-1, density=100) returns -0.01
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_Px2vpAt_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}Px2vpAt_0006 begin`);
      const actual: number = px2vpAt(-1, 100);
      logInfo(`px2vpAt(px=-1, density=100): actual=${actual}`);
      expect(actual).assertClose(-0.01, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0006 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0007
     * @tc.name      NdkNotification_Px2vpAt_0007
     * @tc.desc      px2vpAt(px=-1, density=5) returns -0.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_Px2vpAt_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}Px2vpAt_0007 begin`);
      const actual: number = px2vpAt(-1, 5);
      logInfo(`px2vpAt(px=-1, density=5): actual=${actual}`);
      expect(actual).assertClose(-0.2, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0007 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0008
     * @tc.name      NdkNotification_Px2vpAt_0008
     * @tc.desc      px2vpAt(px=-1, density=15) returns -0.06666666666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_Px2vpAt_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}Px2vpAt_0008 begin`);
      const actual: number = px2vpAt(-1, 15);
      logInfo(`px2vpAt(px=-1, density=15): actual=${actual}`);
      expect(actual).assertClose(-0.06666666666666667, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0008 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0009
     * @tc.name      NdkNotification_Px2vpAt_0009
     * @tc.desc      px2vpAt(px=-1, density=20) returns -0.05
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_Px2vpAt_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}Px2vpAt_0009 begin`);
      const actual: number = px2vpAt(-1, 20);
      logInfo(`px2vpAt(px=-1, density=20): actual=${actual}`);
      expect(actual).assertClose(-0.05, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0009 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0010
     * @tc.name      NdkNotification_Px2vpAt_0010
     * @tc.desc      px2vpAt(px=-1, density=25) returns -0.04
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_Px2vpAt_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}Px2vpAt_0010 begin`);
      const actual: number = px2vpAt(-1, 25);
      logInfo(`px2vpAt(px=-1, density=25): actual=${actual}`);
      expect(actual).assertClose(-0.04, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0010 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0011
     * @tc.name      NdkNotification_Px2vpAt_0011
     * @tc.desc      px2vpAt(px=-1, density=30) returns -0.03333333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_Px2vpAt_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}Px2vpAt_0011 begin`);
      const actual: number = px2vpAt(-1, 30);
      logInfo(`px2vpAt(px=-1, density=30): actual=${actual}`);
      expect(actual).assertClose(-0.03333333333333333, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0011 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0012
     * @tc.name      NdkNotification_Px2vpAt_0012
     * @tc.desc      px2vpAt(px=-1, density=35) returns -0.02857142857142857
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_Px2vpAt_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}Px2vpAt_0012 begin`);
      const actual: number = px2vpAt(-1, 35);
      logInfo(`px2vpAt(px=-1, density=35): actual=${actual}`);
      expect(actual).assertClose(-0.02857142857142857, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0012 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0013
     * @tc.name      NdkNotification_Px2vpAt_0013
     * @tc.desc      px2vpAt(px=-1, density=40) returns -0.025
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_Px2vpAt_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}Px2vpAt_0013 begin`);
      const actual: number = px2vpAt(-1, 40);
      logInfo(`px2vpAt(px=-1, density=40): actual=${actual}`);
      expect(actual).assertClose(-0.025, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0013 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0014
     * @tc.name      NdkNotification_Px2vpAt_0014
     * @tc.desc      px2vpAt(px=-1, density=45) returns -0.022222222222222223
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_Px2vpAt_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}Px2vpAt_0014 begin`);
      const actual: number = px2vpAt(-1, 45);
      logInfo(`px2vpAt(px=-1, density=45): actual=${actual}`);
      expect(actual).assertClose(-0.022222222222222223, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0014 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0015
     * @tc.name      NdkNotification_Px2vpAt_0015
     * @tc.desc      px2vpAt(px=-1, density=50) returns -0.02
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_Px2vpAt_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}Px2vpAt_0015 begin`);
      const actual: number = px2vpAt(-1, 50);
      logInfo(`px2vpAt(px=-1, density=50): actual=${actual}`);
      expect(actual).assertClose(-0.02, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0015 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0016
     * @tc.name      NdkNotification_Px2vpAt_0016
     * @tc.desc      px2vpAt(px=-1, density=55) returns -0.01818181818181818
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_Px2vpAt_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}Px2vpAt_0016 begin`);
      const actual: number = px2vpAt(-1, 55);
      logInfo(`px2vpAt(px=-1, density=55): actual=${actual}`);
      expect(actual).assertClose(-0.01818181818181818, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0016 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0017
     * @tc.name      NdkNotification_Px2vpAt_0017
     * @tc.desc      px2vpAt(px=-1, density=60) returns -0.016666666666666666
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_Px2vpAt_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}Px2vpAt_0017 begin`);
      const actual: number = px2vpAt(-1, 60);
      logInfo(`px2vpAt(px=-1, density=60): actual=${actual}`);
      expect(actual).assertClose(-0.016666666666666666, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0017 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0018
     * @tc.name      NdkNotification_Px2vpAt_0018
     * @tc.desc      px2vpAt(px=-1, density=65) returns -0.015384615384615385
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_Px2vpAt_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}Px2vpAt_0018 begin`);
      const actual: number = px2vpAt(-1, 65);
      logInfo(`px2vpAt(px=-1, density=65): actual=${actual}`);
      expect(actual).assertClose(-0.015384615384615385, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0018 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0019
     * @tc.name      NdkNotification_Px2vpAt_0019
     * @tc.desc      px2vpAt(px=-1, density=70) returns -0.014285714285714285
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_Px2vpAt_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}Px2vpAt_0019 begin`);
      const actual: number = px2vpAt(-1, 70);
      logInfo(`px2vpAt(px=-1, density=70): actual=${actual}`);
      expect(actual).assertClose(-0.014285714285714285, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0019 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0020
     * @tc.name      NdkNotification_Px2vpAt_0020
     * @tc.desc      px2vpAt(px=-1, density=75) returns -0.013333333333333334
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_Px2vpAt_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}Px2vpAt_0020 begin`);
      const actual: number = px2vpAt(-1, 75);
      logInfo(`px2vpAt(px=-1, density=75): actual=${actual}`);
      expect(actual).assertClose(-0.013333333333333334, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0020 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0021
     * @tc.name      NdkNotification_Px2vpAt_0021
     * @tc.desc      px2vpAt(px=-1, density=80) returns -0.0125
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_Px2vpAt_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}Px2vpAt_0021 begin`);
      const actual: number = px2vpAt(-1, 80);
      logInfo(`px2vpAt(px=-1, density=80): actual=${actual}`);
      expect(actual).assertClose(-0.0125, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0021 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0022
     * @tc.name      NdkNotification_Px2vpAt_0022
     * @tc.desc      px2vpAt(px=-1, density=85) returns -0.011764705882352941
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_Px2vpAt_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}Px2vpAt_0022 begin`);
      const actual: number = px2vpAt(-1, 85);
      logInfo(`px2vpAt(px=-1, density=85): actual=${actual}`);
      expect(actual).assertClose(-0.011764705882352941, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0022 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0023
     * @tc.name      NdkNotification_Px2vpAt_0023
     * @tc.desc      px2vpAt(px=-1, density=90) returns -0.011111111111111112
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_Px2vpAt_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}Px2vpAt_0023 begin`);
      const actual: number = px2vpAt(-1, 90);
      logInfo(`px2vpAt(px=-1, density=90): actual=${actual}`);
      expect(actual).assertClose(-0.011111111111111112, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0023 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0024
     * @tc.name      NdkNotification_Px2vpAt_0024
     * @tc.desc      px2vpAt(px=-1, density=95) returns -0.010526315789473684
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_Px2vpAt_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}Px2vpAt_0024 begin`);
      const actual: number = px2vpAt(-1, 95);
      logInfo(`px2vpAt(px=-1, density=95): actual=${actual}`);
      expect(actual).assertClose(-0.010526315789473684, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0024 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0025
     * @tc.name      NdkNotification_Px2vpAt_0025
     * @tc.desc      px2vpAt(px=-1, density=105) returns -0.009523809523809525
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_Px2vpAt_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}Px2vpAt_0025 begin`);
      const actual: number = px2vpAt(-1, 105);
      logInfo(`px2vpAt(px=-1, density=105): actual=${actual}`);
      expect(actual).assertClose(-0.009523809523809525, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0025 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0026
     * @tc.name      NdkNotification_Px2vpAt_0026
     * @tc.desc      px2vpAt(px=-1, density=110) returns -0.00909090909090909
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_Px2vpAt_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}Px2vpAt_0026 begin`);
      const actual: number = px2vpAt(-1, 110);
      logInfo(`px2vpAt(px=-1, density=110): actual=${actual}`);
      expect(actual).assertClose(-0.00909090909090909, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0026 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0027
     * @tc.name      NdkNotification_Px2vpAt_0027
     * @tc.desc      px2vpAt(px=-1, density=115) returns -0.008695652173913044
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_Px2vpAt_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}Px2vpAt_0027 begin`);
      const actual: number = px2vpAt(-1, 115);
      logInfo(`px2vpAt(px=-1, density=115): actual=${actual}`);
      expect(actual).assertClose(-0.008695652173913044, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0027 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0028
     * @tc.name      NdkNotification_Px2vpAt_0028
     * @tc.desc      px2vpAt(px=-1, density=38) returns -0.02631578947368421
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_Px2vpAt_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}Px2vpAt_0028 begin`);
      const actual: number = px2vpAt(-1, 38);
      logInfo(`px2vpAt(px=-1, density=38): actual=${actual}`);
      expect(actual).assertClose(-0.02631578947368421, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0028 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0029
     * @tc.name      NdkNotification_Px2vpAt_0029
     * @tc.desc      px2vpAt(px=-1, density=152) returns -0.006578947368421052
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_Px2vpAt_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}Px2vpAt_0029 begin`);
      const actual: number = px2vpAt(-1, 152);
      logInfo(`px2vpAt(px=-1, density=152): actual=${actual}`);
      expect(actual).assertClose(-0.006578947368421052, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0029 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0030
     * @tc.name      NdkNotification_Px2vpAt_0030
     * @tc.desc      px2vpAt(px=1, density=1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_Px2vpAt_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}Px2vpAt_0030 begin`);
      const actual: number = px2vpAt(1, 1);
      logInfo(`px2vpAt(px=1, density=1): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}Px2vpAt_0030 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0031
     * @tc.name      NdkNotification_Px2vpAt_0031
     * @tc.desc      px2vpAt(px=1, density=2) returns 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_Px2vpAt_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}Px2vpAt_0031 begin`);
      const actual: number = px2vpAt(1, 2);
      logInfo(`px2vpAt(px=1, density=2): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0031 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0032
     * @tc.name      NdkNotification_Px2vpAt_0032
     * @tc.desc      px2vpAt(px=1, density=3) returns 0.3333333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_Px2vpAt_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}Px2vpAt_0032 begin`);
      const actual: number = px2vpAt(1, 3);
      logInfo(`px2vpAt(px=1, density=3): actual=${actual}`);
      expect(actual).assertClose(0.3333333333333333, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0032 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0033
     * @tc.name      NdkNotification_Px2vpAt_0033
     * @tc.desc      px2vpAt(px=1, density=10) returns 0.1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_Px2vpAt_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}Px2vpAt_0033 begin`);
      const actual: number = px2vpAt(1, 10);
      logInfo(`px2vpAt(px=1, density=10): actual=${actual}`);
      expect(actual).assertClose(0.1, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0033 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0034
     * @tc.name      NdkNotification_Px2vpAt_0034
     * @tc.desc      px2vpAt(px=1, density=100) returns 0.01
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_Px2vpAt_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}Px2vpAt_0034 begin`);
      const actual: number = px2vpAt(1, 100);
      logInfo(`px2vpAt(px=1, density=100): actual=${actual}`);
      expect(actual).assertClose(0.01, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0034 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0035
     * @tc.name      NdkNotification_Px2vpAt_0035
     * @tc.desc      px2vpAt(px=1, density=5) returns 0.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_Px2vpAt_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}Px2vpAt_0035 begin`);
      const actual: number = px2vpAt(1, 5);
      logInfo(`px2vpAt(px=1, density=5): actual=${actual}`);
      expect(actual).assertClose(0.2, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0035 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0036
     * @tc.name      NdkNotification_Px2vpAt_0036
     * @tc.desc      px2vpAt(px=1, density=15) returns 0.06666666666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_Px2vpAt_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}Px2vpAt_0036 begin`);
      const actual: number = px2vpAt(1, 15);
      logInfo(`px2vpAt(px=1, density=15): actual=${actual}`);
      expect(actual).assertClose(0.06666666666666667, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0036 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0037
     * @tc.name      NdkNotification_Px2vpAt_0037
     * @tc.desc      px2vpAt(px=1, density=20) returns 0.05
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_Px2vpAt_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}Px2vpAt_0037 begin`);
      const actual: number = px2vpAt(1, 20);
      logInfo(`px2vpAt(px=1, density=20): actual=${actual}`);
      expect(actual).assertClose(0.05, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0037 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0038
     * @tc.name      NdkNotification_Px2vpAt_0038
     * @tc.desc      px2vpAt(px=1, density=25) returns 0.04
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_Px2vpAt_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}Px2vpAt_0038 begin`);
      const actual: number = px2vpAt(1, 25);
      logInfo(`px2vpAt(px=1, density=25): actual=${actual}`);
      expect(actual).assertClose(0.04, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0038 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0039
     * @tc.name      NdkNotification_Px2vpAt_0039
     * @tc.desc      px2vpAt(px=1, density=30) returns 0.03333333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_Px2vpAt_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}Px2vpAt_0039 begin`);
      const actual: number = px2vpAt(1, 30);
      logInfo(`px2vpAt(px=1, density=30): actual=${actual}`);
      expect(actual).assertClose(0.03333333333333333, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0039 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0040
     * @tc.name      NdkNotification_Px2vpAt_0040
     * @tc.desc      px2vpAt(px=1, density=35) returns 0.02857142857142857
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_Px2vpAt_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}Px2vpAt_0040 begin`);
      const actual: number = px2vpAt(1, 35);
      logInfo(`px2vpAt(px=1, density=35): actual=${actual}`);
      expect(actual).assertClose(0.02857142857142857, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0040 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0041
     * @tc.name      NdkNotification_Px2vpAt_0041
     * @tc.desc      px2vpAt(px=1, density=40) returns 0.025
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_Px2vpAt_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}Px2vpAt_0041 begin`);
      const actual: number = px2vpAt(1, 40);
      logInfo(`px2vpAt(px=1, density=40): actual=${actual}`);
      expect(actual).assertClose(0.025, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0041 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0042
     * @tc.name      NdkNotification_Px2vpAt_0042
     * @tc.desc      px2vpAt(px=1, density=45) returns 0.022222222222222223
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_Px2vpAt_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}Px2vpAt_0042 begin`);
      const actual: number = px2vpAt(1, 45);
      logInfo(`px2vpAt(px=1, density=45): actual=${actual}`);
      expect(actual).assertClose(0.022222222222222223, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0042 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0043
     * @tc.name      NdkNotification_Px2vpAt_0043
     * @tc.desc      px2vpAt(px=1, density=50) returns 0.02
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_Px2vpAt_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}Px2vpAt_0043 begin`);
      const actual: number = px2vpAt(1, 50);
      logInfo(`px2vpAt(px=1, density=50): actual=${actual}`);
      expect(actual).assertClose(0.02, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0043 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0044
     * @tc.name      NdkNotification_Px2vpAt_0044
     * @tc.desc      px2vpAt(px=1, density=55) returns 0.01818181818181818
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_Px2vpAt_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}Px2vpAt_0044 begin`);
      const actual: number = px2vpAt(1, 55);
      logInfo(`px2vpAt(px=1, density=55): actual=${actual}`);
      expect(actual).assertClose(0.01818181818181818, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0044 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0045
     * @tc.name      NdkNotification_Px2vpAt_0045
     * @tc.desc      px2vpAt(px=1, density=60) returns 0.016666666666666666
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_Px2vpAt_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}Px2vpAt_0045 begin`);
      const actual: number = px2vpAt(1, 60);
      logInfo(`px2vpAt(px=1, density=60): actual=${actual}`);
      expect(actual).assertClose(0.016666666666666666, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0045 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0046
     * @tc.name      NdkNotification_Px2vpAt_0046
     * @tc.desc      px2vpAt(px=1, density=65) returns 0.015384615384615385
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_Px2vpAt_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}Px2vpAt_0046 begin`);
      const actual: number = px2vpAt(1, 65);
      logInfo(`px2vpAt(px=1, density=65): actual=${actual}`);
      expect(actual).assertClose(0.015384615384615385, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0046 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0047
     * @tc.name      NdkNotification_Px2vpAt_0047
     * @tc.desc      px2vpAt(px=1, density=70) returns 0.014285714285714285
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_Px2vpAt_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}Px2vpAt_0047 begin`);
      const actual: number = px2vpAt(1, 70);
      logInfo(`px2vpAt(px=1, density=70): actual=${actual}`);
      expect(actual).assertClose(0.014285714285714285, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0047 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0048
     * @tc.name      NdkNotification_Px2vpAt_0048
     * @tc.desc      px2vpAt(px=1, density=75) returns 0.013333333333333334
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_Px2vpAt_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}Px2vpAt_0048 begin`);
      const actual: number = px2vpAt(1, 75);
      logInfo(`px2vpAt(px=1, density=75): actual=${actual}`);
      expect(actual).assertClose(0.013333333333333334, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0048 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0049
     * @tc.name      NdkNotification_Px2vpAt_0049
     * @tc.desc      px2vpAt(px=1, density=80) returns 0.0125
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_Px2vpAt_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}Px2vpAt_0049 begin`);
      const actual: number = px2vpAt(1, 80);
      logInfo(`px2vpAt(px=1, density=80): actual=${actual}`);
      expect(actual).assertClose(0.0125, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0049 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0050
     * @tc.name      NdkNotification_Px2vpAt_0050
     * @tc.desc      px2vpAt(px=1, density=85) returns 0.011764705882352941
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_Px2vpAt_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}Px2vpAt_0050 begin`);
      const actual: number = px2vpAt(1, 85);
      logInfo(`px2vpAt(px=1, density=85): actual=${actual}`);
      expect(actual).assertClose(0.011764705882352941, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0050 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0051
     * @tc.name      NdkNotification_Px2vpAt_0051
     * @tc.desc      px2vpAt(px=1, density=90) returns 0.011111111111111112
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_Px2vpAt_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}Px2vpAt_0051 begin`);
      const actual: number = px2vpAt(1, 90);
      logInfo(`px2vpAt(px=1, density=90): actual=${actual}`);
      expect(actual).assertClose(0.011111111111111112, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0051 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0052
     * @tc.name      NdkNotification_Px2vpAt_0052
     * @tc.desc      px2vpAt(px=1, density=95) returns 0.010526315789473684
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_Px2vpAt_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}Px2vpAt_0052 begin`);
      const actual: number = px2vpAt(1, 95);
      logInfo(`px2vpAt(px=1, density=95): actual=${actual}`);
      expect(actual).assertClose(0.010526315789473684, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0052 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0053
     * @tc.name      NdkNotification_Px2vpAt_0053
     * @tc.desc      px2vpAt(px=1, density=105) returns 0.009523809523809525
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_Px2vpAt_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}Px2vpAt_0053 begin`);
      const actual: number = px2vpAt(1, 105);
      logInfo(`px2vpAt(px=1, density=105): actual=${actual}`);
      expect(actual).assertClose(0.009523809523809525, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0053 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0054
     * @tc.name      NdkNotification_Px2vpAt_0054
     * @tc.desc      px2vpAt(px=1, density=110) returns 0.00909090909090909
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_Px2vpAt_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}Px2vpAt_0054 begin`);
      const actual: number = px2vpAt(1, 110);
      logInfo(`px2vpAt(px=1, density=110): actual=${actual}`);
      expect(actual).assertClose(0.00909090909090909, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0054 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0055
     * @tc.name      NdkNotification_Px2vpAt_0055
     * @tc.desc      px2vpAt(px=1, density=115) returns 0.008695652173913044
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_Px2vpAt_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}Px2vpAt_0055 begin`);
      const actual: number = px2vpAt(1, 115);
      logInfo(`px2vpAt(px=1, density=115): actual=${actual}`);
      expect(actual).assertClose(0.008695652173913044, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0055 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0056
     * @tc.name      NdkNotification_Px2vpAt_0056
     * @tc.desc      px2vpAt(px=1, density=38) returns 0.02631578947368421
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_Px2vpAt_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}Px2vpAt_0056 begin`);
      const actual: number = px2vpAt(1, 38);
      logInfo(`px2vpAt(px=1, density=38): actual=${actual}`);
      expect(actual).assertClose(0.02631578947368421, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0056 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0057
     * @tc.name      NdkNotification_Px2vpAt_0057
     * @tc.desc      px2vpAt(px=1, density=152) returns 0.006578947368421052
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_Px2vpAt_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}Px2vpAt_0057 begin`);
      const actual: number = px2vpAt(1, 152);
      logInfo(`px2vpAt(px=1, density=152): actual=${actual}`);
      expect(actual).assertClose(0.006578947368421052, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0057 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0058
     * @tc.name      NdkNotification_Px2vpAt_0058
     * @tc.desc      px2vpAt(px=2, density=1) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_Px2vpAt_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}Px2vpAt_0058 begin`);
      const actual: number = px2vpAt(2, 1);
      logInfo(`px2vpAt(px=2, density=1): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}Px2vpAt_0058 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0059
     * @tc.name      NdkNotification_Px2vpAt_0059
     * @tc.desc      px2vpAt(px=2, density=3) returns 0.6666666666666666
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0059 begin`);
      const actual: number = px2vpAt(2, 3);
      logInfo(`px2vpAt(px=2, density=3): actual=${actual}`);
      expect(actual).assertClose(0.6666666666666666, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0059 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0060
     * @tc.name      NdkNotification_Px2vpAt_0060
     * @tc.desc      px2vpAt(px=2, density=5) returns 0.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0060 begin`);
      const actual: number = px2vpAt(2, 5);
      logInfo(`px2vpAt(px=2, density=5): actual=${actual}`);
      expect(actual).assertClose(0.4, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0060 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0061
     * @tc.name      NdkNotification_Px2vpAt_0061
     * @tc.desc      px2vpAt(px=2, density=15) returns 0.13333333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0061 begin`);
      const actual: number = px2vpAt(2, 15);
      logInfo(`px2vpAt(px=2, density=15): actual=${actual}`);
      expect(actual).assertClose(0.13333333333333333, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0061 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0062
     * @tc.name      NdkNotification_Px2vpAt_0062
     * @tc.desc      px2vpAt(px=2, density=25) returns 0.08
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0062 begin`);
      const actual: number = px2vpAt(2, 25);
      logInfo(`px2vpAt(px=2, density=25): actual=${actual}`);
      expect(actual).assertClose(0.08, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0062 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0063
     * @tc.name      NdkNotification_Px2vpAt_0063
     * @tc.desc      px2vpAt(px=2, density=35) returns 0.05714285714285714
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0063 begin`);
      const actual: number = px2vpAt(2, 35);
      logInfo(`px2vpAt(px=2, density=35): actual=${actual}`);
      expect(actual).assertClose(0.05714285714285714, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0063 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0064
     * @tc.name      NdkNotification_Px2vpAt_0064
     * @tc.desc      px2vpAt(px=2, density=45) returns 0.044444444444444446
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0064 begin`);
      const actual: number = px2vpAt(2, 45);
      logInfo(`px2vpAt(px=2, density=45): actual=${actual}`);
      expect(actual).assertClose(0.044444444444444446, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0064 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0065
     * @tc.name      NdkNotification_Px2vpAt_0065
     * @tc.desc      px2vpAt(px=2, density=55) returns 0.03636363636363636
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0065 begin`);
      const actual: number = px2vpAt(2, 55);
      logInfo(`px2vpAt(px=2, density=55): actual=${actual}`);
      expect(actual).assertClose(0.03636363636363636, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0065 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0066
     * @tc.name      NdkNotification_Px2vpAt_0066
     * @tc.desc      px2vpAt(px=2, density=65) returns 0.03076923076923077
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0066 begin`);
      const actual: number = px2vpAt(2, 65);
      logInfo(`px2vpAt(px=2, density=65): actual=${actual}`);
      expect(actual).assertClose(0.03076923076923077, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0066 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0067
     * @tc.name      NdkNotification_Px2vpAt_0067
     * @tc.desc      px2vpAt(px=2, density=75) returns 0.02666666666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0067 begin`);
      const actual: number = px2vpAt(2, 75);
      logInfo(`px2vpAt(px=2, density=75): actual=${actual}`);
      expect(actual).assertClose(0.02666666666666667, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0067 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0068
     * @tc.name      NdkNotification_Px2vpAt_0068
     * @tc.desc      px2vpAt(px=2, density=85) returns 0.023529411764705882
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0068 begin`);
      const actual: number = px2vpAt(2, 85);
      logInfo(`px2vpAt(px=2, density=85): actual=${actual}`);
      expect(actual).assertClose(0.023529411764705882, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0068 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0069
     * @tc.name      NdkNotification_Px2vpAt_0069
     * @tc.desc      px2vpAt(px=2, density=95) returns 0.021052631578947368
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0069 begin`);
      const actual: number = px2vpAt(2, 95);
      logInfo(`px2vpAt(px=2, density=95): actual=${actual}`);
      expect(actual).assertClose(0.021052631578947368, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0069 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0070
     * @tc.name      NdkNotification_Px2vpAt_0070
     * @tc.desc      px2vpAt(px=2, density=105) returns 0.01904761904761905
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0070 begin`);
      const actual: number = px2vpAt(2, 105);
      logInfo(`px2vpAt(px=2, density=105): actual=${actual}`);
      expect(actual).assertClose(0.01904761904761905, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0070 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0071
     * @tc.name      NdkNotification_Px2vpAt_0071
     * @tc.desc      px2vpAt(px=2, density=115) returns 0.017391304347826087
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0071 begin`);
      const actual: number = px2vpAt(2, 115);
      logInfo(`px2vpAt(px=2, density=115): actual=${actual}`);
      expect(actual).assertClose(0.017391304347826087, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0071 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0072
     * @tc.name      NdkNotification_Px2vpAt_0072
     * @tc.desc      px2vpAt(px=2, density=38) returns 0.05263157894736842
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0072 begin`);
      const actual: number = px2vpAt(2, 38);
      logInfo(`px2vpAt(px=2, density=38): actual=${actual}`);
      expect(actual).assertClose(0.05263157894736842, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0072 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0073
     * @tc.name      NdkNotification_Px2vpAt_0073
     * @tc.desc      px2vpAt(px=2, density=152) returns 0.013157894736842105
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0073 begin`);
      const actual: number = px2vpAt(2, 152);
      logInfo(`px2vpAt(px=2, density=152): actual=${actual}`);
      expect(actual).assertClose(0.013157894736842105, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0073 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0074
     * @tc.name      NdkNotification_Px2vpAt_0074
     * @tc.desc      px2vpAt(px=3, density=1) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_Px2vpAt_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}Px2vpAt_0074 begin`);
      const actual: number = px2vpAt(3, 1);
      logInfo(`px2vpAt(px=3, density=1): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}Px2vpAt_0074 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0075
     * @tc.name      NdkNotification_Px2vpAt_0075
     * @tc.desc      px2vpAt(px=3, density=2) returns 1.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0075 begin`);
      const actual: number = px2vpAt(3, 2);
      logInfo(`px2vpAt(px=3, density=2): actual=${actual}`);
      expect(actual).assertClose(1.5, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0075 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0076
     * @tc.name      NdkNotification_Px2vpAt_0076
     * @tc.desc      px2vpAt(px=3, density=10) returns 0.3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0076 begin`);
      const actual: number = px2vpAt(3, 10);
      logInfo(`px2vpAt(px=3, density=10): actual=${actual}`);
      expect(actual).assertClose(0.3, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0076 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0077
     * @tc.name      NdkNotification_Px2vpAt_0077
     * @tc.desc      px2vpAt(px=3, density=100) returns 0.03
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0077 begin`);
      const actual: number = px2vpAt(3, 100);
      logInfo(`px2vpAt(px=3, density=100): actual=${actual}`);
      expect(actual).assertClose(0.03, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0077 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0078
     * @tc.name      NdkNotification_Px2vpAt_0078
     * @tc.desc      px2vpAt(px=3, density=5) returns 0.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0078 begin`);
      const actual: number = px2vpAt(3, 5);
      logInfo(`px2vpAt(px=3, density=5): actual=${actual}`);
      expect(actual).assertClose(0.6, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0078 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0079
     * @tc.name      NdkNotification_Px2vpAt_0079
     * @tc.desc      px2vpAt(px=3, density=20) returns 0.15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0079 begin`);
      const actual: number = px2vpAt(3, 20);
      logInfo(`px2vpAt(px=3, density=20): actual=${actual}`);
      expect(actual).assertClose(0.15, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0079 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0080
     * @tc.name      NdkNotification_Px2vpAt_0080
     * @tc.desc      px2vpAt(px=3, density=25) returns 0.12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0080 begin`);
      const actual: number = px2vpAt(3, 25);
      logInfo(`px2vpAt(px=3, density=25): actual=${actual}`);
      expect(actual).assertClose(0.12, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0080 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0081
     * @tc.name      NdkNotification_Px2vpAt_0081
     * @tc.desc      px2vpAt(px=3, density=35) returns 0.08571428571428572
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0081 begin`);
      const actual: number = px2vpAt(3, 35);
      logInfo(`px2vpAt(px=3, density=35): actual=${actual}`);
      expect(actual).assertClose(0.08571428571428572, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0081 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0082
     * @tc.name      NdkNotification_Px2vpAt_0082
     * @tc.desc      px2vpAt(px=3, density=40) returns 0.075
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0082 begin`);
      const actual: number = px2vpAt(3, 40);
      logInfo(`px2vpAt(px=3, density=40): actual=${actual}`);
      expect(actual).assertClose(0.075, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0082 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0083
     * @tc.name      NdkNotification_Px2vpAt_0083
     * @tc.desc      px2vpAt(px=3, density=50) returns 0.06
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0083 begin`);
      const actual: number = px2vpAt(3, 50);
      logInfo(`px2vpAt(px=3, density=50): actual=${actual}`);
      expect(actual).assertClose(0.06, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0083 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0084
     * @tc.name      NdkNotification_Px2vpAt_0084
     * @tc.desc      px2vpAt(px=3, density=55) returns 0.05454545454545454
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0084 begin`);
      const actual: number = px2vpAt(3, 55);
      logInfo(`px2vpAt(px=3, density=55): actual=${actual}`);
      expect(actual).assertClose(0.05454545454545454, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0084 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0085
     * @tc.name      NdkNotification_Px2vpAt_0085
     * @tc.desc      px2vpAt(px=3, density=65) returns 0.046153846153846156
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0085 begin`);
      const actual: number = px2vpAt(3, 65);
      logInfo(`px2vpAt(px=3, density=65): actual=${actual}`);
      expect(actual).assertClose(0.046153846153846156, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0085 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0086
     * @tc.name      NdkNotification_Px2vpAt_0086
     * @tc.desc      px2vpAt(px=3, density=70) returns 0.04285714285714286
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0086 begin`);
      const actual: number = px2vpAt(3, 70);
      logInfo(`px2vpAt(px=3, density=70): actual=${actual}`);
      expect(actual).assertClose(0.04285714285714286, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0086 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0087
     * @tc.name      NdkNotification_Px2vpAt_0087
     * @tc.desc      px2vpAt(px=3, density=80) returns 0.0375
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0087 begin`);
      const actual: number = px2vpAt(3, 80);
      logInfo(`px2vpAt(px=3, density=80): actual=${actual}`);
      expect(actual).assertClose(0.0375, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0087 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0088
     * @tc.name      NdkNotification_Px2vpAt_0088
     * @tc.desc      px2vpAt(px=3, density=85) returns 0.03529411764705882
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0088 begin`);
      const actual: number = px2vpAt(3, 85);
      logInfo(`px2vpAt(px=3, density=85): actual=${actual}`);
      expect(actual).assertClose(0.03529411764705882, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0088 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0089
     * @tc.name      NdkNotification_Px2vpAt_0089
     * @tc.desc      px2vpAt(px=3, density=95) returns 0.031578947368421054
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0089 begin`);
      const actual: number = px2vpAt(3, 95);
      logInfo(`px2vpAt(px=3, density=95): actual=${actual}`);
      expect(actual).assertClose(0.031578947368421054, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0089 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0090
     * @tc.name      NdkNotification_Px2vpAt_0090
     * @tc.desc      px2vpAt(px=3, density=110) returns 0.02727272727272727
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0090 begin`);
      const actual: number = px2vpAt(3, 110);
      logInfo(`px2vpAt(px=3, density=110): actual=${actual}`);
      expect(actual).assertClose(0.02727272727272727, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0090 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0091
     * @tc.name      NdkNotification_Px2vpAt_0091
     * @tc.desc      px2vpAt(px=3, density=115) returns 0.02608695652173913
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0091 begin`);
      const actual: number = px2vpAt(3, 115);
      logInfo(`px2vpAt(px=3, density=115): actual=${actual}`);
      expect(actual).assertClose(0.02608695652173913, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0091 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0092
     * @tc.name      NdkNotification_Px2vpAt_0092
     * @tc.desc      px2vpAt(px=3, density=38) returns 0.07894736842105263
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0092 begin`);
      const actual: number = px2vpAt(3, 38);
      logInfo(`px2vpAt(px=3, density=38): actual=${actual}`);
      expect(actual).assertClose(0.07894736842105263, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0092 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0093
     * @tc.name      NdkNotification_Px2vpAt_0093
     * @tc.desc      px2vpAt(px=3, density=152) returns 0.019736842105263157
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0093 begin`);
      const actual: number = px2vpAt(3, 152);
      logInfo(`px2vpAt(px=3, density=152): actual=${actual}`);
      expect(actual).assertClose(0.019736842105263157, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0093 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0094
     * @tc.name      NdkNotification_Px2vpAt_0094
     * @tc.desc      px2vpAt(px=10, density=1) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_Px2vpAt_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}Px2vpAt_0094 begin`);
      const actual: number = px2vpAt(10, 1);
      logInfo(`px2vpAt(px=10, density=1): actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}Px2vpAt_0094 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0095
     * @tc.name      NdkNotification_Px2vpAt_0095
     * @tc.desc      px2vpAt(px=10, density=2) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0095 begin`);
      const actual: number = px2vpAt(10, 2);
      logInfo(`px2vpAt(px=10, density=2): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}Px2vpAt_0095 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0096
     * @tc.name      NdkNotification_Px2vpAt_0096
     * @tc.desc      px2vpAt(px=10, density=3) returns 3.3333333333333335
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0096 begin`);
      const actual: number = px2vpAt(10, 3);
      logInfo(`px2vpAt(px=10, density=3): actual=${actual}`);
      expect(actual).assertClose(3.3333333333333335, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0096 end`);
    });
  });
}
