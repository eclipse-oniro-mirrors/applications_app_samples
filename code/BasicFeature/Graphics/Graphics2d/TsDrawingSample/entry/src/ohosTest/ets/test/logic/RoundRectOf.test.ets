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
import { yieldToEventLoop } from '../TestEventLoop';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { RectBox, roundRectOf } from '../model/DrawingGeometryLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_TsDrawingSample]';
const BUNDLE: string = 'TsDrawingSample_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for roundRectOf (70 cases). */
export default function roundRectOfTest(): void {
  describe('RoundRectOfTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROUND_RECT_OF_0001
     * @tc.name      TsDrawingSample_RoundRectOf_0001
     * @tc.desc      roundRectOf(screenWidth=0, offsetY=-100) returns 150
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TsDrawingSample_RoundRectOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RoundRectOf_0001 begin`);
      const actual: RectBox = roundRectOf(0, -100);
      logInfo(`roundRectOf(screenWidth=0, offsetY=-100): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(20);
      logInfo(`roundRectOf(screenWidth=0, offsetY=-100): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(50);
      logInfo(`roundRectOf(screenWidth=0, offsetY=-100): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-20);
      logInfo(`roundRectOf(screenWidth=0, offsetY=-100): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(150);
      logInfo(`${BUNDLE}RoundRectOf_0001 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROUND_RECT_OF_0002
     * @tc.name      TsDrawingSample_RoundRectOf_0002
     * @tc.desc      roundRectOf(screenWidth=0, offsetY=-1) returns 249
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TsDrawingSample_RoundRectOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RoundRectOf_0002 begin`);
      const actual: RectBox = roundRectOf(0, -1);
      logInfo(`roundRectOf(screenWidth=0, offsetY=-1): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(20);
      logInfo(`roundRectOf(screenWidth=0, offsetY=-1): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(149);
      logInfo(`roundRectOf(screenWidth=0, offsetY=-1): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-20);
      logInfo(`roundRectOf(screenWidth=0, offsetY=-1): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(249);
      logInfo(`${BUNDLE}RoundRectOf_0002 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROUND_RECT_OF_0003
     * @tc.name      TsDrawingSample_RoundRectOf_0003
     * @tc.desc      roundRectOf(screenWidth=0, offsetY=20) returns 270
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_RoundRectOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RoundRectOf_0003 begin`);
      const actual: RectBox = roundRectOf(0, 20);
      logInfo(`roundRectOf(screenWidth=0, offsetY=20): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(20);
      logInfo(`roundRectOf(screenWidth=0, offsetY=20): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(170);
      logInfo(`roundRectOf(screenWidth=0, offsetY=20): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-20);
      logInfo(`roundRectOf(screenWidth=0, offsetY=20): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(270);
      logInfo(`${BUNDLE}RoundRectOf_0003 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROUND_RECT_OF_0004
     * @tc.name      TsDrawingSample_RoundRectOf_0004
     * @tc.desc      roundRectOf(screenWidth=0, offsetY=19) returns 269
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_RoundRectOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RoundRectOf_0004 begin`);
      const actual: RectBox = roundRectOf(0, 19);
      logInfo(`roundRectOf(screenWidth=0, offsetY=19): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(20);
      logInfo(`roundRectOf(screenWidth=0, offsetY=19): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(169);
      logInfo(`roundRectOf(screenWidth=0, offsetY=19): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-20);
      logInfo(`roundRectOf(screenWidth=0, offsetY=19): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(269);
      logInfo(`${BUNDLE}RoundRectOf_0004 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROUND_RECT_OF_0005
     * @tc.name      TsDrawingSample_RoundRectOf_0005
     * @tc.desc      roundRectOf(screenWidth=0, offsetY=21) returns 271
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_RoundRectOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RoundRectOf_0005 begin`);
      const actual: RectBox = roundRectOf(0, 21);
      logInfo(`roundRectOf(screenWidth=0, offsetY=21): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(20);
      logInfo(`roundRectOf(screenWidth=0, offsetY=21): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(171);
      logInfo(`roundRectOf(screenWidth=0, offsetY=21): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-20);
      logInfo(`roundRectOf(screenWidth=0, offsetY=21): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(271);
      logInfo(`${BUNDLE}RoundRectOf_0005 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROUND_RECT_OF_0006
     * @tc.name      TsDrawingSample_RoundRectOf_0006
     * @tc.desc      roundRectOf(screenWidth=0, offsetY=40) returns 290
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RoundRectOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundRectOf_0006 begin`);
      const actual: RectBox = roundRectOf(0, 40);
      logInfo(`roundRectOf(screenWidth=0, offsetY=40): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(20);
      logInfo(`roundRectOf(screenWidth=0, offsetY=40): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(190);
      logInfo(`roundRectOf(screenWidth=0, offsetY=40): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-20);
      logInfo(`roundRectOf(screenWidth=0, offsetY=40): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(290);
      logInfo(`${BUNDLE}RoundRectOf_0006 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROUND_RECT_OF_0007
     * @tc.name      TsDrawingSample_RoundRectOf_0007
     * @tc.desc      roundRectOf(screenWidth=0, offsetY=10) returns 260
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RoundRectOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundRectOf_0007 begin`);
      const actual: RectBox = roundRectOf(0, 10);
      logInfo(`roundRectOf(screenWidth=0, offsetY=10): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(20);
      logInfo(`roundRectOf(screenWidth=0, offsetY=10): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(160);
      logInfo(`roundRectOf(screenWidth=0, offsetY=10): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-20);
      logInfo(`roundRectOf(screenWidth=0, offsetY=10): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(260);
      logInfo(`${BUNDLE}RoundRectOf_0007 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROUND_RECT_OF_0008
     * @tc.name      TsDrawingSample_RoundRectOf_0008
     * @tc.desc      roundRectOf(screenWidth=0, offsetY=2) returns 252
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_RoundRectOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RoundRectOf_0008 begin`);
      const actual: RectBox = roundRectOf(0, 2);
      logInfo(`roundRectOf(screenWidth=0, offsetY=2): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(20);
      logInfo(`roundRectOf(screenWidth=0, offsetY=2): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(152);
      logInfo(`roundRectOf(screenWidth=0, offsetY=2): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-20);
      logInfo(`roundRectOf(screenWidth=0, offsetY=2): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(252);
      logInfo(`${BUNDLE}RoundRectOf_0008 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROUND_RECT_OF_0009
     * @tc.name      TsDrawingSample_RoundRectOf_0009
     * @tc.desc      roundRectOf(screenWidth=0, offsetY=1) returns 251
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_RoundRectOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RoundRectOf_0009 begin`);
      const actual: RectBox = roundRectOf(0, 1);
      logInfo(`roundRectOf(screenWidth=0, offsetY=1): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(20);
      logInfo(`roundRectOf(screenWidth=0, offsetY=1): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(151);
      logInfo(`roundRectOf(screenWidth=0, offsetY=1): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-20);
      logInfo(`roundRectOf(screenWidth=0, offsetY=1): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(251);
      logInfo(`${BUNDLE}RoundRectOf_0009 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROUND_RECT_OF_0010
     * @tc.name      TsDrawingSample_RoundRectOf_0010
     * @tc.desc      roundRectOf(screenWidth=0, offsetY=3) returns 253
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_RoundRectOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RoundRectOf_0010 begin`);
      const actual: RectBox = roundRectOf(0, 3);
      logInfo(`roundRectOf(screenWidth=0, offsetY=3): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(20);
      logInfo(`roundRectOf(screenWidth=0, offsetY=3): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(153);
      logInfo(`roundRectOf(screenWidth=0, offsetY=3): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-20);
      logInfo(`roundRectOf(screenWidth=0, offsetY=3): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(253);
      logInfo(`${BUNDLE}RoundRectOf_0010 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROUND_RECT_OF_0011
     * @tc.name      TsDrawingSample_RoundRectOf_0011
     * @tc.desc      roundRectOf(screenWidth=0, offsetY=0) returns 250
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RoundRectOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundRectOf_0011 begin`);
      const actual: RectBox = roundRectOf(0, 0);
      logInfo(`roundRectOf(screenWidth=0, offsetY=0): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(20);
      logInfo(`roundRectOf(screenWidth=0, offsetY=0): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(150);
      logInfo(`roundRectOf(screenWidth=0, offsetY=0): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-20);
      logInfo(`roundRectOf(screenWidth=0, offsetY=0): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(250);
      logInfo(`${BUNDLE}RoundRectOf_0011 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROUND_RECT_OF_0012
     * @tc.name      TsDrawingSample_RoundRectOf_0012
     * @tc.desc      roundRectOf(screenWidth=0, offsetY=50) returns 300
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RoundRectOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundRectOf_0012 begin`);
      const actual: RectBox = roundRectOf(0, 50);
      logInfo(`roundRectOf(screenWidth=0, offsetY=50): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(20);
      logInfo(`roundRectOf(screenWidth=0, offsetY=50): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(200);
      logInfo(`roundRectOf(screenWidth=0, offsetY=50): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-20);
      logInfo(`roundRectOf(screenWidth=0, offsetY=50): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(300);
      logInfo(`${BUNDLE}RoundRectOf_0012 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROUND_RECT_OF_0013
     * @tc.name      TsDrawingSample_RoundRectOf_0013
     * @tc.desc      roundRectOf(screenWidth=0, offsetY=100) returns 350
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RoundRectOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundRectOf_0013 begin`);
      const actual: RectBox = roundRectOf(0, 100);
      logInfo(`roundRectOf(screenWidth=0, offsetY=100): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(20);
      logInfo(`roundRectOf(screenWidth=0, offsetY=100): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(250);
      logInfo(`roundRectOf(screenWidth=0, offsetY=100): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-20);
      logInfo(`roundRectOf(screenWidth=0, offsetY=100): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(350);
      logInfo(`${BUNDLE}RoundRectOf_0013 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROUND_RECT_OF_0014
     * @tc.name      TsDrawingSample_RoundRectOf_0014
     * @tc.desc      roundRectOf(screenWidth=0, offsetY=5) returns 255
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RoundRectOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundRectOf_0014 begin`);
      const actual: RectBox = roundRectOf(0, 5);
      logInfo(`roundRectOf(screenWidth=0, offsetY=5): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(20);
      logInfo(`roundRectOf(screenWidth=0, offsetY=5): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(155);
      logInfo(`roundRectOf(screenWidth=0, offsetY=5): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-20);
      logInfo(`roundRectOf(screenWidth=0, offsetY=5): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(255);
      logInfo(`${BUNDLE}RoundRectOf_0014 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROUND_RECT_OF_0015
     * @tc.name      TsDrawingSample_RoundRectOf_0015
     * @tc.desc      roundRectOf(screenWidth=0, offsetY=15) returns 265
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RoundRectOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundRectOf_0015 begin`);
      const actual: RectBox = roundRectOf(0, 15);
      logInfo(`roundRectOf(screenWidth=0, offsetY=15): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(20);
      logInfo(`roundRectOf(screenWidth=0, offsetY=15): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(165);
      logInfo(`roundRectOf(screenWidth=0, offsetY=15): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-20);
      logInfo(`roundRectOf(screenWidth=0, offsetY=15): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(265);
      logInfo(`${BUNDLE}RoundRectOf_0015 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROUND_RECT_OF_0016
     * @tc.name      TsDrawingSample_RoundRectOf_0016
     * @tc.desc      roundRectOf(screenWidth=0, offsetY=25) returns 275
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RoundRectOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundRectOf_0016 begin`);
      const actual: RectBox = roundRectOf(0, 25);
      logInfo(`roundRectOf(screenWidth=0, offsetY=25): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(20);
      logInfo(`roundRectOf(screenWidth=0, offsetY=25): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(175);
      logInfo(`roundRectOf(screenWidth=0, offsetY=25): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-20);
      logInfo(`roundRectOf(screenWidth=0, offsetY=25): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(275);
      logInfo(`${BUNDLE}RoundRectOf_0016 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROUND_RECT_OF_0017
     * @tc.name      TsDrawingSample_RoundRectOf_0017
     * @tc.desc      roundRectOf(screenWidth=0, offsetY=30) returns 280
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RoundRectOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundRectOf_0017 begin`);
      const actual: RectBox = roundRectOf(0, 30);
      logInfo(`roundRectOf(screenWidth=0, offsetY=30): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(20);
      logInfo(`roundRectOf(screenWidth=0, offsetY=30): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(180);
      logInfo(`roundRectOf(screenWidth=0, offsetY=30): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-20);
      logInfo(`roundRectOf(screenWidth=0, offsetY=30): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(280);
      logInfo(`${BUNDLE}RoundRectOf_0017 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROUND_RECT_OF_0018
     * @tc.name      TsDrawingSample_RoundRectOf_0018
     * @tc.desc      roundRectOf(screenWidth=0, offsetY=35) returns 285
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RoundRectOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundRectOf_0018 begin`);
      const actual: RectBox = roundRectOf(0, 35);
      logInfo(`roundRectOf(screenWidth=0, offsetY=35): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(20);
      logInfo(`roundRectOf(screenWidth=0, offsetY=35): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(185);
      logInfo(`roundRectOf(screenWidth=0, offsetY=35): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-20);
      logInfo(`roundRectOf(screenWidth=0, offsetY=35): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(285);
      logInfo(`${BUNDLE}RoundRectOf_0018 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROUND_RECT_OF_0019
     * @tc.name      TsDrawingSample_RoundRectOf_0019
     * @tc.desc      roundRectOf(screenWidth=0, offsetY=45) returns 295
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RoundRectOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundRectOf_0019 begin`);
      const actual: RectBox = roundRectOf(0, 45);
      logInfo(`roundRectOf(screenWidth=0, offsetY=45): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(20);
      logInfo(`roundRectOf(screenWidth=0, offsetY=45): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(195);
      logInfo(`roundRectOf(screenWidth=0, offsetY=45): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-20);
      logInfo(`roundRectOf(screenWidth=0, offsetY=45): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(295);
      logInfo(`${BUNDLE}RoundRectOf_0019 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROUND_RECT_OF_0020
     * @tc.name      TsDrawingSample_RoundRectOf_0020
     * @tc.desc      roundRectOf(screenWidth=0, offsetY=55) returns 305
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RoundRectOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundRectOf_0020 begin`);
      const actual: RectBox = roundRectOf(0, 55);
      logInfo(`roundRectOf(screenWidth=0, offsetY=55): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(20);
      logInfo(`roundRectOf(screenWidth=0, offsetY=55): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(205);
      logInfo(`roundRectOf(screenWidth=0, offsetY=55): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-20);
      logInfo(`roundRectOf(screenWidth=0, offsetY=55): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(305);
      logInfo(`${BUNDLE}RoundRectOf_0020 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROUND_RECT_OF_0021
     * @tc.name      TsDrawingSample_RoundRectOf_0021
     * @tc.desc      roundRectOf(screenWidth=0, offsetY=60) returns 310
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RoundRectOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundRectOf_0021 begin`);
      const actual: RectBox = roundRectOf(0, 60);
      logInfo(`roundRectOf(screenWidth=0, offsetY=60): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(20);
      logInfo(`roundRectOf(screenWidth=0, offsetY=60): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(210);
      logInfo(`roundRectOf(screenWidth=0, offsetY=60): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-20);
      logInfo(`roundRectOf(screenWidth=0, offsetY=60): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(310);
      logInfo(`${BUNDLE}RoundRectOf_0021 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROUND_RECT_OF_0022
     * @tc.name      TsDrawingSample_RoundRectOf_0022
     * @tc.desc      roundRectOf(screenWidth=0, offsetY=65) returns 315
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RoundRectOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundRectOf_0022 begin`);
      const actual: RectBox = roundRectOf(0, 65);
      logInfo(`roundRectOf(screenWidth=0, offsetY=65): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(20);
      logInfo(`roundRectOf(screenWidth=0, offsetY=65): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(215);
      logInfo(`roundRectOf(screenWidth=0, offsetY=65): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-20);
      logInfo(`roundRectOf(screenWidth=0, offsetY=65): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(315);
      logInfo(`${BUNDLE}RoundRectOf_0022 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROUND_RECT_OF_0023
     * @tc.name      TsDrawingSample_RoundRectOf_0023
     * @tc.desc      roundRectOf(screenWidth=0, offsetY=70) returns 320
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RoundRectOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundRectOf_0023 begin`);
      const actual: RectBox = roundRectOf(0, 70);
      logInfo(`roundRectOf(screenWidth=0, offsetY=70): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(20);
      logInfo(`roundRectOf(screenWidth=0, offsetY=70): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(220);
      logInfo(`roundRectOf(screenWidth=0, offsetY=70): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-20);
      logInfo(`roundRectOf(screenWidth=0, offsetY=70): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(320);
      logInfo(`${BUNDLE}RoundRectOf_0023 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROUND_RECT_OF_0024
     * @tc.name      TsDrawingSample_RoundRectOf_0024
     * @tc.desc      roundRectOf(screenWidth=0, offsetY=75) returns 325
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RoundRectOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundRectOf_0024 begin`);
      const actual: RectBox = roundRectOf(0, 75);
      logInfo(`roundRectOf(screenWidth=0, offsetY=75): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(20);
      logInfo(`roundRectOf(screenWidth=0, offsetY=75): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(225);
      logInfo(`roundRectOf(screenWidth=0, offsetY=75): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-20);
      logInfo(`roundRectOf(screenWidth=0, offsetY=75): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(325);
      logInfo(`${BUNDLE}RoundRectOf_0024 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROUND_RECT_OF_0025
     * @tc.name      TsDrawingSample_RoundRectOf_0025
     * @tc.desc      roundRectOf(screenWidth=0, offsetY=80) returns 330
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RoundRectOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundRectOf_0025 begin`);
      const actual: RectBox = roundRectOf(0, 80);
      logInfo(`roundRectOf(screenWidth=0, offsetY=80): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(20);
      logInfo(`roundRectOf(screenWidth=0, offsetY=80): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(230);
      logInfo(`roundRectOf(screenWidth=0, offsetY=80): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-20);
      logInfo(`roundRectOf(screenWidth=0, offsetY=80): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(330);
      logInfo(`${BUNDLE}RoundRectOf_0025 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROUND_RECT_OF_0026
     * @tc.name      TsDrawingSample_RoundRectOf_0026
     * @tc.desc      roundRectOf(screenWidth=0, offsetY=85) returns 335
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RoundRectOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundRectOf_0026 begin`);
      const actual: RectBox = roundRectOf(0, 85);
      logInfo(`roundRectOf(screenWidth=0, offsetY=85): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(20);
      logInfo(`roundRectOf(screenWidth=0, offsetY=85): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(235);
      logInfo(`roundRectOf(screenWidth=0, offsetY=85): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-20);
      logInfo(`roundRectOf(screenWidth=0, offsetY=85): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(335);
      logInfo(`${BUNDLE}RoundRectOf_0026 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROUND_RECT_OF_0027
     * @tc.name      TsDrawingSample_RoundRectOf_0027
     * @tc.desc      roundRectOf(screenWidth=0, offsetY=95) returns 345
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RoundRectOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundRectOf_0027 begin`);
      const actual: RectBox = roundRectOf(0, 95);
      logInfo(`roundRectOf(screenWidth=0, offsetY=95): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(20);
      logInfo(`roundRectOf(screenWidth=0, offsetY=95): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(245);
      logInfo(`roundRectOf(screenWidth=0, offsetY=95): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-20);
      logInfo(`roundRectOf(screenWidth=0, offsetY=95): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(345);
      logInfo(`${BUNDLE}RoundRectOf_0027 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROUND_RECT_OF_0028
     * @tc.name      TsDrawingSample_RoundRectOf_0028
     * @tc.desc      roundRectOf(screenWidth=0, offsetY=-2) returns 248
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_RoundRectOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RoundRectOf_0028 begin`);
      const actual: RectBox = roundRectOf(0, -2);
      logInfo(`roundRectOf(screenWidth=0, offsetY=-2): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(20);
      logInfo(`roundRectOf(screenWidth=0, offsetY=-2): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(148);
      logInfo(`roundRectOf(screenWidth=0, offsetY=-2): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-20);
      logInfo(`roundRectOf(screenWidth=0, offsetY=-2): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(248);
      logInfo(`${BUNDLE}RoundRectOf_0028 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROUND_RECT_OF_0029
     * @tc.name      TsDrawingSample_RoundRectOf_0029
     * @tc.desc      roundRectOf(screenWidth=0, offsetY=33) returns 283
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RoundRectOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundRectOf_0029 begin`);
      const actual: RectBox = roundRectOf(0, 33);
      logInfo(`roundRectOf(screenWidth=0, offsetY=33): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(20);
      logInfo(`roundRectOf(screenWidth=0, offsetY=33): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(183);
      logInfo(`roundRectOf(screenWidth=0, offsetY=33): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-20);
      logInfo(`roundRectOf(screenWidth=0, offsetY=33): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(283);
      logInfo(`${BUNDLE}RoundRectOf_0029 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROUND_RECT_OF_0030
     * @tc.name      TsDrawingSample_RoundRectOf_0030
     * @tc.desc      roundRectOf(screenWidth=0, offsetY=131) returns 381
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RoundRectOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundRectOf_0030 begin`);
      const actual: RectBox = roundRectOf(0, 131);
      logInfo(`roundRectOf(screenWidth=0, offsetY=131): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(20);
      logInfo(`roundRectOf(screenWidth=0, offsetY=131): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(281);
      logInfo(`roundRectOf(screenWidth=0, offsetY=131): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-20);
      logInfo(`roundRectOf(screenWidth=0, offsetY=131): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(381);
      logInfo(`${BUNDLE}RoundRectOf_0030 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROUND_RECT_OF_0031
     * @tc.name      TsDrawingSample_RoundRectOf_0031
     * @tc.desc      roundRectOf(screenWidth=1, offsetY=-100) returns 150
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_RoundRectOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RoundRectOf_0031 begin`);
      const actual: RectBox = roundRectOf(1, -100);
      logInfo(`roundRectOf(screenWidth=1, offsetY=-100): actual.left=${actual.left}`);
      expect(actual.left).assertClose(20.25, PRECISION);
      logInfo(`roundRectOf(screenWidth=1, offsetY=-100): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(50);
      logInfo(`roundRectOf(screenWidth=1, offsetY=-100): actual.right=${actual.right}`);
      expect(actual.right).assertClose(-19.5, PRECISION);
      logInfo(`roundRectOf(screenWidth=1, offsetY=-100): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(150);
      logInfo(`${BUNDLE}RoundRectOf_0031 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROUND_RECT_OF_0032
     * @tc.name      TsDrawingSample_RoundRectOf_0032
     * @tc.desc      roundRectOf(screenWidth=1, offsetY=-1) returns 249
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_RoundRectOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RoundRectOf_0032 begin`);
      const actual: RectBox = roundRectOf(1, -1);
      logInfo(`roundRectOf(screenWidth=1, offsetY=-1): actual.left=${actual.left}`);
      expect(actual.left).assertClose(20.25, PRECISION);
      logInfo(`roundRectOf(screenWidth=1, offsetY=-1): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(149);
      logInfo(`roundRectOf(screenWidth=1, offsetY=-1): actual.right=${actual.right}`);
      expect(actual.right).assertClose(-19.5, PRECISION);
      logInfo(`roundRectOf(screenWidth=1, offsetY=-1): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(249);
      logInfo(`${BUNDLE}RoundRectOf_0032 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROUND_RECT_OF_0033
     * @tc.name      TsDrawingSample_RoundRectOf_0033
     * @tc.desc      roundRectOf(screenWidth=1, offsetY=20) returns 270
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_RoundRectOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RoundRectOf_0033 begin`);
      const actual: RectBox = roundRectOf(1, 20);
      logInfo(`roundRectOf(screenWidth=1, offsetY=20): actual.left=${actual.left}`);
      expect(actual.left).assertClose(20.25, PRECISION);
      logInfo(`roundRectOf(screenWidth=1, offsetY=20): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(170);
      logInfo(`roundRectOf(screenWidth=1, offsetY=20): actual.right=${actual.right}`);
      expect(actual.right).assertClose(-19.5, PRECISION);
      logInfo(`roundRectOf(screenWidth=1, offsetY=20): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(270);
      logInfo(`${BUNDLE}RoundRectOf_0033 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROUND_RECT_OF_0034
     * @tc.name      TsDrawingSample_RoundRectOf_0034
     * @tc.desc      roundRectOf(screenWidth=1, offsetY=19) returns 269
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_RoundRectOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RoundRectOf_0034 begin`);
      const actual: RectBox = roundRectOf(1, 19);
      logInfo(`roundRectOf(screenWidth=1, offsetY=19): actual.left=${actual.left}`);
      expect(actual.left).assertClose(20.25, PRECISION);
      logInfo(`roundRectOf(screenWidth=1, offsetY=19): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(169);
      logInfo(`roundRectOf(screenWidth=1, offsetY=19): actual.right=${actual.right}`);
      expect(actual.right).assertClose(-19.5, PRECISION);
      logInfo(`roundRectOf(screenWidth=1, offsetY=19): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(269);
      logInfo(`${BUNDLE}RoundRectOf_0034 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROUND_RECT_OF_0035
     * @tc.name      TsDrawingSample_RoundRectOf_0035
     * @tc.desc      roundRectOf(screenWidth=1, offsetY=21) returns 271
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_RoundRectOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RoundRectOf_0035 begin`);
      const actual: RectBox = roundRectOf(1, 21);
      logInfo(`roundRectOf(screenWidth=1, offsetY=21): actual.left=${actual.left}`);
      expect(actual.left).assertClose(20.25, PRECISION);
      logInfo(`roundRectOf(screenWidth=1, offsetY=21): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(171);
      logInfo(`roundRectOf(screenWidth=1, offsetY=21): actual.right=${actual.right}`);
      expect(actual.right).assertClose(-19.5, PRECISION);
      logInfo(`roundRectOf(screenWidth=1, offsetY=21): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(271);
      logInfo(`${BUNDLE}RoundRectOf_0035 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROUND_RECT_OF_0036
     * @tc.name      TsDrawingSample_RoundRectOf_0036
     * @tc.desc      roundRectOf(screenWidth=1, offsetY=40) returns 290
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RoundRectOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundRectOf_0036 begin`);
      const actual: RectBox = roundRectOf(1, 40);
      logInfo(`roundRectOf(screenWidth=1, offsetY=40): actual.left=${actual.left}`);
      expect(actual.left).assertClose(20.25, PRECISION);
      logInfo(`roundRectOf(screenWidth=1, offsetY=40): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(190);
      logInfo(`roundRectOf(screenWidth=1, offsetY=40): actual.right=${actual.right}`);
      expect(actual.right).assertClose(-19.5, PRECISION);
      logInfo(`roundRectOf(screenWidth=1, offsetY=40): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(290);
      logInfo(`${BUNDLE}RoundRectOf_0036 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROUND_RECT_OF_0037
     * @tc.name      TsDrawingSample_RoundRectOf_0037
     * @tc.desc      roundRectOf(screenWidth=1, offsetY=10) returns 260
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RoundRectOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundRectOf_0037 begin`);
      const actual: RectBox = roundRectOf(1, 10);
      logInfo(`roundRectOf(screenWidth=1, offsetY=10): actual.left=${actual.left}`);
      expect(actual.left).assertClose(20.25, PRECISION);
      logInfo(`roundRectOf(screenWidth=1, offsetY=10): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(160);
      logInfo(`roundRectOf(screenWidth=1, offsetY=10): actual.right=${actual.right}`);
      expect(actual.right).assertClose(-19.5, PRECISION);
      logInfo(`roundRectOf(screenWidth=1, offsetY=10): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(260);
      logInfo(`${BUNDLE}RoundRectOf_0037 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROUND_RECT_OF_0038
     * @tc.name      TsDrawingSample_RoundRectOf_0038
     * @tc.desc      roundRectOf(screenWidth=1, offsetY=2) returns 252
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_RoundRectOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RoundRectOf_0038 begin`);
      const actual: RectBox = roundRectOf(1, 2);
      logInfo(`roundRectOf(screenWidth=1, offsetY=2): actual.left=${actual.left}`);
      expect(actual.left).assertClose(20.25, PRECISION);
      logInfo(`roundRectOf(screenWidth=1, offsetY=2): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(152);
      logInfo(`roundRectOf(screenWidth=1, offsetY=2): actual.right=${actual.right}`);
      expect(actual.right).assertClose(-19.5, PRECISION);
      logInfo(`roundRectOf(screenWidth=1, offsetY=2): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(252);
      logInfo(`${BUNDLE}RoundRectOf_0038 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROUND_RECT_OF_0039
     * @tc.name      TsDrawingSample_RoundRectOf_0039
     * @tc.desc      roundRectOf(screenWidth=1, offsetY=1) returns 251
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_RoundRectOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RoundRectOf_0039 begin`);
      const actual: RectBox = roundRectOf(1, 1);
      logInfo(`roundRectOf(screenWidth=1, offsetY=1): actual.left=${actual.left}`);
      expect(actual.left).assertClose(20.25, PRECISION);
      logInfo(`roundRectOf(screenWidth=1, offsetY=1): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(151);
      logInfo(`roundRectOf(screenWidth=1, offsetY=1): actual.right=${actual.right}`);
      expect(actual.right).assertClose(-19.5, PRECISION);
      logInfo(`roundRectOf(screenWidth=1, offsetY=1): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(251);
      logInfo(`${BUNDLE}RoundRectOf_0039 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROUND_RECT_OF_0040
     * @tc.name      TsDrawingSample_RoundRectOf_0040
     * @tc.desc      roundRectOf(screenWidth=1, offsetY=3) returns 253
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_RoundRectOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RoundRectOf_0040 begin`);
      const actual: RectBox = roundRectOf(1, 3);
      logInfo(`roundRectOf(screenWidth=1, offsetY=3): actual.left=${actual.left}`);
      expect(actual.left).assertClose(20.25, PRECISION);
      logInfo(`roundRectOf(screenWidth=1, offsetY=3): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(153);
      logInfo(`roundRectOf(screenWidth=1, offsetY=3): actual.right=${actual.right}`);
      expect(actual.right).assertClose(-19.5, PRECISION);
      logInfo(`roundRectOf(screenWidth=1, offsetY=3): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(253);
      logInfo(`${BUNDLE}RoundRectOf_0040 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROUND_RECT_OF_0041
     * @tc.name      TsDrawingSample_RoundRectOf_0041
     * @tc.desc      roundRectOf(screenWidth=1, offsetY=0) returns 250
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RoundRectOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundRectOf_0041 begin`);
      const actual: RectBox = roundRectOf(1, 0);
      logInfo(`roundRectOf(screenWidth=1, offsetY=0): actual.left=${actual.left}`);
      expect(actual.left).assertClose(20.25, PRECISION);
      logInfo(`roundRectOf(screenWidth=1, offsetY=0): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(150);
      logInfo(`roundRectOf(screenWidth=1, offsetY=0): actual.right=${actual.right}`);
      expect(actual.right).assertClose(-19.5, PRECISION);
      logInfo(`roundRectOf(screenWidth=1, offsetY=0): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(250);
      logInfo(`${BUNDLE}RoundRectOf_0041 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROUND_RECT_OF_0042
     * @tc.name      TsDrawingSample_RoundRectOf_0042
     * @tc.desc      roundRectOf(screenWidth=1, offsetY=50) returns 300
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RoundRectOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundRectOf_0042 begin`);
      const actual: RectBox = roundRectOf(1, 50);
      logInfo(`roundRectOf(screenWidth=1, offsetY=50): actual.left=${actual.left}`);
      expect(actual.left).assertClose(20.25, PRECISION);
      logInfo(`roundRectOf(screenWidth=1, offsetY=50): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(200);
      logInfo(`roundRectOf(screenWidth=1, offsetY=50): actual.right=${actual.right}`);
      expect(actual.right).assertClose(-19.5, PRECISION);
      logInfo(`roundRectOf(screenWidth=1, offsetY=50): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(300);
      logInfo(`${BUNDLE}RoundRectOf_0042 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROUND_RECT_OF_0043
     * @tc.name      TsDrawingSample_RoundRectOf_0043
     * @tc.desc      roundRectOf(screenWidth=1, offsetY=100) returns 350
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RoundRectOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundRectOf_0043 begin`);
      const actual: RectBox = roundRectOf(1, 100);
      logInfo(`roundRectOf(screenWidth=1, offsetY=100): actual.left=${actual.left}`);
      expect(actual.left).assertClose(20.25, PRECISION);
      logInfo(`roundRectOf(screenWidth=1, offsetY=100): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(250);
      logInfo(`roundRectOf(screenWidth=1, offsetY=100): actual.right=${actual.right}`);
      expect(actual.right).assertClose(-19.5, PRECISION);
      logInfo(`roundRectOf(screenWidth=1, offsetY=100): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(350);
      logInfo(`${BUNDLE}RoundRectOf_0043 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROUND_RECT_OF_0044
     * @tc.name      TsDrawingSample_RoundRectOf_0044
     * @tc.desc      roundRectOf(screenWidth=1, offsetY=5) returns 255
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RoundRectOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundRectOf_0044 begin`);
      const actual: RectBox = roundRectOf(1, 5);
      logInfo(`roundRectOf(screenWidth=1, offsetY=5): actual.left=${actual.left}`);
      expect(actual.left).assertClose(20.25, PRECISION);
      logInfo(`roundRectOf(screenWidth=1, offsetY=5): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(155);
      logInfo(`roundRectOf(screenWidth=1, offsetY=5): actual.right=${actual.right}`);
      expect(actual.right).assertClose(-19.5, PRECISION);
      logInfo(`roundRectOf(screenWidth=1, offsetY=5): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(255);
      logInfo(`${BUNDLE}RoundRectOf_0044 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROUND_RECT_OF_0045
     * @tc.name      TsDrawingSample_RoundRectOf_0045
     * @tc.desc      roundRectOf(screenWidth=1, offsetY=15) returns 265
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RoundRectOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundRectOf_0045 begin`);
      const actual: RectBox = roundRectOf(1, 15);
      logInfo(`roundRectOf(screenWidth=1, offsetY=15): actual.left=${actual.left}`);
      expect(actual.left).assertClose(20.25, PRECISION);
      logInfo(`roundRectOf(screenWidth=1, offsetY=15): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(165);
      logInfo(`roundRectOf(screenWidth=1, offsetY=15): actual.right=${actual.right}`);
      expect(actual.right).assertClose(-19.5, PRECISION);
      logInfo(`roundRectOf(screenWidth=1, offsetY=15): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(265);
      logInfo(`${BUNDLE}RoundRectOf_0045 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROUND_RECT_OF_0046
     * @tc.name      TsDrawingSample_RoundRectOf_0046
     * @tc.desc      roundRectOf(screenWidth=1, offsetY=25) returns 275
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RoundRectOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundRectOf_0046 begin`);
      const actual: RectBox = roundRectOf(1, 25);
      logInfo(`roundRectOf(screenWidth=1, offsetY=25): actual.left=${actual.left}`);
      expect(actual.left).assertClose(20.25, PRECISION);
      logInfo(`roundRectOf(screenWidth=1, offsetY=25): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(175);
      logInfo(`roundRectOf(screenWidth=1, offsetY=25): actual.right=${actual.right}`);
      expect(actual.right).assertClose(-19.5, PRECISION);
      logInfo(`roundRectOf(screenWidth=1, offsetY=25): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(275);
      logInfo(`${BUNDLE}RoundRectOf_0046 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROUND_RECT_OF_0047
     * @tc.name      TsDrawingSample_RoundRectOf_0047
     * @tc.desc      roundRectOf(screenWidth=1, offsetY=30) returns 280
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RoundRectOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundRectOf_0047 begin`);
      const actual: RectBox = roundRectOf(1, 30);
      logInfo(`roundRectOf(screenWidth=1, offsetY=30): actual.left=${actual.left}`);
      expect(actual.left).assertClose(20.25, PRECISION);
      logInfo(`roundRectOf(screenWidth=1, offsetY=30): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(180);
      logInfo(`roundRectOf(screenWidth=1, offsetY=30): actual.right=${actual.right}`);
      expect(actual.right).assertClose(-19.5, PRECISION);
      logInfo(`roundRectOf(screenWidth=1, offsetY=30): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(280);
      logInfo(`${BUNDLE}RoundRectOf_0047 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROUND_RECT_OF_0048
     * @tc.name      TsDrawingSample_RoundRectOf_0048
     * @tc.desc      roundRectOf(screenWidth=1, offsetY=35) returns 285
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RoundRectOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundRectOf_0048 begin`);
      const actual: RectBox = roundRectOf(1, 35);
      logInfo(`roundRectOf(screenWidth=1, offsetY=35): actual.left=${actual.left}`);
      expect(actual.left).assertClose(20.25, PRECISION);
      logInfo(`roundRectOf(screenWidth=1, offsetY=35): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(185);
      logInfo(`roundRectOf(screenWidth=1, offsetY=35): actual.right=${actual.right}`);
      expect(actual.right).assertClose(-19.5, PRECISION);
      logInfo(`roundRectOf(screenWidth=1, offsetY=35): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(285);
      logInfo(`${BUNDLE}RoundRectOf_0048 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROUND_RECT_OF_0049
     * @tc.name      TsDrawingSample_RoundRectOf_0049
     * @tc.desc      roundRectOf(screenWidth=1, offsetY=45) returns 295
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RoundRectOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundRectOf_0049 begin`);
      const actual: RectBox = roundRectOf(1, 45);
      logInfo(`roundRectOf(screenWidth=1, offsetY=45): actual.left=${actual.left}`);
      expect(actual.left).assertClose(20.25, PRECISION);
      logInfo(`roundRectOf(screenWidth=1, offsetY=45): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(195);
      logInfo(`roundRectOf(screenWidth=1, offsetY=45): actual.right=${actual.right}`);
      expect(actual.right).assertClose(-19.5, PRECISION);
      logInfo(`roundRectOf(screenWidth=1, offsetY=45): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(295);
      logInfo(`${BUNDLE}RoundRectOf_0049 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROUND_RECT_OF_0050
     * @tc.name      TsDrawingSample_RoundRectOf_0050
     * @tc.desc      roundRectOf(screenWidth=1, offsetY=55) returns 305
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RoundRectOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundRectOf_0050 begin`);
      const actual: RectBox = roundRectOf(1, 55);
      logInfo(`roundRectOf(screenWidth=1, offsetY=55): actual.left=${actual.left}`);
      expect(actual.left).assertClose(20.25, PRECISION);
      logInfo(`roundRectOf(screenWidth=1, offsetY=55): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(205);
      logInfo(`roundRectOf(screenWidth=1, offsetY=55): actual.right=${actual.right}`);
      expect(actual.right).assertClose(-19.5, PRECISION);
      logInfo(`roundRectOf(screenWidth=1, offsetY=55): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(305);
      logInfo(`${BUNDLE}RoundRectOf_0050 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROUND_RECT_OF_0051
     * @tc.name      TsDrawingSample_RoundRectOf_0051
     * @tc.desc      roundRectOf(screenWidth=1, offsetY=60) returns 310
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RoundRectOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundRectOf_0051 begin`);
      const actual: RectBox = roundRectOf(1, 60);
      logInfo(`roundRectOf(screenWidth=1, offsetY=60): actual.left=${actual.left}`);
      expect(actual.left).assertClose(20.25, PRECISION);
      logInfo(`roundRectOf(screenWidth=1, offsetY=60): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(210);
      logInfo(`roundRectOf(screenWidth=1, offsetY=60): actual.right=${actual.right}`);
      expect(actual.right).assertClose(-19.5, PRECISION);
      logInfo(`roundRectOf(screenWidth=1, offsetY=60): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(310);
      logInfo(`${BUNDLE}RoundRectOf_0051 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROUND_RECT_OF_0052
     * @tc.name      TsDrawingSample_RoundRectOf_0052
     * @tc.desc      roundRectOf(screenWidth=1, offsetY=65) returns 315
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RoundRectOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundRectOf_0052 begin`);
      const actual: RectBox = roundRectOf(1, 65);
      logInfo(`roundRectOf(screenWidth=1, offsetY=65): actual.left=${actual.left}`);
      expect(actual.left).assertClose(20.25, PRECISION);
      logInfo(`roundRectOf(screenWidth=1, offsetY=65): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(215);
      logInfo(`roundRectOf(screenWidth=1, offsetY=65): actual.right=${actual.right}`);
      expect(actual.right).assertClose(-19.5, PRECISION);
      logInfo(`roundRectOf(screenWidth=1, offsetY=65): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(315);
      logInfo(`${BUNDLE}RoundRectOf_0052 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROUND_RECT_OF_0053
     * @tc.name      TsDrawingSample_RoundRectOf_0053
     * @tc.desc      roundRectOf(screenWidth=1, offsetY=70) returns 320
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RoundRectOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundRectOf_0053 begin`);
      const actual: RectBox = roundRectOf(1, 70);
      logInfo(`roundRectOf(screenWidth=1, offsetY=70): actual.left=${actual.left}`);
      expect(actual.left).assertClose(20.25, PRECISION);
      logInfo(`roundRectOf(screenWidth=1, offsetY=70): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(220);
      logInfo(`roundRectOf(screenWidth=1, offsetY=70): actual.right=${actual.right}`);
      expect(actual.right).assertClose(-19.5, PRECISION);
      logInfo(`roundRectOf(screenWidth=1, offsetY=70): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(320);
      logInfo(`${BUNDLE}RoundRectOf_0053 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROUND_RECT_OF_0054
     * @tc.name      TsDrawingSample_RoundRectOf_0054
     * @tc.desc      roundRectOf(screenWidth=1, offsetY=75) returns 325
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RoundRectOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundRectOf_0054 begin`);
      const actual: RectBox = roundRectOf(1, 75);
      logInfo(`roundRectOf(screenWidth=1, offsetY=75): actual.left=${actual.left}`);
      expect(actual.left).assertClose(20.25, PRECISION);
      logInfo(`roundRectOf(screenWidth=1, offsetY=75): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(225);
      logInfo(`roundRectOf(screenWidth=1, offsetY=75): actual.right=${actual.right}`);
      expect(actual.right).assertClose(-19.5, PRECISION);
      logInfo(`roundRectOf(screenWidth=1, offsetY=75): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(325);
      logInfo(`${BUNDLE}RoundRectOf_0054 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROUND_RECT_OF_0055
     * @tc.name      TsDrawingSample_RoundRectOf_0055
     * @tc.desc      roundRectOf(screenWidth=1, offsetY=80) returns 330
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RoundRectOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundRectOf_0055 begin`);
      const actual: RectBox = roundRectOf(1, 80);
      logInfo(`roundRectOf(screenWidth=1, offsetY=80): actual.left=${actual.left}`);
      expect(actual.left).assertClose(20.25, PRECISION);
      logInfo(`roundRectOf(screenWidth=1, offsetY=80): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(230);
      logInfo(`roundRectOf(screenWidth=1, offsetY=80): actual.right=${actual.right}`);
      expect(actual.right).assertClose(-19.5, PRECISION);
      logInfo(`roundRectOf(screenWidth=1, offsetY=80): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(330);
      logInfo(`${BUNDLE}RoundRectOf_0055 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROUND_RECT_OF_0056
     * @tc.name      TsDrawingSample_RoundRectOf_0056
     * @tc.desc      roundRectOf(screenWidth=1, offsetY=85) returns 335
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RoundRectOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundRectOf_0056 begin`);
      const actual: RectBox = roundRectOf(1, 85);
      logInfo(`roundRectOf(screenWidth=1, offsetY=85): actual.left=${actual.left}`);
      expect(actual.left).assertClose(20.25, PRECISION);
      logInfo(`roundRectOf(screenWidth=1, offsetY=85): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(235);
      logInfo(`roundRectOf(screenWidth=1, offsetY=85): actual.right=${actual.right}`);
      expect(actual.right).assertClose(-19.5, PRECISION);
      logInfo(`roundRectOf(screenWidth=1, offsetY=85): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(335);
      logInfo(`${BUNDLE}RoundRectOf_0056 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROUND_RECT_OF_0057
     * @tc.name      TsDrawingSample_RoundRectOf_0057
     * @tc.desc      roundRectOf(screenWidth=1, offsetY=95) returns 345
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RoundRectOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundRectOf_0057 begin`);
      const actual: RectBox = roundRectOf(1, 95);
      logInfo(`roundRectOf(screenWidth=1, offsetY=95): actual.left=${actual.left}`);
      expect(actual.left).assertClose(20.25, PRECISION);
      logInfo(`roundRectOf(screenWidth=1, offsetY=95): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(245);
      logInfo(`roundRectOf(screenWidth=1, offsetY=95): actual.right=${actual.right}`);
      expect(actual.right).assertClose(-19.5, PRECISION);
      logInfo(`roundRectOf(screenWidth=1, offsetY=95): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(345);
      logInfo(`${BUNDLE}RoundRectOf_0057 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROUND_RECT_OF_0058
     * @tc.name      TsDrawingSample_RoundRectOf_0058
     * @tc.desc      roundRectOf(screenWidth=1, offsetY=-2) returns 248
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_RoundRectOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RoundRectOf_0058 begin`);
      const actual: RectBox = roundRectOf(1, -2);
      logInfo(`roundRectOf(screenWidth=1, offsetY=-2): actual.left=${actual.left}`);
      expect(actual.left).assertClose(20.25, PRECISION);
      logInfo(`roundRectOf(screenWidth=1, offsetY=-2): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(148);
      logInfo(`roundRectOf(screenWidth=1, offsetY=-2): actual.right=${actual.right}`);
      expect(actual.right).assertClose(-19.5, PRECISION);
      logInfo(`roundRectOf(screenWidth=1, offsetY=-2): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(248);
      logInfo(`${BUNDLE}RoundRectOf_0058 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROUND_RECT_OF_0059
     * @tc.name      TsDrawingSample_RoundRectOf_0059
     * @tc.desc      roundRectOf(screenWidth=1, offsetY=33) returns 283
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RoundRectOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundRectOf_0059 begin`);
      const actual: RectBox = roundRectOf(1, 33);
      logInfo(`roundRectOf(screenWidth=1, offsetY=33): actual.left=${actual.left}`);
      expect(actual.left).assertClose(20.25, PRECISION);
      logInfo(`roundRectOf(screenWidth=1, offsetY=33): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(183);
      logInfo(`roundRectOf(screenWidth=1, offsetY=33): actual.right=${actual.right}`);
      expect(actual.right).assertClose(-19.5, PRECISION);
      logInfo(`roundRectOf(screenWidth=1, offsetY=33): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(283);
      logInfo(`${BUNDLE}RoundRectOf_0059 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROUND_RECT_OF_0060
     * @tc.name      TsDrawingSample_RoundRectOf_0060
     * @tc.desc      roundRectOf(screenWidth=1, offsetY=131) returns 381
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RoundRectOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RoundRectOf_0060 begin`);
      const actual: RectBox = roundRectOf(1, 131);
      logInfo(`roundRectOf(screenWidth=1, offsetY=131): actual.left=${actual.left}`);
      expect(actual.left).assertClose(20.25, PRECISION);
      logInfo(`roundRectOf(screenWidth=1, offsetY=131): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(281);
      logInfo(`roundRectOf(screenWidth=1, offsetY=131): actual.right=${actual.right}`);
      expect(actual.right).assertClose(-19.5, PRECISION);
      logInfo(`roundRectOf(screenWidth=1, offsetY=131): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(381);
      logInfo(`${BUNDLE}RoundRectOf_0060 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROUND_RECT_OF_0061
     * @tc.name      TsDrawingSample_RoundRectOf_0061
     * @tc.desc      roundRectOf(screenWidth=20, offsetY=-100) returns 150
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_RoundRectOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RoundRectOf_0061 begin`);
      const actual: RectBox = roundRectOf(20, -100);
      logInfo(`roundRectOf(screenWidth=20, offsetY=-100): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(25);
      logInfo(`roundRectOf(screenWidth=20, offsetY=-100): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(50);
      logInfo(`roundRectOf(screenWidth=20, offsetY=-100): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-10);
      logInfo(`roundRectOf(screenWidth=20, offsetY=-100): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(150);
      logInfo(`${BUNDLE}RoundRectOf_0061 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROUND_RECT_OF_0062
     * @tc.name      TsDrawingSample_RoundRectOf_0062
     * @tc.desc      roundRectOf(screenWidth=20, offsetY=-1) returns 249
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_RoundRectOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RoundRectOf_0062 begin`);
      const actual: RectBox = roundRectOf(20, -1);
      logInfo(`roundRectOf(screenWidth=20, offsetY=-1): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(25);
      logInfo(`roundRectOf(screenWidth=20, offsetY=-1): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(149);
      logInfo(`roundRectOf(screenWidth=20, offsetY=-1): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-10);
      logInfo(`roundRectOf(screenWidth=20, offsetY=-1): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(249);
      logInfo(`${BUNDLE}RoundRectOf_0062 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROUND_RECT_OF_0063
     * @tc.name      TsDrawingSample_RoundRectOf_0063
     * @tc.desc      roundRectOf(screenWidth=20, offsetY=20) returns 270
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_RoundRectOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RoundRectOf_0063 begin`);
      const actual: RectBox = roundRectOf(20, 20);
      logInfo(`roundRectOf(screenWidth=20, offsetY=20): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(25);
      logInfo(`roundRectOf(screenWidth=20, offsetY=20): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(170);
      logInfo(`roundRectOf(screenWidth=20, offsetY=20): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-10);
      logInfo(`roundRectOf(screenWidth=20, offsetY=20): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(270);
      logInfo(`${BUNDLE}RoundRectOf_0063 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROUND_RECT_OF_0064
     * @tc.name      TsDrawingSample_RoundRectOf_0064
     * @tc.desc      roundRectOf(screenWidth=20, offsetY=19) returns 269
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_RoundRectOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RoundRectOf_0064 begin`);
      const actual: RectBox = roundRectOf(20, 19);
      logInfo(`roundRectOf(screenWidth=20, offsetY=19): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(25);
      logInfo(`roundRectOf(screenWidth=20, offsetY=19): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(169);
      logInfo(`roundRectOf(screenWidth=20, offsetY=19): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-10);
      logInfo(`roundRectOf(screenWidth=20, offsetY=19): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(269);
      logInfo(`${BUNDLE}RoundRectOf_0064 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROUND_RECT_OF_0065
     * @tc.name      TsDrawingSample_RoundRectOf_0065
     * @tc.desc      roundRectOf(screenWidth=20, offsetY=21) returns 271
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_RoundRectOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RoundRectOf_0065 begin`);
      const actual: RectBox = roundRectOf(20, 21);
      logInfo(`roundRectOf(screenWidth=20, offsetY=21): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(25);
      logInfo(`roundRectOf(screenWidth=20, offsetY=21): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(171);
      logInfo(`roundRectOf(screenWidth=20, offsetY=21): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-10);
      logInfo(`roundRectOf(screenWidth=20, offsetY=21): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(271);
      logInfo(`${BUNDLE}RoundRectOf_0065 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROUND_RECT_OF_0066
     * @tc.name      TsDrawingSample_RoundRectOf_0066
     * @tc.desc      roundRectOf(screenWidth=20, offsetY=40) returns 290
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_RoundRectOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RoundRectOf_0066 begin`);
      const actual: RectBox = roundRectOf(20, 40);
      logInfo(`roundRectOf(screenWidth=20, offsetY=40): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(25);
      logInfo(`roundRectOf(screenWidth=20, offsetY=40): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(190);
      logInfo(`roundRectOf(screenWidth=20, offsetY=40): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-10);
      logInfo(`roundRectOf(screenWidth=20, offsetY=40): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(290);
      logInfo(`${BUNDLE}RoundRectOf_0066 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROUND_RECT_OF_0067
     * @tc.name      TsDrawingSample_RoundRectOf_0067
     * @tc.desc      roundRectOf(screenWidth=20, offsetY=10) returns 260
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_RoundRectOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RoundRectOf_0067 begin`);
      const actual: RectBox = roundRectOf(20, 10);
      logInfo(`roundRectOf(screenWidth=20, offsetY=10): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(25);
      logInfo(`roundRectOf(screenWidth=20, offsetY=10): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(160);
      logInfo(`roundRectOf(screenWidth=20, offsetY=10): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-10);
      logInfo(`roundRectOf(screenWidth=20, offsetY=10): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(260);
      logInfo(`${BUNDLE}RoundRectOf_0067 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROUND_RECT_OF_0068
     * @tc.name      TsDrawingSample_RoundRectOf_0068
     * @tc.desc      roundRectOf(screenWidth=20, offsetY=2) returns 252
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_RoundRectOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RoundRectOf_0068 begin`);
      const actual: RectBox = roundRectOf(20, 2);
      logInfo(`roundRectOf(screenWidth=20, offsetY=2): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(25);
      logInfo(`roundRectOf(screenWidth=20, offsetY=2): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(152);
      logInfo(`roundRectOf(screenWidth=20, offsetY=2): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-10);
      logInfo(`roundRectOf(screenWidth=20, offsetY=2): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(252);
      logInfo(`${BUNDLE}RoundRectOf_0068 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROUND_RECT_OF_0069
     * @tc.name      TsDrawingSample_RoundRectOf_0069
     * @tc.desc      roundRectOf(screenWidth=20, offsetY=1) returns 251
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_RoundRectOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RoundRectOf_0069 begin`);
      const actual: RectBox = roundRectOf(20, 1);
      logInfo(`roundRectOf(screenWidth=20, offsetY=1): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(25);
      logInfo(`roundRectOf(screenWidth=20, offsetY=1): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(151);
      logInfo(`roundRectOf(screenWidth=20, offsetY=1): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-10);
      logInfo(`roundRectOf(screenWidth=20, offsetY=1): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(251);
      logInfo(`${BUNDLE}RoundRectOf_0069 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROUND_RECT_OF_0070
     * @tc.name      TsDrawingSample_RoundRectOf_0070
     * @tc.desc      roundRectOf(screenWidth=20, offsetY=3) returns 253
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_RoundRectOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RoundRectOf_0070 begin`);
      const actual: RectBox = roundRectOf(20, 3);
      logInfo(`roundRectOf(screenWidth=20, offsetY=3): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(25);
      logInfo(`roundRectOf(screenWidth=20, offsetY=3): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(153);
      logInfo(`roundRectOf(screenWidth=20, offsetY=3): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-10);
      logInfo(`roundRectOf(screenWidth=20, offsetY=3): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(253);
      logInfo(`${BUNDLE}RoundRectOf_0070 end`);
    });
  });
}
