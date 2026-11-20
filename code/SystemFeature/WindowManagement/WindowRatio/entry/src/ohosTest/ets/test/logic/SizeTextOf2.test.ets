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
import { sizeTextOf } from '../model/WindowRatioLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_WindowRatio]';
const BUNDLE: string = 'WindowRatio_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for sizeTextOf (24 cases). */
export default function sizeTextOf2Test(): void {
  describe('SizeTextOf2Test', () => {
    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0097
     * @tc.name      WindowRatio_SizeTextOf_0097
     * @tc.desc      sizeTextOf(value=92.61) returns "92.61"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0097 begin`);
      const actual: string = sizeTextOf(92.61);
      logInfo(`sizeTextOf(value=92.61): actual=${actual}`);
      expect(actual).assertEqual('92.61');
      logInfo(`${BUNDLE}SizeTextOf_0097 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0098
     * @tc.name      WindowRatio_SizeTextOf_0098
     * @tc.desc      sizeTextOf(value=9.47) returns "9.47"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0098 begin`);
      const actual: string = sizeTextOf(9.47);
      logInfo(`sizeTextOf(value=9.47): actual=${actual}`);
      expect(actual).assertEqual('9.47');
      logInfo(`${BUNDLE}SizeTextOf_0098 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0099
     * @tc.name      WindowRatio_SizeTextOf_0099
     * @tc.desc      sizeTextOf(value=71) returns "71"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0099 begin`);
      const actual: string = sizeTextOf(71);
      logInfo(`sizeTextOf(value=71): actual=${actual}`);
      expect(actual).assertEqual('71');
      logInfo(`${BUNDLE}SizeTextOf_0099 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0100
     * @tc.name      WindowRatio_SizeTextOf_0100
     * @tc.desc      sizeTextOf(value=69.46) returns "69.46"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0100 begin`);
      const actual: string = sizeTextOf(69.46);
      logInfo(`sizeTextOf(value=69.46): actual=${actual}`);
      expect(actual).assertEqual('69.46');
      logInfo(`${BUNDLE}SizeTextOf_0100 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0101
     * @tc.name      WindowRatio_SizeTextOf_0101
     * @tc.desc      sizeTextOf(value=68.17) returns "68.17"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0101 begin`);
      const actual: string = sizeTextOf(68.17);
      logInfo(`sizeTextOf(value=68.17): actual=${actual}`);
      expect(actual).assertEqual('68.17');
      logInfo(`${BUNDLE}SizeTextOf_0101 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0102
     * @tc.name      WindowRatio_SizeTextOf_0102
     * @tc.desc      sizeTextOf(value=-48) returns "-48"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_SizeTextOf_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SizeTextOf_0102 begin`);
      const actual: string = sizeTextOf(-48);
      logInfo(`sizeTextOf(value=-48): actual=${actual}`);
      expect(actual).assertEqual('-48');
      logInfo(`${BUNDLE}SizeTextOf_0102 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0103
     * @tc.name      WindowRatio_SizeTextOf_0103
     * @tc.desc      sizeTextOf(value=0.84) returns "0.84"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0103 begin`);
      const actual: string = sizeTextOf(0.84);
      logInfo(`sizeTextOf(value=0.84): actual=${actual}`);
      expect(actual).assertEqual('0.84');
      logInfo(`${BUNDLE}SizeTextOf_0103 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0104
     * @tc.name      WindowRatio_SizeTextOf_0104
     * @tc.desc      sizeTextOf(value=161) returns "161"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0104 begin`);
      const actual: string = sizeTextOf(161);
      logInfo(`sizeTextOf(value=161): actual=${actual}`);
      expect(actual).assertEqual('161');
      logInfo(`${BUNDLE}SizeTextOf_0104 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0105
     * @tc.name      WindowRatio_SizeTextOf_0105
     * @tc.desc      sizeTextOf(value=129) returns "129"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0105 begin`);
      const actual: string = sizeTextOf(129);
      logInfo(`sizeTextOf(value=129): actual=${actual}`);
      expect(actual).assertEqual('129');
      logInfo(`${BUNDLE}SizeTextOf_0105 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0106
     * @tc.name      WindowRatio_SizeTextOf_0106
     * @tc.desc      sizeTextOf(value=32) returns "32"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0106 begin`);
      const actual: string = sizeTextOf(32);
      logInfo(`sizeTextOf(value=32): actual=${actual}`);
      expect(actual).assertEqual('32');
      logInfo(`${BUNDLE}SizeTextOf_0106 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0107
     * @tc.name      WindowRatio_SizeTextOf_0107
     * @tc.desc      sizeTextOf(value=20.53) returns "20.53"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0107 begin`);
      const actual: string = sizeTextOf(20.53);
      logInfo(`sizeTextOf(value=20.53): actual=${actual}`);
      expect(actual).assertEqual('20.53');
      logInfo(`${BUNDLE}SizeTextOf_0107 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0108
     * @tc.name      WindowRatio_SizeTextOf_0108
     * @tc.desc      sizeTextOf(value=17) returns "17"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0108 begin`);
      const actual: string = sizeTextOf(17);
      logInfo(`sizeTextOf(value=17): actual=${actual}`);
      expect(actual).assertEqual('17');
      logInfo(`${BUNDLE}SizeTextOf_0108 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0109
     * @tc.name      WindowRatio_SizeTextOf_0109
     * @tc.desc      sizeTextOf(value=6.75) returns "6.75"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0109 begin`);
      const actual: string = sizeTextOf(6.75);
      logInfo(`sizeTextOf(value=6.75): actual=${actual}`);
      expect(actual).assertEqual('6.75');
      logInfo(`${BUNDLE}SizeTextOf_0109 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0110
     * @tc.name      WindowRatio_SizeTextOf_0110
     * @tc.desc      sizeTextOf(value=-88) returns "-88"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_SizeTextOf_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SizeTextOf_0110 begin`);
      const actual: string = sizeTextOf(-88);
      logInfo(`sizeTextOf(value=-88): actual=${actual}`);
      expect(actual).assertEqual('-88');
      logInfo(`${BUNDLE}SizeTextOf_0110 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0111
     * @tc.name      WindowRatio_SizeTextOf_0111
     * @tc.desc      sizeTextOf(value=6) returns "6"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0111 begin`);
      const actual: string = sizeTextOf(6);
      logInfo(`sizeTextOf(value=6): actual=${actual}`);
      expect(actual).assertEqual('6');
      logInfo(`${BUNDLE}SizeTextOf_0111 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0112
     * @tc.name      WindowRatio_SizeTextOf_0112
     * @tc.desc      sizeTextOf(value=73) returns "73"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0112 begin`);
      const actual: string = sizeTextOf(73);
      logInfo(`sizeTextOf(value=73): actual=${actual}`);
      expect(actual).assertEqual('73');
      logInfo(`${BUNDLE}SizeTextOf_0112 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0113
     * @tc.name      WindowRatio_SizeTextOf_0113
     * @tc.desc      sizeTextOf(value=-32) returns "-32"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_SizeTextOf_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SizeTextOf_0113 begin`);
      const actual: string = sizeTextOf(-32);
      logInfo(`sizeTextOf(value=-32): actual=${actual}`);
      expect(actual).assertEqual('-32');
      logInfo(`${BUNDLE}SizeTextOf_0113 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0114
     * @tc.name      WindowRatio_SizeTextOf_0114
     * @tc.desc      sizeTextOf(value=12) returns "12"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0114 begin`);
      const actual: string = sizeTextOf(12);
      logInfo(`sizeTextOf(value=12): actual=${actual}`);
      expect(actual).assertEqual('12');
      logInfo(`${BUNDLE}SizeTextOf_0114 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0115
     * @tc.name      WindowRatio_SizeTextOf_0115
     * @tc.desc      sizeTextOf(value=-30) returns "-30"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_SizeTextOf_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SizeTextOf_0115 begin`);
      const actual: string = sizeTextOf(-30);
      logInfo(`sizeTextOf(value=-30): actual=${actual}`);
      expect(actual).assertEqual('-30');
      logInfo(`${BUNDLE}SizeTextOf_0115 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0116
     * @tc.name      WindowRatio_SizeTextOf_0116
     * @tc.desc      sizeTextOf(value=-23) returns "-23"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_SizeTextOf_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SizeTextOf_0116 begin`);
      const actual: string = sizeTextOf(-23);
      logInfo(`sizeTextOf(value=-23): actual=${actual}`);
      expect(actual).assertEqual('-23');
      logInfo(`${BUNDLE}SizeTextOf_0116 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0117
     * @tc.name      WindowRatio_SizeTextOf_0117
     * @tc.desc      sizeTextOf(value=193) returns "193"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0117 begin`);
      const actual: string = sizeTextOf(193);
      logInfo(`sizeTextOf(value=193): actual=${actual}`);
      expect(actual).assertEqual('193');
      logInfo(`${BUNDLE}SizeTextOf_0117 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0118
     * @tc.name      WindowRatio_SizeTextOf_0118
     * @tc.desc      sizeTextOf(value=-15) returns "-15"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowRatio_SizeTextOf_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SizeTextOf_0118 begin`);
      const actual: string = sizeTextOf(-15);
      logInfo(`sizeTextOf(value=-15): actual=${actual}`);
      expect(actual).assertEqual('-15');
      logInfo(`${BUNDLE}SizeTextOf_0118 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0119
     * @tc.name      WindowRatio_SizeTextOf_0119
     * @tc.desc      sizeTextOf(value=187) returns "187"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0119 begin`);
      const actual: string = sizeTextOf(187);
      logInfo(`sizeTextOf(value=187): actual=${actual}`);
      expect(actual).assertEqual('187');
      logInfo(`${BUNDLE}SizeTextOf_0119 end`);
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_SIZE_TEXT_OF_0120
     * @tc.name      WindowRatio_SizeTextOf_0120
     * @tc.desc      sizeTextOf(value=23.12) returns "23.12"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowRatio_SizeTextOf_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SizeTextOf_0120 begin`);
      const actual: string = sizeTextOf(23.12);
      logInfo(`sizeTextOf(value=23.12): actual=${actual}`);
      expect(actual).assertEqual('23.12');
      logInfo(`${BUNDLE}SizeTextOf_0120 end`);
    });
  });
}
