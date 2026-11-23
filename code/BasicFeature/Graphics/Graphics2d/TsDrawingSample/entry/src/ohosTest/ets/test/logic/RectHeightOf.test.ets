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
import { RectBox, rectHeightOf } from '../model/DrawingGeometryLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_TsDrawingSample]';
const BUNDLE: string = 'TsDrawingSample_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for rectHeightOf (4 cases). */
export default function rectHeightOfTest(): void {
  describe('RectHeightOfTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_RECT_HEIGHT_OF_0001
     * @tc.name      TsDrawingSample_RectHeightOf_0001
     * @tc.desc      rectHeightOf(box=RectBox(-100, -100, -100, -100)) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TsDrawingSample_RectHeightOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RectHeightOf_0001 begin`);
      const actual: number = rectHeightOf(new RectBox(-100, -100, -100, -100));
      logInfo(`rectHeightOf(box=RectBox(-100, -100, -100...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RectHeightOf_0001 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_RECT_HEIGHT_OF_0002
     * @tc.name      TsDrawingSample_RectHeightOf_0002
     * @tc.desc      rectHeightOf(box=RectBox(-1, -100, -100, -100)) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TsDrawingSample_RectHeightOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RectHeightOf_0002 begin`);
      const actual: number = rectHeightOf(new RectBox(-1, -100, -100, -100));
      logInfo(`rectHeightOf(box=RectBox(-1, -100, -100, ...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RectHeightOf_0002 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_RECT_HEIGHT_OF_0003
     * @tc.name      TsDrawingSample_RectHeightOf_0003
     * @tc.desc      rectHeightOf(box=RectBox(0, -100, -100, -100)) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RectHeightOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RectHeightOf_0003 begin`);
      const actual: number = rectHeightOf(new RectBox(0, -100, -100, -100));
      logInfo(`rectHeightOf(box=RectBox(0, -100, -100, -...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RectHeightOf_0003 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_RECT_HEIGHT_OF_0004
     * @tc.name      TsDrawingSample_RectHeightOf_0004
     * @tc.desc      rectHeightOf(box=RectBox(1, -100, -100, -100)) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RectHeightOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RectHeightOf_0004 begin`);
      const actual: number = rectHeightOf(new RectBox(1, -100, -100, -100));
      logInfo(`rectHeightOf(box=RectBox(1, -100, -100, -...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RectHeightOf_0004 end`);
    });
  });
}
