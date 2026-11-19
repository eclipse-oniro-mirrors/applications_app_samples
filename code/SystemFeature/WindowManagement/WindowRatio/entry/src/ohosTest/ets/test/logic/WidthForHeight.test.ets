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
import { widthForHeight } from '../model/WindowRatioLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_WindowRatio]';
const BUNDLE: string = 'WindowRatio_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for widthForHeight (96 cases). */
export default function widthForHeightTest(): void {
  describe('WidthForHeightTest', () => {
    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0001
     * @tc.name      WindowRatio_WidthForHeight_0001
     * @tc.desc      widthForHeight(height=0, ratio=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('WindowRatio_WidthForHeight_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WidthForHeight_0001 begin`);
      const actual: number = widthForHeight(0, 0);
      logInfo(`widthForHeight(height=0, ratio=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}WidthForHeight_0001 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0002
     * @tc.name      WindowRatio_WidthForHeight_0002
     * @tc.desc      widthForHeight(height=1, ratio=0.25) returns 0.25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('WindowRatio_WidthForHeight_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WidthForHeight_0002 begin`);
      const actual: number = widthForHeight(1, 0.25);
      logInfo(`widthForHeight(height=1, ratio=0.25): actual=${actual}`);
      expect(actual).assertClose(0.25, PRECISION);
      logInfo(`${BUNDLE}WidthForHeight_0002 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0003
     * @tc.name      WindowRatio_WidthForHeight_0003
     * @tc.desc      widthForHeight(height=1, ratio=0.5) returns 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0003 begin`);
      const actual: number = widthForHeight(1, 0.5);
      logInfo(`widthForHeight(height=1, ratio=0.5): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}WidthForHeight_0003 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0004
     * @tc.name      WindowRatio_WidthForHeight_0004
     * @tc.desc      widthForHeight(height=1, ratio=1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0004 begin`);
      const actual: number = widthForHeight(1, 1);
      logInfo(`widthForHeight(height=1, ratio=1): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}WidthForHeight_0004 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0005
     * @tc.name      WindowRatio_WidthForHeight_0005
     * @tc.desc      widthForHeight(height=1, ratio=1.5) returns 1.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0005 begin`);
      const actual: number = widthForHeight(1, 1.5);
      logInfo(`widthForHeight(height=1, ratio=1.5): actual=${actual}`);
      expect(actual).assertClose(1.5, PRECISION);
      logInfo(`${BUNDLE}WidthForHeight_0005 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0006
     * @tc.name      WindowRatio_WidthForHeight_0006
     * @tc.desc      widthForHeight(height=1, ratio=2) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0006 begin`);
      const actual: number = widthForHeight(1, 2);
      logInfo(`widthForHeight(height=1, ratio=2): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}WidthForHeight_0006 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0007
     * @tc.name      WindowRatio_WidthForHeight_0007
     * @tc.desc      widthForHeight(height=1, ratio=-1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_WidthForHeight_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WidthForHeight_0007 begin`);
      const actual: number = widthForHeight(1, -1);
      logInfo(`widthForHeight(height=1, ratio=-1): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}WidthForHeight_0007 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0008
     * @tc.name      WindowRatio_WidthForHeight_0008
     * @tc.desc      widthForHeight(height=1, ratio=3) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0008 begin`);
      const actual: number = widthForHeight(1, 3);
      logInfo(`widthForHeight(height=1, ratio=3): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}WidthForHeight_0008 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0009
     * @tc.name      WindowRatio_WidthForHeight_0009
     * @tc.desc      widthForHeight(height=1, ratio=10) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0009 begin`);
      const actual: number = widthForHeight(1, 10);
      logInfo(`widthForHeight(height=1, ratio=10): actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}WidthForHeight_0009 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0010
     * @tc.name      WindowRatio_WidthForHeight_0010
     * @tc.desc      widthForHeight(height=1, ratio=100) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0010 begin`);
      const actual: number = widthForHeight(1, 100);
      logInfo(`widthForHeight(height=1, ratio=100): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}WidthForHeight_0010 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0011
     * @tc.name      WindowRatio_WidthForHeight_0011
     * @tc.desc      widthForHeight(height=1, ratio=5) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0011 begin`);
      const actual: number = widthForHeight(1, 5);
      logInfo(`widthForHeight(height=1, ratio=5): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}WidthForHeight_0011 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0012
     * @tc.name      WindowRatio_WidthForHeight_0012
     * @tc.desc      widthForHeight(height=1, ratio=15) returns 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0012 begin`);
      const actual: number = widthForHeight(1, 15);
      logInfo(`widthForHeight(height=1, ratio=15): actual=${actual}`);
      expect(actual).assertEqual(15);
      logInfo(`${BUNDLE}WidthForHeight_0012 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0013
     * @tc.name      WindowRatio_WidthForHeight_0013
     * @tc.desc      widthForHeight(height=1, ratio=20) returns 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0013 begin`);
      const actual: number = widthForHeight(1, 20);
      logInfo(`widthForHeight(height=1, ratio=20): actual=${actual}`);
      expect(actual).assertEqual(20);
      logInfo(`${BUNDLE}WidthForHeight_0013 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0014
     * @tc.name      WindowRatio_WidthForHeight_0014
     * @tc.desc      widthForHeight(height=1, ratio=25) returns 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0014 begin`);
      const actual: number = widthForHeight(1, 25);
      logInfo(`widthForHeight(height=1, ratio=25): actual=${actual}`);
      expect(actual).assertEqual(25);
      logInfo(`${BUNDLE}WidthForHeight_0014 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0015
     * @tc.name      WindowRatio_WidthForHeight_0015
     * @tc.desc      widthForHeight(height=1, ratio=30) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0015 begin`);
      const actual: number = widthForHeight(1, 30);
      logInfo(`widthForHeight(height=1, ratio=30): actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}WidthForHeight_0015 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0016
     * @tc.name      WindowRatio_WidthForHeight_0016
     * @tc.desc      widthForHeight(height=1, ratio=35) returns 35
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0016 begin`);
      const actual: number = widthForHeight(1, 35);
      logInfo(`widthForHeight(height=1, ratio=35): actual=${actual}`);
      expect(actual).assertEqual(35);
      logInfo(`${BUNDLE}WidthForHeight_0016 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0017
     * @tc.name      WindowRatio_WidthForHeight_0017
     * @tc.desc      widthForHeight(height=1, ratio=40) returns 40
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0017 begin`);
      const actual: number = widthForHeight(1, 40);
      logInfo(`widthForHeight(height=1, ratio=40): actual=${actual}`);
      expect(actual).assertEqual(40);
      logInfo(`${BUNDLE}WidthForHeight_0017 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0018
     * @tc.name      WindowRatio_WidthForHeight_0018
     * @tc.desc      widthForHeight(height=1, ratio=45) returns 45
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0018 begin`);
      const actual: number = widthForHeight(1, 45);
      logInfo(`widthForHeight(height=1, ratio=45): actual=${actual}`);
      expect(actual).assertEqual(45);
      logInfo(`${BUNDLE}WidthForHeight_0018 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0019
     * @tc.name      WindowRatio_WidthForHeight_0019
     * @tc.desc      widthForHeight(height=1, ratio=50) returns 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0019 begin`);
      const actual: number = widthForHeight(1, 50);
      logInfo(`widthForHeight(height=1, ratio=50): actual=${actual}`);
      expect(actual).assertEqual(50);
      logInfo(`${BUNDLE}WidthForHeight_0019 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0020
     * @tc.name      WindowRatio_WidthForHeight_0020
     * @tc.desc      widthForHeight(height=1, ratio=55) returns 55
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0020 begin`);
      const actual: number = widthForHeight(1, 55);
      logInfo(`widthForHeight(height=1, ratio=55): actual=${actual}`);
      expect(actual).assertEqual(55);
      logInfo(`${BUNDLE}WidthForHeight_0020 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0021
     * @tc.name      WindowRatio_WidthForHeight_0021
     * @tc.desc      widthForHeight(height=1, ratio=60) returns 60
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0021 begin`);
      const actual: number = widthForHeight(1, 60);
      logInfo(`widthForHeight(height=1, ratio=60): actual=${actual}`);
      expect(actual).assertEqual(60);
      logInfo(`${BUNDLE}WidthForHeight_0021 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0022
     * @tc.name      WindowRatio_WidthForHeight_0022
     * @tc.desc      widthForHeight(height=1, ratio=65) returns 65
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0022 begin`);
      const actual: number = widthForHeight(1, 65);
      logInfo(`widthForHeight(height=1, ratio=65): actual=${actual}`);
      expect(actual).assertEqual(65);
      logInfo(`${BUNDLE}WidthForHeight_0022 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0023
     * @tc.name      WindowRatio_WidthForHeight_0023
     * @tc.desc      widthForHeight(height=1, ratio=70) returns 70
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0023 begin`);
      const actual: number = widthForHeight(1, 70);
      logInfo(`widthForHeight(height=1, ratio=70): actual=${actual}`);
      expect(actual).assertEqual(70);
      logInfo(`${BUNDLE}WidthForHeight_0023 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0024
     * @tc.name      WindowRatio_WidthForHeight_0024
     * @tc.desc      widthForHeight(height=1, ratio=75) returns 75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0024 begin`);
      const actual: number = widthForHeight(1, 75);
      logInfo(`widthForHeight(height=1, ratio=75): actual=${actual}`);
      expect(actual).assertEqual(75);
      logInfo(`${BUNDLE}WidthForHeight_0024 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0025
     * @tc.name      WindowRatio_WidthForHeight_0025
     * @tc.desc      widthForHeight(height=1, ratio=80) returns 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0025 begin`);
      const actual: number = widthForHeight(1, 80);
      logInfo(`widthForHeight(height=1, ratio=80): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}WidthForHeight_0025 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0026
     * @tc.name      WindowRatio_WidthForHeight_0026
     * @tc.desc      widthForHeight(height=1, ratio=85) returns 85
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0026 begin`);
      const actual: number = widthForHeight(1, 85);
      logInfo(`widthForHeight(height=1, ratio=85): actual=${actual}`);
      expect(actual).assertEqual(85);
      logInfo(`${BUNDLE}WidthForHeight_0026 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0027
     * @tc.name      WindowRatio_WidthForHeight_0027
     * @tc.desc      widthForHeight(height=1, ratio=90) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0027 begin`);
      const actual: number = widthForHeight(1, 90);
      logInfo(`widthForHeight(height=1, ratio=90): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}WidthForHeight_0027 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0028
     * @tc.name      WindowRatio_WidthForHeight_0028
     * @tc.desc      widthForHeight(height=1, ratio=95) returns 95
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0028 begin`);
      const actual: number = widthForHeight(1, 95);
      logInfo(`widthForHeight(height=1, ratio=95): actual=${actual}`);
      expect(actual).assertEqual(95);
      logInfo(`${BUNDLE}WidthForHeight_0028 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0029
     * @tc.name      WindowRatio_WidthForHeight_0029
     * @tc.desc      widthForHeight(height=1, ratio=88.49) returns 88.49
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0029 begin`);
      const actual: number = widthForHeight(1, 88.49);
      logInfo(`widthForHeight(height=1, ratio=88.49): actual=${actual}`);
      expect(actual).assertClose(88.49, PRECISION);
      logInfo(`${BUNDLE}WidthForHeight_0029 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0030
     * @tc.name      WindowRatio_WidthForHeight_0030
     * @tc.desc      widthForHeight(height=1, ratio=29) returns 29
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0030 begin`);
      const actual: number = widthForHeight(1, 29);
      logInfo(`widthForHeight(height=1, ratio=29): actual=${actual}`);
      expect(actual).assertEqual(29);
      logInfo(`${BUNDLE}WidthForHeight_0030 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0031
     * @tc.name      WindowRatio_WidthForHeight_0031
     * @tc.desc      widthForHeight(height=100, ratio=1.5) returns 150
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0031 begin`);
      const actual: number = widthForHeight(100, 1.5);
      logInfo(`widthForHeight(height=100, ratio=1.5): actual=${actual}`);
      expect(actual).assertEqual(150);
      logInfo(`${BUNDLE}WidthForHeight_0031 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0032
     * @tc.name      WindowRatio_WidthForHeight_0032
     * @tc.desc      widthForHeight(height=100, ratio=2) returns 200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0032 begin`);
      const actual: number = widthForHeight(100, 2);
      logInfo(`widthForHeight(height=100, ratio=2): actual=${actual}`);
      expect(actual).assertEqual(200);
      logInfo(`${BUNDLE}WidthForHeight_0032 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0033
     * @tc.name      WindowRatio_WidthForHeight_0033
     * @tc.desc      widthForHeight(height=100, ratio=-1) returns -100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_WidthForHeight_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WidthForHeight_0033 begin`);
      const actual: number = widthForHeight(100, -1);
      logInfo(`widthForHeight(height=100, ratio=-1): actual=${actual}`);
      expect(actual).assertEqual(-100);
      logInfo(`${BUNDLE}WidthForHeight_0033 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0034
     * @tc.name      WindowRatio_WidthForHeight_0034
     * @tc.desc      widthForHeight(height=100, ratio=3) returns 300
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0034 begin`);
      const actual: number = widthForHeight(100, 3);
      logInfo(`widthForHeight(height=100, ratio=3): actual=${actual}`);
      expect(actual).assertEqual(300);
      logInfo(`${BUNDLE}WidthForHeight_0034 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0035
     * @tc.name      WindowRatio_WidthForHeight_0035
     * @tc.desc      widthForHeight(height=100, ratio=10) returns 1000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0035 begin`);
      const actual: number = widthForHeight(100, 10);
      logInfo(`widthForHeight(height=100, ratio=10): actual=${actual}`);
      expect(actual).assertEqual(1000);
      logInfo(`${BUNDLE}WidthForHeight_0035 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0036
     * @tc.name      WindowRatio_WidthForHeight_0036
     * @tc.desc      widthForHeight(height=100, ratio=100) returns 10000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0036 begin`);
      const actual: number = widthForHeight(100, 100);
      logInfo(`widthForHeight(height=100, ratio=100): actual=${actual}`);
      expect(actual).assertEqual(10000);
      logInfo(`${BUNDLE}WidthForHeight_0036 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0037
     * @tc.name      WindowRatio_WidthForHeight_0037
     * @tc.desc      widthForHeight(height=100, ratio=5) returns 500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0037 begin`);
      const actual: number = widthForHeight(100, 5);
      logInfo(`widthForHeight(height=100, ratio=5): actual=${actual}`);
      expect(actual).assertEqual(500);
      logInfo(`${BUNDLE}WidthForHeight_0037 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0038
     * @tc.name      WindowRatio_WidthForHeight_0038
     * @tc.desc      widthForHeight(height=100, ratio=15) returns 1500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0038 begin`);
      const actual: number = widthForHeight(100, 15);
      logInfo(`widthForHeight(height=100, ratio=15): actual=${actual}`);
      expect(actual).assertEqual(1500);
      logInfo(`${BUNDLE}WidthForHeight_0038 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0039
     * @tc.name      WindowRatio_WidthForHeight_0039
     * @tc.desc      widthForHeight(height=100, ratio=20) returns 2000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0039 begin`);
      const actual: number = widthForHeight(100, 20);
      logInfo(`widthForHeight(height=100, ratio=20): actual=${actual}`);
      expect(actual).assertEqual(2000);
      logInfo(`${BUNDLE}WidthForHeight_0039 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0040
     * @tc.name      WindowRatio_WidthForHeight_0040
     * @tc.desc      widthForHeight(height=100, ratio=25) returns 2500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0040 begin`);
      const actual: number = widthForHeight(100, 25);
      logInfo(`widthForHeight(height=100, ratio=25): actual=${actual}`);
      expect(actual).assertEqual(2500);
      logInfo(`${BUNDLE}WidthForHeight_0040 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0041
     * @tc.name      WindowRatio_WidthForHeight_0041
     * @tc.desc      widthForHeight(height=100, ratio=30) returns 3000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0041 begin`);
      const actual: number = widthForHeight(100, 30);
      logInfo(`widthForHeight(height=100, ratio=30): actual=${actual}`);
      expect(actual).assertEqual(3000);
      logInfo(`${BUNDLE}WidthForHeight_0041 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0042
     * @tc.name      WindowRatio_WidthForHeight_0042
     * @tc.desc      widthForHeight(height=100, ratio=35) returns 3500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0042 begin`);
      const actual: number = widthForHeight(100, 35);
      logInfo(`widthForHeight(height=100, ratio=35): actual=${actual}`);
      expect(actual).assertEqual(3500);
      logInfo(`${BUNDLE}WidthForHeight_0042 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0043
     * @tc.name      WindowRatio_WidthForHeight_0043
     * @tc.desc      widthForHeight(height=100, ratio=40) returns 4000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0043 begin`);
      const actual: number = widthForHeight(100, 40);
      logInfo(`widthForHeight(height=100, ratio=40): actual=${actual}`);
      expect(actual).assertEqual(4000);
      logInfo(`${BUNDLE}WidthForHeight_0043 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0044
     * @tc.name      WindowRatio_WidthForHeight_0044
     * @tc.desc      widthForHeight(height=100, ratio=45) returns 4500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0044 begin`);
      const actual: number = widthForHeight(100, 45);
      logInfo(`widthForHeight(height=100, ratio=45): actual=${actual}`);
      expect(actual).assertEqual(4500);
      logInfo(`${BUNDLE}WidthForHeight_0044 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0045
     * @tc.name      WindowRatio_WidthForHeight_0045
     * @tc.desc      widthForHeight(height=100, ratio=50) returns 5000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0045 begin`);
      const actual: number = widthForHeight(100, 50);
      logInfo(`widthForHeight(height=100, ratio=50): actual=${actual}`);
      expect(actual).assertEqual(5000);
      logInfo(`${BUNDLE}WidthForHeight_0045 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0046
     * @tc.name      WindowRatio_WidthForHeight_0046
     * @tc.desc      widthForHeight(height=100, ratio=55) returns 5500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0046 begin`);
      const actual: number = widthForHeight(100, 55);
      logInfo(`widthForHeight(height=100, ratio=55): actual=${actual}`);
      expect(actual).assertEqual(5500);
      logInfo(`${BUNDLE}WidthForHeight_0046 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0047
     * @tc.name      WindowRatio_WidthForHeight_0047
     * @tc.desc      widthForHeight(height=100, ratio=60) returns 6000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0047 begin`);
      const actual: number = widthForHeight(100, 60);
      logInfo(`widthForHeight(height=100, ratio=60): actual=${actual}`);
      expect(actual).assertEqual(6000);
      logInfo(`${BUNDLE}WidthForHeight_0047 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0048
     * @tc.name      WindowRatio_WidthForHeight_0048
     * @tc.desc      widthForHeight(height=100, ratio=65) returns 6500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0048 begin`);
      const actual: number = widthForHeight(100, 65);
      logInfo(`widthForHeight(height=100, ratio=65): actual=${actual}`);
      expect(actual).assertEqual(6500);
      logInfo(`${BUNDLE}WidthForHeight_0048 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0049
     * @tc.name      WindowRatio_WidthForHeight_0049
     * @tc.desc      widthForHeight(height=100, ratio=70) returns 7000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0049 begin`);
      const actual: number = widthForHeight(100, 70);
      logInfo(`widthForHeight(height=100, ratio=70): actual=${actual}`);
      expect(actual).assertEqual(7000);
      logInfo(`${BUNDLE}WidthForHeight_0049 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0050
     * @tc.name      WindowRatio_WidthForHeight_0050
     * @tc.desc      widthForHeight(height=100, ratio=75) returns 7500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0050 begin`);
      const actual: number = widthForHeight(100, 75);
      logInfo(`widthForHeight(height=100, ratio=75): actual=${actual}`);
      expect(actual).assertEqual(7500);
      logInfo(`${BUNDLE}WidthForHeight_0050 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0051
     * @tc.name      WindowRatio_WidthForHeight_0051
     * @tc.desc      widthForHeight(height=100, ratio=80) returns 8000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0051 begin`);
      const actual: number = widthForHeight(100, 80);
      logInfo(`widthForHeight(height=100, ratio=80): actual=${actual}`);
      expect(actual).assertEqual(8000);
      logInfo(`${BUNDLE}WidthForHeight_0051 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0052
     * @tc.name      WindowRatio_WidthForHeight_0052
     * @tc.desc      widthForHeight(height=100, ratio=85) returns 8500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0052 begin`);
      const actual: number = widthForHeight(100, 85);
      logInfo(`widthForHeight(height=100, ratio=85): actual=${actual}`);
      expect(actual).assertEqual(8500);
      logInfo(`${BUNDLE}WidthForHeight_0052 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0053
     * @tc.name      WindowRatio_WidthForHeight_0053
     * @tc.desc      widthForHeight(height=100, ratio=90) returns 9000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0053 begin`);
      const actual: number = widthForHeight(100, 90);
      logInfo(`widthForHeight(height=100, ratio=90): actual=${actual}`);
      expect(actual).assertEqual(9000);
      logInfo(`${BUNDLE}WidthForHeight_0053 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0054
     * @tc.name      WindowRatio_WidthForHeight_0054
     * @tc.desc      widthForHeight(height=100, ratio=95) returns 9500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0054 begin`);
      const actual: number = widthForHeight(100, 95);
      logInfo(`widthForHeight(height=100, ratio=95): actual=${actual}`);
      expect(actual).assertEqual(9500);
      logInfo(`${BUNDLE}WidthForHeight_0054 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0055
     * @tc.name      WindowRatio_WidthForHeight_0055
     * @tc.desc      widthForHeight(height=100, ratio=88.49) returns 8849
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0055 begin`);
      const actual: number = widthForHeight(100, 88.49);
      logInfo(`widthForHeight(height=100, ratio=88.49): actual=${actual}`);
      expect(actual).assertEqual(8849);
      logInfo(`${BUNDLE}WidthForHeight_0055 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0056
     * @tc.name      WindowRatio_WidthForHeight_0056
     * @tc.desc      widthForHeight(height=100, ratio=29) returns 2900
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0056 begin`);
      const actual: number = widthForHeight(100, 29);
      logInfo(`widthForHeight(height=100, ratio=29): actual=${actual}`);
      expect(actual).assertEqual(2900);
      logInfo(`${BUNDLE}WidthForHeight_0056 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0057
     * @tc.name      WindowRatio_WidthForHeight_0057
     * @tc.desc      widthForHeight(height=360, ratio=0.5) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0057 begin`);
      const actual: number = widthForHeight(360, 0.5);
      logInfo(`widthForHeight(height=360, ratio=0.5): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}WidthForHeight_0057 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0058
     * @tc.name      WindowRatio_WidthForHeight_0058
     * @tc.desc      widthForHeight(height=360, ratio=1) returns 360
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0058 begin`);
      const actual: number = widthForHeight(360, 1);
      logInfo(`widthForHeight(height=360, ratio=1): actual=${actual}`);
      expect(actual).assertEqual(360);
      logInfo(`${BUNDLE}WidthForHeight_0058 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0059
     * @tc.name      WindowRatio_WidthForHeight_0059
     * @tc.desc      widthForHeight(height=360, ratio=1.5) returns 540
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0059 begin`);
      const actual: number = widthForHeight(360, 1.5);
      logInfo(`widthForHeight(height=360, ratio=1.5): actual=${actual}`);
      expect(actual).assertEqual(540);
      logInfo(`${BUNDLE}WidthForHeight_0059 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0060
     * @tc.name      WindowRatio_WidthForHeight_0060
     * @tc.desc      widthForHeight(height=360, ratio=2) returns 720
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0060 begin`);
      const actual: number = widthForHeight(360, 2);
      logInfo(`widthForHeight(height=360, ratio=2): actual=${actual}`);
      expect(actual).assertEqual(720);
      logInfo(`${BUNDLE}WidthForHeight_0060 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0061
     * @tc.name      WindowRatio_WidthForHeight_0061
     * @tc.desc      widthForHeight(height=360, ratio=-1) returns -360
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_WidthForHeight_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WidthForHeight_0061 begin`);
      const actual: number = widthForHeight(360, -1);
      logInfo(`widthForHeight(height=360, ratio=-1): actual=${actual}`);
      expect(actual).assertEqual(-360);
      logInfo(`${BUNDLE}WidthForHeight_0061 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0062
     * @tc.name      WindowRatio_WidthForHeight_0062
     * @tc.desc      widthForHeight(height=360, ratio=3) returns 1080
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0062 begin`);
      const actual: number = widthForHeight(360, 3);
      logInfo(`widthForHeight(height=360, ratio=3): actual=${actual}`);
      expect(actual).assertEqual(1080);
      logInfo(`${BUNDLE}WidthForHeight_0062 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0063
     * @tc.name      WindowRatio_WidthForHeight_0063
     * @tc.desc      widthForHeight(height=360, ratio=10) returns 3600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0063 begin`);
      const actual: number = widthForHeight(360, 10);
      logInfo(`widthForHeight(height=360, ratio=10): actual=${actual}`);
      expect(actual).assertEqual(3600);
      logInfo(`${BUNDLE}WidthForHeight_0063 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0064
     * @tc.name      WindowRatio_WidthForHeight_0064
     * @tc.desc      widthForHeight(height=360, ratio=100) returns 36000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0064 begin`);
      const actual: number = widthForHeight(360, 100);
      logInfo(`widthForHeight(height=360, ratio=100): actual=${actual}`);
      expect(actual).assertEqual(36000);
      logInfo(`${BUNDLE}WidthForHeight_0064 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0065
     * @tc.name      WindowRatio_WidthForHeight_0065
     * @tc.desc      widthForHeight(height=360, ratio=5) returns 1800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0065 begin`);
      const actual: number = widthForHeight(360, 5);
      logInfo(`widthForHeight(height=360, ratio=5): actual=${actual}`);
      expect(actual).assertEqual(1800);
      logInfo(`${BUNDLE}WidthForHeight_0065 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0066
     * @tc.name      WindowRatio_WidthForHeight_0066
     * @tc.desc      widthForHeight(height=360, ratio=15) returns 5400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0066 begin`);
      const actual: number = widthForHeight(360, 15);
      logInfo(`widthForHeight(height=360, ratio=15): actual=${actual}`);
      expect(actual).assertEqual(5400);
      logInfo(`${BUNDLE}WidthForHeight_0066 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0067
     * @tc.name      WindowRatio_WidthForHeight_0067
     * @tc.desc      widthForHeight(height=360, ratio=20) returns 7200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0067 begin`);
      const actual: number = widthForHeight(360, 20);
      logInfo(`widthForHeight(height=360, ratio=20): actual=${actual}`);
      expect(actual).assertEqual(7200);
      logInfo(`${BUNDLE}WidthForHeight_0067 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0068
     * @tc.name      WindowRatio_WidthForHeight_0068
     * @tc.desc      widthForHeight(height=360, ratio=30) returns 10800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0068 begin`);
      const actual: number = widthForHeight(360, 30);
      logInfo(`widthForHeight(height=360, ratio=30): actual=${actual}`);
      expect(actual).assertEqual(10800);
      logInfo(`${BUNDLE}WidthForHeight_0068 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0069
     * @tc.name      WindowRatio_WidthForHeight_0069
     * @tc.desc      widthForHeight(height=360, ratio=35) returns 12600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0069 begin`);
      const actual: number = widthForHeight(360, 35);
      logInfo(`widthForHeight(height=360, ratio=35): actual=${actual}`);
      expect(actual).assertEqual(12600);
      logInfo(`${BUNDLE}WidthForHeight_0069 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0070
     * @tc.name      WindowRatio_WidthForHeight_0070
     * @tc.desc      widthForHeight(height=360, ratio=40) returns 14400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0070 begin`);
      const actual: number = widthForHeight(360, 40);
      logInfo(`widthForHeight(height=360, ratio=40): actual=${actual}`);
      expect(actual).assertEqual(14400);
      logInfo(`${BUNDLE}WidthForHeight_0070 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0071
     * @tc.name      WindowRatio_WidthForHeight_0071
     * @tc.desc      widthForHeight(height=360, ratio=45) returns 16200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0071 begin`);
      const actual: number = widthForHeight(360, 45);
      logInfo(`widthForHeight(height=360, ratio=45): actual=${actual}`);
      expect(actual).assertEqual(16200);
      logInfo(`${BUNDLE}WidthForHeight_0071 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0072
     * @tc.name      WindowRatio_WidthForHeight_0072
     * @tc.desc      widthForHeight(height=360, ratio=50) returns 18000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0072 begin`);
      const actual: number = widthForHeight(360, 50);
      logInfo(`widthForHeight(height=360, ratio=50): actual=${actual}`);
      expect(actual).assertEqual(18000);
      logInfo(`${BUNDLE}WidthForHeight_0072 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0073
     * @tc.name      WindowRatio_WidthForHeight_0073
     * @tc.desc      widthForHeight(height=360, ratio=55) returns 19800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0073 begin`);
      const actual: number = widthForHeight(360, 55);
      logInfo(`widthForHeight(height=360, ratio=55): actual=${actual}`);
      expect(actual).assertEqual(19800);
      logInfo(`${BUNDLE}WidthForHeight_0073 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0074
     * @tc.name      WindowRatio_WidthForHeight_0074
     * @tc.desc      widthForHeight(height=360, ratio=60) returns 21600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0074 begin`);
      const actual: number = widthForHeight(360, 60);
      logInfo(`widthForHeight(height=360, ratio=60): actual=${actual}`);
      expect(actual).assertEqual(21600);
      logInfo(`${BUNDLE}WidthForHeight_0074 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0075
     * @tc.name      WindowRatio_WidthForHeight_0075
     * @tc.desc      widthForHeight(height=360, ratio=65) returns 23400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0075 begin`);
      const actual: number = widthForHeight(360, 65);
      logInfo(`widthForHeight(height=360, ratio=65): actual=${actual}`);
      expect(actual).assertEqual(23400);
      logInfo(`${BUNDLE}WidthForHeight_0075 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0076
     * @tc.name      WindowRatio_WidthForHeight_0076
     * @tc.desc      widthForHeight(height=360, ratio=70) returns 25200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0076 begin`);
      const actual: number = widthForHeight(360, 70);
      logInfo(`widthForHeight(height=360, ratio=70): actual=${actual}`);
      expect(actual).assertEqual(25200);
      logInfo(`${BUNDLE}WidthForHeight_0076 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0077
     * @tc.name      WindowRatio_WidthForHeight_0077
     * @tc.desc      widthForHeight(height=360, ratio=75) returns 27000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0077 begin`);
      const actual: number = widthForHeight(360, 75);
      logInfo(`widthForHeight(height=360, ratio=75): actual=${actual}`);
      expect(actual).assertEqual(27000);
      logInfo(`${BUNDLE}WidthForHeight_0077 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0078
     * @tc.name      WindowRatio_WidthForHeight_0078
     * @tc.desc      widthForHeight(height=360, ratio=80) returns 28800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0078 begin`);
      const actual: number = widthForHeight(360, 80);
      logInfo(`widthForHeight(height=360, ratio=80): actual=${actual}`);
      expect(actual).assertEqual(28800);
      logInfo(`${BUNDLE}WidthForHeight_0078 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0079
     * @tc.name      WindowRatio_WidthForHeight_0079
     * @tc.desc      widthForHeight(height=360, ratio=85) returns 30600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0079 begin`);
      const actual: number = widthForHeight(360, 85);
      logInfo(`widthForHeight(height=360, ratio=85): actual=${actual}`);
      expect(actual).assertEqual(30600);
      logInfo(`${BUNDLE}WidthForHeight_0079 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0080
     * @tc.name      WindowRatio_WidthForHeight_0080
     * @tc.desc      widthForHeight(height=360, ratio=90) returns 32400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0080 begin`);
      const actual: number = widthForHeight(360, 90);
      logInfo(`widthForHeight(height=360, ratio=90): actual=${actual}`);
      expect(actual).assertEqual(32400);
      logInfo(`${BUNDLE}WidthForHeight_0080 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0081
     * @tc.name      WindowRatio_WidthForHeight_0081
     * @tc.desc      widthForHeight(height=360, ratio=95) returns 34200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0081 begin`);
      const actual: number = widthForHeight(360, 95);
      logInfo(`widthForHeight(height=360, ratio=95): actual=${actual}`);
      expect(actual).assertEqual(34200);
      logInfo(`${BUNDLE}WidthForHeight_0081 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0082
     * @tc.name      WindowRatio_WidthForHeight_0082
     * @tc.desc      widthForHeight(height=360, ratio=88.49) returns 31856.399999999998
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0082 begin`);
      const actual: number = widthForHeight(360, 88.49);
      logInfo(`widthForHeight(height=360, ratio=88.49): actual=${actual}`);
      expect(actual).assertClose(31856.399999999998, PRECISION);
      logInfo(`${BUNDLE}WidthForHeight_0082 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0083
     * @tc.name      WindowRatio_WidthForHeight_0083
     * @tc.desc      widthForHeight(height=360, ratio=29) returns 10440
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0083 begin`);
      const actual: number = widthForHeight(360, 29);
      logInfo(`widthForHeight(height=360, ratio=29): actual=${actual}`);
      expect(actual).assertEqual(10440);
      logInfo(`${BUNDLE}WidthForHeight_0083 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0084
     * @tc.name      WindowRatio_WidthForHeight_0084
     * @tc.desc      widthForHeight(height=720, ratio=2) returns 1440
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0084 begin`);
      const actual: number = widthForHeight(720, 2);
      logInfo(`widthForHeight(height=720, ratio=2): actual=${actual}`);
      expect(actual).assertEqual(1440);
      logInfo(`${BUNDLE}WidthForHeight_0084 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0085
     * @tc.name      WindowRatio_WidthForHeight_0085
     * @tc.desc      widthForHeight(height=720, ratio=-1) returns -720
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_WidthForHeight_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WidthForHeight_0085 begin`);
      const actual: number = widthForHeight(720, -1);
      logInfo(`widthForHeight(height=720, ratio=-1): actual=${actual}`);
      expect(actual).assertEqual(-720);
      logInfo(`${BUNDLE}WidthForHeight_0085 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0086
     * @tc.name      WindowRatio_WidthForHeight_0086
     * @tc.desc      widthForHeight(height=720, ratio=3) returns 2160
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0086 begin`);
      const actual: number = widthForHeight(720, 3);
      logInfo(`widthForHeight(height=720, ratio=3): actual=${actual}`);
      expect(actual).assertEqual(2160);
      logInfo(`${BUNDLE}WidthForHeight_0086 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0087
     * @tc.name      WindowRatio_WidthForHeight_0087
     * @tc.desc      widthForHeight(height=720, ratio=100) returns 72000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0087 begin`);
      const actual: number = widthForHeight(720, 100);
      logInfo(`widthForHeight(height=720, ratio=100): actual=${actual}`);
      expect(actual).assertEqual(72000);
      logInfo(`${BUNDLE}WidthForHeight_0087 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0088
     * @tc.name      WindowRatio_WidthForHeight_0088
     * @tc.desc      widthForHeight(height=720, ratio=55) returns 39600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0088 begin`);
      const actual: number = widthForHeight(720, 55);
      logInfo(`widthForHeight(height=720, ratio=55): actual=${actual}`);
      expect(actual).assertEqual(39600);
      logInfo(`${BUNDLE}WidthForHeight_0088 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0089
     * @tc.name      WindowRatio_WidthForHeight_0089
     * @tc.desc      widthForHeight(height=720, ratio=60) returns 43200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0089 begin`);
      const actual: number = widthForHeight(720, 60);
      logInfo(`widthForHeight(height=720, ratio=60): actual=${actual}`);
      expect(actual).assertEqual(43200);
      logInfo(`${BUNDLE}WidthForHeight_0089 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0090
     * @tc.name      WindowRatio_WidthForHeight_0090
     * @tc.desc      widthForHeight(height=720, ratio=65) returns 46800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0090 begin`);
      const actual: number = widthForHeight(720, 65);
      logInfo(`widthForHeight(height=720, ratio=65): actual=${actual}`);
      expect(actual).assertEqual(46800);
      logInfo(`${BUNDLE}WidthForHeight_0090 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0091
     * @tc.name      WindowRatio_WidthForHeight_0091
     * @tc.desc      widthForHeight(height=720, ratio=70) returns 50400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0091 begin`);
      const actual: number = widthForHeight(720, 70);
      logInfo(`widthForHeight(height=720, ratio=70): actual=${actual}`);
      expect(actual).assertEqual(50400);
      logInfo(`${BUNDLE}WidthForHeight_0091 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0092
     * @tc.name      WindowRatio_WidthForHeight_0092
     * @tc.desc      widthForHeight(height=720, ratio=75) returns 54000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0092 begin`);
      const actual: number = widthForHeight(720, 75);
      logInfo(`widthForHeight(height=720, ratio=75): actual=${actual}`);
      expect(actual).assertEqual(54000);
      logInfo(`${BUNDLE}WidthForHeight_0092 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0093
     * @tc.name      WindowRatio_WidthForHeight_0093
     * @tc.desc      widthForHeight(height=720, ratio=80) returns 57600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0093 begin`);
      const actual: number = widthForHeight(720, 80);
      logInfo(`widthForHeight(height=720, ratio=80): actual=${actual}`);
      expect(actual).assertEqual(57600);
      logInfo(`${BUNDLE}WidthForHeight_0093 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0094
     * @tc.name      WindowRatio_WidthForHeight_0094
     * @tc.desc      widthForHeight(height=720, ratio=85) returns 61200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0094 begin`);
      const actual: number = widthForHeight(720, 85);
      logInfo(`widthForHeight(height=720, ratio=85): actual=${actual}`);
      expect(actual).assertEqual(61200);
      logInfo(`${BUNDLE}WidthForHeight_0094 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0095
     * @tc.name      WindowRatio_WidthForHeight_0095
     * @tc.desc      widthForHeight(height=720, ratio=90) returns 64800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0095 begin`);
      const actual: number = widthForHeight(720, 90);
      logInfo(`widthForHeight(height=720, ratio=90): actual=${actual}`);
      expect(actual).assertEqual(64800);
      logInfo(`${BUNDLE}WidthForHeight_0095 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_WIDTH_FOR_HEIGHT_0096
     * @tc.name      WindowRatio_WidthForHeight_0096
     * @tc.desc      widthForHeight(height=720, ratio=95) returns 68400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_WidthForHeight_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WidthForHeight_0096 begin`);
      const actual: number = widthForHeight(720, 95);
      logInfo(`widthForHeight(height=720, ratio=95): actual=${actual}`);
      expect(actual).assertEqual(68400);
      logInfo(`${BUNDLE}WidthForHeight_0096 end`);
    });
  });
}
