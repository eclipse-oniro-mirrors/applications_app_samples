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
import { letterOfIndex } from '../model/CityPickerLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Location]';
const BUNDLE: string = 'Location_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for letterOfIndex (96 cases). */
export default function letterOfIndexTest(): void {
  describe('LetterOfIndexTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0001
     * @tc.name      Location_LetterOfIndex_0001
     * @tc.desc      letterOfIndex(index=0) returns "A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Location_LetterOfIndex_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0001 begin`);
      const actual: string = letterOfIndex(0);
      logInfo(`letterOfIndex(index=0): actual=${actual}`);
      expect(actual).assertEqual('A');
      logInfo(`${BUNDLE}LetterOfIndex_0001 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0002
     * @tc.name      Location_LetterOfIndex_0002
     * @tc.desc      letterOfIndex(index=1) returns "B"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Location_LetterOfIndex_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0002 begin`);
      const actual: string = letterOfIndex(1);
      logInfo(`letterOfIndex(index=1): actual=${actual}`);
      expect(actual).assertEqual('B');
      logInfo(`${BUNDLE}LetterOfIndex_0002 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0003
     * @tc.name      Location_LetterOfIndex_0003
     * @tc.desc      letterOfIndex(index=-1) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_LetterOfIndex_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0003 begin`);
      const actual: string = letterOfIndex(-1);
      logInfo(`letterOfIndex(index=-1): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0003 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0004
     * @tc.name      Location_LetterOfIndex_0004
     * @tc.desc      letterOfIndex(index=2) returns "C"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LetterOfIndex_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0004 begin`);
      const actual: string = letterOfIndex(2);
      logInfo(`letterOfIndex(index=2): actual=${actual}`);
      expect(actual).assertEqual('C');
      logInfo(`${BUNDLE}LetterOfIndex_0004 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0005
     * @tc.name      Location_LetterOfIndex_0005
     * @tc.desc      letterOfIndex(index=5) returns "H"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LetterOfIndex_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0005 begin`);
      const actual: string = letterOfIndex(5);
      logInfo(`letterOfIndex(index=5): actual=${actual}`);
      expect(actual).assertEqual('H');
      logInfo(`${BUNDLE}LetterOfIndex_0005 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0006
     * @tc.name      Location_LetterOfIndex_0006
     * @tc.desc      letterOfIndex(index=10) returns "S"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LetterOfIndex_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0006 begin`);
      const actual: string = letterOfIndex(10);
      logInfo(`letterOfIndex(index=10): actual=${actual}`);
      expect(actual).assertEqual('S');
      logInfo(`${BUNDLE}LetterOfIndex_0006 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0007
     * @tc.name      Location_LetterOfIndex_0007
     * @tc.desc      letterOfIndex(index=3) returns "F"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LetterOfIndex_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0007 begin`);
      const actual: string = letterOfIndex(3);
      logInfo(`letterOfIndex(index=3): actual=${actual}`);
      expect(actual).assertEqual('F');
      logInfo(`${BUNDLE}LetterOfIndex_0007 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0008
     * @tc.name      Location_LetterOfIndex_0008
     * @tc.desc      letterOfIndex(index=14) returns "Z"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LetterOfIndex_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0008 begin`);
      const actual: string = letterOfIndex(14);
      logInfo(`letterOfIndex(index=14): actual=${actual}`);
      expect(actual).assertEqual('Z');
      logInfo(`${BUNDLE}LetterOfIndex_0008 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0009
     * @tc.name      Location_LetterOfIndex_0009
     * @tc.desc      letterOfIndex(index=100) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LetterOfIndex_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0009 begin`);
      const actual: string = letterOfIndex(100);
      logInfo(`letterOfIndex(index=100): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0009 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0010
     * @tc.name      Location_LetterOfIndex_0010
     * @tc.desc      letterOfIndex(index=15) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LetterOfIndex_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0010 begin`);
      const actual: string = letterOfIndex(15);
      logInfo(`letterOfIndex(index=15): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0010 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0011
     * @tc.name      Location_LetterOfIndex_0011
     * @tc.desc      letterOfIndex(index=20) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LetterOfIndex_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0011 begin`);
      const actual: string = letterOfIndex(20);
      logInfo(`letterOfIndex(index=20): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0011 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0012
     * @tc.name      Location_LetterOfIndex_0012
     * @tc.desc      letterOfIndex(index=25) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LetterOfIndex_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0012 begin`);
      const actual: string = letterOfIndex(25);
      logInfo(`letterOfIndex(index=25): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0012 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0013
     * @tc.name      Location_LetterOfIndex_0013
     * @tc.desc      letterOfIndex(index=30) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LetterOfIndex_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0013 begin`);
      const actual: string = letterOfIndex(30);
      logInfo(`letterOfIndex(index=30): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0013 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0014
     * @tc.name      Location_LetterOfIndex_0014
     * @tc.desc      letterOfIndex(index=35) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LetterOfIndex_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0014 begin`);
      const actual: string = letterOfIndex(35);
      logInfo(`letterOfIndex(index=35): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0014 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0015
     * @tc.name      Location_LetterOfIndex_0015
     * @tc.desc      letterOfIndex(index=40) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LetterOfIndex_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0015 begin`);
      const actual: string = letterOfIndex(40);
      logInfo(`letterOfIndex(index=40): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0015 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0016
     * @tc.name      Location_LetterOfIndex_0016
     * @tc.desc      letterOfIndex(index=45) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LetterOfIndex_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0016 begin`);
      const actual: string = letterOfIndex(45);
      logInfo(`letterOfIndex(index=45): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0016 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0017
     * @tc.name      Location_LetterOfIndex_0017
     * @tc.desc      letterOfIndex(index=50) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LetterOfIndex_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0017 begin`);
      const actual: string = letterOfIndex(50);
      logInfo(`letterOfIndex(index=50): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0017 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0018
     * @tc.name      Location_LetterOfIndex_0018
     * @tc.desc      letterOfIndex(index=55) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LetterOfIndex_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0018 begin`);
      const actual: string = letterOfIndex(55);
      logInfo(`letterOfIndex(index=55): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0018 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0019
     * @tc.name      Location_LetterOfIndex_0019
     * @tc.desc      letterOfIndex(index=60) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LetterOfIndex_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0019 begin`);
      const actual: string = letterOfIndex(60);
      logInfo(`letterOfIndex(index=60): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0019 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0020
     * @tc.name      Location_LetterOfIndex_0020
     * @tc.desc      letterOfIndex(index=65) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LetterOfIndex_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0020 begin`);
      const actual: string = letterOfIndex(65);
      logInfo(`letterOfIndex(index=65): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0020 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0021
     * @tc.name      Location_LetterOfIndex_0021
     * @tc.desc      letterOfIndex(index=70) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LetterOfIndex_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0021 begin`);
      const actual: string = letterOfIndex(70);
      logInfo(`letterOfIndex(index=70): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0021 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0022
     * @tc.name      Location_LetterOfIndex_0022
     * @tc.desc      letterOfIndex(index=75) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LetterOfIndex_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0022 begin`);
      const actual: string = letterOfIndex(75);
      logInfo(`letterOfIndex(index=75): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0022 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0023
     * @tc.name      Location_LetterOfIndex_0023
     * @tc.desc      letterOfIndex(index=80) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LetterOfIndex_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0023 begin`);
      const actual: string = letterOfIndex(80);
      logInfo(`letterOfIndex(index=80): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0023 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0024
     * @tc.name      Location_LetterOfIndex_0024
     * @tc.desc      letterOfIndex(index=85) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LetterOfIndex_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0024 begin`);
      const actual: string = letterOfIndex(85);
      logInfo(`letterOfIndex(index=85): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0024 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0025
     * @tc.name      Location_LetterOfIndex_0025
     * @tc.desc      letterOfIndex(index=90) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LetterOfIndex_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0025 begin`);
      const actual: string = letterOfIndex(90);
      logInfo(`letterOfIndex(index=90): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0025 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0026
     * @tc.name      Location_LetterOfIndex_0026
     * @tc.desc      letterOfIndex(index=95) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LetterOfIndex_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0026 begin`);
      const actual: string = letterOfIndex(95);
      logInfo(`letterOfIndex(index=95): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0026 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0027
     * @tc.name      Location_LetterOfIndex_0027
     * @tc.desc      letterOfIndex(index=105) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LetterOfIndex_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0027 begin`);
      const actual: string = letterOfIndex(105);
      logInfo(`letterOfIndex(index=105): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0027 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0028
     * @tc.name      Location_LetterOfIndex_0028
     * @tc.desc      letterOfIndex(index=110) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LetterOfIndex_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0028 begin`);
      const actual: string = letterOfIndex(110);
      logInfo(`letterOfIndex(index=110): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0028 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0029
     * @tc.name      Location_LetterOfIndex_0029
     * @tc.desc      letterOfIndex(index=115) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LetterOfIndex_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0029 begin`);
      const actual: string = letterOfIndex(115);
      logInfo(`letterOfIndex(index=115): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0029 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0030
     * @tc.name      Location_LetterOfIndex_0030
     * @tc.desc      letterOfIndex(index=120) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LetterOfIndex_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0030 begin`);
      const actual: string = letterOfIndex(120);
      logInfo(`letterOfIndex(index=120): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0030 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0031
     * @tc.name      Location_LetterOfIndex_0031
     * @tc.desc      letterOfIndex(index=125) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LetterOfIndex_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0031 begin`);
      const actual: string = letterOfIndex(125);
      logInfo(`letterOfIndex(index=125): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0031 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0032
     * @tc.name      Location_LetterOfIndex_0032
     * @tc.desc      letterOfIndex(index=130) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LetterOfIndex_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0032 begin`);
      const actual: string = letterOfIndex(130);
      logInfo(`letterOfIndex(index=130): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0032 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0033
     * @tc.name      Location_LetterOfIndex_0033
     * @tc.desc      letterOfIndex(index=135) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LetterOfIndex_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0033 begin`);
      const actual: string = letterOfIndex(135);
      logInfo(`letterOfIndex(index=135): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0033 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0034
     * @tc.name      Location_LetterOfIndex_0034
     * @tc.desc      letterOfIndex(index=140) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LetterOfIndex_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0034 begin`);
      const actual: string = letterOfIndex(140);
      logInfo(`letterOfIndex(index=140): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0034 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0035
     * @tc.name      Location_LetterOfIndex_0035
     * @tc.desc      letterOfIndex(index=145) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LetterOfIndex_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0035 begin`);
      const actual: string = letterOfIndex(145);
      logInfo(`letterOfIndex(index=145): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0035 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0036
     * @tc.name      Location_LetterOfIndex_0036
     * @tc.desc      letterOfIndex(index=150) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LetterOfIndex_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0036 begin`);
      const actual: string = letterOfIndex(150);
      logInfo(`letterOfIndex(index=150): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0036 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0037
     * @tc.name      Location_LetterOfIndex_0037
     * @tc.desc      letterOfIndex(index=155) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LetterOfIndex_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0037 begin`);
      const actual: string = letterOfIndex(155);
      logInfo(`letterOfIndex(index=155): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0037 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0038
     * @tc.name      Location_LetterOfIndex_0038
     * @tc.desc      letterOfIndex(index=160) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LetterOfIndex_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0038 begin`);
      const actual: string = letterOfIndex(160);
      logInfo(`letterOfIndex(index=160): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0038 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0039
     * @tc.name      Location_LetterOfIndex_0039
     * @tc.desc      letterOfIndex(index=165) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LetterOfIndex_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0039 begin`);
      const actual: string = letterOfIndex(165);
      logInfo(`letterOfIndex(index=165): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0039 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0040
     * @tc.name      Location_LetterOfIndex_0040
     * @tc.desc      letterOfIndex(index=170) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LetterOfIndex_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0040 begin`);
      const actual: string = letterOfIndex(170);
      logInfo(`letterOfIndex(index=170): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0040 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0041
     * @tc.name      Location_LetterOfIndex_0041
     * @tc.desc      letterOfIndex(index=175) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LetterOfIndex_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0041 begin`);
      const actual: string = letterOfIndex(175);
      logInfo(`letterOfIndex(index=175): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0041 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0042
     * @tc.name      Location_LetterOfIndex_0042
     * @tc.desc      letterOfIndex(index=180) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LetterOfIndex_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0042 begin`);
      const actual: string = letterOfIndex(180);
      logInfo(`letterOfIndex(index=180): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0042 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0043
     * @tc.name      Location_LetterOfIndex_0043
     * @tc.desc      letterOfIndex(index=185) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LetterOfIndex_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0043 begin`);
      const actual: string = letterOfIndex(185);
      logInfo(`letterOfIndex(index=185): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0043 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0044
     * @tc.name      Location_LetterOfIndex_0044
     * @tc.desc      letterOfIndex(index=190) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LetterOfIndex_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0044 begin`);
      const actual: string = letterOfIndex(190);
      logInfo(`letterOfIndex(index=190): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0044 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0045
     * @tc.name      Location_LetterOfIndex_0045
     * @tc.desc      letterOfIndex(index=195) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LetterOfIndex_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0045 begin`);
      const actual: string = letterOfIndex(195);
      logInfo(`letterOfIndex(index=195): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0045 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0046
     * @tc.name      Location_LetterOfIndex_0046
     * @tc.desc      letterOfIndex(index=200) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LetterOfIndex_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0046 begin`);
      const actual: string = letterOfIndex(200);
      logInfo(`letterOfIndex(index=200): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0046 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0047
     * @tc.name      Location_LetterOfIndex_0047
     * @tc.desc      letterOfIndex(index=121) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LetterOfIndex_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0047 begin`);
      const actual: string = letterOfIndex(121);
      logInfo(`letterOfIndex(index=121): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0047 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0048
     * @tc.name      Location_LetterOfIndex_0048
     * @tc.desc      letterOfIndex(index=-9) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LetterOfIndex_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0048 begin`);
      const actual: string = letterOfIndex(-9);
      logInfo(`letterOfIndex(index=-9): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0048 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0049
     * @tc.name      Location_LetterOfIndex_0049
     * @tc.desc      letterOfIndex(index=53.1) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LetterOfIndex_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0049 begin`);
      const actual: string = letterOfIndex(53.1);
      logInfo(`letterOfIndex(index=53.1): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0049 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0050
     * @tc.name      Location_LetterOfIndex_0050
     * @tc.desc      letterOfIndex(index=22) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LetterOfIndex_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0050 begin`);
      const actual: string = letterOfIndex(22);
      logInfo(`letterOfIndex(index=22): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0050 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0051
     * @tc.name      Location_LetterOfIndex_0051
     * @tc.desc      letterOfIndex(index=183) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LetterOfIndex_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0051 begin`);
      const actual: string = letterOfIndex(183);
      logInfo(`letterOfIndex(index=183): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0051 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0052
     * @tc.name      Location_LetterOfIndex_0052
     * @tc.desc      letterOfIndex(index=17.32) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LetterOfIndex_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0052 begin`);
      const actual: string = letterOfIndex(17.32);
      logInfo(`letterOfIndex(index=17.32): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0052 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0053
     * @tc.name      Location_LetterOfIndex_0053
     * @tc.desc      letterOfIndex(index=31) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LetterOfIndex_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0053 begin`);
      const actual: string = letterOfIndex(31);
      logInfo(`letterOfIndex(index=31): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0053 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0054
     * @tc.name      Location_LetterOfIndex_0054
     * @tc.desc      letterOfIndex(index=56) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LetterOfIndex_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0054 begin`);
      const actual: string = letterOfIndex(56);
      logInfo(`letterOfIndex(index=56): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0054 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0055
     * @tc.name      Location_LetterOfIndex_0055
     * @tc.desc      letterOfIndex(index=19) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LetterOfIndex_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0055 begin`);
      const actual: string = letterOfIndex(19);
      logInfo(`letterOfIndex(index=19): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0055 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0056
     * @tc.name      Location_LetterOfIndex_0056
     * @tc.desc      letterOfIndex(index=26.09) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LetterOfIndex_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0056 begin`);
      const actual: string = letterOfIndex(26.09);
      logInfo(`letterOfIndex(index=26.09): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0056 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0057
     * @tc.name      Location_LetterOfIndex_0057
     * @tc.desc      letterOfIndex(index=21) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LetterOfIndex_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0057 begin`);
      const actual: string = letterOfIndex(21);
      logInfo(`letterOfIndex(index=21): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0057 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0058
     * @tc.name      Location_LetterOfIndex_0058
     * @tc.desc      letterOfIndex(index=82.87) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LetterOfIndex_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0058 begin`);
      const actual: string = letterOfIndex(82.87);
      logInfo(`letterOfIndex(index=82.87): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0058 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0059
     * @tc.name      Location_LetterOfIndex_0059
     * @tc.desc      letterOfIndex(index=163) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LetterOfIndex_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0059 begin`);
      const actual: string = letterOfIndex(163);
      logInfo(`letterOfIndex(index=163): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0059 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0060
     * @tc.name      Location_LetterOfIndex_0060
     * @tc.desc      letterOfIndex(index=32) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LetterOfIndex_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0060 begin`);
      const actual: string = letterOfIndex(32);
      logInfo(`letterOfIndex(index=32): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0060 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0061
     * @tc.name      Location_LetterOfIndex_0061
     * @tc.desc      letterOfIndex(index=46) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LetterOfIndex_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0061 begin`);
      const actual: string = letterOfIndex(46);
      logInfo(`letterOfIndex(index=46): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0061 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0062
     * @tc.name      Location_LetterOfIndex_0062
     * @tc.desc      letterOfIndex(index=-79) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LetterOfIndex_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0062 begin`);
      const actual: string = letterOfIndex(-79);
      logInfo(`letterOfIndex(index=-79): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0062 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0063
     * @tc.name      Location_LetterOfIndex_0063
     * @tc.desc      letterOfIndex(index=107) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LetterOfIndex_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0063 begin`);
      const actual: string = letterOfIndex(107);
      logInfo(`letterOfIndex(index=107): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0063 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0064
     * @tc.name      Location_LetterOfIndex_0064
     * @tc.desc      letterOfIndex(index=142) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LetterOfIndex_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0064 begin`);
      const actual: string = letterOfIndex(142);
      logInfo(`letterOfIndex(index=142): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0064 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0065
     * @tc.name      Location_LetterOfIndex_0065
     * @tc.desc      letterOfIndex(index=-86) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LetterOfIndex_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0065 begin`);
      const actual: string = letterOfIndex(-86);
      logInfo(`letterOfIndex(index=-86): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0065 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0066
     * @tc.name      Location_LetterOfIndex_0066
     * @tc.desc      letterOfIndex(index=154) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LetterOfIndex_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0066 begin`);
      const actual: string = letterOfIndex(154);
      logInfo(`letterOfIndex(index=154): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0066 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0067
     * @tc.name      Location_LetterOfIndex_0067
     * @tc.desc      letterOfIndex(index=86) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LetterOfIndex_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0067 begin`);
      const actual: string = letterOfIndex(86);
      logInfo(`letterOfIndex(index=86): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0067 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0068
     * @tc.name      Location_LetterOfIndex_0068
     * @tc.desc      letterOfIndex(index=41.08) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LetterOfIndex_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0068 begin`);
      const actual: string = letterOfIndex(41.08);
      logInfo(`letterOfIndex(index=41.08): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0068 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0069
     * @tc.name      Location_LetterOfIndex_0069
     * @tc.desc      letterOfIndex(index=83) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LetterOfIndex_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0069 begin`);
      const actual: string = letterOfIndex(83);
      logInfo(`letterOfIndex(index=83): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0069 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0070
     * @tc.name      Location_LetterOfIndex_0070
     * @tc.desc      letterOfIndex(index=-50) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LetterOfIndex_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0070 begin`);
      const actual: string = letterOfIndex(-50);
      logInfo(`letterOfIndex(index=-50): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0070 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0071
     * @tc.name      Location_LetterOfIndex_0071
     * @tc.desc      letterOfIndex(index=42) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LetterOfIndex_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0071 begin`);
      const actual: string = letterOfIndex(42);
      logInfo(`letterOfIndex(index=42): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0071 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0072
     * @tc.name      Location_LetterOfIndex_0072
     * @tc.desc      letterOfIndex(index=-62) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LetterOfIndex_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0072 begin`);
      const actual: string = letterOfIndex(-62);
      logInfo(`letterOfIndex(index=-62): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0072 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0073
     * @tc.name      Location_LetterOfIndex_0073
     * @tc.desc      letterOfIndex(index=-5) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LetterOfIndex_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0073 begin`);
      const actual: string = letterOfIndex(-5);
      logInfo(`letterOfIndex(index=-5): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0073 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0074
     * @tc.name      Location_LetterOfIndex_0074
     * @tc.desc      letterOfIndex(index=-89) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LetterOfIndex_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0074 begin`);
      const actual: string = letterOfIndex(-89);
      logInfo(`letterOfIndex(index=-89): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0074 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0075
     * @tc.name      Location_LetterOfIndex_0075
     * @tc.desc      letterOfIndex(index=-33) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LetterOfIndex_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0075 begin`);
      const actual: string = letterOfIndex(-33);
      logInfo(`letterOfIndex(index=-33): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0075 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0076
     * @tc.name      Location_LetterOfIndex_0076
     * @tc.desc      letterOfIndex(index=109) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LetterOfIndex_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0076 begin`);
      const actual: string = letterOfIndex(109);
      logInfo(`letterOfIndex(index=109): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0076 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0077
     * @tc.name      Location_LetterOfIndex_0077
     * @tc.desc      letterOfIndex(index=-40) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LetterOfIndex_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0077 begin`);
      const actual: string = letterOfIndex(-40);
      logInfo(`letterOfIndex(index=-40): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0077 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0078
     * @tc.name      Location_LetterOfIndex_0078
     * @tc.desc      letterOfIndex(index=-20) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LetterOfIndex_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0078 begin`);
      const actual: string = letterOfIndex(-20);
      logInfo(`letterOfIndex(index=-20): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0078 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0079
     * @tc.name      Location_LetterOfIndex_0079
     * @tc.desc      letterOfIndex(index=-47) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LetterOfIndex_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0079 begin`);
      const actual: string = letterOfIndex(-47);
      logInfo(`letterOfIndex(index=-47): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0079 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0080
     * @tc.name      Location_LetterOfIndex_0080
     * @tc.desc      letterOfIndex(index=79) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LetterOfIndex_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0080 begin`);
      const actual: string = letterOfIndex(79);
      logInfo(`letterOfIndex(index=79): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0080 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0081
     * @tc.name      Location_LetterOfIndex_0081
     * @tc.desc      letterOfIndex(index=174) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LetterOfIndex_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0081 begin`);
      const actual: string = letterOfIndex(174);
      logInfo(`letterOfIndex(index=174): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0081 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0082
     * @tc.name      Location_LetterOfIndex_0082
     * @tc.desc      letterOfIndex(index=-3) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LetterOfIndex_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0082 begin`);
      const actual: string = letterOfIndex(-3);
      logInfo(`letterOfIndex(index=-3): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0082 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0083
     * @tc.name      Location_LetterOfIndex_0083
     * @tc.desc      letterOfIndex(index=-98) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LetterOfIndex_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0083 begin`);
      const actual: string = letterOfIndex(-98);
      logInfo(`letterOfIndex(index=-98): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0083 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0084
     * @tc.name      Location_LetterOfIndex_0084
     * @tc.desc      letterOfIndex(index=-14) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LetterOfIndex_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0084 begin`);
      const actual: string = letterOfIndex(-14);
      logInfo(`letterOfIndex(index=-14): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0084 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0085
     * @tc.name      Location_LetterOfIndex_0085
     * @tc.desc      letterOfIndex(index=-26) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LetterOfIndex_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0085 begin`);
      const actual: string = letterOfIndex(-26);
      logInfo(`letterOfIndex(index=-26): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0085 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0086
     * @tc.name      Location_LetterOfIndex_0086
     * @tc.desc      letterOfIndex(index=62) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LetterOfIndex_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0086 begin`);
      const actual: string = letterOfIndex(62);
      logInfo(`letterOfIndex(index=62): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0086 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0087
     * @tc.name      Location_LetterOfIndex_0087
     * @tc.desc      letterOfIndex(index=159) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LetterOfIndex_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0087 begin`);
      const actual: string = letterOfIndex(159);
      logInfo(`letterOfIndex(index=159): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0087 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0088
     * @tc.name      Location_LetterOfIndex_0088
     * @tc.desc      letterOfIndex(index=129) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LetterOfIndex_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0088 begin`);
      const actual: string = letterOfIndex(129);
      logInfo(`letterOfIndex(index=129): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0088 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0089
     * @tc.name      Location_LetterOfIndex_0089
     * @tc.desc      letterOfIndex(index=-76) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LetterOfIndex_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0089 begin`);
      const actual: string = letterOfIndex(-76);
      logInfo(`letterOfIndex(index=-76): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0089 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0090
     * @tc.name      Location_LetterOfIndex_0090
     * @tc.desc      letterOfIndex(index=114) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LetterOfIndex_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0090 begin`);
      const actual: string = letterOfIndex(114);
      logInfo(`letterOfIndex(index=114): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0090 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0091
     * @tc.name      Location_LetterOfIndex_0091
     * @tc.desc      letterOfIndex(index=-41) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LetterOfIndex_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0091 begin`);
      const actual: string = letterOfIndex(-41);
      logInfo(`letterOfIndex(index=-41): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0091 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0092
     * @tc.name      Location_LetterOfIndex_0092
     * @tc.desc      letterOfIndex(index=-15) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LetterOfIndex_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0092 begin`);
      const actual: string = letterOfIndex(-15);
      logInfo(`letterOfIndex(index=-15): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0092 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0093
     * @tc.name      Location_LetterOfIndex_0093
     * @tc.desc      letterOfIndex(index=14.8) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LetterOfIndex_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0093 begin`);
      const actual: string = letterOfIndex(14.8);
      logInfo(`letterOfIndex(index=14.8): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0093 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0094
     * @tc.name      Location_LetterOfIndex_0094
     * @tc.desc      letterOfIndex(index=-36) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LetterOfIndex_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0094 begin`);
      const actual: string = letterOfIndex(-36);
      logInfo(`letterOfIndex(index=-36): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0094 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0095
     * @tc.name      Location_LetterOfIndex_0095
     * @tc.desc      letterOfIndex(index=64.87) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LetterOfIndex_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0095 begin`);
      const actual: string = letterOfIndex(64.87);
      logInfo(`letterOfIndex(index=64.87): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0095 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0096
     * @tc.name      Location_LetterOfIndex_0096
     * @tc.desc      letterOfIndex(index=-7) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LetterOfIndex_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0096 begin`);
      const actual: string = letterOfIndex(-7);
      logInfo(`letterOfIndex(index=-7): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0096 end`);
    });
  });
}
