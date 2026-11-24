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

/** Logic checks for letterOfIndex (24 cases). */
export default function letterOfIndex2Test(): void {
  describe('LetterOfIndex2Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0097
     * @tc.name      Location_LetterOfIndex_0097
     * @tc.desc      letterOfIndex(index=71.34) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LetterOfIndex_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0097 begin`);
      const actual: string = letterOfIndex(71.34);
      logInfo(`letterOfIndex(index=71.34): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0097 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0098
     * @tc.name      Location_LetterOfIndex_0098
     * @tc.desc      letterOfIndex(index=-39) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LetterOfIndex_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0098 begin`);
      const actual: string = letterOfIndex(-39);
      logInfo(`letterOfIndex(index=-39): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0098 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0099
     * @tc.name      Location_LetterOfIndex_0099
     * @tc.desc      letterOfIndex(index=-37) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LetterOfIndex_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0099 begin`);
      const actual: string = letterOfIndex(-37);
      logInfo(`letterOfIndex(index=-37): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0099 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0100
     * @tc.name      Location_LetterOfIndex_0100
     * @tc.desc      letterOfIndex(index=85.09) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LetterOfIndex_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0100 begin`);
      const actual: string = letterOfIndex(85.09);
      logInfo(`letterOfIndex(index=85.09): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0100 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0101
     * @tc.name      Location_LetterOfIndex_0101
     * @tc.desc      letterOfIndex(index=194) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LetterOfIndex_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0101 begin`);
      const actual: string = letterOfIndex(194);
      logInfo(`letterOfIndex(index=194): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0101 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0102
     * @tc.name      Location_LetterOfIndex_0102
     * @tc.desc      letterOfIndex(index=-100) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LetterOfIndex_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0102 begin`);
      const actual: string = letterOfIndex(-100);
      logInfo(`letterOfIndex(index=-100): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0102 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0103
     * @tc.name      Location_LetterOfIndex_0103
     * @tc.desc      letterOfIndex(index=7.8) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LetterOfIndex_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0103 begin`);
      const actual: string = letterOfIndex(7.8);
      logInfo(`letterOfIndex(index=7.8): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0103 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0104
     * @tc.name      Location_LetterOfIndex_0104
     * @tc.desc      letterOfIndex(index=28.64) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LetterOfIndex_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0104 begin`);
      const actual: string = letterOfIndex(28.64);
      logInfo(`letterOfIndex(index=28.64): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0104 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0105
     * @tc.name      Location_LetterOfIndex_0105
     * @tc.desc      letterOfIndex(index=66.98) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LetterOfIndex_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0105 begin`);
      const actual: string = letterOfIndex(66.98);
      logInfo(`letterOfIndex(index=66.98): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0105 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0106
     * @tc.name      Location_LetterOfIndex_0106
     * @tc.desc      letterOfIndex(index=44.8) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LetterOfIndex_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0106 begin`);
      const actual: string = letterOfIndex(44.8);
      logInfo(`letterOfIndex(index=44.8): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0106 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0107
     * @tc.name      Location_LetterOfIndex_0107
     * @tc.desc      letterOfIndex(index=59.38) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LetterOfIndex_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0107 begin`);
      const actual: string = letterOfIndex(59.38);
      logInfo(`letterOfIndex(index=59.38): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0107 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0108
     * @tc.name      Location_LetterOfIndex_0108
     * @tc.desc      letterOfIndex(index=90.62) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LetterOfIndex_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0108 begin`);
      const actual: string = letterOfIndex(90.62);
      logInfo(`letterOfIndex(index=90.62): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0108 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0109
     * @tc.name      Location_LetterOfIndex_0109
     * @tc.desc      letterOfIndex(index=-4) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LetterOfIndex_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0109 begin`);
      const actual: string = letterOfIndex(-4);
      logInfo(`letterOfIndex(index=-4): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0109 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0110
     * @tc.name      Location_LetterOfIndex_0110
     * @tc.desc      letterOfIndex(index=86.72) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LetterOfIndex_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0110 begin`);
      const actual: string = letterOfIndex(86.72);
      logInfo(`letterOfIndex(index=86.72): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0110 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0111
     * @tc.name      Location_LetterOfIndex_0111
     * @tc.desc      letterOfIndex(index=119) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LetterOfIndex_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0111 begin`);
      const actual: string = letterOfIndex(119);
      logInfo(`letterOfIndex(index=119): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0111 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0112
     * @tc.name      Location_LetterOfIndex_0112
     * @tc.desc      letterOfIndex(index=24.24) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LetterOfIndex_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0112 begin`);
      const actual: string = letterOfIndex(24.24);
      logInfo(`letterOfIndex(index=24.24): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0112 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0113
     * @tc.name      Location_LetterOfIndex_0113
     * @tc.desc      letterOfIndex(index=138) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LetterOfIndex_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0113 begin`);
      const actual: string = letterOfIndex(138);
      logInfo(`letterOfIndex(index=138): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0113 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0114
     * @tc.name      Location_LetterOfIndex_0114
     * @tc.desc      letterOfIndex(index=158) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LetterOfIndex_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0114 begin`);
      const actual: string = letterOfIndex(158);
      logInfo(`letterOfIndex(index=158): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0114 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0115
     * @tc.name      Location_LetterOfIndex_0115
     * @tc.desc      letterOfIndex(index=94) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LetterOfIndex_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0115 begin`);
      const actual: string = letterOfIndex(94);
      logInfo(`letterOfIndex(index=94): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0115 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0116
     * @tc.name      Location_LetterOfIndex_0116
     * @tc.desc      letterOfIndex(index=99) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LetterOfIndex_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0116 begin`);
      const actual: string = letterOfIndex(99);
      logInfo(`letterOfIndex(index=99): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0116 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0117
     * @tc.name      Location_LetterOfIndex_0117
     * @tc.desc      letterOfIndex(index=117) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LetterOfIndex_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0117 begin`);
      const actual: string = letterOfIndex(117);
      logInfo(`letterOfIndex(index=117): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0117 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0118
     * @tc.name      Location_LetterOfIndex_0118
     * @tc.desc      letterOfIndex(index=-2) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LetterOfIndex_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0118 begin`);
      const actual: string = letterOfIndex(-2);
      logInfo(`letterOfIndex(index=-2): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0118 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0119
     * @tc.name      Location_LetterOfIndex_0119
     * @tc.desc      letterOfIndex(index=17.5) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LetterOfIndex_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0119 begin`);
      const actual: string = letterOfIndex(17.5);
      logInfo(`letterOfIndex(index=17.5): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0119 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LETTER_OF_INDEX_0120
     * @tc.name      Location_LetterOfIndex_0120
     * @tc.desc      letterOfIndex(index=17.16) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LetterOfIndex_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfIndex_0120 begin`);
      const actual: string = letterOfIndex(17.16);
      logInfo(`letterOfIndex(index=17.16): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfIndex_0120 end`);
    });
  });
}
