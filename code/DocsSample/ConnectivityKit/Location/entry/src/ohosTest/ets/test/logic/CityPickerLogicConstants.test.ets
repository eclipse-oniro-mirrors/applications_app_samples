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
import { REQUEST_MAX_ACCURACY, REQUEST_PRIORITY, REQUEST_SCENARIO, SUB_CITY_LITERAL } from '../model/CityPickerLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Location]';
const BUNDLE: string = 'Location_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for CityPickerLogic (4 cases). */
export default function cityPickerLogicConstantsTest(): void {
  describe('CityPickerLogicConstantsTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_LOGIC_CONSTANTS_0001
     * @tc.name      Location_CityPickerLogicConstants_0001
     * @tc.desc      REQUEST_PRIORITY keeps value 515
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Location_CityPickerLogicConstants_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CityPickerLogicConstants_0001 begin`);
      const actual: number = REQUEST_PRIORITY;
      logInfo(`REQUEST_PRIORITY: actual=${actual}`);
      expect(actual).assertEqual(515);
      logInfo(`${BUNDLE}CityPickerLogicConstants_0001 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_LOGIC_CONSTANTS_0002
     * @tc.name      Location_CityPickerLogicConstants_0002
     * @tc.desc      REQUEST_SCENARIO keeps value 768
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Location_CityPickerLogicConstants_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CityPickerLogicConstants_0002 begin`);
      const actual: number = REQUEST_SCENARIO;
      logInfo(`REQUEST_SCENARIO: actual=${actual}`);
      expect(actual).assertEqual(768);
      logInfo(`${BUNDLE}CityPickerLogicConstants_0002 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_LOGIC_CONSTANTS_0003
     * @tc.name      Location_CityPickerLogicConstants_0003
     * @tc.desc      REQUEST_MAX_ACCURACY keeps value 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerLogicConstants_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerLogicConstants_0003 begin`);
      const actual: number = REQUEST_MAX_ACCURACY;
      logInfo(`REQUEST_MAX_ACCURACY: actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}CityPickerLogicConstants_0003 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_LOGIC_CONSTANTS_0004
     * @tc.name      Location_CityPickerLogicConstants_0004
     * @tc.desc      SUB_CITY_LITERAL keeps value "$ {item.name/$ {secondCity}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerLogicConstants_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerLogicConstants_0004 begin`);
      const actual: string = SUB_CITY_LITERAL;
      logInfo(`SUB_CITY_LITERAL: actual=${actual}`);
      expect(actual).assertEqual('${item.name/${secondCity}}');
      logInfo(`${BUNDLE}CityPickerLogicConstants_0004 end`);
    });
  });
}
