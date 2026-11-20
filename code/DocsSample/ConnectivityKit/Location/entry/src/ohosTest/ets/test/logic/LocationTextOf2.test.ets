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
import { locationTextOf } from '../model/CityPickerLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Location]';
const BUNDLE: string = 'Location_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for locationTextOf (96 cases). */
export default function locationTextOf2Test(): void {
  describe('LocationTextOf2Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0097
     * @tc.name      Location_LocationTextOf_0097
     * @tc.desc      locationTextOf(currentLocation="Hello World", city="") returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_LocationTextOf_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}LocationTextOf_0097 begin`);
      const actual: string = locationTextOf('Hello World', '');
      logInfo(`locationTextOf(currentLocation="Hello Wor...: actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}LocationTextOf_0097 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0098
     * @tc.name      Location_LocationTextOf_0098
     * @tc.desc      locationTextOf(currentLocation="Hello World", city="x") returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0098 begin`);
      const actual: string = locationTextOf('Hello World', 'x');
      logInfo(`locationTextOf(currentLocation="Hello Wor...: actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}LocationTextOf_0098 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0099
     * @tc.name      Location_LocationTextOf_0099
     * @tc.desc      locationTextOf(currentLocation="Hello World", city="a") returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0099 begin`);
      const actual: string = locationTextOf('Hello World', 'a');
      logInfo(`locationTextOf(currentLocation="Hello Wor...: actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}LocationTextOf_0099 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0100
     * @tc.name      Location_LocationTextOf_0100
     * @tc.desc      locationTextOf(currentLocation="Hello World", city="abc") returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0100 begin`);
      const actual: string = locationTextOf('Hello World', 'abc');
      logInfo(`locationTextOf(currentLocation="Hello Wor...: actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}LocationTextOf_0100 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0101
     * @tc.name      Location_LocationTextOf_0101
     * @tc.desc      locationTextOf(currentLocation="Hello World", city="Hello World") returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0101 begin`);
      const actual: string = locationTextOf('Hello World', 'Hello World');
      logInfo(`locationTextOf(currentLocation="Hello Wor...: actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}LocationTextOf_0101 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0102
     * @tc.name      Location_LocationTextOf_0102
     * @tc.desc      locationTextOf(currentLocation="Hello World", city=" ") returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0102 begin`);
      const actual: string = locationTextOf('Hello World', ' ');
      logInfo(`locationTextOf(currentLocation="Hello Wor...: actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}LocationTextOf_0102 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0103
     * @tc.name      Location_LocationTextOf_0103
     * @tc.desc      locationTextOf(currentLocation="Hello World", city="123") returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0103 begin`);
      const actual: string = locationTextOf('Hello World', '123');
      logInfo(`locationTextOf(currentLocation="Hello Wor...: actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}LocationTextOf_0103 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0104
     * @tc.name      Location_LocationTextOf_0104
     * @tc.desc      locationTextOf(currentLocation="Hello World", city=" x ") returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0104 begin`);
      const actual: string = locationTextOf('Hello World', ' x ');
      logInfo(`locationTextOf(currentLocation="Hello Wor...: actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}LocationTextOf_0104 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0105
     * @tc.name      Location_LocationTextOf_0105
     * @tc.desc      locationTextOf(currentLocation="Hello World", city="xx") returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0105 begin`);
      const actual: string = locationTextOf('Hello World', 'xx');
      logInfo(`locationTextOf(currentLocation="Hello Wor...: actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}LocationTextOf_0105 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0106
     * @tc.name      Location_LocationTextOf_0106
     * @tc.desc      locationTextOf(currentLocation="Hello World", city="x_1") returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0106 begin`);
      const actual: string = locationTextOf('Hello World', 'x_1');
      logInfo(`locationTextOf(currentLocation="Hello Wor...: actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}LocationTextOf_0106 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0107
     * @tc.name      Location_LocationTextOf_0107
     * @tc.desc      locationTextOf(currentLocation="Hello World", city=" a ") returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0107 begin`);
      const actual: string = locationTextOf('Hello World', ' a ');
      logInfo(`locationTextOf(currentLocation="Hello Wor...: actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}LocationTextOf_0107 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0108
     * @tc.name      Location_LocationTextOf_0108
     * @tc.desc      locationTextOf(currentLocation="Hello World", city="aa") returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0108 begin`);
      const actual: string = locationTextOf('Hello World', 'aa');
      logInfo(`locationTextOf(currentLocation="Hello Wor...: actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}LocationTextOf_0108 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0109
     * @tc.name      Location_LocationTextOf_0109
     * @tc.desc      locationTextOf(currentLocation="Hello World", city="a_1") returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0109 begin`);
      const actual: string = locationTextOf('Hello World', 'a_1');
      logInfo(`locationTextOf(currentLocation="Hello Wor...: actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}LocationTextOf_0109 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0110
     * @tc.name      Location_LocationTextOf_0110
     * @tc.desc      locationTextOf(currentLocation="Hello World", city="xa") returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0110 begin`);
      const actual: string = locationTextOf('Hello World', 'xa');
      logInfo(`locationTextOf(currentLocation="Hello Wor...: actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}LocationTextOf_0110 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0111
     * @tc.name      Location_LocationTextOf_0111
     * @tc.desc      locationTextOf(currentLocation="Hello World", city=" abc ") returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0111 begin`);
      const actual: string = locationTextOf('Hello World', ' abc ');
      logInfo(`locationTextOf(currentLocation="Hello Wor...: actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}LocationTextOf_0111 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0112
     * @tc.name      Location_LocationTextOf_0112
     * @tc.desc      locationTextOf(currentLocation="Hello World", city="abcabc") returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0112 begin`);
      const actual: string = locationTextOf('Hello World', 'abcabc');
      logInfo(`locationTextOf(currentLocation="Hello Wor...: actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}LocationTextOf_0112 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0113
     * @tc.name      Location_LocationTextOf_0113
     * @tc.desc      locationTextOf(currentLocation="Hello World", city="abc_1") returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0113 begin`);
      const actual: string = locationTextOf('Hello World', 'abc_1');
      logInfo(`locationTextOf(currentLocation="Hello Wor...: actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}LocationTextOf_0113 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0114
     * @tc.name      Location_LocationTextOf_0114
     * @tc.desc      locationTextOf(currentLocation="Hello World", city="xabc") returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0114 begin`);
      const actual: string = locationTextOf('Hello World', 'xabc');
      logInfo(`locationTextOf(currentLocation="Hello Wor...: actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}LocationTextOf_0114 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0115
     * @tc.name      Location_LocationTextOf_0115
     * @tc.desc      locationTextOf(currentLocation="Hello World", city=" Hello World ") returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0115 begin`);
      const actual: string = locationTextOf('Hello World', ' Hello World ');
      logInfo(`locationTextOf(currentLocation="Hello Wor...: actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}LocationTextOf_0115 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0116
     * @tc.name      Location_LocationTextOf_0116
     * @tc.desc      locationTextOf(currentLocation="Hello World", city="Hello WorldHello World") returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0116 begin`);
      const actual: string = locationTextOf('Hello World', 'Hello WorldHello World');
      logInfo(`locationTextOf(currentLocation="Hello Wor...: actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}LocationTextOf_0116 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0117
     * @tc.name      Location_LocationTextOf_0117
     * @tc.desc      locationTextOf(currentLocation="Hello World", city="Hello World_1") returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0117 begin`);
      const actual: string = locationTextOf('Hello World', 'Hello World_1');
      logInfo(`locationTextOf(currentLocation="Hello Wor...: actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}LocationTextOf_0117 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0118
     * @tc.name      Location_LocationTextOf_0118
     * @tc.desc      locationTextOf(currentLocation="Hello World", city="xHello World") returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0118 begin`);
      const actual: string = locationTextOf('Hello World', 'xHello World');
      logInfo(`locationTextOf(currentLocation="Hello Wor...: actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}LocationTextOf_0118 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0119
     * @tc.name      Location_LocationTextOf_0119
     * @tc.desc      locationTextOf(currentLocation="Hello World", city="   ") returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0119 begin`);
      const actual: string = locationTextOf('Hello World', '   ');
      logInfo(`locationTextOf(currentLocation="Hello Wor...: actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}LocationTextOf_0119 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0120
     * @tc.name      Location_LocationTextOf_0120
     * @tc.desc      locationTextOf(currentLocation="Hello World", city="  ") returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0120 begin`);
      const actual: string = locationTextOf('Hello World', '  ');
      logInfo(`locationTextOf(currentLocation="Hello Wor...: actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}LocationTextOf_0120 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0121
     * @tc.name      Location_LocationTextOf_0121
     * @tc.desc      locationTextOf(currentLocation=" ", city="") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_LocationTextOf_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}LocationTextOf_0121 begin`);
      const actual: string = locationTextOf(' ', '');
      logInfo(`locationTextOf(currentLocation=" ", city=""): actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}LocationTextOf_0121 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0122
     * @tc.name      Location_LocationTextOf_0122
     * @tc.desc      locationTextOf(currentLocation=" ", city="x") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0122 begin`);
      const actual: string = locationTextOf(' ', 'x');
      logInfo(`locationTextOf(currentLocation=" ", city=...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}LocationTextOf_0122 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0123
     * @tc.name      Location_LocationTextOf_0123
     * @tc.desc      locationTextOf(currentLocation=" ", city="a") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0123 begin`);
      const actual: string = locationTextOf(' ', 'a');
      logInfo(`locationTextOf(currentLocation=" ", city=...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}LocationTextOf_0123 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0124
     * @tc.name      Location_LocationTextOf_0124
     * @tc.desc      locationTextOf(currentLocation=" ", city="abc") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0124 begin`);
      const actual: string = locationTextOf(' ', 'abc');
      logInfo(`locationTextOf(currentLocation=" ", city=...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}LocationTextOf_0124 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0125
     * @tc.name      Location_LocationTextOf_0125
     * @tc.desc      locationTextOf(currentLocation=" ", city="Hello World") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0125 begin`);
      const actual: string = locationTextOf(' ', 'Hello World');
      logInfo(`locationTextOf(currentLocation=" ", city=...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}LocationTextOf_0125 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0126
     * @tc.name      Location_LocationTextOf_0126
     * @tc.desc      locationTextOf(currentLocation=" ", city=" ") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0126 begin`);
      const actual: string = locationTextOf(' ', ' ');
      logInfo(`locationTextOf(currentLocation=" ", city=...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}LocationTextOf_0126 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0127
     * @tc.name      Location_LocationTextOf_0127
     * @tc.desc      locationTextOf(currentLocation=" ", city="123") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0127 begin`);
      const actual: string = locationTextOf(' ', '123');
      logInfo(`locationTextOf(currentLocation=" ", city=...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}LocationTextOf_0127 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0128
     * @tc.name      Location_LocationTextOf_0128
     * @tc.desc      locationTextOf(currentLocation=" ", city=" x ") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0128 begin`);
      const actual: string = locationTextOf(' ', ' x ');
      logInfo(`locationTextOf(currentLocation=" ", city=...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}LocationTextOf_0128 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0129
     * @tc.name      Location_LocationTextOf_0129
     * @tc.desc      locationTextOf(currentLocation=" ", city="xx") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0129 begin`);
      const actual: string = locationTextOf(' ', 'xx');
      logInfo(`locationTextOf(currentLocation=" ", city=...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}LocationTextOf_0129 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0130
     * @tc.name      Location_LocationTextOf_0130
     * @tc.desc      locationTextOf(currentLocation=" ", city="x_1") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0130 begin`);
      const actual: string = locationTextOf(' ', 'x_1');
      logInfo(`locationTextOf(currentLocation=" ", city=...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}LocationTextOf_0130 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0131
     * @tc.name      Location_LocationTextOf_0131
     * @tc.desc      locationTextOf(currentLocation=" ", city=" a ") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0131 begin`);
      const actual: string = locationTextOf(' ', ' a ');
      logInfo(`locationTextOf(currentLocation=" ", city=...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}LocationTextOf_0131 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0132
     * @tc.name      Location_LocationTextOf_0132
     * @tc.desc      locationTextOf(currentLocation=" ", city="aa") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0132 begin`);
      const actual: string = locationTextOf(' ', 'aa');
      logInfo(`locationTextOf(currentLocation=" ", city=...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}LocationTextOf_0132 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0133
     * @tc.name      Location_LocationTextOf_0133
     * @tc.desc      locationTextOf(currentLocation=" ", city="a_1") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0133 begin`);
      const actual: string = locationTextOf(' ', 'a_1');
      logInfo(`locationTextOf(currentLocation=" ", city=...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}LocationTextOf_0133 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0134
     * @tc.name      Location_LocationTextOf_0134
     * @tc.desc      locationTextOf(currentLocation=" ", city="xa") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0134 begin`);
      const actual: string = locationTextOf(' ', 'xa');
      logInfo(`locationTextOf(currentLocation=" ", city=...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}LocationTextOf_0134 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0135
     * @tc.name      Location_LocationTextOf_0135
     * @tc.desc      locationTextOf(currentLocation=" ", city=" abc ") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0135 begin`);
      const actual: string = locationTextOf(' ', ' abc ');
      logInfo(`locationTextOf(currentLocation=" ", city=...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}LocationTextOf_0135 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0136
     * @tc.name      Location_LocationTextOf_0136
     * @tc.desc      locationTextOf(currentLocation=" ", city="abcabc") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0136 begin`);
      const actual: string = locationTextOf(' ', 'abcabc');
      logInfo(`locationTextOf(currentLocation=" ", city=...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}LocationTextOf_0136 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0137
     * @tc.name      Location_LocationTextOf_0137
     * @tc.desc      locationTextOf(currentLocation=" ", city="abc_1") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0137 begin`);
      const actual: string = locationTextOf(' ', 'abc_1');
      logInfo(`locationTextOf(currentLocation=" ", city=...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}LocationTextOf_0137 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0138
     * @tc.name      Location_LocationTextOf_0138
     * @tc.desc      locationTextOf(currentLocation=" ", city="xabc") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0138 begin`);
      const actual: string = locationTextOf(' ', 'xabc');
      logInfo(`locationTextOf(currentLocation=" ", city=...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}LocationTextOf_0138 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0139
     * @tc.name      Location_LocationTextOf_0139
     * @tc.desc      locationTextOf(currentLocation=" ", city=" Hello World ") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0139 begin`);
      const actual: string = locationTextOf(' ', ' Hello World ');
      logInfo(`locationTextOf(currentLocation=" ", city=...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}LocationTextOf_0139 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0140
     * @tc.name      Location_LocationTextOf_0140
     * @tc.desc      locationTextOf(currentLocation=" ", city="Hello WorldHello World") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0140 begin`);
      const actual: string = locationTextOf(' ', 'Hello WorldHello World');
      logInfo(`locationTextOf(currentLocation=" ", city=...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}LocationTextOf_0140 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0141
     * @tc.name      Location_LocationTextOf_0141
     * @tc.desc      locationTextOf(currentLocation=" ", city="Hello World_1") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0141 begin`);
      const actual: string = locationTextOf(' ', 'Hello World_1');
      logInfo(`locationTextOf(currentLocation=" ", city=...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}LocationTextOf_0141 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0142
     * @tc.name      Location_LocationTextOf_0142
     * @tc.desc      locationTextOf(currentLocation=" ", city="xHello World") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0142 begin`);
      const actual: string = locationTextOf(' ', 'xHello World');
      logInfo(`locationTextOf(currentLocation=" ", city=...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}LocationTextOf_0142 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0143
     * @tc.name      Location_LocationTextOf_0143
     * @tc.desc      locationTextOf(currentLocation=" ", city="   ") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0143 begin`);
      const actual: string = locationTextOf(' ', '   ');
      logInfo(`locationTextOf(currentLocation=" ", city=...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}LocationTextOf_0143 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0144
     * @tc.name      Location_LocationTextOf_0144
     * @tc.desc      locationTextOf(currentLocation=" ", city="  ") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0144 begin`);
      const actual: string = locationTextOf(' ', '  ');
      logInfo(`locationTextOf(currentLocation=" ", city=...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}LocationTextOf_0144 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0145
     * @tc.name      Location_LocationTextOf_0145
     * @tc.desc      locationTextOf(currentLocation="123", city="") returns "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_LocationTextOf_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}LocationTextOf_0145 begin`);
      const actual: string = locationTextOf('123', '');
      logInfo(`locationTextOf(currentLocation="123", cit...: actual=${actual}`);
      expect(actual).assertEqual('123');
      logInfo(`${BUNDLE}LocationTextOf_0145 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0146
     * @tc.name      Location_LocationTextOf_0146
     * @tc.desc      locationTextOf(currentLocation="123", city="x") returns "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0146 begin`);
      const actual: string = locationTextOf('123', 'x');
      logInfo(`locationTextOf(currentLocation="123", cit...: actual=${actual}`);
      expect(actual).assertEqual('123');
      logInfo(`${BUNDLE}LocationTextOf_0146 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0147
     * @tc.name      Location_LocationTextOf_0147
     * @tc.desc      locationTextOf(currentLocation="123", city="a") returns "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0147 begin`);
      const actual: string = locationTextOf('123', 'a');
      logInfo(`locationTextOf(currentLocation="123", cit...: actual=${actual}`);
      expect(actual).assertEqual('123');
      logInfo(`${BUNDLE}LocationTextOf_0147 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0148
     * @tc.name      Location_LocationTextOf_0148
     * @tc.desc      locationTextOf(currentLocation="123", city="abc") returns "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0148 begin`);
      const actual: string = locationTextOf('123', 'abc');
      logInfo(`locationTextOf(currentLocation="123", cit...: actual=${actual}`);
      expect(actual).assertEqual('123');
      logInfo(`${BUNDLE}LocationTextOf_0148 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0149
     * @tc.name      Location_LocationTextOf_0149
     * @tc.desc      locationTextOf(currentLocation="123", city="Hello World") returns "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0149 begin`);
      const actual: string = locationTextOf('123', 'Hello World');
      logInfo(`locationTextOf(currentLocation="123", cit...: actual=${actual}`);
      expect(actual).assertEqual('123');
      logInfo(`${BUNDLE}LocationTextOf_0149 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0150
     * @tc.name      Location_LocationTextOf_0150
     * @tc.desc      locationTextOf(currentLocation="123", city=" ") returns "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0150 begin`);
      const actual: string = locationTextOf('123', ' ');
      logInfo(`locationTextOf(currentLocation="123", cit...: actual=${actual}`);
      expect(actual).assertEqual('123');
      logInfo(`${BUNDLE}LocationTextOf_0150 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0151
     * @tc.name      Location_LocationTextOf_0151
     * @tc.desc      locationTextOf(currentLocation="123", city="123") returns "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0151 begin`);
      const actual: string = locationTextOf('123', '123');
      logInfo(`locationTextOf(currentLocation="123", cit...: actual=${actual}`);
      expect(actual).assertEqual('123');
      logInfo(`${BUNDLE}LocationTextOf_0151 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0152
     * @tc.name      Location_LocationTextOf_0152
     * @tc.desc      locationTextOf(currentLocation="123", city=" x ") returns "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0152 begin`);
      const actual: string = locationTextOf('123', ' x ');
      logInfo(`locationTextOf(currentLocation="123", cit...: actual=${actual}`);
      expect(actual).assertEqual('123');
      logInfo(`${BUNDLE}LocationTextOf_0152 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0153
     * @tc.name      Location_LocationTextOf_0153
     * @tc.desc      locationTextOf(currentLocation="123", city="xx") returns "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0153 begin`);
      const actual: string = locationTextOf('123', 'xx');
      logInfo(`locationTextOf(currentLocation="123", cit...: actual=${actual}`);
      expect(actual).assertEqual('123');
      logInfo(`${BUNDLE}LocationTextOf_0153 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0154
     * @tc.name      Location_LocationTextOf_0154
     * @tc.desc      locationTextOf(currentLocation="123", city="x_1") returns "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0154 begin`);
      const actual: string = locationTextOf('123', 'x_1');
      logInfo(`locationTextOf(currentLocation="123", cit...: actual=${actual}`);
      expect(actual).assertEqual('123');
      logInfo(`${BUNDLE}LocationTextOf_0154 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0155
     * @tc.name      Location_LocationTextOf_0155
     * @tc.desc      locationTextOf(currentLocation="123", city=" a ") returns "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0155 begin`);
      const actual: string = locationTextOf('123', ' a ');
      logInfo(`locationTextOf(currentLocation="123", cit...: actual=${actual}`);
      expect(actual).assertEqual('123');
      logInfo(`${BUNDLE}LocationTextOf_0155 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0156
     * @tc.name      Location_LocationTextOf_0156
     * @tc.desc      locationTextOf(currentLocation="123", city="aa") returns "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0156 begin`);
      const actual: string = locationTextOf('123', 'aa');
      logInfo(`locationTextOf(currentLocation="123", cit...: actual=${actual}`);
      expect(actual).assertEqual('123');
      logInfo(`${BUNDLE}LocationTextOf_0156 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0157
     * @tc.name      Location_LocationTextOf_0157
     * @tc.desc      locationTextOf(currentLocation="123", city="a_1") returns "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0157 begin`);
      const actual: string = locationTextOf('123', 'a_1');
      logInfo(`locationTextOf(currentLocation="123", cit...: actual=${actual}`);
      expect(actual).assertEqual('123');
      logInfo(`${BUNDLE}LocationTextOf_0157 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0158
     * @tc.name      Location_LocationTextOf_0158
     * @tc.desc      locationTextOf(currentLocation="123", city="xa") returns "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0158 begin`);
      const actual: string = locationTextOf('123', 'xa');
      logInfo(`locationTextOf(currentLocation="123", cit...: actual=${actual}`);
      expect(actual).assertEqual('123');
      logInfo(`${BUNDLE}LocationTextOf_0158 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0159
     * @tc.name      Location_LocationTextOf_0159
     * @tc.desc      locationTextOf(currentLocation="123", city=" abc ") returns "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0159 begin`);
      const actual: string = locationTextOf('123', ' abc ');
      logInfo(`locationTextOf(currentLocation="123", cit...: actual=${actual}`);
      expect(actual).assertEqual('123');
      logInfo(`${BUNDLE}LocationTextOf_0159 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0160
     * @tc.name      Location_LocationTextOf_0160
     * @tc.desc      locationTextOf(currentLocation="123", city="abcabc") returns "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0160 begin`);
      const actual: string = locationTextOf('123', 'abcabc');
      logInfo(`locationTextOf(currentLocation="123", cit...: actual=${actual}`);
      expect(actual).assertEqual('123');
      logInfo(`${BUNDLE}LocationTextOf_0160 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0161
     * @tc.name      Location_LocationTextOf_0161
     * @tc.desc      locationTextOf(currentLocation="123", city="abc_1") returns "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0161 begin`);
      const actual: string = locationTextOf('123', 'abc_1');
      logInfo(`locationTextOf(currentLocation="123", cit...: actual=${actual}`);
      expect(actual).assertEqual('123');
      logInfo(`${BUNDLE}LocationTextOf_0161 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0162
     * @tc.name      Location_LocationTextOf_0162
     * @tc.desc      locationTextOf(currentLocation="123", city="xabc") returns "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0162 begin`);
      const actual: string = locationTextOf('123', 'xabc');
      logInfo(`locationTextOf(currentLocation="123", cit...: actual=${actual}`);
      expect(actual).assertEqual('123');
      logInfo(`${BUNDLE}LocationTextOf_0162 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0163
     * @tc.name      Location_LocationTextOf_0163
     * @tc.desc      locationTextOf(currentLocation="123", city=" Hello World ") returns "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0163 begin`);
      const actual: string = locationTextOf('123', ' Hello World ');
      logInfo(`locationTextOf(currentLocation="123", cit...: actual=${actual}`);
      expect(actual).assertEqual('123');
      logInfo(`${BUNDLE}LocationTextOf_0163 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0164
     * @tc.name      Location_LocationTextOf_0164
     * @tc.desc      locationTextOf(currentLocation="123", city="Hello WorldHello World") returns "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0164 begin`);
      const actual: string = locationTextOf('123', 'Hello WorldHello World');
      logInfo(`locationTextOf(currentLocation="123", cit...: actual=${actual}`);
      expect(actual).assertEqual('123');
      logInfo(`${BUNDLE}LocationTextOf_0164 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0165
     * @tc.name      Location_LocationTextOf_0165
     * @tc.desc      locationTextOf(currentLocation="123", city="Hello World_1") returns "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0165 begin`);
      const actual: string = locationTextOf('123', 'Hello World_1');
      logInfo(`locationTextOf(currentLocation="123", cit...: actual=${actual}`);
      expect(actual).assertEqual('123');
      logInfo(`${BUNDLE}LocationTextOf_0165 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0166
     * @tc.name      Location_LocationTextOf_0166
     * @tc.desc      locationTextOf(currentLocation="123", city="xHello World") returns "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0166 begin`);
      const actual: string = locationTextOf('123', 'xHello World');
      logInfo(`locationTextOf(currentLocation="123", cit...: actual=${actual}`);
      expect(actual).assertEqual('123');
      logInfo(`${BUNDLE}LocationTextOf_0166 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0167
     * @tc.name      Location_LocationTextOf_0167
     * @tc.desc      locationTextOf(currentLocation="123", city="   ") returns "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0167 begin`);
      const actual: string = locationTextOf('123', '   ');
      logInfo(`locationTextOf(currentLocation="123", cit...: actual=${actual}`);
      expect(actual).assertEqual('123');
      logInfo(`${BUNDLE}LocationTextOf_0167 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0168
     * @tc.name      Location_LocationTextOf_0168
     * @tc.desc      locationTextOf(currentLocation="123", city="  ") returns "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0168 begin`);
      const actual: string = locationTextOf('123', '  ');
      logInfo(`locationTextOf(currentLocation="123", cit...: actual=${actual}`);
      expect(actual).assertEqual('123');
      logInfo(`${BUNDLE}LocationTextOf_0168 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0169
     * @tc.name      Location_LocationTextOf_0169
     * @tc.desc      locationTextOf(currentLocation=" x ", city="") returns " x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0169 begin`);
      const actual: string = locationTextOf(' x ', '');
      logInfo(`locationTextOf(currentLocation=" x ", cit...: actual=${actual}`);
      expect(actual).assertEqual(' x ');
      logInfo(`${BUNDLE}LocationTextOf_0169 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0170
     * @tc.name      Location_LocationTextOf_0170
     * @tc.desc      locationTextOf(currentLocation=" x ", city="x") returns " x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0170 begin`);
      const actual: string = locationTextOf(' x ', 'x');
      logInfo(`locationTextOf(currentLocation=" x ", cit...: actual=${actual}`);
      expect(actual).assertEqual(' x ');
      logInfo(`${BUNDLE}LocationTextOf_0170 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0171
     * @tc.name      Location_LocationTextOf_0171
     * @tc.desc      locationTextOf(currentLocation=" x ", city="a") returns " x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0171 begin`);
      const actual: string = locationTextOf(' x ', 'a');
      logInfo(`locationTextOf(currentLocation=" x ", cit...: actual=${actual}`);
      expect(actual).assertEqual(' x ');
      logInfo(`${BUNDLE}LocationTextOf_0171 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0172
     * @tc.name      Location_LocationTextOf_0172
     * @tc.desc      locationTextOf(currentLocation=" x ", city="abc") returns " x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0172 begin`);
      const actual: string = locationTextOf(' x ', 'abc');
      logInfo(`locationTextOf(currentLocation=" x ", cit...: actual=${actual}`);
      expect(actual).assertEqual(' x ');
      logInfo(`${BUNDLE}LocationTextOf_0172 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0173
     * @tc.name      Location_LocationTextOf_0173
     * @tc.desc      locationTextOf(currentLocation=" x ", city="Hello World") returns " x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0173 begin`);
      const actual: string = locationTextOf(' x ', 'Hello World');
      logInfo(`locationTextOf(currentLocation=" x ", cit...: actual=${actual}`);
      expect(actual).assertEqual(' x ');
      logInfo(`${BUNDLE}LocationTextOf_0173 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0174
     * @tc.name      Location_LocationTextOf_0174
     * @tc.desc      locationTextOf(currentLocation=" x ", city=" ") returns " x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0174 begin`);
      const actual: string = locationTextOf(' x ', ' ');
      logInfo(`locationTextOf(currentLocation=" x ", cit...: actual=${actual}`);
      expect(actual).assertEqual(' x ');
      logInfo(`${BUNDLE}LocationTextOf_0174 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0175
     * @tc.name      Location_LocationTextOf_0175
     * @tc.desc      locationTextOf(currentLocation=" x ", city="123") returns " x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0175 begin`);
      const actual: string = locationTextOf(' x ', '123');
      logInfo(`locationTextOf(currentLocation=" x ", cit...: actual=${actual}`);
      expect(actual).assertEqual(' x ');
      logInfo(`${BUNDLE}LocationTextOf_0175 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0176
     * @tc.name      Location_LocationTextOf_0176
     * @tc.desc      locationTextOf(currentLocation=" x ", city=" x ") returns " x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0176 begin`);
      const actual: string = locationTextOf(' x ', ' x ');
      logInfo(`locationTextOf(currentLocation=" x ", cit...: actual=${actual}`);
      expect(actual).assertEqual(' x ');
      logInfo(`${BUNDLE}LocationTextOf_0176 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0177
     * @tc.name      Location_LocationTextOf_0177
     * @tc.desc      locationTextOf(currentLocation=" x ", city="xx") returns " x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0177 begin`);
      const actual: string = locationTextOf(' x ', 'xx');
      logInfo(`locationTextOf(currentLocation=" x ", cit...: actual=${actual}`);
      expect(actual).assertEqual(' x ');
      logInfo(`${BUNDLE}LocationTextOf_0177 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0178
     * @tc.name      Location_LocationTextOf_0178
     * @tc.desc      locationTextOf(currentLocation=" x ", city="x_1") returns " x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0178 begin`);
      const actual: string = locationTextOf(' x ', 'x_1');
      logInfo(`locationTextOf(currentLocation=" x ", cit...: actual=${actual}`);
      expect(actual).assertEqual(' x ');
      logInfo(`${BUNDLE}LocationTextOf_0178 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0179
     * @tc.name      Location_LocationTextOf_0179
     * @tc.desc      locationTextOf(currentLocation=" x ", city=" a ") returns " x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0179 begin`);
      const actual: string = locationTextOf(' x ', ' a ');
      logInfo(`locationTextOf(currentLocation=" x ", cit...: actual=${actual}`);
      expect(actual).assertEqual(' x ');
      logInfo(`${BUNDLE}LocationTextOf_0179 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0180
     * @tc.name      Location_LocationTextOf_0180
     * @tc.desc      locationTextOf(currentLocation=" x ", city="aa") returns " x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0180 begin`);
      const actual: string = locationTextOf(' x ', 'aa');
      logInfo(`locationTextOf(currentLocation=" x ", cit...: actual=${actual}`);
      expect(actual).assertEqual(' x ');
      logInfo(`${BUNDLE}LocationTextOf_0180 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0181
     * @tc.name      Location_LocationTextOf_0181
     * @tc.desc      locationTextOf(currentLocation=" x ", city="a_1") returns " x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0181 begin`);
      const actual: string = locationTextOf(' x ', 'a_1');
      logInfo(`locationTextOf(currentLocation=" x ", cit...: actual=${actual}`);
      expect(actual).assertEqual(' x ');
      logInfo(`${BUNDLE}LocationTextOf_0181 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0182
     * @tc.name      Location_LocationTextOf_0182
     * @tc.desc      locationTextOf(currentLocation=" x ", city="xa") returns " x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0182 begin`);
      const actual: string = locationTextOf(' x ', 'xa');
      logInfo(`locationTextOf(currentLocation=" x ", cit...: actual=${actual}`);
      expect(actual).assertEqual(' x ');
      logInfo(`${BUNDLE}LocationTextOf_0182 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0183
     * @tc.name      Location_LocationTextOf_0183
     * @tc.desc      locationTextOf(currentLocation=" x ", city=" abc ") returns " x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0183 begin`);
      const actual: string = locationTextOf(' x ', ' abc ');
      logInfo(`locationTextOf(currentLocation=" x ", cit...: actual=${actual}`);
      expect(actual).assertEqual(' x ');
      logInfo(`${BUNDLE}LocationTextOf_0183 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0184
     * @tc.name      Location_LocationTextOf_0184
     * @tc.desc      locationTextOf(currentLocation=" x ", city="abcabc") returns " x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0184 begin`);
      const actual: string = locationTextOf(' x ', 'abcabc');
      logInfo(`locationTextOf(currentLocation=" x ", cit...: actual=${actual}`);
      expect(actual).assertEqual(' x ');
      logInfo(`${BUNDLE}LocationTextOf_0184 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0185
     * @tc.name      Location_LocationTextOf_0185
     * @tc.desc      locationTextOf(currentLocation=" x ", city="abc_1") returns " x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0185 begin`);
      const actual: string = locationTextOf(' x ', 'abc_1');
      logInfo(`locationTextOf(currentLocation=" x ", cit...: actual=${actual}`);
      expect(actual).assertEqual(' x ');
      logInfo(`${BUNDLE}LocationTextOf_0185 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0186
     * @tc.name      Location_LocationTextOf_0186
     * @tc.desc      locationTextOf(currentLocation=" x ", city="xabc") returns " x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0186 begin`);
      const actual: string = locationTextOf(' x ', 'xabc');
      logInfo(`locationTextOf(currentLocation=" x ", cit...: actual=${actual}`);
      expect(actual).assertEqual(' x ');
      logInfo(`${BUNDLE}LocationTextOf_0186 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0187
     * @tc.name      Location_LocationTextOf_0187
     * @tc.desc      locationTextOf(currentLocation=" x ", city=" Hello World ") returns " x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0187 begin`);
      const actual: string = locationTextOf(' x ', ' Hello World ');
      logInfo(`locationTextOf(currentLocation=" x ", cit...: actual=${actual}`);
      expect(actual).assertEqual(' x ');
      logInfo(`${BUNDLE}LocationTextOf_0187 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0188
     * @tc.name      Location_LocationTextOf_0188
     * @tc.desc      locationTextOf(currentLocation=" x ", city="Hello WorldHello World") returns " x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0188 begin`);
      const actual: string = locationTextOf(' x ', 'Hello WorldHello World');
      logInfo(`locationTextOf(currentLocation=" x ", cit...: actual=${actual}`);
      expect(actual).assertEqual(' x ');
      logInfo(`${BUNDLE}LocationTextOf_0188 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0189
     * @tc.name      Location_LocationTextOf_0189
     * @tc.desc      locationTextOf(currentLocation=" x ", city="Hello World_1") returns " x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0189 begin`);
      const actual: string = locationTextOf(' x ', 'Hello World_1');
      logInfo(`locationTextOf(currentLocation=" x ", cit...: actual=${actual}`);
      expect(actual).assertEqual(' x ');
      logInfo(`${BUNDLE}LocationTextOf_0189 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0190
     * @tc.name      Location_LocationTextOf_0190
     * @tc.desc      locationTextOf(currentLocation=" x ", city="xHello World") returns " x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0190 begin`);
      const actual: string = locationTextOf(' x ', 'xHello World');
      logInfo(`locationTextOf(currentLocation=" x ", cit...: actual=${actual}`);
      expect(actual).assertEqual(' x ');
      logInfo(`${BUNDLE}LocationTextOf_0190 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0191
     * @tc.name      Location_LocationTextOf_0191
     * @tc.desc      locationTextOf(currentLocation=" x ", city="   ") returns " x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0191 begin`);
      const actual: string = locationTextOf(' x ', '   ');
      logInfo(`locationTextOf(currentLocation=" x ", cit...: actual=${actual}`);
      expect(actual).assertEqual(' x ');
      logInfo(`${BUNDLE}LocationTextOf_0191 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0192
     * @tc.name      Location_LocationTextOf_0192
     * @tc.desc      locationTextOf(currentLocation=" x ", city="  ") returns " x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0192 begin`);
      const actual: string = locationTextOf(' x ', '  ');
      logInfo(`locationTextOf(currentLocation=" x ", cit...: actual=${actual}`);
      expect(actual).assertEqual(' x ');
      logInfo(`${BUNDLE}LocationTextOf_0192 end`);
    });
  });
}
