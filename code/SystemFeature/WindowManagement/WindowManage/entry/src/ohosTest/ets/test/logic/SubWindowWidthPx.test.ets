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
import { subWindowWidthPx } from '../model/WindowMoveLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_WindowManage]';
const BUNDLE: string = 'WindowManage_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for subWindowWidthPx (96 cases). */
export default function subWindowWidthPxTest(): void {
  describe('SubWindowWidthPxTest', (): void => {
    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0001
     * @tc.name      WindowManage_SubWindowWidthPx_0001
     * @tc.desc      subWindowWidthPx(density=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('WindowManage_SubWindowWidthPx_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0001 begin`);
      const actual: number = subWindowWidthPx(0);
      logInfo(`subWindowWidthPx(density=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowWidthPx_0001 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0002
     * @tc.name      WindowManage_SubWindowWidthPx_0002
     * @tc.desc      subWindowWidthPx(density=1) returns 320
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('WindowManage_SubWindowWidthPx_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0002 begin`);
      const actual: number = subWindowWidthPx(1);
      logInfo(`subWindowWidthPx(density=1): actual=${actual}`);
      expect(actual).assertEqual(320);
      logInfo(`${BUNDLE}SubWindowWidthPx_0002 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0003
     * @tc.name      WindowManage_SubWindowWidthPx_0003
     * @tc.desc      subWindowWidthPx(density=-1) returns -320
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowWidthPx_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0003 begin`);
      const actual: number = subWindowWidthPx(-1);
      logInfo(`subWindowWidthPx(density=-1): actual=${actual}`);
      expect(actual).assertEqual(-320);
      logInfo(`${BUNDLE}SubWindowWidthPx_0003 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0004
     * @tc.name      WindowManage_SubWindowWidthPx_0004
     * @tc.desc      subWindowWidthPx(density=2) returns 640
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0004 begin`);
      const actual: number = subWindowWidthPx(2);
      logInfo(`subWindowWidthPx(density=2): actual=${actual}`);
      expect(actual).assertEqual(640);
      logInfo(`${BUNDLE}SubWindowWidthPx_0004 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0005
     * @tc.name      WindowManage_SubWindowWidthPx_0005
     * @tc.desc      subWindowWidthPx(density=3) returns 960
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0005 begin`);
      const actual: number = subWindowWidthPx(3);
      logInfo(`subWindowWidthPx(density=3): actual=${actual}`);
      expect(actual).assertEqual(960);
      logInfo(`${BUNDLE}SubWindowWidthPx_0005 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0006
     * @tc.name      WindowManage_SubWindowWidthPx_0006
     * @tc.desc      subWindowWidthPx(density=10) returns 3200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0006 begin`);
      const actual: number = subWindowWidthPx(10);
      logInfo(`subWindowWidthPx(density=10): actual=${actual}`);
      expect(actual).assertEqual(3200);
      logInfo(`${BUNDLE}SubWindowWidthPx_0006 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0007
     * @tc.name      WindowManage_SubWindowWidthPx_0007
     * @tc.desc      subWindowWidthPx(density=100) returns 32000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0007 begin`);
      const actual: number = subWindowWidthPx(100);
      logInfo(`subWindowWidthPx(density=100): actual=${actual}`);
      expect(actual).assertEqual(32000);
      logInfo(`${BUNDLE}SubWindowWidthPx_0007 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0008
     * @tc.name      WindowManage_SubWindowWidthPx_0008
     * @tc.desc      subWindowWidthPx(density=5) returns 1600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0008 begin`);
      const actual: number = subWindowWidthPx(5);
      logInfo(`subWindowWidthPx(density=5): actual=${actual}`);
      expect(actual).assertEqual(1600);
      logInfo(`${BUNDLE}SubWindowWidthPx_0008 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0009
     * @tc.name      WindowManage_SubWindowWidthPx_0009
     * @tc.desc      subWindowWidthPx(density=15) returns 4800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0009 begin`);
      const actual: number = subWindowWidthPx(15);
      logInfo(`subWindowWidthPx(density=15): actual=${actual}`);
      expect(actual).assertEqual(4800);
      logInfo(`${BUNDLE}SubWindowWidthPx_0009 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0010
     * @tc.name      WindowManage_SubWindowWidthPx_0010
     * @tc.desc      subWindowWidthPx(density=20) returns 6400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0010 begin`);
      const actual: number = subWindowWidthPx(20);
      logInfo(`subWindowWidthPx(density=20): actual=${actual}`);
      expect(actual).assertEqual(6400);
      logInfo(`${BUNDLE}SubWindowWidthPx_0010 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0011
     * @tc.name      WindowManage_SubWindowWidthPx_0011
     * @tc.desc      subWindowWidthPx(density=25) returns 8000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0011 begin`);
      const actual: number = subWindowWidthPx(25);
      logInfo(`subWindowWidthPx(density=25): actual=${actual}`);
      expect(actual).assertEqual(8000);
      logInfo(`${BUNDLE}SubWindowWidthPx_0011 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0012
     * @tc.name      WindowManage_SubWindowWidthPx_0012
     * @tc.desc      subWindowWidthPx(density=30) returns 9600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0012 begin`);
      const actual: number = subWindowWidthPx(30);
      logInfo(`subWindowWidthPx(density=30): actual=${actual}`);
      expect(actual).assertEqual(9600);
      logInfo(`${BUNDLE}SubWindowWidthPx_0012 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0013
     * @tc.name      WindowManage_SubWindowWidthPx_0013
     * @tc.desc      subWindowWidthPx(density=35) returns 11200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0013 begin`);
      const actual: number = subWindowWidthPx(35);
      logInfo(`subWindowWidthPx(density=35): actual=${actual}`);
      expect(actual).assertEqual(11200);
      logInfo(`${BUNDLE}SubWindowWidthPx_0013 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0014
     * @tc.name      WindowManage_SubWindowWidthPx_0014
     * @tc.desc      subWindowWidthPx(density=40) returns 12800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0014 begin`);
      const actual: number = subWindowWidthPx(40);
      logInfo(`subWindowWidthPx(density=40): actual=${actual}`);
      expect(actual).assertEqual(12800);
      logInfo(`${BUNDLE}SubWindowWidthPx_0014 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0015
     * @tc.name      WindowManage_SubWindowWidthPx_0015
     * @tc.desc      subWindowWidthPx(density=45) returns 14400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0015 begin`);
      const actual: number = subWindowWidthPx(45);
      logInfo(`subWindowWidthPx(density=45): actual=${actual}`);
      expect(actual).assertEqual(14400);
      logInfo(`${BUNDLE}SubWindowWidthPx_0015 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0016
     * @tc.name      WindowManage_SubWindowWidthPx_0016
     * @tc.desc      subWindowWidthPx(density=50) returns 16000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0016 begin`);
      const actual: number = subWindowWidthPx(50);
      logInfo(`subWindowWidthPx(density=50): actual=${actual}`);
      expect(actual).assertEqual(16000);
      logInfo(`${BUNDLE}SubWindowWidthPx_0016 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0017
     * @tc.name      WindowManage_SubWindowWidthPx_0017
     * @tc.desc      subWindowWidthPx(density=55) returns 17600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0017 begin`);
      const actual: number = subWindowWidthPx(55);
      logInfo(`subWindowWidthPx(density=55): actual=${actual}`);
      expect(actual).assertEqual(17600);
      logInfo(`${BUNDLE}SubWindowWidthPx_0017 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0018
     * @tc.name      WindowManage_SubWindowWidthPx_0018
     * @tc.desc      subWindowWidthPx(density=60) returns 19200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0018 begin`);
      const actual: number = subWindowWidthPx(60);
      logInfo(`subWindowWidthPx(density=60): actual=${actual}`);
      expect(actual).assertEqual(19200);
      logInfo(`${BUNDLE}SubWindowWidthPx_0018 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0019
     * @tc.name      WindowManage_SubWindowWidthPx_0019
     * @tc.desc      subWindowWidthPx(density=65) returns 20800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0019 begin`);
      const actual: number = subWindowWidthPx(65);
      logInfo(`subWindowWidthPx(density=65): actual=${actual}`);
      expect(actual).assertEqual(20800);
      logInfo(`${BUNDLE}SubWindowWidthPx_0019 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0020
     * @tc.name      WindowManage_SubWindowWidthPx_0020
     * @tc.desc      subWindowWidthPx(density=70) returns 22400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0020 begin`);
      const actual: number = subWindowWidthPx(70);
      logInfo(`subWindowWidthPx(density=70): actual=${actual}`);
      expect(actual).assertEqual(22400);
      logInfo(`${BUNDLE}SubWindowWidthPx_0020 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0021
     * @tc.name      WindowManage_SubWindowWidthPx_0021
     * @tc.desc      subWindowWidthPx(density=75) returns 24000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0021 begin`);
      const actual: number = subWindowWidthPx(75);
      logInfo(`subWindowWidthPx(density=75): actual=${actual}`);
      expect(actual).assertEqual(24000);
      logInfo(`${BUNDLE}SubWindowWidthPx_0021 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0022
     * @tc.name      WindowManage_SubWindowWidthPx_0022
     * @tc.desc      subWindowWidthPx(density=80) returns 25600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0022 begin`);
      const actual: number = subWindowWidthPx(80);
      logInfo(`subWindowWidthPx(density=80): actual=${actual}`);
      expect(actual).assertEqual(25600);
      logInfo(`${BUNDLE}SubWindowWidthPx_0022 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0023
     * @tc.name      WindowManage_SubWindowWidthPx_0023
     * @tc.desc      subWindowWidthPx(density=85) returns 27200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0023 begin`);
      const actual: number = subWindowWidthPx(85);
      logInfo(`subWindowWidthPx(density=85): actual=${actual}`);
      expect(actual).assertEqual(27200);
      logInfo(`${BUNDLE}SubWindowWidthPx_0023 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0024
     * @tc.name      WindowManage_SubWindowWidthPx_0024
     * @tc.desc      subWindowWidthPx(density=90) returns 28800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0024 begin`);
      const actual: number = subWindowWidthPx(90);
      logInfo(`subWindowWidthPx(density=90): actual=${actual}`);
      expect(actual).assertEqual(28800);
      logInfo(`${BUNDLE}SubWindowWidthPx_0024 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0025
     * @tc.name      WindowManage_SubWindowWidthPx_0025
     * @tc.desc      subWindowWidthPx(density=95) returns 30400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0025 begin`);
      const actual: number = subWindowWidthPx(95);
      logInfo(`subWindowWidthPx(density=95): actual=${actual}`);
      expect(actual).assertEqual(30400);
      logInfo(`${BUNDLE}SubWindowWidthPx_0025 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0026
     * @tc.name      WindowManage_SubWindowWidthPx_0026
     * @tc.desc      subWindowWidthPx(density=105) returns 33600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0026 begin`);
      const actual: number = subWindowWidthPx(105);
      logInfo(`subWindowWidthPx(density=105): actual=${actual}`);
      expect(actual).assertEqual(33600);
      logInfo(`${BUNDLE}SubWindowWidthPx_0026 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0027
     * @tc.name      WindowManage_SubWindowWidthPx_0027
     * @tc.desc      subWindowWidthPx(density=110) returns 35200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0027 begin`);
      const actual: number = subWindowWidthPx(110);
      logInfo(`subWindowWidthPx(density=110): actual=${actual}`);
      expect(actual).assertEqual(35200);
      logInfo(`${BUNDLE}SubWindowWidthPx_0027 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0028
     * @tc.name      WindowManage_SubWindowWidthPx_0028
     * @tc.desc      subWindowWidthPx(density=115) returns 36800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0028 begin`);
      const actual: number = subWindowWidthPx(115);
      logInfo(`subWindowWidthPx(density=115): actual=${actual}`);
      expect(actual).assertEqual(36800);
      logInfo(`${BUNDLE}SubWindowWidthPx_0028 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0029
     * @tc.name      WindowManage_SubWindowWidthPx_0029
     * @tc.desc      subWindowWidthPx(density=120) returns 38400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0029 begin`);
      const actual: number = subWindowWidthPx(120);
      logInfo(`subWindowWidthPx(density=120): actual=${actual}`);
      expect(actual).assertEqual(38400);
      logInfo(`${BUNDLE}SubWindowWidthPx_0029 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0030
     * @tc.name      WindowManage_SubWindowWidthPx_0030
     * @tc.desc      subWindowWidthPx(density=125) returns 40000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0030 begin`);
      const actual: number = subWindowWidthPx(125);
      logInfo(`subWindowWidthPx(density=125): actual=${actual}`);
      expect(actual).assertEqual(40000);
      logInfo(`${BUNDLE}SubWindowWidthPx_0030 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0031
     * @tc.name      WindowManage_SubWindowWidthPx_0031
     * @tc.desc      subWindowWidthPx(density=130) returns 41600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0031 begin`);
      const actual: number = subWindowWidthPx(130);
      logInfo(`subWindowWidthPx(density=130): actual=${actual}`);
      expect(actual).assertEqual(41600);
      logInfo(`${BUNDLE}SubWindowWidthPx_0031 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0032
     * @tc.name      WindowManage_SubWindowWidthPx_0032
     * @tc.desc      subWindowWidthPx(density=135) returns 43200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0032 begin`);
      const actual: number = subWindowWidthPx(135);
      logInfo(`subWindowWidthPx(density=135): actual=${actual}`);
      expect(actual).assertEqual(43200);
      logInfo(`${BUNDLE}SubWindowWidthPx_0032 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0033
     * @tc.name      WindowManage_SubWindowWidthPx_0033
     * @tc.desc      subWindowWidthPx(density=140) returns 44800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0033 begin`);
      const actual: number = subWindowWidthPx(140);
      logInfo(`subWindowWidthPx(density=140): actual=${actual}`);
      expect(actual).assertEqual(44800);
      logInfo(`${BUNDLE}SubWindowWidthPx_0033 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0034
     * @tc.name      WindowManage_SubWindowWidthPx_0034
     * @tc.desc      subWindowWidthPx(density=145) returns 46400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0034 begin`);
      const actual: number = subWindowWidthPx(145);
      logInfo(`subWindowWidthPx(density=145): actual=${actual}`);
      expect(actual).assertEqual(46400);
      logInfo(`${BUNDLE}SubWindowWidthPx_0034 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0035
     * @tc.name      WindowManage_SubWindowWidthPx_0035
     * @tc.desc      subWindowWidthPx(density=150) returns 48000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0035 begin`);
      const actual: number = subWindowWidthPx(150);
      logInfo(`subWindowWidthPx(density=150): actual=${actual}`);
      expect(actual).assertEqual(48000);
      logInfo(`${BUNDLE}SubWindowWidthPx_0035 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0036
     * @tc.name      WindowManage_SubWindowWidthPx_0036
     * @tc.desc      subWindowWidthPx(density=155) returns 49600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0036 begin`);
      const actual: number = subWindowWidthPx(155);
      logInfo(`subWindowWidthPx(density=155): actual=${actual}`);
      expect(actual).assertEqual(49600);
      logInfo(`${BUNDLE}SubWindowWidthPx_0036 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0037
     * @tc.name      WindowManage_SubWindowWidthPx_0037
     * @tc.desc      subWindowWidthPx(density=160) returns 51200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0037 begin`);
      const actual: number = subWindowWidthPx(160);
      logInfo(`subWindowWidthPx(density=160): actual=${actual}`);
      expect(actual).assertEqual(51200);
      logInfo(`${BUNDLE}SubWindowWidthPx_0037 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0038
     * @tc.name      WindowManage_SubWindowWidthPx_0038
     * @tc.desc      subWindowWidthPx(density=165) returns 52800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0038 begin`);
      const actual: number = subWindowWidthPx(165);
      logInfo(`subWindowWidthPx(density=165): actual=${actual}`);
      expect(actual).assertEqual(52800);
      logInfo(`${BUNDLE}SubWindowWidthPx_0038 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0039
     * @tc.name      WindowManage_SubWindowWidthPx_0039
     * @tc.desc      subWindowWidthPx(density=170) returns 54400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0039 begin`);
      const actual: number = subWindowWidthPx(170);
      logInfo(`subWindowWidthPx(density=170): actual=${actual}`);
      expect(actual).assertEqual(54400);
      logInfo(`${BUNDLE}SubWindowWidthPx_0039 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0040
     * @tc.name      WindowManage_SubWindowWidthPx_0040
     * @tc.desc      subWindowWidthPx(density=175) returns 56000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0040 begin`);
      const actual: number = subWindowWidthPx(175);
      logInfo(`subWindowWidthPx(density=175): actual=${actual}`);
      expect(actual).assertEqual(56000);
      logInfo(`${BUNDLE}SubWindowWidthPx_0040 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0041
     * @tc.name      WindowManage_SubWindowWidthPx_0041
     * @tc.desc      subWindowWidthPx(density=180) returns 57600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0041 begin`);
      const actual: number = subWindowWidthPx(180);
      logInfo(`subWindowWidthPx(density=180): actual=${actual}`);
      expect(actual).assertEqual(57600);
      logInfo(`${BUNDLE}SubWindowWidthPx_0041 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0042
     * @tc.name      WindowManage_SubWindowWidthPx_0042
     * @tc.desc      subWindowWidthPx(density=185) returns 59200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0042 begin`);
      const actual: number = subWindowWidthPx(185);
      logInfo(`subWindowWidthPx(density=185): actual=${actual}`);
      expect(actual).assertEqual(59200);
      logInfo(`${BUNDLE}SubWindowWidthPx_0042 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0043
     * @tc.name      WindowManage_SubWindowWidthPx_0043
     * @tc.desc      subWindowWidthPx(density=190) returns 60800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0043 begin`);
      const actual: number = subWindowWidthPx(190);
      logInfo(`subWindowWidthPx(density=190): actual=${actual}`);
      expect(actual).assertEqual(60800);
      logInfo(`${BUNDLE}SubWindowWidthPx_0043 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0044
     * @tc.name      WindowManage_SubWindowWidthPx_0044
     * @tc.desc      subWindowWidthPx(density=195) returns 62400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0044 begin`);
      const actual: number = subWindowWidthPx(195);
      logInfo(`subWindowWidthPx(density=195): actual=${actual}`);
      expect(actual).assertEqual(62400);
      logInfo(`${BUNDLE}SubWindowWidthPx_0044 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0045
     * @tc.name      WindowManage_SubWindowWidthPx_0045
     * @tc.desc      subWindowWidthPx(density=200) returns 64000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0045 begin`);
      const actual: number = subWindowWidthPx(200);
      logInfo(`subWindowWidthPx(density=200): actual=${actual}`);
      expect(actual).assertEqual(64000);
      logInfo(`${BUNDLE}SubWindowWidthPx_0045 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0046
     * @tc.name      WindowManage_SubWindowWidthPx_0046
     * @tc.desc      subWindowWidthPx(density=-20) returns -6400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowWidthPx_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0046 begin`);
      const actual: number = subWindowWidthPx(-20);
      logInfo(`subWindowWidthPx(density=-20): actual=${actual}`);
      expect(actual).assertEqual(-6400);
      logInfo(`${BUNDLE}SubWindowWidthPx_0046 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0047
     * @tc.name      WindowManage_SubWindowWidthPx_0047
     * @tc.desc      subWindowWidthPx(density=193) returns 61760
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0047 begin`);
      const actual: number = subWindowWidthPx(193);
      logInfo(`subWindowWidthPx(density=193): actual=${actual}`);
      expect(actual).assertEqual(61760);
      logInfo(`${BUNDLE}SubWindowWidthPx_0047 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0048
     * @tc.name      WindowManage_SubWindowWidthPx_0048
     * @tc.desc      subWindowWidthPx(density=-96) returns -30720
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowWidthPx_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0048 begin`);
      const actual: number = subWindowWidthPx(-96);
      logInfo(`subWindowWidthPx(density=-96): actual=${actual}`);
      expect(actual).assertEqual(-30720);
      logInfo(`${BUNDLE}SubWindowWidthPx_0048 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0049
     * @tc.name      WindowManage_SubWindowWidthPx_0049
     * @tc.desc      subWindowWidthPx(density=54.41) returns 17411.199999999997
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0049 begin`);
      const actual: number = subWindowWidthPx(54.41);
      logInfo(`subWindowWidthPx(density=54.41): actual=${actual}`);
      expect(actual).assertClose(17411.199999999997, PRECISION);
      logInfo(`${BUNDLE}SubWindowWidthPx_0049 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0050
     * @tc.name      WindowManage_SubWindowWidthPx_0050
     * @tc.desc      subWindowWidthPx(density=97) returns 31040
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0050 begin`);
      const actual: number = subWindowWidthPx(97);
      logInfo(`subWindowWidthPx(density=97): actual=${actual}`);
      expect(actual).assertEqual(31040);
      logInfo(`${BUNDLE}SubWindowWidthPx_0050 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0051
     * @tc.name      WindowManage_SubWindowWidthPx_0051
     * @tc.desc      subWindowWidthPx(density=-60) returns -19200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowWidthPx_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0051 begin`);
      const actual: number = subWindowWidthPx(-60);
      logInfo(`subWindowWidthPx(density=-60): actual=${actual}`);
      expect(actual).assertEqual(-19200);
      logInfo(`${BUNDLE}SubWindowWidthPx_0051 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0052
     * @tc.name      WindowManage_SubWindowWidthPx_0052
     * @tc.desc      subWindowWidthPx(density=122) returns 39040
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0052 begin`);
      const actual: number = subWindowWidthPx(122);
      logInfo(`subWindowWidthPx(density=122): actual=${actual}`);
      expect(actual).assertEqual(39040);
      logInfo(`${BUNDLE}SubWindowWidthPx_0052 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0053
     * @tc.name      WindowManage_SubWindowWidthPx_0053
     * @tc.desc      subWindowWidthPx(density=114) returns 36480
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0053 begin`);
      const actual: number = subWindowWidthPx(114);
      logInfo(`subWindowWidthPx(density=114): actual=${actual}`);
      expect(actual).assertEqual(36480);
      logInfo(`${BUNDLE}SubWindowWidthPx_0053 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0054
     * @tc.name      WindowManage_SubWindowWidthPx_0054
     * @tc.desc      subWindowWidthPx(density=49) returns 15680
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0054 begin`);
      const actual: number = subWindowWidthPx(49);
      logInfo(`subWindowWidthPx(density=49): actual=${actual}`);
      expect(actual).assertEqual(15680);
      logInfo(`${BUNDLE}SubWindowWidthPx_0054 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0055
     * @tc.name      WindowManage_SubWindowWidthPx_0055
     * @tc.desc      subWindowWidthPx(density=134) returns 42880
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0055 begin`);
      const actual: number = subWindowWidthPx(134);
      logInfo(`subWindowWidthPx(density=134): actual=${actual}`);
      expect(actual).assertEqual(42880);
      logInfo(`${BUNDLE}SubWindowWidthPx_0055 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0056
     * @tc.name      WindowManage_SubWindowWidthPx_0056
     * @tc.desc      subWindowWidthPx(density=63.99) returns 20476.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0056 begin`);
      const actual: number = subWindowWidthPx(63.99);
      logInfo(`subWindowWidthPx(density=63.99): actual=${actual}`);
      expect(actual).assertClose(20476.8, PRECISION);
      logInfo(`${BUNDLE}SubWindowWidthPx_0056 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0057
     * @tc.name      WindowManage_SubWindowWidthPx_0057
     * @tc.desc      subWindowWidthPx(density=13.23) returns 4233.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0057 begin`);
      const actual: number = subWindowWidthPx(13.23);
      logInfo(`subWindowWidthPx(density=13.23): actual=${actual}`);
      expect(actual).assertClose(4233.6, PRECISION);
      logInfo(`${BUNDLE}SubWindowWidthPx_0057 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0058
     * @tc.name      WindowManage_SubWindowWidthPx_0058
     * @tc.desc      subWindowWidthPx(density=98) returns 31360
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0058 begin`);
      const actual: number = subWindowWidthPx(98);
      logInfo(`subWindowWidthPx(density=98): actual=${actual}`);
      expect(actual).assertEqual(31360);
      logInfo(`${BUNDLE}SubWindowWidthPx_0058 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0059
     * @tc.name      WindowManage_SubWindowWidthPx_0059
     * @tc.desc      subWindowWidthPx(density=58) returns 18560
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0059 begin`);
      const actual: number = subWindowWidthPx(58);
      logInfo(`subWindowWidthPx(density=58): actual=${actual}`);
      expect(actual).assertEqual(18560);
      logInfo(`${BUNDLE}SubWindowWidthPx_0059 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0060
     * @tc.name      WindowManage_SubWindowWidthPx_0060
     * @tc.desc      subWindowWidthPx(density=-7) returns -2240
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowWidthPx_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0060 begin`);
      const actual: number = subWindowWidthPx(-7);
      logInfo(`subWindowWidthPx(density=-7): actual=${actual}`);
      expect(actual).assertEqual(-2240);
      logInfo(`${BUNDLE}SubWindowWidthPx_0060 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0061
     * @tc.name      WindowManage_SubWindowWidthPx_0061
     * @tc.desc      subWindowWidthPx(density=-15) returns -4800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowWidthPx_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0061 begin`);
      const actual: number = subWindowWidthPx(-15);
      logInfo(`subWindowWidthPx(density=-15): actual=${actual}`);
      expect(actual).assertEqual(-4800);
      logInfo(`${BUNDLE}SubWindowWidthPx_0061 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0062
     * @tc.name      WindowManage_SubWindowWidthPx_0062
     * @tc.desc      subWindowWidthPx(density=188) returns 60160
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0062 begin`);
      const actual: number = subWindowWidthPx(188);
      logInfo(`subWindowWidthPx(density=188): actual=${actual}`);
      expect(actual).assertEqual(60160);
      logInfo(`${BUNDLE}SubWindowWidthPx_0062 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0063
     * @tc.name      WindowManage_SubWindowWidthPx_0063
     * @tc.desc      subWindowWidthPx(density=53.49) returns 17116.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0063 begin`);
      const actual: number = subWindowWidthPx(53.49);
      logInfo(`subWindowWidthPx(density=53.49): actual=${actual}`);
      expect(actual).assertClose(17116.8, PRECISION);
      logInfo(`${BUNDLE}SubWindowWidthPx_0063 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0064
     * @tc.name      WindowManage_SubWindowWidthPx_0064
     * @tc.desc      subWindowWidthPx(density=40.59) returns 12988.800000000001
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0064 begin`);
      const actual: number = subWindowWidthPx(40.59);
      logInfo(`subWindowWidthPx(density=40.59): actual=${actual}`);
      expect(actual).assertClose(12988.800000000001, PRECISION);
      logInfo(`${BUNDLE}SubWindowWidthPx_0064 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0065
     * @tc.name      WindowManage_SubWindowWidthPx_0065
     * @tc.desc      subWindowWidthPx(density=-6) returns -1920
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowWidthPx_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0065 begin`);
      const actual: number = subWindowWidthPx(-6);
      logInfo(`subWindowWidthPx(density=-6): actual=${actual}`);
      expect(actual).assertEqual(-1920);
      logInfo(`${BUNDLE}SubWindowWidthPx_0065 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0066
     * @tc.name      WindowManage_SubWindowWidthPx_0066
     * @tc.desc      subWindowWidthPx(density=61.15) returns 19568
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0066 begin`);
      const actual: number = subWindowWidthPx(61.15);
      logInfo(`subWindowWidthPx(density=61.15): actual=${actual}`);
      expect(actual).assertEqual(19568);
      logInfo(`${BUNDLE}SubWindowWidthPx_0066 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0067
     * @tc.name      WindowManage_SubWindowWidthPx_0067
     * @tc.desc      subWindowWidthPx(density=-67) returns -21440
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowWidthPx_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0067 begin`);
      const actual: number = subWindowWidthPx(-67);
      logInfo(`subWindowWidthPx(density=-67): actual=${actual}`);
      expect(actual).assertEqual(-21440);
      logInfo(`${BUNDLE}SubWindowWidthPx_0067 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0068
     * @tc.name      WindowManage_SubWindowWidthPx_0068
     * @tc.desc      subWindowWidthPx(density=8.35) returns 2672
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0068 begin`);
      const actual: number = subWindowWidthPx(8.35);
      logInfo(`subWindowWidthPx(density=8.35): actual=${actual}`);
      expect(actual).assertEqual(2672);
      logInfo(`${BUNDLE}SubWindowWidthPx_0068 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0069
     * @tc.name      WindowManage_SubWindowWidthPx_0069
     * @tc.desc      subWindowWidthPx(density=20.55) returns 6576
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0069 begin`);
      const actual: number = subWindowWidthPx(20.55);
      logInfo(`subWindowWidthPx(density=20.55): actual=${actual}`);
      expect(actual).assertEqual(6576);
      logInfo(`${BUNDLE}SubWindowWidthPx_0069 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0070
     * @tc.name      WindowManage_SubWindowWidthPx_0070
     * @tc.desc      subWindowWidthPx(density=32.88) returns 10521.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0070 begin`);
      const actual: number = subWindowWidthPx(32.88);
      logInfo(`subWindowWidthPx(density=32.88): actual=${actual}`);
      expect(actual).assertClose(10521.6, PRECISION);
      logInfo(`${BUNDLE}SubWindowWidthPx_0070 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0071
     * @tc.name      WindowManage_SubWindowWidthPx_0071
     * @tc.desc      subWindowWidthPx(density=-74) returns -23680
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowWidthPx_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0071 begin`);
      const actual: number = subWindowWidthPx(-74);
      logInfo(`subWindowWidthPx(density=-74): actual=${actual}`);
      expect(actual).assertEqual(-23680);
      logInfo(`${BUNDLE}SubWindowWidthPx_0071 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0072
     * @tc.name      WindowManage_SubWindowWidthPx_0072
     * @tc.desc      subWindowWidthPx(density=16.98) returns 5433.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0072 begin`);
      const actual: number = subWindowWidthPx(16.98);
      logInfo(`subWindowWidthPx(density=16.98): actual=${actual}`);
      expect(actual).assertClose(5433.6, PRECISION);
      logInfo(`${BUNDLE}SubWindowWidthPx_0072 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0073
     * @tc.name      WindowManage_SubWindowWidthPx_0073
     * @tc.desc      subWindowWidthPx(density=6) returns 1920
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0073 begin`);
      const actual: number = subWindowWidthPx(6);
      logInfo(`subWindowWidthPx(density=6): actual=${actual}`);
      expect(actual).assertEqual(1920);
      logInfo(`${BUNDLE}SubWindowWidthPx_0073 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0074
     * @tc.name      WindowManage_SubWindowWidthPx_0074
     * @tc.desc      subWindowWidthPx(density=-9) returns -2880
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowWidthPx_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0074 begin`);
      const actual: number = subWindowWidthPx(-9);
      logInfo(`subWindowWidthPx(density=-9): actual=${actual}`);
      expect(actual).assertEqual(-2880);
      logInfo(`${BUNDLE}SubWindowWidthPx_0074 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0075
     * @tc.name      WindowManage_SubWindowWidthPx_0075
     * @tc.desc      subWindowWidthPx(density=96) returns 30720
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0075 begin`);
      const actual: number = subWindowWidthPx(96);
      logInfo(`subWindowWidthPx(density=96): actual=${actual}`);
      expect(actual).assertEqual(30720);
      logInfo(`${BUNDLE}SubWindowWidthPx_0075 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0076
     * @tc.name      WindowManage_SubWindowWidthPx_0076
     * @tc.desc      subWindowWidthPx(density=129) returns 41280
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0076 begin`);
      const actual: number = subWindowWidthPx(129);
      logInfo(`subWindowWidthPx(density=129): actual=${actual}`);
      expect(actual).assertEqual(41280);
      logInfo(`${BUNDLE}SubWindowWidthPx_0076 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0077
     * @tc.name      WindowManage_SubWindowWidthPx_0077
     * @tc.desc      subWindowWidthPx(density=64) returns 20480
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0077 begin`);
      const actual: number = subWindowWidthPx(64);
      logInfo(`subWindowWidthPx(density=64): actual=${actual}`);
      expect(actual).assertEqual(20480);
      logInfo(`${BUNDLE}SubWindowWidthPx_0077 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0078
     * @tc.name      WindowManage_SubWindowWidthPx_0078
     * @tc.desc      subWindowWidthPx(density=91.19) returns 29180.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0078 begin`);
      const actual: number = subWindowWidthPx(91.19);
      logInfo(`subWindowWidthPx(density=91.19): actual=${actual}`);
      expect(actual).assertClose(29180.8, PRECISION);
      logInfo(`${BUNDLE}SubWindowWidthPx_0078 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0079
     * @tc.name      WindowManage_SubWindowWidthPx_0079
     * @tc.desc      subWindowWidthPx(density=142) returns 45440
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0079 begin`);
      const actual: number = subWindowWidthPx(142);
      logInfo(`subWindowWidthPx(density=142): actual=${actual}`);
      expect(actual).assertEqual(45440);
      logInfo(`${BUNDLE}SubWindowWidthPx_0079 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0080
     * @tc.name      WindowManage_SubWindowWidthPx_0080
     * @tc.desc      subWindowWidthPx(density=-95) returns -30400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowWidthPx_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0080 begin`);
      const actual: number = subWindowWidthPx(-95);
      logInfo(`subWindowWidthPx(density=-95): actual=${actual}`);
      expect(actual).assertEqual(-30400);
      logInfo(`${BUNDLE}SubWindowWidthPx_0080 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0081
     * @tc.name      WindowManage_SubWindowWidthPx_0081
     * @tc.desc      subWindowWidthPx(density=-31) returns -9920
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowWidthPx_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0081 begin`);
      const actual: number = subWindowWidthPx(-31);
      logInfo(`subWindowWidthPx(density=-31): actual=${actual}`);
      expect(actual).assertEqual(-9920);
      logInfo(`${BUNDLE}SubWindowWidthPx_0081 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0082
     * @tc.name      WindowManage_SubWindowWidthPx_0082
     * @tc.desc      subWindowWidthPx(density=34.18) returns 10937.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0082 begin`);
      const actual: number = subWindowWidthPx(34.18);
      logInfo(`subWindowWidthPx(density=34.18): actual=${actual}`);
      expect(actual).assertClose(10937.6, PRECISION);
      logInfo(`${BUNDLE}SubWindowWidthPx_0082 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0083
     * @tc.name      WindowManage_SubWindowWidthPx_0083
     * @tc.desc      subWindowWidthPx(density=-82) returns -26240
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowWidthPx_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0083 begin`);
      const actual: number = subWindowWidthPx(-82);
      logInfo(`subWindowWidthPx(density=-82): actual=${actual}`);
      expect(actual).assertEqual(-26240);
      logInfo(`${BUNDLE}SubWindowWidthPx_0083 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0084
     * @tc.name      WindowManage_SubWindowWidthPx_0084
     * @tc.desc      subWindowWidthPx(density=-52) returns -16640
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowWidthPx_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0084 begin`);
      const actual: number = subWindowWidthPx(-52);
      logInfo(`subWindowWidthPx(density=-52): actual=${actual}`);
      expect(actual).assertEqual(-16640);
      logInfo(`${BUNDLE}SubWindowWidthPx_0084 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0085
     * @tc.name      WindowManage_SubWindowWidthPx_0085
     * @tc.desc      subWindowWidthPx(density=144) returns 46080
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0085 begin`);
      const actual: number = subWindowWidthPx(144);
      logInfo(`subWindowWidthPx(density=144): actual=${actual}`);
      expect(actual).assertEqual(46080);
      logInfo(`${BUNDLE}SubWindowWidthPx_0085 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0086
     * @tc.name      WindowManage_SubWindowWidthPx_0086
     * @tc.desc      subWindowWidthPx(density=-61) returns -19520
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowWidthPx_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0086 begin`);
      const actual: number = subWindowWidthPx(-61);
      logInfo(`subWindowWidthPx(density=-61): actual=${actual}`);
      expect(actual).assertEqual(-19520);
      logInfo(`${BUNDLE}SubWindowWidthPx_0086 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0087
     * @tc.name      WindowManage_SubWindowWidthPx_0087
     * @tc.desc      subWindowWidthPx(density=87) returns 27840
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0087 begin`);
      const actual: number = subWindowWidthPx(87);
      logInfo(`subWindowWidthPx(density=87): actual=${actual}`);
      expect(actual).assertEqual(27840);
      logInfo(`${BUNDLE}SubWindowWidthPx_0087 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0088
     * @tc.name      WindowManage_SubWindowWidthPx_0088
     * @tc.desc      subWindowWidthPx(density=161) returns 51520
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0088 begin`);
      const actual: number = subWindowWidthPx(161);
      logInfo(`subWindowWidthPx(density=161): actual=${actual}`);
      expect(actual).assertEqual(51520);
      logInfo(`${BUNDLE}SubWindowWidthPx_0088 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0089
     * @tc.name      WindowManage_SubWindowWidthPx_0089
     * @tc.desc      subWindowWidthPx(density=24) returns 7680
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0089 begin`);
      const actual: number = subWindowWidthPx(24);
      logInfo(`subWindowWidthPx(density=24): actual=${actual}`);
      expect(actual).assertEqual(7680);
      logInfo(`${BUNDLE}SubWindowWidthPx_0089 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0090
     * @tc.name      WindowManage_SubWindowWidthPx_0090
     * @tc.desc      subWindowWidthPx(density=31.88) returns 10201.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0090 begin`);
      const actual: number = subWindowWidthPx(31.88);
      logInfo(`subWindowWidthPx(density=31.88): actual=${actual}`);
      expect(actual).assertClose(10201.6, PRECISION);
      logInfo(`${BUNDLE}SubWindowWidthPx_0090 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0091
     * @tc.name      WindowManage_SubWindowWidthPx_0091
     * @tc.desc      subWindowWidthPx(density=4) returns 1280
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0091 begin`);
      const actual: number = subWindowWidthPx(4);
      logInfo(`subWindowWidthPx(density=4): actual=${actual}`);
      expect(actual).assertEqual(1280);
      logInfo(`${BUNDLE}SubWindowWidthPx_0091 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0092
     * @tc.name      WindowManage_SubWindowWidthPx_0092
     * @tc.desc      subWindowWidthPx(density=18) returns 5760
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0092 begin`);
      const actual: number = subWindowWidthPx(18);
      logInfo(`subWindowWidthPx(density=18): actual=${actual}`);
      expect(actual).assertEqual(5760);
      logInfo(`${BUNDLE}SubWindowWidthPx_0092 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0093
     * @tc.name      WindowManage_SubWindowWidthPx_0093
     * @tc.desc      subWindowWidthPx(density=151) returns 48320
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0093 begin`);
      const actual: number = subWindowWidthPx(151);
      logInfo(`subWindowWidthPx(density=151): actual=${actual}`);
      expect(actual).assertEqual(48320);
      logInfo(`${BUNDLE}SubWindowWidthPx_0093 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0094
     * @tc.name      WindowManage_SubWindowWidthPx_0094
     * @tc.desc      subWindowWidthPx(density=27.7) returns 8864
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0094 begin`);
      const actual: number = subWindowWidthPx(27.7);
      logInfo(`subWindowWidthPx(density=27.7): actual=${actual}`);
      expect(actual).assertEqual(8864);
      logInfo(`${BUNDLE}SubWindowWidthPx_0094 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0095
     * @tc.name      WindowManage_SubWindowWidthPx_0095
     * @tc.desc      subWindowWidthPx(density=34.08) returns 10905.599999999999
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0095 begin`);
      const actual: number = subWindowWidthPx(34.08);
      logInfo(`subWindowWidthPx(density=34.08): actual=${actual}`);
      expect(actual).assertClose(10905.599999999999, PRECISION);
      logInfo(`${BUNDLE}SubWindowWidthPx_0095 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_WIDTH_PX_0096
     * @tc.name      WindowManage_SubWindowWidthPx_0096
     * @tc.desc      subWindowWidthPx(density=75.15) returns 24048
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowWidthPx_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowWidthPx_0096 begin`);
      const actual: number = subWindowWidthPx(75.15);
      logInfo(`subWindowWidthPx(density=75.15): actual=${actual}`);
      expect(actual).assertEqual(24048);
      logInfo(`${BUNDLE}SubWindowWidthPx_0096 end`);
    });
  });
}
