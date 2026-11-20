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

/** Logic checks for CityPickerState.scrollTo (39 cases). */
export default function cityPickerStateScrollTo2Test(): void {
  describe('CityPickerStateScrollTo2Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0082
     * @tc.name      Location_CityPickerStateScrollTo_0082
     * @tc.desc      CityPickerState.scrollTo(index=-54) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_CityPickerStateScrollTo_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0082 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(-54);
      logInfo(`scrollTo(index=-54): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=-54) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(-54);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0082 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0083
     * @tc.name      Location_CityPickerStateScrollTo_0083
     * @tc.desc      CityPickerState.scrollTo(index=29) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0083 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(29);
      logInfo(`scrollTo(index=29): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=29) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(29);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0083 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0084
     * @tc.name      Location_CityPickerStateScrollTo_0084
     * @tc.desc      CityPickerState.scrollTo(index=183) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0084 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(183);
      logInfo(`scrollTo(index=183): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=183) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(183);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0084 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0085
     * @tc.name      Location_CityPickerStateScrollTo_0085
     * @tc.desc      CityPickerState.scrollTo(index=93.65) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0085 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(93.65);
      logInfo(`scrollTo(index=93.65): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=93.65) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertClose(93.65, PRECISION);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0085 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0086
     * @tc.name      Location_CityPickerStateScrollTo_0086
     * @tc.desc      CityPickerState.scrollTo(index=11) yields "T"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0086 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(11);
      logInfo(`scrollTo(index=11): actual=${actual}`);
      expect(actual).assertEqual('T');
      logInfo(`scrollTo(index=11) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(11);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0086 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0087
     * @tc.name      Location_CityPickerStateScrollTo_0087
     * @tc.desc      CityPickerState.scrollTo(index=19.96) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0087 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(19.96);
      logInfo(`scrollTo(index=19.96): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=19.96) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertClose(19.96, PRECISION);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0087 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0088
     * @tc.name      Location_CityPickerStateScrollTo_0088
     * @tc.desc      CityPickerState.scrollTo(index=-38) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_CityPickerStateScrollTo_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0088 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(-38);
      logInfo(`scrollTo(index=-38): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=-38) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(-38);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0088 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0089
     * @tc.name      Location_CityPickerStateScrollTo_0089
     * @tc.desc      CityPickerState.scrollTo(index=167) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0089 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(167);
      logInfo(`scrollTo(index=167): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=167) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(167);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0089 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0090
     * @tc.name      Location_CityPickerStateScrollTo_0090
     * @tc.desc      CityPickerState.scrollTo(index=196) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0090 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(196);
      logInfo(`scrollTo(index=196): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=196) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(196);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0090 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0091
     * @tc.name      Location_CityPickerStateScrollTo_0091
     * @tc.desc      CityPickerState.scrollTo(index=137) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0091 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(137);
      logInfo(`scrollTo(index=137): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=137) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(137);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0091 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0092
     * @tc.name      Location_CityPickerStateScrollTo_0092
     * @tc.desc      CityPickerState.scrollTo(index=157) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0092 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(157);
      logInfo(`scrollTo(index=157): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=157) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(157);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0092 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0093
     * @tc.name      Location_CityPickerStateScrollTo_0093
     * @tc.desc      CityPickerState.scrollTo(index=-75) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_CityPickerStateScrollTo_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0093 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(-75);
      logInfo(`scrollTo(index=-75): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=-75) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(-75);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0093 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0094
     * @tc.name      Location_CityPickerStateScrollTo_0094
     * @tc.desc      CityPickerState.scrollTo(index=50.55) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0094 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(50.55);
      logInfo(`scrollTo(index=50.55): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=50.55) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertClose(50.55, PRECISION);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0094 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0095
     * @tc.name      Location_CityPickerStateScrollTo_0095
     * @tc.desc      CityPickerState.scrollTo(index=48.28) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0095 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(48.28);
      logInfo(`scrollTo(index=48.28): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=48.28) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertClose(48.28, PRECISION);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0095 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0096
     * @tc.name      Location_CityPickerStateScrollTo_0096
     * @tc.desc      CityPickerState.scrollTo(index=186) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0096 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(186);
      logInfo(`scrollTo(index=186): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=186) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(186);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0096 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0097
     * @tc.name      Location_CityPickerStateScrollTo_0097
     * @tc.desc      CityPickerState.scrollTo(index=63.31) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0097 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(63.31);
      logInfo(`scrollTo(index=63.31): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=63.31) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertClose(63.31, PRECISION);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0097 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0098
     * @tc.name      Location_CityPickerStateScrollTo_0098
     * @tc.desc      CityPickerState.scrollTo(index=96.32) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0098 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(96.32);
      logInfo(`scrollTo(index=96.32): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=96.32) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertClose(96.32, PRECISION);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0098 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0099
     * @tc.name      Location_CityPickerStateScrollTo_0099
     * @tc.desc      CityPickerState.scrollTo(index=63) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0099 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(63);
      logInfo(`scrollTo(index=63): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=63) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(63);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0099 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0100
     * @tc.name      Location_CityPickerStateScrollTo_0100
     * @tc.desc      CityPickerState.scrollTo(index=20.14) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0100 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(20.14);
      logInfo(`scrollTo(index=20.14): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=20.14) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertClose(20.14, PRECISION);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0100 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0101
     * @tc.name      Location_CityPickerStateScrollTo_0101
     * @tc.desc      CityPickerState.scrollTo(index=-15) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_CityPickerStateScrollTo_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0101 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(-15);
      logInfo(`scrollTo(index=-15): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=-15) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(-15);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0101 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0102
     * @tc.name      Location_CityPickerStateScrollTo_0102
     * @tc.desc      CityPickerState.scrollTo(index=-73) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_CityPickerStateScrollTo_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0102 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(-73);
      logInfo(`scrollTo(index=-73): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=-73) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(-73);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0102 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0103
     * @tc.name      Location_CityPickerStateScrollTo_0103
     * @tc.desc      CityPickerState.scrollTo(index=131) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0103 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(131);
      logInfo(`scrollTo(index=131): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=131) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(131);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0103 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0104
     * @tc.name      Location_CityPickerStateScrollTo_0104
     * @tc.desc      CityPickerState.scrollTo(index=23.43) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0104 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(23.43);
      logInfo(`scrollTo(index=23.43): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=23.43) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertClose(23.43, PRECISION);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0104 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0105
     * @tc.name      Location_CityPickerStateScrollTo_0105
     * @tc.desc      CityPickerState.scrollTo(index=95.32) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0105 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(95.32);
      logInfo(`scrollTo(index=95.32): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=95.32) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertClose(95.32, PRECISION);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0105 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0106
     * @tc.name      Location_CityPickerStateScrollTo_0106
     * @tc.desc      CityPickerState.scrollTo(index=-52) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_CityPickerStateScrollTo_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0106 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(-52);
      logInfo(`scrollTo(index=-52): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=-52) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(-52);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0106 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0107
     * @tc.name      Location_CityPickerStateScrollTo_0107
     * @tc.desc      CityPickerState.scrollTo(index=56) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0107 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(56);
      logInfo(`scrollTo(index=56): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=56) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(56);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0107 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0108
     * @tc.name      Location_CityPickerStateScrollTo_0108
     * @tc.desc      CityPickerState.scrollTo(index=8) yields "N"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0108 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(8);
      logInfo(`scrollTo(index=8): actual=${actual}`);
      expect(actual).assertEqual('N');
      logInfo(`scrollTo(index=8) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(8);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0108 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0109
     * @tc.name      Location_CityPickerStateScrollTo_0109
     * @tc.desc      CityPickerState.scrollTo(index=198) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0109 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(198);
      logInfo(`scrollTo(index=198): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=198) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(198);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0109 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0110
     * @tc.name      Location_CityPickerStateScrollTo_0110
     * @tc.desc      CityPickerState.scrollTo(index=27.27) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0110 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(27.27);
      logInfo(`scrollTo(index=27.27): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=27.27) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertClose(27.27, PRECISION);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0110 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0111
     * @tc.name      Location_CityPickerStateScrollTo_0111
     * @tc.desc      CityPickerState.scrollTo(index=143) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0111 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(143);
      logInfo(`scrollTo(index=143): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=143) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(143);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0111 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0112
     * @tc.name      Location_CityPickerStateScrollTo_0112
     * @tc.desc      CityPickerState.scrollTo(index=49.83) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0112 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(49.83);
      logInfo(`scrollTo(index=49.83): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=49.83) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertClose(49.83, PRECISION);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0112 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0113
     * @tc.name      Location_CityPickerStateScrollTo_0113
     * @tc.desc      CityPickerState.scrollTo(index=12.38) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0113 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(12.38);
      logInfo(`scrollTo(index=12.38): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=12.38) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertClose(12.38, PRECISION);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0113 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0114
     * @tc.name      Location_CityPickerStateScrollTo_0114
     * @tc.desc      CityPickerState.scrollTo(index=61) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0114 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(61);
      logInfo(`scrollTo(index=61): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=61) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(61);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0114 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0115
     * @tc.name      Location_CityPickerStateScrollTo_0115
     * @tc.desc      CityPickerState.scrollTo(index=92) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0115 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(92);
      logInfo(`scrollTo(index=92): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=92) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(92);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0115 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0116
     * @tc.name      Location_CityPickerStateScrollTo_0116
     * @tc.desc      CityPickerState.scrollTo(index=-14) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_CityPickerStateScrollTo_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0116 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(-14);
      logInfo(`scrollTo(index=-14): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=-14) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(-14);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0116 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0117
     * @tc.name      Location_CityPickerStateScrollTo_0117
     * @tc.desc      CityPickerState.scrollTo(index=112) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0117 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(112);
      logInfo(`scrollTo(index=112): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=112) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(112);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0117 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0118
     * @tc.name      Location_CityPickerStateScrollTo_0118
     * @tc.desc      CityPickerState.scrollTo(index=45.84) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateScrollTo_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0118 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(45.84);
      logInfo(`scrollTo(index=45.84): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=45.84) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertClose(45.84, PRECISION);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0118 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0119
     * @tc.name      Location_CityPickerStateScrollTo_0119
     * @tc.desc      CityPickerState.scrollTo(index=-10) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_CityPickerStateScrollTo_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0119 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(-10);
      logInfo(`scrollTo(index=-10): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=-10) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(-10);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0119 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_SCROLL_TO_0120
     * @tc.name      Location_CityPickerStateScrollTo_0120
     * @tc.desc      CityPickerState.scrollTo(index=-70) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_CityPickerStateScrollTo_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0120 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.scrollTo(-70);
      logInfo(`scrollTo(index=-70): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`scrollTo(index=-70) state: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(-70);
      logInfo(`${BUNDLE}CityPickerStateScrollTo_0120 end`);
    });
  });
}
