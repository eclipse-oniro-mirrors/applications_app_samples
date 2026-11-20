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
import { CityPickerState } from '../model/CityPickerLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Location]';
const BUNDLE: string = 'Location_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for CityPickerState.setLastLocation (4 cases). */
export default function cityPickerStateSetLastLocation5Test(): void {
  describe('CityPickerStateSetLastLocation5Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0328
     * @tc.name      Location_CityPickerStateSetLastLocation_0328
     * @tc.desc      CityPickerState.setLastLocation(latitude=25, longitude=192) yields 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0328', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0328 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(25, 192);
      logInfo(`setLastLocation(latitude=25, longitude=19...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(25);
      logInfo(`setLastLocation(latitude=25, longitude=19...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(192);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0328 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0329
     * @tc.name      Location_CityPickerStateSetLastLocation_0329
     * @tc.desc      CityPickerState.setLastLocation(latitude=25, longitude=78) yields 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0329', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0329 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(25, 78);
      logInfo(`setLastLocation(latitude=25, longitude=78...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(25);
      logInfo(`setLastLocation(latitude=25, longitude=78...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(78);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0329 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0330
     * @tc.name      Location_CityPickerStateSetLastLocation_0330
     * @tc.desc      CityPickerState.setLastLocation(latitude=30, longitude=0) yields 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0330', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0330 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(30, 0);
      logInfo(`setLastLocation(latitude=30, longitude=0)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(30);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0330 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0331
     * @tc.name      Location_CityPickerStateSetLastLocation_0331
     * @tc.desc      CityPickerState.setLastLocation(latitude=30, longitude=-1) yields 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0331', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0331 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(30, -1);
      logInfo(`setLastLocation(latitude=30, longitude=-1...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(30);
      logInfo(`setLastLocation(latitude=30, longitude=-1...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(-1);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0331 end`);
    });
  });
}
