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
export default function submitValueOfTest(): void {
  describe('SubmitValueOfTest', () => {
    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0001
     * @tc.name      CitySearch_SubmitValueOf_0001
     * @tc.desc      submitValueOf(value="Hello", placeholder="") returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_SubmitValueOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0001 begin`);
      const actual: string = submitValueOf('Hello', '');
      logInfo(`submitValueOf(value="Hello", placeholder=""): actual=${actual}`);
      expect(actual).assertEqual('Hello');
      logInfo(`${BUNDLE}SubmitValueOf_0001 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0002
     * @tc.name      CitySearch_SubmitValueOf_0002
     * @tc.desc      submitValueOf(value="hello world", placeholder="") returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_SubmitValueOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0002 begin`);
      const actual: string = submitValueOf('hello world', '');
      logInfo(`submitValueOf(value="hello world", placeh...: actual=${actual}`);
      expect(actual).assertEqual('hello world');
      logInfo(`${BUNDLE}SubmitValueOf_0002 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0003
     * @tc.name      CitySearch_SubmitValueOf_0003
     * @tc.desc      submitValueOf(value="", placeholder="") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0003 begin`);
      const actual: string = submitValueOf('', '');
      logInfo(`submitValueOf(value="", placeholder=""): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}SubmitValueOf_0003 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0004
     * @tc.name      CitySearch_SubmitValueOf_0004
     * @tc.desc      submitValueOf(value="", placeholder="a") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0004 begin`);
      const actual: string = submitValueOf('', 'a');
      logInfo(`submitValueOf(value="", placeholder="a"): actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}SubmitValueOf_0004 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0005
     * @tc.name      CitySearch_SubmitValueOf_0005
     * @tc.desc      submitValueOf(value="", placeholder="abc") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0005 begin`);
      const actual: string = submitValueOf('', 'abc');
      logInfo(`submitValueOf(value="", placeholder="abc"): actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}SubmitValueOf_0005 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0006
     * @tc.name      CitySearch_SubmitValueOf_0006
     * @tc.desc      submitValueOf(value="", placeholder="Hello World") returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0006 begin`);
      const actual: string = submitValueOf('', 'Hello World');
      logInfo(`submitValueOf(value="", placeholder="Hell...: actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}SubmitValueOf_0006 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0007
     * @tc.name      CitySearch_SubmitValueOf_0007
     * @tc.desc      submitValueOf(value="", placeholder=" ") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0007 begin`);
      const actual: string = submitValueOf('', ' ');
      logInfo(`submitValueOf(value="", placeholder=" "): actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}SubmitValueOf_0007 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0008
     * @tc.name      CitySearch_SubmitValueOf_0008
     * @tc.desc      submitValueOf(value="", placeholder="123") returns "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0008 begin`);
      const actual: string = submitValueOf('', '123');
      logInfo(`submitValueOf(value="", placeholder="123"): actual=${actual}`);
      expect(actual).assertEqual('123');
      logInfo(`${BUNDLE}SubmitValueOf_0008 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0009
     * @tc.name      CitySearch_SubmitValueOf_0009
     * @tc.desc      submitValueOf(value="", placeholder=" a ") returns " a "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0009 begin`);
      const actual: string = submitValueOf('', ' a ');
      logInfo(`submitValueOf(value="", placeholder=" a "): actual=${actual}`);
      expect(actual).assertEqual(' a ');
      logInfo(`${BUNDLE}SubmitValueOf_0009 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0010
     * @tc.name      CitySearch_SubmitValueOf_0010
     * @tc.desc      submitValueOf(value="", placeholder="aa") returns "aa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0010 begin`);
      const actual: string = submitValueOf('', 'aa');
      logInfo(`submitValueOf(value="", placeholder="aa"): actual=${actual}`);
      expect(actual).assertEqual('aa');
      logInfo(`${BUNDLE}SubmitValueOf_0010 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0011
     * @tc.name      CitySearch_SubmitValueOf_0011
     * @tc.desc      submitValueOf(value="", placeholder="a_1") returns "a_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0011 begin`);
      const actual: string = submitValueOf('', 'a_1');
      logInfo(`submitValueOf(value="", placeholder="a_1"): actual=${actual}`);
      expect(actual).assertEqual('a_1');
      logInfo(`${BUNDLE}SubmitValueOf_0011 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0012
     * @tc.name      CitySearch_SubmitValueOf_0012
     * @tc.desc      submitValueOf(value="", placeholder="xa") returns "xa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0012 begin`);
      const actual: string = submitValueOf('', 'xa');
      logInfo(`submitValueOf(value="", placeholder="xa"): actual=${actual}`);
      expect(actual).assertEqual('xa');
      logInfo(`${BUNDLE}SubmitValueOf_0012 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0013
     * @tc.name      CitySearch_SubmitValueOf_0013
     * @tc.desc      submitValueOf(value="", placeholder=" abc ") returns " abc "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0013 begin`);
      const actual: string = submitValueOf('', ' abc ');
      logInfo(`submitValueOf(value="", placeholder=" abc "): actual=${actual}`);
      expect(actual).assertEqual(' abc ');
      logInfo(`${BUNDLE}SubmitValueOf_0013 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0014
     * @tc.name      CitySearch_SubmitValueOf_0014
     * @tc.desc      submitValueOf(value="", placeholder="abcabc") returns "abcabc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0014 begin`);
      const actual: string = submitValueOf('', 'abcabc');
      logInfo(`submitValueOf(value="", placeholder="abca...: actual=${actual}`);
      expect(actual).assertEqual('abcabc');
      logInfo(`${BUNDLE}SubmitValueOf_0014 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0015
     * @tc.name      CitySearch_SubmitValueOf_0015
     * @tc.desc      submitValueOf(value="", placeholder="abc_1") returns "abc_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0015 begin`);
      const actual: string = submitValueOf('', 'abc_1');
      logInfo(`submitValueOf(value="", placeholder="abc_1"): actual=${actual}`);
      expect(actual).assertEqual('abc_1');
      logInfo(`${BUNDLE}SubmitValueOf_0015 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0016
     * @tc.name      CitySearch_SubmitValueOf_0016
     * @tc.desc      submitValueOf(value="", placeholder="xabc") returns "xabc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0016 begin`);
      const actual: string = submitValueOf('', 'xabc');
      logInfo(`submitValueOf(value="", placeholder="xabc"): actual=${actual}`);
      expect(actual).assertEqual('xabc');
      logInfo(`${BUNDLE}SubmitValueOf_0016 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0017
     * @tc.name      CitySearch_SubmitValueOf_0017
     * @tc.desc      submitValueOf(value="", placeholder=" Hello World ") returns " Hello World "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0017 begin`);
      const actual: string = submitValueOf('', ' Hello World ');
      logInfo(`submitValueOf(value="", placeholder=" Hel...: actual=${actual}`);
      expect(actual).assertEqual(' Hello World ');
      logInfo(`${BUNDLE}SubmitValueOf_0017 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0018
     * @tc.name      CitySearch_SubmitValueOf_0018
     * @tc.desc      submitValueOf(value="", placeholder="Hello WorldHello World") returns "Hello WorldHello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0018 begin`);
      const actual: string = submitValueOf('', 'Hello WorldHello World');
      logInfo(`submitValueOf(value="", placeholder="Hell...: actual=${actual}`);
      expect(actual).assertEqual('Hello WorldHello World');
      logInfo(`${BUNDLE}SubmitValueOf_0018 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0019
     * @tc.name      CitySearch_SubmitValueOf_0019
     * @tc.desc      submitValueOf(value="", placeholder="Hello World_1") returns "Hello World_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0019 begin`);
      const actual: string = submitValueOf('', 'Hello World_1');
      logInfo(`submitValueOf(value="", placeholder="Hell...: actual=${actual}`);
      expect(actual).assertEqual('Hello World_1');
      logInfo(`${BUNDLE}SubmitValueOf_0019 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0020
     * @tc.name      CitySearch_SubmitValueOf_0020
     * @tc.desc      submitValueOf(value="", placeholder="xHello World") returns "xHello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0020 begin`);
      const actual: string = submitValueOf('', 'xHello World');
      logInfo(`submitValueOf(value="", placeholder="xHel...: actual=${actual}`);
      expect(actual).assertEqual('xHello World');
      logInfo(`${BUNDLE}SubmitValueOf_0020 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0021
     * @tc.name      CitySearch_SubmitValueOf_0021
     * @tc.desc      submitValueOf(value="", placeholder="   ") returns "   "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0021 begin`);
      const actual: string = submitValueOf('', '   ');
      logInfo(`submitValueOf(value="", placeholder="   "): actual=${actual}`);
      expect(actual).assertEqual('   ');
      logInfo(`${BUNDLE}SubmitValueOf_0021 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0022
     * @tc.name      CitySearch_SubmitValueOf_0022
     * @tc.desc      submitValueOf(value="", placeholder="  ") returns "  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0022 begin`);
      const actual: string = submitValueOf('', '  ');
      logInfo(`submitValueOf(value="", placeholder="  "): actual=${actual}`);
      expect(actual).assertEqual('  ');
      logInfo(`${BUNDLE}SubmitValueOf_0022 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0023
     * @tc.name      CitySearch_SubmitValueOf_0023
     * @tc.desc      submitValueOf(value="", placeholder=" _1") returns " _1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0023 begin`);
      const actual: string = submitValueOf('', ' _1');
      logInfo(`submitValueOf(value="", placeholder=" _1"): actual=${actual}`);
      expect(actual).assertEqual(' _1');
      logInfo(`${BUNDLE}SubmitValueOf_0023 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0024
     * @tc.name      CitySearch_SubmitValueOf_0024
     * @tc.desc      submitValueOf(value="", placeholder="x ") returns "x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0024 begin`);
      const actual: string = submitValueOf('', 'x ');
      logInfo(`submitValueOf(value="", placeholder="x "): actual=${actual}`);
      expect(actual).assertEqual('x ');
      logInfo(`${BUNDLE}SubmitValueOf_0024 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0025
     * @tc.name      CitySearch_SubmitValueOf_0025
     * @tc.desc      submitValueOf(value="", placeholder=" 123 ") returns " 123 "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0025 begin`);
      const actual: string = submitValueOf('', ' 123 ');
      logInfo(`submitValueOf(value="", placeholder=" 123 "): actual=${actual}`);
      expect(actual).assertEqual(' 123 ');
      logInfo(`${BUNDLE}SubmitValueOf_0025 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0026
     * @tc.name      CitySearch_SubmitValueOf_0026
     * @tc.desc      submitValueOf(value="", placeholder="123123") returns "123123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0026 begin`);
      const actual: string = submitValueOf('', '123123');
      logInfo(`submitValueOf(value="", placeholder="1231...: actual=${actual}`);
      expect(actual).assertEqual('123123');
      logInfo(`${BUNDLE}SubmitValueOf_0026 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0027
     * @tc.name      CitySearch_SubmitValueOf_0027
     * @tc.desc      submitValueOf(value="", placeholder="123_1") returns "123_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0027 begin`);
      const actual: string = submitValueOf('', '123_1');
      logInfo(`submitValueOf(value="", placeholder="123_1"): actual=${actual}`);
      expect(actual).assertEqual('123_1');
      logInfo(`${BUNDLE}SubmitValueOf_0027 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0028
     * @tc.name      CitySearch_SubmitValueOf_0028
     * @tc.desc      submitValueOf(value="", placeholder="x123") returns "x123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0028 begin`);
      const actual: string = submitValueOf('', 'x123');
      logInfo(`submitValueOf(value="", placeholder="x123"): actual=${actual}`);
      expect(actual).assertEqual('x123');
      logInfo(`${BUNDLE}SubmitValueOf_0028 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0029
     * @tc.name      CitySearch_SubmitValueOf_0029
     * @tc.desc      submitValueOf(value="", placeholder="1yiYDipj") returns "1yiYDipj"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0029 begin`);
      const actual: string = submitValueOf('', '1yiYDipj');
      logInfo(`submitValueOf(value="", placeholder="1yiY...: actual=${actual}`);
      expect(actual).assertEqual('1yiYDipj');
      logInfo(`${BUNDLE}SubmitValueOf_0029 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0030
     * @tc.name      CitySearch_SubmitValueOf_0030
     * @tc.desc      submitValueOf(value="", placeholder="4UfKKj") returns "4UfKKj"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0030 begin`);
      const actual: string = submitValueOf('', '4UfKKj');
      logInfo(`submitValueOf(value="", placeholder="4UfK...: actual=${actual}`);
      expect(actual).assertEqual('4UfKKj');
      logInfo(`${BUNDLE}SubmitValueOf_0030 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0031
     * @tc.name      CitySearch_SubmitValueOf_0031
     * @tc.desc      submitValueOf(value="", placeholder="Q8") returns "Q8"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0031 begin`);
      const actual: string = submitValueOf('', 'Q8');
      logInfo(`submitValueOf(value="", placeholder="Q8"): actual=${actual}`);
      expect(actual).assertEqual('Q8');
      logInfo(`${BUNDLE}SubmitValueOf_0031 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0032
     * @tc.name      CitySearch_SubmitValueOf_0032
     * @tc.desc      submitValueOf(value="", placeholder="nfWpMiFnCe") returns "nfWpMiFnCe"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0032 begin`);
      const actual: string = submitValueOf('', 'nfWpMiFnCe');
      logInfo(`submitValueOf(value="", placeholder="nfWp...: actual=${actual}`);
      expect(actual).assertEqual('nfWpMiFnCe');
      logInfo(`${BUNDLE}SubmitValueOf_0032 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0033
     * @tc.name      CitySearch_SubmitValueOf_0033
     * @tc.desc      submitValueOf(value="", placeholder="45gcO") returns "45gcO"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0033 begin`);
      const actual: string = submitValueOf('', '45gcO');
      logInfo(`submitValueOf(value="", placeholder="45gcO"): actual=${actual}`);
      expect(actual).assertEqual('45gcO');
      logInfo(`${BUNDLE}SubmitValueOf_0033 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0034
     * @tc.name      CitySearch_SubmitValueOf_0034
     * @tc.desc      submitValueOf(value="", placeholder="Br") returns "Br"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0034 begin`);
      const actual: string = submitValueOf('', 'Br');
      logInfo(`submitValueOf(value="", placeholder="Br"): actual=${actual}`);
      expect(actual).assertEqual('Br');
      logInfo(`${BUNDLE}SubmitValueOf_0034 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0035
     * @tc.name      CitySearch_SubmitValueOf_0035
     * @tc.desc      submitValueOf(value="", placeholder="S4nwI2C") returns "S4nwI2C"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0035 begin`);
      const actual: string = submitValueOf('', 'S4nwI2C');
      logInfo(`submitValueOf(value="", placeholder="S4nw...: actual=${actual}`);
      expect(actual).assertEqual('S4nwI2C');
      logInfo(`${BUNDLE}SubmitValueOf_0035 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0036
     * @tc.name      CitySearch_SubmitValueOf_0036
     * @tc.desc      submitValueOf(value="", placeholder="1k8F") returns "1k8F"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0036 begin`);
      const actual: string = submitValueOf('', '1k8F');
      logInfo(`submitValueOf(value="", placeholder="1k8F"): actual=${actual}`);
      expect(actual).assertEqual('1k8F');
      logInfo(`${BUNDLE}SubmitValueOf_0036 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0037
     * @tc.name      CitySearch_SubmitValueOf_0037
     * @tc.desc      submitValueOf(value="", placeholder="J68Wrt1IGFi7") returns "J68Wrt1IGFi7"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0037 begin`);
      const actual: string = submitValueOf('', 'J68Wrt1IGFi7');
      logInfo(`submitValueOf(value="", placeholder="J68W...: actual=${actual}`);
      expect(actual).assertEqual('J68Wrt1IGFi7');
      logInfo(`${BUNDLE}SubmitValueOf_0037 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0038
     * @tc.name      CitySearch_SubmitValueOf_0038
     * @tc.desc      submitValueOf(value="", placeholder="Fcr") returns "Fcr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0038 begin`);
      const actual: string = submitValueOf('', 'Fcr');
      logInfo(`submitValueOf(value="", placeholder="Fcr"): actual=${actual}`);
      expect(actual).assertEqual('Fcr');
      logInfo(`${BUNDLE}SubmitValueOf_0038 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0039
     * @tc.name      CitySearch_SubmitValueOf_0039
     * @tc.desc      submitValueOf(value="", placeholder="PqZ8ye") returns "PqZ8ye"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0039 begin`);
      const actual: string = submitValueOf('', 'PqZ8ye');
      logInfo(`submitValueOf(value="", placeholder="PqZ8...: actual=${actual}`);
      expect(actual).assertEqual('PqZ8ye');
      logInfo(`${BUNDLE}SubmitValueOf_0039 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0040
     * @tc.name      CitySearch_SubmitValueOf_0040
     * @tc.desc      submitValueOf(value="", placeholder="hyJZ1X") returns "hyJZ1X"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0040 begin`);
      const actual: string = submitValueOf('', 'hyJZ1X');
      logInfo(`submitValueOf(value="", placeholder="hyJZ...: actual=${actual}`);
      expect(actual).assertEqual('hyJZ1X');
      logInfo(`${BUNDLE}SubmitValueOf_0040 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0041
     * @tc.name      CitySearch_SubmitValueOf_0041
     * @tc.desc      submitValueOf(value="", placeholder="AAZGWesb") returns "AAZGWesb"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0041 begin`);
      const actual: string = submitValueOf('', 'AAZGWesb');
      logInfo(`submitValueOf(value="", placeholder="AAZG...: actual=${actual}`);
      expect(actual).assertEqual('AAZGWesb');
      logInfo(`${BUNDLE}SubmitValueOf_0041 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0042
     * @tc.name      CitySearch_SubmitValueOf_0042
     * @tc.desc      submitValueOf(value="", placeholder="M") returns "M"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0042 begin`);
      const actual: string = submitValueOf('', 'M');
      logInfo(`submitValueOf(value="", placeholder="M"): actual=${actual}`);
      expect(actual).assertEqual('M');
      logInfo(`${BUNDLE}SubmitValueOf_0042 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0043
     * @tc.name      CitySearch_SubmitValueOf_0043
     * @tc.desc      submitValueOf(value="", placeholder="NnBEpA1PeFW") returns "NnBEpA1PeFW"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0043 begin`);
      const actual: string = submitValueOf('', 'NnBEpA1PeFW');
      logInfo(`submitValueOf(value="", placeholder="NnBE...: actual=${actual}`);
      expect(actual).assertEqual('NnBEpA1PeFW');
      logInfo(`${BUNDLE}SubmitValueOf_0043 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0044
     * @tc.name      CitySearch_SubmitValueOf_0044
     * @tc.desc      submitValueOf(value="", placeholder="lL9A6v2eCpr") returns "lL9A6v2eCpr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0044 begin`);
      const actual: string = submitValueOf('', 'lL9A6v2eCpr');
      logInfo(`submitValueOf(value="", placeholder="lL9A...: actual=${actual}`);
      expect(actual).assertEqual('lL9A6v2eCpr');
      logInfo(`${BUNDLE}SubmitValueOf_0044 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0045
     * @tc.name      CitySearch_SubmitValueOf_0045
     * @tc.desc      submitValueOf(value="", placeholder="jtXz3X") returns "jtXz3X"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0045 begin`);
      const actual: string = submitValueOf('', 'jtXz3X');
      logInfo(`submitValueOf(value="", placeholder="jtXz...: actual=${actual}`);
      expect(actual).assertEqual('jtXz3X');
      logInfo(`${BUNDLE}SubmitValueOf_0045 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0046
     * @tc.name      CitySearch_SubmitValueOf_0046
     * @tc.desc      submitValueOf(value="", placeholder="aA5LOQkoOgD8") returns "aA5LOQkoOgD8"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0046 begin`);
      const actual: string = submitValueOf('', 'aA5LOQkoOgD8');
      logInfo(`submitValueOf(value="", placeholder="aA5L...: actual=${actual}`);
      expect(actual).assertEqual('aA5LOQkoOgD8');
      logInfo(`${BUNDLE}SubmitValueOf_0046 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0047
     * @tc.name      CitySearch_SubmitValueOf_0047
     * @tc.desc      submitValueOf(value="", placeholder="ixNlT6jmrr5r") returns "ixNlT6jmrr5r"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0047 begin`);
      const actual: string = submitValueOf('', 'ixNlT6jmrr5r');
      logInfo(`submitValueOf(value="", placeholder="ixNl...: actual=${actual}`);
      expect(actual).assertEqual('ixNlT6jmrr5r');
      logInfo(`${BUNDLE}SubmitValueOf_0047 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0048
     * @tc.name      CitySearch_SubmitValueOf_0048
     * @tc.desc      submitValueOf(value="", placeholder="KJzqE") returns "KJzqE"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0048 begin`);
      const actual: string = submitValueOf('', 'KJzqE');
      logInfo(`submitValueOf(value="", placeholder="KJzqE"): actual=${actual}`);
      expect(actual).assertEqual('KJzqE');
      logInfo(`${BUNDLE}SubmitValueOf_0048 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0049
     * @tc.name      CitySearch_SubmitValueOf_0049
     * @tc.desc      submitValueOf(value="", placeholder="ecWgoCV1fWD") returns "ecWgoCV1fWD"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0049 begin`);
      const actual: string = submitValueOf('', 'ecWgoCV1fWD');
      logInfo(`submitValueOf(value="", placeholder="ecWg...: actual=${actual}`);
      expect(actual).assertEqual('ecWgoCV1fWD');
      logInfo(`${BUNDLE}SubmitValueOf_0049 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0050
     * @tc.name      CitySearch_SubmitValueOf_0050
     * @tc.desc      submitValueOf(value="", placeholder="lz0Ex") returns "lz0Ex"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0050 begin`);
      const actual: string = submitValueOf('', 'lz0Ex');
      logInfo(`submitValueOf(value="", placeholder="lz0Ex"): actual=${actual}`);
      expect(actual).assertEqual('lz0Ex');
      logInfo(`${BUNDLE}SubmitValueOf_0050 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0051
     * @tc.name      CitySearch_SubmitValueOf_0051
     * @tc.desc      submitValueOf(value="A", placeholder="") returns "A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0051 begin`);
      const actual: string = submitValueOf('A', '');
      logInfo(`submitValueOf(value="A", placeholder=""): actual=${actual}`);
      expect(actual).assertEqual('A');
      logInfo(`${BUNDLE}SubmitValueOf_0051 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0052
     * @tc.name      CitySearch_SubmitValueOf_0052
     * @tc.desc      submitValueOf(value="Sample Title 123", placeholder="") returns "Sample Title 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0052 begin`);
      const actual: string = submitValueOf('Sample Title 123', '');
      logInfo(`submitValueOf(value="Sample Title 123", p...: actual=${actual}`);
      expect(actual).assertEqual('Sample Title 123');
      logInfo(`${BUNDLE}SubmitValueOf_0052 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0053
     * @tc.name      CitySearch_SubmitValueOf_0053
     * @tc.desc      submitValueOf(value="??", placeholder="") returns "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0053 begin`);
      const actual: string = submitValueOf('\u4e2d\u6587', '');
      logInfo(`submitValueOf(value="??", placeholder=""): actual=${actual}`);
      expect(actual).assertEqual('\u4e2d\u6587');
      logInfo(`${BUNDLE}SubmitValueOf_0053 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0054
     * @tc.name      CitySearch_SubmitValueOf_0054
     * @tc.desc      submitValueOf(value=" Hello ", placeholder="") returns " Hello "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0054 begin`);
      const actual: string = submitValueOf(' Hello ', '');
      logInfo(`submitValueOf(value=" Hello ", placeholde...: actual=${actual}`);
      expect(actual).assertEqual(' Hello ');
      logInfo(`${BUNDLE}SubmitValueOf_0054 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0055
     * @tc.name      CitySearch_SubmitValueOf_0055
     * @tc.desc      submitValueOf(value="HelloHello", placeholder="") returns "HelloHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0055 begin`);
      const actual: string = submitValueOf('HelloHello', '');
      logInfo(`submitValueOf(value="HelloHello", placeho...: actual=${actual}`);
      expect(actual).assertEqual('HelloHello');
      logInfo(`${BUNDLE}SubmitValueOf_0055 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0056
     * @tc.name      CitySearch_SubmitValueOf_0056
     * @tc.desc      submitValueOf(value="Hello_1", placeholder="") returns "Hello_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0056 begin`);
      const actual: string = submitValueOf('Hello_1', '');
      logInfo(`submitValueOf(value="Hello_1", placeholde...: actual=${actual}`);
      expect(actual).assertEqual('Hello_1');
      logInfo(`${BUNDLE}SubmitValueOf_0056 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0057
     * @tc.name      CitySearch_SubmitValueOf_0057
     * @tc.desc      submitValueOf(value="xHello", placeholder="") returns "xHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0057 begin`);
      const actual: string = submitValueOf('xHello', '');
      logInfo(`submitValueOf(value="xHello", placeholder...: actual=${actual}`);
      expect(actual).assertEqual('xHello');
      logInfo(`${BUNDLE}SubmitValueOf_0057 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0058
     * @tc.name      CitySearch_SubmitValueOf_0058
     * @tc.desc      submitValueOf(value=" hello world ", placeholder="") returns " hello world "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0058 begin`);
      const actual: string = submitValueOf(' hello world ', '');
      logInfo(`submitValueOf(value=" hello world ", plac...: actual=${actual}`);
      expect(actual).assertEqual(' hello world ');
      logInfo(`${BUNDLE}SubmitValueOf_0058 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0059
     * @tc.name      CitySearch_SubmitValueOf_0059
     * @tc.desc      submitValueOf(value="hello worldhello world", placeholder="") returns "hello worldhello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0059 begin`);
      const actual: string = submitValueOf('hello worldhello world', '');
      logInfo(`submitValueOf(value="hello worldhello wor...: actual=${actual}`);
      expect(actual).assertEqual('hello worldhello world');
      logInfo(`${BUNDLE}SubmitValueOf_0059 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0060
     * @tc.name      CitySearch_SubmitValueOf_0060
     * @tc.desc      submitValueOf(value="hello world_1", placeholder="") returns "hello world_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0060 begin`);
      const actual: string = submitValueOf('hello world_1', '');
      logInfo(`submitValueOf(value="hello world_1", plac...: actual=${actual}`);
      expect(actual).assertEqual('hello world_1');
      logInfo(`${BUNDLE}SubmitValueOf_0060 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0061
     * @tc.name      CitySearch_SubmitValueOf_0061
     * @tc.desc      submitValueOf(value="xhello world", placeholder="") returns "xhello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0061 begin`);
      const actual: string = submitValueOf('xhello world', '');
      logInfo(`submitValueOf(value="xhello world", place...: actual=${actual}`);
      expect(actual).assertEqual('xhello world');
      logInfo(`${BUNDLE}SubmitValueOf_0061 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0062
     * @tc.name      CitySearch_SubmitValueOf_0062
     * @tc.desc      submitValueOf(value=" A ", placeholder="") returns " A "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0062 begin`);
      const actual: string = submitValueOf(' A ', '');
      logInfo(`submitValueOf(value=" A ", placeholder=""): actual=${actual}`);
      expect(actual).assertEqual(' A ');
      logInfo(`${BUNDLE}SubmitValueOf_0062 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0063
     * @tc.name      CitySearch_SubmitValueOf_0063
     * @tc.desc      submitValueOf(value="AA", placeholder="") returns "AA"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0063 begin`);
      const actual: string = submitValueOf('AA', '');
      logInfo(`submitValueOf(value="AA", placeholder=""): actual=${actual}`);
      expect(actual).assertEqual('AA');
      logInfo(`${BUNDLE}SubmitValueOf_0063 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0064
     * @tc.name      CitySearch_SubmitValueOf_0064
     * @tc.desc      submitValueOf(value="A_1", placeholder="") returns "A_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0064 begin`);
      const actual: string = submitValueOf('A_1', '');
      logInfo(`submitValueOf(value="A_1", placeholder=""): actual=${actual}`);
      expect(actual).assertEqual('A_1');
      logInfo(`${BUNDLE}SubmitValueOf_0064 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0065
     * @tc.name      CitySearch_SubmitValueOf_0065
     * @tc.desc      submitValueOf(value="xA", placeholder="") returns "xA"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0065 begin`);
      const actual: string = submitValueOf('xA', '');
      logInfo(`submitValueOf(value="xA", placeholder=""): actual=${actual}`);
      expect(actual).assertEqual('xA');
      logInfo(`${BUNDLE}SubmitValueOf_0065 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0066
     * @tc.name      CitySearch_SubmitValueOf_0066
     * @tc.desc      submitValueOf(value=" Sample Title 123 ", placeholder="") returns " Sample Title 123 "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0066 begin`);
      const actual: string = submitValueOf(' Sample Title 123 ', '');
      logInfo(`submitValueOf(value=" Sample Title 123 ",...: actual=${actual}`);
      expect(actual).assertEqual(' Sample Title 123 ');
      logInfo(`${BUNDLE}SubmitValueOf_0066 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0067
     * @tc.name      CitySearch_SubmitValueOf_0067
     * @tc.desc      submitValueOf(value="Sample Title 123Sample Title 123", placeholder="") returns "Sample Title 12...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0067 begin`);
      const actual: string = submitValueOf('Sample Title 123Sample Title 123', '');
      logInfo(`submitValueOf(value="Sample Title 123Samp...: actual=${actual}`);
      expect(actual).assertEqual('Sample Title 123Sample Title 123');
      logInfo(`${BUNDLE}SubmitValueOf_0067 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0068
     * @tc.name      CitySearch_SubmitValueOf_0068
     * @tc.desc      submitValueOf(value="Sample Title 123_1", placeholder="") returns "Sample Title 123_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0068 begin`);
      const actual: string = submitValueOf('Sample Title 123_1', '');
      logInfo(`submitValueOf(value="Sample Title 123_1",...: actual=${actual}`);
      expect(actual).assertEqual('Sample Title 123_1');
      logInfo(`${BUNDLE}SubmitValueOf_0068 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0069
     * @tc.name      CitySearch_SubmitValueOf_0069
     * @tc.desc      submitValueOf(value="xSample Title 123", placeholder="") returns "xSample Title 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0069 begin`);
      const actual: string = submitValueOf('xSample Title 123', '');
      logInfo(`submitValueOf(value="xSample Title 123", ...: actual=${actual}`);
      expect(actual).assertEqual('xSample Title 123');
      logInfo(`${BUNDLE}SubmitValueOf_0069 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0070
     * @tc.name      CitySearch_SubmitValueOf_0070
     * @tc.desc      submitValueOf(value=" ?? ", placeholder="") returns " ?? "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0070 begin`);
      const actual: string = submitValueOf(' \u4e2d\u6587 ', '');
      logInfo(`submitValueOf(value=" ?? ", placeholder=""): actual=${actual}`);
      expect(actual).assertEqual(' \u4e2d\u6587 ');
      logInfo(`${BUNDLE}SubmitValueOf_0070 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0071
     * @tc.name      CitySearch_SubmitValueOf_0071
     * @tc.desc      submitValueOf(value="????", placeholder="") returns "????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0071 begin`);
      const actual: string = submitValueOf('\u4e2d\u6587\u4e2d\u6587', '');
      logInfo(`submitValueOf(value="????", placeholder=""): actual=${actual}`);
      expect(actual).assertEqual('\u4e2d\u6587\u4e2d\u6587');
      logInfo(`${BUNDLE}SubmitValueOf_0071 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0072
     * @tc.name      CitySearch_SubmitValueOf_0072
     * @tc.desc      submitValueOf(value="??_1", placeholder="") returns "??_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0072 begin`);
      const actual: string = submitValueOf('\u4e2d\u6587_1', '');
      logInfo(`submitValueOf(value="??_1", placeholder=""): actual=${actual}`);
      expect(actual).assertEqual('\u4e2d\u6587_1');
      logInfo(`${BUNDLE}SubmitValueOf_0072 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0073
     * @tc.name      CitySearch_SubmitValueOf_0073
     * @tc.desc      submitValueOf(value="x??", placeholder="") returns "x??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0073 begin`);
      const actual: string = submitValueOf('x\u4e2d\u6587', '');
      logInfo(`submitValueOf(value="x??", placeholder=""): actual=${actual}`);
      expect(actual).assertEqual('x\u4e2d\u6587');
      logInfo(`${BUNDLE}SubmitValueOf_0073 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0074
     * @tc.name      CitySearch_SubmitValueOf_0074
     * @tc.desc      submitValueOf(value="Hello", placeholder="a") returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0074 begin`);
      const actual: string = submitValueOf('Hello', 'a');
      logInfo(`submitValueOf(value="Hello", placeholder=...: actual=${actual}`);
      expect(actual).assertEqual('Hello');
      logInfo(`${BUNDLE}SubmitValueOf_0074 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0075
     * @tc.name      CitySearch_SubmitValueOf_0075
     * @tc.desc      submitValueOf(value="Hello", placeholder="abc") returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0075 begin`);
      const actual: string = submitValueOf('Hello', 'abc');
      logInfo(`submitValueOf(value="Hello", placeholder=...: actual=${actual}`);
      expect(actual).assertEqual('Hello');
      logInfo(`${BUNDLE}SubmitValueOf_0075 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0076
     * @tc.name      CitySearch_SubmitValueOf_0076
     * @tc.desc      submitValueOf(value="Hello", placeholder="Hello World") returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0076 begin`);
      const actual: string = submitValueOf('Hello', 'Hello World');
      logInfo(`submitValueOf(value="Hello", placeholder=...: actual=${actual}`);
      expect(actual).assertEqual('Hello');
      logInfo(`${BUNDLE}SubmitValueOf_0076 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0077
     * @tc.name      CitySearch_SubmitValueOf_0077
     * @tc.desc      submitValueOf(value="Hello", placeholder=" ") returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0077 begin`);
      const actual: string = submitValueOf('Hello', ' ');
      logInfo(`submitValueOf(value="Hello", placeholder=...: actual=${actual}`);
      expect(actual).assertEqual('Hello');
      logInfo(`${BUNDLE}SubmitValueOf_0077 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0078
     * @tc.name      CitySearch_SubmitValueOf_0078
     * @tc.desc      submitValueOf(value="Hello", placeholder="123") returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0078 begin`);
      const actual: string = submitValueOf('Hello', '123');
      logInfo(`submitValueOf(value="Hello", placeholder=...: actual=${actual}`);
      expect(actual).assertEqual('Hello');
      logInfo(`${BUNDLE}SubmitValueOf_0078 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0079
     * @tc.name      CitySearch_SubmitValueOf_0079
     * @tc.desc      submitValueOf(value="Hello", placeholder=" a ") returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0079 begin`);
      const actual: string = submitValueOf('Hello', ' a ');
      logInfo(`submitValueOf(value="Hello", placeholder=...: actual=${actual}`);
      expect(actual).assertEqual('Hello');
      logInfo(`${BUNDLE}SubmitValueOf_0079 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0080
     * @tc.name      CitySearch_SubmitValueOf_0080
     * @tc.desc      submitValueOf(value="Hello", placeholder="aa") returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0080 begin`);
      const actual: string = submitValueOf('Hello', 'aa');
      logInfo(`submitValueOf(value="Hello", placeholder=...: actual=${actual}`);
      expect(actual).assertEqual('Hello');
      logInfo(`${BUNDLE}SubmitValueOf_0080 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0081
     * @tc.name      CitySearch_SubmitValueOf_0081
     * @tc.desc      submitValueOf(value="Hello", placeholder="a_1") returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0081 begin`);
      const actual: string = submitValueOf('Hello', 'a_1');
      logInfo(`submitValueOf(value="Hello", placeholder=...: actual=${actual}`);
      expect(actual).assertEqual('Hello');
      logInfo(`${BUNDLE}SubmitValueOf_0081 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0082
     * @tc.name      CitySearch_SubmitValueOf_0082
     * @tc.desc      submitValueOf(value="Hello", placeholder="xa") returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0082 begin`);
      const actual: string = submitValueOf('Hello', 'xa');
      logInfo(`submitValueOf(value="Hello", placeholder=...: actual=${actual}`);
      expect(actual).assertEqual('Hello');
      logInfo(`${BUNDLE}SubmitValueOf_0082 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0083
     * @tc.name      CitySearch_SubmitValueOf_0083
     * @tc.desc      submitValueOf(value="Hello", placeholder=" abc ") returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0083 begin`);
      const actual: string = submitValueOf('Hello', ' abc ');
      logInfo(`submitValueOf(value="Hello", placeholder=...: actual=${actual}`);
      expect(actual).assertEqual('Hello');
      logInfo(`${BUNDLE}SubmitValueOf_0083 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0084
     * @tc.name      CitySearch_SubmitValueOf_0084
     * @tc.desc      submitValueOf(value="Hello", placeholder="abcabc") returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0084 begin`);
      const actual: string = submitValueOf('Hello', 'abcabc');
      logInfo(`submitValueOf(value="Hello", placeholder=...: actual=${actual}`);
      expect(actual).assertEqual('Hello');
      logInfo(`${BUNDLE}SubmitValueOf_0084 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0085
     * @tc.name      CitySearch_SubmitValueOf_0085
     * @tc.desc      submitValueOf(value="Hello", placeholder="abc_1") returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0085 begin`);
      const actual: string = submitValueOf('Hello', 'abc_1');
      logInfo(`submitValueOf(value="Hello", placeholder=...: actual=${actual}`);
      expect(actual).assertEqual('Hello');
      logInfo(`${BUNDLE}SubmitValueOf_0085 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0086
     * @tc.name      CitySearch_SubmitValueOf_0086
     * @tc.desc      submitValueOf(value="Hello", placeholder="xabc") returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0086 begin`);
      const actual: string = submitValueOf('Hello', 'xabc');
      logInfo(`submitValueOf(value="Hello", placeholder=...: actual=${actual}`);
      expect(actual).assertEqual('Hello');
      logInfo(`${BUNDLE}SubmitValueOf_0086 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0087
     * @tc.name      CitySearch_SubmitValueOf_0087
     * @tc.desc      submitValueOf(value="Hello", placeholder=" Hello World ") returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0087 begin`);
      const actual: string = submitValueOf('Hello', ' Hello World ');
      logInfo(`submitValueOf(value="Hello", placeholder=...: actual=${actual}`);
      expect(actual).assertEqual('Hello');
      logInfo(`${BUNDLE}SubmitValueOf_0087 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0088
     * @tc.name      CitySearch_SubmitValueOf_0088
     * @tc.desc      submitValueOf(value="Hello", placeholder="Hello WorldHello World") returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0088 begin`);
      const actual: string = submitValueOf('Hello', 'Hello WorldHello World');
      logInfo(`submitValueOf(value="Hello", placeholder=...: actual=${actual}`);
      expect(actual).assertEqual('Hello');
      logInfo(`${BUNDLE}SubmitValueOf_0088 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0089
     * @tc.name      CitySearch_SubmitValueOf_0089
     * @tc.desc      submitValueOf(value="Hello", placeholder="Hello World_1") returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0089 begin`);
      const actual: string = submitValueOf('Hello', 'Hello World_1');
      logInfo(`submitValueOf(value="Hello", placeholder=...: actual=${actual}`);
      expect(actual).assertEqual('Hello');
      logInfo(`${BUNDLE}SubmitValueOf_0089 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0090
     * @tc.name      CitySearch_SubmitValueOf_0090
     * @tc.desc      submitValueOf(value="Hello", placeholder="xHello World") returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0090 begin`);
      const actual: string = submitValueOf('Hello', 'xHello World');
      logInfo(`submitValueOf(value="Hello", placeholder=...: actual=${actual}`);
      expect(actual).assertEqual('Hello');
      logInfo(`${BUNDLE}SubmitValueOf_0090 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0091
     * @tc.name      CitySearch_SubmitValueOf_0091
     * @tc.desc      submitValueOf(value="Hello", placeholder="   ") returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0091 begin`);
      const actual: string = submitValueOf('Hello', '   ');
      logInfo(`submitValueOf(value="Hello", placeholder=...: actual=${actual}`);
      expect(actual).assertEqual('Hello');
      logInfo(`${BUNDLE}SubmitValueOf_0091 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0092
     * @tc.name      CitySearch_SubmitValueOf_0092
     * @tc.desc      submitValueOf(value="Hello", placeholder="  ") returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0092 begin`);
      const actual: string = submitValueOf('Hello', '  ');
      logInfo(`submitValueOf(value="Hello", placeholder=...: actual=${actual}`);
      expect(actual).assertEqual('Hello');
      logInfo(`${BUNDLE}SubmitValueOf_0092 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0093
     * @tc.name      CitySearch_SubmitValueOf_0093
     * @tc.desc      submitValueOf(value="Hello", placeholder=" _1") returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0093 begin`);
      const actual: string = submitValueOf('Hello', ' _1');
      logInfo(`submitValueOf(value="Hello", placeholder=...: actual=${actual}`);
      expect(actual).assertEqual('Hello');
      logInfo(`${BUNDLE}SubmitValueOf_0093 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0094
     * @tc.name      CitySearch_SubmitValueOf_0094
     * @tc.desc      submitValueOf(value="Hello", placeholder="x ") returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0094 begin`);
      const actual: string = submitValueOf('Hello', 'x ');
      logInfo(`submitValueOf(value="Hello", placeholder=...: actual=${actual}`);
      expect(actual).assertEqual('Hello');
      logInfo(`${BUNDLE}SubmitValueOf_0094 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0095
     * @tc.name      CitySearch_SubmitValueOf_0095
     * @tc.desc      submitValueOf(value="Hello", placeholder=" 123 ") returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_SubmitValueOf_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0095 begin`);
      const actual: string = submitValueOf('Hello', ' 123 ');
      logInfo(`submitValueOf(value="Hello", placeholder=...: actual=${actual}`);
      expect(actual).assertEqual('Hello');
      logInfo(`${BUNDLE}SubmitValueOf_0095 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SUBMIT_VALUE_OF_0096
     * @tc.name      CitySearch_SubmitValueOf_0096
     * @tc.desc      submitValueOf(value="Hello", placeholder="123123") returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SubmitValueOf_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SubmitValueOf_0096 begin`);
      const actual: string = submitValueOf('Hello', '123123');
      logInfo(`submitValueOf(value="Hello", placeholder=...: actual=${actual}`);
      expect(actual).assertEqual('Hello');
      logInfo(`${BUNDLE}SubmitValueOf_0096 end`);
    });
  });
}
