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

/** Logic checks for CityPickerState.locate (8 cases). */
export default function cityPickerStateLocateTest(): void {
  describe('CityPickerStateLocateTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_LOCATE_0001
     * @tc.name      Location_CityPickerStateLocate_0001
     * @tc.desc      CityPickerState.locate(localities=[]) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Location_CityPickerStateLocate_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CityPickerStateLocate_0001 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.locate([]);
      logInfo(`locate(localities=[]): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateLocate_0001 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_LOCATE_0002
     * @tc.name      Location_CityPickerStateLocate_0002
     * @tc.desc      CityPickerState.locate(localities=["x", "", "a"]) yields "x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Location_CityPickerStateLocate_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CityPickerStateLocate_0002 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.locate(['x', '', 'a']);
      logInfo(`locate(localities=["x", "", "a"]): actual=${actual}`);
      expect(actual).assertEqual('x');
      logInfo(`locate(localities=["x", "", "a"]) state: subject.city=${subject.city}`);
      expect(subject.city).assertEqual('x');
      logInfo(`${BUNDLE}CityPickerStateLocate_0002 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_LOCATE_0003
     * @tc.name      Location_CityPickerStateLocate_0003
     * @tc.desc      CityPickerState.locate(localities=["a", "a"]) yields "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateLocate_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateLocate_0003 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.locate(['a', 'a']);
      logInfo(`locate(localities=["a", "a"]): actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`locate(localities=["a", "a"]) state: subject.city=${subject.city}`);
      expect(subject.city).assertEqual('a');
      logInfo(`${BUNDLE}CityPickerStateLocate_0003 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_LOCATE_0004
     * @tc.name      Location_CityPickerStateLocate_0004
     * @tc.desc      CityPickerState.locate(localities=["abc", "x", "Hello World", "x", " "]) yields "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateLocate_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateLocate_0004 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.locate(['abc', 'x', 'Hello World', 'x', ' ']);
      logInfo(`locate(localities=["abc", "x", "Hello Wor...: actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`locate(localities=["abc", "x", "Hello Wor...: subject.city=${subject.city}`);
      expect(subject.city).assertEqual('abc');
      logInfo(`${BUNDLE}CityPickerStateLocate_0004 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_LOCATE_0005
     * @tc.name      Location_CityPickerStateLocate_0005
     * @tc.desc      CityPickerState.locate(localities=[" ", "Hello World", "abc", "a", "x", ""]) yields " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateLocate_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateLocate_0005 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.locate([' ', 'Hello World', 'abc', 'a', 'x', '']);
      logInfo(`locate(localities=[" ", "Hello World", "a...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`locate(localities=[" ", "Hello World", "a...: subject.city=${subject.city}`);
      expect(subject.city).assertEqual(' ');
      logInfo(`${BUNDLE}CityPickerStateLocate_0005 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_LOCATE_0006
     * @tc.name      Location_CityPickerStateLocate_0006
     * @tc.desc      CityPickerState.locate(localities=[""]) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateLocate_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateLocate_0006 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.locate(['']);
      logInfo(`locate(localities=[""]): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateLocate_0006 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_LOCATE_0007
     * @tc.name      Location_CityPickerStateLocate_0007
     * @tc.desc      CityPickerState.locate(localities=["", "x"]) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateLocate_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateLocate_0007 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.locate(['', 'x']);
      logInfo(`locate(localities=["", "x"]): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateLocate_0007 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_LOCATE_0008
     * @tc.name      Location_CityPickerStateLocate_0008
     * @tc.desc      CityPickerState.locate(localities=["", "x", "a", "abc", "Hello World"]) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateLocate_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateLocate_0008 begin`);
      const subject: CityPickerState = new CityPickerState();
      const actual: string = subject.locate(['', 'x', 'a', 'abc', 'Hello World']);
      logInfo(`locate(localities=["", "x", "a", "abc", "...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateLocate_0008 end`);
    });
  });
}
