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
import { HOT_CITY } from '../../../../main/ets/CitySearchTestBridge';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CitySearch]';
const BUNDLE: string = 'CitySearch_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for CitySearchTestBridge (1 cases). */
export default function citySearchTestBridgeConstantsTest(): void {
  describe('CitySearchTestBridgeConstantsTest', () => {
    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_TEST_BRIDGE_CONSTANTS_0001
     * @tc.name      CitySearch_CitySearchTestBridgeConstants_0001
     * @tc.desc      HOT_CITY keeps value ["??","??","??"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_CitySearchTestBridgeConstants_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CitySearchTestBridgeConstants_0001 begin`);
      const actual: string[] = HOT_CITY;
      logInfo(`HOT_CITY: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(12);
      logInfo(`HOT_CITY: JSON.stringify(actual.slice(0, 3))=${JSON.stringify(actual.slice(0, 3))}`);
      expect(JSON.stringify(actual.slice(0, 3))).assertEqual('["\u5317\u4eac","\u4e0a\u6d77","\u5e7f\u5dde"]');
      logInfo(`HOT_CITY: JSON.stringify(actual.slice(6, 9))=${JSON.stringify(actual.slice(6, 9))}`);
      expect(JSON.stringify(actual.slice(6, 9))).assertEqual('["\u82cf\u5dde","\u5929\u6d25","\u6b66\u6c49"]');
      logInfo(`HOT_CITY: JSON.stringify(actual.slice(9, 12))=${JSON.stringify(actual.slice(9, 12))}`);
      expect(JSON.stringify(actual.slice(9, 12))).assertEqual('["\u957f\u6c99","\u91cd\u5e86","\u6210\u90fd"]');
      logInfo(`${BUNDLE}CitySearchTestBridgeConstants_0001 end`);
    });
  });
}
