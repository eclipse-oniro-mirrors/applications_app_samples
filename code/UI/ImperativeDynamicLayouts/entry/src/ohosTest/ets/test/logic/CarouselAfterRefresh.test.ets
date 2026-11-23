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

import { describe, beforeEach, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { yieldToEventLoop } from '../TestEventLoop';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { carouselAfterRefresh } from '../model/DynamicLayoutLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ImperativeDynamicLayouts]';
const BUNDLE: string = 'ImperativeDynamicLayouts_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for carouselAfterRefresh (1 cases). */
export default function carouselAfterRefreshTest(): void {
  describe('CarouselAfterRefreshTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_CAROUSEL_AFTER_REFRESH_0001
     * @tc.name      ImperativeDynamicLayouts_CarouselAfterRefresh_0001
     * @tc.desc      carouselAfterRefresh() returns ["app.media.movie9","app.media.movie10"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ImperativeDynamicLayouts_CarouselAfterRefresh_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CarouselAfterRefresh_0001 begin`);
      const actual: string[] = carouselAfterRefresh();
      logInfo(`carouselAfterRefresh(): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`carouselAfterRefresh(): JSON.stringify(actual.slice(0, 2))=${JSON.stringify(actual.slice(0, 2))}`);
      expect(JSON.stringify(actual.slice(0, 2))).assertEqual('["app.media.search","app.media.movie6"]');
      logInfo(`carouselAfterRefresh(): JSON.stringify(actual.slice(2, 4))=${JSON.stringify(actual.slice(2, 4))}`);
      expect(JSON.stringify(actual.slice(2, 4))).assertEqual('["app.media.movie7","app.media.movie8"]');
      logInfo(`carouselAfterRefresh(): JSON.stringify(actual.slice(4, 6))=${JSON.stringify(actual.slice(4, 6))}`);
      expect(JSON.stringify(actual.slice(4, 6))).assertEqual('["app.media.movie9","app.media.movie10"]');
      logInfo(`${BUNDLE}CarouselAfterRefresh_0001 end`);
    });
  });
}
