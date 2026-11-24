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
import { localityOf } from '../model/CityPickerLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Location]';
const BUNDLE: string = 'Location_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for localityOf (96 cases). */
export default function localityOf2Test(): void {
  describe('LocalityOf2Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0097
     * @tc.name      Location_LocalityOf_0097
     * @tc.desc      localityOf(localities=["a", "a"], previous="") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_LocalityOf_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}LocalityOf_0097 begin`);
      const actual: string = localityOf(['a', 'a'], '');
      logInfo(`localityOf(localities=["a", "a"], previou...: actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}LocalityOf_0097 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0098
     * @tc.name      Location_LocalityOf_0098
     * @tc.desc      localityOf(localities=["a", "a"], previous="x") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocalityOf_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocalityOf_0098 begin`);
      const actual: string = localityOf(['a', 'a'], 'x');
      logInfo(`localityOf(localities=["a", "a"], previou...: actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}LocalityOf_0098 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0099
     * @tc.name      Location_LocalityOf_0099
     * @tc.desc      localityOf(localities=["a", "a"], previous="a") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0099 begin`);
      const actual: string = localityOf(['a', 'a'], 'a');
      logInfo(`localityOf(localities=["a", "a"], previou...: actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}LocalityOf_0099 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0100
     * @tc.name      Location_LocalityOf_0100
     * @tc.desc      localityOf(localities=["a", "a"], previous="abc") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0100 begin`);
      const actual: string = localityOf(['a', 'a'], 'abc');
      logInfo(`localityOf(localities=["a", "a"], previou...: actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}LocalityOf_0100 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0101
     * @tc.name      Location_LocalityOf_0101
     * @tc.desc      localityOf(localities=["a", "a"], previous="Hello World") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0101 begin`);
      const actual: string = localityOf(['a', 'a'], 'Hello World');
      logInfo(`localityOf(localities=["a", "a"], previou...: actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}LocalityOf_0101 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0102
     * @tc.name      Location_LocalityOf_0102
     * @tc.desc      localityOf(localities=["a", "a"], previous=" ") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0102 begin`);
      const actual: string = localityOf(['a', 'a'], ' ');
      logInfo(`localityOf(localities=["a", "a"], previou...: actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}LocalityOf_0102 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0103
     * @tc.name      Location_LocalityOf_0103
     * @tc.desc      localityOf(localities=["a", "a"], previous="123") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0103 begin`);
      const actual: string = localityOf(['a', 'a'], '123');
      logInfo(`localityOf(localities=["a", "a"], previou...: actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}LocalityOf_0103 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0104
     * @tc.name      Location_LocalityOf_0104
     * @tc.desc      localityOf(localities=["a", "a"], previous=" x ") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocalityOf_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocalityOf_0104 begin`);
      const actual: string = localityOf(['a', 'a'], ' x ');
      logInfo(`localityOf(localities=["a", "a"], previou...: actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}LocalityOf_0104 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0105
     * @tc.name      Location_LocalityOf_0105
     * @tc.desc      localityOf(localities=["a", "a"], previous="xx") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0105 begin`);
      const actual: string = localityOf(['a', 'a'], 'xx');
      logInfo(`localityOf(localities=["a", "a"], previou...: actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}LocalityOf_0105 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0106
     * @tc.name      Location_LocalityOf_0106
     * @tc.desc      localityOf(localities=["a", "a"], previous="x_1") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0106 begin`);
      const actual: string = localityOf(['a', 'a'], 'x_1');
      logInfo(`localityOf(localities=["a", "a"], previou...: actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}LocalityOf_0106 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0107
     * @tc.name      Location_LocalityOf_0107
     * @tc.desc      localityOf(localities=["a", "a"], previous=" a ") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocalityOf_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocalityOf_0107 begin`);
      const actual: string = localityOf(['a', 'a'], ' a ');
      logInfo(`localityOf(localities=["a", "a"], previou...: actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}LocalityOf_0107 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0108
     * @tc.name      Location_LocalityOf_0108
     * @tc.desc      localityOf(localities=["a", "a"], previous="aa") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0108 begin`);
      const actual: string = localityOf(['a', 'a'], 'aa');
      logInfo(`localityOf(localities=["a", "a"], previou...: actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}LocalityOf_0108 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0109
     * @tc.name      Location_LocalityOf_0109
     * @tc.desc      localityOf(localities=["a", "a"], previous="a_1") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0109 begin`);
      const actual: string = localityOf(['a', 'a'], 'a_1');
      logInfo(`localityOf(localities=["a", "a"], previou...: actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}LocalityOf_0109 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0110
     * @tc.name      Location_LocalityOf_0110
     * @tc.desc      localityOf(localities=["a", "a"], previous="xa") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocalityOf_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocalityOf_0110 begin`);
      const actual: string = localityOf(['a', 'a'], 'xa');
      logInfo(`localityOf(localities=["a", "a"], previou...: actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}LocalityOf_0110 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0111
     * @tc.name      Location_LocalityOf_0111
     * @tc.desc      localityOf(localities=["a", "a"], previous=" abc ") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocalityOf_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocalityOf_0111 begin`);
      const actual: string = localityOf(['a', 'a'], ' abc ');
      logInfo(`localityOf(localities=["a", "a"], previou...: actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}LocalityOf_0111 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0112
     * @tc.name      Location_LocalityOf_0112
     * @tc.desc      localityOf(localities=["a", "a"], previous="abcabc") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0112 begin`);
      const actual: string = localityOf(['a', 'a'], 'abcabc');
      logInfo(`localityOf(localities=["a", "a"], previou...: actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}LocalityOf_0112 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0113
     * @tc.name      Location_LocalityOf_0113
     * @tc.desc      localityOf(localities=["a", "a"], previous="abc_1") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0113 begin`);
      const actual: string = localityOf(['a', 'a'], 'abc_1');
      logInfo(`localityOf(localities=["a", "a"], previou...: actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}LocalityOf_0113 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0114
     * @tc.name      Location_LocalityOf_0114
     * @tc.desc      localityOf(localities=["a", "a"], previous="xabc") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocalityOf_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocalityOf_0114 begin`);
      const actual: string = localityOf(['a', 'a'], 'xabc');
      logInfo(`localityOf(localities=["a", "a"], previou...: actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}LocalityOf_0114 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0115
     * @tc.name      Location_LocalityOf_0115
     * @tc.desc      localityOf(localities=["a", "a"], previous=" Hello World ") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocalityOf_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocalityOf_0115 begin`);
      const actual: string = localityOf(['a', 'a'], ' Hello World ');
      logInfo(`localityOf(localities=["a", "a"], previou...: actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}LocalityOf_0115 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0116
     * @tc.name      Location_LocalityOf_0116
     * @tc.desc      localityOf(localities=["a", "a"], previous="Hello WorldHello World") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0116 begin`);
      const actual: string = localityOf(['a', 'a'], 'Hello WorldHello World');
      logInfo(`localityOf(localities=["a", "a"], previou...: actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}LocalityOf_0116 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0117
     * @tc.name      Location_LocalityOf_0117
     * @tc.desc      localityOf(localities=["a", "a"], previous="Hello World_1") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0117 begin`);
      const actual: string = localityOf(['a', 'a'], 'Hello World_1');
      logInfo(`localityOf(localities=["a", "a"], previou...: actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}LocalityOf_0117 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0118
     * @tc.name      Location_LocalityOf_0118
     * @tc.desc      localityOf(localities=["a", "a"], previous="xHello World") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocalityOf_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocalityOf_0118 begin`);
      const actual: string = localityOf(['a', 'a'], 'xHello World');
      logInfo(`localityOf(localities=["a", "a"], previou...: actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}LocalityOf_0118 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0119
     * @tc.name      Location_LocalityOf_0119
     * @tc.desc      localityOf(localities=["a", "a"], previous="   ") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocalityOf_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocalityOf_0119 begin`);
      const actual: string = localityOf(['a', 'a'], '   ');
      logInfo(`localityOf(localities=["a", "a"], previou...: actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}LocalityOf_0119 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0120
     * @tc.name      Location_LocalityOf_0120
     * @tc.desc      localityOf(localities=["a", "a"], previous="  ") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0120 begin`);
      const actual: string = localityOf(['a', 'a'], '  ');
      logInfo(`localityOf(localities=["a", "a"], previou...: actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}LocalityOf_0120 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0121
     * @tc.name      Location_LocalityOf_0121
     * @tc.desc      localityOf(localities=["", "x", "a", "abc", "Hello World"], previous="") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_LocalityOf_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}LocalityOf_0121 begin`);
      const actual: string = localityOf(['', 'x', 'a', 'abc', 'Hello World'], '');
      logInfo(`localityOf(localities=["", "x", "a", "abc...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LocalityOf_0121 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0122
     * @tc.name      Location_LocalityOf_0122
     * @tc.desc      localityOf(localities=["", "x", "a", "abc", "Hello World"], previous="x") returns "x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocalityOf_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocalityOf_0122 begin`);
      const actual: string = localityOf(['', 'x', 'a', 'abc', 'Hello World'], 'x');
      logInfo(`localityOf(localities=["", "x", "a", "abc...: actual=${actual}`);
      expect(actual).assertEqual('x');
      logInfo(`${BUNDLE}LocalityOf_0122 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0123
     * @tc.name      Location_LocalityOf_0123
     * @tc.desc      localityOf(localities=["", "x", "a", "abc", "Hello World"], previous="a") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0123 begin`);
      const actual: string = localityOf(['', 'x', 'a', 'abc', 'Hello World'], 'a');
      logInfo(`localityOf(localities=["", "x", "a", "abc...: actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}LocalityOf_0123 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0124
     * @tc.name      Location_LocalityOf_0124
     * @tc.desc      localityOf(localities=["", "x", "a", "abc", "Hello World"], previous="abc") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0124 begin`);
      const actual: string = localityOf(['', 'x', 'a', 'abc', 'Hello World'], 'abc');
      logInfo(`localityOf(localities=["", "x", "a", "abc...: actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}LocalityOf_0124 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0125
     * @tc.name      Location_LocalityOf_0125
     * @tc.desc      localityOf(localities=["", "x", "a", "abc", "Hello World"], previous="Hello World") returns "Hel...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0125 begin`);
      const actual: string = localityOf(['', 'x', 'a', 'abc', 'Hello World'], 'Hello World');
      logInfo(`localityOf(localities=["", "x", "a", "abc...: actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}LocalityOf_0125 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0126
     * @tc.name      Location_LocalityOf_0126
     * @tc.desc      localityOf(localities=["", "x", "a", "abc", "Hello World"], previous=" ") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0126 begin`);
      const actual: string = localityOf(['', 'x', 'a', 'abc', 'Hello World'], ' ');
      logInfo(`localityOf(localities=["", "x", "a", "abc...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}LocalityOf_0126 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0127
     * @tc.name      Location_LocalityOf_0127
     * @tc.desc      localityOf(localities=["", "x", "a", "abc", "Hello World"], previous="123") returns "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0127 begin`);
      const actual: string = localityOf(['', 'x', 'a', 'abc', 'Hello World'], '123');
      logInfo(`localityOf(localities=["", "x", "a", "abc...: actual=${actual}`);
      expect(actual).assertEqual('123');
      logInfo(`${BUNDLE}LocalityOf_0127 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0128
     * @tc.name      Location_LocalityOf_0128
     * @tc.desc      localityOf(localities=["", "x", "a", "abc", "Hello World"], previous=" x ") returns " x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocalityOf_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocalityOf_0128 begin`);
      const actual: string = localityOf(['', 'x', 'a', 'abc', 'Hello World'], ' x ');
      logInfo(`localityOf(localities=["", "x", "a", "abc...: actual=${actual}`);
      expect(actual).assertEqual(' x ');
      logInfo(`${BUNDLE}LocalityOf_0128 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0129
     * @tc.name      Location_LocalityOf_0129
     * @tc.desc      localityOf(localities=["", "x", "a", "abc", "Hello World"], previous="xx") returns "xx"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0129 begin`);
      const actual: string = localityOf(['', 'x', 'a', 'abc', 'Hello World'], 'xx');
      logInfo(`localityOf(localities=["", "x", "a", "abc...: actual=${actual}`);
      expect(actual).assertEqual('xx');
      logInfo(`${BUNDLE}LocalityOf_0129 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0130
     * @tc.name      Location_LocalityOf_0130
     * @tc.desc      localityOf(localities=["", "x", "a", "abc", "Hello World"], previous="x_1") returns "x_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0130 begin`);
      const actual: string = localityOf(['', 'x', 'a', 'abc', 'Hello World'], 'x_1');
      logInfo(`localityOf(localities=["", "x", "a", "abc...: actual=${actual}`);
      expect(actual).assertEqual('x_1');
      logInfo(`${BUNDLE}LocalityOf_0130 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0131
     * @tc.name      Location_LocalityOf_0131
     * @tc.desc      localityOf(localities=["", "x", "a", "abc", "Hello World"], previous=" a ") returns " a "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocalityOf_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocalityOf_0131 begin`);
      const actual: string = localityOf(['', 'x', 'a', 'abc', 'Hello World'], ' a ');
      logInfo(`localityOf(localities=["", "x", "a", "abc...: actual=${actual}`);
      expect(actual).assertEqual(' a ');
      logInfo(`${BUNDLE}LocalityOf_0131 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0132
     * @tc.name      Location_LocalityOf_0132
     * @tc.desc      localityOf(localities=["", "x", "a", "abc", "Hello World"], previous="aa") returns "aa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0132 begin`);
      const actual: string = localityOf(['', 'x', 'a', 'abc', 'Hello World'], 'aa');
      logInfo(`localityOf(localities=["", "x", "a", "abc...: actual=${actual}`);
      expect(actual).assertEqual('aa');
      logInfo(`${BUNDLE}LocalityOf_0132 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0133
     * @tc.name      Location_LocalityOf_0133
     * @tc.desc      localityOf(localities=["", "x", "a", "abc", "Hello World"], previous="a_1") returns "a_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0133 begin`);
      const actual: string = localityOf(['', 'x', 'a', 'abc', 'Hello World'], 'a_1');
      logInfo(`localityOf(localities=["", "x", "a", "abc...: actual=${actual}`);
      expect(actual).assertEqual('a_1');
      logInfo(`${BUNDLE}LocalityOf_0133 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0134
     * @tc.name      Location_LocalityOf_0134
     * @tc.desc      localityOf(localities=["", "x", "a", "abc", "Hello World"], previous="xa") returns "xa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocalityOf_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocalityOf_0134 begin`);
      const actual: string = localityOf(['', 'x', 'a', 'abc', 'Hello World'], 'xa');
      logInfo(`localityOf(localities=["", "x", "a", "abc...: actual=${actual}`);
      expect(actual).assertEqual('xa');
      logInfo(`${BUNDLE}LocalityOf_0134 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0135
     * @tc.name      Location_LocalityOf_0135
     * @tc.desc      localityOf(localities=["", "x", "a", "abc", "Hello World"], previous=" abc ") returns " abc "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocalityOf_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocalityOf_0135 begin`);
      const actual: string = localityOf(['', 'x', 'a', 'abc', 'Hello World'], ' abc ');
      logInfo(`localityOf(localities=["", "x", "a", "abc...: actual=${actual}`);
      expect(actual).assertEqual(' abc ');
      logInfo(`${BUNDLE}LocalityOf_0135 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0136
     * @tc.name      Location_LocalityOf_0136
     * @tc.desc      localityOf(localities=["", "x", "a", "abc", "Hello World"], previous="abcabc") returns "abcabc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0136 begin`);
      const actual: string = localityOf(['', 'x', 'a', 'abc', 'Hello World'], 'abcabc');
      logInfo(`localityOf(localities=["", "x", "a", "abc...: actual=${actual}`);
      expect(actual).assertEqual('abcabc');
      logInfo(`${BUNDLE}LocalityOf_0136 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0137
     * @tc.name      Location_LocalityOf_0137
     * @tc.desc      localityOf(localities=["", "x", "a", "abc", "Hello World"], previous="abc_1") returns "abc_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0137 begin`);
      const actual: string = localityOf(['', 'x', 'a', 'abc', 'Hello World'], 'abc_1');
      logInfo(`localityOf(localities=["", "x", "a", "abc...: actual=${actual}`);
      expect(actual).assertEqual('abc_1');
      logInfo(`${BUNDLE}LocalityOf_0137 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0138
     * @tc.name      Location_LocalityOf_0138
     * @tc.desc      localityOf(localities=["", "x", "a", "abc", "Hello World"], previous="xabc") returns "xabc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocalityOf_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocalityOf_0138 begin`);
      const actual: string = localityOf(['', 'x', 'a', 'abc', 'Hello World'], 'xabc');
      logInfo(`localityOf(localities=["", "x", "a", "abc...: actual=${actual}`);
      expect(actual).assertEqual('xabc');
      logInfo(`${BUNDLE}LocalityOf_0138 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0139
     * @tc.name      Location_LocalityOf_0139
     * @tc.desc      localityOf(localities=["", "x", "a", "abc", "Hello World"], previous=" Hello World ") returns " ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocalityOf_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocalityOf_0139 begin`);
      const actual: string = localityOf(['', 'x', 'a', 'abc', 'Hello World'], ' Hello World ');
      logInfo(`localityOf(localities=["", "x", "a", "abc...: actual=${actual}`);
      expect(actual).assertEqual(' Hello World ');
      logInfo(`${BUNDLE}LocalityOf_0139 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0140
     * @tc.name      Location_LocalityOf_0140
     * @tc.desc      localityOf(localities=["", "x", "a", "abc", "Hello World"], previous="Hello WorldHello World") r...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0140 begin`);
      const actual: string = localityOf(['', 'x', 'a', 'abc', 'Hello World'], 'Hello WorldHello World');
      logInfo(`localityOf(localities=["", "x", "a", "abc...: actual=${actual}`);
      expect(actual).assertEqual('Hello WorldHello World');
      logInfo(`${BUNDLE}LocalityOf_0140 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0141
     * @tc.name      Location_LocalityOf_0141
     * @tc.desc      localityOf(localities=["", "x", "a", "abc", "Hello World"], previous="Hello World_1") returns "H...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0141 begin`);
      const actual: string = localityOf(['', 'x', 'a', 'abc', 'Hello World'], 'Hello World_1');
      logInfo(`localityOf(localities=["", "x", "a", "abc...: actual=${actual}`);
      expect(actual).assertEqual('Hello World_1');
      logInfo(`${BUNDLE}LocalityOf_0141 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0142
     * @tc.name      Location_LocalityOf_0142
     * @tc.desc      localityOf(localities=["", "x", "a", "abc", "Hello World"], previous="xHello World") returns "xH...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocalityOf_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocalityOf_0142 begin`);
      const actual: string = localityOf(['', 'x', 'a', 'abc', 'Hello World'], 'xHello World');
      logInfo(`localityOf(localities=["", "x", "a", "abc...: actual=${actual}`);
      expect(actual).assertEqual('xHello World');
      logInfo(`${BUNDLE}LocalityOf_0142 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0143
     * @tc.name      Location_LocalityOf_0143
     * @tc.desc      localityOf(localities=["", "x", "a", "abc", "Hello World"], previous="   ") returns "   "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocalityOf_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocalityOf_0143 begin`);
      const actual: string = localityOf(['', 'x', 'a', 'abc', 'Hello World'], '   ');
      logInfo(`localityOf(localities=["", "x", "a", "abc...: actual=${actual}`);
      expect(actual).assertEqual('   ');
      logInfo(`${BUNDLE}LocalityOf_0143 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0144
     * @tc.name      Location_LocalityOf_0144
     * @tc.desc      localityOf(localities=["", "x", "a", "abc", "Hello World"], previous="  ") returns "  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0144 begin`);
      const actual: string = localityOf(['', 'x', 'a', 'abc', 'Hello World'], '  ');
      logInfo(`localityOf(localities=["", "x", "a", "abc...: actual=${actual}`);
      expect(actual).assertEqual('  ');
      logInfo(`${BUNDLE}LocalityOf_0144 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0145
     * @tc.name      Location_LocalityOf_0145
     * @tc.desc      localityOf(localities=["abc", "x", "Hello World", "x", " "], previous="") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_LocalityOf_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}LocalityOf_0145 begin`);
      const actual: string = localityOf(['abc', 'x', 'Hello World', 'x', ' '], '');
      logInfo(`localityOf(localities=["abc", "x", "Hello...: actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}LocalityOf_0145 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0146
     * @tc.name      Location_LocalityOf_0146
     * @tc.desc      localityOf(localities=["abc", "x", "Hello World", "x", " "], previous="x") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocalityOf_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocalityOf_0146 begin`);
      const actual: string = localityOf(['abc', 'x', 'Hello World', 'x', ' '], 'x');
      logInfo(`localityOf(localities=["abc", "x", "Hello...: actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}LocalityOf_0146 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0147
     * @tc.name      Location_LocalityOf_0147
     * @tc.desc      localityOf(localities=["abc", "x", "Hello World", "x", " "], previous="a") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0147 begin`);
      const actual: string = localityOf(['abc', 'x', 'Hello World', 'x', ' '], 'a');
      logInfo(`localityOf(localities=["abc", "x", "Hello...: actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}LocalityOf_0147 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0148
     * @tc.name      Location_LocalityOf_0148
     * @tc.desc      localityOf(localities=["abc", "x", "Hello World", "x", " "], previous="abc") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0148 begin`);
      const actual: string = localityOf(['abc', 'x', 'Hello World', 'x', ' '], 'abc');
      logInfo(`localityOf(localities=["abc", "x", "Hello...: actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}LocalityOf_0148 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0149
     * @tc.name      Location_LocalityOf_0149
     * @tc.desc      localityOf(localities=["abc", "x", "Hello World", "x", " "], previous="Hello World") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0149 begin`);
      const actual: string = localityOf(['abc', 'x', 'Hello World', 'x', ' '], 'Hello World');
      logInfo(`localityOf(localities=["abc", "x", "Hello...: actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}LocalityOf_0149 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0150
     * @tc.name      Location_LocalityOf_0150
     * @tc.desc      localityOf(localities=["abc", "x", "Hello World", "x", " "], previous=" ") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0150 begin`);
      const actual: string = localityOf(['abc', 'x', 'Hello World', 'x', ' '], ' ');
      logInfo(`localityOf(localities=["abc", "x", "Hello...: actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}LocalityOf_0150 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0151
     * @tc.name      Location_LocalityOf_0151
     * @tc.desc      localityOf(localities=["abc", "x", "Hello World", "x", " "], previous="123") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0151 begin`);
      const actual: string = localityOf(['abc', 'x', 'Hello World', 'x', ' '], '123');
      logInfo(`localityOf(localities=["abc", "x", "Hello...: actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}LocalityOf_0151 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0152
     * @tc.name      Location_LocalityOf_0152
     * @tc.desc      localityOf(localities=["abc", "x", "Hello World", "x", " "], previous=" x ") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocalityOf_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocalityOf_0152 begin`);
      const actual: string = localityOf(['abc', 'x', 'Hello World', 'x', ' '], ' x ');
      logInfo(`localityOf(localities=["abc", "x", "Hello...: actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}LocalityOf_0152 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0153
     * @tc.name      Location_LocalityOf_0153
     * @tc.desc      localityOf(localities=["abc", "x", "Hello World", "x", " "], previous="xx") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0153 begin`);
      const actual: string = localityOf(['abc', 'x', 'Hello World', 'x', ' '], 'xx');
      logInfo(`localityOf(localities=["abc", "x", "Hello...: actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}LocalityOf_0153 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0154
     * @tc.name      Location_LocalityOf_0154
     * @tc.desc      localityOf(localities=["abc", "x", "Hello World", "x", " "], previous="x_1") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0154 begin`);
      const actual: string = localityOf(['abc', 'x', 'Hello World', 'x', ' '], 'x_1');
      logInfo(`localityOf(localities=["abc", "x", "Hello...: actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}LocalityOf_0154 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0155
     * @tc.name      Location_LocalityOf_0155
     * @tc.desc      localityOf(localities=["abc", "x", "Hello World", "x", " "], previous=" a ") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocalityOf_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocalityOf_0155 begin`);
      const actual: string = localityOf(['abc', 'x', 'Hello World', 'x', ' '], ' a ');
      logInfo(`localityOf(localities=["abc", "x", "Hello...: actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}LocalityOf_0155 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0156
     * @tc.name      Location_LocalityOf_0156
     * @tc.desc      localityOf(localities=["abc", "x", "Hello World", "x", " "], previous="aa") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0156 begin`);
      const actual: string = localityOf(['abc', 'x', 'Hello World', 'x', ' '], 'aa');
      logInfo(`localityOf(localities=["abc", "x", "Hello...: actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}LocalityOf_0156 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0157
     * @tc.name      Location_LocalityOf_0157
     * @tc.desc      localityOf(localities=["abc", "x", "Hello World", "x", " "], previous="a_1") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0157 begin`);
      const actual: string = localityOf(['abc', 'x', 'Hello World', 'x', ' '], 'a_1');
      logInfo(`localityOf(localities=["abc", "x", "Hello...: actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}LocalityOf_0157 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0158
     * @tc.name      Location_LocalityOf_0158
     * @tc.desc      localityOf(localities=["abc", "x", "Hello World", "x", " "], previous="xa") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocalityOf_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocalityOf_0158 begin`);
      const actual: string = localityOf(['abc', 'x', 'Hello World', 'x', ' '], 'xa');
      logInfo(`localityOf(localities=["abc", "x", "Hello...: actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}LocalityOf_0158 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0159
     * @tc.name      Location_LocalityOf_0159
     * @tc.desc      localityOf(localities=["abc", "x", "Hello World", "x", " "], previous=" abc ") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocalityOf_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocalityOf_0159 begin`);
      const actual: string = localityOf(['abc', 'x', 'Hello World', 'x', ' '], ' abc ');
      logInfo(`localityOf(localities=["abc", "x", "Hello...: actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}LocalityOf_0159 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0160
     * @tc.name      Location_LocalityOf_0160
     * @tc.desc      localityOf(localities=["abc", "x", "Hello World", "x", " "], previous="abcabc") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0160 begin`);
      const actual: string = localityOf(['abc', 'x', 'Hello World', 'x', ' '], 'abcabc');
      logInfo(`localityOf(localities=["abc", "x", "Hello...: actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}LocalityOf_0160 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0161
     * @tc.name      Location_LocalityOf_0161
     * @tc.desc      localityOf(localities=["abc", "x", "Hello World", "x", " "], previous="abc_1") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0161 begin`);
      const actual: string = localityOf(['abc', 'x', 'Hello World', 'x', ' '], 'abc_1');
      logInfo(`localityOf(localities=["abc", "x", "Hello...: actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}LocalityOf_0161 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0162
     * @tc.name      Location_LocalityOf_0162
     * @tc.desc      localityOf(localities=["abc", "x", "Hello World", "x", " "], previous="xabc") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocalityOf_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocalityOf_0162 begin`);
      const actual: string = localityOf(['abc', 'x', 'Hello World', 'x', ' '], 'xabc');
      logInfo(`localityOf(localities=["abc", "x", "Hello...: actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}LocalityOf_0162 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0163
     * @tc.name      Location_LocalityOf_0163
     * @tc.desc      localityOf(localities=["abc", "x", "Hello World", "x", " "], previous=" Hello World ") returns "...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocalityOf_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocalityOf_0163 begin`);
      const actual: string = localityOf(['abc', 'x', 'Hello World', 'x', ' '], ' Hello World ');
      logInfo(`localityOf(localities=["abc", "x", "Hello...: actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}LocalityOf_0163 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0164
     * @tc.name      Location_LocalityOf_0164
     * @tc.desc      localityOf(localities=["abc", "x", "Hello World", "x", " "], previous="Hello WorldHello World") ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0164 begin`);
      const actual: string = localityOf(['abc', 'x', 'Hello World', 'x', ' '], 'Hello WorldHello World');
      logInfo(`localityOf(localities=["abc", "x", "Hello...: actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}LocalityOf_0164 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0165
     * @tc.name      Location_LocalityOf_0165
     * @tc.desc      localityOf(localities=["abc", "x", "Hello World", "x", " "], previous="Hello World_1") returns "...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0165 begin`);
      const actual: string = localityOf(['abc', 'x', 'Hello World', 'x', ' '], 'Hello World_1');
      logInfo(`localityOf(localities=["abc", "x", "Hello...: actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}LocalityOf_0165 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0166
     * @tc.name      Location_LocalityOf_0166
     * @tc.desc      localityOf(localities=["abc", "x", "Hello World", "x", " "], previous="xHello World") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocalityOf_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocalityOf_0166 begin`);
      const actual: string = localityOf(['abc', 'x', 'Hello World', 'x', ' '], 'xHello World');
      logInfo(`localityOf(localities=["abc", "x", "Hello...: actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}LocalityOf_0166 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0167
     * @tc.name      Location_LocalityOf_0167
     * @tc.desc      localityOf(localities=["abc", "x", "Hello World", "x", " "], previous="   ") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocalityOf_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocalityOf_0167 begin`);
      const actual: string = localityOf(['abc', 'x', 'Hello World', 'x', ' '], '   ');
      logInfo(`localityOf(localities=["abc", "x", "Hello...: actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}LocalityOf_0167 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0168
     * @tc.name      Location_LocalityOf_0168
     * @tc.desc      localityOf(localities=["abc", "x", "Hello World", "x", " "], previous="  ") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0168 begin`);
      const actual: string = localityOf(['abc', 'x', 'Hello World', 'x', ' '], '  ');
      logInfo(`localityOf(localities=["abc", "x", "Hello...: actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}LocalityOf_0168 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0169
     * @tc.name      Location_LocalityOf_0169
     * @tc.desc      localityOf(localities=[" ", "Hello World", "abc", "a", "x", ""], previous="") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_LocalityOf_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}LocalityOf_0169 begin`);
      const actual: string = localityOf([' ', 'Hello World', 'abc', 'a', 'x', ''], '');
      logInfo(`localityOf(localities=[" ", "Hello World"...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}LocalityOf_0169 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0170
     * @tc.name      Location_LocalityOf_0170
     * @tc.desc      localityOf(localities=[" ", "Hello World", "abc", "a", "x", ""], previous="x") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocalityOf_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocalityOf_0170 begin`);
      const actual: string = localityOf([' ', 'Hello World', 'abc', 'a', 'x', ''], 'x');
      logInfo(`localityOf(localities=[" ", "Hello World"...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}LocalityOf_0170 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0171
     * @tc.name      Location_LocalityOf_0171
     * @tc.desc      localityOf(localities=[" ", "Hello World", "abc", "a", "x", ""], previous="a") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0171 begin`);
      const actual: string = localityOf([' ', 'Hello World', 'abc', 'a', 'x', ''], 'a');
      logInfo(`localityOf(localities=[" ", "Hello World"...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}LocalityOf_0171 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0172
     * @tc.name      Location_LocalityOf_0172
     * @tc.desc      localityOf(localities=[" ", "Hello World", "abc", "a", "x", ""], previous="abc") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0172 begin`);
      const actual: string = localityOf([' ', 'Hello World', 'abc', 'a', 'x', ''], 'abc');
      logInfo(`localityOf(localities=[" ", "Hello World"...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}LocalityOf_0172 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0173
     * @tc.name      Location_LocalityOf_0173
     * @tc.desc      localityOf(localities=[" ", "Hello World", "abc", "a", "x", ""], previous="Hello World") returns...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0173 begin`);
      const actual: string = localityOf([' ', 'Hello World', 'abc', 'a', 'x', ''], 'Hello World');
      logInfo(`localityOf(localities=[" ", "Hello World"...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}LocalityOf_0173 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0174
     * @tc.name      Location_LocalityOf_0174
     * @tc.desc      localityOf(localities=[" ", "Hello World", "abc", "a", "x", ""], previous=" ") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0174 begin`);
      const actual: string = localityOf([' ', 'Hello World', 'abc', 'a', 'x', ''], ' ');
      logInfo(`localityOf(localities=[" ", "Hello World"...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}LocalityOf_0174 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0175
     * @tc.name      Location_LocalityOf_0175
     * @tc.desc      localityOf(localities=[" ", "Hello World", "abc", "a", "x", ""], previous="123") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0175 begin`);
      const actual: string = localityOf([' ', 'Hello World', 'abc', 'a', 'x', ''], '123');
      logInfo(`localityOf(localities=[" ", "Hello World"...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}LocalityOf_0175 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0176
     * @tc.name      Location_LocalityOf_0176
     * @tc.desc      localityOf(localities=[" ", "Hello World", "abc", "a", "x", ""], previous=" x ") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocalityOf_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocalityOf_0176 begin`);
      const actual: string = localityOf([' ', 'Hello World', 'abc', 'a', 'x', ''], ' x ');
      logInfo(`localityOf(localities=[" ", "Hello World"...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}LocalityOf_0176 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0177
     * @tc.name      Location_LocalityOf_0177
     * @tc.desc      localityOf(localities=[" ", "Hello World", "abc", "a", "x", ""], previous="xx") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0177 begin`);
      const actual: string = localityOf([' ', 'Hello World', 'abc', 'a', 'x', ''], 'xx');
      logInfo(`localityOf(localities=[" ", "Hello World"...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}LocalityOf_0177 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0178
     * @tc.name      Location_LocalityOf_0178
     * @tc.desc      localityOf(localities=[" ", "Hello World", "abc", "a", "x", ""], previous="x_1") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0178 begin`);
      const actual: string = localityOf([' ', 'Hello World', 'abc', 'a', 'x', ''], 'x_1');
      logInfo(`localityOf(localities=[" ", "Hello World"...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}LocalityOf_0178 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0179
     * @tc.name      Location_LocalityOf_0179
     * @tc.desc      localityOf(localities=[" ", "Hello World", "abc", "a", "x", ""], previous=" a ") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocalityOf_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocalityOf_0179 begin`);
      const actual: string = localityOf([' ', 'Hello World', 'abc', 'a', 'x', ''], ' a ');
      logInfo(`localityOf(localities=[" ", "Hello World"...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}LocalityOf_0179 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0180
     * @tc.name      Location_LocalityOf_0180
     * @tc.desc      localityOf(localities=[" ", "Hello World", "abc", "a", "x", ""], previous="aa") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0180 begin`);
      const actual: string = localityOf([' ', 'Hello World', 'abc', 'a', 'x', ''], 'aa');
      logInfo(`localityOf(localities=[" ", "Hello World"...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}LocalityOf_0180 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0181
     * @tc.name      Location_LocalityOf_0181
     * @tc.desc      localityOf(localities=[" ", "Hello World", "abc", "a", "x", ""], previous="a_1") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0181 begin`);
      const actual: string = localityOf([' ', 'Hello World', 'abc', 'a', 'x', ''], 'a_1');
      logInfo(`localityOf(localities=[" ", "Hello World"...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}LocalityOf_0181 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0182
     * @tc.name      Location_LocalityOf_0182
     * @tc.desc      localityOf(localities=[" ", "Hello World", "abc", "a", "x", ""], previous="xa") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocalityOf_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocalityOf_0182 begin`);
      const actual: string = localityOf([' ', 'Hello World', 'abc', 'a', 'x', ''], 'xa');
      logInfo(`localityOf(localities=[" ", "Hello World"...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}LocalityOf_0182 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0183
     * @tc.name      Location_LocalityOf_0183
     * @tc.desc      localityOf(localities=[" ", "Hello World", "abc", "a", "x", ""], previous=" abc ") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocalityOf_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocalityOf_0183 begin`);
      const actual: string = localityOf([' ', 'Hello World', 'abc', 'a', 'x', ''], ' abc ');
      logInfo(`localityOf(localities=[" ", "Hello World"...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}LocalityOf_0183 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0184
     * @tc.name      Location_LocalityOf_0184
     * @tc.desc      localityOf(localities=[" ", "Hello World", "abc", "a", "x", ""], previous="abcabc") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0184 begin`);
      const actual: string = localityOf([' ', 'Hello World', 'abc', 'a', 'x', ''], 'abcabc');
      logInfo(`localityOf(localities=[" ", "Hello World"...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}LocalityOf_0184 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0185
     * @tc.name      Location_LocalityOf_0185
     * @tc.desc      localityOf(localities=[" ", "Hello World", "abc", "a", "x", ""], previous="abc_1") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0185 begin`);
      const actual: string = localityOf([' ', 'Hello World', 'abc', 'a', 'x', ''], 'abc_1');
      logInfo(`localityOf(localities=[" ", "Hello World"...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}LocalityOf_0185 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0186
     * @tc.name      Location_LocalityOf_0186
     * @tc.desc      localityOf(localities=[" ", "Hello World", "abc", "a", "x", ""], previous="xabc") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocalityOf_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocalityOf_0186 begin`);
      const actual: string = localityOf([' ', 'Hello World', 'abc', 'a', 'x', ''], 'xabc');
      logInfo(`localityOf(localities=[" ", "Hello World"...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}LocalityOf_0186 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0187
     * @tc.name      Location_LocalityOf_0187
     * @tc.desc      localityOf(localities=[" ", "Hello World", "abc", "a", "x", ""], previous=" Hello World ") retur...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocalityOf_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocalityOf_0187 begin`);
      const actual: string = localityOf([' ', 'Hello World', 'abc', 'a', 'x', ''], ' Hello World ');
      logInfo(`localityOf(localities=[" ", "Hello World"...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}LocalityOf_0187 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0188
     * @tc.name      Location_LocalityOf_0188
     * @tc.desc      localityOf(localities=[" ", "Hello World", "abc", "a", "x", ""], previous="Hello WorldHello Worl...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0188 begin`);
      const actual: string = localityOf([' ', 'Hello World', 'abc', 'a', 'x', ''], 'Hello WorldHello World');
      logInfo(`localityOf(localities=[" ", "Hello World"...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}LocalityOf_0188 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0189
     * @tc.name      Location_LocalityOf_0189
     * @tc.desc      localityOf(localities=[" ", "Hello World", "abc", "a", "x", ""], previous="Hello World_1") retur...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0189 begin`);
      const actual: string = localityOf([' ', 'Hello World', 'abc', 'a', 'x', ''], 'Hello World_1');
      logInfo(`localityOf(localities=[" ", "Hello World"...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}LocalityOf_0189 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0190
     * @tc.name      Location_LocalityOf_0190
     * @tc.desc      localityOf(localities=[" ", "Hello World", "abc", "a", "x", ""], previous="xHello World") return...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocalityOf_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocalityOf_0190 begin`);
      const actual: string = localityOf([' ', 'Hello World', 'abc', 'a', 'x', ''], 'xHello World');
      logInfo(`localityOf(localities=[" ", "Hello World"...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}LocalityOf_0190 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0191
     * @tc.name      Location_LocalityOf_0191
     * @tc.desc      localityOf(localities=[" ", "Hello World", "abc", "a", "x", ""], previous="   ") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocalityOf_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocalityOf_0191 begin`);
      const actual: string = localityOf([' ', 'Hello World', 'abc', 'a', 'x', ''], '   ');
      logInfo(`localityOf(localities=[" ", "Hello World"...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}LocalityOf_0191 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0192
     * @tc.name      Location_LocalityOf_0192
     * @tc.desc      localityOf(localities=[" ", "Hello World", "abc", "a", "x", ""], previous="  ") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0192 begin`);
      const actual: string = localityOf([' ', 'Hello World', 'abc', 'a', 'x', ''], '  ');
      logInfo(`localityOf(localities=[" ", "Hello World"...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}LocalityOf_0192 end`);
    });
  });
}
