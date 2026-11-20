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

/** Logic checks for groupIndexOfLetter (29 cases). */
export default function groupIndexOfLetter2Test(): void {
  describe('GroupIndexOfLetter2Test', () => {
    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0097
     * @tc.name      CitySearch_GroupIndexOfLetter_0097
     * @tc.desc      groupIndexOfLetter(letter="LJkCmBnl") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0097 begin`);
      const actual: number = groupIndexOfLetter('LJkCmBnl');
      logInfo(`groupIndexOfLetter(letter="LJkCmBnl"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0097 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0098
     * @tc.name      CitySearch_GroupIndexOfLetter_0098
     * @tc.desc      groupIndexOfLetter(letter="0z") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0098 begin`);
      const actual: number = groupIndexOfLetter('0z');
      logInfo(`groupIndexOfLetter(letter="0z"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0098 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0099
     * @tc.name      CitySearch_GroupIndexOfLetter_0099
     * @tc.desc      groupIndexOfLetter(letter="eWkBWZ") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0099 begin`);
      const actual: number = groupIndexOfLetter('eWkBWZ');
      logInfo(`groupIndexOfLetter(letter="eWkBWZ"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0099 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0100
     * @tc.name      CitySearch_GroupIndexOfLetter_0100
     * @tc.desc      groupIndexOfLetter(letter="7OdzboNq") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0100 begin`);
      const actual: number = groupIndexOfLetter('7OdzboNq');
      logInfo(`groupIndexOfLetter(letter="7OdzboNq"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0100 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0101
     * @tc.name      CitySearch_GroupIndexOfLetter_0101
     * @tc.desc      groupIndexOfLetter(letter="F3VXreHO") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0101 begin`);
      const actual: number = groupIndexOfLetter('F3VXreHO');
      logInfo(`groupIndexOfLetter(letter="F3VXreHO"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0101 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0102
     * @tc.name      CitySearch_GroupIndexOfLetter_0102
     * @tc.desc      groupIndexOfLetter(letter="ugqp") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0102 begin`);
      const actual: number = groupIndexOfLetter('ugqp');
      logInfo(`groupIndexOfLetter(letter="ugqp"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0102 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0103
     * @tc.name      CitySearch_GroupIndexOfLetter_0103
     * @tc.desc      groupIndexOfLetter(letter="2Evdl7t") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0103 begin`);
      const actual: number = groupIndexOfLetter('2Evdl7t');
      logInfo(`groupIndexOfLetter(letter="2Evdl7t"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0103 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0104
     * @tc.name      CitySearch_GroupIndexOfLetter_0104
     * @tc.desc      groupIndexOfLetter(letter="Mkew") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0104 begin`);
      const actual: number = groupIndexOfLetter('Mkew');
      logInfo(`groupIndexOfLetter(letter="Mkew"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0104 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0105
     * @tc.name      CitySearch_GroupIndexOfLetter_0105
     * @tc.desc      groupIndexOfLetter(letter="YQB3bg") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0105 begin`);
      const actual: number = groupIndexOfLetter('YQB3bg');
      logInfo(`groupIndexOfLetter(letter="YQB3bg"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0105 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0106
     * @tc.name      CitySearch_GroupIndexOfLetter_0106
     * @tc.desc      groupIndexOfLetter(letter="nYK1R") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0106 begin`);
      const actual: number = groupIndexOfLetter('nYK1R');
      logInfo(`groupIndexOfLetter(letter="nYK1R"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0106 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0107
     * @tc.name      CitySearch_GroupIndexOfLetter_0107
     * @tc.desc      groupIndexOfLetter(letter="hw") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0107 begin`);
      const actual: number = groupIndexOfLetter('hw');
      logInfo(`groupIndexOfLetter(letter="hw"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0107 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0108
     * @tc.name      CitySearch_GroupIndexOfLetter_0108
     * @tc.desc      groupIndexOfLetter(letter="JhsTwgN") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0108 begin`);
      const actual: number = groupIndexOfLetter('JhsTwgN');
      logInfo(`groupIndexOfLetter(letter="JhsTwgN"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0108 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0109
     * @tc.name      CitySearch_GroupIndexOfLetter_0109
     * @tc.desc      groupIndexOfLetter(letter="HRahnK3jXIS") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0109 begin`);
      const actual: number = groupIndexOfLetter('HRahnK3jXIS');
      logInfo(`groupIndexOfLetter(letter="HRahnK3jXIS"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0109 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0110
     * @tc.name      CitySearch_GroupIndexOfLetter_0110
     * @tc.desc      groupIndexOfLetter(letter="KTEdiSW") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0110 begin`);
      const actual: number = groupIndexOfLetter('KTEdiSW');
      logInfo(`groupIndexOfLetter(letter="KTEdiSW"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0110 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0111
     * @tc.name      CitySearch_GroupIndexOfLetter_0111
     * @tc.desc      groupIndexOfLetter(letter="XjDTOdai6d") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0111 begin`);
      const actual: number = groupIndexOfLetter('XjDTOdai6d');
      logInfo(`groupIndexOfLetter(letter="XjDTOdai6d"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0111 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0112
     * @tc.name      CitySearch_GroupIndexOfLetter_0112
     * @tc.desc      groupIndexOfLetter(letter="gyIiUSW") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0112 begin`);
      const actual: number = groupIndexOfLetter('gyIiUSW');
      logInfo(`groupIndexOfLetter(letter="gyIiUSW"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0112 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0113
     * @tc.name      CitySearch_GroupIndexOfLetter_0113
     * @tc.desc      groupIndexOfLetter(letter="h8") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0113 begin`);
      const actual: number = groupIndexOfLetter('h8');
      logInfo(`groupIndexOfLetter(letter="h8"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0113 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0114
     * @tc.name      CitySearch_GroupIndexOfLetter_0114
     * @tc.desc      groupIndexOfLetter(letter="GaqpIlYOg5") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0114 begin`);
      const actual: number = groupIndexOfLetter('GaqpIlYOg5');
      logInfo(`groupIndexOfLetter(letter="GaqpIlYOg5"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0114 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0115
     * @tc.name      CitySearch_GroupIndexOfLetter_0115
     * @tc.desc      groupIndexOfLetter(letter="JeIqh2VV0H") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0115 begin`);
      const actual: number = groupIndexOfLetter('JeIqh2VV0H');
      logInfo(`groupIndexOfLetter(letter="JeIqh2VV0H"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0115 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0116
     * @tc.name      CitySearch_GroupIndexOfLetter_0116
     * @tc.desc      groupIndexOfLetter(letter="8b7Hrlk") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0116 begin`);
      const actual: number = groupIndexOfLetter('8b7Hrlk');
      logInfo(`groupIndexOfLetter(letter="8b7Hrlk"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0116 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0117
     * @tc.name      CitySearch_GroupIndexOfLetter_0117
     * @tc.desc      groupIndexOfLetter(letter="h6Dgj4MLI2") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0117 begin`);
      const actual: number = groupIndexOfLetter('h6Dgj4MLI2');
      logInfo(`groupIndexOfLetter(letter="h6Dgj4MLI2"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0117 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0118
     * @tc.name      CitySearch_GroupIndexOfLetter_0118
     * @tc.desc      groupIndexOfLetter(letter="L0RdCe0NNa") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0118 begin`);
      const actual: number = groupIndexOfLetter('L0RdCe0NNa');
      logInfo(`groupIndexOfLetter(letter="L0RdCe0NNa"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0118 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0119
     * @tc.name      CitySearch_GroupIndexOfLetter_0119
     * @tc.desc      groupIndexOfLetter(letter="VACMAgp0EdY") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0119 begin`);
      const actual: number = groupIndexOfLetter('VACMAgp0EdY');
      logInfo(`groupIndexOfLetter(letter="VACMAgp0EdY"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0119 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0120
     * @tc.name      CitySearch_GroupIndexOfLetter_0120
     * @tc.desc      groupIndexOfLetter(letter="cXXF") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0120 begin`);
      const actual: number = groupIndexOfLetter('cXXF');
      logInfo(`groupIndexOfLetter(letter="cXXF"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0120 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0121
     * @tc.name      CitySearch_GroupIndexOfLetter_0121
     * @tc.desc      groupIndexOfLetter(letter="ALcilC63") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0121 begin`);
      const actual: number = groupIndexOfLetter('ALcilC63');
      logInfo(`groupIndexOfLetter(letter="ALcilC63"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0121 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0122
     * @tc.name      CitySearch_GroupIndexOfLetter_0122
     * @tc.desc      groupIndexOfLetter(letter="fppah6") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0122 begin`);
      const actual: number = groupIndexOfLetter('fppah6');
      logInfo(`groupIndexOfLetter(letter="fppah6"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0122 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0123
     * @tc.name      CitySearch_GroupIndexOfLetter_0123
     * @tc.desc      groupIndexOfLetter(letter="GiyW18o2VL") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0123 begin`);
      const actual: number = groupIndexOfLetter('GiyW18o2VL');
      logInfo(`groupIndexOfLetter(letter="GiyW18o2VL"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0123 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0124
     * @tc.name      CitySearch_GroupIndexOfLetter_0124
     * @tc.desc      groupIndexOfLetter(letter="KV") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0124 begin`);
      const actual: number = groupIndexOfLetter('KV');
      logInfo(`groupIndexOfLetter(letter="KV"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0124 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_GROUP_INDEX_OF_LETTER_0125
     * @tc.name      CitySearch_GroupIndexOfLetter_0125
     * @tc.desc      groupIndexOfLetter(letter="HaYizXw") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_GroupIndexOfLetter_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GroupIndexOfLetter_0125 begin`);
      const actual: number = groupIndexOfLetter('HaYizXw');
      logInfo(`groupIndexOfLetter(letter="HaYizXw"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}GroupIndexOfLetter_0125 end`);
    });
  });
}
