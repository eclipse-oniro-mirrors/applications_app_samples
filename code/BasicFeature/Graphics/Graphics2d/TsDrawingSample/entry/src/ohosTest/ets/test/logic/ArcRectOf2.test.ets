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

/** Logic checks for arcRectOf (4 cases). */
export default function arcRectOf2Test(): void {
  describe('ArcRectOf2Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ARC_RECT_OF_0071
     * @tc.name      TsDrawingSample_ArcRectOf_0071
     * @tc.desc      arcRectOf(screenWidth=3, offsetY=5) returns 355
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_ArcRectOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ArcRectOf_0071 begin`);
      const actual: RectBox = arcRectOf(3, 5);
      logInfo(`arcRectOf(screenWidth=3, offsetY=5): actual.left=${actual.left}`);
      expect(actual.left).assertClose(-47.75, PRECISION);
      logInfo(`arcRectOf(screenWidth=3, offsetY=5): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(155);
      logInfo(`arcRectOf(screenWidth=3, offsetY=5): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-17);
      logInfo(`arcRectOf(screenWidth=3, offsetY=5): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(355);
      logInfo(`${BUNDLE}ArcRectOf_0071 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ARC_RECT_OF_0072
     * @tc.name      TsDrawingSample_ArcRectOf_0072
     * @tc.desc      arcRectOf(screenWidth=3, offsetY=20) returns 370
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_ArcRectOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ArcRectOf_0072 begin`);
      const actual: RectBox = arcRectOf(3, 20);
      logInfo(`arcRectOf(screenWidth=3, offsetY=20): actual.left=${actual.left}`);
      expect(actual.left).assertClose(-47.75, PRECISION);
      logInfo(`arcRectOf(screenWidth=3, offsetY=20): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(170);
      logInfo(`arcRectOf(screenWidth=3, offsetY=20): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-17);
      logInfo(`arcRectOf(screenWidth=3, offsetY=20): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(370);
      logInfo(`${BUNDLE}ArcRectOf_0072 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ARC_RECT_OF_0073
     * @tc.name      TsDrawingSample_ArcRectOf_0073
     * @tc.desc      arcRectOf(screenWidth=3, offsetY=19) returns 369
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_ArcRectOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ArcRectOf_0073 begin`);
      const actual: RectBox = arcRectOf(3, 19);
      logInfo(`arcRectOf(screenWidth=3, offsetY=19): actual.left=${actual.left}`);
      expect(actual.left).assertClose(-47.75, PRECISION);
      logInfo(`arcRectOf(screenWidth=3, offsetY=19): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(169);
      logInfo(`arcRectOf(screenWidth=3, offsetY=19): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-17);
      logInfo(`arcRectOf(screenWidth=3, offsetY=19): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(369);
      logInfo(`${BUNDLE}ArcRectOf_0073 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ARC_RECT_OF_0074
     * @tc.name      TsDrawingSample_ArcRectOf_0074
     * @tc.desc      arcRectOf(screenWidth=3, offsetY=21) returns 371
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_ArcRectOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ArcRectOf_0074 begin`);
      const actual: RectBox = arcRectOf(3, 21);
      logInfo(`arcRectOf(screenWidth=3, offsetY=21): actual.left=${actual.left}`);
      expect(actual.left).assertClose(-47.75, PRECISION);
      logInfo(`arcRectOf(screenWidth=3, offsetY=21): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(171);
      logInfo(`arcRectOf(screenWidth=3, offsetY=21): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-17);
      logInfo(`arcRectOf(screenWidth=3, offsetY=21): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(371);
      logInfo(`${BUNDLE}ArcRectOf_0074 end`);
    });
  });
}
