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
import { groupIndexOfLetter } from '../model/CitySearchLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CitySearch]';
const BUNDLE: string = 'CitySearch_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for groupIndexOfLetter (96 cases). */
export default function groupIndexOfLetterTest(): void {
  describe('GroupIndexOfLetterTest', () => {
    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0001
     * @tc.name      CitySearch_GroupIndexOfLetter_0001
     * @tc.desc      groupIndexOfLetter(letter="") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_GroupIndexOfLetter_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0001 begin`);
      const actual: number = groupIndexOfLetter('');
      logInfo(`groupIndexOfLetter(letter=""): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0001 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0002
     * @tc.name      CitySearch_GroupIndexOfLetter_0002
     * @tc.desc      groupIndexOfLetter(letter="L") returns 7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_GroupIndexOfLetter_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0002 begin`);
      const actual: number = groupIndexOfLetter('L');
      logInfo(`groupIndexOfLetter(letter="L"): actual=${actual}`);
      expect(actual).assertEqual(7);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0002 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0003
     * @tc.name      CitySearch_GroupIndexOfLetter_0003
     * @tc.desc      groupIndexOfLetter(letter="Y") returns 14
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0003 begin`);
      const actual: number = groupIndexOfLetter('Y');
      logInfo(`groupIndexOfLetter(letter="Y"): actual=${actual}`);
      expect(actual).assertEqual(14);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0003 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0004
     * @tc.name      CitySearch_GroupIndexOfLetter_0004
     * @tc.desc      groupIndexOfLetter(letter="T") returns 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0004 begin`);
      const actual: number = groupIndexOfLetter('T');
      logInfo(`groupIndexOfLetter(letter="T"): actual=${actual}`);
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0004 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0005
     * @tc.name      CitySearch_GroupIndexOfLetter_0005
     * @tc.desc      groupIndexOfLetter(letter="Z") returns 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0005 begin`);
      const actual: number = groupIndexOfLetter('Z');
      logInfo(`groupIndexOfLetter(letter="Z"): actual=${actual}`);
      expect(actual).assertEqual(15);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0005 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0006
     * @tc.name      CitySearch_GroupIndexOfLetter_0006
     * @tc.desc      groupIndexOfLetter(letter="a") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0006 begin`);
      const actual: number = groupIndexOfLetter('a');
      logInfo(`groupIndexOfLetter(letter="a"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0006 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0007
     * @tc.name      CitySearch_GroupIndexOfLetter_0007
     * @tc.desc      groupIndexOfLetter(letter="abc") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0007 begin`);
      const actual: number = groupIndexOfLetter('abc');
      logInfo(`groupIndexOfLetter(letter="abc"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0007 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0008
     * @tc.name      CitySearch_GroupIndexOfLetter_0008
     * @tc.desc      groupIndexOfLetter(letter="Hello World") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0008 begin`);
      const actual: number = groupIndexOfLetter('Hello World');
      logInfo(`groupIndexOfLetter(letter="Hello World"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0008 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0009
     * @tc.name      CitySearch_GroupIndexOfLetter_0009
     * @tc.desc      groupIndexOfLetter(letter=" ") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0009 begin`);
      const actual: number = groupIndexOfLetter(' ');
      logInfo(`groupIndexOfLetter(letter=" "): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0009 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0010
     * @tc.name      CitySearch_GroupIndexOfLetter_0010
     * @tc.desc      groupIndexOfLetter(letter="123") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0010 begin`);
      const actual: number = groupIndexOfLetter('123');
      logInfo(`groupIndexOfLetter(letter="123"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0010 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0011
     * @tc.name      CitySearch_GroupIndexOfLetter_0011
     * @tc.desc      groupIndexOfLetter(letter=" a ") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_GroupIndexOfLetter_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0011 begin`);
      const actual: number = groupIndexOfLetter(' a ');
      logInfo(`groupIndexOfLetter(letter=" a "): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0011 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0012
     * @tc.name      CitySearch_GroupIndexOfLetter_0012
     * @tc.desc      groupIndexOfLetter(letter="aa") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0012 begin`);
      const actual: number = groupIndexOfLetter('aa');
      logInfo(`groupIndexOfLetter(letter="aa"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0012 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0013
     * @tc.name      CitySearch_GroupIndexOfLetter_0013
     * @tc.desc      groupIndexOfLetter(letter="a_1") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0013 begin`);
      const actual: number = groupIndexOfLetter('a_1');
      logInfo(`groupIndexOfLetter(letter="a_1"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0013 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0014
     * @tc.name      CitySearch_GroupIndexOfLetter_0014
     * @tc.desc      groupIndexOfLetter(letter="xa") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_GroupIndexOfLetter_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0014 begin`);
      const actual: number = groupIndexOfLetter('xa');
      logInfo(`groupIndexOfLetter(letter="xa"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0014 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0015
     * @tc.name      CitySearch_GroupIndexOfLetter_0015
     * @tc.desc      groupIndexOfLetter(letter=" abc ") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_GroupIndexOfLetter_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0015 begin`);
      const actual: number = groupIndexOfLetter(' abc ');
      logInfo(`groupIndexOfLetter(letter=" abc "): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0015 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0016
     * @tc.name      CitySearch_GroupIndexOfLetter_0016
     * @tc.desc      groupIndexOfLetter(letter="abcabc") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0016 begin`);
      const actual: number = groupIndexOfLetter('abcabc');
      logInfo(`groupIndexOfLetter(letter="abcabc"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0016 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0017
     * @tc.name      CitySearch_GroupIndexOfLetter_0017
     * @tc.desc      groupIndexOfLetter(letter="abc_1") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0017 begin`);
      const actual: number = groupIndexOfLetter('abc_1');
      logInfo(`groupIndexOfLetter(letter="abc_1"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0017 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0018
     * @tc.name      CitySearch_GroupIndexOfLetter_0018
     * @tc.desc      groupIndexOfLetter(letter="xabc") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_GroupIndexOfLetter_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0018 begin`);
      const actual: number = groupIndexOfLetter('xabc');
      logInfo(`groupIndexOfLetter(letter="xabc"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0018 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0019
     * @tc.name      CitySearch_GroupIndexOfLetter_0019
     * @tc.desc      groupIndexOfLetter(letter=" Hello World ") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_GroupIndexOfLetter_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0019 begin`);
      const actual: number = groupIndexOfLetter(' Hello World ');
      logInfo(`groupIndexOfLetter(letter=" Hello World "): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0019 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0020
     * @tc.name      CitySearch_GroupIndexOfLetter_0020
     * @tc.desc      groupIndexOfLetter(letter="Hello WorldHello World") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0020 begin`);
      const actual: number = groupIndexOfLetter('Hello WorldHello World');
      logInfo(`groupIndexOfLetter(letter="Hello WorldHel...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0020 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0021
     * @tc.name      CitySearch_GroupIndexOfLetter_0021
     * @tc.desc      groupIndexOfLetter(letter="Hello World_1") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0021 begin`);
      const actual: number = groupIndexOfLetter('Hello World_1');
      logInfo(`groupIndexOfLetter(letter="Hello World_1"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0021 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0022
     * @tc.name      CitySearch_GroupIndexOfLetter_0022
     * @tc.desc      groupIndexOfLetter(letter="xHello World") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_GroupIndexOfLetter_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0022 begin`);
      const actual: number = groupIndexOfLetter('xHello World');
      logInfo(`groupIndexOfLetter(letter="xHello World"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0022 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0023
     * @tc.name      CitySearch_GroupIndexOfLetter_0023
     * @tc.desc      groupIndexOfLetter(letter="   ") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_GroupIndexOfLetter_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0023 begin`);
      const actual: number = groupIndexOfLetter('   ');
      logInfo(`groupIndexOfLetter(letter="   "): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0023 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0024
     * @tc.name      CitySearch_GroupIndexOfLetter_0024
     * @tc.desc      groupIndexOfLetter(letter="  ") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0024 begin`);
      const actual: number = groupIndexOfLetter('  ');
      logInfo(`groupIndexOfLetter(letter="  "): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0024 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0025
     * @tc.name      CitySearch_GroupIndexOfLetter_0025
     * @tc.desc      groupIndexOfLetter(letter=" _1") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0025 begin`);
      const actual: number = groupIndexOfLetter(' _1');
      logInfo(`groupIndexOfLetter(letter=" _1"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0025 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0026
     * @tc.name      CitySearch_GroupIndexOfLetter_0026
     * @tc.desc      groupIndexOfLetter(letter="x ") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_GroupIndexOfLetter_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0026 begin`);
      const actual: number = groupIndexOfLetter('x ');
      logInfo(`groupIndexOfLetter(letter="x "): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0026 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0027
     * @tc.name      CitySearch_GroupIndexOfLetter_0027
     * @tc.desc      groupIndexOfLetter(letter=" 123 ") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_GroupIndexOfLetter_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0027 begin`);
      const actual: number = groupIndexOfLetter(' 123 ');
      logInfo(`groupIndexOfLetter(letter=" 123 "): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0027 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0028
     * @tc.name      CitySearch_GroupIndexOfLetter_0028
     * @tc.desc      groupIndexOfLetter(letter="123123") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0028 begin`);
      const actual: number = groupIndexOfLetter('123123');
      logInfo(`groupIndexOfLetter(letter="123123"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0028 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0029
     * @tc.name      CitySearch_GroupIndexOfLetter_0029
     * @tc.desc      groupIndexOfLetter(letter="123_1") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0029 begin`);
      const actual: number = groupIndexOfLetter('123_1');
      logInfo(`groupIndexOfLetter(letter="123_1"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0029 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0030
     * @tc.name      CitySearch_GroupIndexOfLetter_0030
     * @tc.desc      groupIndexOfLetter(letter="x123") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_GroupIndexOfLetter_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0030 begin`);
      const actual: number = groupIndexOfLetter('x123');
      logInfo(`groupIndexOfLetter(letter="x123"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0030 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0031
     * @tc.name      CitySearch_GroupIndexOfLetter_0031
     * @tc.desc      groupIndexOfLetter(letter="ckX") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0031 begin`);
      const actual: number = groupIndexOfLetter('ckX');
      logInfo(`groupIndexOfLetter(letter="ckX"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0031 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0032
     * @tc.name      CitySearch_GroupIndexOfLetter_0032
     * @tc.desc      groupIndexOfLetter(letter="ZtylY1Ur") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0032 begin`);
      const actual: number = groupIndexOfLetter('ZtylY1Ur');
      logInfo(`groupIndexOfLetter(letter="ZtylY1Ur"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0032 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0033
     * @tc.name      CitySearch_GroupIndexOfLetter_0033
     * @tc.desc      groupIndexOfLetter(letter="w04ubmJ8q") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0033 begin`);
      const actual: number = groupIndexOfLetter('w04ubmJ8q');
      logInfo(`groupIndexOfLetter(letter="w04ubmJ8q"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0033 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0034
     * @tc.name      CitySearch_GroupIndexOfLetter_0034
     * @tc.desc      groupIndexOfLetter(letter="MUz6") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0034 begin`);
      const actual: number = groupIndexOfLetter('MUz6');
      logInfo(`groupIndexOfLetter(letter="MUz6"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0034 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0035
     * @tc.name      CitySearch_GroupIndexOfLetter_0035
     * @tc.desc      groupIndexOfLetter(letter="gTyYmD8g") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0035 begin`);
      const actual: number = groupIndexOfLetter('gTyYmD8g');
      logInfo(`groupIndexOfLetter(letter="gTyYmD8g"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0035 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0036
     * @tc.name      CitySearch_GroupIndexOfLetter_0036
     * @tc.desc      groupIndexOfLetter(letter="9l6q") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0036 begin`);
      const actual: number = groupIndexOfLetter('9l6q');
      logInfo(`groupIndexOfLetter(letter="9l6q"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0036 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0037
     * @tc.name      CitySearch_GroupIndexOfLetter_0037
     * @tc.desc      groupIndexOfLetter(letter="Uy1MpYyrS2yX") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0037 begin`);
      const actual: number = groupIndexOfLetter('Uy1MpYyrS2yX');
      logInfo(`groupIndexOfLetter(letter="Uy1MpYyrS2yX"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0037 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0038
     * @tc.name      CitySearch_GroupIndexOfLetter_0038
     * @tc.desc      groupIndexOfLetter(letter="1u") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0038 begin`);
      const actual: number = groupIndexOfLetter('1u');
      logInfo(`groupIndexOfLetter(letter="1u"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0038 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0039
     * @tc.name      CitySearch_GroupIndexOfLetter_0039
     * @tc.desc      groupIndexOfLetter(letter="IP9J1HTa") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0039 begin`);
      const actual: number = groupIndexOfLetter('IP9J1HTa');
      logInfo(`groupIndexOfLetter(letter="IP9J1HTa"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0039 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0040
     * @tc.name      CitySearch_GroupIndexOfLetter_0040
     * @tc.desc      groupIndexOfLetter(letter="VRl2rj") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0040 begin`);
      const actual: number = groupIndexOfLetter('VRl2rj');
      logInfo(`groupIndexOfLetter(letter="VRl2rj"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0040 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0041
     * @tc.name      CitySearch_GroupIndexOfLetter_0041
     * @tc.desc      groupIndexOfLetter(letter="toEOGA0") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0041 begin`);
      const actual: number = groupIndexOfLetter('toEOGA0');
      logInfo(`groupIndexOfLetter(letter="toEOGA0"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0041 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0042
     * @tc.name      CitySearch_GroupIndexOfLetter_0042
     * @tc.desc      groupIndexOfLetter(letter="v2Uhe9gB") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0042 begin`);
      const actual: number = groupIndexOfLetter('v2Uhe9gB');
      logInfo(`groupIndexOfLetter(letter="v2Uhe9gB"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0042 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0043
     * @tc.name      CitySearch_GroupIndexOfLetter_0043
     * @tc.desc      groupIndexOfLetter(letter="LfYPB") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0043 begin`);
      const actual: number = groupIndexOfLetter('LfYPB');
      logInfo(`groupIndexOfLetter(letter="LfYPB"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0043 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0044
     * @tc.name      CitySearch_GroupIndexOfLetter_0044
     * @tc.desc      groupIndexOfLetter(letter="Tj") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0044 begin`);
      const actual: number = groupIndexOfLetter('Tj');
      logInfo(`groupIndexOfLetter(letter="Tj"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0044 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0045
     * @tc.name      CitySearch_GroupIndexOfLetter_0045
     * @tc.desc      groupIndexOfLetter(letter="nIBTMYh") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0045 begin`);
      const actual: number = groupIndexOfLetter('nIBTMYh');
      logInfo(`groupIndexOfLetter(letter="nIBTMYh"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0045 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0046
     * @tc.name      CitySearch_GroupIndexOfLetter_0046
     * @tc.desc      groupIndexOfLetter(letter="iNh4c") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0046 begin`);
      const actual: number = groupIndexOfLetter('iNh4c');
      logInfo(`groupIndexOfLetter(letter="iNh4c"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0046 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0047
     * @tc.name      CitySearch_GroupIndexOfLetter_0047
     * @tc.desc      groupIndexOfLetter(letter="9Bz4T") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0047 begin`);
      const actual: number = groupIndexOfLetter('9Bz4T');
      logInfo(`groupIndexOfLetter(letter="9Bz4T"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0047 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0048
     * @tc.name      CitySearch_GroupIndexOfLetter_0048
     * @tc.desc      groupIndexOfLetter(letter="lE") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0048 begin`);
      const actual: number = groupIndexOfLetter('lE');
      logInfo(`groupIndexOfLetter(letter="lE"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0048 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0049
     * @tc.name      CitySearch_GroupIndexOfLetter_0049
     * @tc.desc      groupIndexOfLetter(letter="G1cC") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0049 begin`);
      const actual: number = groupIndexOfLetter('G1cC');
      logInfo(`groupIndexOfLetter(letter="G1cC"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0049 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0050
     * @tc.name      CitySearch_GroupIndexOfLetter_0050
     * @tc.desc      groupIndexOfLetter(letter="5PjiI") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0050 begin`);
      const actual: number = groupIndexOfLetter('5PjiI');
      logInfo(`groupIndexOfLetter(letter="5PjiI"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0050 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0051
     * @tc.name      CitySearch_GroupIndexOfLetter_0051
     * @tc.desc      groupIndexOfLetter(letter="UznRyD5") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0051 begin`);
      const actual: number = groupIndexOfLetter('UznRyD5');
      logInfo(`groupIndexOfLetter(letter="UznRyD5"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0051 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0052
     * @tc.name      CitySearch_GroupIndexOfLetter_0052
     * @tc.desc      groupIndexOfLetter(letter="IfVSxnfefD1s") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0052 begin`);
      const actual: number = groupIndexOfLetter('IfVSxnfefD1s');
      logInfo(`groupIndexOfLetter(letter="IfVSxnfefD1s"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0052 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0053
     * @tc.name      CitySearch_GroupIndexOfLetter_0053
     * @tc.desc      groupIndexOfLetter(letter="Cd3YEAYGhL") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0053 begin`);
      const actual: number = groupIndexOfLetter('Cd3YEAYGhL');
      logInfo(`groupIndexOfLetter(letter="Cd3YEAYGhL"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0053 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0054
     * @tc.name      CitySearch_GroupIndexOfLetter_0054
     * @tc.desc      groupIndexOfLetter(letter="ZflVvuF") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0054 begin`);
      const actual: number = groupIndexOfLetter('ZflVvuF');
      logInfo(`groupIndexOfLetter(letter="ZflVvuF"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0054 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0055
     * @tc.name      CitySearch_GroupIndexOfLetter_0055
     * @tc.desc      groupIndexOfLetter(letter="iHi") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0055 begin`);
      const actual: number = groupIndexOfLetter('iHi');
      logInfo(`groupIndexOfLetter(letter="iHi"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0055 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0056
     * @tc.name      CitySearch_GroupIndexOfLetter_0056
     * @tc.desc      groupIndexOfLetter(letter="bDig8mr") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0056 begin`);
      const actual: number = groupIndexOfLetter('bDig8mr');
      logInfo(`groupIndexOfLetter(letter="bDig8mr"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0056 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0057
     * @tc.name      CitySearch_GroupIndexOfLetter_0057
     * @tc.desc      groupIndexOfLetter(letter="8p") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0057 begin`);
      const actual: number = groupIndexOfLetter('8p');
      logInfo(`groupIndexOfLetter(letter="8p"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0057 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0058
     * @tc.name      CitySearch_GroupIndexOfLetter_0058
     * @tc.desc      groupIndexOfLetter(letter="HPvWI") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0058 begin`);
      const actual: number = groupIndexOfLetter('HPvWI');
      logInfo(`groupIndexOfLetter(letter="HPvWI"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0058 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0059
     * @tc.name      CitySearch_GroupIndexOfLetter_0059
     * @tc.desc      groupIndexOfLetter(letter="ULNw") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0059 begin`);
      const actual: number = groupIndexOfLetter('ULNw');
      logInfo(`groupIndexOfLetter(letter="ULNw"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0059 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0060
     * @tc.name      CitySearch_GroupIndexOfLetter_0060
     * @tc.desc      groupIndexOfLetter(letter="DalQMvWsGd6") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0060 begin`);
      const actual: number = groupIndexOfLetter('DalQMvWsGd6');
      logInfo(`groupIndexOfLetter(letter="DalQMvWsGd6"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0060 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0061
     * @tc.name      CitySearch_GroupIndexOfLetter_0061
     * @tc.desc      groupIndexOfLetter(letter="nsHY9FOP") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0061 begin`);
      const actual: number = groupIndexOfLetter('nsHY9FOP');
      logInfo(`groupIndexOfLetter(letter="nsHY9FOP"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0061 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0062
     * @tc.name      CitySearch_GroupIndexOfLetter_0062
     * @tc.desc      groupIndexOfLetter(letter="cmOlaqh9") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0062 begin`);
      const actual: number = groupIndexOfLetter('cmOlaqh9');
      logInfo(`groupIndexOfLetter(letter="cmOlaqh9"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0062 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0063
     * @tc.name      CitySearch_GroupIndexOfLetter_0063
     * @tc.desc      groupIndexOfLetter(letter="TlX") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0063 begin`);
      const actual: number = groupIndexOfLetter('TlX');
      logInfo(`groupIndexOfLetter(letter="TlX"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0063 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0064
     * @tc.name      CitySearch_GroupIndexOfLetter_0064
     * @tc.desc      groupIndexOfLetter(letter="lZe") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0064 begin`);
      const actual: number = groupIndexOfLetter('lZe');
      logInfo(`groupIndexOfLetter(letter="lZe"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0064 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0065
     * @tc.name      CitySearch_GroupIndexOfLetter_0065
     * @tc.desc      groupIndexOfLetter(letter="0PvD") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0065 begin`);
      const actual: number = groupIndexOfLetter('0PvD');
      logInfo(`groupIndexOfLetter(letter="0PvD"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0065 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0066
     * @tc.name      CitySearch_GroupIndexOfLetter_0066
     * @tc.desc      groupIndexOfLetter(letter="vTKPvBYl") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0066 begin`);
      const actual: number = groupIndexOfLetter('vTKPvBYl');
      logInfo(`groupIndexOfLetter(letter="vTKPvBYl"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0066 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0067
     * @tc.name      CitySearch_GroupIndexOfLetter_0067
     * @tc.desc      groupIndexOfLetter(letter="bthuJvR") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0067 begin`);
      const actual: number = groupIndexOfLetter('bthuJvR');
      logInfo(`groupIndexOfLetter(letter="bthuJvR"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0067 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0068
     * @tc.name      CitySearch_GroupIndexOfLetter_0068
     * @tc.desc      groupIndexOfLetter(letter="iGfmPyr5RtDL") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0068 begin`);
      const actual: number = groupIndexOfLetter('iGfmPyr5RtDL');
      logInfo(`groupIndexOfLetter(letter="iGfmPyr5RtDL"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0068 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0069
     * @tc.name      CitySearch_GroupIndexOfLetter_0069
     * @tc.desc      groupIndexOfLetter(letter="VloBPgJRbgL") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0069 begin`);
      const actual: number = groupIndexOfLetter('VloBPgJRbgL');
      logInfo(`groupIndexOfLetter(letter="VloBPgJRbgL"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0069 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0070
     * @tc.name      CitySearch_GroupIndexOfLetter_0070
     * @tc.desc      groupIndexOfLetter(letter="mD0h8HEqig") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0070 begin`);
      const actual: number = groupIndexOfLetter('mD0h8HEqig');
      logInfo(`groupIndexOfLetter(letter="mD0h8HEqig"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0070 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0071
     * @tc.name      CitySearch_GroupIndexOfLetter_0071
     * @tc.desc      groupIndexOfLetter(letter="sS") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0071 begin`);
      const actual: number = groupIndexOfLetter('sS');
      logInfo(`groupIndexOfLetter(letter="sS"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0071 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0072
     * @tc.name      CitySearch_GroupIndexOfLetter_0072
     * @tc.desc      groupIndexOfLetter(letter="WbaRlyKqt9") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0072 begin`);
      const actual: number = groupIndexOfLetter('WbaRlyKqt9');
      logInfo(`groupIndexOfLetter(letter="WbaRlyKqt9"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0072 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0073
     * @tc.name      CitySearch_GroupIndexOfLetter_0073
     * @tc.desc      groupIndexOfLetter(letter="lgaj27SX") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0073 begin`);
      const actual: number = groupIndexOfLetter('lgaj27SX');
      logInfo(`groupIndexOfLetter(letter="lgaj27SX"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0073 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0074
     * @tc.name      CitySearch_GroupIndexOfLetter_0074
     * @tc.desc      groupIndexOfLetter(letter="R") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0074 begin`);
      const actual: number = groupIndexOfLetter('R');
      logInfo(`groupIndexOfLetter(letter="R"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0074 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0075
     * @tc.name      CitySearch_GroupIndexOfLetter_0075
     * @tc.desc      groupIndexOfLetter(letter="CjY") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0075 begin`);
      const actual: number = groupIndexOfLetter('CjY');
      logInfo(`groupIndexOfLetter(letter="CjY"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0075 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0076
     * @tc.name      CitySearch_GroupIndexOfLetter_0076
     * @tc.desc      groupIndexOfLetter(letter="1cw8UEkPRP") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0076 begin`);
      const actual: number = groupIndexOfLetter('1cw8UEkPRP');
      logInfo(`groupIndexOfLetter(letter="1cw8UEkPRP"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0076 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0077
     * @tc.name      CitySearch_GroupIndexOfLetter_0077
     * @tc.desc      groupIndexOfLetter(letter="PJ9TPUioP") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0077 begin`);
      const actual: number = groupIndexOfLetter('PJ9TPUioP');
      logInfo(`groupIndexOfLetter(letter="PJ9TPUioP"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0077 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0078
     * @tc.name      CitySearch_GroupIndexOfLetter_0078
     * @tc.desc      groupIndexOfLetter(letter="hRLOU") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0078 begin`);
      const actual: number = groupIndexOfLetter('hRLOU');
      logInfo(`groupIndexOfLetter(letter="hRLOU"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0078 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0079
     * @tc.name      CitySearch_GroupIndexOfLetter_0079
     * @tc.desc      groupIndexOfLetter(letter="CYLnnMrhJq") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0079 begin`);
      const actual: number = groupIndexOfLetter('CYLnnMrhJq');
      logInfo(`groupIndexOfLetter(letter="CYLnnMrhJq"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0079 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0080
     * @tc.name      CitySearch_GroupIndexOfLetter_0080
     * @tc.desc      groupIndexOfLetter(letter="hwjNcy1GbkSX") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0080 begin`);
      const actual: number = groupIndexOfLetter('hwjNcy1GbkSX');
      logInfo(`groupIndexOfLetter(letter="hwjNcy1GbkSX"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0080 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0081
     * @tc.name      CitySearch_GroupIndexOfLetter_0081
     * @tc.desc      groupIndexOfLetter(letter="3pEBc89DDk5") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0081 begin`);
      const actual: number = groupIndexOfLetter('3pEBc89DDk5');
      logInfo(`groupIndexOfLetter(letter="3pEBc89DDk5"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0081 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0082
     * @tc.name      CitySearch_GroupIndexOfLetter_0082
     * @tc.desc      groupIndexOfLetter(letter="bnsKit3Um") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0082 begin`);
      const actual: number = groupIndexOfLetter('bnsKit3Um');
      logInfo(`groupIndexOfLetter(letter="bnsKit3Um"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0082 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0083
     * @tc.name      CitySearch_GroupIndexOfLetter_0083
     * @tc.desc      groupIndexOfLetter(letter="m46smxIE1vw") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0083 begin`);
      const actual: number = groupIndexOfLetter('m46smxIE1vw');
      logInfo(`groupIndexOfLetter(letter="m46smxIE1vw"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0083 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0084
     * @tc.name      CitySearch_GroupIndexOfLetter_0084
     * @tc.desc      groupIndexOfLetter(letter="njuzC") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0084 begin`);
      const actual: number = groupIndexOfLetter('njuzC');
      logInfo(`groupIndexOfLetter(letter="njuzC"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0084 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0085
     * @tc.name      CitySearch_GroupIndexOfLetter_0085
     * @tc.desc      groupIndexOfLetter(letter="FPXzr") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0085 begin`);
      const actual: number = groupIndexOfLetter('FPXzr');
      logInfo(`groupIndexOfLetter(letter="FPXzr"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0085 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0086
     * @tc.name      CitySearch_GroupIndexOfLetter_0086
     * @tc.desc      groupIndexOfLetter(letter="4k") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0086 begin`);
      const actual: number = groupIndexOfLetter('4k');
      logInfo(`groupIndexOfLetter(letter="4k"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0086 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0087
     * @tc.name      CitySearch_GroupIndexOfLetter_0087
     * @tc.desc      groupIndexOfLetter(letter="kmC") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0087 begin`);
      const actual: number = groupIndexOfLetter('kmC');
      logInfo(`groupIndexOfLetter(letter="kmC"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0087 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0088
     * @tc.name      CitySearch_GroupIndexOfLetter_0088
     * @tc.desc      groupIndexOfLetter(letter="x") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0088 begin`);
      const actual: number = groupIndexOfLetter('x');
      logInfo(`groupIndexOfLetter(letter="x"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0088 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0089
     * @tc.name      CitySearch_GroupIndexOfLetter_0089
     * @tc.desc      groupIndexOfLetter(letter="A8BNk8L") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0089 begin`);
      const actual: number = groupIndexOfLetter('A8BNk8L');
      logInfo(`groupIndexOfLetter(letter="A8BNk8L"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0089 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0090
     * @tc.name      CitySearch_GroupIndexOfLetter_0090
     * @tc.desc      groupIndexOfLetter(letter="c") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0090 begin`);
      const actual: number = groupIndexOfLetter('c');
      logInfo(`groupIndexOfLetter(letter="c"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0090 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0091
     * @tc.name      CitySearch_GroupIndexOfLetter_0091
     * @tc.desc      groupIndexOfLetter(letter="p0knm7Hmx6") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0091 begin`);
      const actual: number = groupIndexOfLetter('p0knm7Hmx6');
      logInfo(`groupIndexOfLetter(letter="p0knm7Hmx6"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0091 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0092
     * @tc.name      CitySearch_GroupIndexOfLetter_0092
     * @tc.desc      groupIndexOfLetter(letter="PohIQwb0cb") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0092 begin`);
      const actual: number = groupIndexOfLetter('PohIQwb0cb');
      logInfo(`groupIndexOfLetter(letter="PohIQwb0cb"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0092 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0093
     * @tc.name      CitySearch_GroupIndexOfLetter_0093
     * @tc.desc      groupIndexOfLetter(letter="quK1") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0093 begin`);
      const actual: number = groupIndexOfLetter('quK1');
      logInfo(`groupIndexOfLetter(letter="quK1"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0093 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0094
     * @tc.name      CitySearch_GroupIndexOfLetter_0094
     * @tc.desc      groupIndexOfLetter(letter="eMlHNq") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0094 begin`);
      const actual: number = groupIndexOfLetter('eMlHNq');
      logInfo(`groupIndexOfLetter(letter="eMlHNq"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0094 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0095
     * @tc.name      CitySearch_GroupIndexOfLetter_0095
     * @tc.desc      groupIndexOfLetter(letter="pUban89ZvM") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0095 begin`);
      const actual: number = groupIndexOfLetter('pUban89ZvM');
      logInfo(`groupIndexOfLetter(letter="pUban89ZvM"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0095 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0096
     * @tc.name      CitySearch_GroupIndexOfLetter_0096
     * @tc.desc      groupIndexOfLetter(letter="neqBIV2uRfCC") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0096 begin`);
      const actual: number = groupIndexOfLetter('neqBIV2uRfCC');
      logInfo(`groupIndexOfLetter(letter="neqBIV2uRfCC"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0096 end`);
    });
  });
}
