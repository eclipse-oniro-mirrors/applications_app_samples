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

/** Logic checks for matchedLetterIndexOf (54 cases). */
export default function matchedLetterIndexOf2Test(): void {
  describe('MatchedLetterIndexOf2Test', () => {
    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0097
     * @tc.name      CitySearch_MatchedLetterIndexOf_0097
     * @tc.desc      matchedLetterIndexOf(value="b11E3VbZ") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0097 begin`);
      const actual: number = matchedLetterIndexOf('b11E3VbZ');
      logInfo(`matchedLetterIndexOf(value="b11E3VbZ"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0097 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0098
     * @tc.name      CitySearch_MatchedLetterIndexOf_0098
     * @tc.desc      matchedLetterIndexOf(value="Te11v") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0098 begin`);
      const actual: number = matchedLetterIndexOf('Te11v');
      logInfo(`matchedLetterIndexOf(value="Te11v"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0098 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0099
     * @tc.name      CitySearch_MatchedLetterIndexOf_0099
     * @tc.desc      matchedLetterIndexOf(value="5akLBSx8f") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0099 begin`);
      const actual: number = matchedLetterIndexOf('5akLBSx8f');
      logInfo(`matchedLetterIndexOf(value="5akLBSx8f"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0099 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0100
     * @tc.name      CitySearch_MatchedLetterIndexOf_0100
     * @tc.desc      matchedLetterIndexOf(value="ny9C7nVMjgjU") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0100 begin`);
      const actual: number = matchedLetterIndexOf('ny9C7nVMjgjU');
      logInfo(`matchedLetterIndexOf(value="ny9C7nVMjgjU"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0100 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0101
     * @tc.name      CitySearch_MatchedLetterIndexOf_0101
     * @tc.desc      matchedLetterIndexOf(value="v8SW9SNxRP") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0101 begin`);
      const actual: number = matchedLetterIndexOf('v8SW9SNxRP');
      logInfo(`matchedLetterIndexOf(value="v8SW9SNxRP"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0101 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0102
     * @tc.name      CitySearch_MatchedLetterIndexOf_0102
     * @tc.desc      matchedLetterIndexOf(value="sZsliiuWMmG") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0102 begin`);
      const actual: number = matchedLetterIndexOf('sZsliiuWMmG');
      logInfo(`matchedLetterIndexOf(value="sZsliiuWMmG"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0102 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0103
     * @tc.name      CitySearch_MatchedLetterIndexOf_0103
     * @tc.desc      matchedLetterIndexOf(value="fcIeLD") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0103 begin`);
      const actual: number = matchedLetterIndexOf('fcIeLD');
      logInfo(`matchedLetterIndexOf(value="fcIeLD"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0103 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0104
     * @tc.name      CitySearch_MatchedLetterIndexOf_0104
     * @tc.desc      matchedLetterIndexOf(value="BjuGf2u") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0104 begin`);
      const actual: number = matchedLetterIndexOf('BjuGf2u');
      logInfo(`matchedLetterIndexOf(value="BjuGf2u"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0104 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0105
     * @tc.name      CitySearch_MatchedLetterIndexOf_0105
     * @tc.desc      matchedLetterIndexOf(value="kja") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0105 begin`);
      const actual: number = matchedLetterIndexOf('kja');
      logInfo(`matchedLetterIndexOf(value="kja"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0105 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0106
     * @tc.name      CitySearch_MatchedLetterIndexOf_0106
     * @tc.desc      matchedLetterIndexOf(value="CWoi") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0106 begin`);
      const actual: number = matchedLetterIndexOf('CWoi');
      logInfo(`matchedLetterIndexOf(value="CWoi"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0106 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0107
     * @tc.name      CitySearch_MatchedLetterIndexOf_0107
     * @tc.desc      matchedLetterIndexOf(value="jdBMmVSet8Wy") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0107 begin`);
      const actual: number = matchedLetterIndexOf('jdBMmVSet8Wy');
      logInfo(`matchedLetterIndexOf(value="jdBMmVSet8Wy"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0107 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0108
     * @tc.name      CitySearch_MatchedLetterIndexOf_0108
     * @tc.desc      matchedLetterIndexOf(value="Ik") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0108 begin`);
      const actual: number = matchedLetterIndexOf('Ik');
      logInfo(`matchedLetterIndexOf(value="Ik"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0108 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0109
     * @tc.name      CitySearch_MatchedLetterIndexOf_0109
     * @tc.desc      matchedLetterIndexOf(value="VeTzC") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0109 begin`);
      const actual: number = matchedLetterIndexOf('VeTzC');
      logInfo(`matchedLetterIndexOf(value="VeTzC"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0109 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0110
     * @tc.name      CitySearch_MatchedLetterIndexOf_0110
     * @tc.desc      matchedLetterIndexOf(value="Knxi") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0110 begin`);
      const actual: number = matchedLetterIndexOf('Knxi');
      logInfo(`matchedLetterIndexOf(value="Knxi"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0110 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0111
     * @tc.name      CitySearch_MatchedLetterIndexOf_0111
     * @tc.desc      matchedLetterIndexOf(value="IDS1T") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0111 begin`);
      const actual: number = matchedLetterIndexOf('IDS1T');
      logInfo(`matchedLetterIndexOf(value="IDS1T"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0111 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0112
     * @tc.name      CitySearch_MatchedLetterIndexOf_0112
     * @tc.desc      matchedLetterIndexOf(value="EHqVThxif") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0112 begin`);
      const actual: number = matchedLetterIndexOf('EHqVThxif');
      logInfo(`matchedLetterIndexOf(value="EHqVThxif"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0112 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0113
     * @tc.name      CitySearch_MatchedLetterIndexOf_0113
     * @tc.desc      matchedLetterIndexOf(value="332xXye7Wvy") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0113 begin`);
      const actual: number = matchedLetterIndexOf('332xXye7Wvy');
      logInfo(`matchedLetterIndexOf(value="332xXye7Wvy"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0113 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0114
     * @tc.name      CitySearch_MatchedLetterIndexOf_0114
     * @tc.desc      matchedLetterIndexOf(value="s8Qk") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0114 begin`);
      const actual: number = matchedLetterIndexOf('s8Qk');
      logInfo(`matchedLetterIndexOf(value="s8Qk"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0114 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0115
     * @tc.name      CitySearch_MatchedLetterIndexOf_0115
     * @tc.desc      matchedLetterIndexOf(value="D") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0115 begin`);
      const actual: number = matchedLetterIndexOf('D');
      logInfo(`matchedLetterIndexOf(value="D"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0115 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0116
     * @tc.name      CitySearch_MatchedLetterIndexOf_0116
     * @tc.desc      matchedLetterIndexOf(value="edyhHHq0r0W") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0116 begin`);
      const actual: number = matchedLetterIndexOf('edyhHHq0r0W');
      logInfo(`matchedLetterIndexOf(value="edyhHHq0r0W"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0116 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0117
     * @tc.name      CitySearch_MatchedLetterIndexOf_0117
     * @tc.desc      matchedLetterIndexOf(value="vAOrALHjk") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0117 begin`);
      const actual: number = matchedLetterIndexOf('vAOrALHjk');
      logInfo(`matchedLetterIndexOf(value="vAOrALHjk"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0117 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0118
     * @tc.name      CitySearch_MatchedLetterIndexOf_0118
     * @tc.desc      matchedLetterIndexOf(value="fc") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0118 begin`);
      const actual: number = matchedLetterIndexOf('fc');
      logInfo(`matchedLetterIndexOf(value="fc"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0118 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0119
     * @tc.name      CitySearch_MatchedLetterIndexOf_0119
     * @tc.desc      matchedLetterIndexOf(value="WE") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0119 begin`);
      const actual: number = matchedLetterIndexOf('WE');
      logInfo(`matchedLetterIndexOf(value="WE"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0119 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0120
     * @tc.name      CitySearch_MatchedLetterIndexOf_0120
     * @tc.desc      matchedLetterIndexOf(value="mnK") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0120 begin`);
      const actual: number = matchedLetterIndexOf('mnK');
      logInfo(`matchedLetterIndexOf(value="mnK"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0120 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0121
     * @tc.name      CitySearch_MatchedLetterIndexOf_0121
     * @tc.desc      matchedLetterIndexOf(value="Jc89i3vpO") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0121 begin`);
      const actual: number = matchedLetterIndexOf('Jc89i3vpO');
      logInfo(`matchedLetterIndexOf(value="Jc89i3vpO"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0121 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0122
     * @tc.name      CitySearch_MatchedLetterIndexOf_0122
     * @tc.desc      matchedLetterIndexOf(value="TI2LQk") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0122 begin`);
      const actual: number = matchedLetterIndexOf('TI2LQk');
      logInfo(`matchedLetterIndexOf(value="TI2LQk"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0122 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0123
     * @tc.name      CitySearch_MatchedLetterIndexOf_0123
     * @tc.desc      matchedLetterIndexOf(value="p") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0123 begin`);
      const actual: number = matchedLetterIndexOf('p');
      logInfo(`matchedLetterIndexOf(value="p"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0123 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0124
     * @tc.name      CitySearch_MatchedLetterIndexOf_0124
     * @tc.desc      matchedLetterIndexOf(value="dDlX") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0124 begin`);
      const actual: number = matchedLetterIndexOf('dDlX');
      logInfo(`matchedLetterIndexOf(value="dDlX"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0124 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0125
     * @tc.name      CitySearch_MatchedLetterIndexOf_0125
     * @tc.desc      matchedLetterIndexOf(value="7") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0125 begin`);
      const actual: number = matchedLetterIndexOf('7');
      logInfo(`matchedLetterIndexOf(value="7"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0125 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0126
     * @tc.name      CitySearch_MatchedLetterIndexOf_0126
     * @tc.desc      matchedLetterIndexOf(value="lsQZNv9ti3B") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0126 begin`);
      const actual: number = matchedLetterIndexOf('lsQZNv9ti3B');
      logInfo(`matchedLetterIndexOf(value="lsQZNv9ti3B"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0126 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0127
     * @tc.name      CitySearch_MatchedLetterIndexOf_0127
     * @tc.desc      matchedLetterIndexOf(value="k0zWvbuev") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0127 begin`);
      const actual: number = matchedLetterIndexOf('k0zWvbuev');
      logInfo(`matchedLetterIndexOf(value="k0zWvbuev"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0127 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0128
     * @tc.name      CitySearch_MatchedLetterIndexOf_0128
     * @tc.desc      matchedLetterIndexOf(value="9qd5DjJ") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0128 begin`);
      const actual: number = matchedLetterIndexOf('9qd5DjJ');
      logInfo(`matchedLetterIndexOf(value="9qd5DjJ"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0128 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0129
     * @tc.name      CitySearch_MatchedLetterIndexOf_0129
     * @tc.desc      matchedLetterIndexOf(value="0") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0129 begin`);
      const actual: number = matchedLetterIndexOf('0');
      logInfo(`matchedLetterIndexOf(value="0"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0129 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0130
     * @tc.name      CitySearch_MatchedLetterIndexOf_0130
     * @tc.desc      matchedLetterIndexOf(value="tQtRTihR9") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0130 begin`);
      const actual: number = matchedLetterIndexOf('tQtRTihR9');
      logInfo(`matchedLetterIndexOf(value="tQtRTihR9"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0130 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0131
     * @tc.name      CitySearch_MatchedLetterIndexOf_0131
     * @tc.desc      matchedLetterIndexOf(value="efAKqY1") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0131 begin`);
      const actual: number = matchedLetterIndexOf('efAKqY1');
      logInfo(`matchedLetterIndexOf(value="efAKqY1"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0131 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0132
     * @tc.name      CitySearch_MatchedLetterIndexOf_0132
     * @tc.desc      matchedLetterIndexOf(value="9ere") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0132 begin`);
      const actual: number = matchedLetterIndexOf('9ere');
      logInfo(`matchedLetterIndexOf(value="9ere"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0132 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0133
     * @tc.name      CitySearch_MatchedLetterIndexOf_0133
     * @tc.desc      matchedLetterIndexOf(value="aeJEzDWjvos") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0133 begin`);
      const actual: number = matchedLetterIndexOf('aeJEzDWjvos');
      logInfo(`matchedLetterIndexOf(value="aeJEzDWjvos"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0133 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0134
     * @tc.name      CitySearch_MatchedLetterIndexOf_0134
     * @tc.desc      matchedLetterIndexOf(value="5UUfE") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0134 begin`);
      const actual: number = matchedLetterIndexOf('5UUfE');
      logInfo(`matchedLetterIndexOf(value="5UUfE"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0134 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0135
     * @tc.name      CitySearch_MatchedLetterIndexOf_0135
     * @tc.desc      matchedLetterIndexOf(value="1dBF") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0135 begin`);
      const actual: number = matchedLetterIndexOf('1dBF');
      logInfo(`matchedLetterIndexOf(value="1dBF"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0135 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0136
     * @tc.name      CitySearch_MatchedLetterIndexOf_0136
     * @tc.desc      matchedLetterIndexOf(value="ecN") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0136 begin`);
      const actual: number = matchedLetterIndexOf('ecN');
      logInfo(`matchedLetterIndexOf(value="ecN"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0136 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0137
     * @tc.name      CitySearch_MatchedLetterIndexOf_0137
     * @tc.desc      matchedLetterIndexOf(value="Kllcf") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0137 begin`);
      const actual: number = matchedLetterIndexOf('Kllcf');
      logInfo(`matchedLetterIndexOf(value="Kllcf"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0137 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0138
     * @tc.name      CitySearch_MatchedLetterIndexOf_0138
     * @tc.desc      matchedLetterIndexOf(value="1OKmJbtg") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0138 begin`);
      const actual: number = matchedLetterIndexOf('1OKmJbtg');
      logInfo(`matchedLetterIndexOf(value="1OKmJbtg"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0138 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0139
     * @tc.name      CitySearch_MatchedLetterIndexOf_0139
     * @tc.desc      matchedLetterIndexOf(value="71cN9LYX") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0139 begin`);
      const actual: number = matchedLetterIndexOf('71cN9LYX');
      logInfo(`matchedLetterIndexOf(value="71cN9LYX"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0139 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0140
     * @tc.name      CitySearch_MatchedLetterIndexOf_0140
     * @tc.desc      matchedLetterIndexOf(value="70") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0140 begin`);
      const actual: number = matchedLetterIndexOf('70');
      logInfo(`matchedLetterIndexOf(value="70"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0140 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0141
     * @tc.name      CitySearch_MatchedLetterIndexOf_0141
     * @tc.desc      matchedLetterIndexOf(value="8veNSJ") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0141 begin`);
      const actual: number = matchedLetterIndexOf('8veNSJ');
      logInfo(`matchedLetterIndexOf(value="8veNSJ"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0141 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0142
     * @tc.name      CitySearch_MatchedLetterIndexOf_0142
     * @tc.desc      matchedLetterIndexOf(value="9FKmjiIOlk1c") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0142 begin`);
      const actual: number = matchedLetterIndexOf('9FKmjiIOlk1c');
      logInfo(`matchedLetterIndexOf(value="9FKmjiIOlk1c"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0142 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0143
     * @tc.name      CitySearch_MatchedLetterIndexOf_0143
     * @tc.desc      matchedLetterIndexOf(value="iQ2j4N2I2AvY") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0143 begin`);
      const actual: number = matchedLetterIndexOf('iQ2j4N2I2AvY');
      logInfo(`matchedLetterIndexOf(value="iQ2j4N2I2AvY"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0143 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0144
     * @tc.name      CitySearch_MatchedLetterIndexOf_0144
     * @tc.desc      matchedLetterIndexOf(value="KoFYBN") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0144 begin`);
      const actual: number = matchedLetterIndexOf('KoFYBN');
      logInfo(`matchedLetterIndexOf(value="KoFYBN"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0144 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0145
     * @tc.name      CitySearch_MatchedLetterIndexOf_0145
     * @tc.desc      matchedLetterIndexOf(value="pnYys8GlpEE") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0145 begin`);
      const actual: number = matchedLetterIndexOf('pnYys8GlpEE');
      logInfo(`matchedLetterIndexOf(value="pnYys8GlpEE"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0145 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0146
     * @tc.name      CitySearch_MatchedLetterIndexOf_0146
     * @tc.desc      matchedLetterIndexOf(value="2E9") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0146 begin`);
      const actual: number = matchedLetterIndexOf('2E9');
      logInfo(`matchedLetterIndexOf(value="2E9"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0146 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0147
     * @tc.name      CitySearch_MatchedLetterIndexOf_0147
     * @tc.desc      matchedLetterIndexOf(value="wN011") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0147 begin`);
      const actual: number = matchedLetterIndexOf('wN011');
      logInfo(`matchedLetterIndexOf(value="wN011"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0147 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0148
     * @tc.name      CitySearch_MatchedLetterIndexOf_0148
     * @tc.desc      matchedLetterIndexOf(value="Xfby3") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0148 begin`);
      const actual: number = matchedLetterIndexOf('Xfby3');
      logInfo(`matchedLetterIndexOf(value="Xfby3"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0148 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0149
     * @tc.name      CitySearch_MatchedLetterIndexOf_0149
     * @tc.desc      matchedLetterIndexOf(value="Y7") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0149 begin`);
      const actual: number = matchedLetterIndexOf('Y7');
      logInfo(`matchedLetterIndexOf(value="Y7"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0149 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_MATCHED_LETTER_INDEX_OF_0150
     * @tc.name      CitySearch_MatchedLetterIndexOf_0150
     * @tc.desc      matchedLetterIndexOf(value="zM8ywC") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_MatchedLetterIndexOf_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0150 begin`);
      const actual: number = matchedLetterIndexOf('zM8ywC');
      logInfo(`matchedLetterIndexOf(value="zM8ywC"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MatchedLetterIndexOf_0150 end`);
    });
  });
}
