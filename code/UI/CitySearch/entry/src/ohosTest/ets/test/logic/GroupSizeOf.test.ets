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
import { groupSizeOf } from '../model/CitySearchLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CitySearch]';
const BUNDLE: string = 'CitySearch_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for groupSizeOf (75 cases). */
export default function groupSizeOfTest(): void {
  describe('GroupSizeOfTest', () => {
    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_SIZE_OF_0001
     * @tc.name      CitySearch_GroupSizeOf_0001
     * @tc.desc      groupSizeOf(letter="") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_GroupSizeOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}GroupSizeOf_0001 begin`);
      const actual: number = groupSizeOf('');
      logInfo(`groupSizeOf(letter=""): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GroupSizeOf_0001 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_SIZE_OF_0002
     * @tc.name      CitySearch_GroupSizeOf_0002
     * @tc.desc      groupSizeOf(letter="A") returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_GroupSizeOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}GroupSizeOf_0002 begin`);
      const actual: number = groupSizeOf('A');
      logInfo(`groupSizeOf(letter="A"): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}GroupSizeOf_0002 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_SIZE_OF_0003
     * @tc.name      CitySearch_GroupSizeOf_0003
     * @tc.desc      groupSizeOf(letter="T") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupSizeOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupSizeOf_0003 begin`);
      const actual: number = groupSizeOf('T');
      logInfo(`groupSizeOf(letter="T"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}GroupSizeOf_0003 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_SIZE_OF_0004
     * @tc.name      CitySearch_GroupSizeOf_0004
     * @tc.desc      groupSizeOf(letter="a") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupSizeOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupSizeOf_0004 begin`);
      const actual: number = groupSizeOf('a');
      logInfo(`groupSizeOf(letter="a"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GroupSizeOf_0004 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_SIZE_OF_0005
     * @tc.name      CitySearch_GroupSizeOf_0005
     * @tc.desc      groupSizeOf(letter="abc") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupSizeOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupSizeOf_0005 begin`);
      const actual: number = groupSizeOf('abc');
      logInfo(`groupSizeOf(letter="abc"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GroupSizeOf_0005 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_SIZE_OF_0006
     * @tc.name      CitySearch_GroupSizeOf_0006
     * @tc.desc      groupSizeOf(letter="Hello World") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupSizeOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupSizeOf_0006 begin`);
      const actual: number = groupSizeOf('Hello World');
      logInfo(`groupSizeOf(letter="Hello World"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GroupSizeOf_0006 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_SIZE_OF_0007
     * @tc.name      CitySearch_GroupSizeOf_0007
     * @tc.desc      groupSizeOf(letter=" ") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupSizeOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupSizeOf_0007 begin`);
      const actual: number = groupSizeOf(' ');
      logInfo(`groupSizeOf(letter=" "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GroupSizeOf_0007 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_SIZE_OF_0008
     * @tc.name      CitySearch_GroupSizeOf_0008
     * @tc.desc      groupSizeOf(letter="123") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupSizeOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupSizeOf_0008 begin`);
      const actual: number = groupSizeOf('123');
      logInfo(`groupSizeOf(letter="123"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GroupSizeOf_0008 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_SIZE_OF_0009
     * @tc.name      CitySearch_GroupSizeOf_0009
     * @tc.desc      groupSizeOf(letter=" a ") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_GroupSizeOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}GroupSizeOf_0009 begin`);
      const actual: number = groupSizeOf(' a ');
      logInfo(`groupSizeOf(letter=" a "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GroupSizeOf_0009 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_SIZE_OF_0010
     * @tc.name      CitySearch_GroupSizeOf_0010
     * @tc.desc      groupSizeOf(letter="aa") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupSizeOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupSizeOf_0010 begin`);
      const actual: number = groupSizeOf('aa');
      logInfo(`groupSizeOf(letter="aa"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GroupSizeOf_0010 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_SIZE_OF_0011
     * @tc.name      CitySearch_GroupSizeOf_0011
     * @tc.desc      groupSizeOf(letter="a_1") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupSizeOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupSizeOf_0011 begin`);
      const actual: number = groupSizeOf('a_1');
      logInfo(`groupSizeOf(letter="a_1"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GroupSizeOf_0011 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_SIZE_OF_0012
     * @tc.name      CitySearch_GroupSizeOf_0012
     * @tc.desc      groupSizeOf(letter="xa") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_GroupSizeOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}GroupSizeOf_0012 begin`);
      const actual: number = groupSizeOf('xa');
      logInfo(`groupSizeOf(letter="xa"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GroupSizeOf_0012 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_SIZE_OF_0013
     * @tc.name      CitySearch_GroupSizeOf_0013
     * @tc.desc      groupSizeOf(letter=" abc ") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_GroupSizeOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}GroupSizeOf_0013 begin`);
      const actual: number = groupSizeOf(' abc ');
      logInfo(`groupSizeOf(letter=" abc "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GroupSizeOf_0013 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_SIZE_OF_0014
     * @tc.name      CitySearch_GroupSizeOf_0014
     * @tc.desc      groupSizeOf(letter="abcabc") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupSizeOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupSizeOf_0014 begin`);
      const actual: number = groupSizeOf('abcabc');
      logInfo(`groupSizeOf(letter="abcabc"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GroupSizeOf_0014 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_SIZE_OF_0015
     * @tc.name      CitySearch_GroupSizeOf_0015
     * @tc.desc      groupSizeOf(letter="abc_1") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupSizeOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupSizeOf_0015 begin`);
      const actual: number = groupSizeOf('abc_1');
      logInfo(`groupSizeOf(letter="abc_1"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GroupSizeOf_0015 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_SIZE_OF_0016
     * @tc.name      CitySearch_GroupSizeOf_0016
     * @tc.desc      groupSizeOf(letter="xabc") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_GroupSizeOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}GroupSizeOf_0016 begin`);
      const actual: number = groupSizeOf('xabc');
      logInfo(`groupSizeOf(letter="xabc"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GroupSizeOf_0016 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_SIZE_OF_0017
     * @tc.name      CitySearch_GroupSizeOf_0017
     * @tc.desc      groupSizeOf(letter=" Hello World ") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_GroupSizeOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}GroupSizeOf_0017 begin`);
      const actual: number = groupSizeOf(' Hello World ');
      logInfo(`groupSizeOf(letter=" Hello World "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GroupSizeOf_0017 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_SIZE_OF_0018
     * @tc.name      CitySearch_GroupSizeOf_0018
     * @tc.desc      groupSizeOf(letter="Hello WorldHello World") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupSizeOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupSizeOf_0018 begin`);
      const actual: number = groupSizeOf('Hello WorldHello World');
      logInfo(`groupSizeOf(letter="Hello WorldHello World"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GroupSizeOf_0018 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_SIZE_OF_0019
     * @tc.name      CitySearch_GroupSizeOf_0019
     * @tc.desc      groupSizeOf(letter="Hello World_1") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupSizeOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupSizeOf_0019 begin`);
      const actual: number = groupSizeOf('Hello World_1');
      logInfo(`groupSizeOf(letter="Hello World_1"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GroupSizeOf_0019 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_SIZE_OF_0020
     * @tc.name      CitySearch_GroupSizeOf_0020
     * @tc.desc      groupSizeOf(letter="xHello World") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_GroupSizeOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}GroupSizeOf_0020 begin`);
      const actual: number = groupSizeOf('xHello World');
      logInfo(`groupSizeOf(letter="xHello World"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GroupSizeOf_0020 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_SIZE_OF_0021
     * @tc.name      CitySearch_GroupSizeOf_0021
     * @tc.desc      groupSizeOf(letter="   ") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_GroupSizeOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}GroupSizeOf_0021 begin`);
      const actual: number = groupSizeOf('   ');
      logInfo(`groupSizeOf(letter="   "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GroupSizeOf_0021 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_SIZE_OF_0022
     * @tc.name      CitySearch_GroupSizeOf_0022
     * @tc.desc      groupSizeOf(letter="  ") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupSizeOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupSizeOf_0022 begin`);
      const actual: number = groupSizeOf('  ');
      logInfo(`groupSizeOf(letter="  "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GroupSizeOf_0022 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_SIZE_OF_0023
     * @tc.name      CitySearch_GroupSizeOf_0023
     * @tc.desc      groupSizeOf(letter=" _1") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupSizeOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupSizeOf_0023 begin`);
      const actual: number = groupSizeOf(' _1');
      logInfo(`groupSizeOf(letter=" _1"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GroupSizeOf_0023 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_SIZE_OF_0024
     * @tc.name      CitySearch_GroupSizeOf_0024
     * @tc.desc      groupSizeOf(letter="x ") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_GroupSizeOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}GroupSizeOf_0024 begin`);
      const actual: number = groupSizeOf('x ');
      logInfo(`groupSizeOf(letter="x "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GroupSizeOf_0024 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_SIZE_OF_0025
     * @tc.name      CitySearch_GroupSizeOf_0025
     * @tc.desc      groupSizeOf(letter=" 123 ") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_GroupSizeOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}GroupSizeOf_0025 begin`);
      const actual: number = groupSizeOf(' 123 ');
      logInfo(`groupSizeOf(letter=" 123 "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GroupSizeOf_0025 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_SIZE_OF_0026
     * @tc.name      CitySearch_GroupSizeOf_0026
     * @tc.desc      groupSizeOf(letter="123123") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupSizeOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupSizeOf_0026 begin`);
      const actual: number = groupSizeOf('123123');
      logInfo(`groupSizeOf(letter="123123"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GroupSizeOf_0026 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_SIZE_OF_0027
     * @tc.name      CitySearch_GroupSizeOf_0027
     * @tc.desc      groupSizeOf(letter="123_1") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupSizeOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupSizeOf_0027 begin`);
      const actual: number = groupSizeOf('123_1');
      logInfo(`groupSizeOf(letter="123_1"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GroupSizeOf_0027 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_SIZE_OF_0028
     * @tc.name      CitySearch_GroupSizeOf_0028
     * @tc.desc      groupSizeOf(letter="x123") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_GroupSizeOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}GroupSizeOf_0028 begin`);
      const actual: number = groupSizeOf('x123');
      logInfo(`groupSizeOf(letter="x123"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GroupSizeOf_0028 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_SIZE_OF_0029
     * @tc.name      CitySearch_GroupSizeOf_0029
     * @tc.desc      groupSizeOf(letter="xYbAMhwFKI") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupSizeOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupSizeOf_0029 begin`);
      const actual: number = groupSizeOf('xYbAMhwFKI');
      logInfo(`groupSizeOf(letter="xYbAMhwFKI"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GroupSizeOf_0029 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_SIZE_OF_0030
     * @tc.name      CitySearch_GroupSizeOf_0030
     * @tc.desc      groupSizeOf(letter="Q4ow") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupSizeOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupSizeOf_0030 begin`);
      const actual: number = groupSizeOf('Q4ow');
      logInfo(`groupSizeOf(letter="Q4ow"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GroupSizeOf_0030 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_SIZE_OF_0031
     * @tc.name      CitySearch_GroupSizeOf_0031
     * @tc.desc      groupSizeOf(letter="ZJQkj") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupSizeOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupSizeOf_0031 begin`);
      const actual: number = groupSizeOf('ZJQkj');
      logInfo(`groupSizeOf(letter="ZJQkj"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GroupSizeOf_0031 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_SIZE_OF_0032
     * @tc.name      CitySearch_GroupSizeOf_0032
     * @tc.desc      groupSizeOf(letter="MZDhn") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupSizeOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupSizeOf_0032 begin`);
      const actual: number = groupSizeOf('MZDhn');
      logInfo(`groupSizeOf(letter="MZDhn"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GroupSizeOf_0032 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_SIZE_OF_0033
     * @tc.name      CitySearch_GroupSizeOf_0033
     * @tc.desc      groupSizeOf(letter="ar4dm") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupSizeOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupSizeOf_0033 begin`);
      const actual: number = groupSizeOf('ar4dm');
      logInfo(`groupSizeOf(letter="ar4dm"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GroupSizeOf_0033 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_SIZE_OF_0034
     * @tc.name      CitySearch_GroupSizeOf_0034
     * @tc.desc      groupSizeOf(letter="AU") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupSizeOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupSizeOf_0034 begin`);
      const actual: number = groupSizeOf('AU');
      logInfo(`groupSizeOf(letter="AU"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GroupSizeOf_0034 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_SIZE_OF_0035
     * @tc.name      CitySearch_GroupSizeOf_0035
     * @tc.desc      groupSizeOf(letter="DthH8d1I2Aa") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupSizeOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupSizeOf_0035 begin`);
      const actual: number = groupSizeOf('DthH8d1I2Aa');
      logInfo(`groupSizeOf(letter="DthH8d1I2Aa"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GroupSizeOf_0035 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_SIZE_OF_0036
     * @tc.name      CitySearch_GroupSizeOf_0036
     * @tc.desc      groupSizeOf(letter="ENco") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupSizeOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupSizeOf_0036 begin`);
      const actual: number = groupSizeOf('ENco');
      logInfo(`groupSizeOf(letter="ENco"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GroupSizeOf_0036 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_SIZE_OF_0037
     * @tc.name      CitySearch_GroupSizeOf_0037
     * @tc.desc      groupSizeOf(letter="nwQ0j43eXSU") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupSizeOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupSizeOf_0037 begin`);
      const actual: number = groupSizeOf('nwQ0j43eXSU');
      logInfo(`groupSizeOf(letter="nwQ0j43eXSU"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GroupSizeOf_0037 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_SIZE_OF_0038
     * @tc.name      CitySearch_GroupSizeOf_0038
     * @tc.desc      groupSizeOf(letter="xdC5eGMobfV4") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupSizeOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupSizeOf_0038 begin`);
      const actual: number = groupSizeOf('xdC5eGMobfV4');
      logInfo(`groupSizeOf(letter="xdC5eGMobfV4"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GroupSizeOf_0038 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_SIZE_OF_0039
     * @tc.name      CitySearch_GroupSizeOf_0039
     * @tc.desc      groupSizeOf(letter="jsrvOIDC") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupSizeOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupSizeOf_0039 begin`);
      const actual: number = groupSizeOf('jsrvOIDC');
      logInfo(`groupSizeOf(letter="jsrvOIDC"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GroupSizeOf_0039 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_SIZE_OF_0040
     * @tc.name      CitySearch_GroupSizeOf_0040
     * @tc.desc      groupSizeOf(letter="ESSAbC") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupSizeOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupSizeOf_0040 begin`);
      const actual: number = groupSizeOf('ESSAbC');
      logInfo(`groupSizeOf(letter="ESSAbC"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GroupSizeOf_0040 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_SIZE_OF_0041
     * @tc.name      CitySearch_GroupSizeOf_0041
     * @tc.desc      groupSizeOf(letter="iQ4R") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupSizeOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupSizeOf_0041 begin`);
      const actual: number = groupSizeOf('iQ4R');
      logInfo(`groupSizeOf(letter="iQ4R"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GroupSizeOf_0041 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_SIZE_OF_0042
     * @tc.name      CitySearch_GroupSizeOf_0042
     * @tc.desc      groupSizeOf(letter="pr3bpo0dt") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupSizeOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupSizeOf_0042 begin`);
      const actual: number = groupSizeOf('pr3bpo0dt');
      logInfo(`groupSizeOf(letter="pr3bpo0dt"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GroupSizeOf_0042 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_SIZE_OF_0043
     * @tc.name      CitySearch_GroupSizeOf_0043
     * @tc.desc      groupSizeOf(letter="9nqv6fqChT") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupSizeOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupSizeOf_0043 begin`);
      const actual: number = groupSizeOf('9nqv6fqChT');
      logInfo(`groupSizeOf(letter="9nqv6fqChT"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GroupSizeOf_0043 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_SIZE_OF_0044
     * @tc.name      CitySearch_GroupSizeOf_0044
     * @tc.desc      groupSizeOf(letter="Ppj6") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupSizeOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupSizeOf_0044 begin`);
      const actual: number = groupSizeOf('Ppj6');
      logInfo(`groupSizeOf(letter="Ppj6"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GroupSizeOf_0044 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_SIZE_OF_0045
     * @tc.name      CitySearch_GroupSizeOf_0045
     * @tc.desc      groupSizeOf(letter="bMU28H3NK") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupSizeOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupSizeOf_0045 begin`);
      const actual: number = groupSizeOf('bMU28H3NK');
      logInfo(`groupSizeOf(letter="bMU28H3NK"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GroupSizeOf_0045 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_SIZE_OF_0046
     * @tc.name      CitySearch_GroupSizeOf_0046
     * @tc.desc      groupSizeOf(letter="WR") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupSizeOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupSizeOf_0046 begin`);
      const actual: number = groupSizeOf('WR');
      logInfo(`groupSizeOf(letter="WR"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GroupSizeOf_0046 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_SIZE_OF_0047
     * @tc.name      CitySearch_GroupSizeOf_0047
     * @tc.desc      groupSizeOf(letter="gkYCw9pNOyFP") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupSizeOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupSizeOf_0047 begin`);
      const actual: number = groupSizeOf('gkYCw9pNOyFP');
      logInfo(`groupSizeOf(letter="gkYCw9pNOyFP"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GroupSizeOf_0047 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_SIZE_OF_0048
     * @tc.name      CitySearch_GroupSizeOf_0048
     * @tc.desc      groupSizeOf(letter="VK1GV8") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupSizeOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupSizeOf_0048 begin`);
      const actual: number = groupSizeOf('VK1GV8');
      logInfo(`groupSizeOf(letter="VK1GV8"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GroupSizeOf_0048 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_SIZE_OF_0049
     * @tc.name      CitySearch_GroupSizeOf_0049
     * @tc.desc      groupSizeOf(letter="Ob4") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupSizeOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupSizeOf_0049 begin`);
      const actual: number = groupSizeOf('Ob4');
      logInfo(`groupSizeOf(letter="Ob4"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GroupSizeOf_0049 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_SIZE_OF_0050
     * @tc.name      CitySearch_GroupSizeOf_0050
     * @tc.desc      groupSizeOf(letter="IQhL") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupSizeOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupSizeOf_0050 begin`);
      const actual: number = groupSizeOf('IQhL');
      logInfo(`groupSizeOf(letter="IQhL"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GroupSizeOf_0050 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_SIZE_OF_0051
     * @tc.name      CitySearch_GroupSizeOf_0051
     * @tc.desc      groupSizeOf(letter="QefreL3xZ") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupSizeOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupSizeOf_0051 begin`);
      const actual: number = groupSizeOf('QefreL3xZ');
      logInfo(`groupSizeOf(letter="QefreL3xZ"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GroupSizeOf_0051 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_SIZE_OF_0052
     * @tc.name      CitySearch_GroupSizeOf_0052
     * @tc.desc      groupSizeOf(letter="oxKlU9SGPG4") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupSizeOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupSizeOf_0052 begin`);
      const actual: number = groupSizeOf('oxKlU9SGPG4');
      logInfo(`groupSizeOf(letter="oxKlU9SGPG4"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GroupSizeOf_0052 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_SIZE_OF_0053
     * @tc.name      CitySearch_GroupSizeOf_0053
     * @tc.desc      groupSizeOf(letter="R3mk8E1") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupSizeOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupSizeOf_0053 begin`);
      const actual: number = groupSizeOf('R3mk8E1');
      logInfo(`groupSizeOf(letter="R3mk8E1"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GroupSizeOf_0053 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_SIZE_OF_0054
     * @tc.name      CitySearch_GroupSizeOf_0054
     * @tc.desc      groupSizeOf(letter="3KvFp3lZ0") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupSizeOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupSizeOf_0054 begin`);
      const actual: number = groupSizeOf('3KvFp3lZ0');
      logInfo(`groupSizeOf(letter="3KvFp3lZ0"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GroupSizeOf_0054 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_SIZE_OF_0055
     * @tc.name      CitySearch_GroupSizeOf_0055
     * @tc.desc      groupSizeOf(letter="AJSpE") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupSizeOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupSizeOf_0055 begin`);
      const actual: number = groupSizeOf('AJSpE');
      logInfo(`groupSizeOf(letter="AJSpE"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GroupSizeOf_0055 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_SIZE_OF_0056
     * @tc.name      CitySearch_GroupSizeOf_0056
     * @tc.desc      groupSizeOf(letter="V") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupSizeOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupSizeOf_0056 begin`);
      const actual: number = groupSizeOf('V');
      logInfo(`groupSizeOf(letter="V"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GroupSizeOf_0056 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_SIZE_OF_0057
     * @tc.name      CitySearch_GroupSizeOf_0057
     * @tc.desc      groupSizeOf(letter="hoyQjrtlZuC") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupSizeOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupSizeOf_0057 begin`);
      const actual: number = groupSizeOf('hoyQjrtlZuC');
      logInfo(`groupSizeOf(letter="hoyQjrtlZuC"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GroupSizeOf_0057 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_SIZE_OF_0058
     * @tc.name      CitySearch_GroupSizeOf_0058
     * @tc.desc      groupSizeOf(letter="lwVh") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupSizeOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupSizeOf_0058 begin`);
      const actual: number = groupSizeOf('lwVh');
      logInfo(`groupSizeOf(letter="lwVh"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GroupSizeOf_0058 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_SIZE_OF_0059
     * @tc.name      CitySearch_GroupSizeOf_0059
     * @tc.desc      groupSizeOf(letter="oJ") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupSizeOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupSizeOf_0059 begin`);
      const actual: number = groupSizeOf('oJ');
      logInfo(`groupSizeOf(letter="oJ"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GroupSizeOf_0059 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_SIZE_OF_0060
     * @tc.name      CitySearch_GroupSizeOf_0060
     * @tc.desc      groupSizeOf(letter="aHaIh") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupSizeOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupSizeOf_0060 begin`);
      const actual: number = groupSizeOf('aHaIh');
      logInfo(`groupSizeOf(letter="aHaIh"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GroupSizeOf_0060 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_SIZE_OF_0061
     * @tc.name      CitySearch_GroupSizeOf_0061
     * @tc.desc      groupSizeOf(letter="T5tfn") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupSizeOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupSizeOf_0061 begin`);
      const actual: number = groupSizeOf('T5tfn');
      logInfo(`groupSizeOf(letter="T5tfn"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GroupSizeOf_0061 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_SIZE_OF_0062
     * @tc.name      CitySearch_GroupSizeOf_0062
     * @tc.desc      groupSizeOf(letter="8Yq") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupSizeOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupSizeOf_0062 begin`);
      const actual: number = groupSizeOf('8Yq');
      logInfo(`groupSizeOf(letter="8Yq"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GroupSizeOf_0062 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_SIZE_OF_0063
     * @tc.name      CitySearch_GroupSizeOf_0063
     * @tc.desc      groupSizeOf(letter="kJ") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupSizeOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupSizeOf_0063 begin`);
      const actual: number = groupSizeOf('kJ');
      logInfo(`groupSizeOf(letter="kJ"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GroupSizeOf_0063 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_SIZE_OF_0064
     * @tc.name      CitySearch_GroupSizeOf_0064
     * @tc.desc      groupSizeOf(letter="NHiBgAcRJrJ") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupSizeOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupSizeOf_0064 begin`);
      const actual: number = groupSizeOf('NHiBgAcRJrJ');
      logInfo(`groupSizeOf(letter="NHiBgAcRJrJ"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GroupSizeOf_0064 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_SIZE_OF_0065
     * @tc.name      CitySearch_GroupSizeOf_0065
     * @tc.desc      groupSizeOf(letter="KQmSTv") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupSizeOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupSizeOf_0065 begin`);
      const actual: number = groupSizeOf('KQmSTv');
      logInfo(`groupSizeOf(letter="KQmSTv"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GroupSizeOf_0065 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_SIZE_OF_0066
     * @tc.name      CitySearch_GroupSizeOf_0066
     * @tc.desc      groupSizeOf(letter="xV4Ir") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupSizeOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupSizeOf_0066 begin`);
      const actual: number = groupSizeOf('xV4Ir');
      logInfo(`groupSizeOf(letter="xV4Ir"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GroupSizeOf_0066 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_SIZE_OF_0067
     * @tc.name      CitySearch_GroupSizeOf_0067
     * @tc.desc      groupSizeOf(letter="Ai7") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupSizeOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupSizeOf_0067 begin`);
      const actual: number = groupSizeOf('Ai7');
      logInfo(`groupSizeOf(letter="Ai7"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GroupSizeOf_0067 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_SIZE_OF_0068
     * @tc.name      CitySearch_GroupSizeOf_0068
     * @tc.desc      groupSizeOf(letter="If8M2z") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupSizeOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupSizeOf_0068 begin`);
      const actual: number = groupSizeOf('If8M2z');
      logInfo(`groupSizeOf(letter="If8M2z"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GroupSizeOf_0068 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_SIZE_OF_0069
     * @tc.name      CitySearch_GroupSizeOf_0069
     * @tc.desc      groupSizeOf(letter="2y1vB3n") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupSizeOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupSizeOf_0069 begin`);
      const actual: number = groupSizeOf('2y1vB3n');
      logInfo(`groupSizeOf(letter="2y1vB3n"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GroupSizeOf_0069 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_SIZE_OF_0070
     * @tc.name      CitySearch_GroupSizeOf_0070
     * @tc.desc      groupSizeOf(letter="w3") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupSizeOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupSizeOf_0070 begin`);
      const actual: number = groupSizeOf('w3');
      logInfo(`groupSizeOf(letter="w3"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GroupSizeOf_0070 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_SIZE_OF_0071
     * @tc.name      CitySearch_GroupSizeOf_0071
     * @tc.desc      groupSizeOf(letter="CYiDWwrFXau") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupSizeOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupSizeOf_0071 begin`);
      const actual: number = groupSizeOf('CYiDWwrFXau');
      logInfo(`groupSizeOf(letter="CYiDWwrFXau"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GroupSizeOf_0071 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_SIZE_OF_0072
     * @tc.name      CitySearch_GroupSizeOf_0072
     * @tc.desc      groupSizeOf(letter="TBD17Mq26D") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupSizeOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupSizeOf_0072 begin`);
      const actual: number = groupSizeOf('TBD17Mq26D');
      logInfo(`groupSizeOf(letter="TBD17Mq26D"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GroupSizeOf_0072 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_SIZE_OF_0073
     * @tc.name      CitySearch_GroupSizeOf_0073
     * @tc.desc      groupSizeOf(letter="s2E8s3Bo") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupSizeOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupSizeOf_0073 begin`);
      const actual: number = groupSizeOf('s2E8s3Bo');
      logInfo(`groupSizeOf(letter="s2E8s3Bo"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GroupSizeOf_0073 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_SIZE_OF_0074
     * @tc.name      CitySearch_GroupSizeOf_0074
     * @tc.desc      groupSizeOf(letter="Zc4hW8is3") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupSizeOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupSizeOf_0074 begin`);
      const actual: number = groupSizeOf('Zc4hW8is3');
      logInfo(`groupSizeOf(letter="Zc4hW8is3"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GroupSizeOf_0074 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_SIZE_OF_0075
     * @tc.name      CitySearch_GroupSizeOf_0075
     * @tc.desc      groupSizeOf(letter="Gh1l9HV") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupSizeOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupSizeOf_0075 begin`);
      const actual: number = groupSizeOf('Gh1l9HV');
      logInfo(`groupSizeOf(letter="Gh1l9HV"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}GroupSizeOf_0075 end`);
    });
  });
}
