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
import { refreshResolveText } from '../model/PullRefreshLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_PullToRefresh]';
const BUNDLE: string = 'PullToRefresh_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for refreshResolveText (2 cases). */
export default function refreshResolveTextTest(): void {
  describe('RefreshResolveTextTest', (): void => {
    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_RESOLVE_TEXT_0001
     * @tc.name      PullToRefresh_RefreshResolveText_0001
     * @tc.desc      refreshResolveText(isChangePage=true) returns "??????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PullToRefresh_RefreshResolveText_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RefreshResolveText_0001 begin`);
      const actual: string = refreshResolveText(true);
      logInfo(`refreshResolveText(isChangePage=true): actual=${actual}`);
      expect(actual).assertEqual('\u66f4\u65b0\u6570\u636e\u6210\u529f');
      logInfo(`${BUNDLE}RefreshResolveText_0001 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_RESOLVE_TEXT_0002
     * @tc.name      PullToRefresh_RefreshResolveText_0002
     * @tc.desc      refreshResolveText(isChangePage=false) returns "????????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PullToRefresh_RefreshResolveText_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RefreshResolveText_0002 begin`);
      const actual: string = refreshResolveText(false);
      logInfo(`refreshResolveText(isChangePage=false): actual=${actual}`);
      expect(actual).assertEqual('\u5237\u65b0\u5f53\u524d\u6570\u636e\u6210\u529f');
      logInfo(`${BUNDLE}RefreshResolveText_0002 end`);
    });
  });
}
