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

/** Logic checks for CityPickerState.setLastLocation (84 cases). */
export default function cityPickerStateSetLastLocationTest(): void {
  describe('CityPickerStateSetLastLocationTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0001
     * @tc.name      Location_CityPickerStateSetLastLocation_0001
     * @tc.desc      CityPickerState.setLastLocation(latitude=0, longitude=-1) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Location_CityPickerStateSetLastLocation_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0001 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(0, -1);
      logInfo(`setLastLocation(latitude=0, longitude=-1)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(-1);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0001 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0002
     * @tc.name      Location_CityPickerStateSetLastLocation_0002
     * @tc.desc      CityPickerState.setLastLocation(latitude=0, longitude=1) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Location_CityPickerStateSetLastLocation_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0002 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(0, 1);
      logInfo(`setLastLocation(latitude=0, longitude=1) ...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(1);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0002 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0003
     * @tc.name      Location_CityPickerStateSetLastLocation_0003
     * @tc.desc      CityPickerState.setLastLocation(latitude=0, longitude=2) yields 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0003 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(0, 2);
      logInfo(`setLastLocation(latitude=0, longitude=2) ...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(2);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0003 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0004
     * @tc.name      Location_CityPickerStateSetLastLocation_0004
     * @tc.desc      CityPickerState.setLastLocation(latitude=0, longitude=3) yields 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0004 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(0, 3);
      logInfo(`setLastLocation(latitude=0, longitude=3) ...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(3);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0004 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0005
     * @tc.name      Location_CityPickerStateSetLastLocation_0005
     * @tc.desc      CityPickerState.setLastLocation(latitude=0, longitude=10) yields 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0005 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(0, 10);
      logInfo(`setLastLocation(latitude=0, longitude=10)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(10);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0005 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0006
     * @tc.name      Location_CityPickerStateSetLastLocation_0006
     * @tc.desc      CityPickerState.setLastLocation(latitude=0, longitude=100) yields 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0006 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(0, 100);
      logInfo(`setLastLocation(latitude=0, longitude=100...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(100);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0006 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0007
     * @tc.name      Location_CityPickerStateSetLastLocation_0007
     * @tc.desc      CityPickerState.setLastLocation(latitude=0, longitude=5) yields 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0007 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(0, 5);
      logInfo(`setLastLocation(latitude=0, longitude=5) ...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(5);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0007 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0008
     * @tc.name      Location_CityPickerStateSetLastLocation_0008
     * @tc.desc      CityPickerState.setLastLocation(latitude=0, longitude=15) yields 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0008 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(0, 15);
      logInfo(`setLastLocation(latitude=0, longitude=15)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(15);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0008 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0009
     * @tc.name      Location_CityPickerStateSetLastLocation_0009
     * @tc.desc      CityPickerState.setLastLocation(latitude=0, longitude=20) yields 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0009 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(0, 20);
      logInfo(`setLastLocation(latitude=0, longitude=20)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(20);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0009 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0010
     * @tc.name      Location_CityPickerStateSetLastLocation_0010
     * @tc.desc      CityPickerState.setLastLocation(latitude=0, longitude=25) yields 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0010 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(0, 25);
      logInfo(`setLastLocation(latitude=0, longitude=25)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(25);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0010 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0011
     * @tc.name      Location_CityPickerStateSetLastLocation_0011
     * @tc.desc      CityPickerState.setLastLocation(latitude=0, longitude=30) yields 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0011 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(0, 30);
      logInfo(`setLastLocation(latitude=0, longitude=30)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(30);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0011 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0012
     * @tc.name      Location_CityPickerStateSetLastLocation_0012
     * @tc.desc      CityPickerState.setLastLocation(latitude=0, longitude=35) yields 35
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0012 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(0, 35);
      logInfo(`setLastLocation(latitude=0, longitude=35)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(35);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0012 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0013
     * @tc.name      Location_CityPickerStateSetLastLocation_0013
     * @tc.desc      CityPickerState.setLastLocation(latitude=0, longitude=40) yields 40
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0013 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(0, 40);
      logInfo(`setLastLocation(latitude=0, longitude=40)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(40);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0013 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0014
     * @tc.name      Location_CityPickerStateSetLastLocation_0014
     * @tc.desc      CityPickerState.setLastLocation(latitude=0, longitude=45) yields 45
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0014 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(0, 45);
      logInfo(`setLastLocation(latitude=0, longitude=45)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(45);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0014 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0015
     * @tc.name      Location_CityPickerStateSetLastLocation_0015
     * @tc.desc      CityPickerState.setLastLocation(latitude=0, longitude=50) yields 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0015 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(0, 50);
      logInfo(`setLastLocation(latitude=0, longitude=50)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(50);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0015 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0016
     * @tc.name      Location_CityPickerStateSetLastLocation_0016
     * @tc.desc      CityPickerState.setLastLocation(latitude=0, longitude=55) yields 55
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0016 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(0, 55);
      logInfo(`setLastLocation(latitude=0, longitude=55)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(55);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0016 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0017
     * @tc.name      Location_CityPickerStateSetLastLocation_0017
     * @tc.desc      CityPickerState.setLastLocation(latitude=0, longitude=60) yields 60
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0017 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(0, 60);
      logInfo(`setLastLocation(latitude=0, longitude=60)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(60);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0017 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0018
     * @tc.name      Location_CityPickerStateSetLastLocation_0018
     * @tc.desc      CityPickerState.setLastLocation(latitude=0, longitude=65) yields 65
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0018 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(0, 65);
      logInfo(`setLastLocation(latitude=0, longitude=65)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(65);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0018 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0019
     * @tc.name      Location_CityPickerStateSetLastLocation_0019
     * @tc.desc      CityPickerState.setLastLocation(latitude=0, longitude=70) yields 70
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0019 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(0, 70);
      logInfo(`setLastLocation(latitude=0, longitude=70)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(70);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0019 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0020
     * @tc.name      Location_CityPickerStateSetLastLocation_0020
     * @tc.desc      CityPickerState.setLastLocation(latitude=0, longitude=75) yields 75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0020 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(0, 75);
      logInfo(`setLastLocation(latitude=0, longitude=75)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(75);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0020 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0021
     * @tc.name      Location_CityPickerStateSetLastLocation_0021
     * @tc.desc      CityPickerState.setLastLocation(latitude=0, longitude=80) yields 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0021 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(0, 80);
      logInfo(`setLastLocation(latitude=0, longitude=80)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(80);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0021 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0022
     * @tc.name      Location_CityPickerStateSetLastLocation_0022
     * @tc.desc      CityPickerState.setLastLocation(latitude=0, longitude=85) yields 85
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0022 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(0, 85);
      logInfo(`setLastLocation(latitude=0, longitude=85)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(85);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0022 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0023
     * @tc.name      Location_CityPickerStateSetLastLocation_0023
     * @tc.desc      CityPickerState.setLastLocation(latitude=0, longitude=90) yields 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0023 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(0, 90);
      logInfo(`setLastLocation(latitude=0, longitude=90)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(90);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0023 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0024
     * @tc.name      Location_CityPickerStateSetLastLocation_0024
     * @tc.desc      CityPickerState.setLastLocation(latitude=0, longitude=95) yields 95
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0024 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(0, 95);
      logInfo(`setLastLocation(latitude=0, longitude=95)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(95);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0024 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0025
     * @tc.name      Location_CityPickerStateSetLastLocation_0025
     * @tc.desc      CityPickerState.setLastLocation(latitude=0, longitude=105) yields 105
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0025 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(0, 105);
      logInfo(`setLastLocation(latitude=0, longitude=105...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(105);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0025 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0026
     * @tc.name      Location_CityPickerStateSetLastLocation_0026
     * @tc.desc      CityPickerState.setLastLocation(latitude=0, longitude=110) yields 110
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0026 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(0, 110);
      logInfo(`setLastLocation(latitude=0, longitude=110...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(110);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0026 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0027
     * @tc.name      Location_CityPickerStateSetLastLocation_0027
     * @tc.desc      CityPickerState.setLastLocation(latitude=0, longitude=115) yields 115
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0027 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(0, 115);
      logInfo(`setLastLocation(latitude=0, longitude=115...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(115);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0027 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0028
     * @tc.name      Location_CityPickerStateSetLastLocation_0028
     * @tc.desc      CityPickerState.setLastLocation(latitude=0, longitude=192) yields 192
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0028 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(0, 192);
      logInfo(`setLastLocation(latitude=0, longitude=192...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(192);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0028 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0029
     * @tc.name      Location_CityPickerStateSetLastLocation_0029
     * @tc.desc      CityPickerState.setLastLocation(latitude=0, longitude=78) yields 78
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0029 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(0, 78);
      logInfo(`setLastLocation(latitude=0, longitude=78)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(78);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0029 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0030
     * @tc.name      Location_CityPickerStateSetLastLocation_0030
     * @tc.desc      CityPickerState.setLastLocation(latitude=-1, longitude=0) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0030 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(-1, 0);
      logInfo(`setLastLocation(latitude=-1, longitude=0)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(-1);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0030 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0031
     * @tc.name      Location_CityPickerStateSetLastLocation_0031
     * @tc.desc      CityPickerState.setLastLocation(latitude=-1, longitude=-1) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0031 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(-1, -1);
      logInfo(`setLastLocation(latitude=-1, longitude=-1...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(-1);
      logInfo(`setLastLocation(latitude=-1, longitude=-1...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(-1);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0031 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0032
     * @tc.name      Location_CityPickerStateSetLastLocation_0032
     * @tc.desc      CityPickerState.setLastLocation(latitude=-1, longitude=1) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0032 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(-1, 1);
      logInfo(`setLastLocation(latitude=-1, longitude=1)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(-1);
      logInfo(`setLastLocation(latitude=-1, longitude=1)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(1);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0032 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0033
     * @tc.name      Location_CityPickerStateSetLastLocation_0033
     * @tc.desc      CityPickerState.setLastLocation(latitude=-1, longitude=2) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0033 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(-1, 2);
      logInfo(`setLastLocation(latitude=-1, longitude=2)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(-1);
      logInfo(`setLastLocation(latitude=-1, longitude=2)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(2);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0033 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0034
     * @tc.name      Location_CityPickerStateSetLastLocation_0034
     * @tc.desc      CityPickerState.setLastLocation(latitude=-1, longitude=3) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0034 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(-1, 3);
      logInfo(`setLastLocation(latitude=-1, longitude=3)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(-1);
      logInfo(`setLastLocation(latitude=-1, longitude=3)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(3);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0034 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0035
     * @tc.name      Location_CityPickerStateSetLastLocation_0035
     * @tc.desc      CityPickerState.setLastLocation(latitude=-1, longitude=10) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0035 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(-1, 10);
      logInfo(`setLastLocation(latitude=-1, longitude=10...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(-1);
      logInfo(`setLastLocation(latitude=-1, longitude=10...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(10);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0035 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0036
     * @tc.name      Location_CityPickerStateSetLastLocation_0036
     * @tc.desc      CityPickerState.setLastLocation(latitude=-1, longitude=100) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0036 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(-1, 100);
      logInfo(`setLastLocation(latitude=-1, longitude=10...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(-1);
      logInfo(`setLastLocation(latitude=-1, longitude=10...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(100);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0036 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0037
     * @tc.name      Location_CityPickerStateSetLastLocation_0037
     * @tc.desc      CityPickerState.setLastLocation(latitude=-1, longitude=5) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0037 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(-1, 5);
      logInfo(`setLastLocation(latitude=-1, longitude=5)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(-1);
      logInfo(`setLastLocation(latitude=-1, longitude=5)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(5);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0037 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0038
     * @tc.name      Location_CityPickerStateSetLastLocation_0038
     * @tc.desc      CityPickerState.setLastLocation(latitude=-1, longitude=15) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0038 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(-1, 15);
      logInfo(`setLastLocation(latitude=-1, longitude=15...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(-1);
      logInfo(`setLastLocation(latitude=-1, longitude=15...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(15);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0038 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0039
     * @tc.name      Location_CityPickerStateSetLastLocation_0039
     * @tc.desc      CityPickerState.setLastLocation(latitude=-1, longitude=20) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0039 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(-1, 20);
      logInfo(`setLastLocation(latitude=-1, longitude=20...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(-1);
      logInfo(`setLastLocation(latitude=-1, longitude=20...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(20);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0039 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0040
     * @tc.name      Location_CityPickerStateSetLastLocation_0040
     * @tc.desc      CityPickerState.setLastLocation(latitude=-1, longitude=25) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0040 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(-1, 25);
      logInfo(`setLastLocation(latitude=-1, longitude=25...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(-1);
      logInfo(`setLastLocation(latitude=-1, longitude=25...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(25);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0040 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0041
     * @tc.name      Location_CityPickerStateSetLastLocation_0041
     * @tc.desc      CityPickerState.setLastLocation(latitude=-1, longitude=30) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0041 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(-1, 30);
      logInfo(`setLastLocation(latitude=-1, longitude=30...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(-1);
      logInfo(`setLastLocation(latitude=-1, longitude=30...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(30);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0041 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0042
     * @tc.name      Location_CityPickerStateSetLastLocation_0042
     * @tc.desc      CityPickerState.setLastLocation(latitude=-1, longitude=35) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0042 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(-1, 35);
      logInfo(`setLastLocation(latitude=-1, longitude=35...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(-1);
      logInfo(`setLastLocation(latitude=-1, longitude=35...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(35);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0042 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0043
     * @tc.name      Location_CityPickerStateSetLastLocation_0043
     * @tc.desc      CityPickerState.setLastLocation(latitude=-1, longitude=40) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0043 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(-1, 40);
      logInfo(`setLastLocation(latitude=-1, longitude=40...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(-1);
      logInfo(`setLastLocation(latitude=-1, longitude=40...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(40);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0043 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0044
     * @tc.name      Location_CityPickerStateSetLastLocation_0044
     * @tc.desc      CityPickerState.setLastLocation(latitude=-1, longitude=45) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0044 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(-1, 45);
      logInfo(`setLastLocation(latitude=-1, longitude=45...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(-1);
      logInfo(`setLastLocation(latitude=-1, longitude=45...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(45);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0044 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0045
     * @tc.name      Location_CityPickerStateSetLastLocation_0045
     * @tc.desc      CityPickerState.setLastLocation(latitude=-1, longitude=50) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0045 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(-1, 50);
      logInfo(`setLastLocation(latitude=-1, longitude=50...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(-1);
      logInfo(`setLastLocation(latitude=-1, longitude=50...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(50);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0045 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0046
     * @tc.name      Location_CityPickerStateSetLastLocation_0046
     * @tc.desc      CityPickerState.setLastLocation(latitude=-1, longitude=55) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0046 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(-1, 55);
      logInfo(`setLastLocation(latitude=-1, longitude=55...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(-1);
      logInfo(`setLastLocation(latitude=-1, longitude=55...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(55);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0046 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0047
     * @tc.name      Location_CityPickerStateSetLastLocation_0047
     * @tc.desc      CityPickerState.setLastLocation(latitude=-1, longitude=60) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0047 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(-1, 60);
      logInfo(`setLastLocation(latitude=-1, longitude=60...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(-1);
      logInfo(`setLastLocation(latitude=-1, longitude=60...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(60);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0047 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0048
     * @tc.name      Location_CityPickerStateSetLastLocation_0048
     * @tc.desc      CityPickerState.setLastLocation(latitude=-1, longitude=65) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0048 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(-1, 65);
      logInfo(`setLastLocation(latitude=-1, longitude=65...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(-1);
      logInfo(`setLastLocation(latitude=-1, longitude=65...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(65);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0048 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0049
     * @tc.name      Location_CityPickerStateSetLastLocation_0049
     * @tc.desc      CityPickerState.setLastLocation(latitude=-1, longitude=70) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0049 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(-1, 70);
      logInfo(`setLastLocation(latitude=-1, longitude=70...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(-1);
      logInfo(`setLastLocation(latitude=-1, longitude=70...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(70);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0049 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0050
     * @tc.name      Location_CityPickerStateSetLastLocation_0050
     * @tc.desc      CityPickerState.setLastLocation(latitude=-1, longitude=75) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0050 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(-1, 75);
      logInfo(`setLastLocation(latitude=-1, longitude=75...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(-1);
      logInfo(`setLastLocation(latitude=-1, longitude=75...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(75);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0050 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0051
     * @tc.name      Location_CityPickerStateSetLastLocation_0051
     * @tc.desc      CityPickerState.setLastLocation(latitude=-1, longitude=80) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0051 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(-1, 80);
      logInfo(`setLastLocation(latitude=-1, longitude=80...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(-1);
      logInfo(`setLastLocation(latitude=-1, longitude=80...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(80);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0051 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0052
     * @tc.name      Location_CityPickerStateSetLastLocation_0052
     * @tc.desc      CityPickerState.setLastLocation(latitude=-1, longitude=85) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0052 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(-1, 85);
      logInfo(`setLastLocation(latitude=-1, longitude=85...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(-1);
      logInfo(`setLastLocation(latitude=-1, longitude=85...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(85);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0052 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0053
     * @tc.name      Location_CityPickerStateSetLastLocation_0053
     * @tc.desc      CityPickerState.setLastLocation(latitude=-1, longitude=90) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0053 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(-1, 90);
      logInfo(`setLastLocation(latitude=-1, longitude=90...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(-1);
      logInfo(`setLastLocation(latitude=-1, longitude=90...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(90);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0053 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0054
     * @tc.name      Location_CityPickerStateSetLastLocation_0054
     * @tc.desc      CityPickerState.setLastLocation(latitude=-1, longitude=95) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0054 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(-1, 95);
      logInfo(`setLastLocation(latitude=-1, longitude=95...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(-1);
      logInfo(`setLastLocation(latitude=-1, longitude=95...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(95);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0054 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0055
     * @tc.name      Location_CityPickerStateSetLastLocation_0055
     * @tc.desc      CityPickerState.setLastLocation(latitude=-1, longitude=105) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0055 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(-1, 105);
      logInfo(`setLastLocation(latitude=-1, longitude=10...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(-1);
      logInfo(`setLastLocation(latitude=-1, longitude=10...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(105);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0055 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0056
     * @tc.name      Location_CityPickerStateSetLastLocation_0056
     * @tc.desc      CityPickerState.setLastLocation(latitude=-1, longitude=110) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0056 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(-1, 110);
      logInfo(`setLastLocation(latitude=-1, longitude=11...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(-1);
      logInfo(`setLastLocation(latitude=-1, longitude=11...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(110);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0056 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0057
     * @tc.name      Location_CityPickerStateSetLastLocation_0057
     * @tc.desc      CityPickerState.setLastLocation(latitude=-1, longitude=115) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0057 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(-1, 115);
      logInfo(`setLastLocation(latitude=-1, longitude=11...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(-1);
      logInfo(`setLastLocation(latitude=-1, longitude=11...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(115);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0057 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0058
     * @tc.name      Location_CityPickerStateSetLastLocation_0058
     * @tc.desc      CityPickerState.setLastLocation(latitude=-1, longitude=192) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0058 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(-1, 192);
      logInfo(`setLastLocation(latitude=-1, longitude=19...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(-1);
      logInfo(`setLastLocation(latitude=-1, longitude=19...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(192);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0058 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0059
     * @tc.name      Location_CityPickerStateSetLastLocation_0059
     * @tc.desc      CityPickerState.setLastLocation(latitude=-1, longitude=78) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0059 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(-1, 78);
      logInfo(`setLastLocation(latitude=-1, longitude=78...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(-1);
      logInfo(`setLastLocation(latitude=-1, longitude=78...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(78);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0059 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0060
     * @tc.name      Location_CityPickerStateSetLastLocation_0060
     * @tc.desc      CityPickerState.setLastLocation(latitude=1, longitude=0) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0060 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(1, 0);
      logInfo(`setLastLocation(latitude=1, longitude=0) ...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(1);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0060 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0061
     * @tc.name      Location_CityPickerStateSetLastLocation_0061
     * @tc.desc      CityPickerState.setLastLocation(latitude=1, longitude=-1) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0061 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(1, -1);
      logInfo(`setLastLocation(latitude=1, longitude=-1)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(1);
      logInfo(`setLastLocation(latitude=1, longitude=-1)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(-1);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0061 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0062
     * @tc.name      Location_CityPickerStateSetLastLocation_0062
     * @tc.desc      CityPickerState.setLastLocation(latitude=1, longitude=1) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0062 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(1, 1);
      logInfo(`setLastLocation(latitude=1, longitude=1) ...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(1);
      logInfo(`setLastLocation(latitude=1, longitude=1) ...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(1);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0062 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0063
     * @tc.name      Location_CityPickerStateSetLastLocation_0063
     * @tc.desc      CityPickerState.setLastLocation(latitude=1, longitude=2) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0063 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(1, 2);
      logInfo(`setLastLocation(latitude=1, longitude=2) ...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(1);
      logInfo(`setLastLocation(latitude=1, longitude=2) ...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(2);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0063 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0064
     * @tc.name      Location_CityPickerStateSetLastLocation_0064
     * @tc.desc      CityPickerState.setLastLocation(latitude=1, longitude=3) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0064 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(1, 3);
      logInfo(`setLastLocation(latitude=1, longitude=3) ...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(1);
      logInfo(`setLastLocation(latitude=1, longitude=3) ...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(3);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0064 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0065
     * @tc.name      Location_CityPickerStateSetLastLocation_0065
     * @tc.desc      CityPickerState.setLastLocation(latitude=1, longitude=10) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0065 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(1, 10);
      logInfo(`setLastLocation(latitude=1, longitude=10)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(1);
      logInfo(`setLastLocation(latitude=1, longitude=10)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(10);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0065 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0066
     * @tc.name      Location_CityPickerStateSetLastLocation_0066
     * @tc.desc      CityPickerState.setLastLocation(latitude=1, longitude=100) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0066 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(1, 100);
      logInfo(`setLastLocation(latitude=1, longitude=100...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(1);
      logInfo(`setLastLocation(latitude=1, longitude=100...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(100);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0066 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0067
     * @tc.name      Location_CityPickerStateSetLastLocation_0067
     * @tc.desc      CityPickerState.setLastLocation(latitude=1, longitude=5) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0067 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(1, 5);
      logInfo(`setLastLocation(latitude=1, longitude=5) ...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(1);
      logInfo(`setLastLocation(latitude=1, longitude=5) ...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(5);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0067 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0068
     * @tc.name      Location_CityPickerStateSetLastLocation_0068
     * @tc.desc      CityPickerState.setLastLocation(latitude=1, longitude=15) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0068 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(1, 15);
      logInfo(`setLastLocation(latitude=1, longitude=15)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(1);
      logInfo(`setLastLocation(latitude=1, longitude=15)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(15);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0068 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0069
     * @tc.name      Location_CityPickerStateSetLastLocation_0069
     * @tc.desc      CityPickerState.setLastLocation(latitude=1, longitude=20) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0069 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(1, 20);
      logInfo(`setLastLocation(latitude=1, longitude=20)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(1);
      logInfo(`setLastLocation(latitude=1, longitude=20)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(20);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0069 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0070
     * @tc.name      Location_CityPickerStateSetLastLocation_0070
     * @tc.desc      CityPickerState.setLastLocation(latitude=1, longitude=25) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0070 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(1, 25);
      logInfo(`setLastLocation(latitude=1, longitude=25)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(1);
      logInfo(`setLastLocation(latitude=1, longitude=25)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(25);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0070 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0071
     * @tc.name      Location_CityPickerStateSetLastLocation_0071
     * @tc.desc      CityPickerState.setLastLocation(latitude=1, longitude=30) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0071 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(1, 30);
      logInfo(`setLastLocation(latitude=1, longitude=30)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(1);
      logInfo(`setLastLocation(latitude=1, longitude=30)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(30);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0071 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0072
     * @tc.name      Location_CityPickerStateSetLastLocation_0072
     * @tc.desc      CityPickerState.setLastLocation(latitude=1, longitude=35) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0072 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(1, 35);
      logInfo(`setLastLocation(latitude=1, longitude=35)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(1);
      logInfo(`setLastLocation(latitude=1, longitude=35)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(35);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0072 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0073
     * @tc.name      Location_CityPickerStateSetLastLocation_0073
     * @tc.desc      CityPickerState.setLastLocation(latitude=1, longitude=40) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0073 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(1, 40);
      logInfo(`setLastLocation(latitude=1, longitude=40)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(1);
      logInfo(`setLastLocation(latitude=1, longitude=40)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(40);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0073 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0074
     * @tc.name      Location_CityPickerStateSetLastLocation_0074
     * @tc.desc      CityPickerState.setLastLocation(latitude=1, longitude=45) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0074 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(1, 45);
      logInfo(`setLastLocation(latitude=1, longitude=45)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(1);
      logInfo(`setLastLocation(latitude=1, longitude=45)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(45);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0074 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0075
     * @tc.name      Location_CityPickerStateSetLastLocation_0075
     * @tc.desc      CityPickerState.setLastLocation(latitude=1, longitude=50) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0075 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(1, 50);
      logInfo(`setLastLocation(latitude=1, longitude=50)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(1);
      logInfo(`setLastLocation(latitude=1, longitude=50)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(50);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0075 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0076
     * @tc.name      Location_CityPickerStateSetLastLocation_0076
     * @tc.desc      CityPickerState.setLastLocation(latitude=1, longitude=55) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0076 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(1, 55);
      logInfo(`setLastLocation(latitude=1, longitude=55)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(1);
      logInfo(`setLastLocation(latitude=1, longitude=55)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(55);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0076 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0077
     * @tc.name      Location_CityPickerStateSetLastLocation_0077
     * @tc.desc      CityPickerState.setLastLocation(latitude=1, longitude=60) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0077 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(1, 60);
      logInfo(`setLastLocation(latitude=1, longitude=60)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(1);
      logInfo(`setLastLocation(latitude=1, longitude=60)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(60);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0077 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0078
     * @tc.name      Location_CityPickerStateSetLastLocation_0078
     * @tc.desc      CityPickerState.setLastLocation(latitude=1, longitude=65) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0078 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(1, 65);
      logInfo(`setLastLocation(latitude=1, longitude=65)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(1);
      logInfo(`setLastLocation(latitude=1, longitude=65)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(65);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0078 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0079
     * @tc.name      Location_CityPickerStateSetLastLocation_0079
     * @tc.desc      CityPickerState.setLastLocation(latitude=1, longitude=70) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0079 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(1, 70);
      logInfo(`setLastLocation(latitude=1, longitude=70)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(1);
      logInfo(`setLastLocation(latitude=1, longitude=70)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(70);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0079 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0080
     * @tc.name      Location_CityPickerStateSetLastLocation_0080
     * @tc.desc      CityPickerState.setLastLocation(latitude=1, longitude=75) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0080 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(1, 75);
      logInfo(`setLastLocation(latitude=1, longitude=75)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(1);
      logInfo(`setLastLocation(latitude=1, longitude=75)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(75);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0080 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0081
     * @tc.name      Location_CityPickerStateSetLastLocation_0081
     * @tc.desc      CityPickerState.setLastLocation(latitude=1, longitude=80) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0081 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(1, 80);
      logInfo(`setLastLocation(latitude=1, longitude=80)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(1);
      logInfo(`setLastLocation(latitude=1, longitude=80)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(80);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0081 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0082
     * @tc.name      Location_CityPickerStateSetLastLocation_0082
     * @tc.desc      CityPickerState.setLastLocation(latitude=1, longitude=85) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0082 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(1, 85);
      logInfo(`setLastLocation(latitude=1, longitude=85)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(1);
      logInfo(`setLastLocation(latitude=1, longitude=85)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(85);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0082 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0083
     * @tc.name      Location_CityPickerStateSetLastLocation_0083
     * @tc.desc      CityPickerState.setLastLocation(latitude=1, longitude=90) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0083 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(1, 90);
      logInfo(`setLastLocation(latitude=1, longitude=90)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(1);
      logInfo(`setLastLocation(latitude=1, longitude=90)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(90);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0083 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SET_LAST_LOCATION_0084
     * @tc.name      Location_CityPickerStateSetLastLocation_0084
     * @tc.desc      CityPickerState.setLastLocation(latitude=1, longitude=95) yields 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSetLastLocation_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0084 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(1, 95);
      logInfo(`setLastLocation(latitude=1, longitude=95)...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(1);
      logInfo(`setLastLocation(latitude=1, longitude=95)...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(95);
      logInfo(`${BUNDLE}CityPickerStateSetLastLocation_0084 end`);
    });
  });
}
