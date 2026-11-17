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
import { dimensionTextOf } from '../model/RequestAddFormLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_RequestAddForm]';
const BUNDLE: string = 'RequestAddForm_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for dimensionTextOf (29 cases). */
export default function dimensionTextOf2Test(): void {
  describe('DimensionTextOf2Test', (): void => {
    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0097
     * @tc.name      RequestAddForm_DimensionTextOf_0097
     * @tc.desc      dimensionTextOf(dimension=149) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionTextOf_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0097 begin`);
      const actual: string = dimensionTextOf(149);
      logInfo(`dimensionTextOf(dimension=149): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0097 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0098
     * @tc.name      RequestAddForm_DimensionTextOf_0098
     * @tc.desc      dimensionTextOf(dimension=7.68) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionTextOf_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0098 begin`);
      const actual: string = dimensionTextOf(7.68);
      logInfo(`dimensionTextOf(dimension=7.68): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0098 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0099
     * @tc.name      RequestAddForm_DimensionTextOf_0099
     * @tc.desc      dimensionTextOf(dimension=-3) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DimensionTextOf_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0099 begin`);
      const actual: string = dimensionTextOf(-3);
      logInfo(`dimensionTextOf(dimension=-3): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0099 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0100
     * @tc.name      RequestAddForm_DimensionTextOf_0100
     * @tc.desc      dimensionTextOf(dimension=-41) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DimensionTextOf_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0100 begin`);
      const actual: string = dimensionTextOf(-41);
      logInfo(`dimensionTextOf(dimension=-41): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0100 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0101
     * @tc.name      RequestAddForm_DimensionTextOf_0101
     * @tc.desc      dimensionTextOf(dimension=157) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionTextOf_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0101 begin`);
      const actual: string = dimensionTextOf(157);
      logInfo(`dimensionTextOf(dimension=157): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0101 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0102
     * @tc.name      RequestAddForm_DimensionTextOf_0102
     * @tc.desc      dimensionTextOf(dimension=46) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionTextOf_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0102 begin`);
      const actual: string = dimensionTextOf(46);
      logInfo(`dimensionTextOf(dimension=46): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0102 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0103
     * @tc.name      RequestAddForm_DimensionTextOf_0103
     * @tc.desc      dimensionTextOf(dimension=31.73) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionTextOf_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0103 begin`);
      const actual: string = dimensionTextOf(31.73);
      logInfo(`dimensionTextOf(dimension=31.73): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0103 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0104
     * @tc.name      RequestAddForm_DimensionTextOf_0104
     * @tc.desc      dimensionTextOf(dimension=-19) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DimensionTextOf_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0104 begin`);
      const actual: string = dimensionTextOf(-19);
      logInfo(`dimensionTextOf(dimension=-19): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0104 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0105
     * @tc.name      RequestAddForm_DimensionTextOf_0105
     * @tc.desc      dimensionTextOf(dimension=166) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionTextOf_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0105 begin`);
      const actual: string = dimensionTextOf(166);
      logInfo(`dimensionTextOf(dimension=166): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0105 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0106
     * @tc.name      RequestAddForm_DimensionTextOf_0106
     * @tc.desc      dimensionTextOf(dimension=-60) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DimensionTextOf_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0106 begin`);
      const actual: string = dimensionTextOf(-60);
      logInfo(`dimensionTextOf(dimension=-60): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0106 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0107
     * @tc.name      RequestAddForm_DimensionTextOf_0107
     * @tc.desc      dimensionTextOf(dimension=74.01) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionTextOf_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0107 begin`);
      const actual: string = dimensionTextOf(74.01);
      logInfo(`dimensionTextOf(dimension=74.01): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0107 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0108
     * @tc.name      RequestAddForm_DimensionTextOf_0108
     * @tc.desc      dimensionTextOf(dimension=116) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionTextOf_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0108 begin`);
      const actual: string = dimensionTextOf(116);
      logInfo(`dimensionTextOf(dimension=116): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0108 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0109
     * @tc.name      RequestAddForm_DimensionTextOf_0109
     * @tc.desc      dimensionTextOf(dimension=53) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionTextOf_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0109 begin`);
      const actual: string = dimensionTextOf(53);
      logInfo(`dimensionTextOf(dimension=53): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0109 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0110
     * @tc.name      RequestAddForm_DimensionTextOf_0110
     * @tc.desc      dimensionTextOf(dimension=73) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionTextOf_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0110 begin`);
      const actual: string = dimensionTextOf(73);
      logInfo(`dimensionTextOf(dimension=73): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0110 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0111
     * @tc.name      RequestAddForm_DimensionTextOf_0111
     * @tc.desc      dimensionTextOf(dimension=34.28) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionTextOf_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0111 begin`);
      const actual: string = dimensionTextOf(34.28);
      logInfo(`dimensionTextOf(dimension=34.28): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0111 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0112
     * @tc.name      RequestAddForm_DimensionTextOf_0112
     * @tc.desc      dimensionTextOf(dimension=-99) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DimensionTextOf_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0112 begin`);
      const actual: string = dimensionTextOf(-99);
      logInfo(`dimensionTextOf(dimension=-99): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0112 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0113
     * @tc.name      RequestAddForm_DimensionTextOf_0113
     * @tc.desc      dimensionTextOf(dimension=182) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionTextOf_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0113 begin`);
      const actual: string = dimensionTextOf(182);
      logInfo(`dimensionTextOf(dimension=182): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0113 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0114
     * @tc.name      RequestAddForm_DimensionTextOf_0114
     * @tc.desc      dimensionTextOf(dimension=-12) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DimensionTextOf_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0114 begin`);
      const actual: string = dimensionTextOf(-12);
      logInfo(`dimensionTextOf(dimension=-12): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0114 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0115
     * @tc.name      RequestAddForm_DimensionTextOf_0115
     * @tc.desc      dimensionTextOf(dimension=174) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionTextOf_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0115 begin`);
      const actual: string = dimensionTextOf(174);
      logInfo(`dimensionTextOf(dimension=174): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0115 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0116
     * @tc.name      RequestAddForm_DimensionTextOf_0116
     * @tc.desc      dimensionTextOf(dimension=-11) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DimensionTextOf_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0116 begin`);
      const actual: string = dimensionTextOf(-11);
      logInfo(`dimensionTextOf(dimension=-11): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0116 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0117
     * @tc.name      RequestAddForm_DimensionTextOf_0117
     * @tc.desc      dimensionTextOf(dimension=-33) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DimensionTextOf_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0117 begin`);
      const actual: string = dimensionTextOf(-33);
      logInfo(`dimensionTextOf(dimension=-33): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0117 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0118
     * @tc.name      RequestAddForm_DimensionTextOf_0118
     * @tc.desc      dimensionTextOf(dimension=88.04) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionTextOf_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0118 begin`);
      const actual: string = dimensionTextOf(88.04);
      logInfo(`dimensionTextOf(dimension=88.04): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0118 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0119
     * @tc.name      RequestAddForm_DimensionTextOf_0119
     * @tc.desc      dimensionTextOf(dimension=114) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionTextOf_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0119 begin`);
      const actual: string = dimensionTextOf(114);
      logInfo(`dimensionTextOf(dimension=114): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0119 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0120
     * @tc.name      RequestAddForm_DimensionTextOf_0120
     * @tc.desc      dimensionTextOf(dimension=14) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionTextOf_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0120 begin`);
      const actual: string = dimensionTextOf(14);
      logInfo(`dimensionTextOf(dimension=14): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0120 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0121
     * @tc.name      RequestAddForm_DimensionTextOf_0121
     * @tc.desc      dimensionTextOf(dimension=66) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionTextOf_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0121 begin`);
      const actual: string = dimensionTextOf(66);
      logInfo(`dimensionTextOf(dimension=66): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0121 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0122
     * @tc.name      RequestAddForm_DimensionTextOf_0122
     * @tc.desc      dimensionTextOf(dimension=31.99) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionTextOf_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0122 begin`);
      const actual: string = dimensionTextOf(31.99);
      logInfo(`dimensionTextOf(dimension=31.99): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0122 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0123
     * @tc.name      RequestAddForm_DimensionTextOf_0123
     * @tc.desc      dimensionTextOf(dimension=-18) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DimensionTextOf_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0123 begin`);
      const actual: string = dimensionTextOf(-18);
      logInfo(`dimensionTextOf(dimension=-18): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0123 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0124
     * @tc.name      RequestAddForm_DimensionTextOf_0124
     * @tc.desc      dimensionTextOf(dimension=-65) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DimensionTextOf_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0124 begin`);
      const actual: string = dimensionTextOf(-65);
      logInfo(`dimensionTextOf(dimension=-65): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0124 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0125
     * @tc.name      RequestAddForm_DimensionTextOf_0125
     * @tc.desc      dimensionTextOf(dimension=-34) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DimensionTextOf_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0125 begin`);
      const actual: string = dimensionTextOf(-34);
      logInfo(`dimensionTextOf(dimension=-34): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0125 end`);
    });
  });
}
