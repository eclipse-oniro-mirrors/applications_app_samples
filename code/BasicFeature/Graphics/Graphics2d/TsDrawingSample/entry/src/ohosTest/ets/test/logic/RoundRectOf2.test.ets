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

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for roundRectOf (4 cases). */
export default function roundRectOf2Test(): void {
  describe('RoundRectOf2Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROUND_RECT_OF_0071
     * @tc.name      TsDrawingSample_RoundRectOf_0071
     * @tc.desc      roundRectOf(screenWidth=20, offsetY=0) returns 250
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_RoundRectOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RoundRectOf_0071 begin`);
      const actual: RectBox = roundRectOf(20, 0);
      logInfo(`roundRectOf(screenWidth=20, offsetY=0): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(25);
      logInfo(`roundRectOf(screenWidth=20, offsetY=0): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(150);
      logInfo(`roundRectOf(screenWidth=20, offsetY=0): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-10);
      logInfo(`roundRectOf(screenWidth=20, offsetY=0): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(250);
      logInfo(`${BUNDLE}RoundRectOf_0071 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROUND_RECT_OF_0072
     * @tc.name      TsDrawingSample_RoundRectOf_0072
     * @tc.desc      roundRectOf(screenWidth=20, offsetY=50) returns 300
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_RoundRectOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RoundRectOf_0072 begin`);
      const actual: RectBox = roundRectOf(20, 50);
      logInfo(`roundRectOf(screenWidth=20, offsetY=50): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(25);
      logInfo(`roundRectOf(screenWidth=20, offsetY=50): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(200);
      logInfo(`roundRectOf(screenWidth=20, offsetY=50): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-10);
      logInfo(`roundRectOf(screenWidth=20, offsetY=50): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(300);
      logInfo(`${BUNDLE}RoundRectOf_0072 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROUND_RECT_OF_0073
     * @tc.name      TsDrawingSample_RoundRectOf_0073
     * @tc.desc      roundRectOf(screenWidth=20, offsetY=100) returns 350
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_RoundRectOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RoundRectOf_0073 begin`);
      const actual: RectBox = roundRectOf(20, 100);
      logInfo(`roundRectOf(screenWidth=20, offsetY=100): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(25);
      logInfo(`roundRectOf(screenWidth=20, offsetY=100): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(250);
      logInfo(`roundRectOf(screenWidth=20, offsetY=100): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-10);
      logInfo(`roundRectOf(screenWidth=20, offsetY=100): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(350);
      logInfo(`${BUNDLE}RoundRectOf_0073 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_ROUND_RECT_OF_0074
     * @tc.name      TsDrawingSample_RoundRectOf_0074
     * @tc.desc      roundRectOf(screenWidth=20, offsetY=5) returns 255
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_RoundRectOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RoundRectOf_0074 begin`);
      const actual: RectBox = roundRectOf(20, 5);
      logInfo(`roundRectOf(screenWidth=20, offsetY=5): actual.left=${actual.left}`);
      expect(actual.left).assertEqual(25);
      logInfo(`roundRectOf(screenWidth=20, offsetY=5): actual.top=${actual.top}`);
      expect(actual.top).assertEqual(155);
      logInfo(`roundRectOf(screenWidth=20, offsetY=5): actual.right=${actual.right}`);
      expect(actual.right).assertEqual(-10);
      logInfo(`roundRectOf(screenWidth=20, offsetY=5): actual.bottom=${actual.bottom}`);
      expect(actual.bottom).assertEqual(255);
      logInfo(`${BUNDLE}RoundRectOf_0074 end`);
    });
  });
}
