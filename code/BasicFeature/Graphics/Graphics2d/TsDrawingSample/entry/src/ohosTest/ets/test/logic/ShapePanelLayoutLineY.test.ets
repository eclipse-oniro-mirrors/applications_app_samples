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
import { ShapePanelLayout } from '../model/DrawingGeometryLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_TsDrawingSample]';
const BUNDLE: string = 'TsDrawingSample_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for ShapePanelLayout.lineY (1 cases). */
export default function shapePanelLayoutLineYTest(): void {
  describe('ShapePanelLayoutLineYTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_SHAPE_PANEL_LAYOUT_LINE_Y_0001
     * @tc.name      TsDrawingSample_ShapePanelLayoutLineY_0001
     * @tc.desc      ShapePanelLayout.lineY() yields 200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TsDrawingSample_ShapePanelLayoutLineY_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ShapePanelLayoutLineY_0001 begin`);
      const subject: ShapePanelLayout = new ShapePanelLayout(0, true);
      const actual: number = subject.lineY();
      logInfo(`lineY(): actual=${actual}`);
      expect(actual).assertEqual(200);
      logInfo(`${BUNDLE}ShapePanelLayoutLineY_0001 end`);
    });
  });
}
