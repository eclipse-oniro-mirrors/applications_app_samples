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
import { NewsItem } from '../model/PullRefreshLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_PullToRefresh]';
const BUNDLE: string = 'PullToRefresh_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for NewsItem.toString (1 cases). */
export default function newsItemToStringTest(): void {
  describe('NewsItemToStringTest', (): void => {
    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_ITEM_TO_STRING_0001
     * @tc.name      PullToRefresh_NewsItemToString_0001
     * @tc.desc      NewsItem.toString() yields " Hello Hello "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PullToRefresh_NewsItemToString_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NewsItemToString_0001 begin`);
      const subject: NewsItem = new NewsItem('', 'Hello', 'Hello', '');
      const actual: string = subject.toString();
      logInfo(`toString(): actual=${actual}`);
      expect(actual).assertEqual(' Hello Hello ');
      logInfo(`${BUNDLE}NewsItemToString_0001 end`);
    });
  });
}
