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
import { matchedLetterIndexOf } from '../model/CitySearchLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CitySearch]';
const BUNDLE: string = 'CitySearch_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for matchedLetterIndexOf (96 cases). */
export default function matchedLetterIndexOfTest(): void {
  describe('MatchedLetterIndexOfTest', () => {
    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0001
     * @tc.name      CitySearch_MatchedLetterIndexOf_0001
     * @tc.desc      matchedLetterIndexOf(value="Hello") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_MatchedLetterIndexOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0001 begin`);
      const actual: number = matchedLetterIndexOf('Hello');
      logInfo(`matchedLetterIndexOf(value="Hello"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0001 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0002
     * @tc.name      CitySearch_MatchedLetterIndexOf_0002
     * @tc.desc      matchedLetterIndexOf(value="") returns 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_MatchedLetterIndexOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0002 begin`);
      const actual: number = matchedLetterIndexOf('');
      logInfo(`matchedLetterIndexOf(value=""): actual=${actual}`);
      expect(actual).assertEqual(15);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0002 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0003
     * @tc.name      CitySearch_MatchedLetterIndexOf_0003
     * @tc.desc      matchedLetterIndexOf(value="A") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0003 begin`);
      const actual: number = matchedLetterIndexOf('A');
      logInfo(`matchedLetterIndexOf(value="A"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0003 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0004
     * @tc.name      CitySearch_MatchedLetterIndexOf_0004
     * @tc.desc      matchedLetterIndexOf(value="h") returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0004 begin`);
      const actual: number = matchedLetterIndexOf('h');
      logInfo(`matchedLetterIndexOf(value="h"): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0004 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0005
     * @tc.name      CitySearch_MatchedLetterIndexOf_0005
     * @tc.desc      matchedLetterIndexOf(value="g") returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0005 begin`);
      const actual: number = matchedLetterIndexOf('g');
      logInfo(`matchedLetterIndexOf(value="g"): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0005 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0006
     * @tc.name      CitySearch_MatchedLetterIndexOf_0006
     * @tc.desc      matchedLetterIndexOf(value="c") returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0006 begin`);
      const actual: number = matchedLetterIndexOf('c');
      logInfo(`matchedLetterIndexOf(value="c"): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0006 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0007
     * @tc.name      CitySearch_MatchedLetterIndexOf_0007
     * @tc.desc      matchedLetterIndexOf(value="hello world") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0007 begin`);
      const actual: number = matchedLetterIndexOf('hello world');
      logInfo(`matchedLetterIndexOf(value="hello world"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0007 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0008
     * @tc.name      CitySearch_MatchedLetterIndexOf_0008
     * @tc.desc      matchedLetterIndexOf(value=" ") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0008 begin`);
      const actual: number = matchedLetterIndexOf(' ');
      logInfo(`matchedLetterIndexOf(value=" "): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0008 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0009
     * @tc.name      CitySearch_MatchedLetterIndexOf_0009
     * @tc.desc      matchedLetterIndexOf(value="Sample Title 123") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0009 begin`);
      const actual: number = matchedLetterIndexOf('Sample Title 123');
      logInfo(`matchedLetterIndexOf(value="Sample Title ...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0009 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0010
     * @tc.name      CitySearch_MatchedLetterIndexOf_0010
     * @tc.desc      matchedLetterIndexOf(value="??") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0010 begin`);
      const actual: number = matchedLetterIndexOf('\u4e2d\u6587');
      logInfo(`matchedLetterIndexOf(value="??"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0010 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0011
     * @tc.name      CitySearch_MatchedLetterIndexOf_0011
     * @tc.desc      matchedLetterIndexOf(value="a") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0011 begin`);
      const actual: number = matchedLetterIndexOf('a');
      logInfo(`matchedLetterIndexOf(value="a"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0011 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0012
     * @tc.name      CitySearch_MatchedLetterIndexOf_0012
     * @tc.desc      matchedLetterIndexOf(value="abc") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0012 begin`);
      const actual: number = matchedLetterIndexOf('abc');
      logInfo(`matchedLetterIndexOf(value="abc"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0012 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0013
     * @tc.name      CitySearch_MatchedLetterIndexOf_0013
     * @tc.desc      matchedLetterIndexOf(value="Hello World") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0013 begin`);
      const actual: number = matchedLetterIndexOf('Hello World');
      logInfo(`matchedLetterIndexOf(value="Hello World"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0013 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0014
     * @tc.name      CitySearch_MatchedLetterIndexOf_0014
     * @tc.desc      matchedLetterIndexOf(value="123") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0014 begin`);
      const actual: number = matchedLetterIndexOf('123');
      logInfo(`matchedLetterIndexOf(value="123"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0014 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0015
     * @tc.name      CitySearch_MatchedLetterIndexOf_0015
     * @tc.desc      matchedLetterIndexOf(value=" Hello ") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_MatchedLetterIndexOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0015 begin`);
      const actual: number = matchedLetterIndexOf(' Hello ');
      logInfo(`matchedLetterIndexOf(value=" Hello "): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0015 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0016
     * @tc.name      CitySearch_MatchedLetterIndexOf_0016
     * @tc.desc      matchedLetterIndexOf(value="HelloHello") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0016 begin`);
      const actual: number = matchedLetterIndexOf('HelloHello');
      logInfo(`matchedLetterIndexOf(value="HelloHello"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0016 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0017
     * @tc.name      CitySearch_MatchedLetterIndexOf_0017
     * @tc.desc      matchedLetterIndexOf(value="Hello_1") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0017 begin`);
      const actual: number = matchedLetterIndexOf('Hello_1');
      logInfo(`matchedLetterIndexOf(value="Hello_1"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0017 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0018
     * @tc.name      CitySearch_MatchedLetterIndexOf_0018
     * @tc.desc      matchedLetterIndexOf(value="xHello") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_MatchedLetterIndexOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0018 begin`);
      const actual: number = matchedLetterIndexOf('xHello');
      logInfo(`matchedLetterIndexOf(value="xHello"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0018 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0019
     * @tc.name      CitySearch_MatchedLetterIndexOf_0019
     * @tc.desc      matchedLetterIndexOf(value=" hello world ") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_MatchedLetterIndexOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0019 begin`);
      const actual: number = matchedLetterIndexOf(' hello world ');
      logInfo(`matchedLetterIndexOf(value=" hello world "): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0019 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0020
     * @tc.name      CitySearch_MatchedLetterIndexOf_0020
     * @tc.desc      matchedLetterIndexOf(value="hello worldhello world") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0020 begin`);
      const actual: number = matchedLetterIndexOf('hello worldhello world');
      logInfo(`matchedLetterIndexOf(value="hello worldhe...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0020 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0021
     * @tc.name      CitySearch_MatchedLetterIndexOf_0021
     * @tc.desc      matchedLetterIndexOf(value="hello world_1") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0021 begin`);
      const actual: number = matchedLetterIndexOf('hello world_1');
      logInfo(`matchedLetterIndexOf(value="hello world_1"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0021 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0022
     * @tc.name      CitySearch_MatchedLetterIndexOf_0022
     * @tc.desc      matchedLetterIndexOf(value="xhello world") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_MatchedLetterIndexOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0022 begin`);
      const actual: number = matchedLetterIndexOf('xhello world');
      logInfo(`matchedLetterIndexOf(value="xhello world"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0022 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0023
     * @tc.name      CitySearch_MatchedLetterIndexOf_0023
     * @tc.desc      matchedLetterIndexOf(value="   ") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_MatchedLetterIndexOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0023 begin`);
      const actual: number = matchedLetterIndexOf('   ');
      logInfo(`matchedLetterIndexOf(value="   "): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0023 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0024
     * @tc.name      CitySearch_MatchedLetterIndexOf_0024
     * @tc.desc      matchedLetterIndexOf(value="  ") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0024 begin`);
      const actual: number = matchedLetterIndexOf('  ');
      logInfo(`matchedLetterIndexOf(value="  "): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0024 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0025
     * @tc.name      CitySearch_MatchedLetterIndexOf_0025
     * @tc.desc      matchedLetterIndexOf(value=" _1") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0025 begin`);
      const actual: number = matchedLetterIndexOf(' _1');
      logInfo(`matchedLetterIndexOf(value=" _1"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0025 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0026
     * @tc.name      CitySearch_MatchedLetterIndexOf_0026
     * @tc.desc      matchedLetterIndexOf(value="x ") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_MatchedLetterIndexOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0026 begin`);
      const actual: number = matchedLetterIndexOf('x ');
      logInfo(`matchedLetterIndexOf(value="x "): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0026 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0027
     * @tc.name      CitySearch_MatchedLetterIndexOf_0027
     * @tc.desc      matchedLetterIndexOf(value=" A ") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_MatchedLetterIndexOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0027 begin`);
      const actual: number = matchedLetterIndexOf(' A ');
      logInfo(`matchedLetterIndexOf(value=" A "): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0027 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0028
     * @tc.name      CitySearch_MatchedLetterIndexOf_0028
     * @tc.desc      matchedLetterIndexOf(value="AA") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0028 begin`);
      const actual: number = matchedLetterIndexOf('AA');
      logInfo(`matchedLetterIndexOf(value="AA"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0028 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0029
     * @tc.name      CitySearch_MatchedLetterIndexOf_0029
     * @tc.desc      matchedLetterIndexOf(value="A_1") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0029 begin`);
      const actual: number = matchedLetterIndexOf('A_1');
      logInfo(`matchedLetterIndexOf(value="A_1"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0029 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0030
     * @tc.name      CitySearch_MatchedLetterIndexOf_0030
     * @tc.desc      matchedLetterIndexOf(value="xA") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_MatchedLetterIndexOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0030 begin`);
      const actual: number = matchedLetterIndexOf('xA');
      logInfo(`matchedLetterIndexOf(value="xA"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0030 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0031
     * @tc.name      CitySearch_MatchedLetterIndexOf_0031
     * @tc.desc      matchedLetterIndexOf(value=" Sample Title 123 ") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_MatchedLetterIndexOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0031 begin`);
      const actual: number = matchedLetterIndexOf(' Sample Title 123 ');
      logInfo(`matchedLetterIndexOf(value=" Sample Title...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0031 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0032
     * @tc.name      CitySearch_MatchedLetterIndexOf_0032
     * @tc.desc      matchedLetterIndexOf(value="Sample Title 123Sample Title 123") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0032 begin`);
      const actual: number = matchedLetterIndexOf('Sample Title 123Sample Title 123');
      logInfo(`matchedLetterIndexOf(value="Sample Title ...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0032 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0033
     * @tc.name      CitySearch_MatchedLetterIndexOf_0033
     * @tc.desc      matchedLetterIndexOf(value="Sample Title 123_1") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0033 begin`);
      const actual: number = matchedLetterIndexOf('Sample Title 123_1');
      logInfo(`matchedLetterIndexOf(value="Sample Title ...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0033 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0034
     * @tc.name      CitySearch_MatchedLetterIndexOf_0034
     * @tc.desc      matchedLetterIndexOf(value="xSample Title 123") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_MatchedLetterIndexOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0034 begin`);
      const actual: number = matchedLetterIndexOf('xSample Title 123');
      logInfo(`matchedLetterIndexOf(value="xSample Title...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0034 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0035
     * @tc.name      CitySearch_MatchedLetterIndexOf_0035
     * @tc.desc      matchedLetterIndexOf(value=" ?? ") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_MatchedLetterIndexOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0035 begin`);
      const actual: number = matchedLetterIndexOf(' \u4e2d\u6587 ');
      logInfo(`matchedLetterIndexOf(value=" ?? "): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0035 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0036
     * @tc.name      CitySearch_MatchedLetterIndexOf_0036
     * @tc.desc      matchedLetterIndexOf(value="????") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0036 begin`);
      const actual: number = matchedLetterIndexOf('\u4e2d\u6587\u4e2d\u6587');
      logInfo(`matchedLetterIndexOf(value="????"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0036 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0037
     * @tc.name      CitySearch_MatchedLetterIndexOf_0037
     * @tc.desc      matchedLetterIndexOf(value="??_1") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0037 begin`);
      const actual: number = matchedLetterIndexOf('\u4e2d\u6587_1');
      logInfo(`matchedLetterIndexOf(value="??_1"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0037 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0038
     * @tc.name      CitySearch_MatchedLetterIndexOf_0038
     * @tc.desc      matchedLetterIndexOf(value="x??") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_MatchedLetterIndexOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0038 begin`);
      const actual: number = matchedLetterIndexOf('x\u4e2d\u6587');
      logInfo(`matchedLetterIndexOf(value="x??"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0038 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0039
     * @tc.name      CitySearch_MatchedLetterIndexOf_0039
     * @tc.desc      matchedLetterIndexOf(value=" a ") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_MatchedLetterIndexOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0039 begin`);
      const actual: number = matchedLetterIndexOf(' a ');
      logInfo(`matchedLetterIndexOf(value=" a "): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0039 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0040
     * @tc.name      CitySearch_MatchedLetterIndexOf_0040
     * @tc.desc      matchedLetterIndexOf(value="aa") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0040 begin`);
      const actual: number = matchedLetterIndexOf('aa');
      logInfo(`matchedLetterIndexOf(value="aa"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0040 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0041
     * @tc.name      CitySearch_MatchedLetterIndexOf_0041
     * @tc.desc      matchedLetterIndexOf(value="a_1") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0041 begin`);
      const actual: number = matchedLetterIndexOf('a_1');
      logInfo(`matchedLetterIndexOf(value="a_1"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0041 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0042
     * @tc.name      CitySearch_MatchedLetterIndexOf_0042
     * @tc.desc      matchedLetterIndexOf(value="xa") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_MatchedLetterIndexOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0042 begin`);
      const actual: number = matchedLetterIndexOf('xa');
      logInfo(`matchedLetterIndexOf(value="xa"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0042 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0043
     * @tc.name      CitySearch_MatchedLetterIndexOf_0043
     * @tc.desc      matchedLetterIndexOf(value=" abc ") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_MatchedLetterIndexOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0043 begin`);
      const actual: number = matchedLetterIndexOf(' abc ');
      logInfo(`matchedLetterIndexOf(value=" abc "): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0043 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0044
     * @tc.name      CitySearch_MatchedLetterIndexOf_0044
     * @tc.desc      matchedLetterIndexOf(value="abcabc") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0044 begin`);
      const actual: number = matchedLetterIndexOf('abcabc');
      logInfo(`matchedLetterIndexOf(value="abcabc"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0044 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0045
     * @tc.name      CitySearch_MatchedLetterIndexOf_0045
     * @tc.desc      matchedLetterIndexOf(value="abc_1") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0045 begin`);
      const actual: number = matchedLetterIndexOf('abc_1');
      logInfo(`matchedLetterIndexOf(value="abc_1"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0045 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0046
     * @tc.name      CitySearch_MatchedLetterIndexOf_0046
     * @tc.desc      matchedLetterIndexOf(value="xabc") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_MatchedLetterIndexOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0046 begin`);
      const actual: number = matchedLetterIndexOf('xabc');
      logInfo(`matchedLetterIndexOf(value="xabc"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0046 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0047
     * @tc.name      CitySearch_MatchedLetterIndexOf_0047
     * @tc.desc      matchedLetterIndexOf(value=" Hello World ") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_MatchedLetterIndexOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0047 begin`);
      const actual: number = matchedLetterIndexOf(' Hello World ');
      logInfo(`matchedLetterIndexOf(value=" Hello World "): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0047 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0048
     * @tc.name      CitySearch_MatchedLetterIndexOf_0048
     * @tc.desc      matchedLetterIndexOf(value="Hello WorldHello World") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0048 begin`);
      const actual: number = matchedLetterIndexOf('Hello WorldHello World');
      logInfo(`matchedLetterIndexOf(value="Hello WorldHe...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0048 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0049
     * @tc.name      CitySearch_MatchedLetterIndexOf_0049
     * @tc.desc      matchedLetterIndexOf(value="Hello World_1") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0049 begin`);
      const actual: number = matchedLetterIndexOf('Hello World_1');
      logInfo(`matchedLetterIndexOf(value="Hello World_1"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0049 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0050
     * @tc.name      CitySearch_MatchedLetterIndexOf_0050
     * @tc.desc      matchedLetterIndexOf(value="xHello World") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_MatchedLetterIndexOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0050 begin`);
      const actual: number = matchedLetterIndexOf('xHello World');
      logInfo(`matchedLetterIndexOf(value="xHello World"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0050 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0051
     * @tc.name      CitySearch_MatchedLetterIndexOf_0051
     * @tc.desc      matchedLetterIndexOf(value=" 123 ") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_MatchedLetterIndexOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0051 begin`);
      const actual: number = matchedLetterIndexOf(' 123 ');
      logInfo(`matchedLetterIndexOf(value=" 123 "): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0051 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0052
     * @tc.name      CitySearch_MatchedLetterIndexOf_0052
     * @tc.desc      matchedLetterIndexOf(value="123123") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0052 begin`);
      const actual: number = matchedLetterIndexOf('123123');
      logInfo(`matchedLetterIndexOf(value="123123"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0052 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0053
     * @tc.name      CitySearch_MatchedLetterIndexOf_0053
     * @tc.desc      matchedLetterIndexOf(value="123_1") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0053 begin`);
      const actual: number = matchedLetterIndexOf('123_1');
      logInfo(`matchedLetterIndexOf(value="123_1"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0053 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0054
     * @tc.name      CitySearch_MatchedLetterIndexOf_0054
     * @tc.desc      matchedLetterIndexOf(value="x123") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_MatchedLetterIndexOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0054 begin`);
      const actual: number = matchedLetterIndexOf('x123');
      logInfo(`matchedLetterIndexOf(value="x123"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0054 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0055
     * @tc.name      CitySearch_MatchedLetterIndexOf_0055
     * @tc.desc      matchedLetterIndexOf(value="qh") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0055 begin`);
      const actual: number = matchedLetterIndexOf('qh');
      logInfo(`matchedLetterIndexOf(value="qh"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0055 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0056
     * @tc.name      CitySearch_MatchedLetterIndexOf_0056
     * @tc.desc      matchedLetterIndexOf(value="gmJJ7") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0056 begin`);
      const actual: number = matchedLetterIndexOf('gmJJ7');
      logInfo(`matchedLetterIndexOf(value="gmJJ7"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0056 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0057
     * @tc.name      CitySearch_MatchedLetterIndexOf_0057
     * @tc.desc      matchedLetterIndexOf(value="4ifz") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0057 begin`);
      const actual: number = matchedLetterIndexOf('4ifz');
      logInfo(`matchedLetterIndexOf(value="4ifz"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0057 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0058
     * @tc.name      CitySearch_MatchedLetterIndexOf_0058
     * @tc.desc      matchedLetterIndexOf(value="Kn7N11B4Oa") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0058 begin`);
      const actual: number = matchedLetterIndexOf('Kn7N11B4Oa');
      logInfo(`matchedLetterIndexOf(value="Kn7N11B4Oa"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0058 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0059
     * @tc.name      CitySearch_MatchedLetterIndexOf_0059
     * @tc.desc      matchedLetterIndexOf(value="aMM") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0059 begin`);
      const actual: number = matchedLetterIndexOf('aMM');
      logInfo(`matchedLetterIndexOf(value="aMM"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0059 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0060
     * @tc.name      CitySearch_MatchedLetterIndexOf_0060
     * @tc.desc      matchedLetterIndexOf(value="aQYMLw4g") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0060 begin`);
      const actual: number = matchedLetterIndexOf('aQYMLw4g');
      logInfo(`matchedLetterIndexOf(value="aQYMLw4g"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0060 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0061
     * @tc.name      CitySearch_MatchedLetterIndexOf_0061
     * @tc.desc      matchedLetterIndexOf(value="oeQbfF") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0061 begin`);
      const actual: number = matchedLetterIndexOf('oeQbfF');
      logInfo(`matchedLetterIndexOf(value="oeQbfF"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0061 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0062
     * @tc.name      CitySearch_MatchedLetterIndexOf_0062
     * @tc.desc      matchedLetterIndexOf(value="CpWEKno") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0062 begin`);
      const actual: number = matchedLetterIndexOf('CpWEKno');
      logInfo(`matchedLetterIndexOf(value="CpWEKno"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0062 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0063
     * @tc.name      CitySearch_MatchedLetterIndexOf_0063
     * @tc.desc      matchedLetterIndexOf(value="o") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0063 begin`);
      const actual: number = matchedLetterIndexOf('o');
      logInfo(`matchedLetterIndexOf(value="o"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0063 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0064
     * @tc.name      CitySearch_MatchedLetterIndexOf_0064
     * @tc.desc      matchedLetterIndexOf(value="Wke") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0064 begin`);
      const actual: number = matchedLetterIndexOf('Wke');
      logInfo(`matchedLetterIndexOf(value="Wke"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0064 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0065
     * @tc.name      CitySearch_MatchedLetterIndexOf_0065
     * @tc.desc      matchedLetterIndexOf(value="hS4morKxl") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0065 begin`);
      const actual: number = matchedLetterIndexOf('hS4morKxl');
      logInfo(`matchedLetterIndexOf(value="hS4morKxl"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0065 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0066
     * @tc.name      CitySearch_MatchedLetterIndexOf_0066
     * @tc.desc      matchedLetterIndexOf(value="TuQyf4aQiT") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0066 begin`);
      const actual: number = matchedLetterIndexOf('TuQyf4aQiT');
      logInfo(`matchedLetterIndexOf(value="TuQyf4aQiT"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0066 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0067
     * @tc.name      CitySearch_MatchedLetterIndexOf_0067
     * @tc.desc      matchedLetterIndexOf(value="xAzs40w") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0067 begin`);
      const actual: number = matchedLetterIndexOf('xAzs40w');
      logInfo(`matchedLetterIndexOf(value="xAzs40w"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0067 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0068
     * @tc.name      CitySearch_MatchedLetterIndexOf_0068
     * @tc.desc      matchedLetterIndexOf(value="30UriIPse8RG") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0068 begin`);
      const actual: number = matchedLetterIndexOf('30UriIPse8RG');
      logInfo(`matchedLetterIndexOf(value="30UriIPse8RG"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0068 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0069
     * @tc.name      CitySearch_MatchedLetterIndexOf_0069
     * @tc.desc      matchedLetterIndexOf(value="I") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0069 begin`);
      const actual: number = matchedLetterIndexOf('I');
      logInfo(`matchedLetterIndexOf(value="I"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0069 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0070
     * @tc.name      CitySearch_MatchedLetterIndexOf_0070
     * @tc.desc      matchedLetterIndexOf(value="uZ") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0070 begin`);
      const actual: number = matchedLetterIndexOf('uZ');
      logInfo(`matchedLetterIndexOf(value="uZ"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0070 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0071
     * @tc.name      CitySearch_MatchedLetterIndexOf_0071
     * @tc.desc      matchedLetterIndexOf(value="i2neNH1GX") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0071 begin`);
      const actual: number = matchedLetterIndexOf('i2neNH1GX');
      logInfo(`matchedLetterIndexOf(value="i2neNH1GX"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0071 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0072
     * @tc.name      CitySearch_MatchedLetterIndexOf_0072
     * @tc.desc      matchedLetterIndexOf(value="C6NWB7") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0072 begin`);
      const actual: number = matchedLetterIndexOf('C6NWB7');
      logInfo(`matchedLetterIndexOf(value="C6NWB7"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0072 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0073
     * @tc.name      CitySearch_MatchedLetterIndexOf_0073
     * @tc.desc      matchedLetterIndexOf(value="SP") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0073 begin`);
      const actual: number = matchedLetterIndexOf('SP');
      logInfo(`matchedLetterIndexOf(value="SP"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0073 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0074
     * @tc.name      CitySearch_MatchedLetterIndexOf_0074
     * @tc.desc      matchedLetterIndexOf(value="uiS5X1BwH") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0074 begin`);
      const actual: number = matchedLetterIndexOf('uiS5X1BwH');
      logInfo(`matchedLetterIndexOf(value="uiS5X1BwH"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0074 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0075
     * @tc.name      CitySearch_MatchedLetterIndexOf_0075
     * @tc.desc      matchedLetterIndexOf(value="DQhnFgB") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0075 begin`);
      const actual: number = matchedLetterIndexOf('DQhnFgB');
      logInfo(`matchedLetterIndexOf(value="DQhnFgB"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0075 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0076
     * @tc.name      CitySearch_MatchedLetterIndexOf_0076
     * @tc.desc      matchedLetterIndexOf(value="vnNfaZwavx") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0076 begin`);
      const actual: number = matchedLetterIndexOf('vnNfaZwavx');
      logInfo(`matchedLetterIndexOf(value="vnNfaZwavx"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0076 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0077
     * @tc.name      CitySearch_MatchedLetterIndexOf_0077
     * @tc.desc      matchedLetterIndexOf(value="2l") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0077 begin`);
      const actual: number = matchedLetterIndexOf('2l');
      logInfo(`matchedLetterIndexOf(value="2l"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0077 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0078
     * @tc.name      CitySearch_MatchedLetterIndexOf_0078
     * @tc.desc      matchedLetterIndexOf(value="5hzT7G0d") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0078 begin`);
      const actual: number = matchedLetterIndexOf('5hzT7G0d');
      logInfo(`matchedLetterIndexOf(value="5hzT7G0d"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0078 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0079
     * @tc.name      CitySearch_MatchedLetterIndexOf_0079
     * @tc.desc      matchedLetterIndexOf(value="UCj61") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0079 begin`);
      const actual: number = matchedLetterIndexOf('UCj61');
      logInfo(`matchedLetterIndexOf(value="UCj61"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0079 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0080
     * @tc.name      CitySearch_MatchedLetterIndexOf_0080
     * @tc.desc      matchedLetterIndexOf(value="AO5pn04K") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0080 begin`);
      const actual: number = matchedLetterIndexOf('AO5pn04K');
      logInfo(`matchedLetterIndexOf(value="AO5pn04K"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0080 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0081
     * @tc.name      CitySearch_MatchedLetterIndexOf_0081
     * @tc.desc      matchedLetterIndexOf(value="opoEjwDcCa2") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0081 begin`);
      const actual: number = matchedLetterIndexOf('opoEjwDcCa2');
      logInfo(`matchedLetterIndexOf(value="opoEjwDcCa2"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0081 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0082
     * @tc.name      CitySearch_MatchedLetterIndexOf_0082
     * @tc.desc      matchedLetterIndexOf(value="W2XorMsa") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0082 begin`);
      const actual: number = matchedLetterIndexOf('W2XorMsa');
      logInfo(`matchedLetterIndexOf(value="W2XorMsa"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0082 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0083
     * @tc.name      CitySearch_MatchedLetterIndexOf_0083
     * @tc.desc      matchedLetterIndexOf(value="cYa") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0083 begin`);
      const actual: number = matchedLetterIndexOf('cYa');
      logInfo(`matchedLetterIndexOf(value="cYa"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0083 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0084
     * @tc.name      CitySearch_MatchedLetterIndexOf_0084
     * @tc.desc      matchedLetterIndexOf(value="pOaa1") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0084 begin`);
      const actual: number = matchedLetterIndexOf('pOaa1');
      logInfo(`matchedLetterIndexOf(value="pOaa1"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0084 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0085
     * @tc.name      CitySearch_MatchedLetterIndexOf_0085
     * @tc.desc      matchedLetterIndexOf(value="Odn60k0y2IO") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0085 begin`);
      const actual: number = matchedLetterIndexOf('Odn60k0y2IO');
      logInfo(`matchedLetterIndexOf(value="Odn60k0y2IO"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0085 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0086
     * @tc.name      CitySearch_MatchedLetterIndexOf_0086
     * @tc.desc      matchedLetterIndexOf(value="xDGHXY3") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0086 begin`);
      const actual: number = matchedLetterIndexOf('xDGHXY3');
      logInfo(`matchedLetterIndexOf(value="xDGHXY3"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0086 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0087
     * @tc.name      CitySearch_MatchedLetterIndexOf_0087
     * @tc.desc      matchedLetterIndexOf(value="Qao") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0087 begin`);
      const actual: number = matchedLetterIndexOf('Qao');
      logInfo(`matchedLetterIndexOf(value="Qao"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0087 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0088
     * @tc.name      CitySearch_MatchedLetterIndexOf_0088
     * @tc.desc      matchedLetterIndexOf(value="gm6gH") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0088 begin`);
      const actual: number = matchedLetterIndexOf('gm6gH');
      logInfo(`matchedLetterIndexOf(value="gm6gH"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0088 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0089
     * @tc.name      CitySearch_MatchedLetterIndexOf_0089
     * @tc.desc      matchedLetterIndexOf(value="qnKCJ") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0089 begin`);
      const actual: number = matchedLetterIndexOf('qnKCJ');
      logInfo(`matchedLetterIndexOf(value="qnKCJ"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0089 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0090
     * @tc.name      CitySearch_MatchedLetterIndexOf_0090
     * @tc.desc      matchedLetterIndexOf(value="mrqMkDtJX") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0090 begin`);
      const actual: number = matchedLetterIndexOf('mrqMkDtJX');
      logInfo(`matchedLetterIndexOf(value="mrqMkDtJX"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0090 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0091
     * @tc.name      CitySearch_MatchedLetterIndexOf_0091
     * @tc.desc      matchedLetterIndexOf(value="C7KD5XlBH") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0091 begin`);
      const actual: number = matchedLetterIndexOf('C7KD5XlBH');
      logInfo(`matchedLetterIndexOf(value="C7KD5XlBH"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0091 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0092
     * @tc.name      CitySearch_MatchedLetterIndexOf_0092
     * @tc.desc      matchedLetterIndexOf(value="O6AWNs") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0092 begin`);
      const actual: number = matchedLetterIndexOf('O6AWNs');
      logInfo(`matchedLetterIndexOf(value="O6AWNs"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0092 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0093
     * @tc.name      CitySearch_MatchedLetterIndexOf_0093
     * @tc.desc      matchedLetterIndexOf(value="ydiymcYwY") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0093 begin`);
      const actual: number = matchedLetterIndexOf('ydiymcYwY');
      logInfo(`matchedLetterIndexOf(value="ydiymcYwY"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0093 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0094
     * @tc.name      CitySearch_MatchedLetterIndexOf_0094
     * @tc.desc      matchedLetterIndexOf(value="iy") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0094 begin`);
      const actual: number = matchedLetterIndexOf('iy');
      logInfo(`matchedLetterIndexOf(value="iy"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0094 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0095
     * @tc.name      CitySearch_MatchedLetterIndexOf_0095
     * @tc.desc      matchedLetterIndexOf(value="4B") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0095 begin`);
      const actual: number = matchedLetterIndexOf('4B');
      logInfo(`matchedLetterIndexOf(value="4B"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0095 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0096
     * @tc.name      CitySearch_MatchedLetterIndexOf_0096
     * @tc.desc      matchedLetterIndexOf(value="TxEsH4UA32q") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0096 begin`);
      const actual: number = matchedLetterIndexOf('TxEsH4UA32q');
      logInfo(`matchedLetterIndexOf(value="TxEsH4UA32q"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0096 end`);
    });
  });
}
