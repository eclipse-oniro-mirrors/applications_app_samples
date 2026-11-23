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

/** Logic checks for new CityPickerState (1 cases). */
export default function cityPickerStateCtorTest(): void {
  describe('CityPickerStateCtorTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_CTOR_0001
     * @tc.name      Location_CityPickerStateCtor_0001
     * @tc.desc      new CityPickerState() initialises 6 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Location_CityPickerStateCtor_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CityPickerStateCtor_0001 begin`);
      const subject: CityPickerState = new CityPickerState();
      logInfo(`new CityPickerState(): subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(0);
      logInfo(`new CityPickerState(): subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('');
      logInfo(`new CityPickerState(): subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('');
      logInfo(`new CityPickerState(): subject.city=${subject.city}`);
      expect(subject.city).assertEqual('');
      logInfo(`new CityPickerState(): subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(0);
      logInfo(`new CityPickerState(): subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(0);
      logInfo(`${BUNDLE}CityPickerStateCtor_0001 end`);
    });
  });
}
