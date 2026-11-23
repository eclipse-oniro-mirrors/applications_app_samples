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
import { yieldToEventLoop } from '../TestYield';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { ListItem, heatCity, listData } from '../../../../main/ets/mock/LocationMock';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Location]';
const BUNDLE: string = 'Location_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for LocationMock (2 cases). */
export default function locationMockConstantsTest(): void {
  describe('LocationMockConstantsTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_LOCATION_LOCATION_MOCK_CONSTANTS_0001
     * @tc.name      Location_LocationMockConstants_0001
     * @tc.desc      listData keeps value len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Location_LocationMockConstants_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LocationMockConstants_0001 begin`);
      const actual: ListItem[] = listData;
      logInfo(`listData: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(15);
      logInfo(`listData: actual[0].name=${actual[0].name}`);
      expect(actual[0].name).assertEqual('A');
      logInfo(`listData: actual[7].name=${actual[7].name}`);
      expect(actual[7].name).assertEqual('L');
      logInfo(`listData: actual[7].city.length=${actual[7].city.length}`);
      expect(actual[7].city.length).assertEqual(1);
      logInfo(`listData: JSON.stringify(actual[7].city)=${JSON.stringify(actual[7].city)}`);
      expect(JSON.stringify(actual[7].city)).assertEqual('["\u8fbd\u5b81"]');
      logInfo(`listData: actual[14].name=${actual[14].name}`);
      expect(actual[14].name).assertEqual('Z');
      logInfo(`listData: actual[14].city.length=${actual[14].city.length}`);
      expect(actual[14].city.length).assertEqual(1);
      logInfo(`${BUNDLE}LocationMockConstants_0001 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_MOCK_CONSTANTS_0002
     * @tc.name      Location_LocationMockConstants_0002
     * @tc.desc      heatCity keeps value ["??","??","??"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Location_LocationMockConstants_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LocationMockConstants_0002 begin`);
      const actual: string[] = heatCity;
      logInfo(`heatCity: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(12);
      logInfo(`heatCity: JSON.stringify(actual.slice(0, 3))=${JSON.stringify(actual.slice(0, 3))}`);
      expect(JSON.stringify(actual.slice(0, 3))).assertEqual('["\u5317\u4eac","\u4e0a\u6d77","\u5e7f\u5dde"]');
      logInfo(`heatCity: JSON.stringify(actual.slice(6, 9))=${JSON.stringify(actual.slice(6, 9))}`);
      expect(JSON.stringify(actual.slice(6, 9))).assertEqual('["\u82cf\u5dde","\u5929\u6d25","\u6b66\u6c49"]');
      logInfo(`heatCity: JSON.stringify(actual.slice(9, 12))=${JSON.stringify(actual.slice(9, 12))}`);
      expect(JSON.stringify(actual.slice(9, 12))).assertEqual('["\u957f\u6c99","\u91cd\u5e86","\u6210\u90fd"]');
      logInfo(`${BUNDLE}LocationMockConstants_0002 end`);
    });
  });
}
