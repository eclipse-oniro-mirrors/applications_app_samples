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

/** Logic checks for CityPickerState.selectHeat (89 cases). */
export default function cityPickerStateSelectHeatTest(): void {
  describe('CityPickerStateSelectHeatTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0001
     * @tc.name      Location_CityPickerStateSelectHeat_0001
     * @tc.desc      CityPickerState.selectHeat(index=0) yields "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Location_CityPickerStateSelectHeat_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0001 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(0);
      logInfo(`selectHeat(index=0): actual=${actual}`);
      expect(actual).assertEqual('\u5317\u4eac');
      logInfo(`selectHeat(index=0) state: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('\u5317\u4eac');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0001 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0002
     * @tc.name      Location_CityPickerStateSelectHeat_0002
     * @tc.desc      CityPickerState.selectHeat(index=1) yields "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Location_CityPickerStateSelectHeat_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0002 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(1);
      logInfo(`selectHeat(index=1): actual=${actual}`);
      expect(actual).assertEqual('\u4e0a\u6d77');
      logInfo(`selectHeat(index=1) state: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('\u4e0a\u6d77');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0002 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0003
     * @tc.name      Location_CityPickerStateSelectHeat_0003
     * @tc.desc      CityPickerState.selectHeat(index=-1) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSelectHeat_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0003 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(-1);
      logInfo(`selectHeat(index=-1): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0003 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0004
     * @tc.name      Location_CityPickerStateSelectHeat_0004
     * @tc.desc      CityPickerState.selectHeat(index=2) yields "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectHeat_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0004 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(2);
      logInfo(`selectHeat(index=2): actual=${actual}`);
      expect(actual).assertEqual('\u5e7f\u5dde');
      logInfo(`selectHeat(index=2) state: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('\u5e7f\u5dde');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0004 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0005
     * @tc.name      Location_CityPickerStateSelectHeat_0005
     * @tc.desc      CityPickerState.selectHeat(index=5) yields "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectHeat_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0005 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(5);
      logInfo(`selectHeat(index=5): actual=${actual}`);
      expect(actual).assertEqual('\u5357\u4eac');
      logInfo(`selectHeat(index=5) state: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('\u5357\u4eac');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0005 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0006
     * @tc.name      Location_CityPickerStateSelectHeat_0006
     * @tc.desc      CityPickerState.selectHeat(index=10) yields "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectHeat_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0006 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(10);
      logInfo(`selectHeat(index=10): actual=${actual}`);
      expect(actual).assertEqual('\u91cd\u5e86');
      logInfo(`selectHeat(index=10) state: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('\u91cd\u5e86');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0006 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0007
     * @tc.name      Location_CityPickerStateSelectHeat_0007
     * @tc.desc      CityPickerState.selectHeat(index=3) yields "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectHeat_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0007 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(3);
      logInfo(`selectHeat(index=3): actual=${actual}`);
      expect(actual).assertEqual('\u6df1\u5733');
      logInfo(`selectHeat(index=3) state: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('\u6df1\u5733');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0007 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0008
     * @tc.name      Location_CityPickerStateSelectHeat_0008
     * @tc.desc      CityPickerState.selectHeat(index=11) yields "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectHeat_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0008 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(11);
      logInfo(`selectHeat(index=11): actual=${actual}`);
      expect(actual).assertEqual('\u6210\u90fd');
      logInfo(`selectHeat(index=11) state: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('\u6210\u90fd');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0008 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0009
     * @tc.name      Location_CityPickerStateSelectHeat_0009
     * @tc.desc      CityPickerState.selectHeat(index=7) yields "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectHeat_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0009 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(7);
      logInfo(`selectHeat(index=7): actual=${actual}`);
      expect(actual).assertEqual('\u5929\u6d25');
      logInfo(`selectHeat(index=7) state: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('\u5929\u6d25');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0009 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0010
     * @tc.name      Location_CityPickerStateSelectHeat_0010
     * @tc.desc      CityPickerState.selectHeat(index=100) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectHeat_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0010 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(100);
      logInfo(`selectHeat(index=100): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0010 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0011
     * @tc.name      Location_CityPickerStateSelectHeat_0011
     * @tc.desc      CityPickerState.selectHeat(index=15) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectHeat_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0011 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(15);
      logInfo(`selectHeat(index=15): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0011 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0012
     * @tc.name      Location_CityPickerStateSelectHeat_0012
     * @tc.desc      CityPickerState.selectHeat(index=20) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectHeat_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0012 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(20);
      logInfo(`selectHeat(index=20): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0012 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0013
     * @tc.name      Location_CityPickerStateSelectHeat_0013
     * @tc.desc      CityPickerState.selectHeat(index=25) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectHeat_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0013 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(25);
      logInfo(`selectHeat(index=25): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0013 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0014
     * @tc.name      Location_CityPickerStateSelectHeat_0014
     * @tc.desc      CityPickerState.selectHeat(index=30) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectHeat_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0014 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(30);
      logInfo(`selectHeat(index=30): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0014 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0015
     * @tc.name      Location_CityPickerStateSelectHeat_0015
     * @tc.desc      CityPickerState.selectHeat(index=35) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectHeat_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0015 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(35);
      logInfo(`selectHeat(index=35): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0015 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0016
     * @tc.name      Location_CityPickerStateSelectHeat_0016
     * @tc.desc      CityPickerState.selectHeat(index=40) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectHeat_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0016 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(40);
      logInfo(`selectHeat(index=40): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0016 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0017
     * @tc.name      Location_CityPickerStateSelectHeat_0017
     * @tc.desc      CityPickerState.selectHeat(index=45) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectHeat_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0017 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(45);
      logInfo(`selectHeat(index=45): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0017 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0018
     * @tc.name      Location_CityPickerStateSelectHeat_0018
     * @tc.desc      CityPickerState.selectHeat(index=50) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectHeat_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0018 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(50);
      logInfo(`selectHeat(index=50): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0018 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0019
     * @tc.name      Location_CityPickerStateSelectHeat_0019
     * @tc.desc      CityPickerState.selectHeat(index=55) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectHeat_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0019 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(55);
      logInfo(`selectHeat(index=55): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0019 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0020
     * @tc.name      Location_CityPickerStateSelectHeat_0020
     * @tc.desc      CityPickerState.selectHeat(index=60) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectHeat_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0020 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(60);
      logInfo(`selectHeat(index=60): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0020 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0021
     * @tc.name      Location_CityPickerStateSelectHeat_0021
     * @tc.desc      CityPickerState.selectHeat(index=65) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectHeat_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0021 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(65);
      logInfo(`selectHeat(index=65): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0021 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0022
     * @tc.name      Location_CityPickerStateSelectHeat_0022
     * @tc.desc      CityPickerState.selectHeat(index=70) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectHeat_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0022 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(70);
      logInfo(`selectHeat(index=70): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0022 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0023
     * @tc.name      Location_CityPickerStateSelectHeat_0023
     * @tc.desc      CityPickerState.selectHeat(index=75) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectHeat_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0023 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(75);
      logInfo(`selectHeat(index=75): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0023 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0024
     * @tc.name      Location_CityPickerStateSelectHeat_0024
     * @tc.desc      CityPickerState.selectHeat(index=80) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectHeat_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0024 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(80);
      logInfo(`selectHeat(index=80): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0024 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0025
     * @tc.name      Location_CityPickerStateSelectHeat_0025
     * @tc.desc      CityPickerState.selectHeat(index=85) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectHeat_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0025 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(85);
      logInfo(`selectHeat(index=85): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0025 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0026
     * @tc.name      Location_CityPickerStateSelectHeat_0026
     * @tc.desc      CityPickerState.selectHeat(index=90) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectHeat_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0026 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(90);
      logInfo(`selectHeat(index=90): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0026 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0027
     * @tc.name      Location_CityPickerStateSelectHeat_0027
     * @tc.desc      CityPickerState.selectHeat(index=95) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectHeat_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0027 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(95);
      logInfo(`selectHeat(index=95): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0027 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0028
     * @tc.name      Location_CityPickerStateSelectHeat_0028
     * @tc.desc      CityPickerState.selectHeat(index=105) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectHeat_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0028 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(105);
      logInfo(`selectHeat(index=105): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0028 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0029
     * @tc.name      Location_CityPickerStateSelectHeat_0029
     * @tc.desc      CityPickerState.selectHeat(index=110) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectHeat_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0029 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(110);
      logInfo(`selectHeat(index=110): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0029 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0030
     * @tc.name      Location_CityPickerStateSelectHeat_0030
     * @tc.desc      CityPickerState.selectHeat(index=115) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectHeat_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0030 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(115);
      logInfo(`selectHeat(index=115): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0030 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0031
     * @tc.name      Location_CityPickerStateSelectHeat_0031
     * @tc.desc      CityPickerState.selectHeat(index=120) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectHeat_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0031 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(120);
      logInfo(`selectHeat(index=120): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0031 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0032
     * @tc.name      Location_CityPickerStateSelectHeat_0032
     * @tc.desc      CityPickerState.selectHeat(index=125) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectHeat_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0032 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(125);
      logInfo(`selectHeat(index=125): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0032 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0033
     * @tc.name      Location_CityPickerStateSelectHeat_0033
     * @tc.desc      CityPickerState.selectHeat(index=130) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectHeat_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0033 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(130);
      logInfo(`selectHeat(index=130): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0033 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0034
     * @tc.name      Location_CityPickerStateSelectHeat_0034
     * @tc.desc      CityPickerState.selectHeat(index=135) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectHeat_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0034 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(135);
      logInfo(`selectHeat(index=135): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0034 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0035
     * @tc.name      Location_CityPickerStateSelectHeat_0035
     * @tc.desc      CityPickerState.selectHeat(index=140) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectHeat_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0035 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(140);
      logInfo(`selectHeat(index=140): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0035 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0036
     * @tc.name      Location_CityPickerStateSelectHeat_0036
     * @tc.desc      CityPickerState.selectHeat(index=145) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectHeat_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0036 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(145);
      logInfo(`selectHeat(index=145): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0036 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0037
     * @tc.name      Location_CityPickerStateSelectHeat_0037
     * @tc.desc      CityPickerState.selectHeat(index=150) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectHeat_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0037 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(150);
      logInfo(`selectHeat(index=150): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0037 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0038
     * @tc.name      Location_CityPickerStateSelectHeat_0038
     * @tc.desc      CityPickerState.selectHeat(index=155) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectHeat_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0038 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(155);
      logInfo(`selectHeat(index=155): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0038 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0039
     * @tc.name      Location_CityPickerStateSelectHeat_0039
     * @tc.desc      CityPickerState.selectHeat(index=160) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectHeat_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0039 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(160);
      logInfo(`selectHeat(index=160): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0039 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0040
     * @tc.name      Location_CityPickerStateSelectHeat_0040
     * @tc.desc      CityPickerState.selectHeat(index=165) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectHeat_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0040 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(165);
      logInfo(`selectHeat(index=165): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0040 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0041
     * @tc.name      Location_CityPickerStateSelectHeat_0041
     * @tc.desc      CityPickerState.selectHeat(index=170) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectHeat_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0041 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(170);
      logInfo(`selectHeat(index=170): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0041 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0042
     * @tc.name      Location_CityPickerStateSelectHeat_0042
     * @tc.desc      CityPickerState.selectHeat(index=175) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectHeat_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0042 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(175);
      logInfo(`selectHeat(index=175): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0042 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0043
     * @tc.name      Location_CityPickerStateSelectHeat_0043
     * @tc.desc      CityPickerState.selectHeat(index=180) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectHeat_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0043 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(180);
      logInfo(`selectHeat(index=180): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0043 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0044
     * @tc.name      Location_CityPickerStateSelectHeat_0044
     * @tc.desc      CityPickerState.selectHeat(index=185) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectHeat_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0044 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(185);
      logInfo(`selectHeat(index=185): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0044 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0045
     * @tc.name      Location_CityPickerStateSelectHeat_0045
     * @tc.desc      CityPickerState.selectHeat(index=190) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectHeat_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0045 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(190);
      logInfo(`selectHeat(index=190): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0045 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0046
     * @tc.name      Location_CityPickerStateSelectHeat_0046
     * @tc.desc      CityPickerState.selectHeat(index=195) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectHeat_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0046 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(195);
      logInfo(`selectHeat(index=195): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0046 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0047
     * @tc.name      Location_CityPickerStateSelectHeat_0047
     * @tc.desc      CityPickerState.selectHeat(index=200) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectHeat_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0047 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(200);
      logInfo(`selectHeat(index=200): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0047 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0048
     * @tc.name      Location_CityPickerStateSelectHeat_0048
     * @tc.desc      CityPickerState.selectHeat(index=154) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectHeat_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0048 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(154);
      logInfo(`selectHeat(index=154): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0048 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0049
     * @tc.name      Location_CityPickerStateSelectHeat_0049
     * @tc.desc      CityPickerState.selectHeat(index=34) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectHeat_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0049 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(34);
      logInfo(`selectHeat(index=34): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0049 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0050
     * @tc.name      Location_CityPickerStateSelectHeat_0050
     * @tc.desc      CityPickerState.selectHeat(index=17) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectHeat_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0050 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(17);
      logInfo(`selectHeat(index=17): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0050 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0051
     * @tc.name      Location_CityPickerStateSelectHeat_0051
     * @tc.desc      CityPickerState.selectHeat(index=173) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectHeat_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0051 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(173);
      logInfo(`selectHeat(index=173): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0051 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0052
     * @tc.name      Location_CityPickerStateSelectHeat_0052
     * @tc.desc      CityPickerState.selectHeat(index=184) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectHeat_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0052 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(184);
      logInfo(`selectHeat(index=184): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0052 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0053
     * @tc.name      Location_CityPickerStateSelectHeat_0053
     * @tc.desc      CityPickerState.selectHeat(index=29) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectHeat_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0053 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(29);
      logInfo(`selectHeat(index=29): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0053 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0054
     * @tc.name      Location_CityPickerStateSelectHeat_0054
     * @tc.desc      CityPickerState.selectHeat(index=182) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectHeat_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0054 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(182);
      logInfo(`selectHeat(index=182): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0054 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0055
     * @tc.name      Location_CityPickerStateSelectHeat_0055
     * @tc.desc      CityPickerState.selectHeat(index=13.99) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectHeat_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0055 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(13.99);
      logInfo(`selectHeat(index=13.99): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0055 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0056
     * @tc.name      Location_CityPickerStateSelectHeat_0056
     * @tc.desc      CityPickerState.selectHeat(index=192) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectHeat_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0056 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(192);
      logInfo(`selectHeat(index=192): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0056 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0057
     * @tc.name      Location_CityPickerStateSelectHeat_0057
     * @tc.desc      CityPickerState.selectHeat(index=36.51) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectHeat_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0057 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(36.51);
      logInfo(`selectHeat(index=36.51): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0057 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0058
     * @tc.name      Location_CityPickerStateSelectHeat_0058
     * @tc.desc      CityPickerState.selectHeat(index=-82) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_CityPickerStateSelectHeat_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0058 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(-82);
      logInfo(`selectHeat(index=-82): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0058 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0059
     * @tc.name      Location_CityPickerStateSelectHeat_0059
     * @tc.desc      CityPickerState.selectHeat(index=-54) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_CityPickerStateSelectHeat_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0059 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(-54);
      logInfo(`selectHeat(index=-54): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0059 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0060
     * @tc.name      Location_CityPickerStateSelectHeat_0060
     * @tc.desc      CityPickerState.selectHeat(index=-28) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_CityPickerStateSelectHeat_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0060 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(-28);
      logInfo(`selectHeat(index=-28): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0060 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0061
     * @tc.name      Location_CityPickerStateSelectHeat_0061
     * @tc.desc      CityPickerState.selectHeat(index=-19) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_CityPickerStateSelectHeat_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0061 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(-19);
      logInfo(`selectHeat(index=-19): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0061 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0062
     * @tc.name      Location_CityPickerStateSelectHeat_0062
     * @tc.desc      CityPickerState.selectHeat(index=32.14) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectHeat_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0062 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(32.14);
      logInfo(`selectHeat(index=32.14): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0062 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0063
     * @tc.name      Location_CityPickerStateSelectHeat_0063
     * @tc.desc      CityPickerState.selectHeat(index=132) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectHeat_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0063 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(132);
      logInfo(`selectHeat(index=132): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0063 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0064
     * @tc.name      Location_CityPickerStateSelectHeat_0064
     * @tc.desc      CityPickerState.selectHeat(index=47) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectHeat_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0064 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(47);
      logInfo(`selectHeat(index=47): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0064 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0065
     * @tc.name      Location_CityPickerStateSelectHeat_0065
     * @tc.desc      CityPickerState.selectHeat(index=-87) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_CityPickerStateSelectHeat_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0065 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(-87);
      logInfo(`selectHeat(index=-87): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0065 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0066
     * @tc.name      Location_CityPickerStateSelectHeat_0066
     * @tc.desc      CityPickerState.selectHeat(index=96.37) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectHeat_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0066 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(96.37);
      logInfo(`selectHeat(index=96.37): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0066 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0067
     * @tc.name      Location_CityPickerStateSelectHeat_0067
     * @tc.desc      CityPickerState.selectHeat(index=41) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectHeat_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0067 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(41);
      logInfo(`selectHeat(index=41): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0067 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0068
     * @tc.name      Location_CityPickerStateSelectHeat_0068
     * @tc.desc      CityPickerState.selectHeat(index=-71) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_CityPickerStateSelectHeat_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0068 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(-71);
      logInfo(`selectHeat(index=-71): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0068 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0069
     * @tc.name      Location_CityPickerStateSelectHeat_0069
     * @tc.desc      CityPickerState.selectHeat(index=176) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectHeat_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0069 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(176);
      logInfo(`selectHeat(index=176): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0069 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0070
     * @tc.name      Location_CityPickerStateSelectHeat_0070
     * @tc.desc      CityPickerState.selectHeat(index=53) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectHeat_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0070 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(53);
      logInfo(`selectHeat(index=53): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0070 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0071
     * @tc.name      Location_CityPickerStateSelectHeat_0071
     * @tc.desc      CityPickerState.selectHeat(index=5.47) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectHeat_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0071 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(5.47);
      logInfo(`selectHeat(index=5.47): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0071 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0072
     * @tc.name      Location_CityPickerStateSelectHeat_0072
     * @tc.desc      CityPickerState.selectHeat(index=-12) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_CityPickerStateSelectHeat_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0072 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(-12);
      logInfo(`selectHeat(index=-12): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0072 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0073
     * @tc.name      Location_CityPickerStateSelectHeat_0073
     * @tc.desc      CityPickerState.selectHeat(index=78) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectHeat_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0073 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(78);
      logInfo(`selectHeat(index=78): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0073 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0074
     * @tc.name      Location_CityPickerStateSelectHeat_0074
     * @tc.desc      CityPickerState.selectHeat(index=24.1) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectHeat_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0074 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(24.1);
      logInfo(`selectHeat(index=24.1): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0074 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0075
     * @tc.name      Location_CityPickerStateSelectHeat_0075
     * @tc.desc      CityPickerState.selectHeat(index=81.61) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectHeat_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0075 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(81.61);
      logInfo(`selectHeat(index=81.61): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0075 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0076
     * @tc.name      Location_CityPickerStateSelectHeat_0076
     * @tc.desc      CityPickerState.selectHeat(index=80.62) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectHeat_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0076 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(80.62);
      logInfo(`selectHeat(index=80.62): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0076 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0077
     * @tc.name      Location_CityPickerStateSelectHeat_0077
     * @tc.desc      CityPickerState.selectHeat(index=-14) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_CityPickerStateSelectHeat_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0077 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(-14);
      logInfo(`selectHeat(index=-14): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0077 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0078
     * @tc.name      Location_CityPickerStateSelectHeat_0078
     * @tc.desc      CityPickerState.selectHeat(index=187) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectHeat_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0078 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(187);
      logInfo(`selectHeat(index=187): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0078 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0079
     * @tc.name      Location_CityPickerStateSelectHeat_0079
     * @tc.desc      CityPickerState.selectHeat(index=163) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectHeat_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0079 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(163);
      logInfo(`selectHeat(index=163): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0079 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0080
     * @tc.name      Location_CityPickerStateSelectHeat_0080
     * @tc.desc      CityPickerState.selectHeat(index=-56) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_CityPickerStateSelectHeat_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0080 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(-56);
      logInfo(`selectHeat(index=-56): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0080 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0081
     * @tc.name      Location_CityPickerStateSelectHeat_0081
     * @tc.desc      CityPickerState.selectHeat(index=51.13) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectHeat_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0081 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(51.13);
      logInfo(`selectHeat(index=51.13): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0081 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0082
     * @tc.name      Location_CityPickerStateSelectHeat_0082
     * @tc.desc      CityPickerState.selectHeat(index=127) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectHeat_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0082 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(127);
      logInfo(`selectHeat(index=127): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0082 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0083
     * @tc.name      Location_CityPickerStateSelectHeat_0083
     * @tc.desc      CityPickerState.selectHeat(index=162) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectHeat_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0083 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(162);
      logInfo(`selectHeat(index=162): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0083 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0084
     * @tc.name      Location_CityPickerStateSelectHeat_0084
     * @tc.desc      CityPickerState.selectHeat(index=31) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectHeat_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0084 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(31);
      logInfo(`selectHeat(index=31): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0084 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0085
     * @tc.name      Location_CityPickerStateSelectHeat_0085
     * @tc.desc      CityPickerState.selectHeat(index=148) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectHeat_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0085 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(148);
      logInfo(`selectHeat(index=148): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0085 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0086
     * @tc.name      Location_CityPickerStateSelectHeat_0086
     * @tc.desc      CityPickerState.selectHeat(index=51) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectHeat_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0086 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(51);
      logInfo(`selectHeat(index=51): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0086 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0087
     * @tc.name      Location_CityPickerStateSelectHeat_0087
     * @tc.desc      CityPickerState.selectHeat(index=134) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectHeat_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0087 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(134);
      logInfo(`selectHeat(index=134): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0087 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0088
     * @tc.name      Location_CityPickerStateSelectHeat_0088
     * @tc.desc      CityPickerState.selectHeat(index=56.56) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectHeat_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0088 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(56.56);
      logInfo(`selectHeat(index=56.56): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0088 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_HEAT_0089
     * @tc.name      Location_CityPickerStateSelectHeat_0089
     * @tc.desc      CityPickerState.selectHeat(index=68) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateSelectHeat_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0089 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectHeat(68);
      logInfo(`selectHeat(index=68): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectHeat_0089 end`);
    });
  });
}
