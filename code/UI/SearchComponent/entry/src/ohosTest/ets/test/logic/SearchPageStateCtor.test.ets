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
import { yieldToEventLoop } from '../../utils/TestScheduler';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { SearchPageState } from '../model/SearchComponentLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SearchComponent]';
const BUNDLE: string = 'SearchComponent_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for new SearchPageState (1 cases). */
export default function searchPageStateCtorTest(): void {
  describe('SearchPageStateCtorTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_PAGE_STATE_CTOR_0001
     * @tc.name      SearchComponent_SearchPageStateCtor_0001
     * @tc.desc      new SearchPageState() initialises 7 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('SearchComponent_SearchPageStateCtor_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SearchPageStateCtor_0001 begin`);
      const subject: SearchPageState = new SearchPageState();
      logInfo(`new SearchPageState(): subject.searchInput=${subject.searchInput}`);
      expect(subject.searchInput).assertEqual('');
      logInfo(`new SearchPageState(): subject.classifyIndex=${subject.classifyIndex}`);
      expect(subject.classifyIndex).assertEqual(-1);
      logInfo(`new SearchPageState(): subject.categoryName=${subject.categoryName}`);
      expect(subject.categoryName).assertEqual('');
      logInfo(`new SearchPageState(): subject.results.length=${subject.results.length}`);
      expect(subject.results.length).assertEqual(0);
      logInfo(`new SearchPageState(): subject.history.length=${subject.history.length}`);
      expect(subject.history.length).assertEqual(0);
      logInfo(`new SearchPageState(): subject.isSearchPageShow=${subject.isSearchPageShow}`);
      expect(subject.isSearchPageShow).assertFalse();
      logInfo(`new SearchPageState(): subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(0);
      logInfo(`${BUNDLE}SearchPageStateCtor_0001 end`);
    });
  });
}
