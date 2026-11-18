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
import { CitySearchState } from '../model/CitySearchLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CitySearch]';
const BUNDLE: string = 'CitySearch_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for new CitySearchState (1 cases). */
export default function citySearchStateCtorTest(): void {
  describe('CitySearchStateCtorTest', () => {
    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CTOR_0001
     * @tc.name      CitySearch_CitySearchStateCtor_0001
     * @tc.desc      new CitySearchState() initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_CitySearchStateCtor_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CitySearchStateCtor_0001 begin`);
      const subject: CitySearchState = new CitySearchState();
      logInfo(`new CitySearchState(): subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('');
      logInfo(`new CitySearchState(): subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertFalse();
      logInfo(`new CitySearchState(): subject.searchList.length=${subject.searchList.length}`);
      expect(subject.searchList.length).assertEqual(0);
      logInfo(`new CitySearchState(): subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(0);
      logInfo(`${BUNDLE}CitySearchStateCtor_0001 end`);
    });
  });
}
