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
import { resultCountOf } from '../model/CitySearchLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CitySearch]';
const BUNDLE: string = 'CitySearch_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for resultCountOf (96 cases). */
export default function resultCountOfTest(): void {
  describe('ResultCountOfTest', () => {
    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0001
     * @tc.name      CitySearch_ResultCountOf_0001
     * @tc.desc      resultCountOf(value="Hello") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_ResultCountOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResultCountOf_0001 begin`);
      const actual: number = resultCountOf('Hello');
      logInfo(`resultCountOf(value="Hello"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResultCountOf_0001 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0002
     * @tc.name      CitySearch_ResultCountOf_0002
     * @tc.desc      resultCountOf(value="A") returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_ResultCountOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ResultCountOf_0002 begin`);
      const actual: number = resultCountOf('A');
      logInfo(`resultCountOf(value="A"): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}ResultCountOf_0002 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0003
     * @tc.name      CitySearch_ResultCountOf_0003
     * @tc.desc      resultCountOf(value="t") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ResultCountOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResultCountOf_0003 begin`);
      const actual: number = resultCountOf('t');
      logInfo(`resultCountOf(value="t"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}ResultCountOf_0003 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0004
     * @tc.name      CitySearch_ResultCountOf_0004
     * @tc.desc      resultCountOf(value="Q") returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ResultCountOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResultCountOf_0004 begin`);
      const actual: number = resultCountOf('Q');
      logInfo(`resultCountOf(value="Q"): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}ResultCountOf_0004 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0005
     * @tc.name      CitySearch_ResultCountOf_0005
     * @tc.desc      resultCountOf(value="hello world") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ResultCountOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResultCountOf_0005 begin`);
      const actual: number = resultCountOf('hello world');
      logInfo(`resultCountOf(value="hello world"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResultCountOf_0005 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0006
     * @tc.name      CitySearch_ResultCountOf_0006
     * @tc.desc      resultCountOf(value="") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_ResultCountOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ResultCountOf_0006 begin`);
      const actual: number = resultCountOf('');
      logInfo(`resultCountOf(value=""): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResultCountOf_0006 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0007
     * @tc.name      CitySearch_ResultCountOf_0007
     * @tc.desc      resultCountOf(value=" ") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ResultCountOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResultCountOf_0007 begin`);
      const actual: number = resultCountOf(' ');
      logInfo(`resultCountOf(value=" "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResultCountOf_0007 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0008
     * @tc.name      CitySearch_ResultCountOf_0008
     * @tc.desc      resultCountOf(value="Sample Title 123") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ResultCountOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResultCountOf_0008 begin`);
      const actual: number = resultCountOf('Sample Title 123');
      logInfo(`resultCountOf(value="Sample Title 123"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResultCountOf_0008 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0009
     * @tc.name      CitySearch_ResultCountOf_0009
     * @tc.desc      resultCountOf(value="??") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ResultCountOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResultCountOf_0009 begin`);
      const actual: number = resultCountOf('\u4e2d\u6587');
      logInfo(`resultCountOf(value="??"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResultCountOf_0009 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0010
     * @tc.name      CitySearch_ResultCountOf_0010
     * @tc.desc      resultCountOf(value="a") returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ResultCountOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResultCountOf_0010 begin`);
      const actual: number = resultCountOf('a');
      logInfo(`resultCountOf(value="a"): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}ResultCountOf_0010 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0011
     * @tc.name      CitySearch_ResultCountOf_0011
     * @tc.desc      resultCountOf(value="abc") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ResultCountOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResultCountOf_0011 begin`);
      const actual: number = resultCountOf('abc');
      logInfo(`resultCountOf(value="abc"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResultCountOf_0011 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0012
     * @tc.name      CitySearch_ResultCountOf_0012
     * @tc.desc      resultCountOf(value="Hello World") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ResultCountOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResultCountOf_0012 begin`);
      const actual: number = resultCountOf('Hello World');
      logInfo(`resultCountOf(value="Hello World"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResultCountOf_0012 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0013
     * @tc.name      CitySearch_ResultCountOf_0013
     * @tc.desc      resultCountOf(value="123") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ResultCountOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResultCountOf_0013 begin`);
      const actual: number = resultCountOf('123');
      logInfo(`resultCountOf(value="123"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResultCountOf_0013 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0014
     * @tc.name      CitySearch_ResultCountOf_0014
     * @tc.desc      resultCountOf(value=" Hello ") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_ResultCountOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ResultCountOf_0014 begin`);
      const actual: number = resultCountOf(' Hello ');
      logInfo(`resultCountOf(value=" Hello "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResultCountOf_0014 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0015
     * @tc.name      CitySearch_ResultCountOf_0015
     * @tc.desc      resultCountOf(value="HelloHello") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ResultCountOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResultCountOf_0015 begin`);
      const actual: number = resultCountOf('HelloHello');
      logInfo(`resultCountOf(value="HelloHello"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResultCountOf_0015 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0016
     * @tc.name      CitySearch_ResultCountOf_0016
     * @tc.desc      resultCountOf(value="Hello_1") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ResultCountOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResultCountOf_0016 begin`);
      const actual: number = resultCountOf('Hello_1');
      logInfo(`resultCountOf(value="Hello_1"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResultCountOf_0016 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0017
     * @tc.name      CitySearch_ResultCountOf_0017
     * @tc.desc      resultCountOf(value="xHello") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_ResultCountOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ResultCountOf_0017 begin`);
      const actual: number = resultCountOf('xHello');
      logInfo(`resultCountOf(value="xHello"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResultCountOf_0017 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0018
     * @tc.name      CitySearch_ResultCountOf_0018
     * @tc.desc      resultCountOf(value=" hello world ") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_ResultCountOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ResultCountOf_0018 begin`);
      const actual: number = resultCountOf(' hello world ');
      logInfo(`resultCountOf(value=" hello world "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResultCountOf_0018 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0019
     * @tc.name      CitySearch_ResultCountOf_0019
     * @tc.desc      resultCountOf(value="hello worldhello world") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ResultCountOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResultCountOf_0019 begin`);
      const actual: number = resultCountOf('hello worldhello world');
      logInfo(`resultCountOf(value="hello worldhello wor...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResultCountOf_0019 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0020
     * @tc.name      CitySearch_ResultCountOf_0020
     * @tc.desc      resultCountOf(value="hello world_1") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ResultCountOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResultCountOf_0020 begin`);
      const actual: number = resultCountOf('hello world_1');
      logInfo(`resultCountOf(value="hello world_1"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResultCountOf_0020 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0021
     * @tc.name      CitySearch_ResultCountOf_0021
     * @tc.desc      resultCountOf(value="xhello world") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_ResultCountOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ResultCountOf_0021 begin`);
      const actual: number = resultCountOf('xhello world');
      logInfo(`resultCountOf(value="xhello world"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResultCountOf_0021 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0022
     * @tc.name      CitySearch_ResultCountOf_0022
     * @tc.desc      resultCountOf(value="   ") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_ResultCountOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ResultCountOf_0022 begin`);
      const actual: number = resultCountOf('   ');
      logInfo(`resultCountOf(value="   "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResultCountOf_0022 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0023
     * @tc.name      CitySearch_ResultCountOf_0023
     * @tc.desc      resultCountOf(value="  ") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ResultCountOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResultCountOf_0023 begin`);
      const actual: number = resultCountOf('  ');
      logInfo(`resultCountOf(value="  "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResultCountOf_0023 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0024
     * @tc.name      CitySearch_ResultCountOf_0024
     * @tc.desc      resultCountOf(value=" _1") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ResultCountOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResultCountOf_0024 begin`);
      const actual: number = resultCountOf(' _1');
      logInfo(`resultCountOf(value=" _1"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResultCountOf_0024 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0025
     * @tc.name      CitySearch_ResultCountOf_0025
     * @tc.desc      resultCountOf(value="x ") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_ResultCountOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ResultCountOf_0025 begin`);
      const actual: number = resultCountOf('x ');
      logInfo(`resultCountOf(value="x "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResultCountOf_0025 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0026
     * @tc.name      CitySearch_ResultCountOf_0026
     * @tc.desc      resultCountOf(value=" A ") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_ResultCountOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ResultCountOf_0026 begin`);
      const actual: number = resultCountOf(' A ');
      logInfo(`resultCountOf(value=" A "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResultCountOf_0026 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0027
     * @tc.name      CitySearch_ResultCountOf_0027
     * @tc.desc      resultCountOf(value="AA") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ResultCountOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResultCountOf_0027 begin`);
      const actual: number = resultCountOf('AA');
      logInfo(`resultCountOf(value="AA"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResultCountOf_0027 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0028
     * @tc.name      CitySearch_ResultCountOf_0028
     * @tc.desc      resultCountOf(value="A_1") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ResultCountOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResultCountOf_0028 begin`);
      const actual: number = resultCountOf('A_1');
      logInfo(`resultCountOf(value="A_1"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResultCountOf_0028 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0029
     * @tc.name      CitySearch_ResultCountOf_0029
     * @tc.desc      resultCountOf(value="xA") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_ResultCountOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ResultCountOf_0029 begin`);
      const actual: number = resultCountOf('xA');
      logInfo(`resultCountOf(value="xA"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResultCountOf_0029 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0030
     * @tc.name      CitySearch_ResultCountOf_0030
     * @tc.desc      resultCountOf(value=" Sample Title 123 ") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_ResultCountOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ResultCountOf_0030 begin`);
      const actual: number = resultCountOf(' Sample Title 123 ');
      logInfo(`resultCountOf(value=" Sample Title 123 "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResultCountOf_0030 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0031
     * @tc.name      CitySearch_ResultCountOf_0031
     * @tc.desc      resultCountOf(value="Sample Title 123Sample Title 123") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ResultCountOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResultCountOf_0031 begin`);
      const actual: number = resultCountOf('Sample Title 123Sample Title 123');
      logInfo(`resultCountOf(value="Sample Title 123Samp...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResultCountOf_0031 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0032
     * @tc.name      CitySearch_ResultCountOf_0032
     * @tc.desc      resultCountOf(value="Sample Title 123_1") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ResultCountOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResultCountOf_0032 begin`);
      const actual: number = resultCountOf('Sample Title 123_1');
      logInfo(`resultCountOf(value="Sample Title 123_1"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResultCountOf_0032 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0033
     * @tc.name      CitySearch_ResultCountOf_0033
     * @tc.desc      resultCountOf(value="xSample Title 123") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_ResultCountOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ResultCountOf_0033 begin`);
      const actual: number = resultCountOf('xSample Title 123');
      logInfo(`resultCountOf(value="xSample Title 123"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResultCountOf_0033 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0034
     * @tc.name      CitySearch_ResultCountOf_0034
     * @tc.desc      resultCountOf(value=" ?? ") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_ResultCountOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ResultCountOf_0034 begin`);
      const actual: number = resultCountOf(' \u4e2d\u6587 ');
      logInfo(`resultCountOf(value=" ?? "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResultCountOf_0034 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0035
     * @tc.name      CitySearch_ResultCountOf_0035
     * @tc.desc      resultCountOf(value="????") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ResultCountOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResultCountOf_0035 begin`);
      const actual: number = resultCountOf('\u4e2d\u6587\u4e2d\u6587');
      logInfo(`resultCountOf(value="????"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResultCountOf_0035 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0036
     * @tc.name      CitySearch_ResultCountOf_0036
     * @tc.desc      resultCountOf(value="??_1") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ResultCountOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResultCountOf_0036 begin`);
      const actual: number = resultCountOf('\u4e2d\u6587_1');
      logInfo(`resultCountOf(value="??_1"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResultCountOf_0036 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0037
     * @tc.name      CitySearch_ResultCountOf_0037
     * @tc.desc      resultCountOf(value="x??") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_ResultCountOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ResultCountOf_0037 begin`);
      const actual: number = resultCountOf('x\u4e2d\u6587');
      logInfo(`resultCountOf(value="x??"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResultCountOf_0037 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0038
     * @tc.name      CitySearch_ResultCountOf_0038
     * @tc.desc      resultCountOf(value=" a ") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_ResultCountOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ResultCountOf_0038 begin`);
      const actual: number = resultCountOf(' a ');
      logInfo(`resultCountOf(value=" a "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResultCountOf_0038 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0039
     * @tc.name      CitySearch_ResultCountOf_0039
     * @tc.desc      resultCountOf(value="aa") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ResultCountOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResultCountOf_0039 begin`);
      const actual: number = resultCountOf('aa');
      logInfo(`resultCountOf(value="aa"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResultCountOf_0039 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0040
     * @tc.name      CitySearch_ResultCountOf_0040
     * @tc.desc      resultCountOf(value="a_1") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ResultCountOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResultCountOf_0040 begin`);
      const actual: number = resultCountOf('a_1');
      logInfo(`resultCountOf(value="a_1"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResultCountOf_0040 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0041
     * @tc.name      CitySearch_ResultCountOf_0041
     * @tc.desc      resultCountOf(value="xa") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_ResultCountOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ResultCountOf_0041 begin`);
      const actual: number = resultCountOf('xa');
      logInfo(`resultCountOf(value="xa"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResultCountOf_0041 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0042
     * @tc.name      CitySearch_ResultCountOf_0042
     * @tc.desc      resultCountOf(value=" abc ") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_ResultCountOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ResultCountOf_0042 begin`);
      const actual: number = resultCountOf(' abc ');
      logInfo(`resultCountOf(value=" abc "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResultCountOf_0042 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0043
     * @tc.name      CitySearch_ResultCountOf_0043
     * @tc.desc      resultCountOf(value="abcabc") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ResultCountOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResultCountOf_0043 begin`);
      const actual: number = resultCountOf('abcabc');
      logInfo(`resultCountOf(value="abcabc"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResultCountOf_0043 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0044
     * @tc.name      CitySearch_ResultCountOf_0044
     * @tc.desc      resultCountOf(value="abc_1") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ResultCountOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResultCountOf_0044 begin`);
      const actual: number = resultCountOf('abc_1');
      logInfo(`resultCountOf(value="abc_1"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResultCountOf_0044 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0045
     * @tc.name      CitySearch_ResultCountOf_0045
     * @tc.desc      resultCountOf(value="xabc") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_ResultCountOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ResultCountOf_0045 begin`);
      const actual: number = resultCountOf('xabc');
      logInfo(`resultCountOf(value="xabc"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResultCountOf_0045 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0046
     * @tc.name      CitySearch_ResultCountOf_0046
     * @tc.desc      resultCountOf(value=" Hello World ") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_ResultCountOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ResultCountOf_0046 begin`);
      const actual: number = resultCountOf(' Hello World ');
      logInfo(`resultCountOf(value=" Hello World "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResultCountOf_0046 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0047
     * @tc.name      CitySearch_ResultCountOf_0047
     * @tc.desc      resultCountOf(value="Hello WorldHello World") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ResultCountOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResultCountOf_0047 begin`);
      const actual: number = resultCountOf('Hello WorldHello World');
      logInfo(`resultCountOf(value="Hello WorldHello Wor...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResultCountOf_0047 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0048
     * @tc.name      CitySearch_ResultCountOf_0048
     * @tc.desc      resultCountOf(value="Hello World_1") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ResultCountOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResultCountOf_0048 begin`);
      const actual: number = resultCountOf('Hello World_1');
      logInfo(`resultCountOf(value="Hello World_1"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResultCountOf_0048 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0049
     * @tc.name      CitySearch_ResultCountOf_0049
     * @tc.desc      resultCountOf(value="xHello World") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_ResultCountOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ResultCountOf_0049 begin`);
      const actual: number = resultCountOf('xHello World');
      logInfo(`resultCountOf(value="xHello World"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResultCountOf_0049 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0050
     * @tc.name      CitySearch_ResultCountOf_0050
     * @tc.desc      resultCountOf(value=" 123 ") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_ResultCountOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ResultCountOf_0050 begin`);
      const actual: number = resultCountOf(' 123 ');
      logInfo(`resultCountOf(value=" 123 "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResultCountOf_0050 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0051
     * @tc.name      CitySearch_ResultCountOf_0051
     * @tc.desc      resultCountOf(value="123123") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ResultCountOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResultCountOf_0051 begin`);
      const actual: number = resultCountOf('123123');
      logInfo(`resultCountOf(value="123123"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResultCountOf_0051 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0052
     * @tc.name      CitySearch_ResultCountOf_0052
     * @tc.desc      resultCountOf(value="123_1") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ResultCountOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResultCountOf_0052 begin`);
      const actual: number = resultCountOf('123_1');
      logInfo(`resultCountOf(value="123_1"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResultCountOf_0052 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0053
     * @tc.name      CitySearch_ResultCountOf_0053
     * @tc.desc      resultCountOf(value="x123") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_ResultCountOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ResultCountOf_0053 begin`);
      const actual: number = resultCountOf('x123');
      logInfo(`resultCountOf(value="x123"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResultCountOf_0053 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0054
     * @tc.name      CitySearch_ResultCountOf_0054
     * @tc.desc      resultCountOf(value="YMU8K") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ResultCountOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResultCountOf_0054 begin`);
      const actual: number = resultCountOf('YMU8K');
      logInfo(`resultCountOf(value="YMU8K"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResultCountOf_0054 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0055
     * @tc.name      CitySearch_ResultCountOf_0055
     * @tc.desc      resultCountOf(value="3H2meK35") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ResultCountOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResultCountOf_0055 begin`);
      const actual: number = resultCountOf('3H2meK35');
      logInfo(`resultCountOf(value="3H2meK35"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResultCountOf_0055 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0056
     * @tc.name      CitySearch_ResultCountOf_0056
     * @tc.desc      resultCountOf(value="655zhzZEcCV") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ResultCountOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResultCountOf_0056 begin`);
      const actual: number = resultCountOf('655zhzZEcCV');
      logInfo(`resultCountOf(value="655zhzZEcCV"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResultCountOf_0056 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0057
     * @tc.name      CitySearch_ResultCountOf_0057
     * @tc.desc      resultCountOf(value="2FF") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ResultCountOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResultCountOf_0057 begin`);
      const actual: number = resultCountOf('2FF');
      logInfo(`resultCountOf(value="2FF"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResultCountOf_0057 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0058
     * @tc.name      CitySearch_ResultCountOf_0058
     * @tc.desc      resultCountOf(value="IcyX6xZY88") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ResultCountOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResultCountOf_0058 begin`);
      const actual: number = resultCountOf('IcyX6xZY88');
      logInfo(`resultCountOf(value="IcyX6xZY88"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResultCountOf_0058 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0059
     * @tc.name      CitySearch_ResultCountOf_0059
     * @tc.desc      resultCountOf(value="1Ibwkir") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ResultCountOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResultCountOf_0059 begin`);
      const actual: number = resultCountOf('1Ibwkir');
      logInfo(`resultCountOf(value="1Ibwkir"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResultCountOf_0059 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0060
     * @tc.name      CitySearch_ResultCountOf_0060
     * @tc.desc      resultCountOf(value="RQmfq") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ResultCountOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResultCountOf_0060 begin`);
      const actual: number = resultCountOf('RQmfq');
      logInfo(`resultCountOf(value="RQmfq"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResultCountOf_0060 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0061
     * @tc.name      CitySearch_ResultCountOf_0061
     * @tc.desc      resultCountOf(value="xp0") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ResultCountOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResultCountOf_0061 begin`);
      const actual: number = resultCountOf('xp0');
      logInfo(`resultCountOf(value="xp0"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResultCountOf_0061 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0062
     * @tc.name      CitySearch_ResultCountOf_0062
     * @tc.desc      resultCountOf(value="P8fGn1") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ResultCountOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResultCountOf_0062 begin`);
      const actual: number = resultCountOf('P8fGn1');
      logInfo(`resultCountOf(value="P8fGn1"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResultCountOf_0062 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0063
     * @tc.name      CitySearch_ResultCountOf_0063
     * @tc.desc      resultCountOf(value="b9c") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ResultCountOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResultCountOf_0063 begin`);
      const actual: number = resultCountOf('b9c');
      logInfo(`resultCountOf(value="b9c"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResultCountOf_0063 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0064
     * @tc.name      CitySearch_ResultCountOf_0064
     * @tc.desc      resultCountOf(value="qfPS8") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ResultCountOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResultCountOf_0064 begin`);
      const actual: number = resultCountOf('qfPS8');
      logInfo(`resultCountOf(value="qfPS8"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResultCountOf_0064 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0065
     * @tc.name      CitySearch_ResultCountOf_0065
     * @tc.desc      resultCountOf(value="3") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ResultCountOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResultCountOf_0065 begin`);
      const actual: number = resultCountOf('3');
      logInfo(`resultCountOf(value="3"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResultCountOf_0065 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0066
     * @tc.name      CitySearch_ResultCountOf_0066
     * @tc.desc      resultCountOf(value="Frona9dQqK2") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ResultCountOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResultCountOf_0066 begin`);
      const actual: number = resultCountOf('Frona9dQqK2');
      logInfo(`resultCountOf(value="Frona9dQqK2"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResultCountOf_0066 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0067
     * @tc.name      CitySearch_ResultCountOf_0067
     * @tc.desc      resultCountOf(value="HKobWIyXuNJw") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ResultCountOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResultCountOf_0067 begin`);
      const actual: number = resultCountOf('HKobWIyXuNJw');
      logInfo(`resultCountOf(value="HKobWIyXuNJw"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResultCountOf_0067 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0068
     * @tc.name      CitySearch_ResultCountOf_0068
     * @tc.desc      resultCountOf(value="mVRSw") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ResultCountOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResultCountOf_0068 begin`);
      const actual: number = resultCountOf('mVRSw');
      logInfo(`resultCountOf(value="mVRSw"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResultCountOf_0068 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0069
     * @tc.name      CitySearch_ResultCountOf_0069
     * @tc.desc      resultCountOf(value="UiiT") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ResultCountOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResultCountOf_0069 begin`);
      const actual: number = resultCountOf('UiiT');
      logInfo(`resultCountOf(value="UiiT"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResultCountOf_0069 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0070
     * @tc.name      CitySearch_ResultCountOf_0070
     * @tc.desc      resultCountOf(value="emxW1Wk") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ResultCountOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResultCountOf_0070 begin`);
      const actual: number = resultCountOf('emxW1Wk');
      logInfo(`resultCountOf(value="emxW1Wk"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResultCountOf_0070 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0071
     * @tc.name      CitySearch_ResultCountOf_0071
     * @tc.desc      resultCountOf(value="97ma39n6") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ResultCountOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResultCountOf_0071 begin`);
      const actual: number = resultCountOf('97ma39n6');
      logInfo(`resultCountOf(value="97ma39n6"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResultCountOf_0071 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0072
     * @tc.name      CitySearch_ResultCountOf_0072
     * @tc.desc      resultCountOf(value="dxgul") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ResultCountOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResultCountOf_0072 begin`);
      const actual: number = resultCountOf('dxgul');
      logInfo(`resultCountOf(value="dxgul"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResultCountOf_0072 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0073
     * @tc.name      CitySearch_ResultCountOf_0073
     * @tc.desc      resultCountOf(value="4") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ResultCountOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResultCountOf_0073 begin`);
      const actual: number = resultCountOf('4');
      logInfo(`resultCountOf(value="4"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResultCountOf_0073 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0074
     * @tc.name      CitySearch_ResultCountOf_0074
     * @tc.desc      resultCountOf(value="ERF5yGe4") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ResultCountOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResultCountOf_0074 begin`);
      const actual: number = resultCountOf('ERF5yGe4');
      logInfo(`resultCountOf(value="ERF5yGe4"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResultCountOf_0074 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0075
     * @tc.name      CitySearch_ResultCountOf_0075
     * @tc.desc      resultCountOf(value="YRG4l") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ResultCountOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResultCountOf_0075 begin`);
      const actual: number = resultCountOf('YRG4l');
      logInfo(`resultCountOf(value="YRG4l"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResultCountOf_0075 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0076
     * @tc.name      CitySearch_ResultCountOf_0076
     * @tc.desc      resultCountOf(value="PlO4bwCVIk") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ResultCountOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResultCountOf_0076 begin`);
      const actual: number = resultCountOf('PlO4bwCVIk');
      logInfo(`resultCountOf(value="PlO4bwCVIk"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResultCountOf_0076 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0077
     * @tc.name      CitySearch_ResultCountOf_0077
     * @tc.desc      resultCountOf(value="1Y2Xz4PC") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ResultCountOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResultCountOf_0077 begin`);
      const actual: number = resultCountOf('1Y2Xz4PC');
      logInfo(`resultCountOf(value="1Y2Xz4PC"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResultCountOf_0077 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0078
     * @tc.name      CitySearch_ResultCountOf_0078
     * @tc.desc      resultCountOf(value="7oBq5jnmOWR") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ResultCountOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResultCountOf_0078 begin`);
      const actual: number = resultCountOf('7oBq5jnmOWR');
      logInfo(`resultCountOf(value="7oBq5jnmOWR"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResultCountOf_0078 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0079
     * @tc.name      CitySearch_ResultCountOf_0079
     * @tc.desc      resultCountOf(value="Jcyb84Qom") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ResultCountOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResultCountOf_0079 begin`);
      const actual: number = resultCountOf('Jcyb84Qom');
      logInfo(`resultCountOf(value="Jcyb84Qom"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResultCountOf_0079 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0080
     * @tc.name      CitySearch_ResultCountOf_0080
     * @tc.desc      resultCountOf(value="pI40FXamolcW") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ResultCountOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResultCountOf_0080 begin`);
      const actual: number = resultCountOf('pI40FXamolcW');
      logInfo(`resultCountOf(value="pI40FXamolcW"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResultCountOf_0080 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0081
     * @tc.name      CitySearch_ResultCountOf_0081
     * @tc.desc      resultCountOf(value="EDl2UVfxM") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ResultCountOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResultCountOf_0081 begin`);
      const actual: number = resultCountOf('EDl2UVfxM');
      logInfo(`resultCountOf(value="EDl2UVfxM"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResultCountOf_0081 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0082
     * @tc.name      CitySearch_ResultCountOf_0082
     * @tc.desc      resultCountOf(value="Rv68Ux") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ResultCountOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResultCountOf_0082 begin`);
      const actual: number = resultCountOf('Rv68Ux');
      logInfo(`resultCountOf(value="Rv68Ux"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResultCountOf_0082 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0083
     * @tc.name      CitySearch_ResultCountOf_0083
     * @tc.desc      resultCountOf(value="t2c6sy") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ResultCountOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResultCountOf_0083 begin`);
      const actual: number = resultCountOf('t2c6sy');
      logInfo(`resultCountOf(value="t2c6sy"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResultCountOf_0083 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0084
     * @tc.name      CitySearch_ResultCountOf_0084
     * @tc.desc      resultCountOf(value="PKQ3D6") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ResultCountOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResultCountOf_0084 begin`);
      const actual: number = resultCountOf('PKQ3D6');
      logInfo(`resultCountOf(value="PKQ3D6"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResultCountOf_0084 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0085
     * @tc.name      CitySearch_ResultCountOf_0085
     * @tc.desc      resultCountOf(value="I") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ResultCountOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResultCountOf_0085 begin`);
      const actual: number = resultCountOf('I');
      logInfo(`resultCountOf(value="I"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResultCountOf_0085 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0086
     * @tc.name      CitySearch_ResultCountOf_0086
     * @tc.desc      resultCountOf(value="Lld") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ResultCountOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResultCountOf_0086 begin`);
      const actual: number = resultCountOf('Lld');
      logInfo(`resultCountOf(value="Lld"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResultCountOf_0086 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0087
     * @tc.name      CitySearch_ResultCountOf_0087
     * @tc.desc      resultCountOf(value="brhU71m") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ResultCountOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResultCountOf_0087 begin`);
      const actual: number = resultCountOf('brhU71m');
      logInfo(`resultCountOf(value="brhU71m"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResultCountOf_0087 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0088
     * @tc.name      CitySearch_ResultCountOf_0088
     * @tc.desc      resultCountOf(value="dAG0ZdZTNrf") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ResultCountOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResultCountOf_0088 begin`);
      const actual: number = resultCountOf('dAG0ZdZTNrf');
      logInfo(`resultCountOf(value="dAG0ZdZTNrf"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResultCountOf_0088 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0089
     * @tc.name      CitySearch_ResultCountOf_0089
     * @tc.desc      resultCountOf(value="vsg2CUtd") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ResultCountOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResultCountOf_0089 begin`);
      const actual: number = resultCountOf('vsg2CUtd');
      logInfo(`resultCountOf(value="vsg2CUtd"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResultCountOf_0089 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0090
     * @tc.name      CitySearch_ResultCountOf_0090
     * @tc.desc      resultCountOf(value="FYPG5H") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ResultCountOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResultCountOf_0090 begin`);
      const actual: number = resultCountOf('FYPG5H');
      logInfo(`resultCountOf(value="FYPG5H"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResultCountOf_0090 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0091
     * @tc.name      CitySearch_ResultCountOf_0091
     * @tc.desc      resultCountOf(value="w3CBEzg6gJ") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ResultCountOf_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResultCountOf_0091 begin`);
      const actual: number = resultCountOf('w3CBEzg6gJ');
      logInfo(`resultCountOf(value="w3CBEzg6gJ"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResultCountOf_0091 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0092
     * @tc.name      CitySearch_ResultCountOf_0092
     * @tc.desc      resultCountOf(value="S8s") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ResultCountOf_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResultCountOf_0092 begin`);
      const actual: number = resultCountOf('S8s');
      logInfo(`resultCountOf(value="S8s"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResultCountOf_0092 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0093
     * @tc.name      CitySearch_ResultCountOf_0093
     * @tc.desc      resultCountOf(value="9KUO") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ResultCountOf_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResultCountOf_0093 begin`);
      const actual: number = resultCountOf('9KUO');
      logInfo(`resultCountOf(value="9KUO"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResultCountOf_0093 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0094
     * @tc.name      CitySearch_ResultCountOf_0094
     * @tc.desc      resultCountOf(value="C") returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ResultCountOf_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResultCountOf_0094 begin`);
      const actual: number = resultCountOf('C');
      logInfo(`resultCountOf(value="C"): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}ResultCountOf_0094 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0095
     * @tc.name      CitySearch_ResultCountOf_0095
     * @tc.desc      resultCountOf(value="qgQT97bCTbt") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ResultCountOf_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResultCountOf_0095 begin`);
      const actual: number = resultCountOf('qgQT97bCTbt');
      logInfo(`resultCountOf(value="qgQT97bCTbt"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResultCountOf_0095 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_RESULT_COUNT_OF_0096
     * @tc.name      CitySearch_ResultCountOf_0096
     * @tc.desc      resultCountOf(value="etD") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_ResultCountOf_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ResultCountOf_0096 begin`);
      const actual: number = resultCountOf('etD');
      logInfo(`resultCountOf(value="etD"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ResultCountOf_0096 end`);
    });
  });
}
