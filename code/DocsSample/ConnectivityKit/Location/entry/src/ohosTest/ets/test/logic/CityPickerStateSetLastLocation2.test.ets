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

/** Logic checks for CityPickerState.setLastLocation (81 cases). */
export default function cityPickerStateSetLastLocation2Test(): void {
  describe('CityPickerStateSetLastLocation2Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0085
     * @tc.name      Location_CityPickerStateSetLastLocation_0085
     * @tc.desc      CityPickerState.setLastLocation(latitude=1, longitude=105) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0085 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(1, 105);
      logInfo(`setLastLocation(latitude=1, longitude=105...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(1);
      logInfo(`setLastLocation(latitude=1, longitude=105...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(105);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0085 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0086
     * @tc.name      Location_CityPickerStateSetLastLocation_0086
     * @tc.desc      CityPickerState.setLastLocation(latitude=1, longitude=110) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0086 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(1, 110);
      logInfo(`setLastLocation(latitude=1, longitude=110...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(1);
      logInfo(`setLastLocation(latitude=1, longitude=110...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(110);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0086 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0087
     * @tc.name      Location_CityPickerStateSetLastLocation_0087
     * @tc.desc      CityPickerState.setLastLocation(latitude=1, longitude=115) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0087 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(1, 115);
      logInfo(`setLastLocation(latitude=1, longitude=115...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(1);
      logInfo(`setLastLocation(latitude=1, longitude=115...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(115);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0087 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0088
     * @tc.name      Location_CityPickerStateSetLastLocation_0088
     * @tc.desc      CityPickerState.setLastLocation(latitude=1, longitude=192) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0088 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(1, 192);
      logInfo(`setLastLocation(latitude=1, longitude=192...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(1);
      logInfo(`setLastLocation(latitude=1, longitude=192...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(192);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0088 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0089
     * @tc.name      Location_CityPickerStateSetLastLocation_0089
     * @tc.desc      CityPickerState.setLastLocation(latitude=1, longitude=78) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0089 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(1, 78);
      logInfo(`setLastLocation(latitude=1, longitude=78)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(1);
      logInfo(`setLastLocation(latitude=1, longitude=78)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(78);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0089 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0090
     * @tc.name      Location_CityPickerStateSetLastLocation_0090
     * @tc.desc      CityPickerState.setLastLocation(latitude=2, longitude=0) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0090 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(2, 0);
      logInfo(`setLastLocation(latitude=2, longitude=0) ...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(2);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0090 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0091
     * @tc.name      Location_CityPickerStateSetLastLocation_0091
     * @tc.desc      CityPickerState.setLastLocation(latitude=2, longitude=-1) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0091 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(2, -1);
      logInfo(`setLastLocation(latitude=2, longitude=-1)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(2);
      logInfo(`setLastLocation(latitude=2, longitude=-1)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(-1);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0091 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0092
     * @tc.name      Location_CityPickerStateSetLastLocation_0092
     * @tc.desc      CityPickerState.setLastLocation(latitude=2, longitude=1) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0092 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(2, 1);
      logInfo(`setLastLocation(latitude=2, longitude=1) ...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(2);
      logInfo(`setLastLocation(latitude=2, longitude=1) ...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(1);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0092 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0093
     * @tc.name      Location_CityPickerStateSetLastLocation_0093
     * @tc.desc      CityPickerState.setLastLocation(latitude=2, longitude=2) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0093 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(2, 2);
      logInfo(`setLastLocation(latitude=2, longitude=2) ...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(2);
      logInfo(`setLastLocation(latitude=2, longitude=2) ...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(2);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0093 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0094
     * @tc.name      Location_CityPickerStateSetLastLocation_0094
     * @tc.desc      CityPickerState.setLastLocation(latitude=2, longitude=3) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0094 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(2, 3);
      logInfo(`setLastLocation(latitude=2, longitude=3) ...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(2);
      logInfo(`setLastLocation(latitude=2, longitude=3) ...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(3);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0094 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0095
     * @tc.name      Location_CityPickerStateSetLastLocation_0095
     * @tc.desc      CityPickerState.setLastLocation(latitude=2, longitude=10) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0095 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(2, 10);
      logInfo(`setLastLocation(latitude=2, longitude=10)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(2);
      logInfo(`setLastLocation(latitude=2, longitude=10)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(10);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0095 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0096
     * @tc.name      Location_CityPickerStateSetLastLocation_0096
     * @tc.desc      CityPickerState.setLastLocation(latitude=2, longitude=100) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0096 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(2, 100);
      logInfo(`setLastLocation(latitude=2, longitude=100...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(2);
      logInfo(`setLastLocation(latitude=2, longitude=100...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(100);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0096 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0097
     * @tc.name      Location_CityPickerStateSetLastLocation_0097
     * @tc.desc      CityPickerState.setLastLocation(latitude=2, longitude=5) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0097 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(2, 5);
      logInfo(`setLastLocation(latitude=2, longitude=5) ...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(2);
      logInfo(`setLastLocation(latitude=2, longitude=5) ...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(5);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0097 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0098
     * @tc.name      Location_CityPickerStateSetLastLocation_0098
     * @tc.desc      CityPickerState.setLastLocation(latitude=2, longitude=15) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0098 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(2, 15);
      logInfo(`setLastLocation(latitude=2, longitude=15)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(2);
      logInfo(`setLastLocation(latitude=2, longitude=15)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(15);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0098 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0099
     * @tc.name      Location_CityPickerStateSetLastLocation_0099
     * @tc.desc      CityPickerState.setLastLocation(latitude=2, longitude=20) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0099 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(2, 20);
      logInfo(`setLastLocation(latitude=2, longitude=20)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(2);
      logInfo(`setLastLocation(latitude=2, longitude=20)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(20);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0099 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0100
     * @tc.name      Location_CityPickerStateSetLastLocation_0100
     * @tc.desc      CityPickerState.setLastLocation(latitude=2, longitude=25) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0100 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(2, 25);
      logInfo(`setLastLocation(latitude=2, longitude=25)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(2);
      logInfo(`setLastLocation(latitude=2, longitude=25)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(25);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0100 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0101
     * @tc.name      Location_CityPickerStateSetLastLocation_0101
     * @tc.desc      CityPickerState.setLastLocation(latitude=2, longitude=30) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0101 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(2, 30);
      logInfo(`setLastLocation(latitude=2, longitude=30)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(2);
      logInfo(`setLastLocation(latitude=2, longitude=30)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(30);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0101 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0102
     * @tc.name      Location_CityPickerStateSetLastLocation_0102
     * @tc.desc      CityPickerState.setLastLocation(latitude=2, longitude=35) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0102 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(2, 35);
      logInfo(`setLastLocation(latitude=2, longitude=35)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(2);
      logInfo(`setLastLocation(latitude=2, longitude=35)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(35);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0102 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0103
     * @tc.name      Location_CityPickerStateSetLastLocation_0103
     * @tc.desc      CityPickerState.setLastLocation(latitude=2, longitude=40) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0103 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(2, 40);
      logInfo(`setLastLocation(latitude=2, longitude=40)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(2);
      logInfo(`setLastLocation(latitude=2, longitude=40)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(40);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0103 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0104
     * @tc.name      Location_CityPickerStateSetLastLocation_0104
     * @tc.desc      CityPickerState.setLastLocation(latitude=2, longitude=45) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0104 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(2, 45);
      logInfo(`setLastLocation(latitude=2, longitude=45)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(2);
      logInfo(`setLastLocation(latitude=2, longitude=45)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(45);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0104 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0105
     * @tc.name      Location_CityPickerStateSetLastLocation_0105
     * @tc.desc      CityPickerState.setLastLocation(latitude=2, longitude=50) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0105 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(2, 50);
      logInfo(`setLastLocation(latitude=2, longitude=50)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(2);
      logInfo(`setLastLocation(latitude=2, longitude=50)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(50);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0105 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0106
     * @tc.name      Location_CityPickerStateSetLastLocation_0106
     * @tc.desc      CityPickerState.setLastLocation(latitude=2, longitude=55) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0106 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(2, 55);
      logInfo(`setLastLocation(latitude=2, longitude=55)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(2);
      logInfo(`setLastLocation(latitude=2, longitude=55)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(55);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0106 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0107
     * @tc.name      Location_CityPickerStateSetLastLocation_0107
     * @tc.desc      CityPickerState.setLastLocation(latitude=2, longitude=60) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0107 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(2, 60);
      logInfo(`setLastLocation(latitude=2, longitude=60)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(2);
      logInfo(`setLastLocation(latitude=2, longitude=60)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(60);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0107 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0108
     * @tc.name      Location_CityPickerStateSetLastLocation_0108
     * @tc.desc      CityPickerState.setLastLocation(latitude=2, longitude=65) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0108 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(2, 65);
      logInfo(`setLastLocation(latitude=2, longitude=65)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(2);
      logInfo(`setLastLocation(latitude=2, longitude=65)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(65);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0108 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0109
     * @tc.name      Location_CityPickerStateSetLastLocation_0109
     * @tc.desc      CityPickerState.setLastLocation(latitude=2, longitude=70) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0109 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(2, 70);
      logInfo(`setLastLocation(latitude=2, longitude=70)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(2);
      logInfo(`setLastLocation(latitude=2, longitude=70)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(70);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0109 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0110
     * @tc.name      Location_CityPickerStateSetLastLocation_0110
     * @tc.desc      CityPickerState.setLastLocation(latitude=2, longitude=75) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0110 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(2, 75);
      logInfo(`setLastLocation(latitude=2, longitude=75)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(2);
      logInfo(`setLastLocation(latitude=2, longitude=75)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(75);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0110 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0111
     * @tc.name      Location_CityPickerStateSetLastLocation_0111
     * @tc.desc      CityPickerState.setLastLocation(latitude=2, longitude=80) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0111 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(2, 80);
      logInfo(`setLastLocation(latitude=2, longitude=80)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(2);
      logInfo(`setLastLocation(latitude=2, longitude=80)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(80);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0111 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0112
     * @tc.name      Location_CityPickerStateSetLastLocation_0112
     * @tc.desc      CityPickerState.setLastLocation(latitude=2, longitude=85) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0112 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(2, 85);
      logInfo(`setLastLocation(latitude=2, longitude=85)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(2);
      logInfo(`setLastLocation(latitude=2, longitude=85)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(85);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0112 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0113
     * @tc.name      Location_CityPickerStateSetLastLocation_0113
     * @tc.desc      CityPickerState.setLastLocation(latitude=2, longitude=90) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0113 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(2, 90);
      logInfo(`setLastLocation(latitude=2, longitude=90)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(2);
      logInfo(`setLastLocation(latitude=2, longitude=90)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(90);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0113 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0114
     * @tc.name      Location_CityPickerStateSetLastLocation_0114
     * @tc.desc      CityPickerState.setLastLocation(latitude=2, longitude=95) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0114 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(2, 95);
      logInfo(`setLastLocation(latitude=2, longitude=95)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(2);
      logInfo(`setLastLocation(latitude=2, longitude=95)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(95);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0114 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0115
     * @tc.name      Location_CityPickerStateSetLastLocation_0115
     * @tc.desc      CityPickerState.setLastLocation(latitude=2, longitude=105) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0115 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(2, 105);
      logInfo(`setLastLocation(latitude=2, longitude=105...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(2);
      logInfo(`setLastLocation(latitude=2, longitude=105...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(105);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0115 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0116
     * @tc.name      Location_CityPickerStateSetLastLocation_0116
     * @tc.desc      CityPickerState.setLastLocation(latitude=2, longitude=110) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0116 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(2, 110);
      logInfo(`setLastLocation(latitude=2, longitude=110...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(2);
      logInfo(`setLastLocation(latitude=2, longitude=110...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(110);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0116 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0117
     * @tc.name      Location_CityPickerStateSetLastLocation_0117
     * @tc.desc      CityPickerState.setLastLocation(latitude=2, longitude=115) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0117 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(2, 115);
      logInfo(`setLastLocation(latitude=2, longitude=115...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(2);
      logInfo(`setLastLocation(latitude=2, longitude=115...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(115);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0117 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0118
     * @tc.name      Location_CityPickerStateSetLastLocation_0118
     * @tc.desc      CityPickerState.setLastLocation(latitude=2, longitude=192) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0118 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(2, 192);
      logInfo(`setLastLocation(latitude=2, longitude=192...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(2);
      logInfo(`setLastLocation(latitude=2, longitude=192...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(192);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0118 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0119
     * @tc.name      Location_CityPickerStateSetLastLocation_0119
     * @tc.desc      CityPickerState.setLastLocation(latitude=2, longitude=78) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0119 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(2, 78);
      logInfo(`setLastLocation(latitude=2, longitude=78)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(2);
      logInfo(`setLastLocation(latitude=2, longitude=78)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(78);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0119 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0120
     * @tc.name      Location_CityPickerStateSetLastLocation_0120
     * @tc.desc      CityPickerState.setLastLocation(latitude=3, longitude=0) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0120 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(3, 0);
      logInfo(`setLastLocation(latitude=3, longitude=0) ...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(3);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0120 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0121
     * @tc.name      Location_CityPickerStateSetLastLocation_0121
     * @tc.desc      CityPickerState.setLastLocation(latitude=3, longitude=-1) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0121 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(3, -1);
      logInfo(`setLastLocation(latitude=3, longitude=-1)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(3);
      logInfo(`setLastLocation(latitude=3, longitude=-1)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(-1);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0121 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0122
     * @tc.name      Location_CityPickerStateSetLastLocation_0122
     * @tc.desc      CityPickerState.setLastLocation(latitude=3, longitude=1) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0122 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(3, 1);
      logInfo(`setLastLocation(latitude=3, longitude=1) ...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(3);
      logInfo(`setLastLocation(latitude=3, longitude=1) ...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(1);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0122 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0123
     * @tc.name      Location_CityPickerStateSetLastLocation_0123
     * @tc.desc      CityPickerState.setLastLocation(latitude=3, longitude=2) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0123 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(3, 2);
      logInfo(`setLastLocation(latitude=3, longitude=2) ...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(3);
      logInfo(`setLastLocation(latitude=3, longitude=2) ...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(2);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0123 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0124
     * @tc.name      Location_CityPickerStateSetLastLocation_0124
     * @tc.desc      CityPickerState.setLastLocation(latitude=3, longitude=3) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0124 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(3, 3);
      logInfo(`setLastLocation(latitude=3, longitude=3) ...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(3);
      logInfo(`setLastLocation(latitude=3, longitude=3) ...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(3);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0124 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0125
     * @tc.name      Location_CityPickerStateSetLastLocation_0125
     * @tc.desc      CityPickerState.setLastLocation(latitude=3, longitude=10) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0125 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(3, 10);
      logInfo(`setLastLocation(latitude=3, longitude=10)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(3);
      logInfo(`setLastLocation(latitude=3, longitude=10)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(10);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0125 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0126
     * @tc.name      Location_CityPickerStateSetLastLocation_0126
     * @tc.desc      CityPickerState.setLastLocation(latitude=3, longitude=100) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0126 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(3, 100);
      logInfo(`setLastLocation(latitude=3, longitude=100...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(3);
      logInfo(`setLastLocation(latitude=3, longitude=100...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(100);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0126 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0127
     * @tc.name      Location_CityPickerStateSetLastLocation_0127
     * @tc.desc      CityPickerState.setLastLocation(latitude=3, longitude=5) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0127 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(3, 5);
      logInfo(`setLastLocation(latitude=3, longitude=5) ...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(3);
      logInfo(`setLastLocation(latitude=3, longitude=5) ...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(5);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0127 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0128
     * @tc.name      Location_CityPickerStateSetLastLocation_0128
     * @tc.desc      CityPickerState.setLastLocation(latitude=3, longitude=15) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0128 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(3, 15);
      logInfo(`setLastLocation(latitude=3, longitude=15)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(3);
      logInfo(`setLastLocation(latitude=3, longitude=15)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(15);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0128 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0129
     * @tc.name      Location_CityPickerStateSetLastLocation_0129
     * @tc.desc      CityPickerState.setLastLocation(latitude=3, longitude=20) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0129 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(3, 20);
      logInfo(`setLastLocation(latitude=3, longitude=20)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(3);
      logInfo(`setLastLocation(latitude=3, longitude=20)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(20);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0129 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0130
     * @tc.name      Location_CityPickerStateSetLastLocation_0130
     * @tc.desc      CityPickerState.setLastLocation(latitude=3, longitude=25) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0130 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(3, 25);
      logInfo(`setLastLocation(latitude=3, longitude=25)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(3);
      logInfo(`setLastLocation(latitude=3, longitude=25)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(25);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0130 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0131
     * @tc.name      Location_CityPickerStateSetLastLocation_0131
     * @tc.desc      CityPickerState.setLastLocation(latitude=3, longitude=30) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0131 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(3, 30);
      logInfo(`setLastLocation(latitude=3, longitude=30)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(3);
      logInfo(`setLastLocation(latitude=3, longitude=30)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(30);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0131 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0132
     * @tc.name      Location_CityPickerStateSetLastLocation_0132
     * @tc.desc      CityPickerState.setLastLocation(latitude=3, longitude=35) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0132 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(3, 35);
      logInfo(`setLastLocation(latitude=3, longitude=35)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(3);
      logInfo(`setLastLocation(latitude=3, longitude=35)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(35);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0132 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0133
     * @tc.name      Location_CityPickerStateSetLastLocation_0133
     * @tc.desc      CityPickerState.setLastLocation(latitude=3, longitude=40) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0133 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(3, 40);
      logInfo(`setLastLocation(latitude=3, longitude=40)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(3);
      logInfo(`setLastLocation(latitude=3, longitude=40)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(40);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0133 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0134
     * @tc.name      Location_CityPickerStateSetLastLocation_0134
     * @tc.desc      CityPickerState.setLastLocation(latitude=3, longitude=45) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0134 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(3, 45);
      logInfo(`setLastLocation(latitude=3, longitude=45)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(3);
      logInfo(`setLastLocation(latitude=3, longitude=45)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(45);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0134 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0135
     * @tc.name      Location_CityPickerStateSetLastLocation_0135
     * @tc.desc      CityPickerState.setLastLocation(latitude=3, longitude=50) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0135 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(3, 50);
      logInfo(`setLastLocation(latitude=3, longitude=50)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(3);
      logInfo(`setLastLocation(latitude=3, longitude=50)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(50);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0135 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0136
     * @tc.name      Location_CityPickerStateSetLastLocation_0136
     * @tc.desc      CityPickerState.setLastLocation(latitude=3, longitude=55) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0136 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(3, 55);
      logInfo(`setLastLocation(latitude=3, longitude=55)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(3);
      logInfo(`setLastLocation(latitude=3, longitude=55)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(55);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0136 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0137
     * @tc.name      Location_CityPickerStateSetLastLocation_0137
     * @tc.desc      CityPickerState.setLastLocation(latitude=3, longitude=60) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0137 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(3, 60);
      logInfo(`setLastLocation(latitude=3, longitude=60)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(3);
      logInfo(`setLastLocation(latitude=3, longitude=60)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(60);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0137 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0138
     * @tc.name      Location_CityPickerStateSetLastLocation_0138
     * @tc.desc      CityPickerState.setLastLocation(latitude=3, longitude=65) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0138 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(3, 65);
      logInfo(`setLastLocation(latitude=3, longitude=65)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(3);
      logInfo(`setLastLocation(latitude=3, longitude=65)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(65);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0138 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0139
     * @tc.name      Location_CityPickerStateSetLastLocation_0139
     * @tc.desc      CityPickerState.setLastLocation(latitude=3, longitude=70) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0139 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(3, 70);
      logInfo(`setLastLocation(latitude=3, longitude=70)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(3);
      logInfo(`setLastLocation(latitude=3, longitude=70)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(70);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0139 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0140
     * @tc.name      Location_CityPickerStateSetLastLocation_0140
     * @tc.desc      CityPickerState.setLastLocation(latitude=3, longitude=75) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0140 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(3, 75);
      logInfo(`setLastLocation(latitude=3, longitude=75)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(3);
      logInfo(`setLastLocation(latitude=3, longitude=75)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(75);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0140 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0141
     * @tc.name      Location_CityPickerStateSetLastLocation_0141
     * @tc.desc      CityPickerState.setLastLocation(latitude=3, longitude=80) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0141 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(3, 80);
      logInfo(`setLastLocation(latitude=3, longitude=80)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(3);
      logInfo(`setLastLocation(latitude=3, longitude=80)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(80);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0141 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0142
     * @tc.name      Location_CityPickerStateSetLastLocation_0142
     * @tc.desc      CityPickerState.setLastLocation(latitude=3, longitude=85) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0142 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(3, 85);
      logInfo(`setLastLocation(latitude=3, longitude=85)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(3);
      logInfo(`setLastLocation(latitude=3, longitude=85)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(85);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0142 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0143
     * @tc.name      Location_CityPickerStateSetLastLocation_0143
     * @tc.desc      CityPickerState.setLastLocation(latitude=3, longitude=90) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0143 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(3, 90);
      logInfo(`setLastLocation(latitude=3, longitude=90)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(3);
      logInfo(`setLastLocation(latitude=3, longitude=90)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(90);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0143 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0144
     * @tc.name      Location_CityPickerStateSetLastLocation_0144
     * @tc.desc      CityPickerState.setLastLocation(latitude=3, longitude=95) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0144 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(3, 95);
      logInfo(`setLastLocation(latitude=3, longitude=95)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(3);
      logInfo(`setLastLocation(latitude=3, longitude=95)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(95);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0144 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0145
     * @tc.name      Location_CityPickerStateSetLastLocation_0145
     * @tc.desc      CityPickerState.setLastLocation(latitude=3, longitude=105) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0145 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(3, 105);
      logInfo(`setLastLocation(latitude=3, longitude=105...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(3);
      logInfo(`setLastLocation(latitude=3, longitude=105...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(105);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0145 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0146
     * @tc.name      Location_CityPickerStateSetLastLocation_0146
     * @tc.desc      CityPickerState.setLastLocation(latitude=3, longitude=110) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0146 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(3, 110);
      logInfo(`setLastLocation(latitude=3, longitude=110...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(3);
      logInfo(`setLastLocation(latitude=3, longitude=110...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(110);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0146 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0147
     * @tc.name      Location_CityPickerStateSetLastLocation_0147
     * @tc.desc      CityPickerState.setLastLocation(latitude=3, longitude=115) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0147 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(3, 115);
      logInfo(`setLastLocation(latitude=3, longitude=115...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(3);
      logInfo(`setLastLocation(latitude=3, longitude=115...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(115);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0147 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0148
     * @tc.name      Location_CityPickerStateSetLastLocation_0148
     * @tc.desc      CityPickerState.setLastLocation(latitude=3, longitude=192) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0148 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(3, 192);
      logInfo(`setLastLocation(latitude=3, longitude=192...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(3);
      logInfo(`setLastLocation(latitude=3, longitude=192...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(192);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0148 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0149
     * @tc.name      Location_CityPickerStateSetLastLocation_0149
     * @tc.desc      CityPickerState.setLastLocation(latitude=3, longitude=78) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0149 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(3, 78);
      logInfo(`setLastLocation(latitude=3, longitude=78)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(3);
      logInfo(`setLastLocation(latitude=3, longitude=78)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(78);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0149 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0150
     * @tc.name      Location_CityPickerStateSetLastLocation_0150
     * @tc.desc      CityPickerState.setLastLocation(latitude=10, longitude=0) yields 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0150 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(10, 0);
      logInfo(`setLastLocation(latitude=10, longitude=0)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(10);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0150 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0151
     * @tc.name      Location_CityPickerStateSetLastLocation_0151
     * @tc.desc      CityPickerState.setLastLocation(latitude=10, longitude=-1) yields 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0151 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(10, -1);
      logInfo(`setLastLocation(latitude=10, longitude=-1...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(10);
      logInfo(`setLastLocation(latitude=10, longitude=-1...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(-1);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0151 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0152
     * @tc.name      Location_CityPickerStateSetLastLocation_0152
     * @tc.desc      CityPickerState.setLastLocation(latitude=10, longitude=1) yields 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0152 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(10, 1);
      logInfo(`setLastLocation(latitude=10, longitude=1)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(10);
      logInfo(`setLastLocation(latitude=10, longitude=1)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(1);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0152 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0153
     * @tc.name      Location_CityPickerStateSetLastLocation_0153
     * @tc.desc      CityPickerState.setLastLocation(latitude=10, longitude=2) yields 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0153 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(10, 2);
      logInfo(`setLastLocation(latitude=10, longitude=2)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(10);
      logInfo(`setLastLocation(latitude=10, longitude=2)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(2);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0153 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0154
     * @tc.name      Location_CityPickerStateSetLastLocation_0154
     * @tc.desc      CityPickerState.setLastLocation(latitude=10, longitude=3) yields 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0154 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(10, 3);
      logInfo(`setLastLocation(latitude=10, longitude=3)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(10);
      logInfo(`setLastLocation(latitude=10, longitude=3)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(3);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0154 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0155
     * @tc.name      Location_CityPickerStateSetLastLocation_0155
     * @tc.desc      CityPickerState.setLastLocation(latitude=10, longitude=10) yields 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0155 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(10, 10);
      logInfo(`setLastLocation(latitude=10, longitude=10...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(10);
      logInfo(`setLastLocation(latitude=10, longitude=10...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(10);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0155 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0156
     * @tc.name      Location_CityPickerStateSetLastLocation_0156
     * @tc.desc      CityPickerState.setLastLocation(latitude=10, longitude=100) yields 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0156 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(10, 100);
      logInfo(`setLastLocation(latitude=10, longitude=10...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(10);
      logInfo(`setLastLocation(latitude=10, longitude=10...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(100);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0156 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0157
     * @tc.name      Location_CityPickerStateSetLastLocation_0157
     * @tc.desc      CityPickerState.setLastLocation(latitude=10, longitude=5) yields 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0157 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(10, 5);
      logInfo(`setLastLocation(latitude=10, longitude=5)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(10);
      logInfo(`setLastLocation(latitude=10, longitude=5)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(5);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0157 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0158
     * @tc.name      Location_CityPickerStateSetLastLocation_0158
     * @tc.desc      CityPickerState.setLastLocation(latitude=10, longitude=15) yields 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0158 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(10, 15);
      logInfo(`setLastLocation(latitude=10, longitude=15...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(10);
      logInfo(`setLastLocation(latitude=10, longitude=15...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(15);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0158 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0159
     * @tc.name      Location_CityPickerStateSetLastLocation_0159
     * @tc.desc      CityPickerState.setLastLocation(latitude=10, longitude=20) yields 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0159 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(10, 20);
      logInfo(`setLastLocation(latitude=10, longitude=20...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(10);
      logInfo(`setLastLocation(latitude=10, longitude=20...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(20);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0159 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0160
     * @tc.name      Location_CityPickerStateSetLastLocation_0160
     * @tc.desc      CityPickerState.setLastLocation(latitude=10, longitude=25) yields 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0160 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(10, 25);
      logInfo(`setLastLocation(latitude=10, longitude=25...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(10);
      logInfo(`setLastLocation(latitude=10, longitude=25...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(25);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0160 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0161
     * @tc.name      Location_CityPickerStateSetLastLocation_0161
     * @tc.desc      CityPickerState.setLastLocation(latitude=10, longitude=30) yields 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0161 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(10, 30);
      logInfo(`setLastLocation(latitude=10, longitude=30...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(10);
      logInfo(`setLastLocation(latitude=10, longitude=30...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(30);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0161 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0162
     * @tc.name      Location_CityPickerStateSetLastLocation_0162
     * @tc.desc      CityPickerState.setLastLocation(latitude=10, longitude=35) yields 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0162 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(10, 35);
      logInfo(`setLastLocation(latitude=10, longitude=35...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(10);
      logInfo(`setLastLocation(latitude=10, longitude=35...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(35);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0162 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0163
     * @tc.name      Location_CityPickerStateSetLastLocation_0163
     * @tc.desc      CityPickerState.setLastLocation(latitude=10, longitude=40) yields 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0163 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(10, 40);
      logInfo(`setLastLocation(latitude=10, longitude=40...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(10);
      logInfo(`setLastLocation(latitude=10, longitude=40...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(40);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0163 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0164
     * @tc.name      Location_CityPickerStateSetLastLocation_0164
     * @tc.desc      CityPickerState.setLastLocation(latitude=10, longitude=45) yields 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0164 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(10, 45);
      logInfo(`setLastLocation(latitude=10, longitude=45...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(10);
      logInfo(`setLastLocation(latitude=10, longitude=45...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(45);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0164 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0165
     * @tc.name      Location_CityPickerStateSetLastLocation_0165
     * @tc.desc      CityPickerState.setLastLocation(latitude=10, longitude=50) yields 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0165 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(10, 50);
      logInfo(`setLastLocation(latitude=10, longitude=50...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(10);
      logInfo(`setLastLocation(latitude=10, longitude=50...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(50);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0165 end`);
    });
  });
}
