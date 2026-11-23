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
export default function cityPickerStateSetLastLocation4Test(): void {
  describe('CityPickerStateSetLastLocation4Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0247
     * @tc.name      Location_CityPickerStateSetLastLocation_0247
     * @tc.desc      CityPickerState.setLastLocation(latitude=15, longitude=5) yields 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0247 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(15, 5);
      logInfo(`setLastLocation(latitude=15, longitude=5)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(15);
      logInfo(`setLastLocation(latitude=15, longitude=5)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(5);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0247 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0248
     * @tc.name      Location_CityPickerStateSetLastLocation_0248
     * @tc.desc      CityPickerState.setLastLocation(latitude=15, longitude=15) yields 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0248 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(15, 15);
      logInfo(`setLastLocation(latitude=15, longitude=15...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(15);
      logInfo(`setLastLocation(latitude=15, longitude=15...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(15);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0248 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0249
     * @tc.name      Location_CityPickerStateSetLastLocation_0249
     * @tc.desc      CityPickerState.setLastLocation(latitude=15, longitude=20) yields 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0249 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(15, 20);
      logInfo(`setLastLocation(latitude=15, longitude=20...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(15);
      logInfo(`setLastLocation(latitude=15, longitude=20...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(20);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0249 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0250
     * @tc.name      Location_CityPickerStateSetLastLocation_0250
     * @tc.desc      CityPickerState.setLastLocation(latitude=15, longitude=25) yields 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0250 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(15, 25);
      logInfo(`setLastLocation(latitude=15, longitude=25...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(15);
      logInfo(`setLastLocation(latitude=15, longitude=25...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(25);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0250 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0251
     * @tc.name      Location_CityPickerStateSetLastLocation_0251
     * @tc.desc      CityPickerState.setLastLocation(latitude=15, longitude=30) yields 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0251 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(15, 30);
      logInfo(`setLastLocation(latitude=15, longitude=30...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(15);
      logInfo(`setLastLocation(latitude=15, longitude=30...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(30);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0251 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0252
     * @tc.name      Location_CityPickerStateSetLastLocation_0252
     * @tc.desc      CityPickerState.setLastLocation(latitude=15, longitude=35) yields 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0252 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(15, 35);
      logInfo(`setLastLocation(latitude=15, longitude=35...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(15);
      logInfo(`setLastLocation(latitude=15, longitude=35...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(35);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0252 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0253
     * @tc.name      Location_CityPickerStateSetLastLocation_0253
     * @tc.desc      CityPickerState.setLastLocation(latitude=15, longitude=40) yields 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0253 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(15, 40);
      logInfo(`setLastLocation(latitude=15, longitude=40...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(15);
      logInfo(`setLastLocation(latitude=15, longitude=40...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(40);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0253 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0254
     * @tc.name      Location_CityPickerStateSetLastLocation_0254
     * @tc.desc      CityPickerState.setLastLocation(latitude=15, longitude=45) yields 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0254 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(15, 45);
      logInfo(`setLastLocation(latitude=15, longitude=45...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(15);
      logInfo(`setLastLocation(latitude=15, longitude=45...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(45);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0254 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0255
     * @tc.name      Location_CityPickerStateSetLastLocation_0255
     * @tc.desc      CityPickerState.setLastLocation(latitude=15, longitude=50) yields 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0255 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(15, 50);
      logInfo(`setLastLocation(latitude=15, longitude=50...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(15);
      logInfo(`setLastLocation(latitude=15, longitude=50...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(50);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0255 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0256
     * @tc.name      Location_CityPickerStateSetLastLocation_0256
     * @tc.desc      CityPickerState.setLastLocation(latitude=15, longitude=55) yields 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0256 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(15, 55);
      logInfo(`setLastLocation(latitude=15, longitude=55...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(15);
      logInfo(`setLastLocation(latitude=15, longitude=55...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(55);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0256 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0257
     * @tc.name      Location_CityPickerStateSetLastLocation_0257
     * @tc.desc      CityPickerState.setLastLocation(latitude=15, longitude=60) yields 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0257', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0257 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(15, 60);
      logInfo(`setLastLocation(latitude=15, longitude=60...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(15);
      logInfo(`setLastLocation(latitude=15, longitude=60...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(60);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0257 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0258
     * @tc.name      Location_CityPickerStateSetLastLocation_0258
     * @tc.desc      CityPickerState.setLastLocation(latitude=15, longitude=65) yields 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0258', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0258 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(15, 65);
      logInfo(`setLastLocation(latitude=15, longitude=65...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(15);
      logInfo(`setLastLocation(latitude=15, longitude=65...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(65);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0258 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0259
     * @tc.name      Location_CityPickerStateSetLastLocation_0259
     * @tc.desc      CityPickerState.setLastLocation(latitude=15, longitude=70) yields 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0259', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0259 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(15, 70);
      logInfo(`setLastLocation(latitude=15, longitude=70...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(15);
      logInfo(`setLastLocation(latitude=15, longitude=70...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(70);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0259 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0260
     * @tc.name      Location_CityPickerStateSetLastLocation_0260
     * @tc.desc      CityPickerState.setLastLocation(latitude=15, longitude=75) yields 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0260', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0260 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(15, 75);
      logInfo(`setLastLocation(latitude=15, longitude=75...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(15);
      logInfo(`setLastLocation(latitude=15, longitude=75...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(75);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0260 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0261
     * @tc.name      Location_CityPickerStateSetLastLocation_0261
     * @tc.desc      CityPickerState.setLastLocation(latitude=15, longitude=80) yields 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0261', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0261 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(15, 80);
      logInfo(`setLastLocation(latitude=15, longitude=80...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(15);
      logInfo(`setLastLocation(latitude=15, longitude=80...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(80);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0261 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0262
     * @tc.name      Location_CityPickerStateSetLastLocation_0262
     * @tc.desc      CityPickerState.setLastLocation(latitude=15, longitude=85) yields 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0262', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0262 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(15, 85);
      logInfo(`setLastLocation(latitude=15, longitude=85...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(15);
      logInfo(`setLastLocation(latitude=15, longitude=85...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(85);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0262 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0263
     * @tc.name      Location_CityPickerStateSetLastLocation_0263
     * @tc.desc      CityPickerState.setLastLocation(latitude=15, longitude=90) yields 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0263', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0263 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(15, 90);
      logInfo(`setLastLocation(latitude=15, longitude=90...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(15);
      logInfo(`setLastLocation(latitude=15, longitude=90...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(90);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0263 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0264
     * @tc.name      Location_CityPickerStateSetLastLocation_0264
     * @tc.desc      CityPickerState.setLastLocation(latitude=15, longitude=95) yields 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0264', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0264 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(15, 95);
      logInfo(`setLastLocation(latitude=15, longitude=95...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(15);
      logInfo(`setLastLocation(latitude=15, longitude=95...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(95);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0264 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0265
     * @tc.name      Location_CityPickerStateSetLastLocation_0265
     * @tc.desc      CityPickerState.setLastLocation(latitude=15, longitude=105) yields 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0265', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0265 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(15, 105);
      logInfo(`setLastLocation(latitude=15, longitude=10...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(15);
      logInfo(`setLastLocation(latitude=15, longitude=10...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(105);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0265 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0266
     * @tc.name      Location_CityPickerStateSetLastLocation_0266
     * @tc.desc      CityPickerState.setLastLocation(latitude=15, longitude=110) yields 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0266', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0266 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(15, 110);
      logInfo(`setLastLocation(latitude=15, longitude=11...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(15);
      logInfo(`setLastLocation(latitude=15, longitude=11...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(110);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0266 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0267
     * @tc.name      Location_CityPickerStateSetLastLocation_0267
     * @tc.desc      CityPickerState.setLastLocation(latitude=15, longitude=115) yields 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0267', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0267 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(15, 115);
      logInfo(`setLastLocation(latitude=15, longitude=11...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(15);
      logInfo(`setLastLocation(latitude=15, longitude=11...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(115);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0267 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0268
     * @tc.name      Location_CityPickerStateSetLastLocation_0268
     * @tc.desc      CityPickerState.setLastLocation(latitude=15, longitude=192) yields 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0268', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0268 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(15, 192);
      logInfo(`setLastLocation(latitude=15, longitude=19...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(15);
      logInfo(`setLastLocation(latitude=15, longitude=19...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(192);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0268 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0269
     * @tc.name      Location_CityPickerStateSetLastLocation_0269
     * @tc.desc      CityPickerState.setLastLocation(latitude=15, longitude=78) yields 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0269', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0269 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(15, 78);
      logInfo(`setLastLocation(latitude=15, longitude=78...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(15);
      logInfo(`setLastLocation(latitude=15, longitude=78...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(78);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0269 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0270
     * @tc.name      Location_CityPickerStateSetLastLocation_0270
     * @tc.desc      CityPickerState.setLastLocation(latitude=20, longitude=0) yields 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0270', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0270 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(20, 0);
      logInfo(`setLastLocation(latitude=20, longitude=0)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(20);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0270 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0271
     * @tc.name      Location_CityPickerStateSetLastLocation_0271
     * @tc.desc      CityPickerState.setLastLocation(latitude=20, longitude=-1) yields 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0271', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0271 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(20, -1);
      logInfo(`setLastLocation(latitude=20, longitude=-1...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(20);
      logInfo(`setLastLocation(latitude=20, longitude=-1...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(-1);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0271 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0272
     * @tc.name      Location_CityPickerStateSetLastLocation_0272
     * @tc.desc      CityPickerState.setLastLocation(latitude=20, longitude=1) yields 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0272', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0272 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(20, 1);
      logInfo(`setLastLocation(latitude=20, longitude=1)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(20);
      logInfo(`setLastLocation(latitude=20, longitude=1)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(1);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0272 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0273
     * @tc.name      Location_CityPickerStateSetLastLocation_0273
     * @tc.desc      CityPickerState.setLastLocation(latitude=20, longitude=2) yields 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0273', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0273 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(20, 2);
      logInfo(`setLastLocation(latitude=20, longitude=2)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(20);
      logInfo(`setLastLocation(latitude=20, longitude=2)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(2);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0273 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0274
     * @tc.name      Location_CityPickerStateSetLastLocation_0274
     * @tc.desc      CityPickerState.setLastLocation(latitude=20, longitude=3) yields 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0274', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0274 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(20, 3);
      logInfo(`setLastLocation(latitude=20, longitude=3)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(20);
      logInfo(`setLastLocation(latitude=20, longitude=3)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(3);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0274 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0275
     * @tc.name      Location_CityPickerStateSetLastLocation_0275
     * @tc.desc      CityPickerState.setLastLocation(latitude=20, longitude=10) yields 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0275', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0275 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(20, 10);
      logInfo(`setLastLocation(latitude=20, longitude=10...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(20);
      logInfo(`setLastLocation(latitude=20, longitude=10...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(10);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0275 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0276
     * @tc.name      Location_CityPickerStateSetLastLocation_0276
     * @tc.desc      CityPickerState.setLastLocation(latitude=20, longitude=100) yields 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0276', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0276 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(20, 100);
      logInfo(`setLastLocation(latitude=20, longitude=10...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(20);
      logInfo(`setLastLocation(latitude=20, longitude=10...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(100);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0276 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0277
     * @tc.name      Location_CityPickerStateSetLastLocation_0277
     * @tc.desc      CityPickerState.setLastLocation(latitude=20, longitude=5) yields 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0277', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0277 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(20, 5);
      logInfo(`setLastLocation(latitude=20, longitude=5)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(20);
      logInfo(`setLastLocation(latitude=20, longitude=5)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(5);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0277 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0278
     * @tc.name      Location_CityPickerStateSetLastLocation_0278
     * @tc.desc      CityPickerState.setLastLocation(latitude=20, longitude=15) yields 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0278', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0278 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(20, 15);
      logInfo(`setLastLocation(latitude=20, longitude=15...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(20);
      logInfo(`setLastLocation(latitude=20, longitude=15...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(15);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0278 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0279
     * @tc.name      Location_CityPickerStateSetLastLocation_0279
     * @tc.desc      CityPickerState.setLastLocation(latitude=20, longitude=20) yields 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0279', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0279 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(20, 20);
      logInfo(`setLastLocation(latitude=20, longitude=20...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(20);
      logInfo(`setLastLocation(latitude=20, longitude=20...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(20);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0279 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0280
     * @tc.name      Location_CityPickerStateSetLastLocation_0280
     * @tc.desc      CityPickerState.setLastLocation(latitude=20, longitude=25) yields 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0280', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0280 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(20, 25);
      logInfo(`setLastLocation(latitude=20, longitude=25...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(20);
      logInfo(`setLastLocation(latitude=20, longitude=25...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(25);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0280 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0281
     * @tc.name      Location_CityPickerStateSetLastLocation_0281
     * @tc.desc      CityPickerState.setLastLocation(latitude=20, longitude=30) yields 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0281', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0281 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(20, 30);
      logInfo(`setLastLocation(latitude=20, longitude=30...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(20);
      logInfo(`setLastLocation(latitude=20, longitude=30...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(30);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0281 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0282
     * @tc.name      Location_CityPickerStateSetLastLocation_0282
     * @tc.desc      CityPickerState.setLastLocation(latitude=20, longitude=35) yields 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0282', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0282 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(20, 35);
      logInfo(`setLastLocation(latitude=20, longitude=35...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(20);
      logInfo(`setLastLocation(latitude=20, longitude=35...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(35);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0282 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0283
     * @tc.name      Location_CityPickerStateSetLastLocation_0283
     * @tc.desc      CityPickerState.setLastLocation(latitude=20, longitude=40) yields 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0283', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0283 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(20, 40);
      logInfo(`setLastLocation(latitude=20, longitude=40...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(20);
      logInfo(`setLastLocation(latitude=20, longitude=40...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(40);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0283 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0284
     * @tc.name      Location_CityPickerStateSetLastLocation_0284
     * @tc.desc      CityPickerState.setLastLocation(latitude=20, longitude=45) yields 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0284', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0284 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(20, 45);
      logInfo(`setLastLocation(latitude=20, longitude=45...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(20);
      logInfo(`setLastLocation(latitude=20, longitude=45...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(45);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0284 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0285
     * @tc.name      Location_CityPickerStateSetLastLocation_0285
     * @tc.desc      CityPickerState.setLastLocation(latitude=20, longitude=50) yields 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0285', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0285 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(20, 50);
      logInfo(`setLastLocation(latitude=20, longitude=50...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(20);
      logInfo(`setLastLocation(latitude=20, longitude=50...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(50);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0285 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0286
     * @tc.name      Location_CityPickerStateSetLastLocation_0286
     * @tc.desc      CityPickerState.setLastLocation(latitude=20, longitude=55) yields 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0286', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0286 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(20, 55);
      logInfo(`setLastLocation(latitude=20, longitude=55...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(20);
      logInfo(`setLastLocation(latitude=20, longitude=55...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(55);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0286 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0287
     * @tc.name      Location_CityPickerStateSetLastLocation_0287
     * @tc.desc      CityPickerState.setLastLocation(latitude=20, longitude=60) yields 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0287', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0287 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(20, 60);
      logInfo(`setLastLocation(latitude=20, longitude=60...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(20);
      logInfo(`setLastLocation(latitude=20, longitude=60...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(60);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0287 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0288
     * @tc.name      Location_CityPickerStateSetLastLocation_0288
     * @tc.desc      CityPickerState.setLastLocation(latitude=20, longitude=65) yields 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0288', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0288 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(20, 65);
      logInfo(`setLastLocation(latitude=20, longitude=65...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(20);
      logInfo(`setLastLocation(latitude=20, longitude=65...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(65);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0288 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0289
     * @tc.name      Location_CityPickerStateSetLastLocation_0289
     * @tc.desc      CityPickerState.setLastLocation(latitude=20, longitude=70) yields 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0289', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0289 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(20, 70);
      logInfo(`setLastLocation(latitude=20, longitude=70...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(20);
      logInfo(`setLastLocation(latitude=20, longitude=70...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(70);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0289 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0290
     * @tc.name      Location_CityPickerStateSetLastLocation_0290
     * @tc.desc      CityPickerState.setLastLocation(latitude=20, longitude=75) yields 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0290', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0290 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(20, 75);
      logInfo(`setLastLocation(latitude=20, longitude=75...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(20);
      logInfo(`setLastLocation(latitude=20, longitude=75...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(75);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0290 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0291
     * @tc.name      Location_CityPickerStateSetLastLocation_0291
     * @tc.desc      CityPickerState.setLastLocation(latitude=20, longitude=80) yields 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0291', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0291 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(20, 80);
      logInfo(`setLastLocation(latitude=20, longitude=80...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(20);
      logInfo(`setLastLocation(latitude=20, longitude=80...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(80);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0291 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0292
     * @tc.name      Location_CityPickerStateSetLastLocation_0292
     * @tc.desc      CityPickerState.setLastLocation(latitude=20, longitude=85) yields 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0292', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0292 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(20, 85);
      logInfo(`setLastLocation(latitude=20, longitude=85...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(20);
      logInfo(`setLastLocation(latitude=20, longitude=85...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(85);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0292 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0293
     * @tc.name      Location_CityPickerStateSetLastLocation_0293
     * @tc.desc      CityPickerState.setLastLocation(latitude=20, longitude=90) yields 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0293', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0293 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(20, 90);
      logInfo(`setLastLocation(latitude=20, longitude=90...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(20);
      logInfo(`setLastLocation(latitude=20, longitude=90...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(90);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0293 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0294
     * @tc.name      Location_CityPickerStateSetLastLocation_0294
     * @tc.desc      CityPickerState.setLastLocation(latitude=20, longitude=95) yields 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0294', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0294 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(20, 95);
      logInfo(`setLastLocation(latitude=20, longitude=95...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(20);
      logInfo(`setLastLocation(latitude=20, longitude=95...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(95);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0294 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0295
     * @tc.name      Location_CityPickerStateSetLastLocation_0295
     * @tc.desc      CityPickerState.setLastLocation(latitude=20, longitude=105) yields 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0295', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0295 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(20, 105);
      logInfo(`setLastLocation(latitude=20, longitude=10...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(20);
      logInfo(`setLastLocation(latitude=20, longitude=10...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(105);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0295 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0296
     * @tc.name      Location_CityPickerStateSetLastLocation_0296
     * @tc.desc      CityPickerState.setLastLocation(latitude=20, longitude=110) yields 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0296', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0296 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(20, 110);
      logInfo(`setLastLocation(latitude=20, longitude=11...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(20);
      logInfo(`setLastLocation(latitude=20, longitude=11...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(110);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0296 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0297
     * @tc.name      Location_CityPickerStateSetLastLocation_0297
     * @tc.desc      CityPickerState.setLastLocation(latitude=20, longitude=115) yields 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0297', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0297 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(20, 115);
      logInfo(`setLastLocation(latitude=20, longitude=11...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(20);
      logInfo(`setLastLocation(latitude=20, longitude=11...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(115);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0297 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0298
     * @tc.name      Location_CityPickerStateSetLastLocation_0298
     * @tc.desc      CityPickerState.setLastLocation(latitude=20, longitude=192) yields 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0298', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0298 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(20, 192);
      logInfo(`setLastLocation(latitude=20, longitude=19...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(20);
      logInfo(`setLastLocation(latitude=20, longitude=19...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(192);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0298 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0299
     * @tc.name      Location_CityPickerStateSetLastLocation_0299
     * @tc.desc      CityPickerState.setLastLocation(latitude=20, longitude=78) yields 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0299', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0299 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(20, 78);
      logInfo(`setLastLocation(latitude=20, longitude=78...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(20);
      logInfo(`setLastLocation(latitude=20, longitude=78...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(78);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0299 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0300
     * @tc.name      Location_CityPickerStateSetLastLocation_0300
     * @tc.desc      CityPickerState.setLastLocation(latitude=25, longitude=0) yields 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0300 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(25, 0);
      logInfo(`setLastLocation(latitude=25, longitude=0)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(25);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0300 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0301
     * @tc.name      Location_CityPickerStateSetLastLocation_0301
     * @tc.desc      CityPickerState.setLastLocation(latitude=25, longitude=-1) yields 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0301', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0301 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(25, -1);
      logInfo(`setLastLocation(latitude=25, longitude=-1...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(25);
      logInfo(`setLastLocation(latitude=25, longitude=-1...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(-1);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0301 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0302
     * @tc.name      Location_CityPickerStateSetLastLocation_0302
     * @tc.desc      CityPickerState.setLastLocation(latitude=25, longitude=1) yields 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0302', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0302 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(25, 1);
      logInfo(`setLastLocation(latitude=25, longitude=1)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(25);
      logInfo(`setLastLocation(latitude=25, longitude=1)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(1);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0302 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0303
     * @tc.name      Location_CityPickerStateSetLastLocation_0303
     * @tc.desc      CityPickerState.setLastLocation(latitude=25, longitude=2) yields 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0303', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0303 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(25, 2);
      logInfo(`setLastLocation(latitude=25, longitude=2)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(25);
      logInfo(`setLastLocation(latitude=25, longitude=2)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(2);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0303 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0304
     * @tc.name      Location_CityPickerStateSetLastLocation_0304
     * @tc.desc      CityPickerState.setLastLocation(latitude=25, longitude=3) yields 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0304', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0304 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(25, 3);
      logInfo(`setLastLocation(latitude=25, longitude=3)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(25);
      logInfo(`setLastLocation(latitude=25, longitude=3)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(3);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0304 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0305
     * @tc.name      Location_CityPickerStateSetLastLocation_0305
     * @tc.desc      CityPickerState.setLastLocation(latitude=25, longitude=10) yields 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0305', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0305 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(25, 10);
      logInfo(`setLastLocation(latitude=25, longitude=10...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(25);
      logInfo(`setLastLocation(latitude=25, longitude=10...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(10);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0305 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0306
     * @tc.name      Location_CityPickerStateSetLastLocation_0306
     * @tc.desc      CityPickerState.setLastLocation(latitude=25, longitude=100) yields 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0306', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0306 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(25, 100);
      logInfo(`setLastLocation(latitude=25, longitude=10...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(25);
      logInfo(`setLastLocation(latitude=25, longitude=10...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(100);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0306 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0307
     * @tc.name      Location_CityPickerStateSetLastLocation_0307
     * @tc.desc      CityPickerState.setLastLocation(latitude=25, longitude=5) yields 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0307', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0307 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(25, 5);
      logInfo(`setLastLocation(latitude=25, longitude=5)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(25);
      logInfo(`setLastLocation(latitude=25, longitude=5)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(5);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0307 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0308
     * @tc.name      Location_CityPickerStateSetLastLocation_0308
     * @tc.desc      CityPickerState.setLastLocation(latitude=25, longitude=15) yields 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0308', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0308 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(25, 15);
      logInfo(`setLastLocation(latitude=25, longitude=15...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(25);
      logInfo(`setLastLocation(latitude=25, longitude=15...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(15);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0308 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0309
     * @tc.name      Location_CityPickerStateSetLastLocation_0309
     * @tc.desc      CityPickerState.setLastLocation(latitude=25, longitude=20) yields 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0309', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0309 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(25, 20);
      logInfo(`setLastLocation(latitude=25, longitude=20...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(25);
      logInfo(`setLastLocation(latitude=25, longitude=20...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(20);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0309 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0310
     * @tc.name      Location_CityPickerStateSetLastLocation_0310
     * @tc.desc      CityPickerState.setLastLocation(latitude=25, longitude=25) yields 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0310 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(25, 25);
      logInfo(`setLastLocation(latitude=25, longitude=25...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(25);
      logInfo(`setLastLocation(latitude=25, longitude=25...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(25);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0310 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0311
     * @tc.name      Location_CityPickerStateSetLastLocation_0311
     * @tc.desc      CityPickerState.setLastLocation(latitude=25, longitude=30) yields 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0311', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0311 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(25, 30);
      logInfo(`setLastLocation(latitude=25, longitude=30...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(25);
      logInfo(`setLastLocation(latitude=25, longitude=30...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(30);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0311 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0312
     * @tc.name      Location_CityPickerStateSetLastLocation_0312
     * @tc.desc      CityPickerState.setLastLocation(latitude=25, longitude=35) yields 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0312', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0312 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(25, 35);
      logInfo(`setLastLocation(latitude=25, longitude=35...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(25);
      logInfo(`setLastLocation(latitude=25, longitude=35...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(35);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0312 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0313
     * @tc.name      Location_CityPickerStateSetLastLocation_0313
     * @tc.desc      CityPickerState.setLastLocation(latitude=25, longitude=40) yields 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0313', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0313 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(25, 40);
      logInfo(`setLastLocation(latitude=25, longitude=40...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(25);
      logInfo(`setLastLocation(latitude=25, longitude=40...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(40);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0313 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0314
     * @tc.name      Location_CityPickerStateSetLastLocation_0314
     * @tc.desc      CityPickerState.setLastLocation(latitude=25, longitude=45) yields 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0314', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0314 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(25, 45);
      logInfo(`setLastLocation(latitude=25, longitude=45...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(25);
      logInfo(`setLastLocation(latitude=25, longitude=45...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(45);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0314 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0315
     * @tc.name      Location_CityPickerStateSetLastLocation_0315
     * @tc.desc      CityPickerState.setLastLocation(latitude=25, longitude=50) yields 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0315', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0315 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(25, 50);
      logInfo(`setLastLocation(latitude=25, longitude=50...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(25);
      logInfo(`setLastLocation(latitude=25, longitude=50...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(50);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0315 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0316
     * @tc.name      Location_CityPickerStateSetLastLocation_0316
     * @tc.desc      CityPickerState.setLastLocation(latitude=25, longitude=55) yields 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0316', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0316 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(25, 55);
      logInfo(`setLastLocation(latitude=25, longitude=55...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(25);
      logInfo(`setLastLocation(latitude=25, longitude=55...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(55);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0316 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0317
     * @tc.name      Location_CityPickerStateSetLastLocation_0317
     * @tc.desc      CityPickerState.setLastLocation(latitude=25, longitude=60) yields 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0317', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0317 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(25, 60);
      logInfo(`setLastLocation(latitude=25, longitude=60...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(25);
      logInfo(`setLastLocation(latitude=25, longitude=60...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(60);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0317 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0318
     * @tc.name      Location_CityPickerStateSetLastLocation_0318
     * @tc.desc      CityPickerState.setLastLocation(latitude=25, longitude=65) yields 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0318', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0318 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(25, 65);
      logInfo(`setLastLocation(latitude=25, longitude=65...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(25);
      logInfo(`setLastLocation(latitude=25, longitude=65...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(65);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0318 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0319
     * @tc.name      Location_CityPickerStateSetLastLocation_0319
     * @tc.desc      CityPickerState.setLastLocation(latitude=25, longitude=70) yields 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0319', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0319 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(25, 70);
      logInfo(`setLastLocation(latitude=25, longitude=70...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(25);
      logInfo(`setLastLocation(latitude=25, longitude=70...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(70);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0319 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0320
     * @tc.name      Location_CityPickerStateSetLastLocation_0320
     * @tc.desc      CityPickerState.setLastLocation(latitude=25, longitude=75) yields 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0320', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0320 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(25, 75);
      logInfo(`setLastLocation(latitude=25, longitude=75...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(25);
      logInfo(`setLastLocation(latitude=25, longitude=75...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(75);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0320 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0321
     * @tc.name      Location_CityPickerStateSetLastLocation_0321
     * @tc.desc      CityPickerState.setLastLocation(latitude=25, longitude=80) yields 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0321', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0321 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(25, 80);
      logInfo(`setLastLocation(latitude=25, longitude=80...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(25);
      logInfo(`setLastLocation(latitude=25, longitude=80...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(80);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0321 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0322
     * @tc.name      Location_CityPickerStateSetLastLocation_0322
     * @tc.desc      CityPickerState.setLastLocation(latitude=25, longitude=85) yields 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0322', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0322 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(25, 85);
      logInfo(`setLastLocation(latitude=25, longitude=85...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(25);
      logInfo(`setLastLocation(latitude=25, longitude=85...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(85);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0322 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0323
     * @tc.name      Location_CityPickerStateSetLastLocation_0323
     * @tc.desc      CityPickerState.setLastLocation(latitude=25, longitude=90) yields 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0323', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0323 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(25, 90);
      logInfo(`setLastLocation(latitude=25, longitude=90...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(25);
      logInfo(`setLastLocation(latitude=25, longitude=90...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(90);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0323 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0324
     * @tc.name      Location_CityPickerStateSetLastLocation_0324
     * @tc.desc      CityPickerState.setLastLocation(latitude=25, longitude=95) yields 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0324', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0324 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(25, 95);
      logInfo(`setLastLocation(latitude=25, longitude=95...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(25);
      logInfo(`setLastLocation(latitude=25, longitude=95...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(95);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0324 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0325
     * @tc.name      Location_CityPickerStateSetLastLocation_0325
     * @tc.desc      CityPickerState.setLastLocation(latitude=25, longitude=105) yields 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0325', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0325 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(25, 105);
      logInfo(`setLastLocation(latitude=25, longitude=10...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(25);
      logInfo(`setLastLocation(latitude=25, longitude=10...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(105);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0325 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0326
     * @tc.name      Location_CityPickerStateSetLastLocation_0326
     * @tc.desc      CityPickerState.setLastLocation(latitude=25, longitude=110) yields 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0326', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0326 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(25, 110);
      logInfo(`setLastLocation(latitude=25, longitude=11...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(25);
      logInfo(`setLastLocation(latitude=25, longitude=11...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(110);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0326 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0327
     * @tc.name      Location_CityPickerStateSetLastLocation_0327
     * @tc.desc      CityPickerState.setLastLocation(latitude=25, longitude=115) yields 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSetLastLocation_0327', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0327 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(25, 115);
      logInfo(`setLastLocation(latitude=25, longitude=11...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(25);
      logInfo(`setLastLocation(latitude=25, longitude=11...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(115);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0327 end`);
    });
  });
}
