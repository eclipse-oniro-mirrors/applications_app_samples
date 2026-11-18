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
export default function letterAtIndex2Test(): void {
  describe('LetterAtIndex2Test', () => {
    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0097
     * @tc.name      CitySearch_LetterAtIndex_0097
     * @tc.desc      letterAtIndex(index=187) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0097 begin`);
      const actual: string = letterAtIndex(187);
      logInfo(`letterAtIndex(index=187): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0097 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0098
     * @tc.name      CitySearch_LetterAtIndex_0098
     * @tc.desc      letterAtIndex(index=131) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0098 begin`);
      const actual: string = letterAtIndex(131);
      logInfo(`letterAtIndex(index=131): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0098 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0099
     * @tc.name      CitySearch_LetterAtIndex_0099
     * @tc.desc      letterAtIndex(index=-20) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_LetterAtIndex_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0099 begin`);
      const actual: string = letterAtIndex(-20);
      logInfo(`letterAtIndex(index=-20): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0099 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0100
     * @tc.name      CitySearch_LetterAtIndex_0100
     * @tc.desc      letterAtIndex(index=89) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0100 begin`);
      const actual: string = letterAtIndex(89);
      logInfo(`letterAtIndex(index=89): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0100 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0101
     * @tc.name      CitySearch_LetterAtIndex_0101
     * @tc.desc      letterAtIndex(index=83.17) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0101 begin`);
      const actual: string = letterAtIndex(83.17);
      logInfo(`letterAtIndex(index=83.17): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0101 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0102
     * @tc.name      CitySearch_LetterAtIndex_0102
     * @tc.desc      letterAtIndex(index=156) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0102 begin`);
      const actual: string = letterAtIndex(156);
      logInfo(`letterAtIndex(index=156): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0102 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0103
     * @tc.name      CitySearch_LetterAtIndex_0103
     * @tc.desc      letterAtIndex(index=72.67) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0103 begin`);
      const actual: string = letterAtIndex(72.67);
      logInfo(`letterAtIndex(index=72.67): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0103 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0104
     * @tc.name      CitySearch_LetterAtIndex_0104
     * @tc.desc      letterAtIndex(index=-52) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_LetterAtIndex_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0104 begin`);
      const actual: string = letterAtIndex(-52);
      logInfo(`letterAtIndex(index=-52): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0104 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0105
     * @tc.name      CitySearch_LetterAtIndex_0105
     * @tc.desc      letterAtIndex(index=186) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0105 begin`);
      const actual: string = letterAtIndex(186);
      logInfo(`letterAtIndex(index=186): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0105 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0106
     * @tc.name      CitySearch_LetterAtIndex_0106
     * @tc.desc      letterAtIndex(index=33.38) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0106 begin`);
      const actual: string = letterAtIndex(33.38);
      logInfo(`letterAtIndex(index=33.38): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0106 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0107
     * @tc.name      CitySearch_LetterAtIndex_0107
     * @tc.desc      letterAtIndex(index=-80) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_LetterAtIndex_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0107 begin`);
      const actual: string = letterAtIndex(-80);
      logInfo(`letterAtIndex(index=-80): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0107 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0108
     * @tc.name      CitySearch_LetterAtIndex_0108
     * @tc.desc      letterAtIndex(index=41.49) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0108 begin`);
      const actual: string = letterAtIndex(41.49);
      logInfo(`letterAtIndex(index=41.49): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0108 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0109
     * @tc.name      CitySearch_LetterAtIndex_0109
     * @tc.desc      letterAtIndex(index=87) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0109 begin`);
      const actual: string = letterAtIndex(87);
      logInfo(`letterAtIndex(index=87): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0109 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0110
     * @tc.name      CitySearch_LetterAtIndex_0110
     * @tc.desc      letterAtIndex(index=59.86) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0110 begin`);
      const actual: string = letterAtIndex(59.86);
      logInfo(`letterAtIndex(index=59.86): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0110 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0111
     * @tc.name      CitySearch_LetterAtIndex_0111
     * @tc.desc      letterAtIndex(index=-12) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_LetterAtIndex_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0111 begin`);
      const actual: string = letterAtIndex(-12);
      logInfo(`letterAtIndex(index=-12): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0111 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0112
     * @tc.name      CitySearch_LetterAtIndex_0112
     * @tc.desc      letterAtIndex(index=-37) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_LetterAtIndex_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0112 begin`);
      const actual: string = letterAtIndex(-37);
      logInfo(`letterAtIndex(index=-37): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0112 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0113
     * @tc.name      CitySearch_LetterAtIndex_0113
     * @tc.desc      letterAtIndex(index=81) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0113 begin`);
      const actual: string = letterAtIndex(81);
      logInfo(`letterAtIndex(index=81): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0113 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0114
     * @tc.name      CitySearch_LetterAtIndex_0114
     * @tc.desc      letterAtIndex(index=179) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0114 begin`);
      const actual: string = letterAtIndex(179);
      logInfo(`letterAtIndex(index=179): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0114 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0115
     * @tc.name      CitySearch_LetterAtIndex_0115
     * @tc.desc      letterAtIndex(index=182) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0115 begin`);
      const actual: string = letterAtIndex(182);
      logInfo(`letterAtIndex(index=182): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0115 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0116
     * @tc.name      CitySearch_LetterAtIndex_0116
     * @tc.desc      letterAtIndex(index=32) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0116 begin`);
      const actual: string = letterAtIndex(32);
      logInfo(`letterAtIndex(index=32): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0116 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0117
     * @tc.name      CitySearch_LetterAtIndex_0117
     * @tc.desc      letterAtIndex(index=109) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0117 begin`);
      const actual: string = letterAtIndex(109);
      logInfo(`letterAtIndex(index=109): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0117 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0118
     * @tc.name      CitySearch_LetterAtIndex_0118
     * @tc.desc      letterAtIndex(index=31.12) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0118 begin`);
      const actual: string = letterAtIndex(31.12);
      logInfo(`letterAtIndex(index=31.12): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0118 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0119
     * @tc.name      CitySearch_LetterAtIndex_0119
     * @tc.desc      letterAtIndex(index=144) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0119 begin`);
      const actual: string = letterAtIndex(144);
      logInfo(`letterAtIndex(index=144): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0119 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0120
     * @tc.name      CitySearch_LetterAtIndex_0120
     * @tc.desc      letterAtIndex(index=99) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0120 begin`);
      const actual: string = letterAtIndex(99);
      logInfo(`letterAtIndex(index=99): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0120 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0121
     * @tc.name      CitySearch_LetterAtIndex_0121
     * @tc.desc      letterAtIndex(index=128) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0121 begin`);
      const actual: string = letterAtIndex(128);
      logInfo(`letterAtIndex(index=128): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0121 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0122
     * @tc.name      CitySearch_LetterAtIndex_0122
     * @tc.desc      letterAtIndex(index=92) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0122 begin`);
      const actual: string = letterAtIndex(92);
      logInfo(`letterAtIndex(index=92): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0122 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0123
     * @tc.name      CitySearch_LetterAtIndex_0123
     * @tc.desc      letterAtIndex(index=68.56) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0123 begin`);
      const actual: string = letterAtIndex(68.56);
      logInfo(`letterAtIndex(index=68.56): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0123 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0124
     * @tc.name      CitySearch_LetterAtIndex_0124
     * @tc.desc      letterAtIndex(index=30.65) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0124 begin`);
      const actual: string = letterAtIndex(30.65);
      logInfo(`letterAtIndex(index=30.65): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0124 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0125
     * @tc.name      CitySearch_LetterAtIndex_0125
     * @tc.desc      letterAtIndex(index=47) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0125 begin`);
      const actual: string = letterAtIndex(47);
      logInfo(`letterAtIndex(index=47): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0125 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0126
     * @tc.name      CitySearch_LetterAtIndex_0126
     * @tc.desc      letterAtIndex(index=-50) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_LetterAtIndex_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0126 begin`);
      const actual: string = letterAtIndex(-50);
      logInfo(`letterAtIndex(index=-50): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0126 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0127
     * @tc.name      CitySearch_LetterAtIndex_0127
     * @tc.desc      letterAtIndex(index=31.67) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0127 begin`);
      const actual: string = letterAtIndex(31.67);
      logInfo(`letterAtIndex(index=31.67): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0127 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0128
     * @tc.name      CitySearch_LetterAtIndex_0128
     * @tc.desc      letterAtIndex(index=6.9) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0128 begin`);
      const actual: string = letterAtIndex(6.9);
      logInfo(`letterAtIndex(index=6.9): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0128 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0129
     * @tc.name      CitySearch_LetterAtIndex_0129
     * @tc.desc      letterAtIndex(index=63) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0129 begin`);
      const actual: string = letterAtIndex(63);
      logInfo(`letterAtIndex(index=63): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0129 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0130
     * @tc.name      CitySearch_LetterAtIndex_0130
     * @tc.desc      letterAtIndex(index=73.03) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0130 begin`);
      const actual: string = letterAtIndex(73.03);
      logInfo(`letterAtIndex(index=73.03): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0130 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0131
     * @tc.name      CitySearch_LetterAtIndex_0131
     * @tc.desc      letterAtIndex(index=-22) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_LetterAtIndex_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0131 begin`);
      const actual: string = letterAtIndex(-22);
      logInfo(`letterAtIndex(index=-22): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0131 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0132
     * @tc.name      CitySearch_LetterAtIndex_0132
     * @tc.desc      letterAtIndex(index=18) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0132 begin`);
      const actual: string = letterAtIndex(18);
      logInfo(`letterAtIndex(index=18): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0132 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0133
     * @tc.name      CitySearch_LetterAtIndex_0133
     * @tc.desc      letterAtIndex(index=42) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0133 begin`);
      const actual: string = letterAtIndex(42);
      logInfo(`letterAtIndex(index=42): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0133 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0134
     * @tc.name      CitySearch_LetterAtIndex_0134
     * @tc.desc      letterAtIndex(index=55.04) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0134 begin`);
      const actual: string = letterAtIndex(55.04);
      logInfo(`letterAtIndex(index=55.04): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0134 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0135
     * @tc.name      CitySearch_LetterAtIndex_0135
     * @tc.desc      letterAtIndex(index=71) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0135 begin`);
      const actual: string = letterAtIndex(71);
      logInfo(`letterAtIndex(index=71): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0135 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0136
     * @tc.name      CitySearch_LetterAtIndex_0136
     * @tc.desc      letterAtIndex(index=94.76) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0136 begin`);
      const actual: string = letterAtIndex(94.76);
      logInfo(`letterAtIndex(index=94.76): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0136 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0137
     * @tc.name      CitySearch_LetterAtIndex_0137
     * @tc.desc      letterAtIndex(index=54.48) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0137 begin`);
      const actual: string = letterAtIndex(54.48);
      logInfo(`letterAtIndex(index=54.48): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0137 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0138
     * @tc.name      CitySearch_LetterAtIndex_0138
     * @tc.desc      letterAtIndex(index=33.59) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0138 begin`);
      const actual: string = letterAtIndex(33.59);
      logInfo(`letterAtIndex(index=33.59): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0138 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0139
     * @tc.name      CitySearch_LetterAtIndex_0139
     * @tc.desc      letterAtIndex(index=116) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0139 begin`);
      const actual: string = letterAtIndex(116);
      logInfo(`letterAtIndex(index=116): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0139 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0140
     * @tc.name      CitySearch_LetterAtIndex_0140
     * @tc.desc      letterAtIndex(index=38.68) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0140 begin`);
      const actual: string = letterAtIndex(38.68);
      logInfo(`letterAtIndex(index=38.68): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0140 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0141
     * @tc.name      CitySearch_LetterAtIndex_0141
     * @tc.desc      letterAtIndex(index=143) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0141 begin`);
      const actual: string = letterAtIndex(143);
      logInfo(`letterAtIndex(index=143): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0141 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0142
     * @tc.name      CitySearch_LetterAtIndex_0142
     * @tc.desc      letterAtIndex(index=41.52) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0142 begin`);
      const actual: string = letterAtIndex(41.52);
      logInfo(`letterAtIndex(index=41.52): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0142 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0143
     * @tc.name      CitySearch_LetterAtIndex_0143
     * @tc.desc      letterAtIndex(index=7.8) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0143 begin`);
      const actual: string = letterAtIndex(7.8);
      logInfo(`letterAtIndex(index=7.8): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0143 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0144
     * @tc.name      CitySearch_LetterAtIndex_0144
     * @tc.desc      letterAtIndex(index=17) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0144 begin`);
      const actual: string = letterAtIndex(17);
      logInfo(`letterAtIndex(index=17): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0144 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0145
     * @tc.name      CitySearch_LetterAtIndex_0145
     * @tc.desc      letterAtIndex(index=59) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0145 begin`);
      const actual: string = letterAtIndex(59);
      logInfo(`letterAtIndex(index=59): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0145 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0146
     * @tc.name      CitySearch_LetterAtIndex_0146
     * @tc.desc      letterAtIndex(index=-55) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_LetterAtIndex_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0146 begin`);
      const actual: string = letterAtIndex(-55);
      logInfo(`letterAtIndex(index=-55): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0146 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0147
     * @tc.name      CitySearch_LetterAtIndex_0147
     * @tc.desc      letterAtIndex(index=112) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0147 begin`);
      const actual: string = letterAtIndex(112);
      logInfo(`letterAtIndex(index=112): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0147 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0148
     * @tc.name      CitySearch_LetterAtIndex_0148
     * @tc.desc      letterAtIndex(index=59.59) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0148 begin`);
      const actual: string = letterAtIndex(59.59);
      logInfo(`letterAtIndex(index=59.59): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0148 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0149
     * @tc.name      CitySearch_LetterAtIndex_0149
     * @tc.desc      letterAtIndex(index=5.33) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0149 begin`);
      const actual: string = letterAtIndex(5.33);
      logInfo(`letterAtIndex(index=5.33): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0149 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0150
     * @tc.name      CitySearch_LetterAtIndex_0150
     * @tc.desc      letterAtIndex(index=-84) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_LetterAtIndex_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0150 begin`);
      const actual: string = letterAtIndex(-84);
      logInfo(`letterAtIndex(index=-84): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0150 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0151
     * @tc.name      CitySearch_LetterAtIndex_0151
     * @tc.desc      letterAtIndex(index=-98) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_LetterAtIndex_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0151 begin`);
      const actual: string = letterAtIndex(-98);
      logInfo(`letterAtIndex(index=-98): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0151 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0152
     * @tc.name      CitySearch_LetterAtIndex_0152
     * @tc.desc      letterAtIndex(index=29.11) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0152 begin`);
      const actual: string = letterAtIndex(29.11);
      logInfo(`letterAtIndex(index=29.11): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0152 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0153
     * @tc.name      CitySearch_LetterAtIndex_0153
     * @tc.desc      letterAtIndex(index=18.93) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0153 begin`);
      const actual: string = letterAtIndex(18.93);
      logInfo(`letterAtIndex(index=18.93): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0153 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0154
     * @tc.name      CitySearch_LetterAtIndex_0154
     * @tc.desc      letterAtIndex(index=119) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0154 begin`);
      const actual: string = letterAtIndex(119);
      logInfo(`letterAtIndex(index=119): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0154 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0155
     * @tc.name      CitySearch_LetterAtIndex_0155
     * @tc.desc      letterAtIndex(index=193) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0155 begin`);
      const actual: string = letterAtIndex(193);
      logInfo(`letterAtIndex(index=193): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0155 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0156
     * @tc.name      CitySearch_LetterAtIndex_0156
     * @tc.desc      letterAtIndex(index=42.96) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0156 begin`);
      const actual: string = letterAtIndex(42.96);
      logInfo(`letterAtIndex(index=42.96): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0156 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0157
     * @tc.name      CitySearch_LetterAtIndex_0157
     * @tc.desc      letterAtIndex(index=-31) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_LetterAtIndex_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0157 begin`);
      const actual: string = letterAtIndex(-31);
      logInfo(`letterAtIndex(index=-31): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0157 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0158
     * @tc.name      CitySearch_LetterAtIndex_0158
     * @tc.desc      letterAtIndex(index=44.66) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0158 begin`);
      const actual: string = letterAtIndex(44.66);
      logInfo(`letterAtIndex(index=44.66): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0158 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0159
     * @tc.name      CitySearch_LetterAtIndex_0159
     * @tc.desc      letterAtIndex(index=84.38) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0159 begin`);
      const actual: string = letterAtIndex(84.38);
      logInfo(`letterAtIndex(index=84.38): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0159 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0160
     * @tc.name      CitySearch_LetterAtIndex_0160
     * @tc.desc      letterAtIndex(index=-3) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_LetterAtIndex_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0160 begin`);
      const actual: string = letterAtIndex(-3);
      logInfo(`letterAtIndex(index=-3): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0160 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0161
     * @tc.name      CitySearch_LetterAtIndex_0161
     * @tc.desc      letterAtIndex(index=-11) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_LetterAtIndex_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0161 begin`);
      const actual: string = letterAtIndex(-11);
      logInfo(`letterAtIndex(index=-11): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0161 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0162
     * @tc.name      CitySearch_LetterAtIndex_0162
     * @tc.desc      letterAtIndex(index=174) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0162 begin`);
      const actual: string = letterAtIndex(174);
      logInfo(`letterAtIndex(index=174): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0162 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0163
     * @tc.name      CitySearch_LetterAtIndex_0163
     * @tc.desc      letterAtIndex(index=-85) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_LetterAtIndex_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0163 begin`);
      const actual: string = letterAtIndex(-85);
      logInfo(`letterAtIndex(index=-85): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0163 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0164
     * @tc.name      CitySearch_LetterAtIndex_0164
     * @tc.desc      letterAtIndex(index=44) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0164 begin`);
      const actual: string = letterAtIndex(44);
      logInfo(`letterAtIndex(index=44): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0164 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0165
     * @tc.name      CitySearch_LetterAtIndex_0165
     * @tc.desc      letterAtIndex(index=68) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0165 begin`);
      const actual: string = letterAtIndex(68);
      logInfo(`letterAtIndex(index=68): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0165 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0166
     * @tc.name      CitySearch_LetterAtIndex_0166
     * @tc.desc      letterAtIndex(index=149) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0166 begin`);
      const actual: string = letterAtIndex(149);
      logInfo(`letterAtIndex(index=149): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0166 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0167
     * @tc.name      CitySearch_LetterAtIndex_0167
     * @tc.desc      letterAtIndex(index=1.98) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0167 begin`);
      const actual: string = letterAtIndex(1.98);
      logInfo(`letterAtIndex(index=1.98): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0167 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0168
     * @tc.name      CitySearch_LetterAtIndex_0168
     * @tc.desc      letterAtIndex(index=35.88) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0168 begin`);
      const actual: string = letterAtIndex(35.88);
      logInfo(`letterAtIndex(index=35.88): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0168 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0169
     * @tc.name      CitySearch_LetterAtIndex_0169
     * @tc.desc      letterAtIndex(index=126) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0169 begin`);
      const actual: string = letterAtIndex(126);
      logInfo(`letterAtIndex(index=126): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0169 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0170
     * @tc.name      CitySearch_LetterAtIndex_0170
     * @tc.desc      letterAtIndex(index=98) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0170 begin`);
      const actual: string = letterAtIndex(98);
      logInfo(`letterAtIndex(index=98): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0170 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0171
     * @tc.name      CitySearch_LetterAtIndex_0171
     * @tc.desc      letterAtIndex(index=36) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0171 begin`);
      const actual: string = letterAtIndex(36);
      logInfo(`letterAtIndex(index=36): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0171 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0172
     * @tc.name      CitySearch_LetterAtIndex_0172
     * @tc.desc      letterAtIndex(index=159) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0172 begin`);
      const actual: string = letterAtIndex(159);
      logInfo(`letterAtIndex(index=159): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0172 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0173
     * @tc.name      CitySearch_LetterAtIndex_0173
     * @tc.desc      letterAtIndex(index=14.66) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0173 begin`);
      const actual: string = letterAtIndex(14.66);
      logInfo(`letterAtIndex(index=14.66): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0173 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0174
     * @tc.name      CitySearch_LetterAtIndex_0174
     * @tc.desc      letterAtIndex(index=44.08) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0174 begin`);
      const actual: string = letterAtIndex(44.08);
      logInfo(`letterAtIndex(index=44.08): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0174 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0175
     * @tc.name      CitySearch_LetterAtIndex_0175
     * @tc.desc      letterAtIndex(index=158) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0175 begin`);
      const actual: string = letterAtIndex(158);
      logInfo(`letterAtIndex(index=158): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0175 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0176
     * @tc.name      CitySearch_LetterAtIndex_0176
     * @tc.desc      letterAtIndex(index=0.85) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0176 begin`);
      const actual: string = letterAtIndex(0.85);
      logInfo(`letterAtIndex(index=0.85): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0176 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0177
     * @tc.name      CitySearch_LetterAtIndex_0177
     * @tc.desc      letterAtIndex(index=54.76) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0177 begin`);
      const actual: string = letterAtIndex(54.76);
      logInfo(`letterAtIndex(index=54.76): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0177 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0178
     * @tc.name      CitySearch_LetterAtIndex_0178
     * @tc.desc      letterAtIndex(index=-48) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_LetterAtIndex_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0178 begin`);
      const actual: string = letterAtIndex(-48);
      logInfo(`letterAtIndex(index=-48): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0178 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0179
     * @tc.name      CitySearch_LetterAtIndex_0179
     * @tc.desc      letterAtIndex(index=107) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0179 begin`);
      const actual: string = letterAtIndex(107);
      logInfo(`letterAtIndex(index=107): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0179 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0180
     * @tc.name      CitySearch_LetterAtIndex_0180
     * @tc.desc      letterAtIndex(index=60.21) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0180 begin`);
      const actual: string = letterAtIndex(60.21);
      logInfo(`letterAtIndex(index=60.21): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0180 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0181
     * @tc.name      CitySearch_LetterAtIndex_0181
     * @tc.desc      letterAtIndex(index=58.11) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0181 begin`);
      const actual: string = letterAtIndex(58.11);
      logInfo(`letterAtIndex(index=58.11): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0181 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0182
     * @tc.name      CitySearch_LetterAtIndex_0182
     * @tc.desc      letterAtIndex(index=104) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0182 begin`);
      const actual: string = letterAtIndex(104);
      logInfo(`letterAtIndex(index=104): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0182 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0183
     * @tc.name      CitySearch_LetterAtIndex_0183
     * @tc.desc      letterAtIndex(index=33) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0183 begin`);
      const actual: string = letterAtIndex(33);
      logInfo(`letterAtIndex(index=33): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0183 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0184
     * @tc.name      CitySearch_LetterAtIndex_0184
     * @tc.desc      letterAtIndex(index=-51) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_LetterAtIndex_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0184 begin`);
      const actual: string = letterAtIndex(-51);
      logInfo(`letterAtIndex(index=-51): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0184 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0185
     * @tc.name      CitySearch_LetterAtIndex_0185
     * @tc.desc      letterAtIndex(index=124) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0185 begin`);
      const actual: string = letterAtIndex(124);
      logInfo(`letterAtIndex(index=124): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0185 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0186
     * @tc.name      CitySearch_LetterAtIndex_0186
     * @tc.desc      letterAtIndex(index=0.23) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0186 begin`);
      const actual: string = letterAtIndex(0.23);
      logInfo(`letterAtIndex(index=0.23): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0186 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0187
     * @tc.name      CitySearch_LetterAtIndex_0187
     * @tc.desc      letterAtIndex(index=169) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0187 begin`);
      const actual: string = letterAtIndex(169);
      logInfo(`letterAtIndex(index=169): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0187 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0188
     * @tc.name      CitySearch_LetterAtIndex_0188
     * @tc.desc      letterAtIndex(index=25.88) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0188 begin`);
      const actual: string = letterAtIndex(25.88);
      logInfo(`letterAtIndex(index=25.88): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0188 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0189
     * @tc.name      CitySearch_LetterAtIndex_0189
     * @tc.desc      letterAtIndex(index=-72) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_LetterAtIndex_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0189 begin`);
      const actual: string = letterAtIndex(-72);
      logInfo(`letterAtIndex(index=-72): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0189 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0190
     * @tc.name      CitySearch_LetterAtIndex_0190
     * @tc.desc      letterAtIndex(index=78.67) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0190 begin`);
      const actual: string = letterAtIndex(78.67);
      logInfo(`letterAtIndex(index=78.67): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0190 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0191
     * @tc.name      CitySearch_LetterAtIndex_0191
     * @tc.desc      letterAtIndex(index=46) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0191 begin`);
      const actual: string = letterAtIndex(46);
      logInfo(`letterAtIndex(index=46): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0191 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0192
     * @tc.name      CitySearch_LetterAtIndex_0192
     * @tc.desc      letterAtIndex(index=97.54) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0192 begin`);
      const actual: string = letterAtIndex(97.54);
      logInfo(`letterAtIndex(index=97.54): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0192 end`);
    });
  });
}
