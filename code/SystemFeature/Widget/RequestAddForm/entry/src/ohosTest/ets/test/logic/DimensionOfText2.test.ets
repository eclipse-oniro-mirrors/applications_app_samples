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
import { dimensionOfText } from '../model/RequestAddFormLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_RequestAddForm]';
const BUNDLE: string = 'RequestAddForm_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for dimensionOfText (29 cases). */
export default function dimensionOfText2Test(): void {
  describe('DimensionOfText2Test', (): void => {
    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0097
     * @tc.name      RequestAddForm_DimensionOfText_0097
     * @tc.desc      dimensionOfText(text="LZXSvG") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionOfText_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0097 begin`);
      const actual: number = dimensionOfText('LZXSvG');
      logInfo(`dimensionOfText(text="LZXSvG"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0097 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0098
     * @tc.name      RequestAddForm_DimensionOfText_0098
     * @tc.desc      dimensionOfText(text="45VHxpL") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionOfText_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0098 begin`);
      const actual: number = dimensionOfText('45VHxpL');
      logInfo(`dimensionOfText(text="45VHxpL"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0098 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0099
     * @tc.name      RequestAddForm_DimensionOfText_0099
     * @tc.desc      dimensionOfText(text="GGd3Ioqf") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionOfText_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0099 begin`);
      const actual: number = dimensionOfText('GGd3Ioqf');
      logInfo(`dimensionOfText(text="GGd3Ioqf"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0099 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0100
     * @tc.name      RequestAddForm_DimensionOfText_0100
     * @tc.desc      dimensionOfText(text="exMrh") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionOfText_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0100 begin`);
      const actual: number = dimensionOfText('exMrh');
      logInfo(`dimensionOfText(text="exMrh"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0100 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0101
     * @tc.name      RequestAddForm_DimensionOfText_0101
     * @tc.desc      dimensionOfText(text="ADKs3z4t6Cl") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionOfText_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0101 begin`);
      const actual: number = dimensionOfText('ADKs3z4t6Cl');
      logInfo(`dimensionOfText(text="ADKs3z4t6Cl"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0101 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0102
     * @tc.name      RequestAddForm_DimensionOfText_0102
     * @tc.desc      dimensionOfText(text="SVm8BcL8w") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionOfText_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0102 begin`);
      const actual: number = dimensionOfText('SVm8BcL8w');
      logInfo(`dimensionOfText(text="SVm8BcL8w"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0102 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0103
     * @tc.name      RequestAddForm_DimensionOfText_0103
     * @tc.desc      dimensionOfText(text="ISpXAa") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionOfText_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0103 begin`);
      const actual: number = dimensionOfText('ISpXAa');
      logInfo(`dimensionOfText(text="ISpXAa"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0103 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0104
     * @tc.name      RequestAddForm_DimensionOfText_0104
     * @tc.desc      dimensionOfText(text="vk3FiQK0HeG") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionOfText_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0104 begin`);
      const actual: number = dimensionOfText('vk3FiQK0HeG');
      logInfo(`dimensionOfText(text="vk3FiQK0HeG"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0104 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0105
     * @tc.name      RequestAddForm_DimensionOfText_0105
     * @tc.desc      dimensionOfText(text="pt8dMgEWKy") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionOfText_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0105 begin`);
      const actual: number = dimensionOfText('pt8dMgEWKy');
      logInfo(`dimensionOfText(text="pt8dMgEWKy"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0105 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0106
     * @tc.name      RequestAddForm_DimensionOfText_0106
     * @tc.desc      dimensionOfText(text="j") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionOfText_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0106 begin`);
      const actual: number = dimensionOfText('j');
      logInfo(`dimensionOfText(text="j"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0106 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0107
     * @tc.name      RequestAddForm_DimensionOfText_0107
     * @tc.desc      dimensionOfText(text="zqUWlH") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionOfText_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0107 begin`);
      const actual: number = dimensionOfText('zqUWlH');
      logInfo(`dimensionOfText(text="zqUWlH"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0107 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0108
     * @tc.name      RequestAddForm_DimensionOfText_0108
     * @tc.desc      dimensionOfText(text="W2") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionOfText_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0108 begin`);
      const actual: number = dimensionOfText('W2');
      logInfo(`dimensionOfText(text="W2"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0108 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0109
     * @tc.name      RequestAddForm_DimensionOfText_0109
     * @tc.desc      dimensionOfText(text="o5") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionOfText_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0109 begin`);
      const actual: number = dimensionOfText('o5');
      logInfo(`dimensionOfText(text="o5"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0109 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0110
     * @tc.name      RequestAddForm_DimensionOfText_0110
     * @tc.desc      dimensionOfText(text="G") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionOfText_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0110 begin`);
      const actual: number = dimensionOfText('G');
      logInfo(`dimensionOfText(text="G"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0110 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0111
     * @tc.name      RequestAddForm_DimensionOfText_0111
     * @tc.desc      dimensionOfText(text="Z3wg") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionOfText_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0111 begin`);
      const actual: number = dimensionOfText('Z3wg');
      logInfo(`dimensionOfText(text="Z3wg"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0111 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0112
     * @tc.name      RequestAddForm_DimensionOfText_0112
     * @tc.desc      dimensionOfText(text="hkk") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionOfText_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0112 begin`);
      const actual: number = dimensionOfText('hkk');
      logInfo(`dimensionOfText(text="hkk"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0112 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0113
     * @tc.name      RequestAddForm_DimensionOfText_0113
     * @tc.desc      dimensionOfText(text="13W5YIttwgsB") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionOfText_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0113 begin`);
      const actual: number = dimensionOfText('13W5YIttwgsB');
      logInfo(`dimensionOfText(text="13W5YIttwgsB"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0113 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0114
     * @tc.name      RequestAddForm_DimensionOfText_0114
     * @tc.desc      dimensionOfText(text="1bYV34xf") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionOfText_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0114 begin`);
      const actual: number = dimensionOfText('1bYV34xf');
      logInfo(`dimensionOfText(text="1bYV34xf"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0114 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0115
     * @tc.name      RequestAddForm_DimensionOfText_0115
     * @tc.desc      dimensionOfText(text="fzs") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionOfText_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0115 begin`);
      const actual: number = dimensionOfText('fzs');
      logInfo(`dimensionOfText(text="fzs"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0115 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0116
     * @tc.name      RequestAddForm_DimensionOfText_0116
     * @tc.desc      dimensionOfText(text="kQyTN9F8CUTp") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionOfText_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0116 begin`);
      const actual: number = dimensionOfText('kQyTN9F8CUTp');
      logInfo(`dimensionOfText(text="kQyTN9F8CUTp"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0116 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0117
     * @tc.name      RequestAddForm_DimensionOfText_0117
     * @tc.desc      dimensionOfText(text="qv7A") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionOfText_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0117 begin`);
      const actual: number = dimensionOfText('qv7A');
      logInfo(`dimensionOfText(text="qv7A"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0117 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0118
     * @tc.name      RequestAddForm_DimensionOfText_0118
     * @tc.desc      dimensionOfText(text="cR7") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionOfText_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0118 begin`);
      const actual: number = dimensionOfText('cR7');
      logInfo(`dimensionOfText(text="cR7"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0118 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0119
     * @tc.name      RequestAddForm_DimensionOfText_0119
     * @tc.desc      dimensionOfText(text="7") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionOfText_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0119 begin`);
      const actual: number = dimensionOfText('7');
      logInfo(`dimensionOfText(text="7"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0119 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0120
     * @tc.name      RequestAddForm_DimensionOfText_0120
     * @tc.desc      dimensionOfText(text="VGYAKN") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionOfText_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0120 begin`);
      const actual: number = dimensionOfText('VGYAKN');
      logInfo(`dimensionOfText(text="VGYAKN"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0120 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0121
     * @tc.name      RequestAddForm_DimensionOfText_0121
     * @tc.desc      dimensionOfText(text="GkpRq70DaWgS") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionOfText_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0121 begin`);
      const actual: number = dimensionOfText('GkpRq70DaWgS');
      logInfo(`dimensionOfText(text="GkpRq70DaWgS"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0121 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0122
     * @tc.name      RequestAddForm_DimensionOfText_0122
     * @tc.desc      dimensionOfText(text="SRvXqmgCU") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionOfText_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0122 begin`);
      const actual: number = dimensionOfText('SRvXqmgCU');
      logInfo(`dimensionOfText(text="SRvXqmgCU"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0122 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0123
     * @tc.name      RequestAddForm_DimensionOfText_0123
     * @tc.desc      dimensionOfText(text="xAl8rI541I") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionOfText_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0123 begin`);
      const actual: number = dimensionOfText('xAl8rI541I');
      logInfo(`dimensionOfText(text="xAl8rI541I"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0123 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0124
     * @tc.name      RequestAddForm_DimensionOfText_0124
     * @tc.desc      dimensionOfText(text="9r") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionOfText_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0124 begin`);
      const actual: number = dimensionOfText('9r');
      logInfo(`dimensionOfText(text="9r"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0124 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_OF_TEXT_0125
     * @tc.name      RequestAddForm_DimensionOfText_0125
     * @tc.desc      dimensionOfText(text="6867j8ui") returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionOfText_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionOfText_0125 begin`);
      const actual: number = dimensionOfText('6867j8ui');
      logInfo(`dimensionOfText(text="6867j8ui"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}DimensionOfText_0125 end`);
    });
  });
}
