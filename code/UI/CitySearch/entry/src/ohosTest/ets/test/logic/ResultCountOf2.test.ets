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
import { resultCountOf } from '../model/CitySearchLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CitySearch]';
const BUNDLE: string = 'CitySearch_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for resultCountOf (4 cases). */
export default function resultCountOf2Test(): void {
  describe('ResultCountOf2Test', () => {
    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0097
     * @tc.name      CitySearch_ResultCountOf_0097
     * @tc.desc      resultCountOf(value="PAewGF") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ResultCountOf_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResultCountOf_0097 begin`);
      const actual: number = resultCountOf('PAewGF');
      logInfo(`resultCountOf(value="PAewGF"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResultCountOf_0097 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0098
     * @tc.name      CitySearch_ResultCountOf_0098
     * @tc.desc      resultCountOf(value="6LRE2738") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ResultCountOf_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResultCountOf_0098 begin`);
      const actual: number = resultCountOf('6LRE2738');
      logInfo(`resultCountOf(value="6LRE2738"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResultCountOf_0098 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0099
     * @tc.name      CitySearch_ResultCountOf_0099
     * @tc.desc      resultCountOf(value="DZHNYFSj") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ResultCountOf_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResultCountOf_0099 begin`);
      const actual: number = resultCountOf('DZHNYFSj');
      logInfo(`resultCountOf(value="DZHNYFSj"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResultCountOf_0099 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0100
     * @tc.name      CitySearch_ResultCountOf_0100
     * @tc.desc      resultCountOf(value="YDk2rVo0QR") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ResultCountOf_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResultCountOf_0100 begin`);
      const actual: number = resultCountOf('YDk2rVo0QR');
      logInfo(`resultCountOf(value="YDk2rVo0QR"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResultCountOf_0100 end`);
    });
  });
}
