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

/** Logic checks for clipRectOf (4 cases). */
export default function clipRectOf2Test(): void {
  describe('ClipRectOf2Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CLIP_RECT_OF_0071
     * @tc.name      TsDrawingSample_ClipRectOf_0071
     * @tc.desc      clipRectOf(screenWidth=2855) returns 2277.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ClipRectOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClipRectOf_0071 begin`);
      const actual: RectBox = clipRectOf(2855);
      logInfo(`clipRectOf(screenWidth=2855): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(10);
      logInfo(`clipRectOf(screenWidth=2855): actual.top=${actual.top}`);
      expect(actual.top).assertClose(2027.5, PRECISION);
      logInfo(`clipRectOf(screenWidth=2855): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(690);
      logInfo(`clipRectOf(screenWidth=2855): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertClose(2277.5, PRECISION);
      logInfo(`${BUNDLE}ClipRectOf_0071 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CLIP_RECT_OF_0072
     * @tc.name      TsDrawingSample_ClipRectOf_0072
     * @tc.desc      clipRectOf(screenWidth=2859) returns 2279.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ClipRectOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClipRectOf_0072 begin`);
      const actual: RectBox = clipRectOf(2859);
      logInfo(`clipRectOf(screenWidth=2859): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(10);
      logInfo(`clipRectOf(screenWidth=2859): actual.top=${actual.top}`);
      expect(actual.top).assertClose(2029.5, PRECISION);
      logInfo(`clipRectOf(screenWidth=2859): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(690);
      logInfo(`clipRectOf(screenWidth=2859): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertClose(2279.5, PRECISION);
      logInfo(`${BUNDLE}ClipRectOf_0072 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CLIP_RECT_OF_0073
     * @tc.name      TsDrawingSample_ClipRectOf_0073
     * @tc.desc      clipRectOf(screenWidth=3034) returns 2367
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ClipRectOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClipRectOf_0073 begin`);
      const actual: RectBox = clipRectOf(3034);
      logInfo(`clipRectOf(screenWidth=3034): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(10);
      logInfo(`clipRectOf(screenWidth=3034): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(2117);
      logInfo(`clipRectOf(screenWidth=3034): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(690);
      logInfo(`clipRectOf(screenWidth=3034): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(2367);
      logInfo(`${BUNDLE}ClipRectOf_0073 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_CLIP_RECT_OF_0074
     * @tc.name      TsDrawingSample_ClipRectOf_0074
     * @tc.desc      clipRectOf(screenWidth=391.71) returns 1045.855
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_ClipRectOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClipRectOf_0074 begin`);
      const actual: RectBox = clipRectOf(391.71);
      logInfo(`clipRectOf(screenWidth=391.71): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(10);
      logInfo(`clipRectOf(screenWidth=391.71): actual.top=${actual.top}`);
      expect(actual.top).assertClose(795.855, PRECISION);
      logInfo(`clipRectOf(screenWidth=391.71): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(690);
      logInfo(`clipRectOf(screenWidth=391.71): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertClose(1045.855, PRECISION);
      logInfo(`${BUNDLE}ClipRectOf_0074 end`);
    });
  });
}
