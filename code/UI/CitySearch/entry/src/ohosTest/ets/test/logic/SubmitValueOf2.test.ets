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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { submitValueOf } from '../model/CitySearchLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CitySearch]';
const BUNDLE: string = 'CitySearch_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for submitValueOf (96 cases). */
export default function submitValueOf2Test(): void {
  describe('SubmitValueOf2Test', () => {
    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0097
     * @tc.name      CitySearch_SubmitValueOf_0097
     * @tc.desc      submitValueOf(value="Hello", placeholder="123_1") returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0097 begin`);
      const actual: string = submitValueOf('Hello', '123_1');
      logInfo(`submitValueOf(value="Hello", placeholder=...: actual=${actual}`);
      expect(actual).assertEqual('Hello');
      logInfo(`${BUNDLE}SubmitValueOf_0097 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0098
     * @tc.name      CitySearch_SubmitValueOf_0098
     * @tc.desc      submitValueOf(value="Hello", placeholder="x123") returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0098 begin`);
      const actual: string = submitValueOf('Hello', 'x123');
      logInfo(`submitValueOf(value="Hello", placeholder=...: actual=${actual}`);
      expect(actual).assertEqual('Hello');
      logInfo(`${BUNDLE}SubmitValueOf_0098 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0099
     * @tc.name      CitySearch_SubmitValueOf_0099
     * @tc.desc      submitValueOf(value="Hello", placeholder="1yiYDipj") returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0099 begin`);
      const actual: string = submitValueOf('Hello', '1yiYDipj');
      logInfo(`submitValueOf(value="Hello", placeholder=...: actual=${actual}`);
      expect(actual).assertEqual('Hello');
      logInfo(`${BUNDLE}SubmitValueOf_0099 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0100
     * @tc.name      CitySearch_SubmitValueOf_0100
     * @tc.desc      submitValueOf(value="Hello", placeholder="4UfKKj") returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0100 begin`);
      const actual: string = submitValueOf('Hello', '4UfKKj');
      logInfo(`submitValueOf(value="Hello", placeholder=...: actual=${actual}`);
      expect(actual).assertEqual('Hello');
      logInfo(`${BUNDLE}SubmitValueOf_0100 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0101
     * @tc.name      CitySearch_SubmitValueOf_0101
     * @tc.desc      submitValueOf(value="Hello", placeholder="Q8") returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0101 begin`);
      const actual: string = submitValueOf('Hello', 'Q8');
      logInfo(`submitValueOf(value="Hello", placeholder=...: actual=${actual}`);
      expect(actual).assertEqual('Hello');
      logInfo(`${BUNDLE}SubmitValueOf_0101 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0102
     * @tc.name      CitySearch_SubmitValueOf_0102
     * @tc.desc      submitValueOf(value="Hello", placeholder="nfWpMiFnCe") returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0102 begin`);
      const actual: string = submitValueOf('Hello', 'nfWpMiFnCe');
      logInfo(`submitValueOf(value="Hello", placeholder=...: actual=${actual}`);
      expect(actual).assertEqual('Hello');
      logInfo(`${BUNDLE}SubmitValueOf_0102 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0103
     * @tc.name      CitySearch_SubmitValueOf_0103
     * @tc.desc      submitValueOf(value="Hello", placeholder="45gcO") returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0103 begin`);
      const actual: string = submitValueOf('Hello', '45gcO');
      logInfo(`submitValueOf(value="Hello", placeholder=...: actual=${actual}`);
      expect(actual).assertEqual('Hello');
      logInfo(`${BUNDLE}SubmitValueOf_0103 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0104
     * @tc.name      CitySearch_SubmitValueOf_0104
     * @tc.desc      submitValueOf(value="Hello", placeholder="Br") returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0104 begin`);
      const actual: string = submitValueOf('Hello', 'Br');
      logInfo(`submitValueOf(value="Hello", placeholder=...: actual=${actual}`);
      expect(actual).assertEqual('Hello');
      logInfo(`${BUNDLE}SubmitValueOf_0104 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0105
     * @tc.name      CitySearch_SubmitValueOf_0105
     * @tc.desc      submitValueOf(value="Hello", placeholder="S4nwI2C") returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0105 begin`);
      const actual: string = submitValueOf('Hello', 'S4nwI2C');
      logInfo(`submitValueOf(value="Hello", placeholder=...: actual=${actual}`);
      expect(actual).assertEqual('Hello');
      logInfo(`${BUNDLE}SubmitValueOf_0105 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0106
     * @tc.name      CitySearch_SubmitValueOf_0106
     * @tc.desc      submitValueOf(value="Hello", placeholder="1k8F") returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0106 begin`);
      const actual: string = submitValueOf('Hello', '1k8F');
      logInfo(`submitValueOf(value="Hello", placeholder=...: actual=${actual}`);
      expect(actual).assertEqual('Hello');
      logInfo(`${BUNDLE}SubmitValueOf_0106 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0107
     * @tc.name      CitySearch_SubmitValueOf_0107
     * @tc.desc      submitValueOf(value="Hello", placeholder="J68Wrt1IGFi7") returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0107 begin`);
      const actual: string = submitValueOf('Hello', 'J68Wrt1IGFi7');
      logInfo(`submitValueOf(value="Hello", placeholder=...: actual=${actual}`);
      expect(actual).assertEqual('Hello');
      logInfo(`${BUNDLE}SubmitValueOf_0107 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0108
     * @tc.name      CitySearch_SubmitValueOf_0108
     * @tc.desc      submitValueOf(value="Hello", placeholder="Fcr") returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0108 begin`);
      const actual: string = submitValueOf('Hello', 'Fcr');
      logInfo(`submitValueOf(value="Hello", placeholder=...: actual=${actual}`);
      expect(actual).assertEqual('Hello');
      logInfo(`${BUNDLE}SubmitValueOf_0108 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0109
     * @tc.name      CitySearch_SubmitValueOf_0109
     * @tc.desc      submitValueOf(value="Hello", placeholder="PqZ8ye") returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0109 begin`);
      const actual: string = submitValueOf('Hello', 'PqZ8ye');
      logInfo(`submitValueOf(value="Hello", placeholder=...: actual=${actual}`);
      expect(actual).assertEqual('Hello');
      logInfo(`${BUNDLE}SubmitValueOf_0109 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0110
     * @tc.name      CitySearch_SubmitValueOf_0110
     * @tc.desc      submitValueOf(value="Hello", placeholder="hyJZ1X") returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0110 begin`);
      const actual: string = submitValueOf('Hello', 'hyJZ1X');
      logInfo(`submitValueOf(value="Hello", placeholder=...: actual=${actual}`);
      expect(actual).assertEqual('Hello');
      logInfo(`${BUNDLE}SubmitValueOf_0110 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0111
     * @tc.name      CitySearch_SubmitValueOf_0111
     * @tc.desc      submitValueOf(value="Hello", placeholder="AAZGWesb") returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0111 begin`);
      const actual: string = submitValueOf('Hello', 'AAZGWesb');
      logInfo(`submitValueOf(value="Hello", placeholder=...: actual=${actual}`);
      expect(actual).assertEqual('Hello');
      logInfo(`${BUNDLE}SubmitValueOf_0111 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0112
     * @tc.name      CitySearch_SubmitValueOf_0112
     * @tc.desc      submitValueOf(value="Hello", placeholder="M") returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0112 begin`);
      const actual: string = submitValueOf('Hello', 'M');
      logInfo(`submitValueOf(value="Hello", placeholder=...: actual=${actual}`);
      expect(actual).assertEqual('Hello');
      logInfo(`${BUNDLE}SubmitValueOf_0112 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0113
     * @tc.name      CitySearch_SubmitValueOf_0113
     * @tc.desc      submitValueOf(value="Hello", placeholder="NnBEpA1PeFW") returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0113 begin`);
      const actual: string = submitValueOf('Hello', 'NnBEpA1PeFW');
      logInfo(`submitValueOf(value="Hello", placeholder=...: actual=${actual}`);
      expect(actual).assertEqual('Hello');
      logInfo(`${BUNDLE}SubmitValueOf_0113 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0114
     * @tc.name      CitySearch_SubmitValueOf_0114
     * @tc.desc      submitValueOf(value="Hello", placeholder="lL9A6v2eCpr") returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0114 begin`);
      const actual: string = submitValueOf('Hello', 'lL9A6v2eCpr');
      logInfo(`submitValueOf(value="Hello", placeholder=...: actual=${actual}`);
      expect(actual).assertEqual('Hello');
      logInfo(`${BUNDLE}SubmitValueOf_0114 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0115
     * @tc.name      CitySearch_SubmitValueOf_0115
     * @tc.desc      submitValueOf(value="Hello", placeholder="jtXz3X") returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0115 begin`);
      const actual: string = submitValueOf('Hello', 'jtXz3X');
      logInfo(`submitValueOf(value="Hello", placeholder=...: actual=${actual}`);
      expect(actual).assertEqual('Hello');
      logInfo(`${BUNDLE}SubmitValueOf_0115 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0116
     * @tc.name      CitySearch_SubmitValueOf_0116
     * @tc.desc      submitValueOf(value="Hello", placeholder="aA5LOQkoOgD8") returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0116 begin`);
      const actual: string = submitValueOf('Hello', 'aA5LOQkoOgD8');
      logInfo(`submitValueOf(value="Hello", placeholder=...: actual=${actual}`);
      expect(actual).assertEqual('Hello');
      logInfo(`${BUNDLE}SubmitValueOf_0116 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0117
     * @tc.name      CitySearch_SubmitValueOf_0117
     * @tc.desc      submitValueOf(value="Hello", placeholder="ixNlT6jmrr5r") returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0117 begin`);
      const actual: string = submitValueOf('Hello', 'ixNlT6jmrr5r');
      logInfo(`submitValueOf(value="Hello", placeholder=...: actual=${actual}`);
      expect(actual).assertEqual('Hello');
      logInfo(`${BUNDLE}SubmitValueOf_0117 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0118
     * @tc.name      CitySearch_SubmitValueOf_0118
     * @tc.desc      submitValueOf(value="Hello", placeholder="KJzqE") returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0118 begin`);
      const actual: string = submitValueOf('Hello', 'KJzqE');
      logInfo(`submitValueOf(value="Hello", placeholder=...: actual=${actual}`);
      expect(actual).assertEqual('Hello');
      logInfo(`${BUNDLE}SubmitValueOf_0118 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0119
     * @tc.name      CitySearch_SubmitValueOf_0119
     * @tc.desc      submitValueOf(value="Hello", placeholder="ecWgoCV1fWD") returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0119 begin`);
      const actual: string = submitValueOf('Hello', 'ecWgoCV1fWD');
      logInfo(`submitValueOf(value="Hello", placeholder=...: actual=${actual}`);
      expect(actual).assertEqual('Hello');
      logInfo(`${BUNDLE}SubmitValueOf_0119 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0120
     * @tc.name      CitySearch_SubmitValueOf_0120
     * @tc.desc      submitValueOf(value="Hello", placeholder="lz0Ex") returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0120 begin`);
      const actual: string = submitValueOf('Hello', 'lz0Ex');
      logInfo(`submitValueOf(value="Hello", placeholder=...: actual=${actual}`);
      expect(actual).assertEqual('Hello');
      logInfo(`${BUNDLE}SubmitValueOf_0120 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0121
     * @tc.name      CitySearch_SubmitValueOf_0121
     * @tc.desc      submitValueOf(value="hello world", placeholder="a") returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0121 begin`);
      const actual: string = submitValueOf('hello world', 'a');
      logInfo(`submitValueOf(value="hello world", placeh...: actual=${actual}`);
      expect(actual).assertEqual('hello world');
      logInfo(`${BUNDLE}SubmitValueOf_0121 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0122
     * @tc.name      CitySearch_SubmitValueOf_0122
     * @tc.desc      submitValueOf(value="hello world", placeholder="abc") returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0122 begin`);
      const actual: string = submitValueOf('hello world', 'abc');
      logInfo(`submitValueOf(value="hello world", placeh...: actual=${actual}`);
      expect(actual).assertEqual('hello world');
      logInfo(`${BUNDLE}SubmitValueOf_0122 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0123
     * @tc.name      CitySearch_SubmitValueOf_0123
     * @tc.desc      submitValueOf(value="hello world", placeholder="Hello World") returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0123 begin`);
      const actual: string = submitValueOf('hello world', 'Hello World');
      logInfo(`submitValueOf(value="hello world", placeh...: actual=${actual}`);
      expect(actual).assertEqual('hello world');
      logInfo(`${BUNDLE}SubmitValueOf_0123 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0124
     * @tc.name      CitySearch_SubmitValueOf_0124
     * @tc.desc      submitValueOf(value="hello world", placeholder=" ") returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0124 begin`);
      const actual: string = submitValueOf('hello world', ' ');
      logInfo(`submitValueOf(value="hello world", placeh...: actual=${actual}`);
      expect(actual).assertEqual('hello world');
      logInfo(`${BUNDLE}SubmitValueOf_0124 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0125
     * @tc.name      CitySearch_SubmitValueOf_0125
     * @tc.desc      submitValueOf(value="hello world", placeholder="123") returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0125 begin`);
      const actual: string = submitValueOf('hello world', '123');
      logInfo(`submitValueOf(value="hello world", placeh...: actual=${actual}`);
      expect(actual).assertEqual('hello world');
      logInfo(`${BUNDLE}SubmitValueOf_0125 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0126
     * @tc.name      CitySearch_SubmitValueOf_0126
     * @tc.desc      submitValueOf(value="hello world", placeholder=" a ") returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0126 begin`);
      const actual: string = submitValueOf('hello world', ' a ');
      logInfo(`submitValueOf(value="hello world", placeh...: actual=${actual}`);
      expect(actual).assertEqual('hello world');
      logInfo(`${BUNDLE}SubmitValueOf_0126 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0127
     * @tc.name      CitySearch_SubmitValueOf_0127
     * @tc.desc      submitValueOf(value="hello world", placeholder="aa") returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0127 begin`);
      const actual: string = submitValueOf('hello world', 'aa');
      logInfo(`submitValueOf(value="hello world", placeh...: actual=${actual}`);
      expect(actual).assertEqual('hello world');
      logInfo(`${BUNDLE}SubmitValueOf_0127 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0128
     * @tc.name      CitySearch_SubmitValueOf_0128
     * @tc.desc      submitValueOf(value="hello world", placeholder="a_1") returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0128 begin`);
      const actual: string = submitValueOf('hello world', 'a_1');
      logInfo(`submitValueOf(value="hello world", placeh...: actual=${actual}`);
      expect(actual).assertEqual('hello world');
      logInfo(`${BUNDLE}SubmitValueOf_0128 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0129
     * @tc.name      CitySearch_SubmitValueOf_0129
     * @tc.desc      submitValueOf(value="hello world", placeholder="xa") returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0129 begin`);
      const actual: string = submitValueOf('hello world', 'xa');
      logInfo(`submitValueOf(value="hello world", placeh...: actual=${actual}`);
      expect(actual).assertEqual('hello world');
      logInfo(`${BUNDLE}SubmitValueOf_0129 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0130
     * @tc.name      CitySearch_SubmitValueOf_0130
     * @tc.desc      submitValueOf(value="hello world", placeholder=" abc ") returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0130 begin`);
      const actual: string = submitValueOf('hello world', ' abc ');
      logInfo(`submitValueOf(value="hello world", placeh...: actual=${actual}`);
      expect(actual).assertEqual('hello world');
      logInfo(`${BUNDLE}SubmitValueOf_0130 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0131
     * @tc.name      CitySearch_SubmitValueOf_0131
     * @tc.desc      submitValueOf(value="hello world", placeholder="abcabc") returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0131 begin`);
      const actual: string = submitValueOf('hello world', 'abcabc');
      logInfo(`submitValueOf(value="hello world", placeh...: actual=${actual}`);
      expect(actual).assertEqual('hello world');
      logInfo(`${BUNDLE}SubmitValueOf_0131 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0132
     * @tc.name      CitySearch_SubmitValueOf_0132
     * @tc.desc      submitValueOf(value="hello world", placeholder="abc_1") returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0132 begin`);
      const actual: string = submitValueOf('hello world', 'abc_1');
      logInfo(`submitValueOf(value="hello world", placeh...: actual=${actual}`);
      expect(actual).assertEqual('hello world');
      logInfo(`${BUNDLE}SubmitValueOf_0132 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0133
     * @tc.name      CitySearch_SubmitValueOf_0133
     * @tc.desc      submitValueOf(value="hello world", placeholder="xabc") returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0133 begin`);
      const actual: string = submitValueOf('hello world', 'xabc');
      logInfo(`submitValueOf(value="hello world", placeh...: actual=${actual}`);
      expect(actual).assertEqual('hello world');
      logInfo(`${BUNDLE}SubmitValueOf_0133 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0134
     * @tc.name      CitySearch_SubmitValueOf_0134
     * @tc.desc      submitValueOf(value="hello world", placeholder=" Hello World ") returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0134 begin`);
      const actual: string = submitValueOf('hello world', ' Hello World ');
      logInfo(`submitValueOf(value="hello world", placeh...: actual=${actual}`);
      expect(actual).assertEqual('hello world');
      logInfo(`${BUNDLE}SubmitValueOf_0134 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0135
     * @tc.name      CitySearch_SubmitValueOf_0135
     * @tc.desc      submitValueOf(value="hello world", placeholder="Hello WorldHello World") returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0135 begin`);
      const actual: string = submitValueOf('hello world', 'Hello WorldHello World');
      logInfo(`submitValueOf(value="hello world", placeh...: actual=${actual}`);
      expect(actual).assertEqual('hello world');
      logInfo(`${BUNDLE}SubmitValueOf_0135 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0136
     * @tc.name      CitySearch_SubmitValueOf_0136
     * @tc.desc      submitValueOf(value="hello world", placeholder="Hello World_1") returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0136 begin`);
      const actual: string = submitValueOf('hello world', 'Hello World_1');
      logInfo(`submitValueOf(value="hello world", placeh...: actual=${actual}`);
      expect(actual).assertEqual('hello world');
      logInfo(`${BUNDLE}SubmitValueOf_0136 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0137
     * @tc.name      CitySearch_SubmitValueOf_0137
     * @tc.desc      submitValueOf(value="hello world", placeholder="xHello World") returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0137 begin`);
      const actual: string = submitValueOf('hello world', 'xHello World');
      logInfo(`submitValueOf(value="hello world", placeh...: actual=${actual}`);
      expect(actual).assertEqual('hello world');
      logInfo(`${BUNDLE}SubmitValueOf_0137 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0138
     * @tc.name      CitySearch_SubmitValueOf_0138
     * @tc.desc      submitValueOf(value="hello world", placeholder="   ") returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0138 begin`);
      const actual: string = submitValueOf('hello world', '   ');
      logInfo(`submitValueOf(value="hello world", placeh...: actual=${actual}`);
      expect(actual).assertEqual('hello world');
      logInfo(`${BUNDLE}SubmitValueOf_0138 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0139
     * @tc.name      CitySearch_SubmitValueOf_0139
     * @tc.desc      submitValueOf(value="hello world", placeholder="  ") returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0139 begin`);
      const actual: string = submitValueOf('hello world', '  ');
      logInfo(`submitValueOf(value="hello world", placeh...: actual=${actual}`);
      expect(actual).assertEqual('hello world');
      logInfo(`${BUNDLE}SubmitValueOf_0139 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0140
     * @tc.name      CitySearch_SubmitValueOf_0140
     * @tc.desc      submitValueOf(value="hello world", placeholder=" _1") returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0140 begin`);
      const actual: string = submitValueOf('hello world', ' _1');
      logInfo(`submitValueOf(value="hello world", placeh...: actual=${actual}`);
      expect(actual).assertEqual('hello world');
      logInfo(`${BUNDLE}SubmitValueOf_0140 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0141
     * @tc.name      CitySearch_SubmitValueOf_0141
     * @tc.desc      submitValueOf(value="hello world", placeholder="x ") returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0141 begin`);
      const actual: string = submitValueOf('hello world', 'x ');
      logInfo(`submitValueOf(value="hello world", placeh...: actual=${actual}`);
      expect(actual).assertEqual('hello world');
      logInfo(`${BUNDLE}SubmitValueOf_0141 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0142
     * @tc.name      CitySearch_SubmitValueOf_0142
     * @tc.desc      submitValueOf(value="hello world", placeholder=" 123 ") returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0142 begin`);
      const actual: string = submitValueOf('hello world', ' 123 ');
      logInfo(`submitValueOf(value="hello world", placeh...: actual=${actual}`);
      expect(actual).assertEqual('hello world');
      logInfo(`${BUNDLE}SubmitValueOf_0142 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0143
     * @tc.name      CitySearch_SubmitValueOf_0143
     * @tc.desc      submitValueOf(value="hello world", placeholder="123123") returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0143 begin`);
      const actual: string = submitValueOf('hello world', '123123');
      logInfo(`submitValueOf(value="hello world", placeh...: actual=${actual}`);
      expect(actual).assertEqual('hello world');
      logInfo(`${BUNDLE}SubmitValueOf_0143 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0144
     * @tc.name      CitySearch_SubmitValueOf_0144
     * @tc.desc      submitValueOf(value="hello world", placeholder="123_1") returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0144 begin`);
      const actual: string = submitValueOf('hello world', '123_1');
      logInfo(`submitValueOf(value="hello world", placeh...: actual=${actual}`);
      expect(actual).assertEqual('hello world');
      logInfo(`${BUNDLE}SubmitValueOf_0144 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0145
     * @tc.name      CitySearch_SubmitValueOf_0145
     * @tc.desc      submitValueOf(value="hello world", placeholder="x123") returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0145 begin`);
      const actual: string = submitValueOf('hello world', 'x123');
      logInfo(`submitValueOf(value="hello world", placeh...: actual=${actual}`);
      expect(actual).assertEqual('hello world');
      logInfo(`${BUNDLE}SubmitValueOf_0145 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0146
     * @tc.name      CitySearch_SubmitValueOf_0146
     * @tc.desc      submitValueOf(value="hello world", placeholder="1yiYDipj") returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0146 begin`);
      const actual: string = submitValueOf('hello world', '1yiYDipj');
      logInfo(`submitValueOf(value="hello world", placeh...: actual=${actual}`);
      expect(actual).assertEqual('hello world');
      logInfo(`${BUNDLE}SubmitValueOf_0146 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0147
     * @tc.name      CitySearch_SubmitValueOf_0147
     * @tc.desc      submitValueOf(value="hello world", placeholder="4UfKKj") returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0147 begin`);
      const actual: string = submitValueOf('hello world', '4UfKKj');
      logInfo(`submitValueOf(value="hello world", placeh...: actual=${actual}`);
      expect(actual).assertEqual('hello world');
      logInfo(`${BUNDLE}SubmitValueOf_0147 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0148
     * @tc.name      CitySearch_SubmitValueOf_0148
     * @tc.desc      submitValueOf(value="hello world", placeholder="Q8") returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0148 begin`);
      const actual: string = submitValueOf('hello world', 'Q8');
      logInfo(`submitValueOf(value="hello world", placeh...: actual=${actual}`);
      expect(actual).assertEqual('hello world');
      logInfo(`${BUNDLE}SubmitValueOf_0148 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0149
     * @tc.name      CitySearch_SubmitValueOf_0149
     * @tc.desc      submitValueOf(value="hello world", placeholder="nfWpMiFnCe") returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0149 begin`);
      const actual: string = submitValueOf('hello world', 'nfWpMiFnCe');
      logInfo(`submitValueOf(value="hello world", placeh...: actual=${actual}`);
      expect(actual).assertEqual('hello world');
      logInfo(`${BUNDLE}SubmitValueOf_0149 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0150
     * @tc.name      CitySearch_SubmitValueOf_0150
     * @tc.desc      submitValueOf(value="hello world", placeholder="45gcO") returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0150 begin`);
      const actual: string = submitValueOf('hello world', '45gcO');
      logInfo(`submitValueOf(value="hello world", placeh...: actual=${actual}`);
      expect(actual).assertEqual('hello world');
      logInfo(`${BUNDLE}SubmitValueOf_0150 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0151
     * @tc.name      CitySearch_SubmitValueOf_0151
     * @tc.desc      submitValueOf(value="hello world", placeholder="Br") returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0151 begin`);
      const actual: string = submitValueOf('hello world', 'Br');
      logInfo(`submitValueOf(value="hello world", placeh...: actual=${actual}`);
      expect(actual).assertEqual('hello world');
      logInfo(`${BUNDLE}SubmitValueOf_0151 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0152
     * @tc.name      CitySearch_SubmitValueOf_0152
     * @tc.desc      submitValueOf(value="hello world", placeholder="S4nwI2C") returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0152 begin`);
      const actual: string = submitValueOf('hello world', 'S4nwI2C');
      logInfo(`submitValueOf(value="hello world", placeh...: actual=${actual}`);
      expect(actual).assertEqual('hello world');
      logInfo(`${BUNDLE}SubmitValueOf_0152 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0153
     * @tc.name      CitySearch_SubmitValueOf_0153
     * @tc.desc      submitValueOf(value="hello world", placeholder="1k8F") returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0153 begin`);
      const actual: string = submitValueOf('hello world', '1k8F');
      logInfo(`submitValueOf(value="hello world", placeh...: actual=${actual}`);
      expect(actual).assertEqual('hello world');
      logInfo(`${BUNDLE}SubmitValueOf_0153 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0154
     * @tc.name      CitySearch_SubmitValueOf_0154
     * @tc.desc      submitValueOf(value="hello world", placeholder="J68Wrt1IGFi7") returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0154 begin`);
      const actual: string = submitValueOf('hello world', 'J68Wrt1IGFi7');
      logInfo(`submitValueOf(value="hello world", placeh...: actual=${actual}`);
      expect(actual).assertEqual('hello world');
      logInfo(`${BUNDLE}SubmitValueOf_0154 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0155
     * @tc.name      CitySearch_SubmitValueOf_0155
     * @tc.desc      submitValueOf(value="hello world", placeholder="Fcr") returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0155 begin`);
      const actual: string = submitValueOf('hello world', 'Fcr');
      logInfo(`submitValueOf(value="hello world", placeh...: actual=${actual}`);
      expect(actual).assertEqual('hello world');
      logInfo(`${BUNDLE}SubmitValueOf_0155 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0156
     * @tc.name      CitySearch_SubmitValueOf_0156
     * @tc.desc      submitValueOf(value="hello world", placeholder="PqZ8ye") returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0156 begin`);
      const actual: string = submitValueOf('hello world', 'PqZ8ye');
      logInfo(`submitValueOf(value="hello world", placeh...: actual=${actual}`);
      expect(actual).assertEqual('hello world');
      logInfo(`${BUNDLE}SubmitValueOf_0156 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0157
     * @tc.name      CitySearch_SubmitValueOf_0157
     * @tc.desc      submitValueOf(value="hello world", placeholder="hyJZ1X") returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0157 begin`);
      const actual: string = submitValueOf('hello world', 'hyJZ1X');
      logInfo(`submitValueOf(value="hello world", placeh...: actual=${actual}`);
      expect(actual).assertEqual('hello world');
      logInfo(`${BUNDLE}SubmitValueOf_0157 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0158
     * @tc.name      CitySearch_SubmitValueOf_0158
     * @tc.desc      submitValueOf(value="hello world", placeholder="AAZGWesb") returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0158 begin`);
      const actual: string = submitValueOf('hello world', 'AAZGWesb');
      logInfo(`submitValueOf(value="hello world", placeh...: actual=${actual}`);
      expect(actual).assertEqual('hello world');
      logInfo(`${BUNDLE}SubmitValueOf_0158 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0159
     * @tc.name      CitySearch_SubmitValueOf_0159
     * @tc.desc      submitValueOf(value="hello world", placeholder="M") returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0159 begin`);
      const actual: string = submitValueOf('hello world', 'M');
      logInfo(`submitValueOf(value="hello world", placeh...: actual=${actual}`);
      expect(actual).assertEqual('hello world');
      logInfo(`${BUNDLE}SubmitValueOf_0159 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0160
     * @tc.name      CitySearch_SubmitValueOf_0160
     * @tc.desc      submitValueOf(value="hello world", placeholder="NnBEpA1PeFW") returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0160 begin`);
      const actual: string = submitValueOf('hello world', 'NnBEpA1PeFW');
      logInfo(`submitValueOf(value="hello world", placeh...: actual=${actual}`);
      expect(actual).assertEqual('hello world');
      logInfo(`${BUNDLE}SubmitValueOf_0160 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0161
     * @tc.name      CitySearch_SubmitValueOf_0161
     * @tc.desc      submitValueOf(value="hello world", placeholder="lL9A6v2eCpr") returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0161 begin`);
      const actual: string = submitValueOf('hello world', 'lL9A6v2eCpr');
      logInfo(`submitValueOf(value="hello world", placeh...: actual=${actual}`);
      expect(actual).assertEqual('hello world');
      logInfo(`${BUNDLE}SubmitValueOf_0161 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0162
     * @tc.name      CitySearch_SubmitValueOf_0162
     * @tc.desc      submitValueOf(value="hello world", placeholder="jtXz3X") returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0162 begin`);
      const actual: string = submitValueOf('hello world', 'jtXz3X');
      logInfo(`submitValueOf(value="hello world", placeh...: actual=${actual}`);
      expect(actual).assertEqual('hello world');
      logInfo(`${BUNDLE}SubmitValueOf_0162 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0163
     * @tc.name      CitySearch_SubmitValueOf_0163
     * @tc.desc      submitValueOf(value="hello world", placeholder="aA5LOQkoOgD8") returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0163 begin`);
      const actual: string = submitValueOf('hello world', 'aA5LOQkoOgD8');
      logInfo(`submitValueOf(value="hello world", placeh...: actual=${actual}`);
      expect(actual).assertEqual('hello world');
      logInfo(`${BUNDLE}SubmitValueOf_0163 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0164
     * @tc.name      CitySearch_SubmitValueOf_0164
     * @tc.desc      submitValueOf(value="hello world", placeholder="ixNlT6jmrr5r") returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0164 begin`);
      const actual: string = submitValueOf('hello world', 'ixNlT6jmrr5r');
      logInfo(`submitValueOf(value="hello world", placeh...: actual=${actual}`);
      expect(actual).assertEqual('hello world');
      logInfo(`${BUNDLE}SubmitValueOf_0164 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0165
     * @tc.name      CitySearch_SubmitValueOf_0165
     * @tc.desc      submitValueOf(value="hello world", placeholder="KJzqE") returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0165 begin`);
      const actual: string = submitValueOf('hello world', 'KJzqE');
      logInfo(`submitValueOf(value="hello world", placeh...: actual=${actual}`);
      expect(actual).assertEqual('hello world');
      logInfo(`${BUNDLE}SubmitValueOf_0165 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0166
     * @tc.name      CitySearch_SubmitValueOf_0166
     * @tc.desc      submitValueOf(value="hello world", placeholder="ecWgoCV1fWD") returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0166 begin`);
      const actual: string = submitValueOf('hello world', 'ecWgoCV1fWD');
      logInfo(`submitValueOf(value="hello world", placeh...: actual=${actual}`);
      expect(actual).assertEqual('hello world');
      logInfo(`${BUNDLE}SubmitValueOf_0166 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0167
     * @tc.name      CitySearch_SubmitValueOf_0167
     * @tc.desc      submitValueOf(value="hello world", placeholder="lz0Ex") returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0167 begin`);
      const actual: string = submitValueOf('hello world', 'lz0Ex');
      logInfo(`submitValueOf(value="hello world", placeh...: actual=${actual}`);
      expect(actual).assertEqual('hello world');
      logInfo(`${BUNDLE}SubmitValueOf_0167 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0168
     * @tc.name      CitySearch_SubmitValueOf_0168
     * @tc.desc      submitValueOf(value=" ", placeholder="") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0168 begin`);
      const actual: string = submitValueOf(' ', '');
      logInfo(`submitValueOf(value=" ", placeholder=""): actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}SubmitValueOf_0168 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0169
     * @tc.name      CitySearch_SubmitValueOf_0169
     * @tc.desc      submitValueOf(value=" ", placeholder="a") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0169 begin`);
      const actual: string = submitValueOf(' ', 'a');
      logInfo(`submitValueOf(value=" ", placeholder="a"): actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}SubmitValueOf_0169 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0170
     * @tc.name      CitySearch_SubmitValueOf_0170
     * @tc.desc      submitValueOf(value=" ", placeholder="abc") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0170 begin`);
      const actual: string = submitValueOf(' ', 'abc');
      logInfo(`submitValueOf(value=" ", placeholder="abc"): actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}SubmitValueOf_0170 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0171
     * @tc.name      CitySearch_SubmitValueOf_0171
     * @tc.desc      submitValueOf(value=" ", placeholder="Hello World") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0171 begin`);
      const actual: string = submitValueOf(' ', 'Hello World');
      logInfo(`submitValueOf(value=" ", placeholder="Hel...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}SubmitValueOf_0171 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0172
     * @tc.name      CitySearch_SubmitValueOf_0172
     * @tc.desc      submitValueOf(value=" ", placeholder=" ") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0172 begin`);
      const actual: string = submitValueOf(' ', ' ');
      logInfo(`submitValueOf(value=" ", placeholder=" "): actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}SubmitValueOf_0172 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0173
     * @tc.name      CitySearch_SubmitValueOf_0173
     * @tc.desc      submitValueOf(value=" ", placeholder="123") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0173 begin`);
      const actual: string = submitValueOf(' ', '123');
      logInfo(`submitValueOf(value=" ", placeholder="123"): actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}SubmitValueOf_0173 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0174
     * @tc.name      CitySearch_SubmitValueOf_0174
     * @tc.desc      submitValueOf(value=" ", placeholder=" a ") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0174 begin`);
      const actual: string = submitValueOf(' ', ' a ');
      logInfo(`submitValueOf(value=" ", placeholder=" a "): actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}SubmitValueOf_0174 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0175
     * @tc.name      CitySearch_SubmitValueOf_0175
     * @tc.desc      submitValueOf(value=" ", placeholder="aa") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0175 begin`);
      const actual: string = submitValueOf(' ', 'aa');
      logInfo(`submitValueOf(value=" ", placeholder="aa"): actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}SubmitValueOf_0175 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0176
     * @tc.name      CitySearch_SubmitValueOf_0176
     * @tc.desc      submitValueOf(value=" ", placeholder="a_1") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0176 begin`);
      const actual: string = submitValueOf(' ', 'a_1');
      logInfo(`submitValueOf(value=" ", placeholder="a_1"): actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}SubmitValueOf_0176 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0177
     * @tc.name      CitySearch_SubmitValueOf_0177
     * @tc.desc      submitValueOf(value=" ", placeholder="xa") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0177 begin`);
      const actual: string = submitValueOf(' ', 'xa');
      logInfo(`submitValueOf(value=" ", placeholder="xa"): actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}SubmitValueOf_0177 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0178
     * @tc.name      CitySearch_SubmitValueOf_0178
     * @tc.desc      submitValueOf(value=" ", placeholder=" abc ") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0178 begin`);
      const actual: string = submitValueOf(' ', ' abc ');
      logInfo(`submitValueOf(value=" ", placeholder=" ab...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}SubmitValueOf_0178 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0179
     * @tc.name      CitySearch_SubmitValueOf_0179
     * @tc.desc      submitValueOf(value=" ", placeholder="abcabc") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0179 begin`);
      const actual: string = submitValueOf(' ', 'abcabc');
      logInfo(`submitValueOf(value=" ", placeholder="abc...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}SubmitValueOf_0179 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0180
     * @tc.name      CitySearch_SubmitValueOf_0180
     * @tc.desc      submitValueOf(value=" ", placeholder="abc_1") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0180 begin`);
      const actual: string = submitValueOf(' ', 'abc_1');
      logInfo(`submitValueOf(value=" ", placeholder="abc...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}SubmitValueOf_0180 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0181
     * @tc.name      CitySearch_SubmitValueOf_0181
     * @tc.desc      submitValueOf(value=" ", placeholder="xabc") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0181 begin`);
      const actual: string = submitValueOf(' ', 'xabc');
      logInfo(`submitValueOf(value=" ", placeholder="xabc"): actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}SubmitValueOf_0181 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0182
     * @tc.name      CitySearch_SubmitValueOf_0182
     * @tc.desc      submitValueOf(value=" ", placeholder=" Hello World ") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0182 begin`);
      const actual: string = submitValueOf(' ', ' Hello World ');
      logInfo(`submitValueOf(value=" ", placeholder=" He...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}SubmitValueOf_0182 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0183
     * @tc.name      CitySearch_SubmitValueOf_0183
     * @tc.desc      submitValueOf(value=" ", placeholder="Hello WorldHello World") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0183 begin`);
      const actual: string = submitValueOf(' ', 'Hello WorldHello World');
      logInfo(`submitValueOf(value=" ", placeholder="Hel...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}SubmitValueOf_0183 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0184
     * @tc.name      CitySearch_SubmitValueOf_0184
     * @tc.desc      submitValueOf(value=" ", placeholder="Hello World_1") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0184 begin`);
      const actual: string = submitValueOf(' ', 'Hello World_1');
      logInfo(`submitValueOf(value=" ", placeholder="Hel...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}SubmitValueOf_0184 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0185
     * @tc.name      CitySearch_SubmitValueOf_0185
     * @tc.desc      submitValueOf(value=" ", placeholder="xHello World") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0185 begin`);
      const actual: string = submitValueOf(' ', 'xHello World');
      logInfo(`submitValueOf(value=" ", placeholder="xHe...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}SubmitValueOf_0185 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0186
     * @tc.name      CitySearch_SubmitValueOf_0186
     * @tc.desc      submitValueOf(value=" ", placeholder="   ") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0186 begin`);
      const actual: string = submitValueOf(' ', '   ');
      logInfo(`submitValueOf(value=" ", placeholder="   "): actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}SubmitValueOf_0186 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0187
     * @tc.name      CitySearch_SubmitValueOf_0187
     * @tc.desc      submitValueOf(value=" ", placeholder="  ") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0187 begin`);
      const actual: string = submitValueOf(' ', '  ');
      logInfo(`submitValueOf(value=" ", placeholder="  "): actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}SubmitValueOf_0187 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0188
     * @tc.name      CitySearch_SubmitValueOf_0188
     * @tc.desc      submitValueOf(value=" ", placeholder=" _1") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0188 begin`);
      const actual: string = submitValueOf(' ', ' _1');
      logInfo(`submitValueOf(value=" ", placeholder=" _1"): actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}SubmitValueOf_0188 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0189
     * @tc.name      CitySearch_SubmitValueOf_0189
     * @tc.desc      submitValueOf(value=" ", placeholder="x ") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0189 begin`);
      const actual: string = submitValueOf(' ', 'x ');
      logInfo(`submitValueOf(value=" ", placeholder="x "): actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}SubmitValueOf_0189 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0190
     * @tc.name      CitySearch_SubmitValueOf_0190
     * @tc.desc      submitValueOf(value=" ", placeholder=" 123 ") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0190 begin`);
      const actual: string = submitValueOf(' ', ' 123 ');
      logInfo(`submitValueOf(value=" ", placeholder=" 12...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}SubmitValueOf_0190 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0191
     * @tc.name      CitySearch_SubmitValueOf_0191
     * @tc.desc      submitValueOf(value=" ", placeholder="123123") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0191 begin`);
      const actual: string = submitValueOf(' ', '123123');
      logInfo(`submitValueOf(value=" ", placeholder="123...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}SubmitValueOf_0191 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0192
     * @tc.name      CitySearch_SubmitValueOf_0192
     * @tc.desc      submitValueOf(value=" ", placeholder="123_1") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0192 begin`);
      const actual: string = submitValueOf(' ', '123_1');
      logInfo(`submitValueOf(value=" ", placeholder="123...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}SubmitValueOf_0192 end`);
    });
  });
}
