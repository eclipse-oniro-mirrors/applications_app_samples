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

/** Logic checks for ProgressBarState.drag (2 cases). */
export default function progressBarStateDrag2Test(): void {
  describe('ProgressBarStateDrag2Test', (): void => {
    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_DRAG_0074
     * @tc.name      TabContentTouchHotZone_ProgressBarStateDrag_0074
     * @tc.desc      ProgressBarState.drag(deltaX=84.57) yields "00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateDrag_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateDrag_0074 begin`);
      const subject: ProgressBarState = new ProgressBarState(1, 0);
      const actual: string = subject.drag(84.57);
      logInfo(`drag(deltaX=84.57): actual=${actual}`);
      expect(actual).assertEqual('00');
      logInfo(`drag(deltaX=84.57) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-29);
      logInfo(`drag(deltaX=84.57) state: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`${BUNDLE}ProgressBarStateDrag_0074 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_DRAG_0075
     * @tc.name      TabContentTouchHotZone_ProgressBarStateDrag_0075
     * @tc.desc      ProgressBarState.drag(deltaX=134) yields "00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_ProgressBarStateDrag_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateDrag_0075 begin`);
      const subject: ProgressBarState = new ProgressBarState(-1, 0);
      const actual: string = subject.drag(134);
      logInfo(`drag(deltaX=134): actual=${actual}`);
      expect(actual).assertEqual('00');
      logInfo(`drag(deltaX=134) state: subject.offsetX=${subject.offsetX}`);
      expect(subject.offsetX).assertEqual(-31);
      logInfo(`drag(deltaX=134) state: subject.playTime=${subject.playTime}`);
      expect(subject.playTime).assertEqual('00');
      logInfo(`${BUNDLE}ProgressBarStateDrag_0075 end`);
    });
  });
}
