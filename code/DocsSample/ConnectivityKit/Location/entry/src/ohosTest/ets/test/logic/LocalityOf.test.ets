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
export default function localityOfTest(): void {
  describe('LocalityOfTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0001
     * @tc.name      Location_LocalityOf_0001
     * @tc.desc      localityOf(localities=[], previous="") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Location_LocalityOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LocalityOf_0001 begin`);
      const actual: string = localityOf([], '');
      logInfo(`localityOf(localities=[], previous=""): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LocalityOf_0001 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0002
     * @tc.name      Location_LocalityOf_0002
     * @tc.desc      localityOf(localities=[], previous="x") returns "x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Location_LocalityOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LocalityOf_0002 begin`);
      const actual: string = localityOf([], 'x');
      logInfo(`localityOf(localities=[], previous="x"): actual=${actual}`);
      expect(actual).assertEqual('x');
      logInfo(`${BUNDLE}LocalityOf_0002 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0003
     * @tc.name      Location_LocalityOf_0003
     * @tc.desc      localityOf(localities=[], previous="a") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_LocalityOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}LocalityOf_0003 begin`);
      const actual: string = localityOf([], 'a');
      logInfo(`localityOf(localities=[], previous="a"): actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}LocalityOf_0003 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0004
     * @tc.name      Location_LocalityOf_0004
     * @tc.desc      localityOf(localities=[], previous="abc") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_LocalityOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}LocalityOf_0004 begin`);
      const actual: string = localityOf([], 'abc');
      logInfo(`localityOf(localities=[], previous="abc"): actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}LocalityOf_0004 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0005
     * @tc.name      Location_LocalityOf_0005
     * @tc.desc      localityOf(localities=[], previous="Hello World") returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_LocalityOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}LocalityOf_0005 begin`);
      const actual: string = localityOf([], 'Hello World');
      logInfo(`localityOf(localities=[], previous="Hello...: actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}LocalityOf_0005 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0006
     * @tc.name      Location_LocalityOf_0006
     * @tc.desc      localityOf(localities=[], previous=" ") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_LocalityOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}LocalityOf_0006 begin`);
      const actual: string = localityOf([], ' ');
      logInfo(`localityOf(localities=[], previous=" "): actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}LocalityOf_0006 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0007
     * @tc.name      Location_LocalityOf_0007
     * @tc.desc      localityOf(localities=[], previous="123") returns "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_LocalityOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}LocalityOf_0007 begin`);
      const actual: string = localityOf([], '123');
      logInfo(`localityOf(localities=[], previous="123"): actual=${actual}`);
      expect(actual).assertEqual('123');
      logInfo(`${BUNDLE}LocalityOf_0007 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0008
     * @tc.name      Location_LocalityOf_0008
     * @tc.desc      localityOf(localities=[], previous=" x ") returns " x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocalityOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocalityOf_0008 begin`);
      const actual: string = localityOf([], ' x ');
      logInfo(`localityOf(localities=[], previous=" x "): actual=${actual}`);
      expect(actual).assertEqual(' x ');
      logInfo(`${BUNDLE}LocalityOf_0008 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0009
     * @tc.name      Location_LocalityOf_0009
     * @tc.desc      localityOf(localities=[], previous="xx") returns "xx"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_LocalityOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}LocalityOf_0009 begin`);
      const actual: string = localityOf([], 'xx');
      logInfo(`localityOf(localities=[], previous="xx"): actual=${actual}`);
      expect(actual).assertEqual('xx');
      logInfo(`${BUNDLE}LocalityOf_0009 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0010
     * @tc.name      Location_LocalityOf_0010
     * @tc.desc      localityOf(localities=[], previous="x_1") returns "x_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_LocalityOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}LocalityOf_0010 begin`);
      const actual: string = localityOf([], 'x_1');
      logInfo(`localityOf(localities=[], previous="x_1"): actual=${actual}`);
      expect(actual).assertEqual('x_1');
      logInfo(`${BUNDLE}LocalityOf_0010 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0011
     * @tc.name      Location_LocalityOf_0011
     * @tc.desc      localityOf(localities=[], previous=" a ") returns " a "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocalityOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocalityOf_0011 begin`);
      const actual: string = localityOf([], ' a ');
      logInfo(`localityOf(localities=[], previous=" a "): actual=${actual}`);
      expect(actual).assertEqual(' a ');
      logInfo(`${BUNDLE}LocalityOf_0011 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0012
     * @tc.name      Location_LocalityOf_0012
     * @tc.desc      localityOf(localities=[], previous="aa") returns "aa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_LocalityOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}LocalityOf_0012 begin`);
      const actual: string = localityOf([], 'aa');
      logInfo(`localityOf(localities=[], previous="aa"): actual=${actual}`);
      expect(actual).assertEqual('aa');
      logInfo(`${BUNDLE}LocalityOf_0012 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0013
     * @tc.name      Location_LocalityOf_0013
     * @tc.desc      localityOf(localities=[], previous="a_1") returns "a_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_LocalityOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}LocalityOf_0013 begin`);
      const actual: string = localityOf([], 'a_1');
      logInfo(`localityOf(localities=[], previous="a_1"): actual=${actual}`);
      expect(actual).assertEqual('a_1');
      logInfo(`${BUNDLE}LocalityOf_0013 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0014
     * @tc.name      Location_LocalityOf_0014
     * @tc.desc      localityOf(localities=[], previous="xa") returns "xa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocalityOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocalityOf_0014 begin`);
      const actual: string = localityOf([], 'xa');
      logInfo(`localityOf(localities=[], previous="xa"): actual=${actual}`);
      expect(actual).assertEqual('xa');
      logInfo(`${BUNDLE}LocalityOf_0014 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0015
     * @tc.name      Location_LocalityOf_0015
     * @tc.desc      localityOf(localities=[], previous=" abc ") returns " abc "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocalityOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocalityOf_0015 begin`);
      const actual: string = localityOf([], ' abc ');
      logInfo(`localityOf(localities=[], previous=" abc "): actual=${actual}`);
      expect(actual).assertEqual(' abc ');
      logInfo(`${BUNDLE}LocalityOf_0015 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0016
     * @tc.name      Location_LocalityOf_0016
     * @tc.desc      localityOf(localities=[], previous="abcabc") returns "abcabc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_LocalityOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}LocalityOf_0016 begin`);
      const actual: string = localityOf([], 'abcabc');
      logInfo(`localityOf(localities=[], previous="abcabc"): actual=${actual}`);
      expect(actual).assertEqual('abcabc');
      logInfo(`${BUNDLE}LocalityOf_0016 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0017
     * @tc.name      Location_LocalityOf_0017
     * @tc.desc      localityOf(localities=[], previous="abc_1") returns "abc_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_LocalityOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}LocalityOf_0017 begin`);
      const actual: string = localityOf([], 'abc_1');
      logInfo(`localityOf(localities=[], previous="abc_1"): actual=${actual}`);
      expect(actual).assertEqual('abc_1');
      logInfo(`${BUNDLE}LocalityOf_0017 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0018
     * @tc.name      Location_LocalityOf_0018
     * @tc.desc      localityOf(localities=[], previous="xabc") returns "xabc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocalityOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocalityOf_0018 begin`);
      const actual: string = localityOf([], 'xabc');
      logInfo(`localityOf(localities=[], previous="xabc"): actual=${actual}`);
      expect(actual).assertEqual('xabc');
      logInfo(`${BUNDLE}LocalityOf_0018 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0019
     * @tc.name      Location_LocalityOf_0019
     * @tc.desc      localityOf(localities=[], previous=" Hello World ") returns " Hello World "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocalityOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocalityOf_0019 begin`);
      const actual: string = localityOf([], ' Hello World ');
      logInfo(`localityOf(localities=[], previous=" Hell...: actual=${actual}`);
      expect(actual).assertEqual(' Hello World ');
      logInfo(`${BUNDLE}LocalityOf_0019 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0020
     * @tc.name      Location_LocalityOf_0020
     * @tc.desc      localityOf(localities=[], previous="Hello WorldHello World") returns "Hello WorldHello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_LocalityOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}LocalityOf_0020 begin`);
      const actual: string = localityOf([], 'Hello WorldHello World');
      logInfo(`localityOf(localities=[], previous="Hello...: actual=${actual}`);
      expect(actual).assertEqual('Hello WorldHello World');
      logInfo(`${BUNDLE}LocalityOf_0020 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0021
     * @tc.name      Location_LocalityOf_0021
     * @tc.desc      localityOf(localities=[], previous="Hello World_1") returns "Hello World_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_LocalityOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}LocalityOf_0021 begin`);
      const actual: string = localityOf([], 'Hello World_1');
      logInfo(`localityOf(localities=[], previous="Hello...: actual=${actual}`);
      expect(actual).assertEqual('Hello World_1');
      logInfo(`${BUNDLE}LocalityOf_0021 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0022
     * @tc.name      Location_LocalityOf_0022
     * @tc.desc      localityOf(localities=[], previous="xHello World") returns "xHello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocalityOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocalityOf_0022 begin`);
      const actual: string = localityOf([], 'xHello World');
      logInfo(`localityOf(localities=[], previous="xHell...: actual=${actual}`);
      expect(actual).assertEqual('xHello World');
      logInfo(`${BUNDLE}LocalityOf_0022 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0023
     * @tc.name      Location_LocalityOf_0023
     * @tc.desc      localityOf(localities=[], previous="   ") returns "   "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocalityOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocalityOf_0023 begin`);
      const actual: string = localityOf([], '   ');
      logInfo(`localityOf(localities=[], previous="   "): actual=${actual}`);
      expect(actual).assertEqual('   ');
      logInfo(`${BUNDLE}LocalityOf_0023 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0024
     * @tc.name      Location_LocalityOf_0024
     * @tc.desc      localityOf(localities=[], previous="  ") returns "  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_LocalityOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}LocalityOf_0024 begin`);
      const actual: string = localityOf([], '  ');
      logInfo(`localityOf(localities=[], previous="  "): actual=${actual}`);
      expect(actual).assertEqual('  ');
      logInfo(`${BUNDLE}LocalityOf_0024 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0025
     * @tc.name      Location_LocalityOf_0025
     * @tc.desc      localityOf(localities=[""], previous="") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_LocalityOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}LocalityOf_0025 begin`);
      const actual: string = localityOf([''], '');
      logInfo(`localityOf(localities=[""], previous=""): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LocalityOf_0025 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0026
     * @tc.name      Location_LocalityOf_0026
     * @tc.desc      localityOf(localities=[""], previous="x") returns "x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocalityOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocalityOf_0026 begin`);
      const actual: string = localityOf([''], 'x');
      logInfo(`localityOf(localities=[""], previous="x"): actual=${actual}`);
      expect(actual).assertEqual('x');
      logInfo(`${BUNDLE}LocalityOf_0026 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0027
     * @tc.name      Location_LocalityOf_0027
     * @tc.desc      localityOf(localities=[""], previous="a") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0027 begin`);
      const actual: string = localityOf([''], 'a');
      logInfo(`localityOf(localities=[""], previous="a"): actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}LocalityOf_0027 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0028
     * @tc.name      Location_LocalityOf_0028
     * @tc.desc      localityOf(localities=[""], previous="abc") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0028 begin`);
      const actual: string = localityOf([''], 'abc');
      logInfo(`localityOf(localities=[""], previous="abc"): actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}LocalityOf_0028 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0029
     * @tc.name      Location_LocalityOf_0029
     * @tc.desc      localityOf(localities=[""], previous="Hello World") returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0029 begin`);
      const actual: string = localityOf([''], 'Hello World');
      logInfo(`localityOf(localities=[""], previous="Hel...: actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}LocalityOf_0029 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0030
     * @tc.name      Location_LocalityOf_0030
     * @tc.desc      localityOf(localities=[""], previous=" ") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0030 begin`);
      const actual: string = localityOf([''], ' ');
      logInfo(`localityOf(localities=[""], previous=" "): actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}LocalityOf_0030 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0031
     * @tc.name      Location_LocalityOf_0031
     * @tc.desc      localityOf(localities=[""], previous="123") returns "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0031 begin`);
      const actual: string = localityOf([''], '123');
      logInfo(`localityOf(localities=[""], previous="123"): actual=${actual}`);
      expect(actual).assertEqual('123');
      logInfo(`${BUNDLE}LocalityOf_0031 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0032
     * @tc.name      Location_LocalityOf_0032
     * @tc.desc      localityOf(localities=[""], previous=" x ") returns " x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocalityOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocalityOf_0032 begin`);
      const actual: string = localityOf([''], ' x ');
      logInfo(`localityOf(localities=[""], previous=" x "): actual=${actual}`);
      expect(actual).assertEqual(' x ');
      logInfo(`${BUNDLE}LocalityOf_0032 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0033
     * @tc.name      Location_LocalityOf_0033
     * @tc.desc      localityOf(localities=[""], previous="xx") returns "xx"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0033 begin`);
      const actual: string = localityOf([''], 'xx');
      logInfo(`localityOf(localities=[""], previous="xx"): actual=${actual}`);
      expect(actual).assertEqual('xx');
      logInfo(`${BUNDLE}LocalityOf_0033 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0034
     * @tc.name      Location_LocalityOf_0034
     * @tc.desc      localityOf(localities=[""], previous="x_1") returns "x_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0034 begin`);
      const actual: string = localityOf([''], 'x_1');
      logInfo(`localityOf(localities=[""], previous="x_1"): actual=${actual}`);
      expect(actual).assertEqual('x_1');
      logInfo(`${BUNDLE}LocalityOf_0034 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0035
     * @tc.name      Location_LocalityOf_0035
     * @tc.desc      localityOf(localities=[""], previous=" a ") returns " a "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocalityOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocalityOf_0035 begin`);
      const actual: string = localityOf([''], ' a ');
      logInfo(`localityOf(localities=[""], previous=" a "): actual=${actual}`);
      expect(actual).assertEqual(' a ');
      logInfo(`${BUNDLE}LocalityOf_0035 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0036
     * @tc.name      Location_LocalityOf_0036
     * @tc.desc      localityOf(localities=[""], previous="aa") returns "aa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0036 begin`);
      const actual: string = localityOf([''], 'aa');
      logInfo(`localityOf(localities=[""], previous="aa"): actual=${actual}`);
      expect(actual).assertEqual('aa');
      logInfo(`${BUNDLE}LocalityOf_0036 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0037
     * @tc.name      Location_LocalityOf_0037
     * @tc.desc      localityOf(localities=[""], previous="a_1") returns "a_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0037 begin`);
      const actual: string = localityOf([''], 'a_1');
      logInfo(`localityOf(localities=[""], previous="a_1"): actual=${actual}`);
      expect(actual).assertEqual('a_1');
      logInfo(`${BUNDLE}LocalityOf_0037 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0038
     * @tc.name      Location_LocalityOf_0038
     * @tc.desc      localityOf(localities=[""], previous="xa") returns "xa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocalityOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocalityOf_0038 begin`);
      const actual: string = localityOf([''], 'xa');
      logInfo(`localityOf(localities=[""], previous="xa"): actual=${actual}`);
      expect(actual).assertEqual('xa');
      logInfo(`${BUNDLE}LocalityOf_0038 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0039
     * @tc.name      Location_LocalityOf_0039
     * @tc.desc      localityOf(localities=[""], previous=" abc ") returns " abc "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocalityOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocalityOf_0039 begin`);
      const actual: string = localityOf([''], ' abc ');
      logInfo(`localityOf(localities=[""], previous=" ab...: actual=${actual}`);
      expect(actual).assertEqual(' abc ');
      logInfo(`${BUNDLE}LocalityOf_0039 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0040
     * @tc.name      Location_LocalityOf_0040
     * @tc.desc      localityOf(localities=[""], previous="abcabc") returns "abcabc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0040 begin`);
      const actual: string = localityOf([''], 'abcabc');
      logInfo(`localityOf(localities=[""], previous="abc...: actual=${actual}`);
      expect(actual).assertEqual('abcabc');
      logInfo(`${BUNDLE}LocalityOf_0040 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0041
     * @tc.name      Location_LocalityOf_0041
     * @tc.desc      localityOf(localities=[""], previous="abc_1") returns "abc_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0041 begin`);
      const actual: string = localityOf([''], 'abc_1');
      logInfo(`localityOf(localities=[""], previous="abc...: actual=${actual}`);
      expect(actual).assertEqual('abc_1');
      logInfo(`${BUNDLE}LocalityOf_0041 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0042
     * @tc.name      Location_LocalityOf_0042
     * @tc.desc      localityOf(localities=[""], previous="xabc") returns "xabc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocalityOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocalityOf_0042 begin`);
      const actual: string = localityOf([''], 'xabc');
      logInfo(`localityOf(localities=[""], previous="xabc"): actual=${actual}`);
      expect(actual).assertEqual('xabc');
      logInfo(`${BUNDLE}LocalityOf_0042 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0043
     * @tc.name      Location_LocalityOf_0043
     * @tc.desc      localityOf(localities=[""], previous=" Hello World ") returns " Hello World "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocalityOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocalityOf_0043 begin`);
      const actual: string = localityOf([''], ' Hello World ');
      logInfo(`localityOf(localities=[""], previous=" He...: actual=${actual}`);
      expect(actual).assertEqual(' Hello World ');
      logInfo(`${BUNDLE}LocalityOf_0043 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0044
     * @tc.name      Location_LocalityOf_0044
     * @tc.desc      localityOf(localities=[""], previous="Hello WorldHello World") returns "Hello WorldHello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0044 begin`);
      const actual: string = localityOf([''], 'Hello WorldHello World');
      logInfo(`localityOf(localities=[""], previous="Hel...: actual=${actual}`);
      expect(actual).assertEqual('Hello WorldHello World');
      logInfo(`${BUNDLE}LocalityOf_0044 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0045
     * @tc.name      Location_LocalityOf_0045
     * @tc.desc      localityOf(localities=[""], previous="Hello World_1") returns "Hello World_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0045 begin`);
      const actual: string = localityOf([''], 'Hello World_1');
      logInfo(`localityOf(localities=[""], previous="Hel...: actual=${actual}`);
      expect(actual).assertEqual('Hello World_1');
      logInfo(`${BUNDLE}LocalityOf_0045 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0046
     * @tc.name      Location_LocalityOf_0046
     * @tc.desc      localityOf(localities=[""], previous="xHello World") returns "xHello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocalityOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocalityOf_0046 begin`);
      const actual: string = localityOf([''], 'xHello World');
      logInfo(`localityOf(localities=[""], previous="xHe...: actual=${actual}`);
      expect(actual).assertEqual('xHello World');
      logInfo(`${BUNDLE}LocalityOf_0046 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0047
     * @tc.name      Location_LocalityOf_0047
     * @tc.desc      localityOf(localities=[""], previous="   ") returns "   "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocalityOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocalityOf_0047 begin`);
      const actual: string = localityOf([''], '   ');
      logInfo(`localityOf(localities=[""], previous="   "): actual=${actual}`);
      expect(actual).assertEqual('   ');
      logInfo(`${BUNDLE}LocalityOf_0047 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0048
     * @tc.name      Location_LocalityOf_0048
     * @tc.desc      localityOf(localities=[""], previous="  ") returns "  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0048 begin`);
      const actual: string = localityOf([''], '  ');
      logInfo(`localityOf(localities=[""], previous="  "): actual=${actual}`);
      expect(actual).assertEqual('  ');
      logInfo(`${BUNDLE}LocalityOf_0048 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0049
     * @tc.name      Location_LocalityOf_0049
     * @tc.desc      localityOf(localities=["", "x"], previous="") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_LocalityOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}LocalityOf_0049 begin`);
      const actual: string = localityOf(['', 'x'], '');
      logInfo(`localityOf(localities=["", "x"], previous...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LocalityOf_0049 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0050
     * @tc.name      Location_LocalityOf_0050
     * @tc.desc      localityOf(localities=["", "x"], previous="x") returns "x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocalityOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocalityOf_0050 begin`);
      const actual: string = localityOf(['', 'x'], 'x');
      logInfo(`localityOf(localities=["", "x"], previous...: actual=${actual}`);
      expect(actual).assertEqual('x');
      logInfo(`${BUNDLE}LocalityOf_0050 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0051
     * @tc.name      Location_LocalityOf_0051
     * @tc.desc      localityOf(localities=["", "x"], previous="a") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0051 begin`);
      const actual: string = localityOf(['', 'x'], 'a');
      logInfo(`localityOf(localities=["", "x"], previous...: actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}LocalityOf_0051 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0052
     * @tc.name      Location_LocalityOf_0052
     * @tc.desc      localityOf(localities=["", "x"], previous="abc") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0052 begin`);
      const actual: string = localityOf(['', 'x'], 'abc');
      logInfo(`localityOf(localities=["", "x"], previous...: actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}LocalityOf_0052 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0053
     * @tc.name      Location_LocalityOf_0053
     * @tc.desc      localityOf(localities=["", "x"], previous="Hello World") returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0053 begin`);
      const actual: string = localityOf(['', 'x'], 'Hello World');
      logInfo(`localityOf(localities=["", "x"], previous...: actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}LocalityOf_0053 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0054
     * @tc.name      Location_LocalityOf_0054
     * @tc.desc      localityOf(localities=["", "x"], previous=" ") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0054 begin`);
      const actual: string = localityOf(['', 'x'], ' ');
      logInfo(`localityOf(localities=["", "x"], previous...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}LocalityOf_0054 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0055
     * @tc.name      Location_LocalityOf_0055
     * @tc.desc      localityOf(localities=["", "x"], previous="123") returns "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0055 begin`);
      const actual: string = localityOf(['', 'x'], '123');
      logInfo(`localityOf(localities=["", "x"], previous...: actual=${actual}`);
      expect(actual).assertEqual('123');
      logInfo(`${BUNDLE}LocalityOf_0055 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0056
     * @tc.name      Location_LocalityOf_0056
     * @tc.desc      localityOf(localities=["", "x"], previous=" x ") returns " x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocalityOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocalityOf_0056 begin`);
      const actual: string = localityOf(['', 'x'], ' x ');
      logInfo(`localityOf(localities=["", "x"], previous...: actual=${actual}`);
      expect(actual).assertEqual(' x ');
      logInfo(`${BUNDLE}LocalityOf_0056 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0057
     * @tc.name      Location_LocalityOf_0057
     * @tc.desc      localityOf(localities=["", "x"], previous="xx") returns "xx"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0057 begin`);
      const actual: string = localityOf(['', 'x'], 'xx');
      logInfo(`localityOf(localities=["", "x"], previous...: actual=${actual}`);
      expect(actual).assertEqual('xx');
      logInfo(`${BUNDLE}LocalityOf_0057 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0058
     * @tc.name      Location_LocalityOf_0058
     * @tc.desc      localityOf(localities=["", "x"], previous="x_1") returns "x_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0058 begin`);
      const actual: string = localityOf(['', 'x'], 'x_1');
      logInfo(`localityOf(localities=["", "x"], previous...: actual=${actual}`);
      expect(actual).assertEqual('x_1');
      logInfo(`${BUNDLE}LocalityOf_0058 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0059
     * @tc.name      Location_LocalityOf_0059
     * @tc.desc      localityOf(localities=["", "x"], previous=" a ") returns " a "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocalityOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocalityOf_0059 begin`);
      const actual: string = localityOf(['', 'x'], ' a ');
      logInfo(`localityOf(localities=["", "x"], previous...: actual=${actual}`);
      expect(actual).assertEqual(' a ');
      logInfo(`${BUNDLE}LocalityOf_0059 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0060
     * @tc.name      Location_LocalityOf_0060
     * @tc.desc      localityOf(localities=["", "x"], previous="aa") returns "aa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0060 begin`);
      const actual: string = localityOf(['', 'x'], 'aa');
      logInfo(`localityOf(localities=["", "x"], previous...: actual=${actual}`);
      expect(actual).assertEqual('aa');
      logInfo(`${BUNDLE}LocalityOf_0060 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0061
     * @tc.name      Location_LocalityOf_0061
     * @tc.desc      localityOf(localities=["", "x"], previous="a_1") returns "a_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0061 begin`);
      const actual: string = localityOf(['', 'x'], 'a_1');
      logInfo(`localityOf(localities=["", "x"], previous...: actual=${actual}`);
      expect(actual).assertEqual('a_1');
      logInfo(`${BUNDLE}LocalityOf_0061 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0062
     * @tc.name      Location_LocalityOf_0062
     * @tc.desc      localityOf(localities=["", "x"], previous="xa") returns "xa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocalityOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocalityOf_0062 begin`);
      const actual: string = localityOf(['', 'x'], 'xa');
      logInfo(`localityOf(localities=["", "x"], previous...: actual=${actual}`);
      expect(actual).assertEqual('xa');
      logInfo(`${BUNDLE}LocalityOf_0062 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0063
     * @tc.name      Location_LocalityOf_0063
     * @tc.desc      localityOf(localities=["", "x"], previous=" abc ") returns " abc "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocalityOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocalityOf_0063 begin`);
      const actual: string = localityOf(['', 'x'], ' abc ');
      logInfo(`localityOf(localities=["", "x"], previous...: actual=${actual}`);
      expect(actual).assertEqual(' abc ');
      logInfo(`${BUNDLE}LocalityOf_0063 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0064
     * @tc.name      Location_LocalityOf_0064
     * @tc.desc      localityOf(localities=["", "x"], previous="abcabc") returns "abcabc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0064 begin`);
      const actual: string = localityOf(['', 'x'], 'abcabc');
      logInfo(`localityOf(localities=["", "x"], previous...: actual=${actual}`);
      expect(actual).assertEqual('abcabc');
      logInfo(`${BUNDLE}LocalityOf_0064 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0065
     * @tc.name      Location_LocalityOf_0065
     * @tc.desc      localityOf(localities=["", "x"], previous="abc_1") returns "abc_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0065 begin`);
      const actual: string = localityOf(['', 'x'], 'abc_1');
      logInfo(`localityOf(localities=["", "x"], previous...: actual=${actual}`);
      expect(actual).assertEqual('abc_1');
      logInfo(`${BUNDLE}LocalityOf_0065 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0066
     * @tc.name      Location_LocalityOf_0066
     * @tc.desc      localityOf(localities=["", "x"], previous="xabc") returns "xabc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocalityOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocalityOf_0066 begin`);
      const actual: string = localityOf(['', 'x'], 'xabc');
      logInfo(`localityOf(localities=["", "x"], previous...: actual=${actual}`);
      expect(actual).assertEqual('xabc');
      logInfo(`${BUNDLE}LocalityOf_0066 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0067
     * @tc.name      Location_LocalityOf_0067
     * @tc.desc      localityOf(localities=["", "x"], previous=" Hello World ") returns " Hello World "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocalityOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocalityOf_0067 begin`);
      const actual: string = localityOf(['', 'x'], ' Hello World ');
      logInfo(`localityOf(localities=["", "x"], previous...: actual=${actual}`);
      expect(actual).assertEqual(' Hello World ');
      logInfo(`${BUNDLE}LocalityOf_0067 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0068
     * @tc.name      Location_LocalityOf_0068
     * @tc.desc      localityOf(localities=["", "x"], previous="Hello WorldHello World") returns "Hello WorldHello Wo...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0068 begin`);
      const actual: string = localityOf(['', 'x'], 'Hello WorldHello World');
      logInfo(`localityOf(localities=["", "x"], previous...: actual=${actual}`);
      expect(actual).assertEqual('Hello WorldHello World');
      logInfo(`${BUNDLE}LocalityOf_0068 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0069
     * @tc.name      Location_LocalityOf_0069
     * @tc.desc      localityOf(localities=["", "x"], previous="Hello World_1") returns "Hello World_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0069 begin`);
      const actual: string = localityOf(['', 'x'], 'Hello World_1');
      logInfo(`localityOf(localities=["", "x"], previous...: actual=${actual}`);
      expect(actual).assertEqual('Hello World_1');
      logInfo(`${BUNDLE}LocalityOf_0069 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0070
     * @tc.name      Location_LocalityOf_0070
     * @tc.desc      localityOf(localities=["", "x"], previous="xHello World") returns "xHello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocalityOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocalityOf_0070 begin`);
      const actual: string = localityOf(['', 'x'], 'xHello World');
      logInfo(`localityOf(localities=["", "x"], previous...: actual=${actual}`);
      expect(actual).assertEqual('xHello World');
      logInfo(`${BUNDLE}LocalityOf_0070 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0071
     * @tc.name      Location_LocalityOf_0071
     * @tc.desc      localityOf(localities=["", "x"], previous="   ") returns "   "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocalityOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocalityOf_0071 begin`);
      const actual: string = localityOf(['', 'x'], '   ');
      logInfo(`localityOf(localities=["", "x"], previous...: actual=${actual}`);
      expect(actual).assertEqual('   ');
      logInfo(`${BUNDLE}LocalityOf_0071 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0072
     * @tc.name      Location_LocalityOf_0072
     * @tc.desc      localityOf(localities=["", "x"], previous="  ") returns "  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0072 begin`);
      const actual: string = localityOf(['', 'x'], '  ');
      logInfo(`localityOf(localities=["", "x"], previous...: actual=${actual}`);
      expect(actual).assertEqual('  ');
      logInfo(`${BUNDLE}LocalityOf_0072 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0073
     * @tc.name      Location_LocalityOf_0073
     * @tc.desc      localityOf(localities=["x", "", "a"], previous="") returns "x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_LocalityOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}LocalityOf_0073 begin`);
      const actual: string = localityOf(['x', '', 'a'], '');
      logInfo(`localityOf(localities=["x", "", "a"], pre...: actual=${actual}`);
      expect(actual).assertEqual('x');
      logInfo(`${BUNDLE}LocalityOf_0073 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0074
     * @tc.name      Location_LocalityOf_0074
     * @tc.desc      localityOf(localities=["x", "", "a"], previous="x") returns "x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocalityOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocalityOf_0074 begin`);
      const actual: string = localityOf(['x', '', 'a'], 'x');
      logInfo(`localityOf(localities=["x", "", "a"], pre...: actual=${actual}`);
      expect(actual).assertEqual('x');
      logInfo(`${BUNDLE}LocalityOf_0074 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0075
     * @tc.name      Location_LocalityOf_0075
     * @tc.desc      localityOf(localities=["x", "", "a"], previous="a") returns "x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0075 begin`);
      const actual: string = localityOf(['x', '', 'a'], 'a');
      logInfo(`localityOf(localities=["x", "", "a"], pre...: actual=${actual}`);
      expect(actual).assertEqual('x');
      logInfo(`${BUNDLE}LocalityOf_0075 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0076
     * @tc.name      Location_LocalityOf_0076
     * @tc.desc      localityOf(localities=["x", "", "a"], previous="abc") returns "x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0076 begin`);
      const actual: string = localityOf(['x', '', 'a'], 'abc');
      logInfo(`localityOf(localities=["x", "", "a"], pre...: actual=${actual}`);
      expect(actual).assertEqual('x');
      logInfo(`${BUNDLE}LocalityOf_0076 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0077
     * @tc.name      Location_LocalityOf_0077
     * @tc.desc      localityOf(localities=["x", "", "a"], previous="Hello World") returns "x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0077 begin`);
      const actual: string = localityOf(['x', '', 'a'], 'Hello World');
      logInfo(`localityOf(localities=["x", "", "a"], pre...: actual=${actual}`);
      expect(actual).assertEqual('x');
      logInfo(`${BUNDLE}LocalityOf_0077 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0078
     * @tc.name      Location_LocalityOf_0078
     * @tc.desc      localityOf(localities=["x", "", "a"], previous=" ") returns "x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0078 begin`);
      const actual: string = localityOf(['x', '', 'a'], ' ');
      logInfo(`localityOf(localities=["x", "", "a"], pre...: actual=${actual}`);
      expect(actual).assertEqual('x');
      logInfo(`${BUNDLE}LocalityOf_0078 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0079
     * @tc.name      Location_LocalityOf_0079
     * @tc.desc      localityOf(localities=["x", "", "a"], previous="123") returns "x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0079 begin`);
      const actual: string = localityOf(['x', '', 'a'], '123');
      logInfo(`localityOf(localities=["x", "", "a"], pre...: actual=${actual}`);
      expect(actual).assertEqual('x');
      logInfo(`${BUNDLE}LocalityOf_0079 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0080
     * @tc.name      Location_LocalityOf_0080
     * @tc.desc      localityOf(localities=["x", "", "a"], previous=" x ") returns "x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocalityOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocalityOf_0080 begin`);
      const actual: string = localityOf(['x', '', 'a'], ' x ');
      logInfo(`localityOf(localities=["x", "", "a"], pre...: actual=${actual}`);
      expect(actual).assertEqual('x');
      logInfo(`${BUNDLE}LocalityOf_0080 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0081
     * @tc.name      Location_LocalityOf_0081
     * @tc.desc      localityOf(localities=["x", "", "a"], previous="xx") returns "x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0081 begin`);
      const actual: string = localityOf(['x', '', 'a'], 'xx');
      logInfo(`localityOf(localities=["x", "", "a"], pre...: actual=${actual}`);
      expect(actual).assertEqual('x');
      logInfo(`${BUNDLE}LocalityOf_0081 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0082
     * @tc.name      Location_LocalityOf_0082
     * @tc.desc      localityOf(localities=["x", "", "a"], previous="x_1") returns "x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0082 begin`);
      const actual: string = localityOf(['x', '', 'a'], 'x_1');
      logInfo(`localityOf(localities=["x", "", "a"], pre...: actual=${actual}`);
      expect(actual).assertEqual('x');
      logInfo(`${BUNDLE}LocalityOf_0082 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0083
     * @tc.name      Location_LocalityOf_0083
     * @tc.desc      localityOf(localities=["x", "", "a"], previous=" a ") returns "x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocalityOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocalityOf_0083 begin`);
      const actual: string = localityOf(['x', '', 'a'], ' a ');
      logInfo(`localityOf(localities=["x", "", "a"], pre...: actual=${actual}`);
      expect(actual).assertEqual('x');
      logInfo(`${BUNDLE}LocalityOf_0083 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0084
     * @tc.name      Location_LocalityOf_0084
     * @tc.desc      localityOf(localities=["x", "", "a"], previous="aa") returns "x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0084 begin`);
      const actual: string = localityOf(['x', '', 'a'], 'aa');
      logInfo(`localityOf(localities=["x", "", "a"], pre...: actual=${actual}`);
      expect(actual).assertEqual('x');
      logInfo(`${BUNDLE}LocalityOf_0084 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0085
     * @tc.name      Location_LocalityOf_0085
     * @tc.desc      localityOf(localities=["x", "", "a"], previous="a_1") returns "x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0085 begin`);
      const actual: string = localityOf(['x', '', 'a'], 'a_1');
      logInfo(`localityOf(localities=["x", "", "a"], pre...: actual=${actual}`);
      expect(actual).assertEqual('x');
      logInfo(`${BUNDLE}LocalityOf_0085 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0086
     * @tc.name      Location_LocalityOf_0086
     * @tc.desc      localityOf(localities=["x", "", "a"], previous="xa") returns "x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocalityOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocalityOf_0086 begin`);
      const actual: string = localityOf(['x', '', 'a'], 'xa');
      logInfo(`localityOf(localities=["x", "", "a"], pre...: actual=${actual}`);
      expect(actual).assertEqual('x');
      logInfo(`${BUNDLE}LocalityOf_0086 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0087
     * @tc.name      Location_LocalityOf_0087
     * @tc.desc      localityOf(localities=["x", "", "a"], previous=" abc ") returns "x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocalityOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocalityOf_0087 begin`);
      const actual: string = localityOf(['x', '', 'a'], ' abc ');
      logInfo(`localityOf(localities=["x", "", "a"], pre...: actual=${actual}`);
      expect(actual).assertEqual('x');
      logInfo(`${BUNDLE}LocalityOf_0087 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0088
     * @tc.name      Location_LocalityOf_0088
     * @tc.desc      localityOf(localities=["x", "", "a"], previous="abcabc") returns "x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0088 begin`);
      const actual: string = localityOf(['x', '', 'a'], 'abcabc');
      logInfo(`localityOf(localities=["x", "", "a"], pre...: actual=${actual}`);
      expect(actual).assertEqual('x');
      logInfo(`${BUNDLE}LocalityOf_0088 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0089
     * @tc.name      Location_LocalityOf_0089
     * @tc.desc      localityOf(localities=["x", "", "a"], previous="abc_1") returns "x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0089 begin`);
      const actual: string = localityOf(['x', '', 'a'], 'abc_1');
      logInfo(`localityOf(localities=["x", "", "a"], pre...: actual=${actual}`);
      expect(actual).assertEqual('x');
      logInfo(`${BUNDLE}LocalityOf_0089 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0090
     * @tc.name      Location_LocalityOf_0090
     * @tc.desc      localityOf(localities=["x", "", "a"], previous="xabc") returns "x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocalityOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocalityOf_0090 begin`);
      const actual: string = localityOf(['x', '', 'a'], 'xabc');
      logInfo(`localityOf(localities=["x", "", "a"], pre...: actual=${actual}`);
      expect(actual).assertEqual('x');
      logInfo(`${BUNDLE}LocalityOf_0090 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0091
     * @tc.name      Location_LocalityOf_0091
     * @tc.desc      localityOf(localities=["x", "", "a"], previous=" Hello World ") returns "x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocalityOf_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocalityOf_0091 begin`);
      const actual: string = localityOf(['x', '', 'a'], ' Hello World ');
      logInfo(`localityOf(localities=["x", "", "a"], pre...: actual=${actual}`);
      expect(actual).assertEqual('x');
      logInfo(`${BUNDLE}LocalityOf_0091 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0092
     * @tc.name      Location_LocalityOf_0092
     * @tc.desc      localityOf(localities=["x", "", "a"], previous="Hello WorldHello World") returns "x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0092 begin`);
      const actual: string = localityOf(['x', '', 'a'], 'Hello WorldHello World');
      logInfo(`localityOf(localities=["x", "", "a"], pre...: actual=${actual}`);
      expect(actual).assertEqual('x');
      logInfo(`${BUNDLE}LocalityOf_0092 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0093
     * @tc.name      Location_LocalityOf_0093
     * @tc.desc      localityOf(localities=["x", "", "a"], previous="Hello World_1") returns "x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0093 begin`);
      const actual: string = localityOf(['x', '', 'a'], 'Hello World_1');
      logInfo(`localityOf(localities=["x", "", "a"], pre...: actual=${actual}`);
      expect(actual).assertEqual('x');
      logInfo(`${BUNDLE}LocalityOf_0093 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0094
     * @tc.name      Location_LocalityOf_0094
     * @tc.desc      localityOf(localities=["x", "", "a"], previous="xHello World") returns "x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocalityOf_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocalityOf_0094 begin`);
      const actual: string = localityOf(['x', '', 'a'], 'xHello World');
      logInfo(`localityOf(localities=["x", "", "a"], pre...: actual=${actual}`);
      expect(actual).assertEqual('x');
      logInfo(`${BUNDLE}LocalityOf_0094 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0095
     * @tc.name      Location_LocalityOf_0095
     * @tc.desc      localityOf(localities=["x", "", "a"], previous="   ") returns "x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocalityOf_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocalityOf_0095 begin`);
      const actual: string = localityOf(['x', '', 'a'], '   ');
      logInfo(`localityOf(localities=["x", "", "a"], pre...: actual=${actual}`);
      expect(actual).assertEqual('x');
      logInfo(`${BUNDLE}LocalityOf_0095 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCALITY_OF_0096
     * @tc.name      Location_LocalityOf_0096
     * @tc.desc      localityOf(localities=["x", "", "a"], previous="  ") returns "x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocalityOf_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocalityOf_0096 begin`);
      const actual: string = localityOf(['x', '', 'a'], '  ');
      logInfo(`localityOf(localities=["x", "", "a"], pre...: actual=${actual}`);
      expect(actual).assertEqual('x');
      logInfo(`${BUNDLE}LocalityOf_0096 end`);
    });
  });
}
