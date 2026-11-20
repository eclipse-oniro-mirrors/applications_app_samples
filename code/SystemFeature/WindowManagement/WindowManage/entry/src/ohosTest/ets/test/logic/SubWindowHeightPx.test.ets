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
import { subWindowHeightPx } from '../model/WindowMoveLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_WindowManage]';
const BUNDLE: string = 'WindowManage_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for subWindowHeightPx (96 cases). */
export default function subWindowHeightPxTest(): void {
  describe('SubWindowHeightPxTest', (): void => {
    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0001
     * @tc.name      WindowManage_SubWindowHeightPx_0001
     * @tc.desc      subWindowHeightPx(density=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('WindowManage_SubWindowHeightPx_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0001 begin`);
      const actual: number = subWindowHeightPx(0);
      logInfo(`subWindowHeightPx(density=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowHeightPx_0001 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0002
     * @tc.name      WindowManage_SubWindowHeightPx_0002
     * @tc.desc      subWindowHeightPx(density=1) returns 240
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('WindowManage_SubWindowHeightPx_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0002 begin`);
      const actual: number = subWindowHeightPx(1);
      logInfo(`subWindowHeightPx(density=1): actual=${actual}`);
      expect(actual).assertEqual(240);
      logInfo(`${BUNDLE}SubWindowHeightPx_0002 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0003
     * @tc.name      WindowManage_SubWindowHeightPx_0003
     * @tc.desc      subWindowHeightPx(density=-1) returns -240
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowHeightPx_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0003 begin`);
      const actual: number = subWindowHeightPx(-1);
      logInfo(`subWindowHeightPx(density=-1): actual=${actual}`);
      expect(actual).assertEqual(-240);
      logInfo(`${BUNDLE}SubWindowHeightPx_0003 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0004
     * @tc.name      WindowManage_SubWindowHeightPx_0004
     * @tc.desc      subWindowHeightPx(density=2) returns 480
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0004 begin`);
      const actual: number = subWindowHeightPx(2);
      logInfo(`subWindowHeightPx(density=2): actual=${actual}`);
      expect(actual).assertEqual(480);
      logInfo(`${BUNDLE}SubWindowHeightPx_0004 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0005
     * @tc.name      WindowManage_SubWindowHeightPx_0005
     * @tc.desc      subWindowHeightPx(density=3) returns 720
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0005 begin`);
      const actual: number = subWindowHeightPx(3);
      logInfo(`subWindowHeightPx(density=3): actual=${actual}`);
      expect(actual).assertEqual(720);
      logInfo(`${BUNDLE}SubWindowHeightPx_0005 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0006
     * @tc.name      WindowManage_SubWindowHeightPx_0006
     * @tc.desc      subWindowHeightPx(density=10) returns 2400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0006 begin`);
      const actual: number = subWindowHeightPx(10);
      logInfo(`subWindowHeightPx(density=10): actual=${actual}`);
      expect(actual).assertEqual(2400);
      logInfo(`${BUNDLE}SubWindowHeightPx_0006 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0007
     * @tc.name      WindowManage_SubWindowHeightPx_0007
     * @tc.desc      subWindowHeightPx(density=100) returns 24000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0007 begin`);
      const actual: number = subWindowHeightPx(100);
      logInfo(`subWindowHeightPx(density=100): actual=${actual}`);
      expect(actual).assertEqual(24000);
      logInfo(`${BUNDLE}SubWindowHeightPx_0007 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0008
     * @tc.name      WindowManage_SubWindowHeightPx_0008
     * @tc.desc      subWindowHeightPx(density=5) returns 1200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0008 begin`);
      const actual: number = subWindowHeightPx(5);
      logInfo(`subWindowHeightPx(density=5): actual=${actual}`);
      expect(actual).assertEqual(1200);
      logInfo(`${BUNDLE}SubWindowHeightPx_0008 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0009
     * @tc.name      WindowManage_SubWindowHeightPx_0009
     * @tc.desc      subWindowHeightPx(density=15) returns 3600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0009 begin`);
      const actual: number = subWindowHeightPx(15);
      logInfo(`subWindowHeightPx(density=15): actual=${actual}`);
      expect(actual).assertEqual(3600);
      logInfo(`${BUNDLE}SubWindowHeightPx_0009 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0010
     * @tc.name      WindowManage_SubWindowHeightPx_0010
     * @tc.desc      subWindowHeightPx(density=20) returns 4800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0010 begin`);
      const actual: number = subWindowHeightPx(20);
      logInfo(`subWindowHeightPx(density=20): actual=${actual}`);
      expect(actual).assertEqual(4800);
      logInfo(`${BUNDLE}SubWindowHeightPx_0010 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0011
     * @tc.name      WindowManage_SubWindowHeightPx_0011
     * @tc.desc      subWindowHeightPx(density=25) returns 6000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0011 begin`);
      const actual: number = subWindowHeightPx(25);
      logInfo(`subWindowHeightPx(density=25): actual=${actual}`);
      expect(actual).assertEqual(6000);
      logInfo(`${BUNDLE}SubWindowHeightPx_0011 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0012
     * @tc.name      WindowManage_SubWindowHeightPx_0012
     * @tc.desc      subWindowHeightPx(density=30) returns 7200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0012 begin`);
      const actual: number = subWindowHeightPx(30);
      logInfo(`subWindowHeightPx(density=30): actual=${actual}`);
      expect(actual).assertEqual(7200);
      logInfo(`${BUNDLE}SubWindowHeightPx_0012 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0013
     * @tc.name      WindowManage_SubWindowHeightPx_0013
     * @tc.desc      subWindowHeightPx(density=35) returns 8400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0013 begin`);
      const actual: number = subWindowHeightPx(35);
      logInfo(`subWindowHeightPx(density=35): actual=${actual}`);
      expect(actual).assertEqual(8400);
      logInfo(`${BUNDLE}SubWindowHeightPx_0013 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0014
     * @tc.name      WindowManage_SubWindowHeightPx_0014
     * @tc.desc      subWindowHeightPx(density=40) returns 9600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0014 begin`);
      const actual: number = subWindowHeightPx(40);
      logInfo(`subWindowHeightPx(density=40): actual=${actual}`);
      expect(actual).assertEqual(9600);
      logInfo(`${BUNDLE}SubWindowHeightPx_0014 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0015
     * @tc.name      WindowManage_SubWindowHeightPx_0015
     * @tc.desc      subWindowHeightPx(density=45) returns 10800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0015 begin`);
      const actual: number = subWindowHeightPx(45);
      logInfo(`subWindowHeightPx(density=45): actual=${actual}`);
      expect(actual).assertEqual(10800);
      logInfo(`${BUNDLE}SubWindowHeightPx_0015 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0016
     * @tc.name      WindowManage_SubWindowHeightPx_0016
     * @tc.desc      subWindowHeightPx(density=50) returns 12000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0016 begin`);
      const actual: number = subWindowHeightPx(50);
      logInfo(`subWindowHeightPx(density=50): actual=${actual}`);
      expect(actual).assertEqual(12000);
      logInfo(`${BUNDLE}SubWindowHeightPx_0016 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0017
     * @tc.name      WindowManage_SubWindowHeightPx_0017
     * @tc.desc      subWindowHeightPx(density=55) returns 13200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0017 begin`);
      const actual: number = subWindowHeightPx(55);
      logInfo(`subWindowHeightPx(density=55): actual=${actual}`);
      expect(actual).assertEqual(13200);
      logInfo(`${BUNDLE}SubWindowHeightPx_0017 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0018
     * @tc.name      WindowManage_SubWindowHeightPx_0018
     * @tc.desc      subWindowHeightPx(density=60) returns 14400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0018 begin`);
      const actual: number = subWindowHeightPx(60);
      logInfo(`subWindowHeightPx(density=60): actual=${actual}`);
      expect(actual).assertEqual(14400);
      logInfo(`${BUNDLE}SubWindowHeightPx_0018 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0019
     * @tc.name      WindowManage_SubWindowHeightPx_0019
     * @tc.desc      subWindowHeightPx(density=65) returns 15600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0019 begin`);
      const actual: number = subWindowHeightPx(65);
      logInfo(`subWindowHeightPx(density=65): actual=${actual}`);
      expect(actual).assertEqual(15600);
      logInfo(`${BUNDLE}SubWindowHeightPx_0019 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0020
     * @tc.name      WindowManage_SubWindowHeightPx_0020
     * @tc.desc      subWindowHeightPx(density=70) returns 16800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0020 begin`);
      const actual: number = subWindowHeightPx(70);
      logInfo(`subWindowHeightPx(density=70): actual=${actual}`);
      expect(actual).assertEqual(16800);
      logInfo(`${BUNDLE}SubWindowHeightPx_0020 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0021
     * @tc.name      WindowManage_SubWindowHeightPx_0021
     * @tc.desc      subWindowHeightPx(density=75) returns 18000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0021 begin`);
      const actual: number = subWindowHeightPx(75);
      logInfo(`subWindowHeightPx(density=75): actual=${actual}`);
      expect(actual).assertEqual(18000);
      logInfo(`${BUNDLE}SubWindowHeightPx_0021 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0022
     * @tc.name      WindowManage_SubWindowHeightPx_0022
     * @tc.desc      subWindowHeightPx(density=80) returns 19200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0022 begin`);
      const actual: number = subWindowHeightPx(80);
      logInfo(`subWindowHeightPx(density=80): actual=${actual}`);
      expect(actual).assertEqual(19200);
      logInfo(`${BUNDLE}SubWindowHeightPx_0022 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0023
     * @tc.name      WindowManage_SubWindowHeightPx_0023
     * @tc.desc      subWindowHeightPx(density=85) returns 20400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0023 begin`);
      const actual: number = subWindowHeightPx(85);
      logInfo(`subWindowHeightPx(density=85): actual=${actual}`);
      expect(actual).assertEqual(20400);
      logInfo(`${BUNDLE}SubWindowHeightPx_0023 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0024
     * @tc.name      WindowManage_SubWindowHeightPx_0024
     * @tc.desc      subWindowHeightPx(density=90) returns 21600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0024 begin`);
      const actual: number = subWindowHeightPx(90);
      logInfo(`subWindowHeightPx(density=90): actual=${actual}`);
      expect(actual).assertEqual(21600);
      logInfo(`${BUNDLE}SubWindowHeightPx_0024 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0025
     * @tc.name      WindowManage_SubWindowHeightPx_0025
     * @tc.desc      subWindowHeightPx(density=95) returns 22800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0025 begin`);
      const actual: number = subWindowHeightPx(95);
      logInfo(`subWindowHeightPx(density=95): actual=${actual}`);
      expect(actual).assertEqual(22800);
      logInfo(`${BUNDLE}SubWindowHeightPx_0025 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0026
     * @tc.name      WindowManage_SubWindowHeightPx_0026
     * @tc.desc      subWindowHeightPx(density=105) returns 25200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0026 begin`);
      const actual: number = subWindowHeightPx(105);
      logInfo(`subWindowHeightPx(density=105): actual=${actual}`);
      expect(actual).assertEqual(25200);
      logInfo(`${BUNDLE}SubWindowHeightPx_0026 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0027
     * @tc.name      WindowManage_SubWindowHeightPx_0027
     * @tc.desc      subWindowHeightPx(density=110) returns 26400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0027 begin`);
      const actual: number = subWindowHeightPx(110);
      logInfo(`subWindowHeightPx(density=110): actual=${actual}`);
      expect(actual).assertEqual(26400);
      logInfo(`${BUNDLE}SubWindowHeightPx_0027 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0028
     * @tc.name      WindowManage_SubWindowHeightPx_0028
     * @tc.desc      subWindowHeightPx(density=115) returns 27600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0028 begin`);
      const actual: number = subWindowHeightPx(115);
      logInfo(`subWindowHeightPx(density=115): actual=${actual}`);
      expect(actual).assertEqual(27600);
      logInfo(`${BUNDLE}SubWindowHeightPx_0028 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0029
     * @tc.name      WindowManage_SubWindowHeightPx_0029
     * @tc.desc      subWindowHeightPx(density=120) returns 28800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0029 begin`);
      const actual: number = subWindowHeightPx(120);
      logInfo(`subWindowHeightPx(density=120): actual=${actual}`);
      expect(actual).assertEqual(28800);
      logInfo(`${BUNDLE}SubWindowHeightPx_0029 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0030
     * @tc.name      WindowManage_SubWindowHeightPx_0030
     * @tc.desc      subWindowHeightPx(density=125) returns 30000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0030 begin`);
      const actual: number = subWindowHeightPx(125);
      logInfo(`subWindowHeightPx(density=125): actual=${actual}`);
      expect(actual).assertEqual(30000);
      logInfo(`${BUNDLE}SubWindowHeightPx_0030 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0031
     * @tc.name      WindowManage_SubWindowHeightPx_0031
     * @tc.desc      subWindowHeightPx(density=130) returns 31200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0031 begin`);
      const actual: number = subWindowHeightPx(130);
      logInfo(`subWindowHeightPx(density=130): actual=${actual}`);
      expect(actual).assertEqual(31200);
      logInfo(`${BUNDLE}SubWindowHeightPx_0031 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0032
     * @tc.name      WindowManage_SubWindowHeightPx_0032
     * @tc.desc      subWindowHeightPx(density=135) returns 32400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0032 begin`);
      const actual: number = subWindowHeightPx(135);
      logInfo(`subWindowHeightPx(density=135): actual=${actual}`);
      expect(actual).assertEqual(32400);
      logInfo(`${BUNDLE}SubWindowHeightPx_0032 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0033
     * @tc.name      WindowManage_SubWindowHeightPx_0033
     * @tc.desc      subWindowHeightPx(density=140) returns 33600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0033 begin`);
      const actual: number = subWindowHeightPx(140);
      logInfo(`subWindowHeightPx(density=140): actual=${actual}`);
      expect(actual).assertEqual(33600);
      logInfo(`${BUNDLE}SubWindowHeightPx_0033 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0034
     * @tc.name      WindowManage_SubWindowHeightPx_0034
     * @tc.desc      subWindowHeightPx(density=145) returns 34800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0034 begin`);
      const actual: number = subWindowHeightPx(145);
      logInfo(`subWindowHeightPx(density=145): actual=${actual}`);
      expect(actual).assertEqual(34800);
      logInfo(`${BUNDLE}SubWindowHeightPx_0034 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0035
     * @tc.name      WindowManage_SubWindowHeightPx_0035
     * @tc.desc      subWindowHeightPx(density=150) returns 36000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0035 begin`);
      const actual: number = subWindowHeightPx(150);
      logInfo(`subWindowHeightPx(density=150): actual=${actual}`);
      expect(actual).assertEqual(36000);
      logInfo(`${BUNDLE}SubWindowHeightPx_0035 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0036
     * @tc.name      WindowManage_SubWindowHeightPx_0036
     * @tc.desc      subWindowHeightPx(density=155) returns 37200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0036 begin`);
      const actual: number = subWindowHeightPx(155);
      logInfo(`subWindowHeightPx(density=155): actual=${actual}`);
      expect(actual).assertEqual(37200);
      logInfo(`${BUNDLE}SubWindowHeightPx_0036 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0037
     * @tc.name      WindowManage_SubWindowHeightPx_0037
     * @tc.desc      subWindowHeightPx(density=160) returns 38400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0037 begin`);
      const actual: number = subWindowHeightPx(160);
      logInfo(`subWindowHeightPx(density=160): actual=${actual}`);
      expect(actual).assertEqual(38400);
      logInfo(`${BUNDLE}SubWindowHeightPx_0037 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0038
     * @tc.name      WindowManage_SubWindowHeightPx_0038
     * @tc.desc      subWindowHeightPx(density=165) returns 39600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0038 begin`);
      const actual: number = subWindowHeightPx(165);
      logInfo(`subWindowHeightPx(density=165): actual=${actual}`);
      expect(actual).assertEqual(39600);
      logInfo(`${BUNDLE}SubWindowHeightPx_0038 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0039
     * @tc.name      WindowManage_SubWindowHeightPx_0039
     * @tc.desc      subWindowHeightPx(density=170) returns 40800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0039 begin`);
      const actual: number = subWindowHeightPx(170);
      logInfo(`subWindowHeightPx(density=170): actual=${actual}`);
      expect(actual).assertEqual(40800);
      logInfo(`${BUNDLE}SubWindowHeightPx_0039 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0040
     * @tc.name      WindowManage_SubWindowHeightPx_0040
     * @tc.desc      subWindowHeightPx(density=175) returns 42000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0040 begin`);
      const actual: number = subWindowHeightPx(175);
      logInfo(`subWindowHeightPx(density=175): actual=${actual}`);
      expect(actual).assertEqual(42000);
      logInfo(`${BUNDLE}SubWindowHeightPx_0040 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0041
     * @tc.name      WindowManage_SubWindowHeightPx_0041
     * @tc.desc      subWindowHeightPx(density=180) returns 43200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0041 begin`);
      const actual: number = subWindowHeightPx(180);
      logInfo(`subWindowHeightPx(density=180): actual=${actual}`);
      expect(actual).assertEqual(43200);
      logInfo(`${BUNDLE}SubWindowHeightPx_0041 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0042
     * @tc.name      WindowManage_SubWindowHeightPx_0042
     * @tc.desc      subWindowHeightPx(density=185) returns 44400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0042 begin`);
      const actual: number = subWindowHeightPx(185);
      logInfo(`subWindowHeightPx(density=185): actual=${actual}`);
      expect(actual).assertEqual(44400);
      logInfo(`${BUNDLE}SubWindowHeightPx_0042 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0043
     * @tc.name      WindowManage_SubWindowHeightPx_0043
     * @tc.desc      subWindowHeightPx(density=190) returns 45600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0043 begin`);
      const actual: number = subWindowHeightPx(190);
      logInfo(`subWindowHeightPx(density=190): actual=${actual}`);
      expect(actual).assertEqual(45600);
      logInfo(`${BUNDLE}SubWindowHeightPx_0043 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0044
     * @tc.name      WindowManage_SubWindowHeightPx_0044
     * @tc.desc      subWindowHeightPx(density=195) returns 46800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0044 begin`);
      const actual: number = subWindowHeightPx(195);
      logInfo(`subWindowHeightPx(density=195): actual=${actual}`);
      expect(actual).assertEqual(46800);
      logInfo(`${BUNDLE}SubWindowHeightPx_0044 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0045
     * @tc.name      WindowManage_SubWindowHeightPx_0045
     * @tc.desc      subWindowHeightPx(density=200) returns 48000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0045 begin`);
      const actual: number = subWindowHeightPx(200);
      logInfo(`subWindowHeightPx(density=200): actual=${actual}`);
      expect(actual).assertEqual(48000);
      logInfo(`${BUNDLE}SubWindowHeightPx_0045 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0046
     * @tc.name      WindowManage_SubWindowHeightPx_0046
     * @tc.desc      subWindowHeightPx(density=1.99) returns 477.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0046 begin`);
      const actual: number = subWindowHeightPx(1.99);
      logInfo(`subWindowHeightPx(density=1.99): actual=${actual}`);
      expect(actual).assertClose(477.6, PRECISION);
      logInfo(`${BUNDLE}SubWindowHeightPx_0046 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0047
     * @tc.name      WindowManage_SubWindowHeightPx_0047
     * @tc.desc      subWindowHeightPx(density=87) returns 20880
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0047 begin`);
      const actual: number = subWindowHeightPx(87);
      logInfo(`subWindowHeightPx(density=87): actual=${actual}`);
      expect(actual).assertEqual(20880);
      logInfo(`${BUNDLE}SubWindowHeightPx_0047 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0048
     * @tc.name      WindowManage_SubWindowHeightPx_0048
     * @tc.desc      subWindowHeightPx(density=53.93) returns 12943.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0048 begin`);
      const actual: number = subWindowHeightPx(53.93);
      logInfo(`subWindowHeightPx(density=53.93): actual=${actual}`);
      expect(actual).assertClose(12943.2, PRECISION);
      logInfo(`${BUNDLE}SubWindowHeightPx_0048 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0049
     * @tc.name      WindowManage_SubWindowHeightPx_0049
     * @tc.desc      subWindowHeightPx(density=16) returns 3840
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0049 begin`);
      const actual: number = subWindowHeightPx(16);
      logInfo(`subWindowHeightPx(density=16): actual=${actual}`);
      expect(actual).assertEqual(3840);
      logInfo(`${BUNDLE}SubWindowHeightPx_0049 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0050
     * @tc.name      WindowManage_SubWindowHeightPx_0050
     * @tc.desc      subWindowHeightPx(density=8.4) returns 2016
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0050 begin`);
      const actual: number = subWindowHeightPx(8.4);
      logInfo(`subWindowHeightPx(density=8.4): actual=${actual}`);
      expect(actual).assertEqual(2016);
      logInfo(`${BUNDLE}SubWindowHeightPx_0050 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0051
     * @tc.name      WindowManage_SubWindowHeightPx_0051
     * @tc.desc      subWindowHeightPx(density=168) returns 40320
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0051 begin`);
      const actual: number = subWindowHeightPx(168);
      logInfo(`subWindowHeightPx(density=168): actual=${actual}`);
      expect(actual).assertEqual(40320);
      logInfo(`${BUNDLE}SubWindowHeightPx_0051 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0052
     * @tc.name      WindowManage_SubWindowHeightPx_0052
     * @tc.desc      subWindowHeightPx(density=-59) returns -14160
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowHeightPx_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0052 begin`);
      const actual: number = subWindowHeightPx(-59);
      logInfo(`subWindowHeightPx(density=-59): actual=${actual}`);
      expect(actual).assertEqual(-14160);
      logInfo(`${BUNDLE}SubWindowHeightPx_0052 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0053
     * @tc.name      WindowManage_SubWindowHeightPx_0053
     * @tc.desc      subWindowHeightPx(density=42) returns 10080
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0053 begin`);
      const actual: number = subWindowHeightPx(42);
      logInfo(`subWindowHeightPx(density=42): actual=${actual}`);
      expect(actual).assertEqual(10080);
      logInfo(`${BUNDLE}SubWindowHeightPx_0053 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0054
     * @tc.name      WindowManage_SubWindowHeightPx_0054
     * @tc.desc      subWindowHeightPx(density=167) returns 40080
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0054 begin`);
      const actual: number = subWindowHeightPx(167);
      logInfo(`subWindowHeightPx(density=167): actual=${actual}`);
      expect(actual).assertEqual(40080);
      logInfo(`${BUNDLE}SubWindowHeightPx_0054 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0055
     * @tc.name      WindowManage_SubWindowHeightPx_0055
     * @tc.desc      subWindowHeightPx(density=131) returns 31440
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0055 begin`);
      const actual: number = subWindowHeightPx(131);
      logInfo(`subWindowHeightPx(density=131): actual=${actual}`);
      expect(actual).assertEqual(31440);
      logInfo(`${BUNDLE}SubWindowHeightPx_0055 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0056
     * @tc.name      WindowManage_SubWindowHeightPx_0056
     * @tc.desc      subWindowHeightPx(density=-30) returns -7200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowHeightPx_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0056 begin`);
      const actual: number = subWindowHeightPx(-30);
      logInfo(`subWindowHeightPx(density=-30): actual=${actual}`);
      expect(actual).assertEqual(-7200);
      logInfo(`${BUNDLE}SubWindowHeightPx_0056 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0057
     * @tc.name      WindowManage_SubWindowHeightPx_0057
     * @tc.desc      subWindowHeightPx(density=49) returns 11760
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0057 begin`);
      const actual: number = subWindowHeightPx(49);
      logInfo(`subWindowHeightPx(density=49): actual=${actual}`);
      expect(actual).assertEqual(11760);
      logInfo(`${BUNDLE}SubWindowHeightPx_0057 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0058
     * @tc.name      WindowManage_SubWindowHeightPx_0058
     * @tc.desc      subWindowHeightPx(density=119) returns 28560
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0058 begin`);
      const actual: number = subWindowHeightPx(119);
      logInfo(`subWindowHeightPx(density=119): actual=${actual}`);
      expect(actual).assertEqual(28560);
      logInfo(`${BUNDLE}SubWindowHeightPx_0058 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0059
     * @tc.name      WindowManage_SubWindowHeightPx_0059
     * @tc.desc      subWindowHeightPx(density=83.88) returns 20131.199999999997
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0059 begin`);
      const actual: number = subWindowHeightPx(83.88);
      logInfo(`subWindowHeightPx(density=83.88): actual=${actual}`);
      expect(actual).assertClose(20131.199999999997, PRECISION);
      logInfo(`${BUNDLE}SubWindowHeightPx_0059 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0060
     * @tc.name      WindowManage_SubWindowHeightPx_0060
     * @tc.desc      subWindowHeightPx(density=-3) returns -720
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowHeightPx_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0060 begin`);
      const actual: number = subWindowHeightPx(-3);
      logInfo(`subWindowHeightPx(density=-3): actual=${actual}`);
      expect(actual).assertEqual(-720);
      logInfo(`${BUNDLE}SubWindowHeightPx_0060 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0061
     * @tc.name      WindowManage_SubWindowHeightPx_0061
     * @tc.desc      subWindowHeightPx(density=22.03) returns 5287.200000000001
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0061 begin`);
      const actual: number = subWindowHeightPx(22.03);
      logInfo(`subWindowHeightPx(density=22.03): actual=${actual}`);
      expect(actual).assertClose(5287.200000000001, PRECISION);
      logInfo(`${BUNDLE}SubWindowHeightPx_0061 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0062
     * @tc.name      WindowManage_SubWindowHeightPx_0062
     * @tc.desc      subWindowHeightPx(density=18.13) returns 4351.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0062 begin`);
      const actual: number = subWindowHeightPx(18.13);
      logInfo(`subWindowHeightPx(density=18.13): actual=${actual}`);
      expect(actual).assertClose(4351.2, PRECISION);
      logInfo(`${BUNDLE}SubWindowHeightPx_0062 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0063
     * @tc.name      WindowManage_SubWindowHeightPx_0063
     * @tc.desc      subWindowHeightPx(density=88) returns 21120
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0063 begin`);
      const actual: number = subWindowHeightPx(88);
      logInfo(`subWindowHeightPx(density=88): actual=${actual}`);
      expect(actual).assertEqual(21120);
      logInfo(`${BUNDLE}SubWindowHeightPx_0063 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0064
     * @tc.name      WindowManage_SubWindowHeightPx_0064
     * @tc.desc      subWindowHeightPx(density=169) returns 40560
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0064 begin`);
      const actual: number = subWindowHeightPx(169);
      logInfo(`subWindowHeightPx(density=169): actual=${actual}`);
      expect(actual).assertEqual(40560);
      logInfo(`${BUNDLE}SubWindowHeightPx_0064 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0065
     * @tc.name      WindowManage_SubWindowHeightPx_0065
     * @tc.desc      subWindowHeightPx(density=-99) returns -23760
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowHeightPx_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0065 begin`);
      const actual: number = subWindowHeightPx(-99);
      logInfo(`subWindowHeightPx(density=-99): actual=${actual}`);
      expect(actual).assertEqual(-23760);
      logInfo(`${BUNDLE}SubWindowHeightPx_0065 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0066
     * @tc.name      WindowManage_SubWindowHeightPx_0066
     * @tc.desc      subWindowHeightPx(density=99.68) returns 23923.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0066 begin`);
      const actual: number = subWindowHeightPx(99.68);
      logInfo(`subWindowHeightPx(density=99.68): actual=${actual}`);
      expect(actual).assertClose(23923.2, PRECISION);
      logInfo(`${BUNDLE}SubWindowHeightPx_0066 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0067
     * @tc.name      WindowManage_SubWindowHeightPx_0067
     * @tc.desc      subWindowHeightPx(density=23.41) returns 5618.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0067 begin`);
      const actual: number = subWindowHeightPx(23.41);
      logInfo(`subWindowHeightPx(density=23.41): actual=${actual}`);
      expect(actual).assertClose(5618.4, PRECISION);
      logInfo(`${BUNDLE}SubWindowHeightPx_0067 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0068
     * @tc.name      WindowManage_SubWindowHeightPx_0068
     * @tc.desc      subWindowHeightPx(density=-81) returns -19440
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowHeightPx_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0068 begin`);
      const actual: number = subWindowHeightPx(-81);
      logInfo(`subWindowHeightPx(density=-81): actual=${actual}`);
      expect(actual).assertEqual(-19440);
      logInfo(`${BUNDLE}SubWindowHeightPx_0068 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0069
     * @tc.name      WindowManage_SubWindowHeightPx_0069
     * @tc.desc      subWindowHeightPx(density=60.84) returns 14601.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0069 begin`);
      const actual: number = subWindowHeightPx(60.84);
      logInfo(`subWindowHeightPx(density=60.84): actual=${actual}`);
      expect(actual).assertClose(14601.6, PRECISION);
      logInfo(`${BUNDLE}SubWindowHeightPx_0069 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0070
     * @tc.name      WindowManage_SubWindowHeightPx_0070
     * @tc.desc      subWindowHeightPx(density=47) returns 11280
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0070 begin`);
      const actual: number = subWindowHeightPx(47);
      logInfo(`subWindowHeightPx(density=47): actual=${actual}`);
      expect(actual).assertEqual(11280);
      logInfo(`${BUNDLE}SubWindowHeightPx_0070 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0071
     * @tc.name      WindowManage_SubWindowHeightPx_0071
     * @tc.desc      subWindowHeightPx(density=5.04) returns 1209.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0071 begin`);
      const actual: number = subWindowHeightPx(5.04);
      logInfo(`subWindowHeightPx(density=5.04): actual=${actual}`);
      expect(actual).assertClose(1209.6, PRECISION);
      logInfo(`${BUNDLE}SubWindowHeightPx_0071 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0072
     * @tc.name      WindowManage_SubWindowHeightPx_0072
     * @tc.desc      subWindowHeightPx(density=64) returns 15360
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0072 begin`);
      const actual: number = subWindowHeightPx(64);
      logInfo(`subWindowHeightPx(density=64): actual=${actual}`);
      expect(actual).assertEqual(15360);
      logInfo(`${BUNDLE}SubWindowHeightPx_0072 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0073
     * @tc.name      WindowManage_SubWindowHeightPx_0073
     * @tc.desc      subWindowHeightPx(density=-31) returns -7440
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowHeightPx_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0073 begin`);
      const actual: number = subWindowHeightPx(-31);
      logInfo(`subWindowHeightPx(density=-31): actual=${actual}`);
      expect(actual).assertEqual(-7440);
      logInfo(`${BUNDLE}SubWindowHeightPx_0073 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0074
     * @tc.name      WindowManage_SubWindowHeightPx_0074
     * @tc.desc      subWindowHeightPx(density=197) returns 47280
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0074 begin`);
      const actual: number = subWindowHeightPx(197);
      logInfo(`subWindowHeightPx(density=197): actual=${actual}`);
      expect(actual).assertEqual(47280);
      logInfo(`${BUNDLE}SubWindowHeightPx_0074 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0075
     * @tc.name      WindowManage_SubWindowHeightPx_0075
     * @tc.desc      subWindowHeightPx(density=-16) returns -3840
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowHeightPx_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0075 begin`);
      const actual: number = subWindowHeightPx(-16);
      logInfo(`subWindowHeightPx(density=-16): actual=${actual}`);
      expect(actual).assertEqual(-3840);
      logInfo(`${BUNDLE}SubWindowHeightPx_0075 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0076
     * @tc.name      WindowManage_SubWindowHeightPx_0076
     * @tc.desc      subWindowHeightPx(density=187) returns 44880
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0076 begin`);
      const actual: number = subWindowHeightPx(187);
      logInfo(`subWindowHeightPx(density=187): actual=${actual}`);
      expect(actual).assertEqual(44880);
      logInfo(`${BUNDLE}SubWindowHeightPx_0076 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0077
     * @tc.name      WindowManage_SubWindowHeightPx_0077
     * @tc.desc      subWindowHeightPx(density=-89) returns -21360
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowHeightPx_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0077 begin`);
      const actual: number = subWindowHeightPx(-89);
      logInfo(`subWindowHeightPx(density=-89): actual=${actual}`);
      expect(actual).assertEqual(-21360);
      logInfo(`${BUNDLE}SubWindowHeightPx_0077 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0078
     * @tc.name      WindowManage_SubWindowHeightPx_0078
     * @tc.desc      subWindowHeightPx(density=154) returns 36960
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0078 begin`);
      const actual: number = subWindowHeightPx(154);
      logInfo(`subWindowHeightPx(density=154): actual=${actual}`);
      expect(actual).assertEqual(36960);
      logInfo(`${BUNDLE}SubWindowHeightPx_0078 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0079
     * @tc.name      WindowManage_SubWindowHeightPx_0079
     * @tc.desc      subWindowHeightPx(density=179) returns 42960
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0079 begin`);
      const actual: number = subWindowHeightPx(179);
      logInfo(`subWindowHeightPx(density=179): actual=${actual}`);
      expect(actual).assertEqual(42960);
      logInfo(`${BUNDLE}SubWindowHeightPx_0079 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0080
     * @tc.name      WindowManage_SubWindowHeightPx_0080
     * @tc.desc      subWindowHeightPx(density=31.6) returns 7584
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0080 begin`);
      const actual: number = subWindowHeightPx(31.6);
      logInfo(`subWindowHeightPx(density=31.6): actual=${actual}`);
      expect(actual).assertEqual(7584);
      logInfo(`${BUNDLE}SubWindowHeightPx_0080 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0081
     * @tc.name      WindowManage_SubWindowHeightPx_0081
     * @tc.desc      subWindowHeightPx(density=61.75) returns 14820
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0081 begin`);
      const actual: number = subWindowHeightPx(61.75);
      logInfo(`subWindowHeightPx(density=61.75): actual=${actual}`);
      expect(actual).assertEqual(14820);
      logInfo(`${BUNDLE}SubWindowHeightPx_0081 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0082
     * @tc.name      WindowManage_SubWindowHeightPx_0082
     * @tc.desc      subWindowHeightPx(density=193) returns 46320
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0082 begin`);
      const actual: number = subWindowHeightPx(193);
      logInfo(`subWindowHeightPx(density=193): actual=${actual}`);
      expect(actual).assertEqual(46320);
      logInfo(`${BUNDLE}SubWindowHeightPx_0082 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0083
     * @tc.name      WindowManage_SubWindowHeightPx_0083
     * @tc.desc      subWindowHeightPx(density=13.85) returns 3324
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0083 begin`);
      const actual: number = subWindowHeightPx(13.85);
      logInfo(`subWindowHeightPx(density=13.85): actual=${actual}`);
      expect(actual).assertEqual(3324);
      logInfo(`${BUNDLE}SubWindowHeightPx_0083 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0084
     * @tc.name      WindowManage_SubWindowHeightPx_0084
     * @tc.desc      subWindowHeightPx(density=-5) returns -1200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowHeightPx_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0084 begin`);
      const actual: number = subWindowHeightPx(-5);
      logInfo(`subWindowHeightPx(density=-5): actual=${actual}`);
      expect(actual).assertEqual(-1200);
      logInfo(`${BUNDLE}SubWindowHeightPx_0084 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0085
     * @tc.name      WindowManage_SubWindowHeightPx_0085
     * @tc.desc      subWindowHeightPx(density=8) returns 1920
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0085 begin`);
      const actual: number = subWindowHeightPx(8);
      logInfo(`subWindowHeightPx(density=8): actual=${actual}`);
      expect(actual).assertEqual(1920);
      logInfo(`${BUNDLE}SubWindowHeightPx_0085 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0086
     * @tc.name      WindowManage_SubWindowHeightPx_0086
     * @tc.desc      subWindowHeightPx(density=59.14) returns 14193.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0086 begin`);
      const actual: number = subWindowHeightPx(59.14);
      logInfo(`subWindowHeightPx(density=59.14): actual=${actual}`);
      expect(actual).assertClose(14193.6, PRECISION);
      logInfo(`${BUNDLE}SubWindowHeightPx_0086 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0087
     * @tc.name      WindowManage_SubWindowHeightPx_0087
     * @tc.desc      subWindowHeightPx(density=88.17) returns 21160.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0087 begin`);
      const actual: number = subWindowHeightPx(88.17);
      logInfo(`subWindowHeightPx(density=88.17): actual=${actual}`);
      expect(actual).assertClose(21160.8, PRECISION);
      logInfo(`${BUNDLE}SubWindowHeightPx_0087 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0088
     * @tc.name      WindowManage_SubWindowHeightPx_0088
     * @tc.desc      subWindowHeightPx(density=51.28) returns 12307.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0088 begin`);
      const actual: number = subWindowHeightPx(51.28);
      logInfo(`subWindowHeightPx(density=51.28): actual=${actual}`);
      expect(actual).assertClose(12307.2, PRECISION);
      logInfo(`${BUNDLE}SubWindowHeightPx_0088 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0089
     * @tc.name      WindowManage_SubWindowHeightPx_0089
     * @tc.desc      subWindowHeightPx(density=-57) returns -13680
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowHeightPx_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0089 begin`);
      const actual: number = subWindowHeightPx(-57);
      logInfo(`subWindowHeightPx(density=-57): actual=${actual}`);
      expect(actual).assertEqual(-13680);
      logInfo(`${BUNDLE}SubWindowHeightPx_0089 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0090
     * @tc.name      WindowManage_SubWindowHeightPx_0090
     * @tc.desc      subWindowHeightPx(density=58.47) returns 14032.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0090 begin`);
      const actual: number = subWindowHeightPx(58.47);
      logInfo(`subWindowHeightPx(density=58.47): actual=${actual}`);
      expect(actual).assertClose(14032.8, PRECISION);
      logInfo(`${BUNDLE}SubWindowHeightPx_0090 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0091
     * @tc.name      WindowManage_SubWindowHeightPx_0091
     * @tc.desc      subWindowHeightPx(density=36.44) returns 8745.599999999999
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0091 begin`);
      const actual: number = subWindowHeightPx(36.44);
      logInfo(`subWindowHeightPx(density=36.44): actual=${actual}`);
      expect(actual).assertClose(8745.599999999999, PRECISION);
      logInfo(`${BUNDLE}SubWindowHeightPx_0091 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0092
     * @tc.name      WindowManage_SubWindowHeightPx_0092
     * @tc.desc      subWindowHeightPx(density=117) returns 28080
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0092 begin`);
      const actual: number = subWindowHeightPx(117);
      logInfo(`subWindowHeightPx(density=117): actual=${actual}`);
      expect(actual).assertEqual(28080);
      logInfo(`${BUNDLE}SubWindowHeightPx_0092 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0093
     * @tc.name      WindowManage_SubWindowHeightPx_0093
     * @tc.desc      subWindowHeightPx(density=52) returns 12480
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0093 begin`);
      const actual: number = subWindowHeightPx(52);
      logInfo(`subWindowHeightPx(density=52): actual=${actual}`);
      expect(actual).assertEqual(12480);
      logInfo(`${BUNDLE}SubWindowHeightPx_0093 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0094
     * @tc.name      WindowManage_SubWindowHeightPx_0094
     * @tc.desc      subWindowHeightPx(density=66) returns 15840
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0094 begin`);
      const actual: number = subWindowHeightPx(66);
      logInfo(`subWindowHeightPx(density=66): actual=${actual}`);
      expect(actual).assertEqual(15840);
      logInfo(`${BUNDLE}SubWindowHeightPx_0094 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0095
     * @tc.name      WindowManage_SubWindowHeightPx_0095
     * @tc.desc      subWindowHeightPx(density=82) returns 19680
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0095 begin`);
      const actual: number = subWindowHeightPx(82);
      logInfo(`subWindowHeightPx(density=82): actual=${actual}`);
      expect(actual).assertEqual(19680);
      logInfo(`${BUNDLE}SubWindowHeightPx_0095 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_HEIGHT_PX_0096
     * @tc.name      WindowManage_SubWindowHeightPx_0096
     * @tc.desc      subWindowHeightPx(density=46.35) returns 11124
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowHeightPx_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowHeightPx_0096 begin`);
      const actual: number = subWindowHeightPx(46.35);
      logInfo(`subWindowHeightPx(density=46.35): actual=${actual}`);
      expect(actual).assertEqual(11124);
      logInfo(`${BUNDLE}SubWindowHeightPx_0096 end`);
    });
  });
}
