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
import { RectBox, clipRectOf } from '../model/DrawingGeometryLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_TsDrawingSample]';
const BUNDLE: string = 'TsDrawingSample_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for clipRectOf (70 cases). */
export default function clipRectOfTest(): void {
  describe('ClipRectOfTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CLIP_RECT_OF_0001
     * @tc.name      TsDrawingSample_ClipRectOf_0001
     * @tc.desc      clipRectOf(screenWidth=0) returns 850
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TsDrawingSample_ClipRectOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ClipRectOf_0001 begin`);
      const actual: RectBox = clipRectOf(0);
      logInfo(`clipRectOf(screenWidth=0): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(10);
      logInfo(`clipRectOf(screenWidth=0): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(600);
      logInfo(`clipRectOf(screenWidth=0): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(690);
      logInfo(`clipRectOf(screenWidth=0): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(850);
      logInfo(`${BUNDLE}ClipRectOf_0001 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CLIP_RECT_OF_0002
     * @tc.name      TsDrawingSample_ClipRectOf_0002
     * @tc.desc      clipRectOf(screenWidth=1) returns 850.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TsDrawingSample_ClipRectOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ClipRectOf_0002 begin`);
      const actual: RectBox = clipRectOf(1);
      logInfo(`clipRectOf(screenWidth=1): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(10);
      logInfo(`clipRectOf(screenWidth=1): actual.top=${actual.top}`);
      expect(actual.top).assertClose(600.5, PRECISION);
      logInfo(`clipRectOf(screenWidth=1): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(690);
      logInfo(`clipRectOf(screenWidth=1): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertClose(850.5, PRECISION);
      logInfo(`${BUNDLE}ClipRectOf_0002 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CLIP_RECT_OF_0003
     * @tc.name      TsDrawingSample_ClipRectOf_0003
     * @tc.desc      clipRectOf(screenWidth=10) returns 855
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_ClipRectOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ClipRectOf_0003 begin`);
      const actual: RectBox = clipRectOf(10);
      logInfo(`clipRectOf(screenWidth=10): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(10);
      logInfo(`clipRectOf(screenWidth=10): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(605);
      logInfo(`clipRectOf(screenWidth=10): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(690);
      logInfo(`clipRectOf(screenWidth=10): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(855);
      logInfo(`${BUNDLE}ClipRectOf_0003 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CLIP_RECT_OF_0004
     * @tc.name      TsDrawingSample_ClipRectOf_0004
     * @tc.desc      clipRectOf(screenWidth=9) returns 854.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_ClipRectOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ClipRectOf_0004 begin`);
      const actual: RectBox = clipRectOf(9);
      logInfo(`clipRectOf(screenWidth=9): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(10);
      logInfo(`clipRectOf(screenWidth=9): actual.top=${actual.top}`);
      expect(actual.top).assertClose(604.5, PRECISION);
      logInfo(`clipRectOf(screenWidth=9): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(690);
      logInfo(`clipRectOf(screenWidth=9): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertClose(854.5, PRECISION);
      logInfo(`${BUNDLE}ClipRectOf_0004 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CLIP_RECT_OF_0005
     * @tc.name      TsDrawingSample_ClipRectOf_0005
     * @tc.desc      clipRectOf(screenWidth=11) returns 855.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_ClipRectOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ClipRectOf_0005 begin`);
      const actual: RectBox = clipRectOf(11);
      logInfo(`clipRectOf(screenWidth=11): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(10);
      logInfo(`clipRectOf(screenWidth=11): actual.top=${actual.top}`);
      expect(actual.top).assertClose(605.5, PRECISION);
      logInfo(`clipRectOf(screenWidth=11): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(690);
      logInfo(`clipRectOf(screenWidth=11): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertClose(855.5, PRECISION);
      logInfo(`${BUNDLE}ClipRectOf_0005 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CLIP_RECT_OF_0006
     * @tc.name      TsDrawingSample_ClipRectOf_0006
     * @tc.desc      clipRectOf(screenWidth=20) returns 860
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ClipRectOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClipRectOf_0006 begin`);
      const actual: RectBox = clipRectOf(20);
      logInfo(`clipRectOf(screenWidth=20): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(10);
      logInfo(`clipRectOf(screenWidth=20): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(610);
      logInfo(`clipRectOf(screenWidth=20): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(690);
      logInfo(`clipRectOf(screenWidth=20): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(860);
      logInfo(`${BUNDLE}ClipRectOf_0006 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CLIP_RECT_OF_0007
     * @tc.name      TsDrawingSample_ClipRectOf_0007
     * @tc.desc      clipRectOf(screenWidth=5) returns 852.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ClipRectOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClipRectOf_0007 begin`);
      const actual: RectBox = clipRectOf(5);
      logInfo(`clipRectOf(screenWidth=5): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(10);
      logInfo(`clipRectOf(screenWidth=5): actual.top=${actual.top}`);
      expect(actual.top).assertClose(602.5, PRECISION);
      logInfo(`clipRectOf(screenWidth=5): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(690);
      logInfo(`clipRectOf(screenWidth=5): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertClose(852.5, PRECISION);
      logInfo(`${BUNDLE}ClipRectOf_0007 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CLIP_RECT_OF_0008
     * @tc.name      TsDrawingSample_ClipRectOf_0008
     * @tc.desc      clipRectOf(screenWidth=600) returns 1150
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_ClipRectOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ClipRectOf_0008 begin`);
      const actual: RectBox = clipRectOf(600);
      logInfo(`clipRectOf(screenWidth=600): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(10);
      logInfo(`clipRectOf(screenWidth=600): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(900);
      logInfo(`clipRectOf(screenWidth=600): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(690);
      logInfo(`clipRectOf(screenWidth=600): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(1150);
      logInfo(`${BUNDLE}ClipRectOf_0008 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CLIP_RECT_OF_0009
     * @tc.name      TsDrawingSample_ClipRectOf_0009
     * @tc.desc      clipRectOf(screenWidth=599) returns 1149.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_ClipRectOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ClipRectOf_0009 begin`);
      const actual: RectBox = clipRectOf(599);
      logInfo(`clipRectOf(screenWidth=599): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(10);
      logInfo(`clipRectOf(screenWidth=599): actual.top=${actual.top}`);
      expect(actual.top).assertClose(899.5, PRECISION);
      logInfo(`clipRectOf(screenWidth=599): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(690);
      logInfo(`clipRectOf(screenWidth=599): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertClose(1149.5, PRECISION);
      logInfo(`${BUNDLE}ClipRectOf_0009 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CLIP_RECT_OF_0010
     * @tc.name      TsDrawingSample_ClipRectOf_0010
     * @tc.desc      clipRectOf(screenWidth=601) returns 1150.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_ClipRectOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ClipRectOf_0010 begin`);
      const actual: RectBox = clipRectOf(601);
      logInfo(`clipRectOf(screenWidth=601): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(10);
      logInfo(`clipRectOf(screenWidth=601): actual.top=${actual.top}`);
      expect(actual.top).assertClose(900.5, PRECISION);
      logInfo(`clipRectOf(screenWidth=601): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(690);
      logInfo(`clipRectOf(screenWidth=601): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertClose(1150.5, PRECISION);
      logInfo(`${BUNDLE}ClipRectOf_0010 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CLIP_RECT_OF_0011
     * @tc.name      TsDrawingSample_ClipRectOf_0011
     * @tc.desc      clipRectOf(screenWidth=1200) returns 1450
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ClipRectOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClipRectOf_0011 begin`);
      const actual: RectBox = clipRectOf(1200);
      logInfo(`clipRectOf(screenWidth=1200): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(10);
      logInfo(`clipRectOf(screenWidth=1200): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(1200);
      logInfo(`clipRectOf(screenWidth=1200): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(690);
      logInfo(`clipRectOf(screenWidth=1200): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(1450);
      logInfo(`${BUNDLE}ClipRectOf_0011 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CLIP_RECT_OF_0012
     * @tc.name      TsDrawingSample_ClipRectOf_0012
     * @tc.desc      clipRectOf(screenWidth=300) returns 1000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ClipRectOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClipRectOf_0012 begin`);
      const actual: RectBox = clipRectOf(300);
      logInfo(`clipRectOf(screenWidth=300): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(10);
      logInfo(`clipRectOf(screenWidth=300): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(750);
      logInfo(`clipRectOf(screenWidth=300): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(690);
      logInfo(`clipRectOf(screenWidth=300): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(1000);
      logInfo(`${BUNDLE}ClipRectOf_0012 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CLIP_RECT_OF_0013
     * @tc.name      TsDrawingSample_ClipRectOf_0013
     * @tc.desc      clipRectOf(screenWidth=690) returns 1195
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_ClipRectOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ClipRectOf_0013 begin`);
      const actual: RectBox = clipRectOf(690);
      logInfo(`clipRectOf(screenWidth=690): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(10);
      logInfo(`clipRectOf(screenWidth=690): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(945);
      logInfo(`clipRectOf(screenWidth=690): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(690);
      logInfo(`clipRectOf(screenWidth=690): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(1195);
      logInfo(`${BUNDLE}ClipRectOf_0013 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CLIP_RECT_OF_0014
     * @tc.name      TsDrawingSample_ClipRectOf_0014
     * @tc.desc      clipRectOf(screenWidth=689) returns 1194.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_ClipRectOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ClipRectOf_0014 begin`);
      const actual: RectBox = clipRectOf(689);
      logInfo(`clipRectOf(screenWidth=689): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(10);
      logInfo(`clipRectOf(screenWidth=689): actual.top=${actual.top}`);
      expect(actual.top).assertClose(944.5, PRECISION);
      logInfo(`clipRectOf(screenWidth=689): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(690);
      logInfo(`clipRectOf(screenWidth=689): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertClose(1194.5, PRECISION);
      logInfo(`${BUNDLE}ClipRectOf_0014 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CLIP_RECT_OF_0015
     * @tc.name      TsDrawingSample_ClipRectOf_0015
     * @tc.desc      clipRectOf(screenWidth=691) returns 1195.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_ClipRectOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ClipRectOf_0015 begin`);
      const actual: RectBox = clipRectOf(691);
      logInfo(`clipRectOf(screenWidth=691): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(10);
      logInfo(`clipRectOf(screenWidth=691): actual.top=${actual.top}`);
      expect(actual.top).assertClose(945.5, PRECISION);
      logInfo(`clipRectOf(screenWidth=691): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(690);
      logInfo(`clipRectOf(screenWidth=691): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertClose(1195.5, PRECISION);
      logInfo(`${BUNDLE}ClipRectOf_0015 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CLIP_RECT_OF_0016
     * @tc.name      TsDrawingSample_ClipRectOf_0016
     * @tc.desc      clipRectOf(screenWidth=1380) returns 1540
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ClipRectOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClipRectOf_0016 begin`);
      const actual: RectBox = clipRectOf(1380);
      logInfo(`clipRectOf(screenWidth=1380): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(10);
      logInfo(`clipRectOf(screenWidth=1380): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(1290);
      logInfo(`clipRectOf(screenWidth=1380): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(690);
      logInfo(`clipRectOf(screenWidth=1380): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(1540);
      logInfo(`${BUNDLE}ClipRectOf_0016 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CLIP_RECT_OF_0017
     * @tc.name      TsDrawingSample_ClipRectOf_0017
     * @tc.desc      clipRectOf(screenWidth=345) returns 1022.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ClipRectOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClipRectOf_0017 begin`);
      const actual: RectBox = clipRectOf(345);
      logInfo(`clipRectOf(screenWidth=345): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(10);
      logInfo(`clipRectOf(screenWidth=345): actual.top=${actual.top}`);
      expect(actual.top).assertClose(772.5, PRECISION);
      logInfo(`clipRectOf(screenWidth=345): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(690);
      logInfo(`clipRectOf(screenWidth=345): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertClose(1022.5, PRECISION);
      logInfo(`${BUNDLE}ClipRectOf_0017 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CLIP_RECT_OF_0018
     * @tc.name      TsDrawingSample_ClipRectOf_0018
     * @tc.desc      clipRectOf(screenWidth=850) returns 1275
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_ClipRectOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ClipRectOf_0018 begin`);
      const actual: RectBox = clipRectOf(850);
      logInfo(`clipRectOf(screenWidth=850): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(10);
      logInfo(`clipRectOf(screenWidth=850): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(1025);
      logInfo(`clipRectOf(screenWidth=850): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(690);
      logInfo(`clipRectOf(screenWidth=850): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(1275);
      logInfo(`${BUNDLE}ClipRectOf_0018 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CLIP_RECT_OF_0019
     * @tc.name      TsDrawingSample_ClipRectOf_0019
     * @tc.desc      clipRectOf(screenWidth=849) returns 1274.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_ClipRectOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ClipRectOf_0019 begin`);
      const actual: RectBox = clipRectOf(849);
      logInfo(`clipRectOf(screenWidth=849): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(10);
      logInfo(`clipRectOf(screenWidth=849): actual.top=${actual.top}`);
      expect(actual.top).assertClose(1024.5, PRECISION);
      logInfo(`clipRectOf(screenWidth=849): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(690);
      logInfo(`clipRectOf(screenWidth=849): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertClose(1274.5, PRECISION);
      logInfo(`${BUNDLE}ClipRectOf_0019 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CLIP_RECT_OF_0020
     * @tc.name      TsDrawingSample_ClipRectOf_0020
     * @tc.desc      clipRectOf(screenWidth=851) returns 1275.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_ClipRectOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ClipRectOf_0020 begin`);
      const actual: RectBox = clipRectOf(851);
      logInfo(`clipRectOf(screenWidth=851): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(10);
      logInfo(`clipRectOf(screenWidth=851): actual.top=${actual.top}`);
      expect(actual.top).assertClose(1025.5, PRECISION);
      logInfo(`clipRectOf(screenWidth=851): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(690);
      logInfo(`clipRectOf(screenWidth=851): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertClose(1275.5, PRECISION);
      logInfo(`${BUNDLE}ClipRectOf_0020 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CLIP_RECT_OF_0021
     * @tc.name      TsDrawingSample_ClipRectOf_0021
     * @tc.desc      clipRectOf(screenWidth=1700) returns 1700
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ClipRectOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClipRectOf_0021 begin`);
      const actual: RectBox = clipRectOf(1700);
      logInfo(`clipRectOf(screenWidth=1700): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(10);
      logInfo(`clipRectOf(screenWidth=1700): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(1450);
      logInfo(`clipRectOf(screenWidth=1700): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(690);
      logInfo(`clipRectOf(screenWidth=1700): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(1700);
      logInfo(`${BUNDLE}ClipRectOf_0021 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CLIP_RECT_OF_0022
     * @tc.name      TsDrawingSample_ClipRectOf_0022
     * @tc.desc      clipRectOf(screenWidth=425) returns 1062.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ClipRectOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClipRectOf_0022 begin`);
      const actual: RectBox = clipRectOf(425);
      logInfo(`clipRectOf(screenWidth=425): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(10);
      logInfo(`clipRectOf(screenWidth=425): actual.top=${actual.top}`);
      expect(actual.top).assertClose(812.5, PRECISION);
      logInfo(`clipRectOf(screenWidth=425): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(690);
      logInfo(`clipRectOf(screenWidth=425): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertClose(1062.5, PRECISION);
      logInfo(`${BUNDLE}ClipRectOf_0022 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CLIP_RECT_OF_0023
     * @tc.name      TsDrawingSample_ClipRectOf_0023
     * @tc.desc      clipRectOf(screenWidth=100) returns 900
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ClipRectOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClipRectOf_0023 begin`);
      const actual: RectBox = clipRectOf(100);
      logInfo(`clipRectOf(screenWidth=100): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(10);
      logInfo(`clipRectOf(screenWidth=100): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(650);
      logInfo(`clipRectOf(screenWidth=100): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(690);
      logInfo(`clipRectOf(screenWidth=100): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(900);
      logInfo(`${BUNDLE}ClipRectOf_0023 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CLIP_RECT_OF_0024
     * @tc.name      TsDrawingSample_ClipRectOf_0024
     * @tc.desc      clipRectOf(screenWidth=360) returns 1030
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ClipRectOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClipRectOf_0024 begin`);
      const actual: RectBox = clipRectOf(360);
      logInfo(`clipRectOf(screenWidth=360): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(10);
      logInfo(`clipRectOf(screenWidth=360): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(780);
      logInfo(`clipRectOf(screenWidth=360): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(690);
      logInfo(`clipRectOf(screenWidth=360): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(1030);
      logInfo(`${BUNDLE}ClipRectOf_0024 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CLIP_RECT_OF_0025
     * @tc.name      TsDrawingSample_ClipRectOf_0025
     * @tc.desc      clipRectOf(screenWidth=720) returns 1210
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ClipRectOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClipRectOf_0025 begin`);
      const actual: RectBox = clipRectOf(720);
      logInfo(`clipRectOf(screenWidth=720): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(10);
      logInfo(`clipRectOf(screenWidth=720): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(960);
      logInfo(`clipRectOf(screenWidth=720): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(690);
      logInfo(`clipRectOf(screenWidth=720): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(1210);
      logInfo(`${BUNDLE}ClipRectOf_0025 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CLIP_RECT_OF_0026
     * @tc.name      TsDrawingSample_ClipRectOf_0026
     * @tc.desc      clipRectOf(screenWidth=1080) returns 1390
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ClipRectOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClipRectOf_0026 begin`);
      const actual: RectBox = clipRectOf(1080);
      logInfo(`clipRectOf(screenWidth=1080): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(10);
      logInfo(`clipRectOf(screenWidth=1080): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(1140);
      logInfo(`clipRectOf(screenWidth=1080): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(690);
      logInfo(`clipRectOf(screenWidth=1080): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(1390);
      logInfo(`${BUNDLE}ClipRectOf_0026 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CLIP_RECT_OF_0027
     * @tc.name      TsDrawingSample_ClipRectOf_0027
     * @tc.desc      clipRectOf(screenWidth=1920) returns 1810
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ClipRectOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClipRectOf_0027 begin`);
      const actual: RectBox = clipRectOf(1920);
      logInfo(`clipRectOf(screenWidth=1920): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(10);
      logInfo(`clipRectOf(screenWidth=1920): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(1560);
      logInfo(`clipRectOf(screenWidth=1920): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(690);
      logInfo(`clipRectOf(screenWidth=1920): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(1810);
      logInfo(`${BUNDLE}ClipRectOf_0027 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CLIP_RECT_OF_0028
     * @tc.name      TsDrawingSample_ClipRectOf_0028
     * @tc.desc      clipRectOf(screenWidth=-1) returns 849.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TsDrawingSample_ClipRectOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ClipRectOf_0028 begin`);
      const actual: RectBox = clipRectOf(-1);
      logInfo(`clipRectOf(screenWidth=-1): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(10);
      logInfo(`clipRectOf(screenWidth=-1): actual.top=${actual.top}`);
      expect(actual.top).assertClose(599.5, PRECISION);
      logInfo(`clipRectOf(screenWidth=-1): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(690);
      logInfo(`clipRectOf(screenWidth=-1): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertClose(849.5, PRECISION);
      logInfo(`${BUNDLE}ClipRectOf_0028 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CLIP_RECT_OF_0029
     * @tc.name      TsDrawingSample_ClipRectOf_0029
     * @tc.desc      clipRectOf(screenWidth=2) returns 851
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ClipRectOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClipRectOf_0029 begin`);
      const actual: RectBox = clipRectOf(2);
      logInfo(`clipRectOf(screenWidth=2): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(10);
      logInfo(`clipRectOf(screenWidth=2): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(601);
      logInfo(`clipRectOf(screenWidth=2): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(690);
      logInfo(`clipRectOf(screenWidth=2): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(851);
      logInfo(`${BUNDLE}ClipRectOf_0029 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CLIP_RECT_OF_0030
     * @tc.name      TsDrawingSample_ClipRectOf_0030
     * @tc.desc      clipRectOf(screenWidth=3) returns 851.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ClipRectOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClipRectOf_0030 begin`);
      const actual: RectBox = clipRectOf(3);
      logInfo(`clipRectOf(screenWidth=3): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(10);
      logInfo(`clipRectOf(screenWidth=3): actual.top=${actual.top}`);
      expect(actual.top).assertClose(601.5, PRECISION);
      logInfo(`clipRectOf(screenWidth=3): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(690);
      logInfo(`clipRectOf(screenWidth=3): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertClose(851.5, PRECISION);
      logInfo(`${BUNDLE}ClipRectOf_0030 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CLIP_RECT_OF_0031
     * @tc.name      TsDrawingSample_ClipRectOf_0031
     * @tc.desc      clipRectOf(screenWidth=96) returns 898
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ClipRectOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClipRectOf_0031 begin`);
      const actual: RectBox = clipRectOf(96);
      logInfo(`clipRectOf(screenWidth=96): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(10);
      logInfo(`clipRectOf(screenWidth=96): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(648);
      logInfo(`clipRectOf(screenWidth=96): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(690);
      logInfo(`clipRectOf(screenWidth=96): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(898);
      logInfo(`${BUNDLE}ClipRectOf_0031 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CLIP_RECT_OF_0032
     * @tc.name      TsDrawingSample_ClipRectOf_0032
     * @tc.desc      clipRectOf(screenWidth=192) returns 946
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ClipRectOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClipRectOf_0032 begin`);
      const actual: RectBox = clipRectOf(192);
      logInfo(`clipRectOf(screenWidth=192): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(10);
      logInfo(`clipRectOf(screenWidth=192): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(696);
      logInfo(`clipRectOf(screenWidth=192): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(690);
      logInfo(`clipRectOf(screenWidth=192): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(946);
      logInfo(`${BUNDLE}ClipRectOf_0032 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CLIP_RECT_OF_0033
     * @tc.name      TsDrawingSample_ClipRectOf_0033
     * @tc.desc      clipRectOf(screenWidth=288) returns 994
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ClipRectOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClipRectOf_0033 begin`);
      const actual: RectBox = clipRectOf(288);
      logInfo(`clipRectOf(screenWidth=288): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(10);
      logInfo(`clipRectOf(screenWidth=288): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(744);
      logInfo(`clipRectOf(screenWidth=288): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(690);
      logInfo(`clipRectOf(screenWidth=288): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(994);
      logInfo(`${BUNDLE}ClipRectOf_0033 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CLIP_RECT_OF_0034
     * @tc.name      TsDrawingSample_ClipRectOf_0034
     * @tc.desc      clipRectOf(screenWidth=384) returns 1042
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ClipRectOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClipRectOf_0034 begin`);
      const actual: RectBox = clipRectOf(384);
      logInfo(`clipRectOf(screenWidth=384): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(10);
      logInfo(`clipRectOf(screenWidth=384): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(792);
      logInfo(`clipRectOf(screenWidth=384): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(690);
      logInfo(`clipRectOf(screenWidth=384): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(1042);
      logInfo(`${BUNDLE}ClipRectOf_0034 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CLIP_RECT_OF_0035
     * @tc.name      TsDrawingSample_ClipRectOf_0035
     * @tc.desc      clipRectOf(screenWidth=480) returns 1090
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ClipRectOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClipRectOf_0035 begin`);
      const actual: RectBox = clipRectOf(480);
      logInfo(`clipRectOf(screenWidth=480): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(10);
      logInfo(`clipRectOf(screenWidth=480): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(840);
      logInfo(`clipRectOf(screenWidth=480): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(690);
      logInfo(`clipRectOf(screenWidth=480): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(1090);
      logInfo(`${BUNDLE}ClipRectOf_0035 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CLIP_RECT_OF_0036
     * @tc.name      TsDrawingSample_ClipRectOf_0036
     * @tc.desc      clipRectOf(screenWidth=576) returns 1138
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ClipRectOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClipRectOf_0036 begin`);
      const actual: RectBox = clipRectOf(576);
      logInfo(`clipRectOf(screenWidth=576): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(10);
      logInfo(`clipRectOf(screenWidth=576): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(888);
      logInfo(`clipRectOf(screenWidth=576): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(690);
      logInfo(`clipRectOf(screenWidth=576): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(1138);
      logInfo(`${BUNDLE}ClipRectOf_0036 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CLIP_RECT_OF_0037
     * @tc.name      TsDrawingSample_ClipRectOf_0037
     * @tc.desc      clipRectOf(screenWidth=672) returns 1186
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ClipRectOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClipRectOf_0037 begin`);
      const actual: RectBox = clipRectOf(672);
      logInfo(`clipRectOf(screenWidth=672): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(10);
      logInfo(`clipRectOf(screenWidth=672): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(936);
      logInfo(`clipRectOf(screenWidth=672): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(690);
      logInfo(`clipRectOf(screenWidth=672): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(1186);
      logInfo(`${BUNDLE}ClipRectOf_0037 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CLIP_RECT_OF_0038
     * @tc.name      TsDrawingSample_ClipRectOf_0038
     * @tc.desc      clipRectOf(screenWidth=768) returns 1234
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ClipRectOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClipRectOf_0038 begin`);
      const actual: RectBox = clipRectOf(768);
      logInfo(`clipRectOf(screenWidth=768): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(10);
      logInfo(`clipRectOf(screenWidth=768): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(984);
      logInfo(`clipRectOf(screenWidth=768): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(690);
      logInfo(`clipRectOf(screenWidth=768): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(1234);
      logInfo(`${BUNDLE}ClipRectOf_0038 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CLIP_RECT_OF_0039
     * @tc.name      TsDrawingSample_ClipRectOf_0039
     * @tc.desc      clipRectOf(screenWidth=864) returns 1282
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ClipRectOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClipRectOf_0039 begin`);
      const actual: RectBox = clipRectOf(864);
      logInfo(`clipRectOf(screenWidth=864): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(10);
      logInfo(`clipRectOf(screenWidth=864): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(1032);
      logInfo(`clipRectOf(screenWidth=864): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(690);
      logInfo(`clipRectOf(screenWidth=864): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(1282);
      logInfo(`${BUNDLE}ClipRectOf_0039 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CLIP_RECT_OF_0040
     * @tc.name      TsDrawingSample_ClipRectOf_0040
     * @tc.desc      clipRectOf(screenWidth=960) returns 1330
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ClipRectOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClipRectOf_0040 begin`);
      const actual: RectBox = clipRectOf(960);
      logInfo(`clipRectOf(screenWidth=960): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(10);
      logInfo(`clipRectOf(screenWidth=960): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(1080);
      logInfo(`clipRectOf(screenWidth=960): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(690);
      logInfo(`clipRectOf(screenWidth=960): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(1330);
      logInfo(`${BUNDLE}ClipRectOf_0040 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CLIP_RECT_OF_0041
     * @tc.name      TsDrawingSample_ClipRectOf_0041
     * @tc.desc      clipRectOf(screenWidth=1056) returns 1378
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ClipRectOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClipRectOf_0041 begin`);
      const actual: RectBox = clipRectOf(1056);
      logInfo(`clipRectOf(screenWidth=1056): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(10);
      logInfo(`clipRectOf(screenWidth=1056): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(1128);
      logInfo(`clipRectOf(screenWidth=1056): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(690);
      logInfo(`clipRectOf(screenWidth=1056): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(1378);
      logInfo(`${BUNDLE}ClipRectOf_0041 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CLIP_RECT_OF_0042
     * @tc.name      TsDrawingSample_ClipRectOf_0042
     * @tc.desc      clipRectOf(screenWidth=1152) returns 1426
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ClipRectOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClipRectOf_0042 begin`);
      const actual: RectBox = clipRectOf(1152);
      logInfo(`clipRectOf(screenWidth=1152): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(10);
      logInfo(`clipRectOf(screenWidth=1152): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(1176);
      logInfo(`clipRectOf(screenWidth=1152): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(690);
      logInfo(`clipRectOf(screenWidth=1152): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(1426);
      logInfo(`${BUNDLE}ClipRectOf_0042 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CLIP_RECT_OF_0043
     * @tc.name      TsDrawingSample_ClipRectOf_0043
     * @tc.desc      clipRectOf(screenWidth=1248) returns 1474
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ClipRectOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClipRectOf_0043 begin`);
      const actual: RectBox = clipRectOf(1248);
      logInfo(`clipRectOf(screenWidth=1248): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(10);
      logInfo(`clipRectOf(screenWidth=1248): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(1224);
      logInfo(`clipRectOf(screenWidth=1248): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(690);
      logInfo(`clipRectOf(screenWidth=1248): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(1474);
      logInfo(`${BUNDLE}ClipRectOf_0043 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CLIP_RECT_OF_0044
     * @tc.name      TsDrawingSample_ClipRectOf_0044
     * @tc.desc      clipRectOf(screenWidth=1344) returns 1522
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ClipRectOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClipRectOf_0044 begin`);
      const actual: RectBox = clipRectOf(1344);
      logInfo(`clipRectOf(screenWidth=1344): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(10);
      logInfo(`clipRectOf(screenWidth=1344): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(1272);
      logInfo(`clipRectOf(screenWidth=1344): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(690);
      logInfo(`clipRectOf(screenWidth=1344): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(1522);
      logInfo(`${BUNDLE}ClipRectOf_0044 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CLIP_RECT_OF_0045
     * @tc.name      TsDrawingSample_ClipRectOf_0045
     * @tc.desc      clipRectOf(screenWidth=1440) returns 1570
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ClipRectOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClipRectOf_0045 begin`);
      const actual: RectBox = clipRectOf(1440);
      logInfo(`clipRectOf(screenWidth=1440): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(10);
      logInfo(`clipRectOf(screenWidth=1440): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(1320);
      logInfo(`clipRectOf(screenWidth=1440): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(690);
      logInfo(`clipRectOf(screenWidth=1440): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(1570);
      logInfo(`${BUNDLE}ClipRectOf_0045 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CLIP_RECT_OF_0046
     * @tc.name      TsDrawingSample_ClipRectOf_0046
     * @tc.desc      clipRectOf(screenWidth=1536) returns 1618
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ClipRectOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClipRectOf_0046 begin`);
      const actual: RectBox = clipRectOf(1536);
      logInfo(`clipRectOf(screenWidth=1536): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(10);
      logInfo(`clipRectOf(screenWidth=1536): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(1368);
      logInfo(`clipRectOf(screenWidth=1536): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(690);
      logInfo(`clipRectOf(screenWidth=1536): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(1618);
      logInfo(`${BUNDLE}ClipRectOf_0046 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CLIP_RECT_OF_0047
     * @tc.name      TsDrawingSample_ClipRectOf_0047
     * @tc.desc      clipRectOf(screenWidth=1632) returns 1666
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ClipRectOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClipRectOf_0047 begin`);
      const actual: RectBox = clipRectOf(1632);
      logInfo(`clipRectOf(screenWidth=1632): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(10);
      logInfo(`clipRectOf(screenWidth=1632): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(1416);
      logInfo(`clipRectOf(screenWidth=1632): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(690);
      logInfo(`clipRectOf(screenWidth=1632): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(1666);
      logInfo(`${BUNDLE}ClipRectOf_0047 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CLIP_RECT_OF_0048
     * @tc.name      TsDrawingSample_ClipRectOf_0048
     * @tc.desc      clipRectOf(screenWidth=1728) returns 1714
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ClipRectOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClipRectOf_0048 begin`);
      const actual: RectBox = clipRectOf(1728);
      logInfo(`clipRectOf(screenWidth=1728): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(10);
      logInfo(`clipRectOf(screenWidth=1728): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(1464);
      logInfo(`clipRectOf(screenWidth=1728): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(690);
      logInfo(`clipRectOf(screenWidth=1728): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(1714);
      logInfo(`${BUNDLE}ClipRectOf_0048 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CLIP_RECT_OF_0049
     * @tc.name      TsDrawingSample_ClipRectOf_0049
     * @tc.desc      clipRectOf(screenWidth=1824) returns 1762
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ClipRectOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClipRectOf_0049 begin`);
      const actual: RectBox = clipRectOf(1824);
      logInfo(`clipRectOf(screenWidth=1824): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(10);
      logInfo(`clipRectOf(screenWidth=1824): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(1512);
      logInfo(`clipRectOf(screenWidth=1824): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(690);
      logInfo(`clipRectOf(screenWidth=1824): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(1762);
      logInfo(`${BUNDLE}ClipRectOf_0049 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CLIP_RECT_OF_0050
     * @tc.name      TsDrawingSample_ClipRectOf_0050
     * @tc.desc      clipRectOf(screenWidth=2016) returns 1858
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ClipRectOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClipRectOf_0050 begin`);
      const actual: RectBox = clipRectOf(2016);
      logInfo(`clipRectOf(screenWidth=2016): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(10);
      logInfo(`clipRectOf(screenWidth=2016): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(1608);
      logInfo(`clipRectOf(screenWidth=2016): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(690);
      logInfo(`clipRectOf(screenWidth=2016): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(1858);
      logInfo(`${BUNDLE}ClipRectOf_0050 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CLIP_RECT_OF_0051
     * @tc.name      TsDrawingSample_ClipRectOf_0051
     * @tc.desc      clipRectOf(screenWidth=2112) returns 1906
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ClipRectOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClipRectOf_0051 begin`);
      const actual: RectBox = clipRectOf(2112);
      logInfo(`clipRectOf(screenWidth=2112): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(10);
      logInfo(`clipRectOf(screenWidth=2112): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(1656);
      logInfo(`clipRectOf(screenWidth=2112): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(690);
      logInfo(`clipRectOf(screenWidth=2112): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(1906);
      logInfo(`${BUNDLE}ClipRectOf_0051 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CLIP_RECT_OF_0052
     * @tc.name      TsDrawingSample_ClipRectOf_0052
     * @tc.desc      clipRectOf(screenWidth=2208) returns 1954
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ClipRectOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClipRectOf_0052 begin`);
      const actual: RectBox = clipRectOf(2208);
      logInfo(`clipRectOf(screenWidth=2208): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(10);
      logInfo(`clipRectOf(screenWidth=2208): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(1704);
      logInfo(`clipRectOf(screenWidth=2208): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(690);
      logInfo(`clipRectOf(screenWidth=2208): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(1954);
      logInfo(`${BUNDLE}ClipRectOf_0052 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CLIP_RECT_OF_0053
     * @tc.name      TsDrawingSample_ClipRectOf_0053
     * @tc.desc      clipRectOf(screenWidth=2304) returns 2002
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ClipRectOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClipRectOf_0053 begin`);
      const actual: RectBox = clipRectOf(2304);
      logInfo(`clipRectOf(screenWidth=2304): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(10);
      logInfo(`clipRectOf(screenWidth=2304): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(1752);
      logInfo(`clipRectOf(screenWidth=2304): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(690);
      logInfo(`clipRectOf(screenWidth=2304): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(2002);
      logInfo(`${BUNDLE}ClipRectOf_0053 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CLIP_RECT_OF_0054
     * @tc.name      TsDrawingSample_ClipRectOf_0054
     * @tc.desc      clipRectOf(screenWidth=2400) returns 2050
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ClipRectOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClipRectOf_0054 begin`);
      const actual: RectBox = clipRectOf(2400);
      logInfo(`clipRectOf(screenWidth=2400): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(10);
      logInfo(`clipRectOf(screenWidth=2400): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(1800);
      logInfo(`clipRectOf(screenWidth=2400): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(690);
      logInfo(`clipRectOf(screenWidth=2400): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(2050);
      logInfo(`${BUNDLE}ClipRectOf_0054 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CLIP_RECT_OF_0055
     * @tc.name      TsDrawingSample_ClipRectOf_0055
     * @tc.desc      clipRectOf(screenWidth=2496) returns 2098
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ClipRectOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClipRectOf_0055 begin`);
      const actual: RectBox = clipRectOf(2496);
      logInfo(`clipRectOf(screenWidth=2496): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(10);
      logInfo(`clipRectOf(screenWidth=2496): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(1848);
      logInfo(`clipRectOf(screenWidth=2496): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(690);
      logInfo(`clipRectOf(screenWidth=2496): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(2098);
      logInfo(`${BUNDLE}ClipRectOf_0055 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CLIP_RECT_OF_0056
     * @tc.name      TsDrawingSample_ClipRectOf_0056
     * @tc.desc      clipRectOf(screenWidth=2592) returns 2146
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ClipRectOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClipRectOf_0056 begin`);
      const actual: RectBox = clipRectOf(2592);
      logInfo(`clipRectOf(screenWidth=2592): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(10);
      logInfo(`clipRectOf(screenWidth=2592): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(1896);
      logInfo(`clipRectOf(screenWidth=2592): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(690);
      logInfo(`clipRectOf(screenWidth=2592): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(2146);
      logInfo(`${BUNDLE}ClipRectOf_0056 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CLIP_RECT_OF_0057
     * @tc.name      TsDrawingSample_ClipRectOf_0057
     * @tc.desc      clipRectOf(screenWidth=2688) returns 2194
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ClipRectOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClipRectOf_0057 begin`);
      const actual: RectBox = clipRectOf(2688);
      logInfo(`clipRectOf(screenWidth=2688): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(10);
      logInfo(`clipRectOf(screenWidth=2688): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(1944);
      logInfo(`clipRectOf(screenWidth=2688): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(690);
      logInfo(`clipRectOf(screenWidth=2688): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(2194);
      logInfo(`${BUNDLE}ClipRectOf_0057 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CLIP_RECT_OF_0058
     * @tc.name      TsDrawingSample_ClipRectOf_0058
     * @tc.desc      clipRectOf(screenWidth=2784) returns 2242
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ClipRectOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClipRectOf_0058 begin`);
      const actual: RectBox = clipRectOf(2784);
      logInfo(`clipRectOf(screenWidth=2784): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(10);
      logInfo(`clipRectOf(screenWidth=2784): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(1992);
      logInfo(`clipRectOf(screenWidth=2784): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(690);
      logInfo(`clipRectOf(screenWidth=2784): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(2242);
      logInfo(`${BUNDLE}ClipRectOf_0058 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CLIP_RECT_OF_0059
     * @tc.name      TsDrawingSample_ClipRectOf_0059
     * @tc.desc      clipRectOf(screenWidth=2880) returns 2290
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ClipRectOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClipRectOf_0059 begin`);
      const actual: RectBox = clipRectOf(2880);
      logInfo(`clipRectOf(screenWidth=2880): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(10);
      logInfo(`clipRectOf(screenWidth=2880): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(2040);
      logInfo(`clipRectOf(screenWidth=2880): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(690);
      logInfo(`clipRectOf(screenWidth=2880): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(2290);
      logInfo(`${BUNDLE}ClipRectOf_0059 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CLIP_RECT_OF_0060
     * @tc.name      TsDrawingSample_ClipRectOf_0060
     * @tc.desc      clipRectOf(screenWidth=2976) returns 2338
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ClipRectOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClipRectOf_0060 begin`);
      const actual: RectBox = clipRectOf(2976);
      logInfo(`clipRectOf(screenWidth=2976): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(10);
      logInfo(`clipRectOf(screenWidth=2976): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(2088);
      logInfo(`clipRectOf(screenWidth=2976): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(690);
      logInfo(`clipRectOf(screenWidth=2976): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(2338);
      logInfo(`${BUNDLE}ClipRectOf_0060 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CLIP_RECT_OF_0061
     * @tc.name      TsDrawingSample_ClipRectOf_0061
     * @tc.desc      clipRectOf(screenWidth=3072) returns 2386
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ClipRectOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClipRectOf_0061 begin`);
      const actual: RectBox = clipRectOf(3072);
      logInfo(`clipRectOf(screenWidth=3072): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(10);
      logInfo(`clipRectOf(screenWidth=3072): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(2136);
      logInfo(`clipRectOf(screenWidth=3072): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(690);
      logInfo(`clipRectOf(screenWidth=3072): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(2386);
      logInfo(`${BUNDLE}ClipRectOf_0061 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CLIP_RECT_OF_0062
     * @tc.name      TsDrawingSample_ClipRectOf_0062
     * @tc.desc      clipRectOf(screenWidth=3168) returns 2434
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ClipRectOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClipRectOf_0062 begin`);
      const actual: RectBox = clipRectOf(3168);
      logInfo(`clipRectOf(screenWidth=3168): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(10);
      logInfo(`clipRectOf(screenWidth=3168): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(2184);
      logInfo(`clipRectOf(screenWidth=3168): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(690);
      logInfo(`clipRectOf(screenWidth=3168): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(2434);
      logInfo(`${BUNDLE}ClipRectOf_0062 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CLIP_RECT_OF_0063
     * @tc.name      TsDrawingSample_ClipRectOf_0063
     * @tc.desc      clipRectOf(screenWidth=3264) returns 2482
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ClipRectOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClipRectOf_0063 begin`);
      const actual: RectBox = clipRectOf(3264);
      logInfo(`clipRectOf(screenWidth=3264): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(10);
      logInfo(`clipRectOf(screenWidth=3264): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(2232);
      logInfo(`clipRectOf(screenWidth=3264): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(690);
      logInfo(`clipRectOf(screenWidth=3264): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(2482);
      logInfo(`${BUNDLE}ClipRectOf_0063 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CLIP_RECT_OF_0064
     * @tc.name      TsDrawingSample_ClipRectOf_0064
     * @tc.desc      clipRectOf(screenWidth=3360) returns 2530
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ClipRectOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClipRectOf_0064 begin`);
      const actual: RectBox = clipRectOf(3360);
      logInfo(`clipRectOf(screenWidth=3360): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(10);
      logInfo(`clipRectOf(screenWidth=3360): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(2280);
      logInfo(`clipRectOf(screenWidth=3360): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(690);
      logInfo(`clipRectOf(screenWidth=3360): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(2530);
      logInfo(`${BUNDLE}ClipRectOf_0064 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CLIP_RECT_OF_0065
     * @tc.name      TsDrawingSample_ClipRectOf_0065
     * @tc.desc      clipRectOf(screenWidth=3456) returns 2578
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ClipRectOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClipRectOf_0065 begin`);
      const actual: RectBox = clipRectOf(3456);
      logInfo(`clipRectOf(screenWidth=3456): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(10);
      logInfo(`clipRectOf(screenWidth=3456): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(2328);
      logInfo(`clipRectOf(screenWidth=3456): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(690);
      logInfo(`clipRectOf(screenWidth=3456): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(2578);
      logInfo(`${BUNDLE}ClipRectOf_0065 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CLIP_RECT_OF_0066
     * @tc.name      TsDrawingSample_ClipRectOf_0066
     * @tc.desc      clipRectOf(screenWidth=3552) returns 2626
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ClipRectOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClipRectOf_0066 begin`);
      const actual: RectBox = clipRectOf(3552);
      logInfo(`clipRectOf(screenWidth=3552): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(10);
      logInfo(`clipRectOf(screenWidth=3552): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(2376);
      logInfo(`clipRectOf(screenWidth=3552): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(690);
      logInfo(`clipRectOf(screenWidth=3552): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(2626);
      logInfo(`${BUNDLE}ClipRectOf_0066 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CLIP_RECT_OF_0067
     * @tc.name      TsDrawingSample_ClipRectOf_0067
     * @tc.desc      clipRectOf(screenWidth=3648) returns 2674
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ClipRectOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClipRectOf_0067 begin`);
      const actual: RectBox = clipRectOf(3648);
      logInfo(`clipRectOf(screenWidth=3648): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(10);
      logInfo(`clipRectOf(screenWidth=3648): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(2424);
      logInfo(`clipRectOf(screenWidth=3648): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(690);
      logInfo(`clipRectOf(screenWidth=3648): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(2674);
      logInfo(`${BUNDLE}ClipRectOf_0067 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CLIP_RECT_OF_0068
     * @tc.name      TsDrawingSample_ClipRectOf_0068
     * @tc.desc      clipRectOf(screenWidth=3744) returns 2722
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ClipRectOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClipRectOf_0068 begin`);
      const actual: RectBox = clipRectOf(3744);
      logInfo(`clipRectOf(screenWidth=3744): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(10);
      logInfo(`clipRectOf(screenWidth=3744): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(2472);
      logInfo(`clipRectOf(screenWidth=3744): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(690);
      logInfo(`clipRectOf(screenWidth=3744): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(2722);
      logInfo(`${BUNDLE}ClipRectOf_0068 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CLIP_RECT_OF_0069
     * @tc.name      TsDrawingSample_ClipRectOf_0069
     * @tc.desc      clipRectOf(screenWidth=3840) returns 2770
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ClipRectOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClipRectOf_0069 begin`);
      const actual: RectBox = clipRectOf(3840);
      logInfo(`clipRectOf(screenWidth=3840): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(10);
      logInfo(`clipRectOf(screenWidth=3840): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(2520);
      logInfo(`clipRectOf(screenWidth=3840): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(690);
      logInfo(`clipRectOf(screenWidth=3840): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(2770);
      logInfo(`${BUNDLE}ClipRectOf_0069 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CLIP_RECT_OF_0070
     * @tc.name      TsDrawingSample_ClipRectOf_0070
     * @tc.desc      clipRectOf(screenWidth=63.59) returns 881.795
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ClipRectOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClipRectOf_0070 begin`);
      const actual: RectBox = clipRectOf(63.59);
      logInfo(`clipRectOf(screenWidth=63.59): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(10);
      logInfo(`clipRectOf(screenWidth=63.59): actual.top=${actual.top}`);
      expect(actual.top).assertClose(631.795, PRECISION);
      logInfo(`clipRectOf(screenWidth=63.59): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(690);
      logInfo(`clipRectOf(screenWidth=63.59): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertClose(881.795, PRECISION);
      logInfo(`${BUNDLE}ClipRectOf_0070 end`);
    });
  });
}
