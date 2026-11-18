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
import { roundedHeightForWidth } from '../model/WindowRatioLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_WindowRatio]';
const BUNDLE: string = 'WindowRatio_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for roundedHeightForWidth (96 cases). */
export default function roundedHeightForWidthTest(): void {
  describe('RoundedHeightForWidthTest', () => {
    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0001
     * @tc.name      WindowRatio_RoundedHeightForWidth_0001
     * @tc.desc      roundedHeightForWidth(width=0, ratio=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('WindowRatio_RoundedHeightForWidth_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0001 begin`);
      const actual: number = roundedHeightForWidth(0, 0);
      logInfo(`roundedHeightForWidth(width=0, ratio=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0001 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0002
     * @tc.name      WindowRatio_RoundedHeightForWidth_0002
     * @tc.desc      roundedHeightForWidth(width=1, ratio=0.25) returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('WindowRatio_RoundedHeightForWidth_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0002 begin`);
      const actual: number = roundedHeightForWidth(1, 0.25);
      logInfo(`roundedHeightForWidth(width=1, ratio=0.25): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0002 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0003
     * @tc.name      WindowRatio_RoundedHeightForWidth_0003
     * @tc.desc      roundedHeightForWidth(width=1, ratio=0.5) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0003 begin`);
      const actual: number = roundedHeightForWidth(1, 0.5);
      logInfo(`roundedHeightForWidth(width=1, ratio=0.5): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0003 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0004
     * @tc.name      WindowRatio_RoundedHeightForWidth_0004
     * @tc.desc      roundedHeightForWidth(width=1, ratio=1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0004 begin`);
      const actual: number = roundedHeightForWidth(1, 1);
      logInfo(`roundedHeightForWidth(width=1, ratio=1): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0004 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0005
     * @tc.name      WindowRatio_RoundedHeightForWidth_0005
     * @tc.desc      roundedHeightForWidth(width=100, ratio=0.25) returns 400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0005 begin`);
      const actual: number = roundedHeightForWidth(100, 0.25);
      logInfo(`roundedHeightForWidth(width=100, ratio=0.25): actual=${actual}`);
      expect(actual).assertEqual(400);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0005 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0006
     * @tc.name      WindowRatio_RoundedHeightForWidth_0006
     * @tc.desc      roundedHeightForWidth(width=100, ratio=0.5) returns 200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0006 begin`);
      const actual: number = roundedHeightForWidth(100, 0.5);
      logInfo(`roundedHeightForWidth(width=100, ratio=0.5): actual=${actual}`);
      expect(actual).assertEqual(200);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0006 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0007
     * @tc.name      WindowRatio_RoundedHeightForWidth_0007
     * @tc.desc      roundedHeightForWidth(width=100, ratio=1) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0007 begin`);
      const actual: number = roundedHeightForWidth(100, 1);
      logInfo(`roundedHeightForWidth(width=100, ratio=1): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0007 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0008
     * @tc.name      WindowRatio_RoundedHeightForWidth_0008
     * @tc.desc      roundedHeightForWidth(width=100, ratio=1.5) returns 67
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0008 begin`);
      const actual: number = roundedHeightForWidth(100, 1.5);
      logInfo(`roundedHeightForWidth(width=100, ratio=1.5): actual=${actual}`);
      expect(actual).assertEqual(67);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0008 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0009
     * @tc.name      WindowRatio_RoundedHeightForWidth_0009
     * @tc.desc      roundedHeightForWidth(width=100, ratio=2) returns 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0009 begin`);
      const actual: number = roundedHeightForWidth(100, 2);
      logInfo(`roundedHeightForWidth(width=100, ratio=2): actual=${actual}`);
      expect(actual).assertEqual(50);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0009 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0010
     * @tc.name      WindowRatio_RoundedHeightForWidth_0010
     * @tc.desc      roundedHeightForWidth(width=100, ratio=3) returns 33
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0010 begin`);
      const actual: number = roundedHeightForWidth(100, 3);
      logInfo(`roundedHeightForWidth(width=100, ratio=3): actual=${actual}`);
      expect(actual).assertEqual(33);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0010 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0011
     * @tc.name      WindowRatio_RoundedHeightForWidth_0011
     * @tc.desc      roundedHeightForWidth(width=100, ratio=10) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0011 begin`);
      const actual: number = roundedHeightForWidth(100, 10);
      logInfo(`roundedHeightForWidth(width=100, ratio=10): actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0011 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0012
     * @tc.name      WindowRatio_RoundedHeightForWidth_0012
     * @tc.desc      roundedHeightForWidth(width=100, ratio=5) returns 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0012 begin`);
      const actual: number = roundedHeightForWidth(100, 5);
      logInfo(`roundedHeightForWidth(width=100, ratio=5): actual=${actual}`);
      expect(actual).assertEqual(20);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0012 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0013
     * @tc.name      WindowRatio_RoundedHeightForWidth_0013
     * @tc.desc      roundedHeightForWidth(width=100, ratio=15) returns 7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0013 begin`);
      const actual: number = roundedHeightForWidth(100, 15);
      logInfo(`roundedHeightForWidth(width=100, ratio=15): actual=${actual}`);
      expect(actual).assertEqual(7);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0013 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0014
     * @tc.name      WindowRatio_RoundedHeightForWidth_0014
     * @tc.desc      roundedHeightForWidth(width=100, ratio=20) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0014 begin`);
      const actual: number = roundedHeightForWidth(100, 20);
      logInfo(`roundedHeightForWidth(width=100, ratio=20): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0014 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0015
     * @tc.name      WindowRatio_RoundedHeightForWidth_0015
     * @tc.desc      roundedHeightForWidth(width=100, ratio=30) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0015 begin`);
      const actual: number = roundedHeightForWidth(100, 30);
      logInfo(`roundedHeightForWidth(width=100, ratio=30): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0015 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0016
     * @tc.name      WindowRatio_RoundedHeightForWidth_0016
     * @tc.desc      roundedHeightForWidth(width=360, ratio=0.25) returns 1440
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0016 begin`);
      const actual: number = roundedHeightForWidth(360, 0.25);
      logInfo(`roundedHeightForWidth(width=360, ratio=0.25): actual=${actual}`);
      expect(actual).assertEqual(1440);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0016 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0017
     * @tc.name      WindowRatio_RoundedHeightForWidth_0017
     * @tc.desc      roundedHeightForWidth(width=360, ratio=0.5) returns 720
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0017 begin`);
      const actual: number = roundedHeightForWidth(360, 0.5);
      logInfo(`roundedHeightForWidth(width=360, ratio=0.5): actual=${actual}`);
      expect(actual).assertEqual(720);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0017 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0018
     * @tc.name      WindowRatio_RoundedHeightForWidth_0018
     * @tc.desc      roundedHeightForWidth(width=360, ratio=1) returns 360
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0018 begin`);
      const actual: number = roundedHeightForWidth(360, 1);
      logInfo(`roundedHeightForWidth(width=360, ratio=1): actual=${actual}`);
      expect(actual).assertEqual(360);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0018 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0019
     * @tc.name      WindowRatio_RoundedHeightForWidth_0019
     * @tc.desc      roundedHeightForWidth(width=360, ratio=1.5) returns 240
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0019 begin`);
      const actual: number = roundedHeightForWidth(360, 1.5);
      logInfo(`roundedHeightForWidth(width=360, ratio=1.5): actual=${actual}`);
      expect(actual).assertEqual(240);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0019 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0020
     * @tc.name      WindowRatio_RoundedHeightForWidth_0020
     * @tc.desc      roundedHeightForWidth(width=360, ratio=2) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0020 begin`);
      const actual: number = roundedHeightForWidth(360, 2);
      logInfo(`roundedHeightForWidth(width=360, ratio=2): actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0020 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0021
     * @tc.name      WindowRatio_RoundedHeightForWidth_0021
     * @tc.desc      roundedHeightForWidth(width=360, ratio=3) returns 120
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0021 begin`);
      const actual: number = roundedHeightForWidth(360, 3);
      logInfo(`roundedHeightForWidth(width=360, ratio=3): actual=${actual}`);
      expect(actual).assertEqual(120);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0021 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0022
     * @tc.name      WindowRatio_RoundedHeightForWidth_0022
     * @tc.desc      roundedHeightForWidth(width=360, ratio=10) returns 36
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0022 begin`);
      const actual: number = roundedHeightForWidth(360, 10);
      logInfo(`roundedHeightForWidth(width=360, ratio=10): actual=${actual}`);
      expect(actual).assertEqual(36);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0022 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0023
     * @tc.name      WindowRatio_RoundedHeightForWidth_0023
     * @tc.desc      roundedHeightForWidth(width=360, ratio=5) returns 72
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0023 begin`);
      const actual: number = roundedHeightForWidth(360, 5);
      logInfo(`roundedHeightForWidth(width=360, ratio=5): actual=${actual}`);
      expect(actual).assertEqual(72);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0023 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0024
     * @tc.name      WindowRatio_RoundedHeightForWidth_0024
     * @tc.desc      roundedHeightForWidth(width=360, ratio=15) returns 24
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0024 begin`);
      const actual: number = roundedHeightForWidth(360, 15);
      logInfo(`roundedHeightForWidth(width=360, ratio=15): actual=${actual}`);
      expect(actual).assertEqual(24);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0024 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0025
     * @tc.name      WindowRatio_RoundedHeightForWidth_0025
     * @tc.desc      roundedHeightForWidth(width=360, ratio=20) returns 18
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0025 begin`);
      const actual: number = roundedHeightForWidth(360, 20);
      logInfo(`roundedHeightForWidth(width=360, ratio=20): actual=${actual}`);
      expect(actual).assertEqual(18);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0025 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0026
     * @tc.name      WindowRatio_RoundedHeightForWidth_0026
     * @tc.desc      roundedHeightForWidth(width=360, ratio=25) returns 14
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0026 begin`);
      const actual: number = roundedHeightForWidth(360, 25);
      logInfo(`roundedHeightForWidth(width=360, ratio=25): actual=${actual}`);
      expect(actual).assertEqual(14);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0026 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0027
     * @tc.name      WindowRatio_RoundedHeightForWidth_0027
     * @tc.desc      roundedHeightForWidth(width=360, ratio=30) returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0027 begin`);
      const actual: number = roundedHeightForWidth(360, 30);
      logInfo(`roundedHeightForWidth(width=360, ratio=30): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0027 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0028
     * @tc.name      WindowRatio_RoundedHeightForWidth_0028
     * @tc.desc      roundedHeightForWidth(width=360, ratio=40) returns 9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0028 begin`);
      const actual: number = roundedHeightForWidth(360, 40);
      logInfo(`roundedHeightForWidth(width=360, ratio=40): actual=${actual}`);
      expect(actual).assertEqual(9);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0028 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0029
     * @tc.name      WindowRatio_RoundedHeightForWidth_0029
     * @tc.desc      roundedHeightForWidth(width=360, ratio=45) returns 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0029 begin`);
      const actual: number = roundedHeightForWidth(360, 45);
      logInfo(`roundedHeightForWidth(width=360, ratio=45): actual=${actual}`);
      expect(actual).assertEqual(8);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0029 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0030
     * @tc.name      WindowRatio_RoundedHeightForWidth_0030
     * @tc.desc      roundedHeightForWidth(width=360, ratio=60) returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0030 begin`);
      const actual: number = roundedHeightForWidth(360, 60);
      logInfo(`roundedHeightForWidth(width=360, ratio=60): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0030 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0031
     * @tc.name      WindowRatio_RoundedHeightForWidth_0031
     * @tc.desc      roundedHeightForWidth(width=720, ratio=0.25) returns 2880
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0031 begin`);
      const actual: number = roundedHeightForWidth(720, 0.25);
      logInfo(`roundedHeightForWidth(width=720, ratio=0.25): actual=${actual}`);
      expect(actual).assertEqual(2880);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0031 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0032
     * @tc.name      WindowRatio_RoundedHeightForWidth_0032
     * @tc.desc      roundedHeightForWidth(width=720, ratio=1.5) returns 480
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0032 begin`);
      const actual: number = roundedHeightForWidth(720, 1.5);
      logInfo(`roundedHeightForWidth(width=720, ratio=1.5): actual=${actual}`);
      expect(actual).assertEqual(480);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0032 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0033
     * @tc.name      WindowRatio_RoundedHeightForWidth_0033
     * @tc.desc      roundedHeightForWidth(width=720, ratio=5) returns 144
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0033 begin`);
      const actual: number = roundedHeightForWidth(720, 5);
      logInfo(`roundedHeightForWidth(width=720, ratio=5): actual=${actual}`);
      expect(actual).assertEqual(144);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0033 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0034
     * @tc.name      WindowRatio_RoundedHeightForWidth_0034
     * @tc.desc      roundedHeightForWidth(width=720, ratio=15) returns 48
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0034 begin`);
      const actual: number = roundedHeightForWidth(720, 15);
      logInfo(`roundedHeightForWidth(width=720, ratio=15): actual=${actual}`);
      expect(actual).assertEqual(48);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0034 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0035
     * @tc.name      WindowRatio_RoundedHeightForWidth_0035
     * @tc.desc      roundedHeightForWidth(width=720, ratio=25) returns 29
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0035 begin`);
      const actual: number = roundedHeightForWidth(720, 25);
      logInfo(`roundedHeightForWidth(width=720, ratio=25): actual=${actual}`);
      expect(actual).assertEqual(29);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0035 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0036
     * @tc.name      WindowRatio_RoundedHeightForWidth_0036
     * @tc.desc      roundedHeightForWidth(width=720, ratio=35) returns 21
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0036 begin`);
      const actual: number = roundedHeightForWidth(720, 35);
      logInfo(`roundedHeightForWidth(width=720, ratio=35): actual=${actual}`);
      expect(actual).assertEqual(21);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0036 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0037
     * @tc.name      WindowRatio_RoundedHeightForWidth_0037
     * @tc.desc      roundedHeightForWidth(width=720, ratio=45) returns 16
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0037 begin`);
      const actual: number = roundedHeightForWidth(720, 45);
      logInfo(`roundedHeightForWidth(width=720, ratio=45): actual=${actual}`);
      expect(actual).assertEqual(16);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0037 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0038
     * @tc.name      WindowRatio_RoundedHeightForWidth_0038
     * @tc.desc      roundedHeightForWidth(width=720, ratio=55) returns 13
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0038 begin`);
      const actual: number = roundedHeightForWidth(720, 55);
      logInfo(`roundedHeightForWidth(width=720, ratio=55): actual=${actual}`);
      expect(actual).assertEqual(13);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0038 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0039
     * @tc.name      WindowRatio_RoundedHeightForWidth_0039
     * @tc.desc      roundedHeightForWidth(width=720, ratio=65) returns 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0039 begin`);
      const actual: number = roundedHeightForWidth(720, 65);
      logInfo(`roundedHeightForWidth(width=720, ratio=65): actual=${actual}`);
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0039 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0040
     * @tc.name      WindowRatio_RoundedHeightForWidth_0040
     * @tc.desc      roundedHeightForWidth(width=1080, ratio=0.25) returns 4320
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0040 begin`);
      const actual: number = roundedHeightForWidth(1080, 0.25);
      logInfo(`roundedHeightForWidth(width=1080, ratio=0...: actual=${actual}`);
      expect(actual).assertEqual(4320);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0040 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0041
     * @tc.name      WindowRatio_RoundedHeightForWidth_0041
     * @tc.desc      roundedHeightForWidth(width=1080, ratio=0.5) returns 2160
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0041 begin`);
      const actual: number = roundedHeightForWidth(1080, 0.5);
      logInfo(`roundedHeightForWidth(width=1080, ratio=0.5): actual=${actual}`);
      expect(actual).assertEqual(2160);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0041 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0042
     * @tc.name      WindowRatio_RoundedHeightForWidth_0042
     * @tc.desc      roundedHeightForWidth(width=1080, ratio=1) returns 1080
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0042 begin`);
      const actual: number = roundedHeightForWidth(1080, 1);
      logInfo(`roundedHeightForWidth(width=1080, ratio=1): actual=${actual}`);
      expect(actual).assertEqual(1080);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0042 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0043
     * @tc.name      WindowRatio_RoundedHeightForWidth_0043
     * @tc.desc      roundedHeightForWidth(width=1080, ratio=2) returns 540
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0043 begin`);
      const actual: number = roundedHeightForWidth(1080, 2);
      logInfo(`roundedHeightForWidth(width=1080, ratio=2): actual=${actual}`);
      expect(actual).assertEqual(540);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0043 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0044
     * @tc.name      WindowRatio_RoundedHeightForWidth_0044
     * @tc.desc      roundedHeightForWidth(width=1080, ratio=10) returns 108
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0044 begin`);
      const actual: number = roundedHeightForWidth(1080, 10);
      logInfo(`roundedHeightForWidth(width=1080, ratio=10): actual=${actual}`);
      expect(actual).assertEqual(108);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0044 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0045
     * @tc.name      WindowRatio_RoundedHeightForWidth_0045
     * @tc.desc      roundedHeightForWidth(width=1080, ratio=5) returns 216
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0045 begin`);
      const actual: number = roundedHeightForWidth(1080, 5);
      logInfo(`roundedHeightForWidth(width=1080, ratio=5): actual=${actual}`);
      expect(actual).assertEqual(216);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0045 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0046
     * @tc.name      WindowRatio_RoundedHeightForWidth_0046
     * @tc.desc      roundedHeightForWidth(width=1080, ratio=20) returns 54
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0046 begin`);
      const actual: number = roundedHeightForWidth(1080, 20);
      logInfo(`roundedHeightForWidth(width=1080, ratio=20): actual=${actual}`);
      expect(actual).assertEqual(54);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0046 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0047
     * @tc.name      WindowRatio_RoundedHeightForWidth_0047
     * @tc.desc      roundedHeightForWidth(width=1080, ratio=25) returns 43
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0047 begin`);
      const actual: number = roundedHeightForWidth(1080, 25);
      logInfo(`roundedHeightForWidth(width=1080, ratio=25): actual=${actual}`);
      expect(actual).assertEqual(43);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0047 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0048
     * @tc.name      WindowRatio_RoundedHeightForWidth_0048
     * @tc.desc      roundedHeightForWidth(width=1080, ratio=35) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0048 begin`);
      const actual: number = roundedHeightForWidth(1080, 35);
      logInfo(`roundedHeightForWidth(width=1080, ratio=35): actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0048 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0049
     * @tc.name      WindowRatio_RoundedHeightForWidth_0049
     * @tc.desc      roundedHeightForWidth(width=1080, ratio=40) returns 27
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0049 begin`);
      const actual: number = roundedHeightForWidth(1080, 40);
      logInfo(`roundedHeightForWidth(width=1080, ratio=40): actual=${actual}`);
      expect(actual).assertEqual(27);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0049 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0050
     * @tc.name      WindowRatio_RoundedHeightForWidth_0050
     * @tc.desc      roundedHeightForWidth(width=1080, ratio=50) returns 22
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0050 begin`);
      const actual: number = roundedHeightForWidth(1080, 50);
      logInfo(`roundedHeightForWidth(width=1080, ratio=50): actual=${actual}`);
      expect(actual).assertEqual(22);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0050 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0051
     * @tc.name      WindowRatio_RoundedHeightForWidth_0051
     * @tc.desc      roundedHeightForWidth(width=1080, ratio=65) returns 17
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0051 begin`);
      const actual: number = roundedHeightForWidth(1080, 65);
      logInfo(`roundedHeightForWidth(width=1080, ratio=65): actual=${actual}`);
      expect(actual).assertEqual(17);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0051 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0052
     * @tc.name      WindowRatio_RoundedHeightForWidth_0052
     * @tc.desc      roundedHeightForWidth(width=1080, ratio=70) returns 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0052 begin`);
      const actual: number = roundedHeightForWidth(1080, 70);
      logInfo(`roundedHeightForWidth(width=1080, ratio=70): actual=${actual}`);
      expect(actual).assertEqual(15);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0052 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0053
     * @tc.name      WindowRatio_RoundedHeightForWidth_0053
     * @tc.desc      roundedHeightForWidth(width=1920, ratio=0.25) returns 7680
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0053 begin`);
      const actual: number = roundedHeightForWidth(1920, 0.25);
      logInfo(`roundedHeightForWidth(width=1920, ratio=0...: actual=${actual}`);
      expect(actual).assertEqual(7680);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0053 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0054
     * @tc.name      WindowRatio_RoundedHeightForWidth_0054
     * @tc.desc      roundedHeightForWidth(width=1920, ratio=0.5) returns 3840
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0054 begin`);
      const actual: number = roundedHeightForWidth(1920, 0.5);
      logInfo(`roundedHeightForWidth(width=1920, ratio=0.5): actual=${actual}`);
      expect(actual).assertEqual(3840);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0054 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0055
     * @tc.name      WindowRatio_RoundedHeightForWidth_0055
     * @tc.desc      roundedHeightForWidth(width=1920, ratio=1) returns 1920
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0055 begin`);
      const actual: number = roundedHeightForWidth(1920, 1);
      logInfo(`roundedHeightForWidth(width=1920, ratio=1): actual=${actual}`);
      expect(actual).assertEqual(1920);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0055 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0056
     * @tc.name      WindowRatio_RoundedHeightForWidth_0056
     * @tc.desc      roundedHeightForWidth(width=1920, ratio=1.5) returns 1280
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0056 begin`);
      const actual: number = roundedHeightForWidth(1920, 1.5);
      logInfo(`roundedHeightForWidth(width=1920, ratio=1.5): actual=${actual}`);
      expect(actual).assertEqual(1280);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0056 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0057
     * @tc.name      WindowRatio_RoundedHeightForWidth_0057
     * @tc.desc      roundedHeightForWidth(width=1920, ratio=2) returns 960
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0057 begin`);
      const actual: number = roundedHeightForWidth(1920, 2);
      logInfo(`roundedHeightForWidth(width=1920, ratio=2): actual=${actual}`);
      expect(actual).assertEqual(960);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0057 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0058
     * @tc.name      WindowRatio_RoundedHeightForWidth_0058
     * @tc.desc      roundedHeightForWidth(width=1920, ratio=3) returns 640
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0058 begin`);
      const actual: number = roundedHeightForWidth(1920, 3);
      logInfo(`roundedHeightForWidth(width=1920, ratio=3): actual=${actual}`);
      expect(actual).assertEqual(640);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0058 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0059
     * @tc.name      WindowRatio_RoundedHeightForWidth_0059
     * @tc.desc      roundedHeightForWidth(width=1920, ratio=10) returns 192
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0059 begin`);
      const actual: number = roundedHeightForWidth(1920, 10);
      logInfo(`roundedHeightForWidth(width=1920, ratio=10): actual=${actual}`);
      expect(actual).assertEqual(192);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0059 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0060
     * @tc.name      WindowRatio_RoundedHeightForWidth_0060
     * @tc.desc      roundedHeightForWidth(width=1920, ratio=100) returns 19
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0060 begin`);
      const actual: number = roundedHeightForWidth(1920, 100);
      logInfo(`roundedHeightForWidth(width=1920, ratio=100): actual=${actual}`);
      expect(actual).assertEqual(19);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0060 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0061
     * @tc.name      WindowRatio_RoundedHeightForWidth_0061
     * @tc.desc      roundedHeightForWidth(width=1920, ratio=5) returns 384
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0061 begin`);
      const actual: number = roundedHeightForWidth(1920, 5);
      logInfo(`roundedHeightForWidth(width=1920, ratio=5): actual=${actual}`);
      expect(actual).assertEqual(384);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0061 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0062
     * @tc.name      WindowRatio_RoundedHeightForWidth_0062
     * @tc.desc      roundedHeightForWidth(width=1920, ratio=15) returns 128
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0062 begin`);
      const actual: number = roundedHeightForWidth(1920, 15);
      logInfo(`roundedHeightForWidth(width=1920, ratio=15): actual=${actual}`);
      expect(actual).assertEqual(128);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0062 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0063
     * @tc.name      WindowRatio_RoundedHeightForWidth_0063
     * @tc.desc      roundedHeightForWidth(width=1920, ratio=20) returns 96
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0063 begin`);
      const actual: number = roundedHeightForWidth(1920, 20);
      logInfo(`roundedHeightForWidth(width=1920, ratio=20): actual=${actual}`);
      expect(actual).assertEqual(96);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0063 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0064
     * @tc.name      WindowRatio_RoundedHeightForWidth_0064
     * @tc.desc      roundedHeightForWidth(width=1920, ratio=25) returns 77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0064 begin`);
      const actual: number = roundedHeightForWidth(1920, 25);
      logInfo(`roundedHeightForWidth(width=1920, ratio=25): actual=${actual}`);
      expect(actual).assertEqual(77);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0064 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0065
     * @tc.name      WindowRatio_RoundedHeightForWidth_0065
     * @tc.desc      roundedHeightForWidth(width=1920, ratio=30) returns 64
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0065 begin`);
      const actual: number = roundedHeightForWidth(1920, 30);
      logInfo(`roundedHeightForWidth(width=1920, ratio=30): actual=${actual}`);
      expect(actual).assertEqual(64);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0065 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0066
     * @tc.name      WindowRatio_RoundedHeightForWidth_0066
     * @tc.desc      roundedHeightForWidth(width=1920, ratio=35) returns 55
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0066 begin`);
      const actual: number = roundedHeightForWidth(1920, 35);
      logInfo(`roundedHeightForWidth(width=1920, ratio=35): actual=${actual}`);
      expect(actual).assertEqual(55);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0066 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0067
     * @tc.name      WindowRatio_RoundedHeightForWidth_0067
     * @tc.desc      roundedHeightForWidth(width=1920, ratio=50) returns 38
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0067 begin`);
      const actual: number = roundedHeightForWidth(1920, 50);
      logInfo(`roundedHeightForWidth(width=1920, ratio=50): actual=${actual}`);
      expect(actual).assertEqual(38);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0067 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0068
     * @tc.name      WindowRatio_RoundedHeightForWidth_0068
     * @tc.desc      roundedHeightForWidth(width=1920, ratio=55) returns 35
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0068 begin`);
      const actual: number = roundedHeightForWidth(1920, 55);
      logInfo(`roundedHeightForWidth(width=1920, ratio=55): actual=${actual}`);
      expect(actual).assertEqual(35);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0068 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0069
     * @tc.name      WindowRatio_RoundedHeightForWidth_0069
     * @tc.desc      roundedHeightForWidth(width=1920, ratio=60) returns 32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0069 begin`);
      const actual: number = roundedHeightForWidth(1920, 60);
      logInfo(`roundedHeightForWidth(width=1920, ratio=60): actual=${actual}`);
      expect(actual).assertEqual(32);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0069 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0070
     * @tc.name      WindowRatio_RoundedHeightForWidth_0070
     * @tc.desc      roundedHeightForWidth(width=1920, ratio=65) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0070 begin`);
      const actual: number = roundedHeightForWidth(1920, 65);
      logInfo(`roundedHeightForWidth(width=1920, ratio=65): actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0070 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0071
     * @tc.name      WindowRatio_RoundedHeightForWidth_0071
     * @tc.desc      roundedHeightForWidth(width=1920, ratio=75) returns 26
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0071 begin`);
      const actual: number = roundedHeightForWidth(1920, 75);
      logInfo(`roundedHeightForWidth(width=1920, ratio=75): actual=${actual}`);
      expect(actual).assertEqual(26);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0071 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0072
     * @tc.name      WindowRatio_RoundedHeightForWidth_0072
     * @tc.desc      roundedHeightForWidth(width=1920, ratio=85) returns 23
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0072 begin`);
      const actual: number = roundedHeightForWidth(1920, 85);
      logInfo(`roundedHeightForWidth(width=1920, ratio=85): actual=${actual}`);
      expect(actual).assertEqual(23);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0072 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0073
     * @tc.name      WindowRatio_RoundedHeightForWidth_0073
     * @tc.desc      roundedHeightForWidth(width=1920, ratio=77.45) returns 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0073 begin`);
      const actual: number = roundedHeightForWidth(1920, 77.45);
      logInfo(`roundedHeightForWidth(width=1920, ratio=7...: actual=${actual}`);
      expect(actual).assertEqual(25);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0073 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0074
     * @tc.name      WindowRatio_RoundedHeightForWidth_0074
     * @tc.desc      roundedHeightForWidth(width=-1, ratio=0.25) returns -4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RoundedHeightForWidth_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0074 begin`);
      const actual: number = roundedHeightForWidth(-1, 0.25);
      logInfo(`roundedHeightForWidth(width=-1, ratio=0.25): actual=${actual}`);
      expect(actual).assertEqual(-4);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0074 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0075
     * @tc.name      WindowRatio_RoundedHeightForWidth_0075
     * @tc.desc      roundedHeightForWidth(width=-1, ratio=0.5) returns -2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RoundedHeightForWidth_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0075 begin`);
      const actual: number = roundedHeightForWidth(-1, 0.5);
      logInfo(`roundedHeightForWidth(width=-1, ratio=0.5): actual=${actual}`);
      expect(actual).assertEqual(-2);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0075 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0076
     * @tc.name      WindowRatio_RoundedHeightForWidth_0076
     * @tc.desc      roundedHeightForWidth(width=-1, ratio=1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_RoundedHeightForWidth_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0076 begin`);
      const actual: number = roundedHeightForWidth(-1, 1);
      logInfo(`roundedHeightForWidth(width=-1, ratio=1): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0076 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0077
     * @tc.name      WindowRatio_RoundedHeightForWidth_0077
     * @tc.desc      roundedHeightForWidth(width=10, ratio=0.25) returns 40
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0077 begin`);
      const actual: number = roundedHeightForWidth(10, 0.25);
      logInfo(`roundedHeightForWidth(width=10, ratio=0.25): actual=${actual}`);
      expect(actual).assertEqual(40);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0077 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0078
     * @tc.name      WindowRatio_RoundedHeightForWidth_0078
     * @tc.desc      roundedHeightForWidth(width=192, ratio=0.25) returns 768
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0078 begin`);
      const actual: number = roundedHeightForWidth(192, 0.25);
      logInfo(`roundedHeightForWidth(width=192, ratio=0.25): actual=${actual}`);
      expect(actual).assertEqual(768);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0078 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0079
     * @tc.name      WindowRatio_RoundedHeightForWidth_0079
     * @tc.desc      roundedHeightForWidth(width=288, ratio=0.25) returns 1152
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0079 begin`);
      const actual: number = roundedHeightForWidth(288, 0.25);
      logInfo(`roundedHeightForWidth(width=288, ratio=0.25): actual=${actual}`);
      expect(actual).assertEqual(1152);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0079 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0080
     * @tc.name      WindowRatio_RoundedHeightForWidth_0080
     * @tc.desc      roundedHeightForWidth(width=288, ratio=0.5) returns 576
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0080 begin`);
      const actual: number = roundedHeightForWidth(288, 0.5);
      logInfo(`roundedHeightForWidth(width=288, ratio=0.5): actual=${actual}`);
      expect(actual).assertEqual(576);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0080 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0081
     * @tc.name      WindowRatio_RoundedHeightForWidth_0081
     * @tc.desc      roundedHeightForWidth(width=288, ratio=1) returns 288
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0081 begin`);
      const actual: number = roundedHeightForWidth(288, 1);
      logInfo(`roundedHeightForWidth(width=288, ratio=1): actual=${actual}`);
      expect(actual).assertEqual(288);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0081 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0082
     * @tc.name      WindowRatio_RoundedHeightForWidth_0082
     * @tc.desc      roundedHeightForWidth(width=288, ratio=5) returns 58
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0082 begin`);
      const actual: number = roundedHeightForWidth(288, 5);
      logInfo(`roundedHeightForWidth(width=288, ratio=5): actual=${actual}`);
      expect(actual).assertEqual(58);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0082 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0083
     * @tc.name      WindowRatio_RoundedHeightForWidth_0083
     * @tc.desc      roundedHeightForWidth(width=384, ratio=0.25) returns 1536
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0083 begin`);
      const actual: number = roundedHeightForWidth(384, 0.25);
      logInfo(`roundedHeightForWidth(width=384, ratio=0.25): actual=${actual}`);
      expect(actual).assertEqual(1536);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0083 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0084
     * @tc.name      WindowRatio_RoundedHeightForWidth_0084
     * @tc.desc      roundedHeightForWidth(width=384, ratio=1.5) returns 256
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0084 begin`);
      const actual: number = roundedHeightForWidth(384, 1.5);
      logInfo(`roundedHeightForWidth(width=384, ratio=1.5): actual=${actual}`);
      expect(actual).assertEqual(256);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0084 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0085
     * @tc.name      WindowRatio_RoundedHeightForWidth_0085
     * @tc.desc      roundedHeightForWidth(width=480, ratio=1.5) returns 320
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0085 begin`);
      const actual: number = roundedHeightForWidth(480, 1.5);
      logInfo(`roundedHeightForWidth(width=480, ratio=1.5): actual=${actual}`);
      expect(actual).assertEqual(320);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0085 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0086
     * @tc.name      WindowRatio_RoundedHeightForWidth_0086
     * @tc.desc      roundedHeightForWidth(width=480, ratio=3) returns 160
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0086 begin`);
      const actual: number = roundedHeightForWidth(480, 3);
      logInfo(`roundedHeightForWidth(width=480, ratio=3): actual=${actual}`);
      expect(actual).assertEqual(160);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0086 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0087
     * @tc.name      WindowRatio_RoundedHeightForWidth_0087
     * @tc.desc      roundedHeightForWidth(width=576, ratio=0.25) returns 2304
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0087 begin`);
      const actual: number = roundedHeightForWidth(576, 0.25);
      logInfo(`roundedHeightForWidth(width=576, ratio=0.25): actual=${actual}`);
      expect(actual).assertEqual(2304);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0087 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0088
     * @tc.name      WindowRatio_RoundedHeightForWidth_0088
     * @tc.desc      roundedHeightForWidth(width=576, ratio=5) returns 115
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0088 begin`);
      const actual: number = roundedHeightForWidth(576, 5);
      logInfo(`roundedHeightForWidth(width=576, ratio=5): actual=${actual}`);
      expect(actual).assertEqual(115);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0088 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0089
     * @tc.name      WindowRatio_RoundedHeightForWidth_0089
     * @tc.desc      roundedHeightForWidth(width=672, ratio=0.25) returns 2688
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0089 begin`);
      const actual: number = roundedHeightForWidth(672, 0.25);
      logInfo(`roundedHeightForWidth(width=672, ratio=0.25): actual=${actual}`);
      expect(actual).assertEqual(2688);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0089 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0090
     * @tc.name      WindowRatio_RoundedHeightForWidth_0090
     * @tc.desc      roundedHeightForWidth(width=672, ratio=0.5) returns 1344
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0090 begin`);
      const actual: number = roundedHeightForWidth(672, 0.5);
      logInfo(`roundedHeightForWidth(width=672, ratio=0.5): actual=${actual}`);
      expect(actual).assertEqual(1344);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0090 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0091
     * @tc.name      WindowRatio_RoundedHeightForWidth_0091
     * @tc.desc      roundedHeightForWidth(width=672, ratio=1) returns 672
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0091 begin`);
      const actual: number = roundedHeightForWidth(672, 1);
      logInfo(`roundedHeightForWidth(width=672, ratio=1): actual=${actual}`);
      expect(actual).assertEqual(672);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0091 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0092
     * @tc.name      WindowRatio_RoundedHeightForWidth_0092
     * @tc.desc      roundedHeightForWidth(width=672, ratio=1.5) returns 448
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0092 begin`);
      const actual: number = roundedHeightForWidth(672, 1.5);
      logInfo(`roundedHeightForWidth(width=672, ratio=1.5): actual=${actual}`);
      expect(actual).assertEqual(448);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0092 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0093
     * @tc.name      WindowRatio_RoundedHeightForWidth_0093
     * @tc.desc      roundedHeightForWidth(width=672, ratio=2) returns 336
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0093 begin`);
      const actual: number = roundedHeightForWidth(672, 2);
      logInfo(`roundedHeightForWidth(width=672, ratio=2): actual=${actual}`);
      expect(actual).assertEqual(336);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0093 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0094
     * @tc.name      WindowRatio_RoundedHeightForWidth_0094
     * @tc.desc      roundedHeightForWidth(width=672, ratio=3) returns 224
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0094 begin`);
      const actual: number = roundedHeightForWidth(672, 3);
      logInfo(`roundedHeightForWidth(width=672, ratio=3): actual=${actual}`);
      expect(actual).assertEqual(224);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0094 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0095
     * @tc.name      WindowRatio_RoundedHeightForWidth_0095
     * @tc.desc      roundedHeightForWidth(width=672, ratio=5) returns 134
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0095 begin`);
      const actual: number = roundedHeightForWidth(672, 5);
      logInfo(`roundedHeightForWidth(width=672, ratio=5): actual=${actual}`);
      expect(actual).assertEqual(134);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0095 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_ROUNDED_HEIGHT_FOR_WIDTH_0096
     * @tc.name      WindowRatio_RoundedHeightForWidth_0096
     * @tc.desc      roundedHeightForWidth(width=672, ratio=15) returns 45
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_RoundedHeightForWidth_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundedHeightForWidth_0096 begin`);
      const actual: number = roundedHeightForWidth(672, 15);
      logInfo(`roundedHeightForWidth(width=672, ratio=15): actual=${actual}`);
      expect(actual).assertEqual(45);
      logInfo(`${BUNDLE}RoundedHeightForWidth_0096 end`);
    });
  });
}
