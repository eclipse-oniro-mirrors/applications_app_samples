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
import { yieldToEventLoop } from '../../utils/YieldHook';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { LoadingTimeline } from '../model/PageLoadingLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_PageLoading]';
const BUNDLE: string = 'PageLoading_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for LoadingTimeline.nowProgress (1 cases). */
export default function loadingTimelineNowProgressTest(): void {
  describe('LoadingTimelineNowProgressTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_NOW_PROGRESS_0001
     * @tc.name      PageLoading_LoadingTimelineNowProgress_0001
     * @tc.desc      LoadingTimeline.nowProgress() yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PageLoading_LoadingTimelineNowProgress_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LoadingTimelineNowProgress_0001 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.nowProgress();
      logInfo(`nowProgress(): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}LoadingTimelineNowProgress_0001 end`);
    });
  });
}
