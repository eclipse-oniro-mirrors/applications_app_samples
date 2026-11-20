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
import { heightForWidth } from '../model/WindowRatioLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_WindowRatio]';
const BUNDLE: string = 'WindowRatio_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for heightForWidth (96 cases). */
export default function heightForWidthTest(): void {
  describe('HeightForWidthTest', () => {
    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0001
     * @tc.name      WindowRatio_HeightForWidth_0001
     * @tc.desc      heightForWidth(width=0, ratio=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('WindowRatio_HeightForWidth_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}HeightForWidth_0001 begin`);
      const actual: number = heightForWidth(0, 0);
      logInfo(`heightForWidth(width=0, ratio=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}HeightForWidth_0001 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0002
     * @tc.name      WindowRatio_HeightForWidth_0002
     * @tc.desc      heightForWidth(width=1, ratio=0.25) returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('WindowRatio_HeightForWidth_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}HeightForWidth_0002 begin`);
      const actual: number = heightForWidth(1, 0.25);
      logInfo(`heightForWidth(width=1, ratio=0.25): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}HeightForWidth_0002 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0003
     * @tc.name      WindowRatio_HeightForWidth_0003
     * @tc.desc      heightForWidth(width=1, ratio=1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowRatio_HeightForWidth_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}HeightForWidth_0003 begin`);
      const actual: number = heightForWidth(1, 1);
      logInfo(`heightForWidth(width=1, ratio=1): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}HeightForWidth_0003 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0004
     * @tc.name      WindowRatio_HeightForWidth_0004
     * @tc.desc      heightForWidth(width=1, ratio=0.5) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0004 begin`);
      const actual: number = heightForWidth(1, 0.5);
      logInfo(`heightForWidth(width=1, ratio=0.5): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}HeightForWidth_0004 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0005
     * @tc.name      WindowRatio_HeightForWidth_0005
     * @tc.desc      heightForWidth(width=1, ratio=1.5) returns 0.6666666666666666
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0005 begin`);
      const actual: number = heightForWidth(1, 1.5);
      logInfo(`heightForWidth(width=1, ratio=1.5): actual=${actual}`);
      expect(actual).assertClose(0.6666666666666666, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0005 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0006
     * @tc.name      WindowRatio_HeightForWidth_0006
     * @tc.desc      heightForWidth(width=1, ratio=2) returns 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0006 begin`);
      const actual: number = heightForWidth(1, 2);
      logInfo(`heightForWidth(width=1, ratio=2): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0006 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0007
     * @tc.name      WindowRatio_HeightForWidth_0007
     * @tc.desc      heightForWidth(width=1, ratio=3) returns 0.3333333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0007 begin`);
      const actual: number = heightForWidth(1, 3);
      logInfo(`heightForWidth(width=1, ratio=3): actual=${actual}`);
      expect(actual).assertClose(0.3333333333333333, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0007 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0008
     * @tc.name      WindowRatio_HeightForWidth_0008
     * @tc.desc      heightForWidth(width=1, ratio=10) returns 0.1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0008 begin`);
      const actual: number = heightForWidth(1, 10);
      logInfo(`heightForWidth(width=1, ratio=10): actual=${actual}`);
      expect(actual).assertClose(0.1, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0008 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0009
     * @tc.name      WindowRatio_HeightForWidth_0009
     * @tc.desc      heightForWidth(width=1, ratio=100) returns 0.01
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0009 begin`);
      const actual: number = heightForWidth(1, 100);
      logInfo(`heightForWidth(width=1, ratio=100): actual=${actual}`);
      expect(actual).assertClose(0.01, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0009 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0010
     * @tc.name      WindowRatio_HeightForWidth_0010
     * @tc.desc      heightForWidth(width=1, ratio=5) returns 0.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0010 begin`);
      const actual: number = heightForWidth(1, 5);
      logInfo(`heightForWidth(width=1, ratio=5): actual=${actual}`);
      expect(actual).assertClose(0.2, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0010 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0011
     * @tc.name      WindowRatio_HeightForWidth_0011
     * @tc.desc      heightForWidth(width=1, ratio=15) returns 0.06666666666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0011 begin`);
      const actual: number = heightForWidth(1, 15);
      logInfo(`heightForWidth(width=1, ratio=15): actual=${actual}`);
      expect(actual).assertClose(0.06666666666666667, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0011 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0012
     * @tc.name      WindowRatio_HeightForWidth_0012
     * @tc.desc      heightForWidth(width=1, ratio=20) returns 0.05
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0012 begin`);
      const actual: number = heightForWidth(1, 20);
      logInfo(`heightForWidth(width=1, ratio=20): actual=${actual}`);
      expect(actual).assertClose(0.05, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0012 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0013
     * @tc.name      WindowRatio_HeightForWidth_0013
     * @tc.desc      heightForWidth(width=1, ratio=25) returns 0.04
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0013 begin`);
      const actual: number = heightForWidth(1, 25);
      logInfo(`heightForWidth(width=1, ratio=25): actual=${actual}`);
      expect(actual).assertClose(0.04, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0013 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0014
     * @tc.name      WindowRatio_HeightForWidth_0014
     * @tc.desc      heightForWidth(width=1, ratio=30) returns 0.03333333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0014 begin`);
      const actual: number = heightForWidth(1, 30);
      logInfo(`heightForWidth(width=1, ratio=30): actual=${actual}`);
      expect(actual).assertClose(0.03333333333333333, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0014 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0015
     * @tc.name      WindowRatio_HeightForWidth_0015
     * @tc.desc      heightForWidth(width=1, ratio=35) returns 0.02857142857142857
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0015 begin`);
      const actual: number = heightForWidth(1, 35);
      logInfo(`heightForWidth(width=1, ratio=35): actual=${actual}`);
      expect(actual).assertClose(0.02857142857142857, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0015 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0016
     * @tc.name      WindowRatio_HeightForWidth_0016
     * @tc.desc      heightForWidth(width=1, ratio=40) returns 0.025
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0016 begin`);
      const actual: number = heightForWidth(1, 40);
      logInfo(`heightForWidth(width=1, ratio=40): actual=${actual}`);
      expect(actual).assertClose(0.025, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0016 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0017
     * @tc.name      WindowRatio_HeightForWidth_0017
     * @tc.desc      heightForWidth(width=1, ratio=45) returns 0.022222222222222223
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0017 begin`);
      const actual: number = heightForWidth(1, 45);
      logInfo(`heightForWidth(width=1, ratio=45): actual=${actual}`);
      expect(actual).assertClose(0.022222222222222223, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0017 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0018
     * @tc.name      WindowRatio_HeightForWidth_0018
     * @tc.desc      heightForWidth(width=1, ratio=50) returns 0.02
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0018 begin`);
      const actual: number = heightForWidth(1, 50);
      logInfo(`heightForWidth(width=1, ratio=50): actual=${actual}`);
      expect(actual).assertClose(0.02, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0018 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0019
     * @tc.name      WindowRatio_HeightForWidth_0019
     * @tc.desc      heightForWidth(width=1, ratio=55) returns 0.01818181818181818
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0019 begin`);
      const actual: number = heightForWidth(1, 55);
      logInfo(`heightForWidth(width=1, ratio=55): actual=${actual}`);
      expect(actual).assertClose(0.01818181818181818, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0019 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0020
     * @tc.name      WindowRatio_HeightForWidth_0020
     * @tc.desc      heightForWidth(width=1, ratio=60) returns 0.016666666666666666
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0020 begin`);
      const actual: number = heightForWidth(1, 60);
      logInfo(`heightForWidth(width=1, ratio=60): actual=${actual}`);
      expect(actual).assertClose(0.016666666666666666, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0020 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0021
     * @tc.name      WindowRatio_HeightForWidth_0021
     * @tc.desc      heightForWidth(width=1, ratio=65) returns 0.015384615384615385
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0021 begin`);
      const actual: number = heightForWidth(1, 65);
      logInfo(`heightForWidth(width=1, ratio=65): actual=${actual}`);
      expect(actual).assertClose(0.015384615384615385, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0021 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0022
     * @tc.name      WindowRatio_HeightForWidth_0022
     * @tc.desc      heightForWidth(width=1, ratio=70) returns 0.014285714285714285
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0022 begin`);
      const actual: number = heightForWidth(1, 70);
      logInfo(`heightForWidth(width=1, ratio=70): actual=${actual}`);
      expect(actual).assertClose(0.014285714285714285, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0022 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0023
     * @tc.name      WindowRatio_HeightForWidth_0023
     * @tc.desc      heightForWidth(width=1, ratio=75) returns 0.013333333333333334
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0023 begin`);
      const actual: number = heightForWidth(1, 75);
      logInfo(`heightForWidth(width=1, ratio=75): actual=${actual}`);
      expect(actual).assertClose(0.013333333333333334, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0023 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0024
     * @tc.name      WindowRatio_HeightForWidth_0024
     * @tc.desc      heightForWidth(width=1, ratio=80) returns 0.0125
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0024 begin`);
      const actual: number = heightForWidth(1, 80);
      logInfo(`heightForWidth(width=1, ratio=80): actual=${actual}`);
      expect(actual).assertClose(0.0125, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0024 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0025
     * @tc.name      WindowRatio_HeightForWidth_0025
     * @tc.desc      heightForWidth(width=1, ratio=85) returns 0.011764705882352941
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0025 begin`);
      const actual: number = heightForWidth(1, 85);
      logInfo(`heightForWidth(width=1, ratio=85): actual=${actual}`);
      expect(actual).assertClose(0.011764705882352941, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0025 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0026
     * @tc.name      WindowRatio_HeightForWidth_0026
     * @tc.desc      heightForWidth(width=1, ratio=90) returns 0.011111111111111112
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0026 begin`);
      const actual: number = heightForWidth(1, 90);
      logInfo(`heightForWidth(width=1, ratio=90): actual=${actual}`);
      expect(actual).assertClose(0.011111111111111112, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0026 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0027
     * @tc.name      WindowRatio_HeightForWidth_0027
     * @tc.desc      heightForWidth(width=1, ratio=95) returns 0.010526315789473684
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0027 begin`);
      const actual: number = heightForWidth(1, 95);
      logInfo(`heightForWidth(width=1, ratio=95): actual=${actual}`);
      expect(actual).assertClose(0.010526315789473684, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0027 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0028
     * @tc.name      WindowRatio_HeightForWidth_0028
     * @tc.desc      heightForWidth(width=1, ratio=37) returns 0.02702702702702703
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0028 begin`);
      const actual: number = heightForWidth(1, 37);
      logInfo(`heightForWidth(width=1, ratio=37): actual=${actual}`);
      expect(actual).assertClose(0.02702702702702703, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0028 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0029
     * @tc.name      WindowRatio_HeightForWidth_0029
     * @tc.desc      heightForWidth(width=1, ratio=138) returns 0.007246376811594203
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0029 begin`);
      const actual: number = heightForWidth(1, 138);
      logInfo(`heightForWidth(width=1, ratio=138): actual=${actual}`);
      expect(actual).assertClose(0.007246376811594203, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0029 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0030
     * @tc.name      WindowRatio_HeightForWidth_0030
     * @tc.desc      heightForWidth(width=-1, ratio=0.25) returns -4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowRatio_HeightForWidth_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}HeightForWidth_0030 begin`);
      const actual: number = heightForWidth(-1, 0.25);
      logInfo(`heightForWidth(width=-1, ratio=0.25): actual=${actual}`);
      expect(actual).assertEqual(-4);
      logInfo(`${BUNDLE}HeightForWidth_0030 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0031
     * @tc.name      WindowRatio_HeightForWidth_0031
     * @tc.desc      heightForWidth(width=-1, ratio=1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowRatio_HeightForWidth_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}HeightForWidth_0031 begin`);
      const actual: number = heightForWidth(-1, 1);
      logInfo(`heightForWidth(width=-1, ratio=1): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}HeightForWidth_0031 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0032
     * @tc.name      WindowRatio_HeightForWidth_0032
     * @tc.desc      heightForWidth(width=-1, ratio=0.5) returns -2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowRatio_HeightForWidth_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}HeightForWidth_0032 begin`);
      const actual: number = heightForWidth(-1, 0.5);
      logInfo(`heightForWidth(width=-1, ratio=0.5): actual=${actual}`);
      expect(actual).assertEqual(-2);
      logInfo(`${BUNDLE}HeightForWidth_0032 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0033
     * @tc.name      WindowRatio_HeightForWidth_0033
     * @tc.desc      heightForWidth(width=-1, ratio=1.5) returns -0.6666666666666666
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowRatio_HeightForWidth_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}HeightForWidth_0033 begin`);
      const actual: number = heightForWidth(-1, 1.5);
      logInfo(`heightForWidth(width=-1, ratio=1.5): actual=${actual}`);
      expect(actual).assertClose(-0.6666666666666666, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0033 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0034
     * @tc.name      WindowRatio_HeightForWidth_0034
     * @tc.desc      heightForWidth(width=-1, ratio=2) returns -0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowRatio_HeightForWidth_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}HeightForWidth_0034 begin`);
      const actual: number = heightForWidth(-1, 2);
      logInfo(`heightForWidth(width=-1, ratio=2): actual=${actual}`);
      expect(actual).assertClose(-0.5, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0034 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0035
     * @tc.name      WindowRatio_HeightForWidth_0035
     * @tc.desc      heightForWidth(width=-1, ratio=3) returns -0.3333333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowRatio_HeightForWidth_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}HeightForWidth_0035 begin`);
      const actual: number = heightForWidth(-1, 3);
      logInfo(`heightForWidth(width=-1, ratio=3): actual=${actual}`);
      expect(actual).assertClose(-0.3333333333333333, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0035 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0036
     * @tc.name      WindowRatio_HeightForWidth_0036
     * @tc.desc      heightForWidth(width=-1, ratio=10) returns -0.1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowRatio_HeightForWidth_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}HeightForWidth_0036 begin`);
      const actual: number = heightForWidth(-1, 10);
      logInfo(`heightForWidth(width=-1, ratio=10): actual=${actual}`);
      expect(actual).assertClose(-0.1, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0036 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0037
     * @tc.name      WindowRatio_HeightForWidth_0037
     * @tc.desc      heightForWidth(width=-1, ratio=100) returns -0.01
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowRatio_HeightForWidth_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}HeightForWidth_0037 begin`);
      const actual: number = heightForWidth(-1, 100);
      logInfo(`heightForWidth(width=-1, ratio=100): actual=${actual}`);
      expect(actual).assertClose(-0.01, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0037 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0038
     * @tc.name      WindowRatio_HeightForWidth_0038
     * @tc.desc      heightForWidth(width=-1, ratio=5) returns -0.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowRatio_HeightForWidth_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}HeightForWidth_0038 begin`);
      const actual: number = heightForWidth(-1, 5);
      logInfo(`heightForWidth(width=-1, ratio=5): actual=${actual}`);
      expect(actual).assertClose(-0.2, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0038 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0039
     * @tc.name      WindowRatio_HeightForWidth_0039
     * @tc.desc      heightForWidth(width=-1, ratio=15) returns -0.06666666666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowRatio_HeightForWidth_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}HeightForWidth_0039 begin`);
      const actual: number = heightForWidth(-1, 15);
      logInfo(`heightForWidth(width=-1, ratio=15): actual=${actual}`);
      expect(actual).assertClose(-0.06666666666666667, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0039 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0040
     * @tc.name      WindowRatio_HeightForWidth_0040
     * @tc.desc      heightForWidth(width=-1, ratio=20) returns -0.05
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowRatio_HeightForWidth_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}HeightForWidth_0040 begin`);
      const actual: number = heightForWidth(-1, 20);
      logInfo(`heightForWidth(width=-1, ratio=20): actual=${actual}`);
      expect(actual).assertClose(-0.05, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0040 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0041
     * @tc.name      WindowRatio_HeightForWidth_0041
     * @tc.desc      heightForWidth(width=-1, ratio=25) returns -0.04
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowRatio_HeightForWidth_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}HeightForWidth_0041 begin`);
      const actual: number = heightForWidth(-1, 25);
      logInfo(`heightForWidth(width=-1, ratio=25): actual=${actual}`);
      expect(actual).assertClose(-0.04, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0041 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0042
     * @tc.name      WindowRatio_HeightForWidth_0042
     * @tc.desc      heightForWidth(width=-1, ratio=30) returns -0.03333333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowRatio_HeightForWidth_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}HeightForWidth_0042 begin`);
      const actual: number = heightForWidth(-1, 30);
      logInfo(`heightForWidth(width=-1, ratio=30): actual=${actual}`);
      expect(actual).assertClose(-0.03333333333333333, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0042 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0043
     * @tc.name      WindowRatio_HeightForWidth_0043
     * @tc.desc      heightForWidth(width=-1, ratio=35) returns -0.02857142857142857
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowRatio_HeightForWidth_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}HeightForWidth_0043 begin`);
      const actual: number = heightForWidth(-1, 35);
      logInfo(`heightForWidth(width=-1, ratio=35): actual=${actual}`);
      expect(actual).assertClose(-0.02857142857142857, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0043 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0044
     * @tc.name      WindowRatio_HeightForWidth_0044
     * @tc.desc      heightForWidth(width=-1, ratio=40) returns -0.025
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowRatio_HeightForWidth_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}HeightForWidth_0044 begin`);
      const actual: number = heightForWidth(-1, 40);
      logInfo(`heightForWidth(width=-1, ratio=40): actual=${actual}`);
      expect(actual).assertClose(-0.025, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0044 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0045
     * @tc.name      WindowRatio_HeightForWidth_0045
     * @tc.desc      heightForWidth(width=-1, ratio=45) returns -0.022222222222222223
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowRatio_HeightForWidth_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}HeightForWidth_0045 begin`);
      const actual: number = heightForWidth(-1, 45);
      logInfo(`heightForWidth(width=-1, ratio=45): actual=${actual}`);
      expect(actual).assertClose(-0.022222222222222223, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0045 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0046
     * @tc.name      WindowRatio_HeightForWidth_0046
     * @tc.desc      heightForWidth(width=-1, ratio=50) returns -0.02
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowRatio_HeightForWidth_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}HeightForWidth_0046 begin`);
      const actual: number = heightForWidth(-1, 50);
      logInfo(`heightForWidth(width=-1, ratio=50): actual=${actual}`);
      expect(actual).assertClose(-0.02, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0046 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0047
     * @tc.name      WindowRatio_HeightForWidth_0047
     * @tc.desc      heightForWidth(width=-1, ratio=55) returns -0.01818181818181818
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowRatio_HeightForWidth_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}HeightForWidth_0047 begin`);
      const actual: number = heightForWidth(-1, 55);
      logInfo(`heightForWidth(width=-1, ratio=55): actual=${actual}`);
      expect(actual).assertClose(-0.01818181818181818, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0047 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0048
     * @tc.name      WindowRatio_HeightForWidth_0048
     * @tc.desc      heightForWidth(width=-1, ratio=60) returns -0.016666666666666666
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowRatio_HeightForWidth_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}HeightForWidth_0048 begin`);
      const actual: number = heightForWidth(-1, 60);
      logInfo(`heightForWidth(width=-1, ratio=60): actual=${actual}`);
      expect(actual).assertClose(-0.016666666666666666, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0048 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0049
     * @tc.name      WindowRatio_HeightForWidth_0049
     * @tc.desc      heightForWidth(width=-1, ratio=65) returns -0.015384615384615385
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowRatio_HeightForWidth_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}HeightForWidth_0049 begin`);
      const actual: number = heightForWidth(-1, 65);
      logInfo(`heightForWidth(width=-1, ratio=65): actual=${actual}`);
      expect(actual).assertClose(-0.015384615384615385, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0049 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0050
     * @tc.name      WindowRatio_HeightForWidth_0050
     * @tc.desc      heightForWidth(width=-1, ratio=70) returns -0.014285714285714285
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowRatio_HeightForWidth_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}HeightForWidth_0050 begin`);
      const actual: number = heightForWidth(-1, 70);
      logInfo(`heightForWidth(width=-1, ratio=70): actual=${actual}`);
      expect(actual).assertClose(-0.014285714285714285, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0050 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0051
     * @tc.name      WindowRatio_HeightForWidth_0051
     * @tc.desc      heightForWidth(width=-1, ratio=75) returns -0.013333333333333334
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowRatio_HeightForWidth_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}HeightForWidth_0051 begin`);
      const actual: number = heightForWidth(-1, 75);
      logInfo(`heightForWidth(width=-1, ratio=75): actual=${actual}`);
      expect(actual).assertClose(-0.013333333333333334, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0051 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0052
     * @tc.name      WindowRatio_HeightForWidth_0052
     * @tc.desc      heightForWidth(width=-1, ratio=80) returns -0.0125
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowRatio_HeightForWidth_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}HeightForWidth_0052 begin`);
      const actual: number = heightForWidth(-1, 80);
      logInfo(`heightForWidth(width=-1, ratio=80): actual=${actual}`);
      expect(actual).assertClose(-0.0125, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0052 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0053
     * @tc.name      WindowRatio_HeightForWidth_0053
     * @tc.desc      heightForWidth(width=-1, ratio=85) returns -0.011764705882352941
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowRatio_HeightForWidth_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}HeightForWidth_0053 begin`);
      const actual: number = heightForWidth(-1, 85);
      logInfo(`heightForWidth(width=-1, ratio=85): actual=${actual}`);
      expect(actual).assertClose(-0.011764705882352941, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0053 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0054
     * @tc.name      WindowRatio_HeightForWidth_0054
     * @tc.desc      heightForWidth(width=-1, ratio=90) returns -0.011111111111111112
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowRatio_HeightForWidth_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}HeightForWidth_0054 begin`);
      const actual: number = heightForWidth(-1, 90);
      logInfo(`heightForWidth(width=-1, ratio=90): actual=${actual}`);
      expect(actual).assertClose(-0.011111111111111112, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0054 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0055
     * @tc.name      WindowRatio_HeightForWidth_0055
     * @tc.desc      heightForWidth(width=-1, ratio=95) returns -0.010526315789473684
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowRatio_HeightForWidth_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}HeightForWidth_0055 begin`);
      const actual: number = heightForWidth(-1, 95);
      logInfo(`heightForWidth(width=-1, ratio=95): actual=${actual}`);
      expect(actual).assertClose(-0.010526315789473684, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0055 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0056
     * @tc.name      WindowRatio_HeightForWidth_0056
     * @tc.desc      heightForWidth(width=-1, ratio=37) returns -0.02702702702702703
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowRatio_HeightForWidth_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}HeightForWidth_0056 begin`);
      const actual: number = heightForWidth(-1, 37);
      logInfo(`heightForWidth(width=-1, ratio=37): actual=${actual}`);
      expect(actual).assertClose(-0.02702702702702703, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0056 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0057
     * @tc.name      WindowRatio_HeightForWidth_0057
     * @tc.desc      heightForWidth(width=-1, ratio=138) returns -0.007246376811594203
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowRatio_HeightForWidth_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}HeightForWidth_0057 begin`);
      const actual: number = heightForWidth(-1, 138);
      logInfo(`heightForWidth(width=-1, ratio=138): actual=${actual}`);
      expect(actual).assertClose(-0.007246376811594203, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0057 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0058
     * @tc.name      WindowRatio_HeightForWidth_0058
     * @tc.desc      heightForWidth(width=100, ratio=0.25) returns 400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0058 begin`);
      const actual: number = heightForWidth(100, 0.25);
      logInfo(`heightForWidth(width=100, ratio=0.25): actual=${actual}`);
      expect(actual).assertEqual(400);
      logInfo(`${BUNDLE}HeightForWidth_0058 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0059
     * @tc.name      WindowRatio_HeightForWidth_0059
     * @tc.desc      heightForWidth(width=100, ratio=1) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowRatio_HeightForWidth_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}HeightForWidth_0059 begin`);
      const actual: number = heightForWidth(100, 1);
      logInfo(`heightForWidth(width=100, ratio=1): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}HeightForWidth_0059 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0060
     * @tc.name      WindowRatio_HeightForWidth_0060
     * @tc.desc      heightForWidth(width=100, ratio=0.5) returns 200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0060 begin`);
      const actual: number = heightForWidth(100, 0.5);
      logInfo(`heightForWidth(width=100, ratio=0.5): actual=${actual}`);
      expect(actual).assertEqual(200);
      logInfo(`${BUNDLE}HeightForWidth_0060 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0061
     * @tc.name      WindowRatio_HeightForWidth_0061
     * @tc.desc      heightForWidth(width=100, ratio=1.5) returns 66.66666666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0061 begin`);
      const actual: number = heightForWidth(100, 1.5);
      logInfo(`heightForWidth(width=100, ratio=1.5): actual=${actual}`);
      expect(actual).assertClose(66.66666666666667, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0061 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0062
     * @tc.name      WindowRatio_HeightForWidth_0062
     * @tc.desc      heightForWidth(width=100, ratio=2) returns 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0062 begin`);
      const actual: number = heightForWidth(100, 2);
      logInfo(`heightForWidth(width=100, ratio=2): actual=${actual}`);
      expect(actual).assertEqual(50);
      logInfo(`${BUNDLE}HeightForWidth_0062 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0063
     * @tc.name      WindowRatio_HeightForWidth_0063
     * @tc.desc      heightForWidth(width=100, ratio=3) returns 33.333333333333336
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0063 begin`);
      const actual: number = heightForWidth(100, 3);
      logInfo(`heightForWidth(width=100, ratio=3): actual=${actual}`);
      expect(actual).assertClose(33.333333333333336, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0063 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0064
     * @tc.name      WindowRatio_HeightForWidth_0064
     * @tc.desc      heightForWidth(width=100, ratio=10) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0064 begin`);
      const actual: number = heightForWidth(100, 10);
      logInfo(`heightForWidth(width=100, ratio=10): actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}HeightForWidth_0064 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0065
     * @tc.name      WindowRatio_HeightForWidth_0065
     * @tc.desc      heightForWidth(width=100, ratio=5) returns 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0065 begin`);
      const actual: number = heightForWidth(100, 5);
      logInfo(`heightForWidth(width=100, ratio=5): actual=${actual}`);
      expect(actual).assertEqual(20);
      logInfo(`${BUNDLE}HeightForWidth_0065 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0066
     * @tc.name      WindowRatio_HeightForWidth_0066
     * @tc.desc      heightForWidth(width=100, ratio=15) returns 6.666666666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0066 begin`);
      const actual: number = heightForWidth(100, 15);
      logInfo(`heightForWidth(width=100, ratio=15): actual=${actual}`);
      expect(actual).assertClose(6.666666666666667, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0066 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0067
     * @tc.name      WindowRatio_HeightForWidth_0067
     * @tc.desc      heightForWidth(width=100, ratio=20) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0067 begin`);
      const actual: number = heightForWidth(100, 20);
      logInfo(`heightForWidth(width=100, ratio=20): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}HeightForWidth_0067 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0068
     * @tc.name      WindowRatio_HeightForWidth_0068
     * @tc.desc      heightForWidth(width=100, ratio=30) returns 3.3333333333333335
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0068 begin`);
      const actual: number = heightForWidth(100, 30);
      logInfo(`heightForWidth(width=100, ratio=30): actual=${actual}`);
      expect(actual).assertClose(3.3333333333333335, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0068 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0069
     * @tc.name      WindowRatio_HeightForWidth_0069
     * @tc.desc      heightForWidth(width=100, ratio=35) returns 2.857142857142857
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0069 begin`);
      const actual: number = heightForWidth(100, 35);
      logInfo(`heightForWidth(width=100, ratio=35): actual=${actual}`);
      expect(actual).assertClose(2.857142857142857, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0069 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0070
     * @tc.name      WindowRatio_HeightForWidth_0070
     * @tc.desc      heightForWidth(width=100, ratio=40) returns 2.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0070 begin`);
      const actual: number = heightForWidth(100, 40);
      logInfo(`heightForWidth(width=100, ratio=40): actual=${actual}`);
      expect(actual).assertClose(2.5, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0070 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0071
     * @tc.name      WindowRatio_HeightForWidth_0071
     * @tc.desc      heightForWidth(width=100, ratio=45) returns 2.2222222222222223
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0071 begin`);
      const actual: number = heightForWidth(100, 45);
      logInfo(`heightForWidth(width=100, ratio=45): actual=${actual}`);
      expect(actual).assertClose(2.2222222222222223, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0071 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0072
     * @tc.name      WindowRatio_HeightForWidth_0072
     * @tc.desc      heightForWidth(width=100, ratio=55) returns 1.8181818181818181
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0072 begin`);
      const actual: number = heightForWidth(100, 55);
      logInfo(`heightForWidth(width=100, ratio=55): actual=${actual}`);
      expect(actual).assertClose(1.8181818181818181, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0072 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0073
     * @tc.name      WindowRatio_HeightForWidth_0073
     * @tc.desc      heightForWidth(width=100, ratio=60) returns 1.6666666666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0073 begin`);
      const actual: number = heightForWidth(100, 60);
      logInfo(`heightForWidth(width=100, ratio=60): actual=${actual}`);
      expect(actual).assertClose(1.6666666666666667, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0073 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0074
     * @tc.name      WindowRatio_HeightForWidth_0074
     * @tc.desc      heightForWidth(width=100, ratio=65) returns 1.5384615384615385
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0074 begin`);
      const actual: number = heightForWidth(100, 65);
      logInfo(`heightForWidth(width=100, ratio=65): actual=${actual}`);
      expect(actual).assertClose(1.5384615384615385, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0074 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0075
     * @tc.name      WindowRatio_HeightForWidth_0075
     * @tc.desc      heightForWidth(width=100, ratio=70) returns 1.4285714285714286
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0075 begin`);
      const actual: number = heightForWidth(100, 70);
      logInfo(`heightForWidth(width=100, ratio=70): actual=${actual}`);
      expect(actual).assertClose(1.4285714285714286, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0075 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0076
     * @tc.name      WindowRatio_HeightForWidth_0076
     * @tc.desc      heightForWidth(width=100, ratio=75) returns 1.3333333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0076 begin`);
      const actual: number = heightForWidth(100, 75);
      logInfo(`heightForWidth(width=100, ratio=75): actual=${actual}`);
      expect(actual).assertClose(1.3333333333333333, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0076 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0077
     * @tc.name      WindowRatio_HeightForWidth_0077
     * @tc.desc      heightForWidth(width=100, ratio=80) returns 1.25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0077 begin`);
      const actual: number = heightForWidth(100, 80);
      logInfo(`heightForWidth(width=100, ratio=80): actual=${actual}`);
      expect(actual).assertClose(1.25, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0077 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0078
     * @tc.name      WindowRatio_HeightForWidth_0078
     * @tc.desc      heightForWidth(width=100, ratio=85) returns 1.1764705882352942
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0078 begin`);
      const actual: number = heightForWidth(100, 85);
      logInfo(`heightForWidth(width=100, ratio=85): actual=${actual}`);
      expect(actual).assertClose(1.1764705882352942, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0078 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0079
     * @tc.name      WindowRatio_HeightForWidth_0079
     * @tc.desc      heightForWidth(width=100, ratio=90) returns 1.1111111111111112
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0079 begin`);
      const actual: number = heightForWidth(100, 90);
      logInfo(`heightForWidth(width=100, ratio=90): actual=${actual}`);
      expect(actual).assertClose(1.1111111111111112, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0079 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0080
     * @tc.name      WindowRatio_HeightForWidth_0080
     * @tc.desc      heightForWidth(width=100, ratio=95) returns 1.0526315789473684
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0080 begin`);
      const actual: number = heightForWidth(100, 95);
      logInfo(`heightForWidth(width=100, ratio=95): actual=${actual}`);
      expect(actual).assertClose(1.0526315789473684, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0080 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0081
     * @tc.name      WindowRatio_HeightForWidth_0081
     * @tc.desc      heightForWidth(width=100, ratio=37) returns 2.7027027027027026
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0081 begin`);
      const actual: number = heightForWidth(100, 37);
      logInfo(`heightForWidth(width=100, ratio=37): actual=${actual}`);
      expect(actual).assertClose(2.7027027027027026, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0081 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0082
     * @tc.name      WindowRatio_HeightForWidth_0082
     * @tc.desc      heightForWidth(width=100, ratio=138) returns 0.7246376811594203
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0082 begin`);
      const actual: number = heightForWidth(100, 138);
      logInfo(`heightForWidth(width=100, ratio=138): actual=${actual}`);
      expect(actual).assertClose(0.7246376811594203, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0082 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0083
     * @tc.name      WindowRatio_HeightForWidth_0083
     * @tc.desc      heightForWidth(width=360, ratio=0.25) returns 1440
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0083 begin`);
      const actual: number = heightForWidth(360, 0.25);
      logInfo(`heightForWidth(width=360, ratio=0.25): actual=${actual}`);
      expect(actual).assertEqual(1440);
      logInfo(`${BUNDLE}HeightForWidth_0083 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0084
     * @tc.name      WindowRatio_HeightForWidth_0084
     * @tc.desc      heightForWidth(width=360, ratio=1) returns 360
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowRatio_HeightForWidth_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}HeightForWidth_0084 begin`);
      const actual: number = heightForWidth(360, 1);
      logInfo(`heightForWidth(width=360, ratio=1): actual=${actual}`);
      expect(actual).assertEqual(360);
      logInfo(`${BUNDLE}HeightForWidth_0084 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0085
     * @tc.name      WindowRatio_HeightForWidth_0085
     * @tc.desc      heightForWidth(width=360, ratio=0.5) returns 720
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0085 begin`);
      const actual: number = heightForWidth(360, 0.5);
      logInfo(`heightForWidth(width=360, ratio=0.5): actual=${actual}`);
      expect(actual).assertEqual(720);
      logInfo(`${BUNDLE}HeightForWidth_0085 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0086
     * @tc.name      WindowRatio_HeightForWidth_0086
     * @tc.desc      heightForWidth(width=360, ratio=1.5) returns 240
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0086 begin`);
      const actual: number = heightForWidth(360, 1.5);
      logInfo(`heightForWidth(width=360, ratio=1.5): actual=${actual}`);
      expect(actual).assertEqual(240);
      logInfo(`${BUNDLE}HeightForWidth_0086 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0087
     * @tc.name      WindowRatio_HeightForWidth_0087
     * @tc.desc      heightForWidth(width=360, ratio=2) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0087 begin`);
      const actual: number = heightForWidth(360, 2);
      logInfo(`heightForWidth(width=360, ratio=2): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}HeightForWidth_0087 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0088
     * @tc.name      WindowRatio_HeightForWidth_0088
     * @tc.desc      heightForWidth(width=360, ratio=3) returns 120
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0088 begin`);
      const actual: number = heightForWidth(360, 3);
      logInfo(`heightForWidth(width=360, ratio=3): actual=${actual}`);
      expect(actual).assertEqual(120);
      logInfo(`${BUNDLE}HeightForWidth_0088 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0089
     * @tc.name      WindowRatio_HeightForWidth_0089
     * @tc.desc      heightForWidth(width=360, ratio=10) returns 36
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0089 begin`);
      const actual: number = heightForWidth(360, 10);
      logInfo(`heightForWidth(width=360, ratio=10): actual=${actual}`);
      expect(actual).assertEqual(36);
      logInfo(`${BUNDLE}HeightForWidth_0089 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0090
     * @tc.name      WindowRatio_HeightForWidth_0090
     * @tc.desc      heightForWidth(width=360, ratio=100) returns 3.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0090 begin`);
      const actual: number = heightForWidth(360, 100);
      logInfo(`heightForWidth(width=360, ratio=100): actual=${actual}`);
      expect(actual).assertClose(3.6, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0090 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0091
     * @tc.name      WindowRatio_HeightForWidth_0091
     * @tc.desc      heightForWidth(width=360, ratio=5) returns 72
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0091 begin`);
      const actual: number = heightForWidth(360, 5);
      logInfo(`heightForWidth(width=360, ratio=5): actual=${actual}`);
      expect(actual).assertEqual(72);
      logInfo(`${BUNDLE}HeightForWidth_0091 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0092
     * @tc.name      WindowRatio_HeightForWidth_0092
     * @tc.desc      heightForWidth(width=360, ratio=15) returns 24
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0092 begin`);
      const actual: number = heightForWidth(360, 15);
      logInfo(`heightForWidth(width=360, ratio=15): actual=${actual}`);
      expect(actual).assertEqual(24);
      logInfo(`${BUNDLE}HeightForWidth_0092 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0093
     * @tc.name      WindowRatio_HeightForWidth_0093
     * @tc.desc      heightForWidth(width=360, ratio=20) returns 18
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0093 begin`);
      const actual: number = heightForWidth(360, 20);
      logInfo(`heightForWidth(width=360, ratio=20): actual=${actual}`);
      expect(actual).assertEqual(18);
      logInfo(`${BUNDLE}HeightForWidth_0093 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0094
     * @tc.name      WindowRatio_HeightForWidth_0094
     * @tc.desc      heightForWidth(width=360, ratio=25) returns 14.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0094 begin`);
      const actual: number = heightForWidth(360, 25);
      logInfo(`heightForWidth(width=360, ratio=25): actual=${actual}`);
      expect(actual).assertClose(14.4, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0094 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0095
     * @tc.name      WindowRatio_HeightForWidth_0095
     * @tc.desc      heightForWidth(width=360, ratio=30) returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0095 begin`);
      const actual: number = heightForWidth(360, 30);
      logInfo(`heightForWidth(width=360, ratio=30): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}HeightForWidth_0095 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_HEIGHT_FOR_WIDTH_0096
     * @tc.name      WindowRatio_HeightForWidth_0096
     * @tc.desc      heightForWidth(width=360, ratio=35) returns 10.285714285714286
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_HeightForWidth_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeightForWidth_0096 begin`);
      const actual: number = heightForWidth(360, 35);
      logInfo(`heightForWidth(width=360, ratio=35): actual=${actual}`);
      expect(actual).assertClose(10.285714285714286, PRECISION);
      logInfo(`${BUNDLE}HeightForWidth_0096 end`);
    });
  });
}
