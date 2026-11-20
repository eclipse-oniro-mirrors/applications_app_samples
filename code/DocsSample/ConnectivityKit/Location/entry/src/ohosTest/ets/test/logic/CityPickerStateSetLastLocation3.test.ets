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
export default function cityPickerStateSetLastLocation3Test(): void {
  describe('CityPickerStateSetLastLocation3Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0166
     * @tc.name      Location_CityPickerStateSetLastLocation_0166
     * @tc.desc      CityPickerState.setLastLocation(latitude=10, longitude=55) yields 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0166 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(10, 55);
      logInfo(`setLastLocation(latitude=10, longitude=55...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(10);
      logInfo(`setLastLocation(latitude=10, longitude=55...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(55);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0166 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0167
     * @tc.name      Location_CityPickerStateSetLastLocation_0167
     * @tc.desc      CityPickerState.setLastLocation(latitude=10, longitude=60) yields 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0167 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(10, 60);
      logInfo(`setLastLocation(latitude=10, longitude=60...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(10);
      logInfo(`setLastLocation(latitude=10, longitude=60...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(60);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0167 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0168
     * @tc.name      Location_CityPickerStateSetLastLocation_0168
     * @tc.desc      CityPickerState.setLastLocation(latitude=10, longitude=65) yields 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0168 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(10, 65);
      logInfo(`setLastLocation(latitude=10, longitude=65...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(10);
      logInfo(`setLastLocation(latitude=10, longitude=65...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(65);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0168 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0169
     * @tc.name      Location_CityPickerStateSetLastLocation_0169
     * @tc.desc      CityPickerState.setLastLocation(latitude=10, longitude=70) yields 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0169 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(10, 70);
      logInfo(`setLastLocation(latitude=10, longitude=70...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(10);
      logInfo(`setLastLocation(latitude=10, longitude=70...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(70);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0169 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0170
     * @tc.name      Location_CityPickerStateSetLastLocation_0170
     * @tc.desc      CityPickerState.setLastLocation(latitude=10, longitude=75) yields 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0170 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(10, 75);
      logInfo(`setLastLocation(latitude=10, longitude=75...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(10);
      logInfo(`setLastLocation(latitude=10, longitude=75...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(75);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0170 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0171
     * @tc.name      Location_CityPickerStateSetLastLocation_0171
     * @tc.desc      CityPickerState.setLastLocation(latitude=10, longitude=80) yields 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0171 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(10, 80);
      logInfo(`setLastLocation(latitude=10, longitude=80...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(10);
      logInfo(`setLastLocation(latitude=10, longitude=80...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(80);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0171 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0172
     * @tc.name      Location_CityPickerStateSetLastLocation_0172
     * @tc.desc      CityPickerState.setLastLocation(latitude=10, longitude=85) yields 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0172 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(10, 85);
      logInfo(`setLastLocation(latitude=10, longitude=85...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(10);
      logInfo(`setLastLocation(latitude=10, longitude=85...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(85);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0172 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0173
     * @tc.name      Location_CityPickerStateSetLastLocation_0173
     * @tc.desc      CityPickerState.setLastLocation(latitude=10, longitude=90) yields 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0173 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(10, 90);
      logInfo(`setLastLocation(latitude=10, longitude=90...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(10);
      logInfo(`setLastLocation(latitude=10, longitude=90...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(90);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0173 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0174
     * @tc.name      Location_CityPickerStateSetLastLocation_0174
     * @tc.desc      CityPickerState.setLastLocation(latitude=10, longitude=95) yields 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0174 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(10, 95);
      logInfo(`setLastLocation(latitude=10, longitude=95...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(10);
      logInfo(`setLastLocation(latitude=10, longitude=95...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(95);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0174 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0175
     * @tc.name      Location_CityPickerStateSetLastLocation_0175
     * @tc.desc      CityPickerState.setLastLocation(latitude=10, longitude=105) yields 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0175 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(10, 105);
      logInfo(`setLastLocation(latitude=10, longitude=10...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(10);
      logInfo(`setLastLocation(latitude=10, longitude=10...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(105);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0175 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0176
     * @tc.name      Location_CityPickerStateSetLastLocation_0176
     * @tc.desc      CityPickerState.setLastLocation(latitude=10, longitude=110) yields 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0176 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(10, 110);
      logInfo(`setLastLocation(latitude=10, longitude=11...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(10);
      logInfo(`setLastLocation(latitude=10, longitude=11...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(110);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0176 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0177
     * @tc.name      Location_CityPickerStateSetLastLocation_0177
     * @tc.desc      CityPickerState.setLastLocation(latitude=10, longitude=115) yields 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0177 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(10, 115);
      logInfo(`setLastLocation(latitude=10, longitude=11...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(10);
      logInfo(`setLastLocation(latitude=10, longitude=11...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(115);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0177 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0178
     * @tc.name      Location_CityPickerStateSetLastLocation_0178
     * @tc.desc      CityPickerState.setLastLocation(latitude=10, longitude=192) yields 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0178 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(10, 192);
      logInfo(`setLastLocation(latitude=10, longitude=19...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(10);
      logInfo(`setLastLocation(latitude=10, longitude=19...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(192);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0178 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0179
     * @tc.name      Location_CityPickerStateSetLastLocation_0179
     * @tc.desc      CityPickerState.setLastLocation(latitude=10, longitude=78) yields 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0179 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(10, 78);
      logInfo(`setLastLocation(latitude=10, longitude=78...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(10);
      logInfo(`setLastLocation(latitude=10, longitude=78...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(78);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0179 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0180
     * @tc.name      Location_CityPickerStateSetLastLocation_0180
     * @tc.desc      CityPickerState.setLastLocation(latitude=100, longitude=0) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0180 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(100, 0);
      logInfo(`setLastLocation(latitude=100, longitude=0...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(100);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0180 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0181
     * @tc.name      Location_CityPickerStateSetLastLocation_0181
     * @tc.desc      CityPickerState.setLastLocation(latitude=100, longitude=-1) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0181 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(100, -1);
      logInfo(`setLastLocation(latitude=100, longitude=-...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(100);
      logInfo(`setLastLocation(latitude=100, longitude=-...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(-1);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0181 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0182
     * @tc.name      Location_CityPickerStateSetLastLocation_0182
     * @tc.desc      CityPickerState.setLastLocation(latitude=100, longitude=1) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0182 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(100, 1);
      logInfo(`setLastLocation(latitude=100, longitude=1...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(100);
      logInfo(`setLastLocation(latitude=100, longitude=1...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(1);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0182 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0183
     * @tc.name      Location_CityPickerStateSetLastLocation_0183
     * @tc.desc      CityPickerState.setLastLocation(latitude=100, longitude=2) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0183 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(100, 2);
      logInfo(`setLastLocation(latitude=100, longitude=2...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(100);
      logInfo(`setLastLocation(latitude=100, longitude=2...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(2);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0183 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0184
     * @tc.name      Location_CityPickerStateSetLastLocation_0184
     * @tc.desc      CityPickerState.setLastLocation(latitude=100, longitude=3) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0184 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(100, 3);
      logInfo(`setLastLocation(latitude=100, longitude=3...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(100);
      logInfo(`setLastLocation(latitude=100, longitude=3...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(3);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0184 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0185
     * @tc.name      Location_CityPickerStateSetLastLocation_0185
     * @tc.desc      CityPickerState.setLastLocation(latitude=100, longitude=10) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0185 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(100, 10);
      logInfo(`setLastLocation(latitude=100, longitude=1...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(100);
      logInfo(`setLastLocation(latitude=100, longitude=1...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(10);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0185 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0186
     * @tc.name      Location_CityPickerStateSetLastLocation_0186
     * @tc.desc      CityPickerState.setLastLocation(latitude=100, longitude=100) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0186 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(100, 100);
      logInfo(`setLastLocation(latitude=100, longitude=1...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(100);
      logInfo(`setLastLocation(latitude=100, longitude=1...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(100);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0186 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0187
     * @tc.name      Location_CityPickerStateSetLastLocation_0187
     * @tc.desc      CityPickerState.setLastLocation(latitude=100, longitude=5) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0187 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(100, 5);
      logInfo(`setLastLocation(latitude=100, longitude=5...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(100);
      logInfo(`setLastLocation(latitude=100, longitude=5...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(5);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0187 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0188
     * @tc.name      Location_CityPickerStateSetLastLocation_0188
     * @tc.desc      CityPickerState.setLastLocation(latitude=100, longitude=15) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0188 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(100, 15);
      logInfo(`setLastLocation(latitude=100, longitude=1...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(100);
      logInfo(`setLastLocation(latitude=100, longitude=1...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(15);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0188 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0189
     * @tc.name      Location_CityPickerStateSetLastLocation_0189
     * @tc.desc      CityPickerState.setLastLocation(latitude=100, longitude=20) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0189 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(100, 20);
      logInfo(`setLastLocation(latitude=100, longitude=2...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(100);
      logInfo(`setLastLocation(latitude=100, longitude=2...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(20);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0189 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0190
     * @tc.name      Location_CityPickerStateSetLastLocation_0190
     * @tc.desc      CityPickerState.setLastLocation(latitude=100, longitude=25) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0190 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(100, 25);
      logInfo(`setLastLocation(latitude=100, longitude=2...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(100);
      logInfo(`setLastLocation(latitude=100, longitude=2...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(25);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0190 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0191
     * @tc.name      Location_CityPickerStateSetLastLocation_0191
     * @tc.desc      CityPickerState.setLastLocation(latitude=100, longitude=30) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0191 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(100, 30);
      logInfo(`setLastLocation(latitude=100, longitude=3...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(100);
      logInfo(`setLastLocation(latitude=100, longitude=3...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(30);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0191 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0192
     * @tc.name      Location_CityPickerStateSetLastLocation_0192
     * @tc.desc      CityPickerState.setLastLocation(latitude=100, longitude=35) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0192 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(100, 35);
      logInfo(`setLastLocation(latitude=100, longitude=3...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(100);
      logInfo(`setLastLocation(latitude=100, longitude=3...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(35);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0192 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0193
     * @tc.name      Location_CityPickerStateSetLastLocation_0193
     * @tc.desc      CityPickerState.setLastLocation(latitude=100, longitude=40) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0193 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(100, 40);
      logInfo(`setLastLocation(latitude=100, longitude=4...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(100);
      logInfo(`setLastLocation(latitude=100, longitude=4...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(40);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0193 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0194
     * @tc.name      Location_CityPickerStateSetLastLocation_0194
     * @tc.desc      CityPickerState.setLastLocation(latitude=100, longitude=45) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0194 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(100, 45);
      logInfo(`setLastLocation(latitude=100, longitude=4...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(100);
      logInfo(`setLastLocation(latitude=100, longitude=4...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(45);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0194 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0195
     * @tc.name      Location_CityPickerStateSetLastLocation_0195
     * @tc.desc      CityPickerState.setLastLocation(latitude=100, longitude=50) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0195 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(100, 50);
      logInfo(`setLastLocation(latitude=100, longitude=5...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(100);
      logInfo(`setLastLocation(latitude=100, longitude=5...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(50);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0195 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0196
     * @tc.name      Location_CityPickerStateSetLastLocation_0196
     * @tc.desc      CityPickerState.setLastLocation(latitude=100, longitude=55) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0196 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(100, 55);
      logInfo(`setLastLocation(latitude=100, longitude=5...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(100);
      logInfo(`setLastLocation(latitude=100, longitude=5...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(55);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0196 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0197
     * @tc.name      Location_CityPickerStateSetLastLocation_0197
     * @tc.desc      CityPickerState.setLastLocation(latitude=100, longitude=60) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0197 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(100, 60);
      logInfo(`setLastLocation(latitude=100, longitude=6...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(100);
      logInfo(`setLastLocation(latitude=100, longitude=6...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(60);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0197 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0198
     * @tc.name      Location_CityPickerStateSetLastLocation_0198
     * @tc.desc      CityPickerState.setLastLocation(latitude=100, longitude=65) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0198 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(100, 65);
      logInfo(`setLastLocation(latitude=100, longitude=6...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(100);
      logInfo(`setLastLocation(latitude=100, longitude=6...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(65);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0198 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0199
     * @tc.name      Location_CityPickerStateSetLastLocation_0199
     * @tc.desc      CityPickerState.setLastLocation(latitude=100, longitude=70) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0199 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(100, 70);
      logInfo(`setLastLocation(latitude=100, longitude=7...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(100);
      logInfo(`setLastLocation(latitude=100, longitude=7...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(70);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0199 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0200
     * @tc.name      Location_CityPickerStateSetLastLocation_0200
     * @tc.desc      CityPickerState.setLastLocation(latitude=100, longitude=75) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0200 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(100, 75);
      logInfo(`setLastLocation(latitude=100, longitude=7...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(100);
      logInfo(`setLastLocation(latitude=100, longitude=7...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(75);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0200 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0201
     * @tc.name      Location_CityPickerStateSetLastLocation_0201
     * @tc.desc      CityPickerState.setLastLocation(latitude=100, longitude=80) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0201 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(100, 80);
      logInfo(`setLastLocation(latitude=100, longitude=8...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(100);
      logInfo(`setLastLocation(latitude=100, longitude=8...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(80);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0201 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0202
     * @tc.name      Location_CityPickerStateSetLastLocation_0202
     * @tc.desc      CityPickerState.setLastLocation(latitude=100, longitude=85) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0202 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(100, 85);
      logInfo(`setLastLocation(latitude=100, longitude=8...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(100);
      logInfo(`setLastLocation(latitude=100, longitude=8...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(85);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0202 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0203
     * @tc.name      Location_CityPickerStateSetLastLocation_0203
     * @tc.desc      CityPickerState.setLastLocation(latitude=100, longitude=90) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0203 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(100, 90);
      logInfo(`setLastLocation(latitude=100, longitude=9...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(100);
      logInfo(`setLastLocation(latitude=100, longitude=9...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(90);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0203 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0204
     * @tc.name      Location_CityPickerStateSetLastLocation_0204
     * @tc.desc      CityPickerState.setLastLocation(latitude=100, longitude=95) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0204 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(100, 95);
      logInfo(`setLastLocation(latitude=100, longitude=9...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(100);
      logInfo(`setLastLocation(latitude=100, longitude=9...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(95);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0204 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0205
     * @tc.name      Location_CityPickerStateSetLastLocation_0205
     * @tc.desc      CityPickerState.setLastLocation(latitude=100, longitude=105) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0205 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(100, 105);
      logInfo(`setLastLocation(latitude=100, longitude=1...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(100);
      logInfo(`setLastLocation(latitude=100, longitude=1...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(105);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0205 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0206
     * @tc.name      Location_CityPickerStateSetLastLocation_0206
     * @tc.desc      CityPickerState.setLastLocation(latitude=100, longitude=110) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0206 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(100, 110);
      logInfo(`setLastLocation(latitude=100, longitude=1...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(100);
      logInfo(`setLastLocation(latitude=100, longitude=1...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(110);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0206 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0207
     * @tc.name      Location_CityPickerStateSetLastLocation_0207
     * @tc.desc      CityPickerState.setLastLocation(latitude=100, longitude=115) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0207 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(100, 115);
      logInfo(`setLastLocation(latitude=100, longitude=1...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(100);
      logInfo(`setLastLocation(latitude=100, longitude=1...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(115);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0207 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0208
     * @tc.name      Location_CityPickerStateSetLastLocation_0208
     * @tc.desc      CityPickerState.setLastLocation(latitude=100, longitude=192) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0208 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(100, 192);
      logInfo(`setLastLocation(latitude=100, longitude=1...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(100);
      logInfo(`setLastLocation(latitude=100, longitude=1...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(192);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0208 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0209
     * @tc.name      Location_CityPickerStateSetLastLocation_0209
     * @tc.desc      CityPickerState.setLastLocation(latitude=100, longitude=78) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0209 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(100, 78);
      logInfo(`setLastLocation(latitude=100, longitude=7...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(100);
      logInfo(`setLastLocation(latitude=100, longitude=7...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(78);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0209 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0210
     * @tc.name      Location_CityPickerStateSetLastLocation_0210
     * @tc.desc      CityPickerState.setLastLocation(latitude=5, longitude=0) yields 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0210 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(5, 0);
      logInfo(`setLastLocation(latitude=5, longitude=0) ...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(5);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0210 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0211
     * @tc.name      Location_CityPickerStateSetLastLocation_0211
     * @tc.desc      CityPickerState.setLastLocation(latitude=5, longitude=-1) yields 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0211 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(5, -1);
      logInfo(`setLastLocation(latitude=5, longitude=-1)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(5);
      logInfo(`setLastLocation(latitude=5, longitude=-1)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(-1);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0211 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0212
     * @tc.name      Location_CityPickerStateSetLastLocation_0212
     * @tc.desc      CityPickerState.setLastLocation(latitude=5, longitude=1) yields 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0212 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(5, 1);
      logInfo(`setLastLocation(latitude=5, longitude=1) ...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(5);
      logInfo(`setLastLocation(latitude=5, longitude=1) ...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(1);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0212 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0213
     * @tc.name      Location_CityPickerStateSetLastLocation_0213
     * @tc.desc      CityPickerState.setLastLocation(latitude=5, longitude=2) yields 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0213 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(5, 2);
      logInfo(`setLastLocation(latitude=5, longitude=2) ...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(5);
      logInfo(`setLastLocation(latitude=5, longitude=2) ...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(2);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0213 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0214
     * @tc.name      Location_CityPickerStateSetLastLocation_0214
     * @tc.desc      CityPickerState.setLastLocation(latitude=5, longitude=3) yields 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0214 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(5, 3);
      logInfo(`setLastLocation(latitude=5, longitude=3) ...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(5);
      logInfo(`setLastLocation(latitude=5, longitude=3) ...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(3);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0214 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0215
     * @tc.name      Location_CityPickerStateSetLastLocation_0215
     * @tc.desc      CityPickerState.setLastLocation(latitude=5, longitude=10) yields 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0215 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(5, 10);
      logInfo(`setLastLocation(latitude=5, longitude=10)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(5);
      logInfo(`setLastLocation(latitude=5, longitude=10)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(10);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0215 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0216
     * @tc.name      Location_CityPickerStateSetLastLocation_0216
     * @tc.desc      CityPickerState.setLastLocation(latitude=5, longitude=100) yields 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0216 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(5, 100);
      logInfo(`setLastLocation(latitude=5, longitude=100...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(5);
      logInfo(`setLastLocation(latitude=5, longitude=100...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(100);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0216 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0217
     * @tc.name      Location_CityPickerStateSetLastLocation_0217
     * @tc.desc      CityPickerState.setLastLocation(latitude=5, longitude=5) yields 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0217 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(5, 5);
      logInfo(`setLastLocation(latitude=5, longitude=5) ...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(5);
      logInfo(`setLastLocation(latitude=5, longitude=5) ...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(5);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0217 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0218
     * @tc.name      Location_CityPickerStateSetLastLocation_0218
     * @tc.desc      CityPickerState.setLastLocation(latitude=5, longitude=15) yields 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0218 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(5, 15);
      logInfo(`setLastLocation(latitude=5, longitude=15)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(5);
      logInfo(`setLastLocation(latitude=5, longitude=15)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(15);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0218 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0219
     * @tc.name      Location_CityPickerStateSetLastLocation_0219
     * @tc.desc      CityPickerState.setLastLocation(latitude=5, longitude=20) yields 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0219 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(5, 20);
      logInfo(`setLastLocation(latitude=5, longitude=20)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(5);
      logInfo(`setLastLocation(latitude=5, longitude=20)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(20);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0219 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0220
     * @tc.name      Location_CityPickerStateSetLastLocation_0220
     * @tc.desc      CityPickerState.setLastLocation(latitude=5, longitude=25) yields 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0220 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(5, 25);
      logInfo(`setLastLocation(latitude=5, longitude=25)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(5);
      logInfo(`setLastLocation(latitude=5, longitude=25)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(25);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0220 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0221
     * @tc.name      Location_CityPickerStateSetLastLocation_0221
     * @tc.desc      CityPickerState.setLastLocation(latitude=5, longitude=30) yields 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0221 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(5, 30);
      logInfo(`setLastLocation(latitude=5, longitude=30)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(5);
      logInfo(`setLastLocation(latitude=5, longitude=30)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(30);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0221 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0222
     * @tc.name      Location_CityPickerStateSetLastLocation_0222
     * @tc.desc      CityPickerState.setLastLocation(latitude=5, longitude=35) yields 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0222 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(5, 35);
      logInfo(`setLastLocation(latitude=5, longitude=35)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(5);
      logInfo(`setLastLocation(latitude=5, longitude=35)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(35);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0222 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0223
     * @tc.name      Location_CityPickerStateSetLastLocation_0223
     * @tc.desc      CityPickerState.setLastLocation(latitude=5, longitude=40) yields 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0223 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(5, 40);
      logInfo(`setLastLocation(latitude=5, longitude=40)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(5);
      logInfo(`setLastLocation(latitude=5, longitude=40)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(40);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0223 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0224
     * @tc.name      Location_CityPickerStateSetLastLocation_0224
     * @tc.desc      CityPickerState.setLastLocation(latitude=5, longitude=45) yields 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0224 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(5, 45);
      logInfo(`setLastLocation(latitude=5, longitude=45)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(5);
      logInfo(`setLastLocation(latitude=5, longitude=45)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(45);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0224 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0225
     * @tc.name      Location_CityPickerStateSetLastLocation_0225
     * @tc.desc      CityPickerState.setLastLocation(latitude=5, longitude=50) yields 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0225 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(5, 50);
      logInfo(`setLastLocation(latitude=5, longitude=50)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(5);
      logInfo(`setLastLocation(latitude=5, longitude=50)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(50);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0225 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0226
     * @tc.name      Location_CityPickerStateSetLastLocation_0226
     * @tc.desc      CityPickerState.setLastLocation(latitude=5, longitude=55) yields 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0226 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(5, 55);
      logInfo(`setLastLocation(latitude=5, longitude=55)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(5);
      logInfo(`setLastLocation(latitude=5, longitude=55)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(55);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0226 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0227
     * @tc.name      Location_CityPickerStateSetLastLocation_0227
     * @tc.desc      CityPickerState.setLastLocation(latitude=5, longitude=60) yields 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0227 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(5, 60);
      logInfo(`setLastLocation(latitude=5, longitude=60)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(5);
      logInfo(`setLastLocation(latitude=5, longitude=60)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(60);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0227 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0228
     * @tc.name      Location_CityPickerStateSetLastLocation_0228
     * @tc.desc      CityPickerState.setLastLocation(latitude=5, longitude=65) yields 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0228 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(5, 65);
      logInfo(`setLastLocation(latitude=5, longitude=65)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(5);
      logInfo(`setLastLocation(latitude=5, longitude=65)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(65);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0228 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0229
     * @tc.name      Location_CityPickerStateSetLastLocation_0229
     * @tc.desc      CityPickerState.setLastLocation(latitude=5, longitude=70) yields 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0229 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(5, 70);
      logInfo(`setLastLocation(latitude=5, longitude=70)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(5);
      logInfo(`setLastLocation(latitude=5, longitude=70)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(70);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0229 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0230
     * @tc.name      Location_CityPickerStateSetLastLocation_0230
     * @tc.desc      CityPickerState.setLastLocation(latitude=5, longitude=75) yields 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0230 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(5, 75);
      logInfo(`setLastLocation(latitude=5, longitude=75)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(5);
      logInfo(`setLastLocation(latitude=5, longitude=75)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(75);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0230 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0231
     * @tc.name      Location_CityPickerStateSetLastLocation_0231
     * @tc.desc      CityPickerState.setLastLocation(latitude=5, longitude=80) yields 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0231 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(5, 80);
      logInfo(`setLastLocation(latitude=5, longitude=80)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(5);
      logInfo(`setLastLocation(latitude=5, longitude=80)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(80);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0231 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0232
     * @tc.name      Location_CityPickerStateSetLastLocation_0232
     * @tc.desc      CityPickerState.setLastLocation(latitude=5, longitude=85) yields 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0232 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(5, 85);
      logInfo(`setLastLocation(latitude=5, longitude=85)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(5);
      logInfo(`setLastLocation(latitude=5, longitude=85)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(85);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0232 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0233
     * @tc.name      Location_CityPickerStateSetLastLocation_0233
     * @tc.desc      CityPickerState.setLastLocation(latitude=5, longitude=90) yields 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0233 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(5, 90);
      logInfo(`setLastLocation(latitude=5, longitude=90)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(5);
      logInfo(`setLastLocation(latitude=5, longitude=90)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(90);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0233 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0234
     * @tc.name      Location_CityPickerStateSetLastLocation_0234
     * @tc.desc      CityPickerState.setLastLocation(latitude=5, longitude=95) yields 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0234 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(5, 95);
      logInfo(`setLastLocation(latitude=5, longitude=95)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(5);
      logInfo(`setLastLocation(latitude=5, longitude=95)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(95);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0234 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0235
     * @tc.name      Location_CityPickerStateSetLastLocation_0235
     * @tc.desc      CityPickerState.setLastLocation(latitude=5, longitude=105) yields 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0235 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(5, 105);
      logInfo(`setLastLocation(latitude=5, longitude=105...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(5);
      logInfo(`setLastLocation(latitude=5, longitude=105...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(105);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0235 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0236
     * @tc.name      Location_CityPickerStateSetLastLocation_0236
     * @tc.desc      CityPickerState.setLastLocation(latitude=5, longitude=110) yields 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0236 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(5, 110);
      logInfo(`setLastLocation(latitude=5, longitude=110...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(5);
      logInfo(`setLastLocation(latitude=5, longitude=110...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(110);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0236 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0237
     * @tc.name      Location_CityPickerStateSetLastLocation_0237
     * @tc.desc      CityPickerState.setLastLocation(latitude=5, longitude=115) yields 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0237 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(5, 115);
      logInfo(`setLastLocation(latitude=5, longitude=115...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(5);
      logInfo(`setLastLocation(latitude=5, longitude=115...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(115);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0237 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0238
     * @tc.name      Location_CityPickerStateSetLastLocation_0238
     * @tc.desc      CityPickerState.setLastLocation(latitude=5, longitude=192) yields 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0238 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(5, 192);
      logInfo(`setLastLocation(latitude=5, longitude=192...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(5);
      logInfo(`setLastLocation(latitude=5, longitude=192...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(192);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0238 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0239
     * @tc.name      Location_CityPickerStateSetLastLocation_0239
     * @tc.desc      CityPickerState.setLastLocation(latitude=5, longitude=78) yields 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0239 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(5, 78);
      logInfo(`setLastLocation(latitude=5, longitude=78)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(5);
      logInfo(`setLastLocation(latitude=5, longitude=78)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(78);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0239 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0240
     * @tc.name      Location_CityPickerStateSetLastLocation_0240
     * @tc.desc      CityPickerState.setLastLocation(latitude=15, longitude=0) yields 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0240 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(15, 0);
      logInfo(`setLastLocation(latitude=15, longitude=0)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(15);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0240 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0241
     * @tc.name      Location_CityPickerStateSetLastLocation_0241
     * @tc.desc      CityPickerState.setLastLocation(latitude=15, longitude=-1) yields 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0241 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(15, -1);
      logInfo(`setLastLocation(latitude=15, longitude=-1...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(15);
      logInfo(`setLastLocation(latitude=15, longitude=-1...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(-1);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0241 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0242
     * @tc.name      Location_CityPickerStateSetLastLocation_0242
     * @tc.desc      CityPickerState.setLastLocation(latitude=15, longitude=1) yields 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0242 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(15, 1);
      logInfo(`setLastLocation(latitude=15, longitude=1)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(15);
      logInfo(`setLastLocation(latitude=15, longitude=1)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(1);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0242 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0243
     * @tc.name      Location_CityPickerStateSetLastLocation_0243
     * @tc.desc      CityPickerState.setLastLocation(latitude=15, longitude=2) yields 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0243 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(15, 2);
      logInfo(`setLastLocation(latitude=15, longitude=2)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(15);
      logInfo(`setLastLocation(latitude=15, longitude=2)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(2);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0243 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0244
     * @tc.name      Location_CityPickerStateSetLastLocation_0244
     * @tc.desc      CityPickerState.setLastLocation(latitude=15, longitude=3) yields 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0244 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(15, 3);
      logInfo(`setLastLocation(latitude=15, longitude=3)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(15);
      logInfo(`setLastLocation(latitude=15, longitude=3)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(3);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0244 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0245
     * @tc.name      Location_CityPickerStateSetLastLocation_0245
     * @tc.desc      CityPickerState.setLastLocation(latitude=15, longitude=10) yields 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0245 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(15, 10);
      logInfo(`setLastLocation(latitude=15, longitude=10...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(15);
      logInfo(`setLastLocation(latitude=15, longitude=10...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(10);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0245 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0246
     * @tc.name      Location_CityPickerStateSetLastLocation_0246
     * @tc.desc      CityPickerState.setLastLocation(latitude=15, longitude=100) yields 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0246 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(15, 100);
      logInfo(`setLastLocation(latitude=15, longitude=10...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(15);
      logInfo(`setLastLocation(latitude=15, longitude=10...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(100);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0246 end`);
    });
  });
}
