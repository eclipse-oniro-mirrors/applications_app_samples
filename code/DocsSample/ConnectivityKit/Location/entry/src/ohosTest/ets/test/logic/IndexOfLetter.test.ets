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
import { indexOfLetter } from '../model/CityPickerLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Location]';
const BUNDLE: string = 'Location_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for indexOfLetter (75 cases). */
export default function indexOfLetterTest(): void {
  describe('IndexOfLetterTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_LOCATION_INDEX_OF_LETTER_0001
     * @tc.name      Location_IndexOfLetter_0001
     * @tc.desc      indexOfLetter(letter="") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Location_IndexOfLetter_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IndexOfLetter_0001 begin`);
      const actual: number = indexOfLetter('');
      logInfo(`indexOfLetter(letter=""): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLetter_0001 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_INDEX_OF_LETTER_0002
     * @tc.name      Location_IndexOfLetter_0002
     * @tc.desc      indexOfLetter(letter="S") returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Location_IndexOfLetter_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IndexOfLetter_0002 begin`);
      const actual: number = indexOfLetter('S');
      logInfo(`indexOfLetter(letter="S"): actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}IndexOfLetter_0002 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_INDEX_OF_LETTER_0003
     * @tc.name      Location_IndexOfLetter_0003
     * @tc.desc      indexOfLetter(letter="C") returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_IndexOfLetter_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLetter_0003 begin`);
      const actual: number = indexOfLetter('C');
      logInfo(`indexOfLetter(letter="C"): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}IndexOfLetter_0003 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_INDEX_OF_LETTER_0004
     * @tc.name      Location_IndexOfLetter_0004
     * @tc.desc      indexOfLetter(letter="a") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_IndexOfLetter_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLetter_0004 begin`);
      const actual: number = indexOfLetter('a');
      logInfo(`indexOfLetter(letter="a"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLetter_0004 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_INDEX_OF_LETTER_0005
     * @tc.name      Location_IndexOfLetter_0005
     * @tc.desc      indexOfLetter(letter="abc") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_IndexOfLetter_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLetter_0005 begin`);
      const actual: number = indexOfLetter('abc');
      logInfo(`indexOfLetter(letter="abc"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLetter_0005 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_INDEX_OF_LETTER_0006
     * @tc.name      Location_IndexOfLetter_0006
     * @tc.desc      indexOfLetter(letter="Hello World") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_IndexOfLetter_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLetter_0006 begin`);
      const actual: number = indexOfLetter('Hello World');
      logInfo(`indexOfLetter(letter="Hello World"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLetter_0006 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_INDEX_OF_LETTER_0007
     * @tc.name      Location_IndexOfLetter_0007
     * @tc.desc      indexOfLetter(letter=" ") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_IndexOfLetter_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLetter_0007 begin`);
      const actual: number = indexOfLetter(' ');
      logInfo(`indexOfLetter(letter=" "): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLetter_0007 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_INDEX_OF_LETTER_0008
     * @tc.name      Location_IndexOfLetter_0008
     * @tc.desc      indexOfLetter(letter="123") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_IndexOfLetter_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLetter_0008 begin`);
      const actual: number = indexOfLetter('123');
      logInfo(`indexOfLetter(letter="123"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLetter_0008 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_INDEX_OF_LETTER_0009
     * @tc.name      Location_IndexOfLetter_0009
     * @tc.desc      indexOfLetter(letter=" a ") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_IndexOfLetter_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IndexOfLetter_0009 begin`);
      const actual: number = indexOfLetter(' a ');
      logInfo(`indexOfLetter(letter=" a "): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLetter_0009 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_INDEX_OF_LETTER_0010
     * @tc.name      Location_IndexOfLetter_0010
     * @tc.desc      indexOfLetter(letter="aa") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_IndexOfLetter_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLetter_0010 begin`);
      const actual: number = indexOfLetter('aa');
      logInfo(`indexOfLetter(letter="aa"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLetter_0010 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_INDEX_OF_LETTER_0011
     * @tc.name      Location_IndexOfLetter_0011
     * @tc.desc      indexOfLetter(letter="a_1") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_IndexOfLetter_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLetter_0011 begin`);
      const actual: number = indexOfLetter('a_1');
      logInfo(`indexOfLetter(letter="a_1"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLetter_0011 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_INDEX_OF_LETTER_0012
     * @tc.name      Location_IndexOfLetter_0012
     * @tc.desc      indexOfLetter(letter="xa") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_IndexOfLetter_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IndexOfLetter_0012 begin`);
      const actual: number = indexOfLetter('xa');
      logInfo(`indexOfLetter(letter="xa"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLetter_0012 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_INDEX_OF_LETTER_0013
     * @tc.name      Location_IndexOfLetter_0013
     * @tc.desc      indexOfLetter(letter=" abc ") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_IndexOfLetter_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IndexOfLetter_0013 begin`);
      const actual: number = indexOfLetter(' abc ');
      logInfo(`indexOfLetter(letter=" abc "): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLetter_0013 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_INDEX_OF_LETTER_0014
     * @tc.name      Location_IndexOfLetter_0014
     * @tc.desc      indexOfLetter(letter="abcabc") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_IndexOfLetter_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLetter_0014 begin`);
      const actual: number = indexOfLetter('abcabc');
      logInfo(`indexOfLetter(letter="abcabc"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLetter_0014 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_INDEX_OF_LETTER_0015
     * @tc.name      Location_IndexOfLetter_0015
     * @tc.desc      indexOfLetter(letter="abc_1") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_IndexOfLetter_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLetter_0015 begin`);
      const actual: number = indexOfLetter('abc_1');
      logInfo(`indexOfLetter(letter="abc_1"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLetter_0015 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_INDEX_OF_LETTER_0016
     * @tc.name      Location_IndexOfLetter_0016
     * @tc.desc      indexOfLetter(letter="xabc") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_IndexOfLetter_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IndexOfLetter_0016 begin`);
      const actual: number = indexOfLetter('xabc');
      logInfo(`indexOfLetter(letter="xabc"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLetter_0016 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_INDEX_OF_LETTER_0017
     * @tc.name      Location_IndexOfLetter_0017
     * @tc.desc      indexOfLetter(letter=" Hello World ") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_IndexOfLetter_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IndexOfLetter_0017 begin`);
      const actual: number = indexOfLetter(' Hello World ');
      logInfo(`indexOfLetter(letter=" Hello World "): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLetter_0017 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_INDEX_OF_LETTER_0018
     * @tc.name      Location_IndexOfLetter_0018
     * @tc.desc      indexOfLetter(letter="Hello WorldHello World") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_IndexOfLetter_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLetter_0018 begin`);
      const actual: number = indexOfLetter('Hello WorldHello World');
      logInfo(`indexOfLetter(letter="Hello WorldHello Wo...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLetter_0018 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_INDEX_OF_LETTER_0019
     * @tc.name      Location_IndexOfLetter_0019
     * @tc.desc      indexOfLetter(letter="Hello World_1") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_IndexOfLetter_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLetter_0019 begin`);
      const actual: number = indexOfLetter('Hello World_1');
      logInfo(`indexOfLetter(letter="Hello World_1"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLetter_0019 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_INDEX_OF_LETTER_0020
     * @tc.name      Location_IndexOfLetter_0020
     * @tc.desc      indexOfLetter(letter="xHello World") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_IndexOfLetter_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IndexOfLetter_0020 begin`);
      const actual: number = indexOfLetter('xHello World');
      logInfo(`indexOfLetter(letter="xHello World"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLetter_0020 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_INDEX_OF_LETTER_0021
     * @tc.name      Location_IndexOfLetter_0021
     * @tc.desc      indexOfLetter(letter="   ") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_IndexOfLetter_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IndexOfLetter_0021 begin`);
      const actual: number = indexOfLetter('   ');
      logInfo(`indexOfLetter(letter="   "): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLetter_0021 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_INDEX_OF_LETTER_0022
     * @tc.name      Location_IndexOfLetter_0022
     * @tc.desc      indexOfLetter(letter="  ") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_IndexOfLetter_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLetter_0022 begin`);
      const actual: number = indexOfLetter('  ');
      logInfo(`indexOfLetter(letter="  "): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLetter_0022 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_INDEX_OF_LETTER_0023
     * @tc.name      Location_IndexOfLetter_0023
     * @tc.desc      indexOfLetter(letter=" _1") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_IndexOfLetter_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLetter_0023 begin`);
      const actual: number = indexOfLetter(' _1');
      logInfo(`indexOfLetter(letter=" _1"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLetter_0023 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_INDEX_OF_LETTER_0024
     * @tc.name      Location_IndexOfLetter_0024
     * @tc.desc      indexOfLetter(letter="x ") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_IndexOfLetter_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IndexOfLetter_0024 begin`);
      const actual: number = indexOfLetter('x ');
      logInfo(`indexOfLetter(letter="x "): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLetter_0024 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_INDEX_OF_LETTER_0025
     * @tc.name      Location_IndexOfLetter_0025
     * @tc.desc      indexOfLetter(letter=" 123 ") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_IndexOfLetter_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IndexOfLetter_0025 begin`);
      const actual: number = indexOfLetter(' 123 ');
      logInfo(`indexOfLetter(letter=" 123 "): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLetter_0025 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_INDEX_OF_LETTER_0026
     * @tc.name      Location_IndexOfLetter_0026
     * @tc.desc      indexOfLetter(letter="123123") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_IndexOfLetter_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLetter_0026 begin`);
      const actual: number = indexOfLetter('123123');
      logInfo(`indexOfLetter(letter="123123"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLetter_0026 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_INDEX_OF_LETTER_0027
     * @tc.name      Location_IndexOfLetter_0027
     * @tc.desc      indexOfLetter(letter="123_1") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_IndexOfLetter_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLetter_0027 begin`);
      const actual: number = indexOfLetter('123_1');
      logInfo(`indexOfLetter(letter="123_1"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLetter_0027 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_INDEX_OF_LETTER_0028
     * @tc.name      Location_IndexOfLetter_0028
     * @tc.desc      indexOfLetter(letter="x123") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_IndexOfLetter_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IndexOfLetter_0028 begin`);
      const actual: number = indexOfLetter('x123');
      logInfo(`indexOfLetter(letter="x123"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLetter_0028 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_INDEX_OF_LETTER_0029
     * @tc.name      Location_IndexOfLetter_0029
     * @tc.desc      indexOfLetter(letter="TqQedbp") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_IndexOfLetter_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLetter_0029 begin`);
      const actual: number = indexOfLetter('TqQedbp');
      logInfo(`indexOfLetter(letter="TqQedbp"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLetter_0029 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_INDEX_OF_LETTER_0030
     * @tc.name      Location_IndexOfLetter_0030
     * @tc.desc      indexOfLetter(letter="tUA0AEm") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_IndexOfLetter_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLetter_0030 begin`);
      const actual: number = indexOfLetter('tUA0AEm');
      logInfo(`indexOfLetter(letter="tUA0AEm"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLetter_0030 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_INDEX_OF_LETTER_0031
     * @tc.name      Location_IndexOfLetter_0031
     * @tc.desc      indexOfLetter(letter="2po2") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_IndexOfLetter_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLetter_0031 begin`);
      const actual: number = indexOfLetter('2po2');
      logInfo(`indexOfLetter(letter="2po2"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLetter_0031 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_INDEX_OF_LETTER_0032
     * @tc.name      Location_IndexOfLetter_0032
     * @tc.desc      indexOfLetter(letter="iGb7KxD7c9") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_IndexOfLetter_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLetter_0032 begin`);
      const actual: number = indexOfLetter('iGb7KxD7c9');
      logInfo(`indexOfLetter(letter="iGb7KxD7c9"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLetter_0032 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_INDEX_OF_LETTER_0033
     * @tc.name      Location_IndexOfLetter_0033
     * @tc.desc      indexOfLetter(letter="GNYoZqtP") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_IndexOfLetter_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLetter_0033 begin`);
      const actual: number = indexOfLetter('GNYoZqtP');
      logInfo(`indexOfLetter(letter="GNYoZqtP"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLetter_0033 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_INDEX_OF_LETTER_0034
     * @tc.name      Location_IndexOfLetter_0034
     * @tc.desc      indexOfLetter(letter="TJ") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_IndexOfLetter_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLetter_0034 begin`);
      const actual: number = indexOfLetter('TJ');
      logInfo(`indexOfLetter(letter="TJ"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLetter_0034 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_INDEX_OF_LETTER_0035
     * @tc.name      Location_IndexOfLetter_0035
     * @tc.desc      indexOfLetter(letter="Vio0mSI") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_IndexOfLetter_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLetter_0035 begin`);
      const actual: number = indexOfLetter('Vio0mSI');
      logInfo(`indexOfLetter(letter="Vio0mSI"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLetter_0035 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_INDEX_OF_LETTER_0036
     * @tc.name      Location_IndexOfLetter_0036
     * @tc.desc      indexOfLetter(letter="25P2W3r7Nl") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_IndexOfLetter_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLetter_0036 begin`);
      const actual: number = indexOfLetter('25P2W3r7Nl');
      logInfo(`indexOfLetter(letter="25P2W3r7Nl"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLetter_0036 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_INDEX_OF_LETTER_0037
     * @tc.name      Location_IndexOfLetter_0037
     * @tc.desc      indexOfLetter(letter="VDp3b8N3ECac") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_IndexOfLetter_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLetter_0037 begin`);
      const actual: number = indexOfLetter('VDp3b8N3ECac');
      logInfo(`indexOfLetter(letter="VDp3b8N3ECac"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLetter_0037 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_INDEX_OF_LETTER_0038
     * @tc.name      Location_IndexOfLetter_0038
     * @tc.desc      indexOfLetter(letter="gZLXHP") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_IndexOfLetter_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLetter_0038 begin`);
      const actual: number = indexOfLetter('gZLXHP');
      logInfo(`indexOfLetter(letter="gZLXHP"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLetter_0038 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_INDEX_OF_LETTER_0039
     * @tc.name      Location_IndexOfLetter_0039
     * @tc.desc      indexOfLetter(letter="LySr6") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_IndexOfLetter_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLetter_0039 begin`);
      const actual: number = indexOfLetter('LySr6');
      logInfo(`indexOfLetter(letter="LySr6"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLetter_0039 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_INDEX_OF_LETTER_0040
     * @tc.name      Location_IndexOfLetter_0040
     * @tc.desc      indexOfLetter(letter="HWsfdZKL") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_IndexOfLetter_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLetter_0040 begin`);
      const actual: number = indexOfLetter('HWsfdZKL');
      logInfo(`indexOfLetter(letter="HWsfdZKL"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLetter_0040 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_INDEX_OF_LETTER_0041
     * @tc.name      Location_IndexOfLetter_0041
     * @tc.desc      indexOfLetter(letter="2vvNUhnw") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_IndexOfLetter_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLetter_0041 begin`);
      const actual: number = indexOfLetter('2vvNUhnw');
      logInfo(`indexOfLetter(letter="2vvNUhnw"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLetter_0041 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_INDEX_OF_LETTER_0042
     * @tc.name      Location_IndexOfLetter_0042
     * @tc.desc      indexOfLetter(letter="aybeVi5") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_IndexOfLetter_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLetter_0042 begin`);
      const actual: number = indexOfLetter('aybeVi5');
      logInfo(`indexOfLetter(letter="aybeVi5"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLetter_0042 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_INDEX_OF_LETTER_0043
     * @tc.name      Location_IndexOfLetter_0043
     * @tc.desc      indexOfLetter(letter="6h") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_IndexOfLetter_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLetter_0043 begin`);
      const actual: number = indexOfLetter('6h');
      logInfo(`indexOfLetter(letter="6h"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLetter_0043 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_INDEX_OF_LETTER_0044
     * @tc.name      Location_IndexOfLetter_0044
     * @tc.desc      indexOfLetter(letter="dAsl") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_IndexOfLetter_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLetter_0044 begin`);
      const actual: number = indexOfLetter('dAsl');
      logInfo(`indexOfLetter(letter="dAsl"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLetter_0044 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_INDEX_OF_LETTER_0045
     * @tc.name      Location_IndexOfLetter_0045
     * @tc.desc      indexOfLetter(letter="8qvopP") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_IndexOfLetter_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLetter_0045 begin`);
      const actual: number = indexOfLetter('8qvopP');
      logInfo(`indexOfLetter(letter="8qvopP"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLetter_0045 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_INDEX_OF_LETTER_0046
     * @tc.name      Location_IndexOfLetter_0046
     * @tc.desc      indexOfLetter(letter="v6YG6YwP") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_IndexOfLetter_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLetter_0046 begin`);
      const actual: number = indexOfLetter('v6YG6YwP');
      logInfo(`indexOfLetter(letter="v6YG6YwP"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLetter_0046 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_INDEX_OF_LETTER_0047
     * @tc.name      Location_IndexOfLetter_0047
     * @tc.desc      indexOfLetter(letter="4JnHRz9Jqw") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_IndexOfLetter_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLetter_0047 begin`);
      const actual: number = indexOfLetter('4JnHRz9Jqw');
      logInfo(`indexOfLetter(letter="4JnHRz9Jqw"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLetter_0047 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_INDEX_OF_LETTER_0048
     * @tc.name      Location_IndexOfLetter_0048
     * @tc.desc      indexOfLetter(letter="OPAJccnBIOHl") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_IndexOfLetter_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLetter_0048 begin`);
      const actual: number = indexOfLetter('OPAJccnBIOHl');
      logInfo(`indexOfLetter(letter="OPAJccnBIOHl"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLetter_0048 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_INDEX_OF_LETTER_0049
     * @tc.name      Location_IndexOfLetter_0049
     * @tc.desc      indexOfLetter(letter="FvSsVzRvcSN") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_IndexOfLetter_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLetter_0049 begin`);
      const actual: number = indexOfLetter('FvSsVzRvcSN');
      logInfo(`indexOfLetter(letter="FvSsVzRvcSN"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLetter_0049 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_INDEX_OF_LETTER_0050
     * @tc.name      Location_IndexOfLetter_0050
     * @tc.desc      indexOfLetter(letter="yCGsMHPD") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_IndexOfLetter_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLetter_0050 begin`);
      const actual: number = indexOfLetter('yCGsMHPD');
      logInfo(`indexOfLetter(letter="yCGsMHPD"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLetter_0050 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_INDEX_OF_LETTER_0051
     * @tc.name      Location_IndexOfLetter_0051
     * @tc.desc      indexOfLetter(letter="dPS0kkJadz") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_IndexOfLetter_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLetter_0051 begin`);
      const actual: number = indexOfLetter('dPS0kkJadz');
      logInfo(`indexOfLetter(letter="dPS0kkJadz"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLetter_0051 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_INDEX_OF_LETTER_0052
     * @tc.name      Location_IndexOfLetter_0052
     * @tc.desc      indexOfLetter(letter="XpNHrl8aRf") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_IndexOfLetter_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLetter_0052 begin`);
      const actual: number = indexOfLetter('XpNHrl8aRf');
      logInfo(`indexOfLetter(letter="XpNHrl8aRf"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLetter_0052 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_INDEX_OF_LETTER_0053
     * @tc.name      Location_IndexOfLetter_0053
     * @tc.desc      indexOfLetter(letter="LulUH") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_IndexOfLetter_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLetter_0053 begin`);
      const actual: number = indexOfLetter('LulUH');
      logInfo(`indexOfLetter(letter="LulUH"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLetter_0053 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_INDEX_OF_LETTER_0054
     * @tc.name      Location_IndexOfLetter_0054
     * @tc.desc      indexOfLetter(letter="YR0e1DRj") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_IndexOfLetter_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLetter_0054 begin`);
      const actual: number = indexOfLetter('YR0e1DRj');
      logInfo(`indexOfLetter(letter="YR0e1DRj"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLetter_0054 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_INDEX_OF_LETTER_0055
     * @tc.name      Location_IndexOfLetter_0055
     * @tc.desc      indexOfLetter(letter="Sv99") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_IndexOfLetter_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLetter_0055 begin`);
      const actual: number = indexOfLetter('Sv99');
      logInfo(`indexOfLetter(letter="Sv99"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLetter_0055 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_INDEX_OF_LETTER_0056
     * @tc.name      Location_IndexOfLetter_0056
     * @tc.desc      indexOfLetter(letter="KUM") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_IndexOfLetter_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLetter_0056 begin`);
      const actual: number = indexOfLetter('KUM');
      logInfo(`indexOfLetter(letter="KUM"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLetter_0056 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_INDEX_OF_LETTER_0057
     * @tc.name      Location_IndexOfLetter_0057
     * @tc.desc      indexOfLetter(letter="pqXmXXY") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_IndexOfLetter_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLetter_0057 begin`);
      const actual: number = indexOfLetter('pqXmXXY');
      logInfo(`indexOfLetter(letter="pqXmXXY"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLetter_0057 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_INDEX_OF_LETTER_0058
     * @tc.name      Location_IndexOfLetter_0058
     * @tc.desc      indexOfLetter(letter="T6JYhbki4M") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_IndexOfLetter_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLetter_0058 begin`);
      const actual: number = indexOfLetter('T6JYhbki4M');
      logInfo(`indexOfLetter(letter="T6JYhbki4M"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLetter_0058 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_INDEX_OF_LETTER_0059
     * @tc.name      Location_IndexOfLetter_0059
     * @tc.desc      indexOfLetter(letter="mfgihXvUrWs") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_IndexOfLetter_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLetter_0059 begin`);
      const actual: number = indexOfLetter('mfgihXvUrWs');
      logInfo(`indexOfLetter(letter="mfgihXvUrWs"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLetter_0059 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_INDEX_OF_LETTER_0060
     * @tc.name      Location_IndexOfLetter_0060
     * @tc.desc      indexOfLetter(letter="99Pmrl") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_IndexOfLetter_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLetter_0060 begin`);
      const actual: number = indexOfLetter('99Pmrl');
      logInfo(`indexOfLetter(letter="99Pmrl"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLetter_0060 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_INDEX_OF_LETTER_0061
     * @tc.name      Location_IndexOfLetter_0061
     * @tc.desc      indexOfLetter(letter="OeroH") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_IndexOfLetter_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLetter_0061 begin`);
      const actual: number = indexOfLetter('OeroH');
      logInfo(`indexOfLetter(letter="OeroH"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLetter_0061 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_INDEX_OF_LETTER_0062
     * @tc.name      Location_IndexOfLetter_0062
     * @tc.desc      indexOfLetter(letter="cuA") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_IndexOfLetter_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLetter_0062 begin`);
      const actual: number = indexOfLetter('cuA');
      logInfo(`indexOfLetter(letter="cuA"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLetter_0062 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_INDEX_OF_LETTER_0063
     * @tc.name      Location_IndexOfLetter_0063
     * @tc.desc      indexOfLetter(letter="qBkY4perXE") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_IndexOfLetter_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLetter_0063 begin`);
      const actual: number = indexOfLetter('qBkY4perXE');
      logInfo(`indexOfLetter(letter="qBkY4perXE"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLetter_0063 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_INDEX_OF_LETTER_0064
     * @tc.name      Location_IndexOfLetter_0064
     * @tc.desc      indexOfLetter(letter="XcIUHDDBoXdl") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_IndexOfLetter_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLetter_0064 begin`);
      const actual: number = indexOfLetter('XcIUHDDBoXdl');
      logInfo(`indexOfLetter(letter="XcIUHDDBoXdl"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLetter_0064 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_INDEX_OF_LETTER_0065
     * @tc.name      Location_IndexOfLetter_0065
     * @tc.desc      indexOfLetter(letter="veI9WW3X") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_IndexOfLetter_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLetter_0065 begin`);
      const actual: number = indexOfLetter('veI9WW3X');
      logInfo(`indexOfLetter(letter="veI9WW3X"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLetter_0065 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_INDEX_OF_LETTER_0066
     * @tc.name      Location_IndexOfLetter_0066
     * @tc.desc      indexOfLetter(letter="edFQZhb7") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_IndexOfLetter_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLetter_0066 begin`);
      const actual: number = indexOfLetter('edFQZhb7');
      logInfo(`indexOfLetter(letter="edFQZhb7"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLetter_0066 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_INDEX_OF_LETTER_0067
     * @tc.name      Location_IndexOfLetter_0067
     * @tc.desc      indexOfLetter(letter="QL") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_IndexOfLetter_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLetter_0067 begin`);
      const actual: number = indexOfLetter('QL');
      logInfo(`indexOfLetter(letter="QL"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLetter_0067 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_INDEX_OF_LETTER_0068
     * @tc.name      Location_IndexOfLetter_0068
     * @tc.desc      indexOfLetter(letter="9Ac1") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_IndexOfLetter_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLetter_0068 begin`);
      const actual: number = indexOfLetter('9Ac1');
      logInfo(`indexOfLetter(letter="9Ac1"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLetter_0068 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_INDEX_OF_LETTER_0069
     * @tc.name      Location_IndexOfLetter_0069
     * @tc.desc      indexOfLetter(letter="lao7UQdLDs3") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_IndexOfLetter_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLetter_0069 begin`);
      const actual: number = indexOfLetter('lao7UQdLDs3');
      logInfo(`indexOfLetter(letter="lao7UQdLDs3"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLetter_0069 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_INDEX_OF_LETTER_0070
     * @tc.name      Location_IndexOfLetter_0070
     * @tc.desc      indexOfLetter(letter="crh5CqVaOGA") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_IndexOfLetter_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLetter_0070 begin`);
      const actual: number = indexOfLetter('crh5CqVaOGA');
      logInfo(`indexOfLetter(letter="crh5CqVaOGA"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLetter_0070 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_INDEX_OF_LETTER_0071
     * @tc.name      Location_IndexOfLetter_0071
     * @tc.desc      indexOfLetter(letter="dXE4Pt") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_IndexOfLetter_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLetter_0071 begin`);
      const actual: number = indexOfLetter('dXE4Pt');
      logInfo(`indexOfLetter(letter="dXE4Pt"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLetter_0071 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_INDEX_OF_LETTER_0072
     * @tc.name      Location_IndexOfLetter_0072
     * @tc.desc      indexOfLetter(letter="vA") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_IndexOfLetter_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLetter_0072 begin`);
      const actual: number = indexOfLetter('vA');
      logInfo(`indexOfLetter(letter="vA"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLetter_0072 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_INDEX_OF_LETTER_0073
     * @tc.name      Location_IndexOfLetter_0073
     * @tc.desc      indexOfLetter(letter="uTTHh0Ogxy") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_IndexOfLetter_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLetter_0073 begin`);
      const actual: number = indexOfLetter('uTTHh0Ogxy');
      logInfo(`indexOfLetter(letter="uTTHh0Ogxy"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLetter_0073 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_INDEX_OF_LETTER_0074
     * @tc.name      Location_IndexOfLetter_0074
     * @tc.desc      indexOfLetter(letter="l6lZpVl1bO") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_IndexOfLetter_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLetter_0074 begin`);
      const actual: number = indexOfLetter('l6lZpVl1bO');
      logInfo(`indexOfLetter(letter="l6lZpVl1bO"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLetter_0074 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_INDEX_OF_LETTER_0075
     * @tc.name      Location_IndexOfLetter_0075
     * @tc.desc      indexOfLetter(letter="9rw") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_IndexOfLetter_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IndexOfLetter_0075 begin`);
      const actual: number = indexOfLetter('9rw');
      logInfo(`indexOfLetter(letter="9rw"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}IndexOfLetter_0075 end`);
    });
  });
}
