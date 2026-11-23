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
import { NewsPageModel } from '../model/PullRefreshLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_PullToRefresh]';
const BUNDLE: string = 'PullToRefresh_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for NewsPageModel.newsCount (1 cases). */
export default function newsPageModelNewsCountTest(): void {
  describe('NewsPageModelNewsCountTest', (): void => {
    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_PAGE_MODEL_NEWS_COUNT_0001
     * @tc.name      PullToRefresh_NewsPageModelNewsCount_0001
     * @tc.desc      NewsPageModel.newsCount() yields 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PullToRefresh_NewsPageModelNewsCount_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NewsPageModelNewsCount_0001 begin`);
      const subject: NewsPageModel = new NewsPageModel();
      const actual: number = subject.newsCount();
      logInfo(`newsCount(): actual=${actual}`);
      expect(actual).assertEqual(8);
      logInfo(`${BUNDLE}NewsPageModelNewsCount_0001 end`);
    });
  });
}
