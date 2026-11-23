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
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for CityPickerState.scrollTo (81 cases). */
export default function cityPickerStateScrollToTest(): void {
  describe('CityPickerStateScrollToTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0001
     * @tc.name      Location_CityPickerStateScrollTo_0001
     * @tc.desc      CityPickerState.scrollTo(index=0) yields "A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Location_CityPickerStateScrollTo_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0001 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(0);
      logInfo(`scrollTo(index=0): actual=${actual}`);
      expect(actual).assertEqual('A');
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0001 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0002
     * @tc.name      Location_CityPickerStateScrollTo_0002
     * @tc.desc      CityPickerState.scrollTo(index=1) yields "B"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Location_CityPickerStateScrollTo_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0002 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(1);
      logInfo(`scrollTo(index=1): actual=${actual}`);
      expect(actual).assertEqual('B');
      logInfo(`scrollTo(index=1) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(1);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0002 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0003
     * @tc.name      Location_CityPickerStateScrollTo_0003
     * @tc.desc      CityPickerState.scrollTo(index=-1) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_CityPickerStateScrollTo_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0003 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(-1);
      logInfo(`scrollTo(index=-1): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=-1) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(-1);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0003 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0004
     * @tc.name      Location_CityPickerStateScrollTo_0004
     * @tc.desc      CityPickerState.scrollTo(index=2) yields "C"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0004 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(2);
      logInfo(`scrollTo(index=2): actual=${actual}`);
      expect(actual).assertEqual('C');
      logInfo(`scrollTo(index=2) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(2);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0004 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0005
     * @tc.name      Location_CityPickerStateScrollTo_0005
     * @tc.desc      CityPickerState.scrollTo(index=5) yields "H"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0005 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(5);
      logInfo(`scrollTo(index=5): actual=${actual}`);
      expect(actual).assertEqual('H');
      logInfo(`scrollTo(index=5) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(5);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0005 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0006
     * @tc.name      Location_CityPickerStateScrollTo_0006
     * @tc.desc      CityPickerState.scrollTo(index=10) yields "S"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0006 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(10);
      logInfo(`scrollTo(index=10): actual=${actual}`);
      expect(actual).assertEqual('S');
      logInfo(`scrollTo(index=10) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(10);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0006 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0007
     * @tc.name      Location_CityPickerStateScrollTo_0007
     * @tc.desc      CityPickerState.scrollTo(index=3) yields "F"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0007 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(3);
      logInfo(`scrollTo(index=3): actual=${actual}`);
      expect(actual).assertEqual('F');
      logInfo(`scrollTo(index=3) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(3);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0007 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0008
     * @tc.name      Location_CityPickerStateScrollTo_0008
     * @tc.desc      CityPickerState.scrollTo(index=100) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0008 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(100);
      logInfo(`scrollTo(index=100): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=100) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(100);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0008 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0009
     * @tc.name      Location_CityPickerStateScrollTo_0009
     * @tc.desc      CityPickerState.scrollTo(index=15) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0009 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(15);
      logInfo(`scrollTo(index=15): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=15) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(15);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0009 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0010
     * @tc.name      Location_CityPickerStateScrollTo_0010
     * @tc.desc      CityPickerState.scrollTo(index=20) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0010 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(20);
      logInfo(`scrollTo(index=20): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=20) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(20);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0010 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0011
     * @tc.name      Location_CityPickerStateScrollTo_0011
     * @tc.desc      CityPickerState.scrollTo(index=25) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0011 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(25);
      logInfo(`scrollTo(index=25): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=25) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(25);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0011 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0012
     * @tc.name      Location_CityPickerStateScrollTo_0012
     * @tc.desc      CityPickerState.scrollTo(index=30) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0012 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(30);
      logInfo(`scrollTo(index=30): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=30) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(30);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0012 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0013
     * @tc.name      Location_CityPickerStateScrollTo_0013
     * @tc.desc      CityPickerState.scrollTo(index=35) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0013 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(35);
      logInfo(`scrollTo(index=35): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=35) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(35);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0013 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0014
     * @tc.name      Location_CityPickerStateScrollTo_0014
     * @tc.desc      CityPickerState.scrollTo(index=40) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0014 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(40);
      logInfo(`scrollTo(index=40): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=40) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(40);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0014 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0015
     * @tc.name      Location_CityPickerStateScrollTo_0015
     * @tc.desc      CityPickerState.scrollTo(index=45) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0015 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(45);
      logInfo(`scrollTo(index=45): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=45) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(45);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0015 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0016
     * @tc.name      Location_CityPickerStateScrollTo_0016
     * @tc.desc      CityPickerState.scrollTo(index=50) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0016 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(50);
      logInfo(`scrollTo(index=50): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=50) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(50);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0016 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0017
     * @tc.name      Location_CityPickerStateScrollTo_0017
     * @tc.desc      CityPickerState.scrollTo(index=55) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0017 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(55);
      logInfo(`scrollTo(index=55): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=55) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(55);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0017 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0018
     * @tc.name      Location_CityPickerStateScrollTo_0018
     * @tc.desc      CityPickerState.scrollTo(index=60) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0018 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(60);
      logInfo(`scrollTo(index=60): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=60) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(60);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0018 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0019
     * @tc.name      Location_CityPickerStateScrollTo_0019
     * @tc.desc      CityPickerState.scrollTo(index=65) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0019 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(65);
      logInfo(`scrollTo(index=65): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=65) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(65);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0019 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0020
     * @tc.name      Location_CityPickerStateScrollTo_0020
     * @tc.desc      CityPickerState.scrollTo(index=70) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0020 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(70);
      logInfo(`scrollTo(index=70): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=70) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(70);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0020 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0021
     * @tc.name      Location_CityPickerStateScrollTo_0021
     * @tc.desc      CityPickerState.scrollTo(index=75) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0021 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(75);
      logInfo(`scrollTo(index=75): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=75) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(75);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0021 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0022
     * @tc.name      Location_CityPickerStateScrollTo_0022
     * @tc.desc      CityPickerState.scrollTo(index=80) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0022 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(80);
      logInfo(`scrollTo(index=80): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=80) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(80);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0022 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0023
     * @tc.name      Location_CityPickerStateScrollTo_0023
     * @tc.desc      CityPickerState.scrollTo(index=85) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0023 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(85);
      logInfo(`scrollTo(index=85): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=85) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(85);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0023 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0024
     * @tc.name      Location_CityPickerStateScrollTo_0024
     * @tc.desc      CityPickerState.scrollTo(index=90) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0024 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(90);
      logInfo(`scrollTo(index=90): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=90) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(90);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0024 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0025
     * @tc.name      Location_CityPickerStateScrollTo_0025
     * @tc.desc      CityPickerState.scrollTo(index=95) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0025 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(95);
      logInfo(`scrollTo(index=95): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=95) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(95);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0025 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0026
     * @tc.name      Location_CityPickerStateScrollTo_0026
     * @tc.desc      CityPickerState.scrollTo(index=105) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0026 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(105);
      logInfo(`scrollTo(index=105): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=105) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(105);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0026 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0027
     * @tc.name      Location_CityPickerStateScrollTo_0027
     * @tc.desc      CityPickerState.scrollTo(index=110) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0027 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(110);
      logInfo(`scrollTo(index=110): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=110) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(110);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0027 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0028
     * @tc.name      Location_CityPickerStateScrollTo_0028
     * @tc.desc      CityPickerState.scrollTo(index=115) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0028 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(115);
      logInfo(`scrollTo(index=115): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=115) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(115);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0028 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0029
     * @tc.name      Location_CityPickerStateScrollTo_0029
     * @tc.desc      CityPickerState.scrollTo(index=120) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0029 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(120);
      logInfo(`scrollTo(index=120): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=120) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(120);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0029 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0030
     * @tc.name      Location_CityPickerStateScrollTo_0030
     * @tc.desc      CityPickerState.scrollTo(index=125) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0030 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(125);
      logInfo(`scrollTo(index=125): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=125) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(125);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0030 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0031
     * @tc.name      Location_CityPickerStateScrollTo_0031
     * @tc.desc      CityPickerState.scrollTo(index=130) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0031 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(130);
      logInfo(`scrollTo(index=130): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=130) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(130);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0031 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0032
     * @tc.name      Location_CityPickerStateScrollTo_0032
     * @tc.desc      CityPickerState.scrollTo(index=135) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0032 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(135);
      logInfo(`scrollTo(index=135): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=135) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(135);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0032 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0033
     * @tc.name      Location_CityPickerStateScrollTo_0033
     * @tc.desc      CityPickerState.scrollTo(index=140) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0033 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(140);
      logInfo(`scrollTo(index=140): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=140) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(140);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0033 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0034
     * @tc.name      Location_CityPickerStateScrollTo_0034
     * @tc.desc      CityPickerState.scrollTo(index=145) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0034 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(145);
      logInfo(`scrollTo(index=145): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=145) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(145);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0034 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0035
     * @tc.name      Location_CityPickerStateScrollTo_0035
     * @tc.desc      CityPickerState.scrollTo(index=150) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0035 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(150);
      logInfo(`scrollTo(index=150): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=150) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(150);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0035 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0036
     * @tc.name      Location_CityPickerStateScrollTo_0036
     * @tc.desc      CityPickerState.scrollTo(index=155) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0036 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(155);
      logInfo(`scrollTo(index=155): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=155) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(155);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0036 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0037
     * @tc.name      Location_CityPickerStateScrollTo_0037
     * @tc.desc      CityPickerState.scrollTo(index=160) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0037 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(160);
      logInfo(`scrollTo(index=160): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=160) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(160);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0037 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0038
     * @tc.name      Location_CityPickerStateScrollTo_0038
     * @tc.desc      CityPickerState.scrollTo(index=165) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0038 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(165);
      logInfo(`scrollTo(index=165): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=165) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(165);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0038 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0039
     * @tc.name      Location_CityPickerStateScrollTo_0039
     * @tc.desc      CityPickerState.scrollTo(index=170) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0039 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(170);
      logInfo(`scrollTo(index=170): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=170) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(170);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0039 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0040
     * @tc.name      Location_CityPickerStateScrollTo_0040
     * @tc.desc      CityPickerState.scrollTo(index=175) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0040 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(175);
      logInfo(`scrollTo(index=175): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=175) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(175);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0040 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0041
     * @tc.name      Location_CityPickerStateScrollTo_0041
     * @tc.desc      CityPickerState.scrollTo(index=180) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0041 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(180);
      logInfo(`scrollTo(index=180): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=180) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(180);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0041 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0042
     * @tc.name      Location_CityPickerStateScrollTo_0042
     * @tc.desc      CityPickerState.scrollTo(index=185) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0042 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(185);
      logInfo(`scrollTo(index=185): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=185) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(185);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0042 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0043
     * @tc.name      Location_CityPickerStateScrollTo_0043
     * @tc.desc      CityPickerState.scrollTo(index=190) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0043 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(190);
      logInfo(`scrollTo(index=190): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=190) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(190);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0043 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0044
     * @tc.name      Location_CityPickerStateScrollTo_0044
     * @tc.desc      CityPickerState.scrollTo(index=195) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0044 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(195);
      logInfo(`scrollTo(index=195): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=195) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(195);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0044 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0045
     * @tc.name      Location_CityPickerStateScrollTo_0045
     * @tc.desc      CityPickerState.scrollTo(index=200) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0045 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(200);
      logInfo(`scrollTo(index=200): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=200) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(200);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0045 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0046
     * @tc.name      Location_CityPickerStateScrollTo_0046
     * @tc.desc      CityPickerState.scrollTo(index=136) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0046 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(136);
      logInfo(`scrollTo(index=136): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=136) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(136);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0046 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0047
     * @tc.name      Location_CityPickerStateScrollTo_0047
     * @tc.desc      CityPickerState.scrollTo(index=-48) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_CityPickerStateScrollTo_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0047 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(-48);
      logInfo(`scrollTo(index=-48): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=-48) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(-48);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0047 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0048
     * @tc.name      Location_CityPickerStateScrollTo_0048
     * @tc.desc      CityPickerState.scrollTo(index=90.66) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0048 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(90.66);
      logInfo(`scrollTo(index=90.66): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=90.66) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertClose(90.66, PRECISION);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0048 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0049
     * @tc.name      Location_CityPickerStateScrollTo_0049
     * @tc.desc      CityPickerState.scrollTo(index=179) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0049 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(179);
      logInfo(`scrollTo(index=179): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=179) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(179);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0049 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0050
     * @tc.name      Location_CityPickerStateScrollTo_0050
     * @tc.desc      CityPickerState.scrollTo(index=-19) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_CityPickerStateScrollTo_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0050 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(-19);
      logInfo(`scrollTo(index=-19): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=-19) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(-19);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0050 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0051
     * @tc.name      Location_CityPickerStateScrollTo_0051
     * @tc.desc      CityPickerState.scrollTo(index=87.51) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0051 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(87.51);
      logInfo(`scrollTo(index=87.51): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=87.51) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertClose(87.51, PRECISION);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0051 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0052
     * @tc.name      Location_CityPickerStateScrollTo_0052
     * @tc.desc      CityPickerState.scrollTo(index=-68) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_CityPickerStateScrollTo_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0052 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(-68);
      logInfo(`scrollTo(index=-68): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=-68) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(-68);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0052 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0053
     * @tc.name      Location_CityPickerStateScrollTo_0053
     * @tc.desc      CityPickerState.scrollTo(index=-60) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_CityPickerStateScrollTo_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0053 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(-60);
      logInfo(`scrollTo(index=-60): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=-60) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(-60);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0053 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0054
     * @tc.name      Location_CityPickerStateScrollTo_0054
     * @tc.desc      CityPickerState.scrollTo(index=79) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0054 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(79);
      logInfo(`scrollTo(index=79): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=79) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(79);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0054 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0055
     * @tc.name      Location_CityPickerStateScrollTo_0055
     * @tc.desc      CityPickerState.scrollTo(index=19) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0055 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(19);
      logInfo(`scrollTo(index=19): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=19) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(19);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0055 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0056
     * @tc.name      Location_CityPickerStateScrollTo_0056
     * @tc.desc      CityPickerState.scrollTo(index=-7) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_CityPickerStateScrollTo_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0056 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(-7);
      logInfo(`scrollTo(index=-7): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=-7) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(-7);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0056 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0057
     * @tc.name      Location_CityPickerStateScrollTo_0057
     * @tc.desc      CityPickerState.scrollTo(index=54.46) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0057 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(54.46);
      logInfo(`scrollTo(index=54.46): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=54.46) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertClose(54.46, PRECISION);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0057 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0058
     * @tc.name      Location_CityPickerStateScrollTo_0058
     * @tc.desc      CityPickerState.scrollTo(index=134) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0058 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(134);
      logInfo(`scrollTo(index=134): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=134) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(134);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0058 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0059
     * @tc.name      Location_CityPickerStateScrollTo_0059
     * @tc.desc      CityPickerState.scrollTo(index=27) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0059 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(27);
      logInfo(`scrollTo(index=27): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=27) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(27);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0059 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0060
     * @tc.name      Location_CityPickerStateScrollTo_0060
     * @tc.desc      CityPickerState.scrollTo(index=191) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0060 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(191);
      logInfo(`scrollTo(index=191): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=191) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(191);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0060 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0061
     * @tc.name      Location_CityPickerStateScrollTo_0061
     * @tc.desc      CityPickerState.scrollTo(index=97.16) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0061 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(97.16);
      logInfo(`scrollTo(index=97.16): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=97.16) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertClose(97.16, PRECISION);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0061 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0062
     * @tc.name      Location_CityPickerStateScrollTo_0062
     * @tc.desc      CityPickerState.scrollTo(index=44.89) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0062 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(44.89);
      logInfo(`scrollTo(index=44.89): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=44.89) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertClose(44.89, PRECISION);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0062 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0063
     * @tc.name      Location_CityPickerStateScrollTo_0063
     * @tc.desc      CityPickerState.scrollTo(index=43.7) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0063 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(43.7);
      logInfo(`scrollTo(index=43.7): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=43.7) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertClose(43.7, PRECISION);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0063 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0064
     * @tc.name      Location_CityPickerStateScrollTo_0064
     * @tc.desc      CityPickerState.scrollTo(index=6.17) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0064 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(6.17);
      logInfo(`scrollTo(index=6.17): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=6.17) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertClose(6.17, PRECISION);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0064 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0065
     * @tc.name      Location_CityPickerStateScrollTo_0065
     * @tc.desc      CityPickerState.scrollTo(index=42) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0065 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(42);
      logInfo(`scrollTo(index=42): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=42) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(42);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0065 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0066
     * @tc.name      Location_CityPickerStateScrollTo_0066
     * @tc.desc      CityPickerState.scrollTo(index=57) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0066 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(57);
      logInfo(`scrollTo(index=57): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=57) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(57);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0066 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0067
     * @tc.name      Location_CityPickerStateScrollTo_0067
     * @tc.desc      CityPickerState.scrollTo(index=-53) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_CityPickerStateScrollTo_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0067 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(-53);
      logInfo(`scrollTo(index=-53): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=-53) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(-53);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0067 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0068
     * @tc.name      Location_CityPickerStateScrollTo_0068
     * @tc.desc      CityPickerState.scrollTo(index=184) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0068 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(184);
      logInfo(`scrollTo(index=184): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=184) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(184);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0068 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0069
     * @tc.name      Location_CityPickerStateScrollTo_0069
     * @tc.desc      CityPickerState.scrollTo(index=122) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0069 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(122);
      logInfo(`scrollTo(index=122): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=122) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(122);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0069 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0070
     * @tc.name      Location_CityPickerStateScrollTo_0070
     * @tc.desc      CityPickerState.scrollTo(index=52.87) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0070 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(52.87);
      logInfo(`scrollTo(index=52.87): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=52.87) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertClose(52.87, PRECISION);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0070 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0071
     * @tc.name      Location_CityPickerStateScrollTo_0071
     * @tc.desc      CityPickerState.scrollTo(index=81.14) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0071 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(81.14);
      logInfo(`scrollTo(index=81.14): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=81.14) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertClose(81.14, PRECISION);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0071 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0072
     * @tc.name      Location_CityPickerStateScrollTo_0072
     * @tc.desc      CityPickerState.scrollTo(index=58.76) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0072 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(58.76);
      logInfo(`scrollTo(index=58.76): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=58.76) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertClose(58.76, PRECISION);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0072 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0073
     * @tc.name      Location_CityPickerStateScrollTo_0073
     * @tc.desc      CityPickerState.scrollTo(index=-3) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_CityPickerStateScrollTo_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0073 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(-3);
      logInfo(`scrollTo(index=-3): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=-3) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(-3);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0073 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0074
     * @tc.name      Location_CityPickerStateScrollTo_0074
     * @tc.desc      CityPickerState.scrollTo(index=-42) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_CityPickerStateScrollTo_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0074 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(-42);
      logInfo(`scrollTo(index=-42): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=-42) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(-42);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0074 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0075
     * @tc.name      Location_CityPickerStateScrollTo_0075
     * @tc.desc      CityPickerState.scrollTo(index=33) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0075 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(33);
      logInfo(`scrollTo(index=33): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=33) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(33);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0075 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0076
     * @tc.name      Location_CityPickerStateScrollTo_0076
     * @tc.desc      CityPickerState.scrollTo(index=132) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0076 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(132);
      logInfo(`scrollTo(index=132): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=132) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(132);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0076 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0077
     * @tc.name      Location_CityPickerStateScrollTo_0077
     * @tc.desc      CityPickerState.scrollTo(index=172) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0077 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(172);
      logInfo(`scrollTo(index=172): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=172) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(172);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0077 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0078
     * @tc.name      Location_CityPickerStateScrollTo_0078
     * @tc.desc      CityPickerState.scrollTo(index=62) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0078 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(62);
      logInfo(`scrollTo(index=62): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=62) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(62);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0078 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0079
     * @tc.name      Location_CityPickerStateScrollTo_0079
     * @tc.desc      CityPickerState.scrollTo(index=142) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0079 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(142);
      logInfo(`scrollTo(index=142): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=142) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(142);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0079 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0080
     * @tc.name      Location_CityPickerStateScrollTo_0080
     * @tc.desc      CityPickerState.scrollTo(index=69) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0080 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(69);
      logInfo(`scrollTo(index=69): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=69) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(69);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0080 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0081
     * @tc.name      Location_CityPickerStateScrollTo_0081
     * @tc.desc      CityPickerState.scrollTo(index=78.36) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0081 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(78.36);
      logInfo(`scrollTo(index=78.36): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=78.36) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertClose(78.36, PRECISION);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0081 end`);
    });
  });
}
