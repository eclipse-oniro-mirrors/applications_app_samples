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
import { ProgressBarState } from '../model/TabContentLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_TabContentTouchHotZone]';
const BUNDLE: string = 'TabContentTouchHotZone_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for ProgressBarState.update (2 cases). */
export default function progressBarStateUpdate2Test(): void {
  describe('ProgressBarStateUpdate2Test', (): void => {
    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_UPDATE_0074
     * @tc.name      TabContentTouchHotZone_ProgressBarStateUpdate_0074
     * @tc.desc      ProgressBarState.update(time=2034337) yields Number.NEGATIVE_INFINITY
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateUpdate_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0074 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const actual: number = subject.update(2034337);
      logInfo(`update(time=2034337): actual=${actual}`);
      expect(actual).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=2034337) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`update(time=2034337) state: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0074 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_UPDATE_0075
     * @tc.name      TabContentTouchHotZone_ProgressBarStateUpdate_0075
     * @tc.desc      ProgressBarState.update(time=-2648541) yields Number.POSITIVE_INFINITY
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_ProgressBarStateUpdate_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0075 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const actual: number = subject.update(-2648541);
      logInfo(`update(time=-2648541): actual=${actual}`);
      expect(actual).assertEqual(Number.POSITIVE_INFINITY);
      logInfo(`update(time=-2648541) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(Number.POSITIVE_INFINITY);
      logInfo(`update(time=-2648541) state: subject.positionX=${subject.positionX}`);
      expect(subject.positionX).assertEqual(Number.POSITIVE_INFINITY);
      logInfo(`${BUNDLE}ProgressBarStateUpdate_0075 end`);
    });
  });
}
