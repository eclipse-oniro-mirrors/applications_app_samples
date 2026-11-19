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
import { letterAtIndex } from '../model/CitySearchLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CitySearch]';
const BUNDLE: string = 'CitySearch_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for letterAtIndex (96 cases). */
export default function letterAtIndexTest(): void {
  describe('LetterAtIndexTest', () => {
    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0001
     * @tc.name      CitySearch_LetterAtIndex_0001
     * @tc.desc      letterAtIndex(index=0) returns "A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_LetterAtIndex_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0001 begin`);
      const actual: string = letterAtIndex(0);
      logInfo(`letterAtIndex(index=0): actual=${actual}`);
      expect(actual).assertEqual('A');
      logInfo(`${BUNDLE}LetterAtIndex_0001 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0002
     * @tc.name      CitySearch_LetterAtIndex_0002
     * @tc.desc      letterAtIndex(index=1) returns "B"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_LetterAtIndex_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0002 begin`);
      const actual: string = letterAtIndex(1);
      logInfo(`letterAtIndex(index=1): actual=${actual}`);
      expect(actual).assertEqual('B');
      logInfo(`${BUNDLE}LetterAtIndex_0002 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0003
     * @tc.name      CitySearch_LetterAtIndex_0003
     * @tc.desc      letterAtIndex(index=-1) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CitySearch_LetterAtIndex_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0003 begin`);
      const actual: string = letterAtIndex(-1);
      logInfo(`letterAtIndex(index=-1): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0003 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0004
     * @tc.name      CitySearch_LetterAtIndex_0004
     * @tc.desc      letterAtIndex(index=2) returns "C"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0004 begin`);
      const actual: string = letterAtIndex(2);
      logInfo(`letterAtIndex(index=2): actual=${actual}`);
      expect(actual).assertEqual('C');
      logInfo(`${BUNDLE}LetterAtIndex_0004 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0005
     * @tc.name      CitySearch_LetterAtIndex_0005
     * @tc.desc      letterAtIndex(index=5) returns "H"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0005 begin`);
      const actual: string = letterAtIndex(5);
      logInfo(`letterAtIndex(index=5): actual=${actual}`);
      expect(actual).assertEqual('H');
      logInfo(`${BUNDLE}LetterAtIndex_0005 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0006
     * @tc.name      CitySearch_LetterAtIndex_0006
     * @tc.desc      letterAtIndex(index=10) returns "S"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0006 begin`);
      const actual: string = letterAtIndex(10);
      logInfo(`letterAtIndex(index=10): actual=${actual}`);
      expect(actual).assertEqual('S');
      logInfo(`${BUNDLE}LetterAtIndex_0006 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0007
     * @tc.name      CitySearch_LetterAtIndex_0007
     * @tc.desc      letterAtIndex(index=3) returns "F"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0007 begin`);
      const actual: string = letterAtIndex(3);
      logInfo(`letterAtIndex(index=3): actual=${actual}`);
      expect(actual).assertEqual('F');
      logInfo(`${BUNDLE}LetterAtIndex_0007 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0008
     * @tc.name      CitySearch_LetterAtIndex_0008
     * @tc.desc      letterAtIndex(index=15) returns "Z"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0008 begin`);
      const actual: string = letterAtIndex(15);
      logInfo(`letterAtIndex(index=15): actual=${actual}`);
      expect(actual).assertEqual('Z');
      logInfo(`${BUNDLE}LetterAtIndex_0008 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0009
     * @tc.name      CitySearch_LetterAtIndex_0009
     * @tc.desc      letterAtIndex(index=14) returns "Y"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0009 begin`);
      const actual: string = letterAtIndex(14);
      logInfo(`letterAtIndex(index=14): actual=${actual}`);
      expect(actual).assertEqual('Y');
      logInfo(`${BUNDLE}LetterAtIndex_0009 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0010
     * @tc.name      CitySearch_LetterAtIndex_0010
     * @tc.desc      letterAtIndex(index=8) returns "N"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0010 begin`);
      const actual: string = letterAtIndex(8);
      logInfo(`letterAtIndex(index=8): actual=${actual}`);
      expect(actual).assertEqual('N');
      logInfo(`${BUNDLE}LetterAtIndex_0010 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0011
     * @tc.name      CitySearch_LetterAtIndex_0011
     * @tc.desc      letterAtIndex(index=4) returns "G"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0011 begin`);
      const actual: string = letterAtIndex(4);
      logInfo(`letterAtIndex(index=4): actual=${actual}`);
      expect(actual).assertEqual('G');
      logInfo(`${BUNDLE}LetterAtIndex_0011 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0012
     * @tc.name      CitySearch_LetterAtIndex_0012
     * @tc.desc      letterAtIndex(index=100) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0012 begin`);
      const actual: string = letterAtIndex(100);
      logInfo(`letterAtIndex(index=100): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0012 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0013
     * @tc.name      CitySearch_LetterAtIndex_0013
     * @tc.desc      letterAtIndex(index=20) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0013 begin`);
      const actual: string = letterAtIndex(20);
      logInfo(`letterAtIndex(index=20): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0013 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0014
     * @tc.name      CitySearch_LetterAtIndex_0014
     * @tc.desc      letterAtIndex(index=25) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0014 begin`);
      const actual: string = letterAtIndex(25);
      logInfo(`letterAtIndex(index=25): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0014 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0015
     * @tc.name      CitySearch_LetterAtIndex_0015
     * @tc.desc      letterAtIndex(index=30) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0015 begin`);
      const actual: string = letterAtIndex(30);
      logInfo(`letterAtIndex(index=30): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0015 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0016
     * @tc.name      CitySearch_LetterAtIndex_0016
     * @tc.desc      letterAtIndex(index=35) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0016 begin`);
      const actual: string = letterAtIndex(35);
      logInfo(`letterAtIndex(index=35): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0016 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0017
     * @tc.name      CitySearch_LetterAtIndex_0017
     * @tc.desc      letterAtIndex(index=40) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0017 begin`);
      const actual: string = letterAtIndex(40);
      logInfo(`letterAtIndex(index=40): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0017 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0018
     * @tc.name      CitySearch_LetterAtIndex_0018
     * @tc.desc      letterAtIndex(index=45) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0018 begin`);
      const actual: string = letterAtIndex(45);
      logInfo(`letterAtIndex(index=45): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0018 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0019
     * @tc.name      CitySearch_LetterAtIndex_0019
     * @tc.desc      letterAtIndex(index=50) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0019 begin`);
      const actual: string = letterAtIndex(50);
      logInfo(`letterAtIndex(index=50): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0019 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0020
     * @tc.name      CitySearch_LetterAtIndex_0020
     * @tc.desc      letterAtIndex(index=55) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0020 begin`);
      const actual: string = letterAtIndex(55);
      logInfo(`letterAtIndex(index=55): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0020 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0021
     * @tc.name      CitySearch_LetterAtIndex_0021
     * @tc.desc      letterAtIndex(index=60) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0021 begin`);
      const actual: string = letterAtIndex(60);
      logInfo(`letterAtIndex(index=60): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0021 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0022
     * @tc.name      CitySearch_LetterAtIndex_0022
     * @tc.desc      letterAtIndex(index=65) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0022 begin`);
      const actual: string = letterAtIndex(65);
      logInfo(`letterAtIndex(index=65): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0022 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0023
     * @tc.name      CitySearch_LetterAtIndex_0023
     * @tc.desc      letterAtIndex(index=70) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0023 begin`);
      const actual: string = letterAtIndex(70);
      logInfo(`letterAtIndex(index=70): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0023 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0024
     * @tc.name      CitySearch_LetterAtIndex_0024
     * @tc.desc      letterAtIndex(index=75) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0024 begin`);
      const actual: string = letterAtIndex(75);
      logInfo(`letterAtIndex(index=75): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0024 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0025
     * @tc.name      CitySearch_LetterAtIndex_0025
     * @tc.desc      letterAtIndex(index=80) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0025 begin`);
      const actual: string = letterAtIndex(80);
      logInfo(`letterAtIndex(index=80): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0025 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0026
     * @tc.name      CitySearch_LetterAtIndex_0026
     * @tc.desc      letterAtIndex(index=85) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0026 begin`);
      const actual: string = letterAtIndex(85);
      logInfo(`letterAtIndex(index=85): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0026 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0027
     * @tc.name      CitySearch_LetterAtIndex_0027
     * @tc.desc      letterAtIndex(index=90) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0027 begin`);
      const actual: string = letterAtIndex(90);
      logInfo(`letterAtIndex(index=90): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0027 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0028
     * @tc.name      CitySearch_LetterAtIndex_0028
     * @tc.desc      letterAtIndex(index=95) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0028 begin`);
      const actual: string = letterAtIndex(95);
      logInfo(`letterAtIndex(index=95): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0028 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0029
     * @tc.name      CitySearch_LetterAtIndex_0029
     * @tc.desc      letterAtIndex(index=105) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0029 begin`);
      const actual: string = letterAtIndex(105);
      logInfo(`letterAtIndex(index=105): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0029 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0030
     * @tc.name      CitySearch_LetterAtIndex_0030
     * @tc.desc      letterAtIndex(index=110) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0030 begin`);
      const actual: string = letterAtIndex(110);
      logInfo(`letterAtIndex(index=110): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0030 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0031
     * @tc.name      CitySearch_LetterAtIndex_0031
     * @tc.desc      letterAtIndex(index=115) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0031 begin`);
      const actual: string = letterAtIndex(115);
      logInfo(`letterAtIndex(index=115): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0031 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0032
     * @tc.name      CitySearch_LetterAtIndex_0032
     * @tc.desc      letterAtIndex(index=120) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0032 begin`);
      const actual: string = letterAtIndex(120);
      logInfo(`letterAtIndex(index=120): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0032 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0033
     * @tc.name      CitySearch_LetterAtIndex_0033
     * @tc.desc      letterAtIndex(index=125) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0033 begin`);
      const actual: string = letterAtIndex(125);
      logInfo(`letterAtIndex(index=125): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0033 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0034
     * @tc.name      CitySearch_LetterAtIndex_0034
     * @tc.desc      letterAtIndex(index=130) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0034 begin`);
      const actual: string = letterAtIndex(130);
      logInfo(`letterAtIndex(index=130): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0034 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0035
     * @tc.name      CitySearch_LetterAtIndex_0035
     * @tc.desc      letterAtIndex(index=135) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0035 begin`);
      const actual: string = letterAtIndex(135);
      logInfo(`letterAtIndex(index=135): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0035 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0036
     * @tc.name      CitySearch_LetterAtIndex_0036
     * @tc.desc      letterAtIndex(index=140) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0036 begin`);
      const actual: string = letterAtIndex(140);
      logInfo(`letterAtIndex(index=140): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0036 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0037
     * @tc.name      CitySearch_LetterAtIndex_0037
     * @tc.desc      letterAtIndex(index=145) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0037 begin`);
      const actual: string = letterAtIndex(145);
      logInfo(`letterAtIndex(index=145): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0037 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0038
     * @tc.name      CitySearch_LetterAtIndex_0038
     * @tc.desc      letterAtIndex(index=150) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0038 begin`);
      const actual: string = letterAtIndex(150);
      logInfo(`letterAtIndex(index=150): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0038 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0039
     * @tc.name      CitySearch_LetterAtIndex_0039
     * @tc.desc      letterAtIndex(index=155) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0039 begin`);
      const actual: string = letterAtIndex(155);
      logInfo(`letterAtIndex(index=155): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0039 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0040
     * @tc.name      CitySearch_LetterAtIndex_0040
     * @tc.desc      letterAtIndex(index=160) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0040 begin`);
      const actual: string = letterAtIndex(160);
      logInfo(`letterAtIndex(index=160): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0040 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0041
     * @tc.name      CitySearch_LetterAtIndex_0041
     * @tc.desc      letterAtIndex(index=165) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0041 begin`);
      const actual: string = letterAtIndex(165);
      logInfo(`letterAtIndex(index=165): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0041 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0042
     * @tc.name      CitySearch_LetterAtIndex_0042
     * @tc.desc      letterAtIndex(index=170) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0042 begin`);
      const actual: string = letterAtIndex(170);
      logInfo(`letterAtIndex(index=170): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0042 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0043
     * @tc.name      CitySearch_LetterAtIndex_0043
     * @tc.desc      letterAtIndex(index=175) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0043 begin`);
      const actual: string = letterAtIndex(175);
      logInfo(`letterAtIndex(index=175): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0043 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0044
     * @tc.name      CitySearch_LetterAtIndex_0044
     * @tc.desc      letterAtIndex(index=180) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0044 begin`);
      const actual: string = letterAtIndex(180);
      logInfo(`letterAtIndex(index=180): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0044 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0045
     * @tc.name      CitySearch_LetterAtIndex_0045
     * @tc.desc      letterAtIndex(index=185) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0045 begin`);
      const actual: string = letterAtIndex(185);
      logInfo(`letterAtIndex(index=185): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0045 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0046
     * @tc.name      CitySearch_LetterAtIndex_0046
     * @tc.desc      letterAtIndex(index=190) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0046 begin`);
      const actual: string = letterAtIndex(190);
      logInfo(`letterAtIndex(index=190): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0046 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0047
     * @tc.name      CitySearch_LetterAtIndex_0047
     * @tc.desc      letterAtIndex(index=195) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0047 begin`);
      const actual: string = letterAtIndex(195);
      logInfo(`letterAtIndex(index=195): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0047 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0048
     * @tc.name      CitySearch_LetterAtIndex_0048
     * @tc.desc      letterAtIndex(index=200) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0048 begin`);
      const actual: string = letterAtIndex(200);
      logInfo(`letterAtIndex(index=200): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0048 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0049
     * @tc.name      CitySearch_LetterAtIndex_0049
     * @tc.desc      letterAtIndex(index=64) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0049 begin`);
      const actual: string = letterAtIndex(64);
      logInfo(`letterAtIndex(index=64): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0049 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0050
     * @tc.name      CitySearch_LetterAtIndex_0050
     * @tc.desc      letterAtIndex(index=-15) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_LetterAtIndex_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0050 begin`);
      const actual: string = letterAtIndex(-15);
      logInfo(`letterAtIndex(index=-15): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0050 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0051
     * @tc.name      CitySearch_LetterAtIndex_0051
     * @tc.desc      letterAtIndex(index=132) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0051 begin`);
      const actual: string = letterAtIndex(132);
      logInfo(`letterAtIndex(index=132): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0051 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0052
     * @tc.name      CitySearch_LetterAtIndex_0052
     * @tc.desc      letterAtIndex(index=58) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0052 begin`);
      const actual: string = letterAtIndex(58);
      logInfo(`letterAtIndex(index=58): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0052 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0053
     * @tc.name      CitySearch_LetterAtIndex_0053
     * @tc.desc      letterAtIndex(index=39) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0053 begin`);
      const actual: string = letterAtIndex(39);
      logInfo(`letterAtIndex(index=39): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0053 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0054
     * @tc.name      CitySearch_LetterAtIndex_0054
     * @tc.desc      letterAtIndex(index=-6) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_LetterAtIndex_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0054 begin`);
      const actual: string = letterAtIndex(-6);
      logInfo(`letterAtIndex(index=-6): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0054 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0055
     * @tc.name      CitySearch_LetterAtIndex_0055
     * @tc.desc      letterAtIndex(index=31) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0055 begin`);
      const actual: string = letterAtIndex(31);
      logInfo(`letterAtIndex(index=31): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0055 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0056
     * @tc.name      CitySearch_LetterAtIndex_0056
     * @tc.desc      letterAtIndex(index=114) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0056 begin`);
      const actual: string = letterAtIndex(114);
      logInfo(`letterAtIndex(index=114): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0056 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0057
     * @tc.name      CitySearch_LetterAtIndex_0057
     * @tc.desc      letterAtIndex(index=-13) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_LetterAtIndex_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0057 begin`);
      const actual: string = letterAtIndex(-13);
      logInfo(`letterAtIndex(index=-13): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0057 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0058
     * @tc.name      CitySearch_LetterAtIndex_0058
     * @tc.desc      letterAtIndex(index=21.45) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0058 begin`);
      const actual: string = letterAtIndex(21.45);
      logInfo(`letterAtIndex(index=21.45): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0058 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0059
     * @tc.name      CitySearch_LetterAtIndex_0059
     * @tc.desc      letterAtIndex(index=77) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0059 begin`);
      const actual: string = letterAtIndex(77);
      logInfo(`letterAtIndex(index=77): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0059 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0060
     * @tc.name      CitySearch_LetterAtIndex_0060
     * @tc.desc      letterAtIndex(index=96.29) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0060 begin`);
      const actual: string = letterAtIndex(96.29);
      logInfo(`letterAtIndex(index=96.29): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0060 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0061
     * @tc.name      CitySearch_LetterAtIndex_0061
     * @tc.desc      letterAtIndex(index=40.43) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0061 begin`);
      const actual: string = letterAtIndex(40.43);
      logInfo(`letterAtIndex(index=40.43): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0061 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0062
     * @tc.name      CitySearch_LetterAtIndex_0062
     * @tc.desc      letterAtIndex(index=-71) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_LetterAtIndex_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0062 begin`);
      const actual: string = letterAtIndex(-71);
      logInfo(`letterAtIndex(index=-71): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0062 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0063
     * @tc.name      CitySearch_LetterAtIndex_0063
     * @tc.desc      letterAtIndex(index=86.41) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0063 begin`);
      const actual: string = letterAtIndex(86.41);
      logInfo(`letterAtIndex(index=86.41): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0063 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0064
     * @tc.name      CitySearch_LetterAtIndex_0064
     * @tc.desc      letterAtIndex(index=68.73) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0064 begin`);
      const actual: string = letterAtIndex(68.73);
      logInfo(`letterAtIndex(index=68.73): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0064 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0065
     * @tc.name      CitySearch_LetterAtIndex_0065
     * @tc.desc      letterAtIndex(index=42.24) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0065 begin`);
      const actual: string = letterAtIndex(42.24);
      logInfo(`letterAtIndex(index=42.24): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0065 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0066
     * @tc.name      CitySearch_LetterAtIndex_0066
     * @tc.desc      letterAtIndex(index=-81) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_LetterAtIndex_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0066 begin`);
      const actual: string = letterAtIndex(-81);
      logInfo(`letterAtIndex(index=-81): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0066 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0067
     * @tc.name      CitySearch_LetterAtIndex_0067
     * @tc.desc      letterAtIndex(index=-54) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_LetterAtIndex_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0067 begin`);
      const actual: string = letterAtIndex(-54);
      logInfo(`letterAtIndex(index=-54): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0067 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0068
     * @tc.name      CitySearch_LetterAtIndex_0068
     * @tc.desc      letterAtIndex(index=91) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0068 begin`);
      const actual: string = letterAtIndex(91);
      logInfo(`letterAtIndex(index=91): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0068 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0069
     * @tc.name      CitySearch_LetterAtIndex_0069
     * @tc.desc      letterAtIndex(index=19) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0069 begin`);
      const actual: string = letterAtIndex(19);
      logInfo(`letterAtIndex(index=19): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0069 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0070
     * @tc.name      CitySearch_LetterAtIndex_0070
     * @tc.desc      letterAtIndex(index=-64) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_LetterAtIndex_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0070 begin`);
      const actual: string = letterAtIndex(-64);
      logInfo(`letterAtIndex(index=-64): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0070 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0071
     * @tc.name      CitySearch_LetterAtIndex_0071
     * @tc.desc      letterAtIndex(index=-82) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_LetterAtIndex_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0071 begin`);
      const actual: string = letterAtIndex(-82);
      logInfo(`letterAtIndex(index=-82): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0071 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0072
     * @tc.name      CitySearch_LetterAtIndex_0072
     * @tc.desc      letterAtIndex(index=-70) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_LetterAtIndex_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0072 begin`);
      const actual: string = letterAtIndex(-70);
      logInfo(`letterAtIndex(index=-70): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0072 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0073
     * @tc.name      CitySearch_LetterAtIndex_0073
     * @tc.desc      letterAtIndex(index=183) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0073 begin`);
      const actual: string = letterAtIndex(183);
      logInfo(`letterAtIndex(index=183): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0073 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0074
     * @tc.name      CitySearch_LetterAtIndex_0074
     * @tc.desc      letterAtIndex(index=154) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0074 begin`);
      const actual: string = letterAtIndex(154);
      logInfo(`letterAtIndex(index=154): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0074 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0075
     * @tc.name      CitySearch_LetterAtIndex_0075
     * @tc.desc      letterAtIndex(index=29) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0075 begin`);
      const actual: string = letterAtIndex(29);
      logInfo(`letterAtIndex(index=29): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0075 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0076
     * @tc.name      CitySearch_LetterAtIndex_0076
     * @tc.desc      letterAtIndex(index=19.52) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0076 begin`);
      const actual: string = letterAtIndex(19.52);
      logInfo(`letterAtIndex(index=19.52): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0076 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0077
     * @tc.name      CitySearch_LetterAtIndex_0077
     * @tc.desc      letterAtIndex(index=153) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0077 begin`);
      const actual: string = letterAtIndex(153);
      logInfo(`letterAtIndex(index=153): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0077 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0078
     * @tc.name      CitySearch_LetterAtIndex_0078
     * @tc.desc      letterAtIndex(index=77.51) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0078 begin`);
      const actual: string = letterAtIndex(77.51);
      logInfo(`letterAtIndex(index=77.51): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0078 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0079
     * @tc.name      CitySearch_LetterAtIndex_0079
     * @tc.desc      letterAtIndex(index=177) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0079 begin`);
      const actual: string = letterAtIndex(177);
      logInfo(`letterAtIndex(index=177): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0079 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0080
     * @tc.name      CitySearch_LetterAtIndex_0080
     * @tc.desc      letterAtIndex(index=-4) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_LetterAtIndex_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0080 begin`);
      const actual: string = letterAtIndex(-4);
      logInfo(`letterAtIndex(index=-4): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0080 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0081
     * @tc.name      CitySearch_LetterAtIndex_0081
     * @tc.desc      letterAtIndex(index=-5) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_LetterAtIndex_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0081 begin`);
      const actual: string = letterAtIndex(-5);
      logInfo(`letterAtIndex(index=-5): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0081 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0082
     * @tc.name      CitySearch_LetterAtIndex_0082
     * @tc.desc      letterAtIndex(index=113) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0082 begin`);
      const actual: string = letterAtIndex(113);
      logInfo(`letterAtIndex(index=113): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0082 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0083
     * @tc.name      CitySearch_LetterAtIndex_0083
     * @tc.desc      letterAtIndex(index=146) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0083 begin`);
      const actual: string = letterAtIndex(146);
      logInfo(`letterAtIndex(index=146): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0083 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0084
     * @tc.name      CitySearch_LetterAtIndex_0084
     * @tc.desc      letterAtIndex(index=-58) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_LetterAtIndex_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0084 begin`);
      const actual: string = letterAtIndex(-58);
      logInfo(`letterAtIndex(index=-58): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0084 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0085
     * @tc.name      CitySearch_LetterAtIndex_0085
     * @tc.desc      letterAtIndex(index=39.3) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0085 begin`);
      const actual: string = letterAtIndex(39.3);
      logInfo(`letterAtIndex(index=39.3): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0085 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0086
     * @tc.name      CitySearch_LetterAtIndex_0086
     * @tc.desc      letterAtIndex(index=161) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0086 begin`);
      const actual: string = letterAtIndex(161);
      logInfo(`letterAtIndex(index=161): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0086 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0087
     * @tc.name      CitySearch_LetterAtIndex_0087
     * @tc.desc      letterAtIndex(index=9.91) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0087 begin`);
      const actual: string = letterAtIndex(9.91);
      logInfo(`letterAtIndex(index=9.91): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0087 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0088
     * @tc.name      CitySearch_LetterAtIndex_0088
     * @tc.desc      letterAtIndex(index=23) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0088 begin`);
      const actual: string = letterAtIndex(23);
      logInfo(`letterAtIndex(index=23): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0088 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0089
     * @tc.name      CitySearch_LetterAtIndex_0089
     * @tc.desc      letterAtIndex(index=-23) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_LetterAtIndex_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0089 begin`);
      const actual: string = letterAtIndex(-23);
      logInfo(`letterAtIndex(index=-23): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0089 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0090
     * @tc.name      CitySearch_LetterAtIndex_0090
     * @tc.desc      letterAtIndex(index=21) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0090 begin`);
      const actual: string = letterAtIndex(21);
      logInfo(`letterAtIndex(index=21): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0090 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0091
     * @tc.name      CitySearch_LetterAtIndex_0091
     * @tc.desc      letterAtIndex(index=-60) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_LetterAtIndex_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0091 begin`);
      const actual: string = letterAtIndex(-60);
      logInfo(`letterAtIndex(index=-60): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0091 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0092
     * @tc.name      CitySearch_LetterAtIndex_0092
     * @tc.desc      letterAtIndex(index=-9) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_LetterAtIndex_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0092 begin`);
      const actual: string = letterAtIndex(-9);
      logInfo(`letterAtIndex(index=-9): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0092 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0093
     * @tc.name      CitySearch_LetterAtIndex_0093
     * @tc.desc      letterAtIndex(index=27) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0093 begin`);
      const actual: string = letterAtIndex(27);
      logInfo(`letterAtIndex(index=27): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0093 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0094
     * @tc.name      CitySearch_LetterAtIndex_0094
     * @tc.desc      letterAtIndex(index=93) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0094 begin`);
      const actual: string = letterAtIndex(93);
      logInfo(`letterAtIndex(index=93): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0094 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0095
     * @tc.name      CitySearch_LetterAtIndex_0095
     * @tc.desc      letterAtIndex(index=-57) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_LetterAtIndex_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0095 begin`);
      const actual: string = letterAtIndex(-57);
      logInfo(`letterAtIndex(index=-57): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0095 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0096
     * @tc.name      CitySearch_LetterAtIndex_0096
     * @tc.desc      letterAtIndex(index=29.74) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0096 begin`);
      const actual: string = letterAtIndex(29.74);
      logInfo(`letterAtIndex(index=29.74): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0096 end`);
    });
  });
}
