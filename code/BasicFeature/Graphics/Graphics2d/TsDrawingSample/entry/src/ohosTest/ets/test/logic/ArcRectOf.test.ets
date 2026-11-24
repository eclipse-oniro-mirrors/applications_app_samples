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
import { RectBox, arcRectOf } from '../model/DrawingGeometryLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_TsDrawingSample]';
const BUNDLE: string = 'TsDrawingSample_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for arcRectOf (70 cases). */
export default function arcRectOfTest(): void {
  describe('ArcRectOfTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ARC_RECT_OF_0001
     * @tc.name      TsDrawingSample_ArcRectOf_0001
     * @tc.desc      arcRectOf(screenWidth=0, offsetY=-100) returns 250
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TsDrawingSample_ArcRectOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ArcRectOf_0001 begin`);
      const actual: RectBox = arcRectOf(0, -100);
      logInfo(`arcRectOf(screenWidth=0, offsetY=-100): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(-50);
      logInfo(`arcRectOf(screenWidth=0, offsetY=-100): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(50);
      logInfo(`arcRectOf(screenWidth=0, offsetY=-100): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-20);
      logInfo(`arcRectOf(screenWidth=0, offsetY=-100): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(250);
      logInfo(`${BUNDLE}ArcRectOf_0001 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ARC_RECT_OF_0002
     * @tc.name      TsDrawingSample_ArcRectOf_0002
     * @tc.desc      arcRectOf(screenWidth=0, offsetY=-1) returns 349
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TsDrawingSample_ArcRectOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ArcRectOf_0002 begin`);
      const actual: RectBox = arcRectOf(0, -1);
      logInfo(`arcRectOf(screenWidth=0, offsetY=-1): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(-50);
      logInfo(`arcRectOf(screenWidth=0, offsetY=-1): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(149);
      logInfo(`arcRectOf(screenWidth=0, offsetY=-1): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-20);
      logInfo(`arcRectOf(screenWidth=0, offsetY=-1): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(349);
      logInfo(`${BUNDLE}ArcRectOf_0002 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ARC_RECT_OF_0003
     * @tc.name      TsDrawingSample_ArcRectOf_0003
     * @tc.desc      arcRectOf(screenWidth=0, offsetY=3) returns 353
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_ArcRectOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ArcRectOf_0003 begin`);
      const actual: RectBox = arcRectOf(0, 3);
      logInfo(`arcRectOf(screenWidth=0, offsetY=3): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(-50);
      logInfo(`arcRectOf(screenWidth=0, offsetY=3): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(153);
      logInfo(`arcRectOf(screenWidth=0, offsetY=3): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-20);
      logInfo(`arcRectOf(screenWidth=0, offsetY=3): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(353);
      logInfo(`${BUNDLE}ArcRectOf_0003 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ARC_RECT_OF_0004
     * @tc.name      TsDrawingSample_ArcRectOf_0004
     * @tc.desc      arcRectOf(screenWidth=0, offsetY=2) returns 352
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_ArcRectOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ArcRectOf_0004 begin`);
      const actual: RectBox = arcRectOf(0, 2);
      logInfo(`arcRectOf(screenWidth=0, offsetY=2): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(-50);
      logInfo(`arcRectOf(screenWidth=0, offsetY=2): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(152);
      logInfo(`arcRectOf(screenWidth=0, offsetY=2): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-20);
      logInfo(`arcRectOf(screenWidth=0, offsetY=2): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(352);
      logInfo(`${BUNDLE}ArcRectOf_0004 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ARC_RECT_OF_0005
     * @tc.name      TsDrawingSample_ArcRectOf_0005
     * @tc.desc      arcRectOf(screenWidth=0, offsetY=4) returns 354
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_ArcRectOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ArcRectOf_0005 begin`);
      const actual: RectBox = arcRectOf(0, 4);
      logInfo(`arcRectOf(screenWidth=0, offsetY=4): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(-50);
      logInfo(`arcRectOf(screenWidth=0, offsetY=4): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(154);
      logInfo(`arcRectOf(screenWidth=0, offsetY=4): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-20);
      logInfo(`arcRectOf(screenWidth=0, offsetY=4): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(354);
      logInfo(`${BUNDLE}ArcRectOf_0005 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ARC_RECT_OF_0006
     * @tc.name      TsDrawingSample_ArcRectOf_0006
     * @tc.desc      arcRectOf(screenWidth=0, offsetY=50) returns 400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_ArcRectOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ArcRectOf_0006 begin`);
      const actual: RectBox = arcRectOf(0, 50);
      logInfo(`arcRectOf(screenWidth=0, offsetY=50): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(-50);
      logInfo(`arcRectOf(screenWidth=0, offsetY=50): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(200);
      logInfo(`arcRectOf(screenWidth=0, offsetY=50): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-20);
      logInfo(`arcRectOf(screenWidth=0, offsetY=50): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(400);
      logInfo(`${BUNDLE}ArcRectOf_0006 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ARC_RECT_OF_0007
     * @tc.name      TsDrawingSample_ArcRectOf_0007
     * @tc.desc      arcRectOf(screenWidth=0, offsetY=49) returns 399
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_ArcRectOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ArcRectOf_0007 begin`);
      const actual: RectBox = arcRectOf(0, 49);
      logInfo(`arcRectOf(screenWidth=0, offsetY=49): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(-50);
      logInfo(`arcRectOf(screenWidth=0, offsetY=49): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(199);
      logInfo(`arcRectOf(screenWidth=0, offsetY=49): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-20);
      logInfo(`arcRectOf(screenWidth=0, offsetY=49): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(399);
      logInfo(`${BUNDLE}ArcRectOf_0007 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ARC_RECT_OF_0008
     * @tc.name      TsDrawingSample_ArcRectOf_0008
     * @tc.desc      arcRectOf(screenWidth=0, offsetY=51) returns 401
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_ArcRectOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ArcRectOf_0008 begin`);
      const actual: RectBox = arcRectOf(0, 51);
      logInfo(`arcRectOf(screenWidth=0, offsetY=51): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(-50);
      logInfo(`arcRectOf(screenWidth=0, offsetY=51): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(201);
      logInfo(`arcRectOf(screenWidth=0, offsetY=51): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-20);
      logInfo(`arcRectOf(screenWidth=0, offsetY=51): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(401);
      logInfo(`${BUNDLE}ArcRectOf_0008 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ARC_RECT_OF_0009
     * @tc.name      TsDrawingSample_ArcRectOf_0009
     * @tc.desc      arcRectOf(screenWidth=0, offsetY=100) returns 450
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ArcRectOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ArcRectOf_0009 begin`);
      const actual: RectBox = arcRectOf(0, 100);
      logInfo(`arcRectOf(screenWidth=0, offsetY=100): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(-50);
      logInfo(`arcRectOf(screenWidth=0, offsetY=100): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(250);
      logInfo(`arcRectOf(screenWidth=0, offsetY=100): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-20);
      logInfo(`arcRectOf(screenWidth=0, offsetY=100): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(450);
      logInfo(`${BUNDLE}ArcRectOf_0009 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ARC_RECT_OF_0010
     * @tc.name      TsDrawingSample_ArcRectOf_0010
     * @tc.desc      arcRectOf(screenWidth=0, offsetY=25) returns 375
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ArcRectOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ArcRectOf_0010 begin`);
      const actual: RectBox = arcRectOf(0, 25);
      logInfo(`arcRectOf(screenWidth=0, offsetY=25): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(-50);
      logInfo(`arcRectOf(screenWidth=0, offsetY=25): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(175);
      logInfo(`arcRectOf(screenWidth=0, offsetY=25): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-20);
      logInfo(`arcRectOf(screenWidth=0, offsetY=25): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(375);
      logInfo(`${BUNDLE}ArcRectOf_0010 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ARC_RECT_OF_0011
     * @tc.name      TsDrawingSample_ArcRectOf_0011
     * @tc.desc      arcRectOf(screenWidth=0, offsetY=5) returns 355
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_ArcRectOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ArcRectOf_0011 begin`);
      const actual: RectBox = arcRectOf(0, 5);
      logInfo(`arcRectOf(screenWidth=0, offsetY=5): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(-50);
      logInfo(`arcRectOf(screenWidth=0, offsetY=5): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(155);
      logInfo(`arcRectOf(screenWidth=0, offsetY=5): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-20);
      logInfo(`arcRectOf(screenWidth=0, offsetY=5): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(355);
      logInfo(`${BUNDLE}ArcRectOf_0011 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ARC_RECT_OF_0012
     * @tc.name      TsDrawingSample_ArcRectOf_0012
     * @tc.desc      arcRectOf(screenWidth=0, offsetY=20) returns 370
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_ArcRectOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ArcRectOf_0012 begin`);
      const actual: RectBox = arcRectOf(0, 20);
      logInfo(`arcRectOf(screenWidth=0, offsetY=20): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(-50);
      logInfo(`arcRectOf(screenWidth=0, offsetY=20): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(170);
      logInfo(`arcRectOf(screenWidth=0, offsetY=20): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-20);
      logInfo(`arcRectOf(screenWidth=0, offsetY=20): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(370);
      logInfo(`${BUNDLE}ArcRectOf_0012 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ARC_RECT_OF_0013
     * @tc.name      TsDrawingSample_ArcRectOf_0013
     * @tc.desc      arcRectOf(screenWidth=0, offsetY=19) returns 369
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_ArcRectOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ArcRectOf_0013 begin`);
      const actual: RectBox = arcRectOf(0, 19);
      logInfo(`arcRectOf(screenWidth=0, offsetY=19): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(-50);
      logInfo(`arcRectOf(screenWidth=0, offsetY=19): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(169);
      logInfo(`arcRectOf(screenWidth=0, offsetY=19): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-20);
      logInfo(`arcRectOf(screenWidth=0, offsetY=19): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(369);
      logInfo(`${BUNDLE}ArcRectOf_0013 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ARC_RECT_OF_0014
     * @tc.name      TsDrawingSample_ArcRectOf_0014
     * @tc.desc      arcRectOf(screenWidth=0, offsetY=21) returns 371
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_ArcRectOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ArcRectOf_0014 begin`);
      const actual: RectBox = arcRectOf(0, 21);
      logInfo(`arcRectOf(screenWidth=0, offsetY=21): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(-50);
      logInfo(`arcRectOf(screenWidth=0, offsetY=21): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(171);
      logInfo(`arcRectOf(screenWidth=0, offsetY=21): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-20);
      logInfo(`arcRectOf(screenWidth=0, offsetY=21): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(371);
      logInfo(`${BUNDLE}ArcRectOf_0014 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ARC_RECT_OF_0015
     * @tc.name      TsDrawingSample_ArcRectOf_0015
     * @tc.desc      arcRectOf(screenWidth=0, offsetY=40) returns 390
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ArcRectOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ArcRectOf_0015 begin`);
      const actual: RectBox = arcRectOf(0, 40);
      logInfo(`arcRectOf(screenWidth=0, offsetY=40): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(-50);
      logInfo(`arcRectOf(screenWidth=0, offsetY=40): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(190);
      logInfo(`arcRectOf(screenWidth=0, offsetY=40): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-20);
      logInfo(`arcRectOf(screenWidth=0, offsetY=40): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(390);
      logInfo(`${BUNDLE}ArcRectOf_0015 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ARC_RECT_OF_0016
     * @tc.name      TsDrawingSample_ArcRectOf_0016
     * @tc.desc      arcRectOf(screenWidth=0, offsetY=10) returns 360
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ArcRectOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ArcRectOf_0016 begin`);
      const actual: RectBox = arcRectOf(0, 10);
      logInfo(`arcRectOf(screenWidth=0, offsetY=10): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(-50);
      logInfo(`arcRectOf(screenWidth=0, offsetY=10): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(160);
      logInfo(`arcRectOf(screenWidth=0, offsetY=10): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-20);
      logInfo(`arcRectOf(screenWidth=0, offsetY=10): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(360);
      logInfo(`${BUNDLE}ArcRectOf_0016 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ARC_RECT_OF_0017
     * @tc.name      TsDrawingSample_ArcRectOf_0017
     * @tc.desc      arcRectOf(screenWidth=0, offsetY=350) returns 700
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_ArcRectOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ArcRectOf_0017 begin`);
      const actual: RectBox = arcRectOf(0, 350);
      logInfo(`arcRectOf(screenWidth=0, offsetY=350): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(-50);
      logInfo(`arcRectOf(screenWidth=0, offsetY=350): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(500);
      logInfo(`arcRectOf(screenWidth=0, offsetY=350): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-20);
      logInfo(`arcRectOf(screenWidth=0, offsetY=350): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(700);
      logInfo(`${BUNDLE}ArcRectOf_0017 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ARC_RECT_OF_0018
     * @tc.name      TsDrawingSample_ArcRectOf_0018
     * @tc.desc      arcRectOf(screenWidth=0, offsetY=349) returns 699
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_ArcRectOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ArcRectOf_0018 begin`);
      const actual: RectBox = arcRectOf(0, 349);
      logInfo(`arcRectOf(screenWidth=0, offsetY=349): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(-50);
      logInfo(`arcRectOf(screenWidth=0, offsetY=349): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(499);
      logInfo(`arcRectOf(screenWidth=0, offsetY=349): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-20);
      logInfo(`arcRectOf(screenWidth=0, offsetY=349): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(699);
      logInfo(`${BUNDLE}ArcRectOf_0018 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ARC_RECT_OF_0019
     * @tc.name      TsDrawingSample_ArcRectOf_0019
     * @tc.desc      arcRectOf(screenWidth=0, offsetY=351) returns 701
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_ArcRectOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ArcRectOf_0019 begin`);
      const actual: RectBox = arcRectOf(0, 351);
      logInfo(`arcRectOf(screenWidth=0, offsetY=351): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(-50);
      logInfo(`arcRectOf(screenWidth=0, offsetY=351): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(501);
      logInfo(`arcRectOf(screenWidth=0, offsetY=351): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-20);
      logInfo(`arcRectOf(screenWidth=0, offsetY=351): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(701);
      logInfo(`${BUNDLE}ArcRectOf_0019 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ARC_RECT_OF_0020
     * @tc.name      TsDrawingSample_ArcRectOf_0020
     * @tc.desc      arcRectOf(screenWidth=0, offsetY=700) returns 1050
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ArcRectOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ArcRectOf_0020 begin`);
      const actual: RectBox = arcRectOf(0, 700);
      logInfo(`arcRectOf(screenWidth=0, offsetY=700): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(-50);
      logInfo(`arcRectOf(screenWidth=0, offsetY=700): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(850);
      logInfo(`arcRectOf(screenWidth=0, offsetY=700): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-20);
      logInfo(`arcRectOf(screenWidth=0, offsetY=700): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(1050);
      logInfo(`${BUNDLE}ArcRectOf_0020 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ARC_RECT_OF_0021
     * @tc.name      TsDrawingSample_ArcRectOf_0021
     * @tc.desc      arcRectOf(screenWidth=0, offsetY=175) returns 525
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ArcRectOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ArcRectOf_0021 begin`);
      const actual: RectBox = arcRectOf(0, 175);
      logInfo(`arcRectOf(screenWidth=0, offsetY=175): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(-50);
      logInfo(`arcRectOf(screenWidth=0, offsetY=175): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(325);
      logInfo(`arcRectOf(screenWidth=0, offsetY=175): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-20);
      logInfo(`arcRectOf(screenWidth=0, offsetY=175): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(525);
      logInfo(`${BUNDLE}ArcRectOf_0021 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ARC_RECT_OF_0022
     * @tc.name      TsDrawingSample_ArcRectOf_0022
     * @tc.desc      arcRectOf(screenWidth=0, offsetY=0) returns 350
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ArcRectOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ArcRectOf_0022 begin`);
      const actual: RectBox = arcRectOf(0, 0);
      logInfo(`arcRectOf(screenWidth=0, offsetY=0): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(-50);
      logInfo(`arcRectOf(screenWidth=0, offsetY=0): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(150);
      logInfo(`arcRectOf(screenWidth=0, offsetY=0): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-20);
      logInfo(`arcRectOf(screenWidth=0, offsetY=0): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(350);
      logInfo(`${BUNDLE}ArcRectOf_0022 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ARC_RECT_OF_0023
     * @tc.name      TsDrawingSample_ArcRectOf_0023
     * @tc.desc      arcRectOf(screenWidth=0, offsetY=1) returns 351
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ArcRectOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ArcRectOf_0023 begin`);
      const actual: RectBox = arcRectOf(0, 1);
      logInfo(`arcRectOf(screenWidth=0, offsetY=1): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(-50);
      logInfo(`arcRectOf(screenWidth=0, offsetY=1): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(151);
      logInfo(`arcRectOf(screenWidth=0, offsetY=1): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-20);
      logInfo(`arcRectOf(screenWidth=0, offsetY=1): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(351);
      logInfo(`${BUNDLE}ArcRectOf_0023 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ARC_RECT_OF_0024
     * @tc.name      TsDrawingSample_ArcRectOf_0024
     * @tc.desc      arcRectOf(screenWidth=0, offsetY=35) returns 385
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ArcRectOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ArcRectOf_0024 begin`);
      const actual: RectBox = arcRectOf(0, 35);
      logInfo(`arcRectOf(screenWidth=0, offsetY=35): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(-50);
      logInfo(`arcRectOf(screenWidth=0, offsetY=35): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(185);
      logInfo(`arcRectOf(screenWidth=0, offsetY=35): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-20);
      logInfo(`arcRectOf(screenWidth=0, offsetY=35): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(385);
      logInfo(`${BUNDLE}ArcRectOf_0024 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ARC_RECT_OF_0025
     * @tc.name      TsDrawingSample_ArcRectOf_0025
     * @tc.desc      arcRectOf(screenWidth=0, offsetY=70) returns 420
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ArcRectOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ArcRectOf_0025 begin`);
      const actual: RectBox = arcRectOf(0, 70);
      logInfo(`arcRectOf(screenWidth=0, offsetY=70): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(-50);
      logInfo(`arcRectOf(screenWidth=0, offsetY=70): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(220);
      logInfo(`arcRectOf(screenWidth=0, offsetY=70): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-20);
      logInfo(`arcRectOf(screenWidth=0, offsetY=70): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(420);
      logInfo(`${BUNDLE}ArcRectOf_0025 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ARC_RECT_OF_0026
     * @tc.name      TsDrawingSample_ArcRectOf_0026
     * @tc.desc      arcRectOf(screenWidth=0, offsetY=105) returns 455
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ArcRectOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ArcRectOf_0026 begin`);
      const actual: RectBox = arcRectOf(0, 105);
      logInfo(`arcRectOf(screenWidth=0, offsetY=105): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(-50);
      logInfo(`arcRectOf(screenWidth=0, offsetY=105): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(255);
      logInfo(`arcRectOf(screenWidth=0, offsetY=105): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-20);
      logInfo(`arcRectOf(screenWidth=0, offsetY=105): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(455);
      logInfo(`${BUNDLE}ArcRectOf_0026 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ARC_RECT_OF_0027
     * @tc.name      TsDrawingSample_ArcRectOf_0027
     * @tc.desc      arcRectOf(screenWidth=0, offsetY=140) returns 490
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ArcRectOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ArcRectOf_0027 begin`);
      const actual: RectBox = arcRectOf(0, 140);
      logInfo(`arcRectOf(screenWidth=0, offsetY=140): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(-50);
      logInfo(`arcRectOf(screenWidth=0, offsetY=140): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(290);
      logInfo(`arcRectOf(screenWidth=0, offsetY=140): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-20);
      logInfo(`arcRectOf(screenWidth=0, offsetY=140): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(490);
      logInfo(`${BUNDLE}ArcRectOf_0027 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ARC_RECT_OF_0028
     * @tc.name      TsDrawingSample_ArcRectOf_0028
     * @tc.desc      arcRectOf(screenWidth=0, offsetY=210) returns 560
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ArcRectOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ArcRectOf_0028 begin`);
      const actual: RectBox = arcRectOf(0, 210);
      logInfo(`arcRectOf(screenWidth=0, offsetY=210): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(-50);
      logInfo(`arcRectOf(screenWidth=0, offsetY=210): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(360);
      logInfo(`arcRectOf(screenWidth=0, offsetY=210): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-20);
      logInfo(`arcRectOf(screenWidth=0, offsetY=210): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(560);
      logInfo(`${BUNDLE}ArcRectOf_0028 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ARC_RECT_OF_0029
     * @tc.name      TsDrawingSample_ArcRectOf_0029
     * @tc.desc      arcRectOf(screenWidth=0, offsetY=245) returns 595
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ArcRectOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ArcRectOf_0029 begin`);
      const actual: RectBox = arcRectOf(0, 245);
      logInfo(`arcRectOf(screenWidth=0, offsetY=245): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(-50);
      logInfo(`arcRectOf(screenWidth=0, offsetY=245): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(395);
      logInfo(`arcRectOf(screenWidth=0, offsetY=245): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-20);
      logInfo(`arcRectOf(screenWidth=0, offsetY=245): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(595);
      logInfo(`${BUNDLE}ArcRectOf_0029 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ARC_RECT_OF_0030
     * @tc.name      TsDrawingSample_ArcRectOf_0030
     * @tc.desc      arcRectOf(screenWidth=0, offsetY=544) returns 894
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ArcRectOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ArcRectOf_0030 begin`);
      const actual: RectBox = arcRectOf(0, 544);
      logInfo(`arcRectOf(screenWidth=0, offsetY=544): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(-50);
      logInfo(`arcRectOf(screenWidth=0, offsetY=544): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(694);
      logInfo(`arcRectOf(screenWidth=0, offsetY=544): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-20);
      logInfo(`arcRectOf(screenWidth=0, offsetY=544): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(894);
      logInfo(`${BUNDLE}ArcRectOf_0030 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ARC_RECT_OF_0031
     * @tc.name      TsDrawingSample_ArcRectOf_0031
     * @tc.desc      arcRectOf(screenWidth=1, offsetY=-100) returns 250
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_ArcRectOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ArcRectOf_0031 begin`);
      const actual: RectBox = arcRectOf(1, -100);
      logInfo(`arcRectOf(screenWidth=1, offsetY=-100): actual.left=${actual.left}`);
      expect(actual.left).assertClose(-49.25, PRECISION);
      logInfo(`arcRectOf(screenWidth=1, offsetY=-100): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(50);
      logInfo(`arcRectOf(screenWidth=1, offsetY=-100): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-19);
      logInfo(`arcRectOf(screenWidth=1, offsetY=-100): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(250);
      logInfo(`${BUNDLE}ArcRectOf_0031 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ARC_RECT_OF_0032
     * @tc.name      TsDrawingSample_ArcRectOf_0032
     * @tc.desc      arcRectOf(screenWidth=1, offsetY=-1) returns 349
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_ArcRectOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ArcRectOf_0032 begin`);
      const actual: RectBox = arcRectOf(1, -1);
      logInfo(`arcRectOf(screenWidth=1, offsetY=-1): actual.left=${actual.left}`);
      expect(actual.left).assertClose(-49.25, PRECISION);
      logInfo(`arcRectOf(screenWidth=1, offsetY=-1): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(149);
      logInfo(`arcRectOf(screenWidth=1, offsetY=-1): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-19);
      logInfo(`arcRectOf(screenWidth=1, offsetY=-1): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(349);
      logInfo(`${BUNDLE}ArcRectOf_0032 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ARC_RECT_OF_0033
     * @tc.name      TsDrawingSample_ArcRectOf_0033
     * @tc.desc      arcRectOf(screenWidth=1, offsetY=3) returns 353
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_ArcRectOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ArcRectOf_0033 begin`);
      const actual: RectBox = arcRectOf(1, 3);
      logInfo(`arcRectOf(screenWidth=1, offsetY=3): actual.left=${actual.left}`);
      expect(actual.left).assertClose(-49.25, PRECISION);
      logInfo(`arcRectOf(screenWidth=1, offsetY=3): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(153);
      logInfo(`arcRectOf(screenWidth=1, offsetY=3): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-19);
      logInfo(`arcRectOf(screenWidth=1, offsetY=3): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(353);
      logInfo(`${BUNDLE}ArcRectOf_0033 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ARC_RECT_OF_0034
     * @tc.name      TsDrawingSample_ArcRectOf_0034
     * @tc.desc      arcRectOf(screenWidth=1, offsetY=2) returns 352
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_ArcRectOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ArcRectOf_0034 begin`);
      const actual: RectBox = arcRectOf(1, 2);
      logInfo(`arcRectOf(screenWidth=1, offsetY=2): actual.left=${actual.left}`);
      expect(actual.left).assertClose(-49.25, PRECISION);
      logInfo(`arcRectOf(screenWidth=1, offsetY=2): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(152);
      logInfo(`arcRectOf(screenWidth=1, offsetY=2): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-19);
      logInfo(`arcRectOf(screenWidth=1, offsetY=2): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(352);
      logInfo(`${BUNDLE}ArcRectOf_0034 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ARC_RECT_OF_0035
     * @tc.name      TsDrawingSample_ArcRectOf_0035
     * @tc.desc      arcRectOf(screenWidth=1, offsetY=4) returns 354
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_ArcRectOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ArcRectOf_0035 begin`);
      const actual: RectBox = arcRectOf(1, 4);
      logInfo(`arcRectOf(screenWidth=1, offsetY=4): actual.left=${actual.left}`);
      expect(actual.left).assertClose(-49.25, PRECISION);
      logInfo(`arcRectOf(screenWidth=1, offsetY=4): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(154);
      logInfo(`arcRectOf(screenWidth=1, offsetY=4): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-19);
      logInfo(`arcRectOf(screenWidth=1, offsetY=4): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(354);
      logInfo(`${BUNDLE}ArcRectOf_0035 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ARC_RECT_OF_0036
     * @tc.name      TsDrawingSample_ArcRectOf_0036
     * @tc.desc      arcRectOf(screenWidth=1, offsetY=50) returns 400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_ArcRectOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ArcRectOf_0036 begin`);
      const actual: RectBox = arcRectOf(1, 50);
      logInfo(`arcRectOf(screenWidth=1, offsetY=50): actual.left=${actual.left}`);
      expect(actual.left).assertClose(-49.25, PRECISION);
      logInfo(`arcRectOf(screenWidth=1, offsetY=50): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(200);
      logInfo(`arcRectOf(screenWidth=1, offsetY=50): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-19);
      logInfo(`arcRectOf(screenWidth=1, offsetY=50): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(400);
      logInfo(`${BUNDLE}ArcRectOf_0036 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ARC_RECT_OF_0037
     * @tc.name      TsDrawingSample_ArcRectOf_0037
     * @tc.desc      arcRectOf(screenWidth=1, offsetY=49) returns 399
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_ArcRectOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ArcRectOf_0037 begin`);
      const actual: RectBox = arcRectOf(1, 49);
      logInfo(`arcRectOf(screenWidth=1, offsetY=49): actual.left=${actual.left}`);
      expect(actual.left).assertClose(-49.25, PRECISION);
      logInfo(`arcRectOf(screenWidth=1, offsetY=49): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(199);
      logInfo(`arcRectOf(screenWidth=1, offsetY=49): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-19);
      logInfo(`arcRectOf(screenWidth=1, offsetY=49): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(399);
      logInfo(`${BUNDLE}ArcRectOf_0037 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ARC_RECT_OF_0038
     * @tc.name      TsDrawingSample_ArcRectOf_0038
     * @tc.desc      arcRectOf(screenWidth=1, offsetY=51) returns 401
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_ArcRectOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ArcRectOf_0038 begin`);
      const actual: RectBox = arcRectOf(1, 51);
      logInfo(`arcRectOf(screenWidth=1, offsetY=51): actual.left=${actual.left}`);
      expect(actual.left).assertClose(-49.25, PRECISION);
      logInfo(`arcRectOf(screenWidth=1, offsetY=51): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(201);
      logInfo(`arcRectOf(screenWidth=1, offsetY=51): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-19);
      logInfo(`arcRectOf(screenWidth=1, offsetY=51): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(401);
      logInfo(`${BUNDLE}ArcRectOf_0038 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ARC_RECT_OF_0039
     * @tc.name      TsDrawingSample_ArcRectOf_0039
     * @tc.desc      arcRectOf(screenWidth=1, offsetY=100) returns 450
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ArcRectOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ArcRectOf_0039 begin`);
      const actual: RectBox = arcRectOf(1, 100);
      logInfo(`arcRectOf(screenWidth=1, offsetY=100): actual.left=${actual.left}`);
      expect(actual.left).assertClose(-49.25, PRECISION);
      logInfo(`arcRectOf(screenWidth=1, offsetY=100): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(250);
      logInfo(`arcRectOf(screenWidth=1, offsetY=100): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-19);
      logInfo(`arcRectOf(screenWidth=1, offsetY=100): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(450);
      logInfo(`${BUNDLE}ArcRectOf_0039 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ARC_RECT_OF_0040
     * @tc.name      TsDrawingSample_ArcRectOf_0040
     * @tc.desc      arcRectOf(screenWidth=1, offsetY=25) returns 375
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ArcRectOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ArcRectOf_0040 begin`);
      const actual: RectBox = arcRectOf(1, 25);
      logInfo(`arcRectOf(screenWidth=1, offsetY=25): actual.left=${actual.left}`);
      expect(actual.left).assertClose(-49.25, PRECISION);
      logInfo(`arcRectOf(screenWidth=1, offsetY=25): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(175);
      logInfo(`arcRectOf(screenWidth=1, offsetY=25): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-19);
      logInfo(`arcRectOf(screenWidth=1, offsetY=25): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(375);
      logInfo(`${BUNDLE}ArcRectOf_0040 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ARC_RECT_OF_0041
     * @tc.name      TsDrawingSample_ArcRectOf_0041
     * @tc.desc      arcRectOf(screenWidth=1, offsetY=5) returns 355
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_ArcRectOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ArcRectOf_0041 begin`);
      const actual: RectBox = arcRectOf(1, 5);
      logInfo(`arcRectOf(screenWidth=1, offsetY=5): actual.left=${actual.left}`);
      expect(actual.left).assertClose(-49.25, PRECISION);
      logInfo(`arcRectOf(screenWidth=1, offsetY=5): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(155);
      logInfo(`arcRectOf(screenWidth=1, offsetY=5): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-19);
      logInfo(`arcRectOf(screenWidth=1, offsetY=5): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(355);
      logInfo(`${BUNDLE}ArcRectOf_0041 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ARC_RECT_OF_0042
     * @tc.name      TsDrawingSample_ArcRectOf_0042
     * @tc.desc      arcRectOf(screenWidth=1, offsetY=20) returns 370
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_ArcRectOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ArcRectOf_0042 begin`);
      const actual: RectBox = arcRectOf(1, 20);
      logInfo(`arcRectOf(screenWidth=1, offsetY=20): actual.left=${actual.left}`);
      expect(actual.left).assertClose(-49.25, PRECISION);
      logInfo(`arcRectOf(screenWidth=1, offsetY=20): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(170);
      logInfo(`arcRectOf(screenWidth=1, offsetY=20): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-19);
      logInfo(`arcRectOf(screenWidth=1, offsetY=20): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(370);
      logInfo(`${BUNDLE}ArcRectOf_0042 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ARC_RECT_OF_0043
     * @tc.name      TsDrawingSample_ArcRectOf_0043
     * @tc.desc      arcRectOf(screenWidth=1, offsetY=19) returns 369
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_ArcRectOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ArcRectOf_0043 begin`);
      const actual: RectBox = arcRectOf(1, 19);
      logInfo(`arcRectOf(screenWidth=1, offsetY=19): actual.left=${actual.left}`);
      expect(actual.left).assertClose(-49.25, PRECISION);
      logInfo(`arcRectOf(screenWidth=1, offsetY=19): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(169);
      logInfo(`arcRectOf(screenWidth=1, offsetY=19): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-19);
      logInfo(`arcRectOf(screenWidth=1, offsetY=19): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(369);
      logInfo(`${BUNDLE}ArcRectOf_0043 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ARC_RECT_OF_0044
     * @tc.name      TsDrawingSample_ArcRectOf_0044
     * @tc.desc      arcRectOf(screenWidth=1, offsetY=21) returns 371
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_ArcRectOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ArcRectOf_0044 begin`);
      const actual: RectBox = arcRectOf(1, 21);
      logInfo(`arcRectOf(screenWidth=1, offsetY=21): actual.left=${actual.left}`);
      expect(actual.left).assertClose(-49.25, PRECISION);
      logInfo(`arcRectOf(screenWidth=1, offsetY=21): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(171);
      logInfo(`arcRectOf(screenWidth=1, offsetY=21): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-19);
      logInfo(`arcRectOf(screenWidth=1, offsetY=21): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(371);
      logInfo(`${BUNDLE}ArcRectOf_0044 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ARC_RECT_OF_0045
     * @tc.name      TsDrawingSample_ArcRectOf_0045
     * @tc.desc      arcRectOf(screenWidth=1, offsetY=40) returns 390
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ArcRectOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ArcRectOf_0045 begin`);
      const actual: RectBox = arcRectOf(1, 40);
      logInfo(`arcRectOf(screenWidth=1, offsetY=40): actual.left=${actual.left}`);
      expect(actual.left).assertClose(-49.25, PRECISION);
      logInfo(`arcRectOf(screenWidth=1, offsetY=40): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(190);
      logInfo(`arcRectOf(screenWidth=1, offsetY=40): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-19);
      logInfo(`arcRectOf(screenWidth=1, offsetY=40): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(390);
      logInfo(`${BUNDLE}ArcRectOf_0045 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ARC_RECT_OF_0046
     * @tc.name      TsDrawingSample_ArcRectOf_0046
     * @tc.desc      arcRectOf(screenWidth=1, offsetY=10) returns 360
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ArcRectOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ArcRectOf_0046 begin`);
      const actual: RectBox = arcRectOf(1, 10);
      logInfo(`arcRectOf(screenWidth=1, offsetY=10): actual.left=${actual.left}`);
      expect(actual.left).assertClose(-49.25, PRECISION);
      logInfo(`arcRectOf(screenWidth=1, offsetY=10): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(160);
      logInfo(`arcRectOf(screenWidth=1, offsetY=10): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-19);
      logInfo(`arcRectOf(screenWidth=1, offsetY=10): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(360);
      logInfo(`${BUNDLE}ArcRectOf_0046 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ARC_RECT_OF_0047
     * @tc.name      TsDrawingSample_ArcRectOf_0047
     * @tc.desc      arcRectOf(screenWidth=1, offsetY=350) returns 700
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_ArcRectOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ArcRectOf_0047 begin`);
      const actual: RectBox = arcRectOf(1, 350);
      logInfo(`arcRectOf(screenWidth=1, offsetY=350): actual.left=${actual.left}`);
      expect(actual.left).assertClose(-49.25, PRECISION);
      logInfo(`arcRectOf(screenWidth=1, offsetY=350): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(500);
      logInfo(`arcRectOf(screenWidth=1, offsetY=350): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-19);
      logInfo(`arcRectOf(screenWidth=1, offsetY=350): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(700);
      logInfo(`${BUNDLE}ArcRectOf_0047 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ARC_RECT_OF_0048
     * @tc.name      TsDrawingSample_ArcRectOf_0048
     * @tc.desc      arcRectOf(screenWidth=1, offsetY=349) returns 699
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_ArcRectOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ArcRectOf_0048 begin`);
      const actual: RectBox = arcRectOf(1, 349);
      logInfo(`arcRectOf(screenWidth=1, offsetY=349): actual.left=${actual.left}`);
      expect(actual.left).assertClose(-49.25, PRECISION);
      logInfo(`arcRectOf(screenWidth=1, offsetY=349): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(499);
      logInfo(`arcRectOf(screenWidth=1, offsetY=349): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-19);
      logInfo(`arcRectOf(screenWidth=1, offsetY=349): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(699);
      logInfo(`${BUNDLE}ArcRectOf_0048 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ARC_RECT_OF_0049
     * @tc.name      TsDrawingSample_ArcRectOf_0049
     * @tc.desc      arcRectOf(screenWidth=1, offsetY=351) returns 701
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_ArcRectOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ArcRectOf_0049 begin`);
      const actual: RectBox = arcRectOf(1, 351);
      logInfo(`arcRectOf(screenWidth=1, offsetY=351): actual.left=${actual.left}`);
      expect(actual.left).assertClose(-49.25, PRECISION);
      logInfo(`arcRectOf(screenWidth=1, offsetY=351): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(501);
      logInfo(`arcRectOf(screenWidth=1, offsetY=351): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-19);
      logInfo(`arcRectOf(screenWidth=1, offsetY=351): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(701);
      logInfo(`${BUNDLE}ArcRectOf_0049 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ARC_RECT_OF_0050
     * @tc.name      TsDrawingSample_ArcRectOf_0050
     * @tc.desc      arcRectOf(screenWidth=1, offsetY=700) returns 1050
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ArcRectOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ArcRectOf_0050 begin`);
      const actual: RectBox = arcRectOf(1, 700);
      logInfo(`arcRectOf(screenWidth=1, offsetY=700): actual.left=${actual.left}`);
      expect(actual.left).assertClose(-49.25, PRECISION);
      logInfo(`arcRectOf(screenWidth=1, offsetY=700): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(850);
      logInfo(`arcRectOf(screenWidth=1, offsetY=700): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-19);
      logInfo(`arcRectOf(screenWidth=1, offsetY=700): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(1050);
      logInfo(`${BUNDLE}ArcRectOf_0050 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ARC_RECT_OF_0051
     * @tc.name      TsDrawingSample_ArcRectOf_0051
     * @tc.desc      arcRectOf(screenWidth=1, offsetY=175) returns 525
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ArcRectOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ArcRectOf_0051 begin`);
      const actual: RectBox = arcRectOf(1, 175);
      logInfo(`arcRectOf(screenWidth=1, offsetY=175): actual.left=${actual.left}`);
      expect(actual.left).assertClose(-49.25, PRECISION);
      logInfo(`arcRectOf(screenWidth=1, offsetY=175): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(325);
      logInfo(`arcRectOf(screenWidth=1, offsetY=175): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-19);
      logInfo(`arcRectOf(screenWidth=1, offsetY=175): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(525);
      logInfo(`${BUNDLE}ArcRectOf_0051 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ARC_RECT_OF_0052
     * @tc.name      TsDrawingSample_ArcRectOf_0052
     * @tc.desc      arcRectOf(screenWidth=1, offsetY=0) returns 350
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ArcRectOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ArcRectOf_0052 begin`);
      const actual: RectBox = arcRectOf(1, 0);
      logInfo(`arcRectOf(screenWidth=1, offsetY=0): actual.left=${actual.left}`);
      expect(actual.left).assertClose(-49.25, PRECISION);
      logInfo(`arcRectOf(screenWidth=1, offsetY=0): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(150);
      logInfo(`arcRectOf(screenWidth=1, offsetY=0): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-19);
      logInfo(`arcRectOf(screenWidth=1, offsetY=0): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(350);
      logInfo(`${BUNDLE}ArcRectOf_0052 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ARC_RECT_OF_0053
     * @tc.name      TsDrawingSample_ArcRectOf_0053
     * @tc.desc      arcRectOf(screenWidth=1, offsetY=1) returns 351
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ArcRectOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ArcRectOf_0053 begin`);
      const actual: RectBox = arcRectOf(1, 1);
      logInfo(`arcRectOf(screenWidth=1, offsetY=1): actual.left=${actual.left}`);
      expect(actual.left).assertClose(-49.25, PRECISION);
      logInfo(`arcRectOf(screenWidth=1, offsetY=1): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(151);
      logInfo(`arcRectOf(screenWidth=1, offsetY=1): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-19);
      logInfo(`arcRectOf(screenWidth=1, offsetY=1): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(351);
      logInfo(`${BUNDLE}ArcRectOf_0053 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ARC_RECT_OF_0054
     * @tc.name      TsDrawingSample_ArcRectOf_0054
     * @tc.desc      arcRectOf(screenWidth=1, offsetY=35) returns 385
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ArcRectOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ArcRectOf_0054 begin`);
      const actual: RectBox = arcRectOf(1, 35);
      logInfo(`arcRectOf(screenWidth=1, offsetY=35): actual.left=${actual.left}`);
      expect(actual.left).assertClose(-49.25, PRECISION);
      logInfo(`arcRectOf(screenWidth=1, offsetY=35): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(185);
      logInfo(`arcRectOf(screenWidth=1, offsetY=35): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-19);
      logInfo(`arcRectOf(screenWidth=1, offsetY=35): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(385);
      logInfo(`${BUNDLE}ArcRectOf_0054 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ARC_RECT_OF_0055
     * @tc.name      TsDrawingSample_ArcRectOf_0055
     * @tc.desc      arcRectOf(screenWidth=1, offsetY=70) returns 420
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ArcRectOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ArcRectOf_0055 begin`);
      const actual: RectBox = arcRectOf(1, 70);
      logInfo(`arcRectOf(screenWidth=1, offsetY=70): actual.left=${actual.left}`);
      expect(actual.left).assertClose(-49.25, PRECISION);
      logInfo(`arcRectOf(screenWidth=1, offsetY=70): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(220);
      logInfo(`arcRectOf(screenWidth=1, offsetY=70): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-19);
      logInfo(`arcRectOf(screenWidth=1, offsetY=70): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(420);
      logInfo(`${BUNDLE}ArcRectOf_0055 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ARC_RECT_OF_0056
     * @tc.name      TsDrawingSample_ArcRectOf_0056
     * @tc.desc      arcRectOf(screenWidth=1, offsetY=105) returns 455
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ArcRectOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ArcRectOf_0056 begin`);
      const actual: RectBox = arcRectOf(1, 105);
      logInfo(`arcRectOf(screenWidth=1, offsetY=105): actual.left=${actual.left}`);
      expect(actual.left).assertClose(-49.25, PRECISION);
      logInfo(`arcRectOf(screenWidth=1, offsetY=105): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(255);
      logInfo(`arcRectOf(screenWidth=1, offsetY=105): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-19);
      logInfo(`arcRectOf(screenWidth=1, offsetY=105): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(455);
      logInfo(`${BUNDLE}ArcRectOf_0056 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ARC_RECT_OF_0057
     * @tc.name      TsDrawingSample_ArcRectOf_0057
     * @tc.desc      arcRectOf(screenWidth=1, offsetY=140) returns 490
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ArcRectOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ArcRectOf_0057 begin`);
      const actual: RectBox = arcRectOf(1, 140);
      logInfo(`arcRectOf(screenWidth=1, offsetY=140): actual.left=${actual.left}`);
      expect(actual.left).assertClose(-49.25, PRECISION);
      logInfo(`arcRectOf(screenWidth=1, offsetY=140): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(290);
      logInfo(`arcRectOf(screenWidth=1, offsetY=140): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-19);
      logInfo(`arcRectOf(screenWidth=1, offsetY=140): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(490);
      logInfo(`${BUNDLE}ArcRectOf_0057 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ARC_RECT_OF_0058
     * @tc.name      TsDrawingSample_ArcRectOf_0058
     * @tc.desc      arcRectOf(screenWidth=1, offsetY=210) returns 560
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ArcRectOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ArcRectOf_0058 begin`);
      const actual: RectBox = arcRectOf(1, 210);
      logInfo(`arcRectOf(screenWidth=1, offsetY=210): actual.left=${actual.left}`);
      expect(actual.left).assertClose(-49.25, PRECISION);
      logInfo(`arcRectOf(screenWidth=1, offsetY=210): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(360);
      logInfo(`arcRectOf(screenWidth=1, offsetY=210): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-19);
      logInfo(`arcRectOf(screenWidth=1, offsetY=210): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(560);
      logInfo(`${BUNDLE}ArcRectOf_0058 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ARC_RECT_OF_0059
     * @tc.name      TsDrawingSample_ArcRectOf_0059
     * @tc.desc      arcRectOf(screenWidth=1, offsetY=245) returns 595
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ArcRectOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ArcRectOf_0059 begin`);
      const actual: RectBox = arcRectOf(1, 245);
      logInfo(`arcRectOf(screenWidth=1, offsetY=245): actual.left=${actual.left}`);
      expect(actual.left).assertClose(-49.25, PRECISION);
      logInfo(`arcRectOf(screenWidth=1, offsetY=245): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(395);
      logInfo(`arcRectOf(screenWidth=1, offsetY=245): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-19);
      logInfo(`arcRectOf(screenWidth=1, offsetY=245): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(595);
      logInfo(`${BUNDLE}ArcRectOf_0059 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ARC_RECT_OF_0060
     * @tc.name      TsDrawingSample_ArcRectOf_0060
     * @tc.desc      arcRectOf(screenWidth=1, offsetY=544) returns 894
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ArcRectOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ArcRectOf_0060 begin`);
      const actual: RectBox = arcRectOf(1, 544);
      logInfo(`arcRectOf(screenWidth=1, offsetY=544): actual.left=${actual.left}`);
      expect(actual.left).assertClose(-49.25, PRECISION);
      logInfo(`arcRectOf(screenWidth=1, offsetY=544): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(694);
      logInfo(`arcRectOf(screenWidth=1, offsetY=544): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-19);
      logInfo(`arcRectOf(screenWidth=1, offsetY=544): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(894);
      logInfo(`${BUNDLE}ArcRectOf_0060 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ARC_RECT_OF_0061
     * @tc.name      TsDrawingSample_ArcRectOf_0061
     * @tc.desc      arcRectOf(screenWidth=3, offsetY=-100) returns 250
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_ArcRectOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ArcRectOf_0061 begin`);
      const actual: RectBox = arcRectOf(3, -100);
      logInfo(`arcRectOf(screenWidth=3, offsetY=-100): actual.left=${actual.left}`);
      expect(actual.left).assertClose(-47.75, PRECISION);
      logInfo(`arcRectOf(screenWidth=3, offsetY=-100): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(50);
      logInfo(`arcRectOf(screenWidth=3, offsetY=-100): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-17);
      logInfo(`arcRectOf(screenWidth=3, offsetY=-100): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(250);
      logInfo(`${BUNDLE}ArcRectOf_0061 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ARC_RECT_OF_0062
     * @tc.name      TsDrawingSample_ArcRectOf_0062
     * @tc.desc      arcRectOf(screenWidth=3, offsetY=-1) returns 349
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_ArcRectOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ArcRectOf_0062 begin`);
      const actual: RectBox = arcRectOf(3, -1);
      logInfo(`arcRectOf(screenWidth=3, offsetY=-1): actual.left=${actual.left}`);
      expect(actual.left).assertClose(-47.75, PRECISION);
      logInfo(`arcRectOf(screenWidth=3, offsetY=-1): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(149);
      logInfo(`arcRectOf(screenWidth=3, offsetY=-1): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-17);
      logInfo(`arcRectOf(screenWidth=3, offsetY=-1): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(349);
      logInfo(`${BUNDLE}ArcRectOf_0062 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ARC_RECT_OF_0063
     * @tc.name      TsDrawingSample_ArcRectOf_0063
     * @tc.desc      arcRectOf(screenWidth=3, offsetY=3) returns 353
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_ArcRectOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ArcRectOf_0063 begin`);
      const actual: RectBox = arcRectOf(3, 3);
      logInfo(`arcRectOf(screenWidth=3, offsetY=3): actual.left=${actual.left}`);
      expect(actual.left).assertClose(-47.75, PRECISION);
      logInfo(`arcRectOf(screenWidth=3, offsetY=3): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(153);
      logInfo(`arcRectOf(screenWidth=3, offsetY=3): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-17);
      logInfo(`arcRectOf(screenWidth=3, offsetY=3): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(353);
      logInfo(`${BUNDLE}ArcRectOf_0063 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ARC_RECT_OF_0064
     * @tc.name      TsDrawingSample_ArcRectOf_0064
     * @tc.desc      arcRectOf(screenWidth=3, offsetY=2) returns 352
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_ArcRectOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ArcRectOf_0064 begin`);
      const actual: RectBox = arcRectOf(3, 2);
      logInfo(`arcRectOf(screenWidth=3, offsetY=2): actual.left=${actual.left}`);
      expect(actual.left).assertClose(-47.75, PRECISION);
      logInfo(`arcRectOf(screenWidth=3, offsetY=2): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(152);
      logInfo(`arcRectOf(screenWidth=3, offsetY=2): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-17);
      logInfo(`arcRectOf(screenWidth=3, offsetY=2): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(352);
      logInfo(`${BUNDLE}ArcRectOf_0064 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ARC_RECT_OF_0065
     * @tc.name      TsDrawingSample_ArcRectOf_0065
     * @tc.desc      arcRectOf(screenWidth=3, offsetY=4) returns 354
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_ArcRectOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ArcRectOf_0065 begin`);
      const actual: RectBox = arcRectOf(3, 4);
      logInfo(`arcRectOf(screenWidth=3, offsetY=4): actual.left=${actual.left}`);
      expect(actual.left).assertClose(-47.75, PRECISION);
      logInfo(`arcRectOf(screenWidth=3, offsetY=4): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(154);
      logInfo(`arcRectOf(screenWidth=3, offsetY=4): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-17);
      logInfo(`arcRectOf(screenWidth=3, offsetY=4): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(354);
      logInfo(`${BUNDLE}ArcRectOf_0065 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ARC_RECT_OF_0066
     * @tc.name      TsDrawingSample_ArcRectOf_0066
     * @tc.desc      arcRectOf(screenWidth=3, offsetY=50) returns 400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_ArcRectOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ArcRectOf_0066 begin`);
      const actual: RectBox = arcRectOf(3, 50);
      logInfo(`arcRectOf(screenWidth=3, offsetY=50): actual.left=${actual.left}`);
      expect(actual.left).assertClose(-47.75, PRECISION);
      logInfo(`arcRectOf(screenWidth=3, offsetY=50): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(200);
      logInfo(`arcRectOf(screenWidth=3, offsetY=50): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-17);
      logInfo(`arcRectOf(screenWidth=3, offsetY=50): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(400);
      logInfo(`${BUNDLE}ArcRectOf_0066 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ARC_RECT_OF_0067
     * @tc.name      TsDrawingSample_ArcRectOf_0067
     * @tc.desc      arcRectOf(screenWidth=3, offsetY=49) returns 399
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_ArcRectOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ArcRectOf_0067 begin`);
      const actual: RectBox = arcRectOf(3, 49);
      logInfo(`arcRectOf(screenWidth=3, offsetY=49): actual.left=${actual.left}`);
      expect(actual.left).assertClose(-47.75, PRECISION);
      logInfo(`arcRectOf(screenWidth=3, offsetY=49): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(199);
      logInfo(`arcRectOf(screenWidth=3, offsetY=49): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-17);
      logInfo(`arcRectOf(screenWidth=3, offsetY=49): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(399);
      logInfo(`${BUNDLE}ArcRectOf_0067 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ARC_RECT_OF_0068
     * @tc.name      TsDrawingSample_ArcRectOf_0068
     * @tc.desc      arcRectOf(screenWidth=3, offsetY=51) returns 401
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_ArcRectOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ArcRectOf_0068 begin`);
      const actual: RectBox = arcRectOf(3, 51);
      logInfo(`arcRectOf(screenWidth=3, offsetY=51): actual.left=${actual.left}`);
      expect(actual.left).assertClose(-47.75, PRECISION);
      logInfo(`arcRectOf(screenWidth=3, offsetY=51): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(201);
      logInfo(`arcRectOf(screenWidth=3, offsetY=51): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-17);
      logInfo(`arcRectOf(screenWidth=3, offsetY=51): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(401);
      logInfo(`${BUNDLE}ArcRectOf_0068 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ARC_RECT_OF_0069
     * @tc.name      TsDrawingSample_ArcRectOf_0069
     * @tc.desc      arcRectOf(screenWidth=3, offsetY=100) returns 450
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_ArcRectOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ArcRectOf_0069 begin`);
      const actual: RectBox = arcRectOf(3, 100);
      logInfo(`arcRectOf(screenWidth=3, offsetY=100): actual.left=${actual.left}`);
      expect(actual.left).assertClose(-47.75, PRECISION);
      logInfo(`arcRectOf(screenWidth=3, offsetY=100): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(250);
      logInfo(`arcRectOf(screenWidth=3, offsetY=100): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-17);
      logInfo(`arcRectOf(screenWidth=3, offsetY=100): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(450);
      logInfo(`${BUNDLE}ArcRectOf_0069 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ARC_RECT_OF_0070
     * @tc.name      TsDrawingSample_ArcRectOf_0070
     * @tc.desc      arcRectOf(screenWidth=3, offsetY=25) returns 375
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_ArcRectOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ArcRectOf_0070 begin`);
      const actual: RectBox = arcRectOf(3, 25);
      logInfo(`arcRectOf(screenWidth=3, offsetY=25): actual.left=${actual.left}`);
      expect(actual.left).assertClose(-47.75, PRECISION);
      logInfo(`arcRectOf(screenWidth=3, offsetY=25): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(175);
      logInfo(`arcRectOf(screenWidth=3, offsetY=25): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-17);
      logInfo(`arcRectOf(screenWidth=3, offsetY=25): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(375);
      logInfo(`${BUNDLE}ArcRectOf_0070 end`);
    });
  });
}
