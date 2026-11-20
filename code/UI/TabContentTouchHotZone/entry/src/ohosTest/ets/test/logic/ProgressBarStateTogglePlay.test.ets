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

/** Logic checks for ProgressBarState.togglePlay (1 cases). */
export default function progressBarStateTogglePlayTest(): void {
  describe('ProgressBarStateTogglePlayTest', (): void => {
    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PROGRESS_BAR_STATE_TOGGLE_PLAY_0001
     * @tc.name      TabContentTouchHotZone_ProgressBarStateTogglePlay_0001
     * @tc.desc      ProgressBarState.togglePlay() yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TabContentTouchHotZone_ProgressBarStateTogglePlay_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}ProgressBarStateTogglePlay_0001 begin`);
      const subject: ProgressBarState = new ProgressBarState(0, 0);
      const actual: boolean = subject.togglePlay();
      logInfo(`togglePlay(): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`togglePlay() state: subject.isPlay=${subject.isPlay}`);
      expect(subject.isPlay).assertTrue();
      logInfo(`${BUNDLE}ProgressBarStateTogglePlay_0001 end`);
    });
  });
}
