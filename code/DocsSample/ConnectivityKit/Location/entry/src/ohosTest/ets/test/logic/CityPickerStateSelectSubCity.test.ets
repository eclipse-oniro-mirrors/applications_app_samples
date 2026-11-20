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

/** Logic checks for CityPickerState.selectSubCity (30 cases). */
export default function cityPickerStateSelectSubCityTest(): void {
  describe('CityPickerStateSelectSubCityTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_SUB_CITY_0001
     * @tc.name      Location_CityPickerStateSelectSubCity_0001
     * @tc.desc      CityPickerState.selectSubCity(province="", subCity="") yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Location_CityPickerStateSelectSubCity_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectSubCity_0001 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectSubCity('', '');
      logInfo(`selectSubCity(province="", subCity=""): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectSubCity_0001 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_SUB_CITY_0002
     * @tc.name      Location_CityPickerStateSelectSubCity_0002
     * @tc.desc      CityPickerState.selectSubCity(province="", subCity="x") yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Location_CityPickerStateSelectSubCity_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectSubCity_0002 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectSubCity('', 'x');
      logInfo(`selectSubCity(province="", subCity="x"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectSubCity_0002 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_SUB_CITY_0003
     * @tc.name      Location_CityPickerStateSelectSubCity_0003
     * @tc.desc      CityPickerState.selectSubCity(province="", subCity="a") yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSelectSubCity_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectSubCity_0003 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectSubCity('', 'a');
      logInfo(`selectSubCity(province="", subCity="a"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectSubCity_0003 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_SUB_CITY_0004
     * @tc.name      Location_CityPickerStateSelectSubCity_0004
     * @tc.desc      CityPickerState.selectSubCity(province="", subCity="abc") yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSelectSubCity_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectSubCity_0004 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectSubCity('', 'abc');
      logInfo(`selectSubCity(province="", subCity="abc"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectSubCity_0004 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_SUB_CITY_0005
     * @tc.name      Location_CityPickerStateSelectSubCity_0005
     * @tc.desc      CityPickerState.selectSubCity(province="", subCity="Hello World") yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSelectSubCity_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectSubCity_0005 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectSubCity('', 'Hello World');
      logInfo(`selectSubCity(province="", subCity="Hello...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectSubCity_0005 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_SUB_CITY_0006
     * @tc.name      Location_CityPickerStateSelectSubCity_0006
     * @tc.desc      CityPickerState.selectSubCity(province="", subCity=" ") yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSelectSubCity_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectSubCity_0006 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectSubCity('', ' ');
      logInfo(`selectSubCity(province="", subCity=" "): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectSubCity_0006 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_SUB_CITY_0007
     * @tc.name      Location_CityPickerStateSelectSubCity_0007
     * @tc.desc      CityPickerState.selectSubCity(province="", subCity="123") yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSelectSubCity_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectSubCity_0007 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectSubCity('', '123');
      logInfo(`selectSubCity(province="", subCity="123"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectSubCity_0007 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_SUB_CITY_0008
     * @tc.name      Location_CityPickerStateSelectSubCity_0008
     * @tc.desc      CityPickerState.selectSubCity(province="", subCity=" x ") yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_CityPickerStateSelectSubCity_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectSubCity_0008 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectSubCity('', ' x ');
      logInfo(`selectSubCity(province="", subCity=" x "): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectSubCity_0008 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_SUB_CITY_0009
     * @tc.name      Location_CityPickerStateSelectSubCity_0009
     * @tc.desc      CityPickerState.selectSubCity(province="", subCity="xx") yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSelectSubCity_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectSubCity_0009 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectSubCity('', 'xx');
      logInfo(`selectSubCity(province="", subCity="xx"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectSubCity_0009 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_SUB_CITY_0010
     * @tc.name      Location_CityPickerStateSelectSubCity_0010
     * @tc.desc      CityPickerState.selectSubCity(province="", subCity="x_1") yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSelectSubCity_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectSubCity_0010 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectSubCity('', 'x_1');
      logInfo(`selectSubCity(province="", subCity="x_1"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectSubCity_0010 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_SUB_CITY_0011
     * @tc.name      Location_CityPickerStateSelectSubCity_0011
     * @tc.desc      CityPickerState.selectSubCity(province="", subCity=" a ") yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_CityPickerStateSelectSubCity_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectSubCity_0011 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectSubCity('', ' a ');
      logInfo(`selectSubCity(province="", subCity=" a "): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectSubCity_0011 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_SUB_CITY_0012
     * @tc.name      Location_CityPickerStateSelectSubCity_0012
     * @tc.desc      CityPickerState.selectSubCity(province="", subCity="aa") yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSelectSubCity_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectSubCity_0012 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectSubCity('', 'aa');
      logInfo(`selectSubCity(province="", subCity="aa"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectSubCity_0012 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_SUB_CITY_0013
     * @tc.name      Location_CityPickerStateSelectSubCity_0013
     * @tc.desc      CityPickerState.selectSubCity(province="", subCity="a_1") yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSelectSubCity_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectSubCity_0013 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectSubCity('', 'a_1');
      logInfo(`selectSubCity(province="", subCity="a_1"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectSubCity_0013 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_SUB_CITY_0014
     * @tc.name      Location_CityPickerStateSelectSubCity_0014
     * @tc.desc      CityPickerState.selectSubCity(province="", subCity="xa") yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_CityPickerStateSelectSubCity_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectSubCity_0014 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectSubCity('', 'xa');
      logInfo(`selectSubCity(province="", subCity="xa"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectSubCity_0014 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_SUB_CITY_0015
     * @tc.name      Location_CityPickerStateSelectSubCity_0015
     * @tc.desc      CityPickerState.selectSubCity(province="", subCity=" abc ") yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_CityPickerStateSelectSubCity_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectSubCity_0015 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectSubCity('', ' abc ');
      logInfo(`selectSubCity(province="", subCity=" abc "): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectSubCity_0015 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_SUB_CITY_0016
     * @tc.name      Location_CityPickerStateSelectSubCity_0016
     * @tc.desc      CityPickerState.selectSubCity(province="", subCity="abcabc") yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSelectSubCity_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectSubCity_0016 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectSubCity('', 'abcabc');
      logInfo(`selectSubCity(province="", subCity="abcabc"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectSubCity_0016 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_SUB_CITY_0017
     * @tc.name      Location_CityPickerStateSelectSubCity_0017
     * @tc.desc      CityPickerState.selectSubCity(province="", subCity="abc_1") yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSelectSubCity_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectSubCity_0017 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectSubCity('', 'abc_1');
      logInfo(`selectSubCity(province="", subCity="abc_1"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectSubCity_0017 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_SUB_CITY_0018
     * @tc.name      Location_CityPickerStateSelectSubCity_0018
     * @tc.desc      CityPickerState.selectSubCity(province="", subCity="xabc") yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_CityPickerStateSelectSubCity_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectSubCity_0018 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectSubCity('', 'xabc');
      logInfo(`selectSubCity(province="", subCity="xabc"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectSubCity_0018 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_SUB_CITY_0019
     * @tc.name      Location_CityPickerStateSelectSubCity_0019
     * @tc.desc      CityPickerState.selectSubCity(province="", subCity=" Hello World ") yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_CityPickerStateSelectSubCity_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectSubCity_0019 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectSubCity('', ' Hello World ');
      logInfo(`selectSubCity(province="", subCity=" Hell...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectSubCity_0019 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_SUB_CITY_0020
     * @tc.name      Location_CityPickerStateSelectSubCity_0020
     * @tc.desc      CityPickerState.selectSubCity(province="", subCity="Hello WorldHello World") yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSelectSubCity_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectSubCity_0020 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectSubCity('', 'Hello WorldHello World');
      logInfo(`selectSubCity(province="", subCity="Hello...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectSubCity_0020 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_SUB_CITY_0021
     * @tc.name      Location_CityPickerStateSelectSubCity_0021
     * @tc.desc      CityPickerState.selectSubCity(province="", subCity="Hello World_1") yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSelectSubCity_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectSubCity_0021 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectSubCity('', 'Hello World_1');
      logInfo(`selectSubCity(province="", subCity="Hello...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectSubCity_0021 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_SUB_CITY_0022
     * @tc.name      Location_CityPickerStateSelectSubCity_0022
     * @tc.desc      CityPickerState.selectSubCity(province="", subCity="xHello World") yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_CityPickerStateSelectSubCity_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectSubCity_0022 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectSubCity('', 'xHello World');
      logInfo(`selectSubCity(province="", subCity="xHell...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectSubCity_0022 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_SUB_CITY_0023
     * @tc.name      Location_CityPickerStateSelectSubCity_0023
     * @tc.desc      CityPickerState.selectSubCity(province="", subCity="   ") yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_CityPickerStateSelectSubCity_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectSubCity_0023 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectSubCity('', '   ');
      logInfo(`selectSubCity(province="", subCity="   "): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectSubCity_0023 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_SUB_CITY_0024
     * @tc.name      Location_CityPickerStateSelectSubCity_0024
     * @tc.desc      CityPickerState.selectSubCity(province="", subCity="  ") yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateSelectSubCity_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectSubCity_0024 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectSubCity('', '  ');
      logInfo(`selectSubCity(province="", subCity="  "): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectSubCity_0024 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_SUB_CITY_0025
     * @tc.name      Location_CityPickerStateSelectSubCity_0025
     * @tc.desc      CityPickerState.selectSubCity(province="x", subCity="") yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_CityPickerStateSelectSubCity_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectSubCity_0025 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectSubCity('x', '');
      logInfo(`selectSubCity(province="x", subCity=""): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectSubCity_0025 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_SUB_CITY_0026
     * @tc.name      Location_CityPickerStateSelectSubCity_0026
     * @tc.desc      CityPickerState.selectSubCity(province="x", subCity="x") yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_CityPickerStateSelectSubCity_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectSubCity_0026 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectSubCity('x', 'x');
      logInfo(`selectSubCity(province="x", subCity="x"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectSubCity_0026 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_SUB_CITY_0027
     * @tc.name      Location_CityPickerStateSelectSubCity_0027
     * @tc.desc      CityPickerState.selectSubCity(province="x", subCity="a") yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_CityPickerStateSelectSubCity_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectSubCity_0027 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectSubCity('x', 'a');
      logInfo(`selectSubCity(province="x", subCity="a"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectSubCity_0027 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_SUB_CITY_0028
     * @tc.name      Location_CityPickerStateSelectSubCity_0028
     * @tc.desc      CityPickerState.selectSubCity(province="x", subCity="abc") yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_CityPickerStateSelectSubCity_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectSubCity_0028 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectSubCity('x', 'abc');
      logInfo(`selectSubCity(province="x", subCity="abc"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectSubCity_0028 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_SUB_CITY_0029
     * @tc.name      Location_CityPickerStateSelectSubCity_0029
     * @tc.desc      CityPickerState.selectSubCity(province="x", subCity="Hello World") yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_CityPickerStateSelectSubCity_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectSubCity_0029 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectSubCity('x', 'Hello World');
      logInfo(`selectSubCity(province="x", subCity="Hell...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectSubCity_0029 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SELECT_SUB_CITY_0030
     * @tc.name      Location_CityPickerStateSelectSubCity_0030
     * @tc.desc      CityPickerState.selectSubCity(province="x", subCity=" ") yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_CityPickerStateSelectSubCity_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CityPickerStateSelectSubCity_0030 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.selectSubCity('x', ' ');
      logInfo(`selectSubCity(province="x", subCity=" "): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateSelectSubCity_0030 end`);
    });
  });
}
