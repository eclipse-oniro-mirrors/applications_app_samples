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
import { yieldToEventLoop } from '../../utils/TestScheduler';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { searchInputWidthOf } from '../model/SearchComponentLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SearchComponent]';
const BUNDLE: string = 'SearchComponent_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for searchInputWidthOf (96 cases). */
export default function searchInputWidthOf2Test(): void {
  describe('SearchInputWidthOf2Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0097
     * @tc.name      SearchComponent_SearchInputWidthOf_0097
     * @tc.desc      searchInputWidthOf(windowWidthPx=360, density=55) returns -57.45454545454545
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0097 begin`);
      const actual: number = searchInputWidthOf(360, 55);
      logInfo(`searchInputWidthOf(windowWidthPx=360, den...: actual=${actual}`);
      expect(actual).assertClose(-57.45454545454545, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0097 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0098
     * @tc.name      SearchComponent_SearchInputWidthOf_0098
     * @tc.desc      searchInputWidthOf(windowWidthPx=360, density=60) returns -58
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0098 begin`);
      const actual: number = searchInputWidthOf(360, 60);
      logInfo(`searchInputWidthOf(windowWidthPx=360, den...: actual=${actual}`);
      expect(actual).assertEqual(-58);
      logInfo(`${BUNDLE}SearchInputWidthOf_0098 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0099
     * @tc.name      SearchComponent_SearchInputWidthOf_0099
     * @tc.desc      searchInputWidthOf(windowWidthPx=360, density=65) returns -58.46153846153846
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0099 begin`);
      const actual: number = searchInputWidthOf(360, 65);
      logInfo(`searchInputWidthOf(windowWidthPx=360, den...: actual=${actual}`);
      expect(actual).assertClose(-58.46153846153846, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0099 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0100
     * @tc.name      SearchComponent_SearchInputWidthOf_0100
     * @tc.desc      searchInputWidthOf(windowWidthPx=360, density=70) returns -58.857142857142854
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0100 begin`);
      const actual: number = searchInputWidthOf(360, 70);
      logInfo(`searchInputWidthOf(windowWidthPx=360, den...: actual=${actual}`);
      expect(actual).assertClose(-58.857142857142854, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0100 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0101
     * @tc.name      SearchComponent_SearchInputWidthOf_0101
     * @tc.desc      searchInputWidthOf(windowWidthPx=360, density=75) returns -59.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0101 begin`);
      const actual: number = searchInputWidthOf(360, 75);
      logInfo(`searchInputWidthOf(windowWidthPx=360, den...: actual=${actual}`);
      expect(actual).assertClose(-59.2, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0101 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0102
     * @tc.name      SearchComponent_SearchInputWidthOf_0102
     * @tc.desc      searchInputWidthOf(windowWidthPx=360, density=80) returns -59.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0102 begin`);
      const actual: number = searchInputWidthOf(360, 80);
      logInfo(`searchInputWidthOf(windowWidthPx=360, den...: actual=${actual}`);
      expect(actual).assertClose(-59.5, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0102 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0103
     * @tc.name      SearchComponent_SearchInputWidthOf_0103
     * @tc.desc      searchInputWidthOf(windowWidthPx=360, density=85) returns -59.76470588235294
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0103 begin`);
      const actual: number = searchInputWidthOf(360, 85);
      logInfo(`searchInputWidthOf(windowWidthPx=360, den...: actual=${actual}`);
      expect(actual).assertClose(-59.76470588235294, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0103 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0104
     * @tc.name      SearchComponent_SearchInputWidthOf_0104
     * @tc.desc      searchInputWidthOf(windowWidthPx=360, density=95) returns -60.21052631578947
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0104 begin`);
      const actual: number = searchInputWidthOf(360, 95);
      logInfo(`searchInputWidthOf(windowWidthPx=360, den...: actual=${actual}`);
      expect(actual).assertClose(-60.21052631578947, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0104 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0105
     * @tc.name      SearchComponent_SearchInputWidthOf_0105
     * @tc.desc      searchInputWidthOf(windowWidthPx=360, density=105) returns -60.57142857142857
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0105 begin`);
      const actual: number = searchInputWidthOf(360, 105);
      logInfo(`searchInputWidthOf(windowWidthPx=360, den...: actual=${actual}`);
      expect(actual).assertClose(-60.57142857142857, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0105 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0106
     * @tc.name      SearchComponent_SearchInputWidthOf_0106
     * @tc.desc      searchInputWidthOf(windowWidthPx=360, density=110) returns -60.72727272727273
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0106 begin`);
      const actual: number = searchInputWidthOf(360, 110);
      logInfo(`searchInputWidthOf(windowWidthPx=360, den...: actual=${actual}`);
      expect(actual).assertClose(-60.72727272727273, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0106 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0107
     * @tc.name      SearchComponent_SearchInputWidthOf_0107
     * @tc.desc      searchInputWidthOf(windowWidthPx=360, density=115) returns -60.869565217391305
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0107 begin`);
      const actual: number = searchInputWidthOf(360, 115);
      logInfo(`searchInputWidthOf(windowWidthPx=360, den...: actual=${actual}`);
      expect(actual).assertClose(-60.869565217391305, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0107 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0108
     * @tc.name      SearchComponent_SearchInputWidthOf_0108
     * @tc.desc      searchInputWidthOf(windowWidthPx=360, density=187) returns -62.07486631016043
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0108 begin`);
      const actual: number = searchInputWidthOf(360, 187);
      logInfo(`searchInputWidthOf(windowWidthPx=360, den...: actual=${actual}`);
      expect(actual).assertClose(-62.07486631016043, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0108 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0109
     * @tc.name      SearchComponent_SearchInputWidthOf_0109
     * @tc.desc      searchInputWidthOf(windowWidthPx=720, density=1) returns 656
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_SearchInputWidthOf_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0109 begin`);
      const actual: number = searchInputWidthOf(720, 1);
      logInfo(`searchInputWidthOf(windowWidthPx=720, den...: actual=${actual}`);
      expect(actual).assertEqual(656);
      logInfo(`${BUNDLE}SearchInputWidthOf_0109 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0110
     * @tc.name      SearchComponent_SearchInputWidthOf_0110
     * @tc.desc      searchInputWidthOf(windowWidthPx=720, density=3) returns 176
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0110 begin`);
      const actual: number = searchInputWidthOf(720, 3);
      logInfo(`searchInputWidthOf(windowWidthPx=720, den...: actual=${actual}`);
      expect(actual).assertEqual(176);
      logInfo(`${BUNDLE}SearchInputWidthOf_0110 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0111
     * @tc.name      SearchComponent_SearchInputWidthOf_0111
     * @tc.desc      searchInputWidthOf(windowWidthPx=720, density=5) returns 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0111 begin`);
      const actual: number = searchInputWidthOf(720, 5);
      logInfo(`searchInputWidthOf(windowWidthPx=720, den...: actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}SearchInputWidthOf_0111 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0112
     * @tc.name      SearchComponent_SearchInputWidthOf_0112
     * @tc.desc      searchInputWidthOf(windowWidthPx=720, density=15) returns -16
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0112 begin`);
      const actual: number = searchInputWidthOf(720, 15);
      logInfo(`searchInputWidthOf(windowWidthPx=720, den...: actual=${actual}`);
      expect(actual).assertEqual(-16);
      logInfo(`${BUNDLE}SearchInputWidthOf_0112 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0113
     * @tc.name      SearchComponent_SearchInputWidthOf_0113
     * @tc.desc      searchInputWidthOf(windowWidthPx=720, density=25) returns -35.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0113 begin`);
      const actual: number = searchInputWidthOf(720, 25);
      logInfo(`searchInputWidthOf(windowWidthPx=720, den...: actual=${actual}`);
      expect(actual).assertClose(-35.2, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0113 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0114
     * @tc.name      SearchComponent_SearchInputWidthOf_0114
     * @tc.desc      searchInputWidthOf(windowWidthPx=720, density=35) returns -43.42857142857143
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0114 begin`);
      const actual: number = searchInputWidthOf(720, 35);
      logInfo(`searchInputWidthOf(windowWidthPx=720, den...: actual=${actual}`);
      expect(actual).assertClose(-43.42857142857143, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0114 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0115
     * @tc.name      SearchComponent_SearchInputWidthOf_0115
     * @tc.desc      searchInputWidthOf(windowWidthPx=720, density=45) returns -48
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0115 begin`);
      const actual: number = searchInputWidthOf(720, 45);
      logInfo(`searchInputWidthOf(windowWidthPx=720, den...: actual=${actual}`);
      expect(actual).assertEqual(-48);
      logInfo(`${BUNDLE}SearchInputWidthOf_0115 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0116
     * @tc.name      SearchComponent_SearchInputWidthOf_0116
     * @tc.desc      searchInputWidthOf(windowWidthPx=720, density=55) returns -50.90909090909091
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0116 begin`);
      const actual: number = searchInputWidthOf(720, 55);
      logInfo(`searchInputWidthOf(windowWidthPx=720, den...: actual=${actual}`);
      expect(actual).assertClose(-50.90909090909091, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0116 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0117
     * @tc.name      SearchComponent_SearchInputWidthOf_0117
     * @tc.desc      searchInputWidthOf(windowWidthPx=720, density=65) returns -52.92307692307692
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0117 begin`);
      const actual: number = searchInputWidthOf(720, 65);
      logInfo(`searchInputWidthOf(windowWidthPx=720, den...: actual=${actual}`);
      expect(actual).assertClose(-52.92307692307692, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0117 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0118
     * @tc.name      SearchComponent_SearchInputWidthOf_0118
     * @tc.desc      searchInputWidthOf(windowWidthPx=720, density=75) returns -54.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0118 begin`);
      const actual: number = searchInputWidthOf(720, 75);
      logInfo(`searchInputWidthOf(windowWidthPx=720, den...: actual=${actual}`);
      expect(actual).assertClose(-54.4, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0118 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0119
     * @tc.name      SearchComponent_SearchInputWidthOf_0119
     * @tc.desc      searchInputWidthOf(windowWidthPx=720, density=85) returns -55.529411764705884
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0119 begin`);
      const actual: number = searchInputWidthOf(720, 85);
      logInfo(`searchInputWidthOf(windowWidthPx=720, den...: actual=${actual}`);
      expect(actual).assertClose(-55.529411764705884, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0119 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0120
     * @tc.name      SearchComponent_SearchInputWidthOf_0120
     * @tc.desc      searchInputWidthOf(windowWidthPx=720, density=95) returns -56.421052631578945
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0120 begin`);
      const actual: number = searchInputWidthOf(720, 95);
      logInfo(`searchInputWidthOf(windowWidthPx=720, den...: actual=${actual}`);
      expect(actual).assertClose(-56.421052631578945, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0120 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0121
     * @tc.name      SearchComponent_SearchInputWidthOf_0121
     * @tc.desc      searchInputWidthOf(windowWidthPx=720, density=105) returns -57.142857142857146
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0121 begin`);
      const actual: number = searchInputWidthOf(720, 105);
      logInfo(`searchInputWidthOf(windowWidthPx=720, den...: actual=${actual}`);
      expect(actual).assertClose(-57.142857142857146, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0121 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0122
     * @tc.name      SearchComponent_SearchInputWidthOf_0122
     * @tc.desc      searchInputWidthOf(windowWidthPx=720, density=115) returns -57.73913043478261
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0122 begin`);
      const actual: number = searchInputWidthOf(720, 115);
      logInfo(`searchInputWidthOf(windowWidthPx=720, den...: actual=${actual}`);
      expect(actual).assertClose(-57.73913043478261, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0122 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0123
     * @tc.name      SearchComponent_SearchInputWidthOf_0123
     * @tc.desc      searchInputWidthOf(windowWidthPx=720, density=187) returns -60.149732620320854
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0123 begin`);
      const actual: number = searchInputWidthOf(720, 187);
      logInfo(`searchInputWidthOf(windowWidthPx=720, den...: actual=${actual}`);
      expect(actual).assertClose(-60.149732620320854, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0123 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0124
     * @tc.name      SearchComponent_SearchInputWidthOf_0124
     * @tc.desc      searchInputWidthOf(windowWidthPx=1080, density=1) returns 1016
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_SearchInputWidthOf_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0124 begin`);
      const actual: number = searchInputWidthOf(1080, 1);
      logInfo(`searchInputWidthOf(windowWidthPx=1080, de...: actual=${actual}`);
      expect(actual).assertEqual(1016);
      logInfo(`${BUNDLE}SearchInputWidthOf_0124 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0125
     * @tc.name      SearchComponent_SearchInputWidthOf_0125
     * @tc.desc      searchInputWidthOf(windowWidthPx=1080, density=2) returns 476
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0125 begin`);
      const actual: number = searchInputWidthOf(1080, 2);
      logInfo(`searchInputWidthOf(windowWidthPx=1080, de...: actual=${actual}`);
      expect(actual).assertEqual(476);
      logInfo(`${BUNDLE}SearchInputWidthOf_0125 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0126
     * @tc.name      SearchComponent_SearchInputWidthOf_0126
     * @tc.desc      searchInputWidthOf(windowWidthPx=1080, density=10) returns 44
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0126 begin`);
      const actual: number = searchInputWidthOf(1080, 10);
      logInfo(`searchInputWidthOf(windowWidthPx=1080, de...: actual=${actual}`);
      expect(actual).assertEqual(44);
      logInfo(`${BUNDLE}SearchInputWidthOf_0126 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0127
     * @tc.name      SearchComponent_SearchInputWidthOf_0127
     * @tc.desc      searchInputWidthOf(windowWidthPx=1080, density=100) returns -53.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0127 begin`);
      const actual: number = searchInputWidthOf(1080, 100);
      logInfo(`searchInputWidthOf(windowWidthPx=1080, de...: actual=${actual}`);
      expect(actual).assertClose(-53.2, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0127 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0128
     * @tc.name      SearchComponent_SearchInputWidthOf_0128
     * @tc.desc      searchInputWidthOf(windowWidthPx=1080, density=5) returns 152
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0128 begin`);
      const actual: number = searchInputWidthOf(1080, 5);
      logInfo(`searchInputWidthOf(windowWidthPx=1080, de...: actual=${actual}`);
      expect(actual).assertEqual(152);
      logInfo(`${BUNDLE}SearchInputWidthOf_0128 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0129
     * @tc.name      SearchComponent_SearchInputWidthOf_0129
     * @tc.desc      searchInputWidthOf(windowWidthPx=1080, density=20) returns -10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0129 begin`);
      const actual: number = searchInputWidthOf(1080, 20);
      logInfo(`searchInputWidthOf(windowWidthPx=1080, de...: actual=${actual}`);
      expect(actual).assertEqual(-10);
      logInfo(`${BUNDLE}SearchInputWidthOf_0129 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0130
     * @tc.name      SearchComponent_SearchInputWidthOf_0130
     * @tc.desc      searchInputWidthOf(windowWidthPx=1080, density=25) returns -20.799999999999997
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0130 begin`);
      const actual: number = searchInputWidthOf(1080, 25);
      logInfo(`searchInputWidthOf(windowWidthPx=1080, de...: actual=${actual}`);
      expect(actual).assertClose(-20.799999999999997, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0130 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0131
     * @tc.name      SearchComponent_SearchInputWidthOf_0131
     * @tc.desc      searchInputWidthOf(windowWidthPx=1080, density=35) returns -33.14285714285714
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0131 begin`);
      const actual: number = searchInputWidthOf(1080, 35);
      logInfo(`searchInputWidthOf(windowWidthPx=1080, de...: actual=${actual}`);
      expect(actual).assertClose(-33.14285714285714, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0131 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0132
     * @tc.name      SearchComponent_SearchInputWidthOf_0132
     * @tc.desc      searchInputWidthOf(windowWidthPx=1080, density=40) returns -37
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0132 begin`);
      const actual: number = searchInputWidthOf(1080, 40);
      logInfo(`searchInputWidthOf(windowWidthPx=1080, de...: actual=${actual}`);
      expect(actual).assertEqual(-37);
      logInfo(`${BUNDLE}SearchInputWidthOf_0132 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0133
     * @tc.name      SearchComponent_SearchInputWidthOf_0133
     * @tc.desc      searchInputWidthOf(windowWidthPx=1080, density=50) returns -42.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0133 begin`);
      const actual: number = searchInputWidthOf(1080, 50);
      logInfo(`searchInputWidthOf(windowWidthPx=1080, de...: actual=${actual}`);
      expect(actual).assertClose(-42.4, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0133 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0134
     * @tc.name      SearchComponent_SearchInputWidthOf_0134
     * @tc.desc      searchInputWidthOf(windowWidthPx=1080, density=55) returns -44.36363636363636
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0134 begin`);
      const actual: number = searchInputWidthOf(1080, 55);
      logInfo(`searchInputWidthOf(windowWidthPx=1080, de...: actual=${actual}`);
      expect(actual).assertClose(-44.36363636363636, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0134 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0135
     * @tc.name      SearchComponent_SearchInputWidthOf_0135
     * @tc.desc      searchInputWidthOf(windowWidthPx=1080, density=65) returns -47.38461538461539
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0135 begin`);
      const actual: number = searchInputWidthOf(1080, 65);
      logInfo(`searchInputWidthOf(windowWidthPx=1080, de...: actual=${actual}`);
      expect(actual).assertClose(-47.38461538461539, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0135 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0136
     * @tc.name      SearchComponent_SearchInputWidthOf_0136
     * @tc.desc      searchInputWidthOf(windowWidthPx=1080, density=70) returns -48.57142857142857
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0136 begin`);
      const actual: number = searchInputWidthOf(1080, 70);
      logInfo(`searchInputWidthOf(windowWidthPx=1080, de...: actual=${actual}`);
      expect(actual).assertClose(-48.57142857142857, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0136 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0137
     * @tc.name      SearchComponent_SearchInputWidthOf_0137
     * @tc.desc      searchInputWidthOf(windowWidthPx=1080, density=80) returns -50.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0137 begin`);
      const actual: number = searchInputWidthOf(1080, 80);
      logInfo(`searchInputWidthOf(windowWidthPx=1080, de...: actual=${actual}`);
      expect(actual).assertClose(-50.5, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0137 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0138
     * @tc.name      SearchComponent_SearchInputWidthOf_0138
     * @tc.desc      searchInputWidthOf(windowWidthPx=1080, density=85) returns -51.294117647058826
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0138 begin`);
      const actual: number = searchInputWidthOf(1080, 85);
      logInfo(`searchInputWidthOf(windowWidthPx=1080, de...: actual=${actual}`);
      expect(actual).assertClose(-51.294117647058826, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0138 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0139
     * @tc.name      SearchComponent_SearchInputWidthOf_0139
     * @tc.desc      searchInputWidthOf(windowWidthPx=1080, density=95) returns -52.631578947368425
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0139 begin`);
      const actual: number = searchInputWidthOf(1080, 95);
      logInfo(`searchInputWidthOf(windowWidthPx=1080, de...: actual=${actual}`);
      expect(actual).assertClose(-52.631578947368425, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0139 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0140
     * @tc.name      SearchComponent_SearchInputWidthOf_0140
     * @tc.desc      searchInputWidthOf(windowWidthPx=1080, density=110) returns -54.18181818181818
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0140 begin`);
      const actual: number = searchInputWidthOf(1080, 110);
      logInfo(`searchInputWidthOf(windowWidthPx=1080, de...: actual=${actual}`);
      expect(actual).assertClose(-54.18181818181818, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0140 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0141
     * @tc.name      SearchComponent_SearchInputWidthOf_0141
     * @tc.desc      searchInputWidthOf(windowWidthPx=1080, density=115) returns -54.608695652173914
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0141 begin`);
      const actual: number = searchInputWidthOf(1080, 115);
      logInfo(`searchInputWidthOf(windowWidthPx=1080, de...: actual=${actual}`);
      expect(actual).assertClose(-54.608695652173914, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0141 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0142
     * @tc.name      SearchComponent_SearchInputWidthOf_0142
     * @tc.desc      searchInputWidthOf(windowWidthPx=1080, density=187) returns -58.224598930481285
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0142 begin`);
      const actual: number = searchInputWidthOf(1080, 187);
      logInfo(`searchInputWidthOf(windowWidthPx=1080, de...: actual=${actual}`);
      expect(actual).assertClose(-58.224598930481285, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0142 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0143
     * @tc.name      SearchComponent_SearchInputWidthOf_0143
     * @tc.desc      searchInputWidthOf(windowWidthPx=1920, density=1) returns 1856
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_SearchInputWidthOf_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0143 begin`);
      const actual: number = searchInputWidthOf(1920, 1);
      logInfo(`searchInputWidthOf(windowWidthPx=1920, de...: actual=${actual}`);
      expect(actual).assertEqual(1856);
      logInfo(`${BUNDLE}SearchInputWidthOf_0143 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0144
     * @tc.name      SearchComponent_SearchInputWidthOf_0144
     * @tc.desc      searchInputWidthOf(windowWidthPx=1920, density=2) returns 896
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0144 begin`);
      const actual: number = searchInputWidthOf(1920, 2);
      logInfo(`searchInputWidthOf(windowWidthPx=1920, de...: actual=${actual}`);
      expect(actual).assertEqual(896);
      logInfo(`${BUNDLE}SearchInputWidthOf_0144 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0145
     * @tc.name      SearchComponent_SearchInputWidthOf_0145
     * @tc.desc      searchInputWidthOf(windowWidthPx=1920, density=3) returns 576
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0145 begin`);
      const actual: number = searchInputWidthOf(1920, 3);
      logInfo(`searchInputWidthOf(windowWidthPx=1920, de...: actual=${actual}`);
      expect(actual).assertEqual(576);
      logInfo(`${BUNDLE}SearchInputWidthOf_0145 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0146
     * @tc.name      SearchComponent_SearchInputWidthOf_0146
     * @tc.desc      searchInputWidthOf(windowWidthPx=1920, density=10) returns 128
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0146 begin`);
      const actual: number = searchInputWidthOf(1920, 10);
      logInfo(`searchInputWidthOf(windowWidthPx=1920, de...: actual=${actual}`);
      expect(actual).assertEqual(128);
      logInfo(`${BUNDLE}SearchInputWidthOf_0146 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0147
     * @tc.name      SearchComponent_SearchInputWidthOf_0147
     * @tc.desc      searchInputWidthOf(windowWidthPx=1920, density=100) returns -44.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0147 begin`);
      const actual: number = searchInputWidthOf(1920, 100);
      logInfo(`searchInputWidthOf(windowWidthPx=1920, de...: actual=${actual}`);
      expect(actual).assertClose(-44.8, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0147 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0148
     * @tc.name      SearchComponent_SearchInputWidthOf_0148
     * @tc.desc      searchInputWidthOf(windowWidthPx=1920, density=5) returns 320
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0148 begin`);
      const actual: number = searchInputWidthOf(1920, 5);
      logInfo(`searchInputWidthOf(windowWidthPx=1920, de...: actual=${actual}`);
      expect(actual).assertEqual(320);
      logInfo(`${BUNDLE}SearchInputWidthOf_0148 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0149
     * @tc.name      SearchComponent_SearchInputWidthOf_0149
     * @tc.desc      searchInputWidthOf(windowWidthPx=1920, density=15) returns 64
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0149 begin`);
      const actual: number = searchInputWidthOf(1920, 15);
      logInfo(`searchInputWidthOf(windowWidthPx=1920, de...: actual=${actual}`);
      expect(actual).assertEqual(64);
      logInfo(`${BUNDLE}SearchInputWidthOf_0149 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0150
     * @tc.name      SearchComponent_SearchInputWidthOf_0150
     * @tc.desc      searchInputWidthOf(windowWidthPx=1920, density=20) returns 32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0150 begin`);
      const actual: number = searchInputWidthOf(1920, 20);
      logInfo(`searchInputWidthOf(windowWidthPx=1920, de...: actual=${actual}`);
      expect(actual).assertEqual(32);
      logInfo(`${BUNDLE}SearchInputWidthOf_0150 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0151
     * @tc.name      SearchComponent_SearchInputWidthOf_0151
     * @tc.desc      searchInputWidthOf(windowWidthPx=1920, density=25) returns 12.799999999999997
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0151 begin`);
      const actual: number = searchInputWidthOf(1920, 25);
      logInfo(`searchInputWidthOf(windowWidthPx=1920, de...: actual=${actual}`);
      expect(actual).assertClose(12.799999999999997, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0151 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0152
     * @tc.name      SearchComponent_SearchInputWidthOf_0152
     * @tc.desc      searchInputWidthOf(windowWidthPx=1920, density=35) returns -9.142857142857146
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0152 begin`);
      const actual: number = searchInputWidthOf(1920, 35);
      logInfo(`searchInputWidthOf(windowWidthPx=1920, de...: actual=${actual}`);
      expect(actual).assertClose(-9.142857142857146, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0152 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0153
     * @tc.name      SearchComponent_SearchInputWidthOf_0153
     * @tc.desc      searchInputWidthOf(windowWidthPx=1920, density=45) returns -21.333333333333336
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0153 begin`);
      const actual: number = searchInputWidthOf(1920, 45);
      logInfo(`searchInputWidthOf(windowWidthPx=1920, de...: actual=${actual}`);
      expect(actual).assertClose(-21.333333333333336, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0153 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0154
     * @tc.name      SearchComponent_SearchInputWidthOf_0154
     * @tc.desc      searchInputWidthOf(windowWidthPx=1920, density=50) returns -25.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0154 begin`);
      const actual: number = searchInputWidthOf(1920, 50);
      logInfo(`searchInputWidthOf(windowWidthPx=1920, de...: actual=${actual}`);
      expect(actual).assertClose(-25.6, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0154 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0155
     * @tc.name      SearchComponent_SearchInputWidthOf_0155
     * @tc.desc      searchInputWidthOf(windowWidthPx=1920, density=55) returns -29.090909090909093
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0155 begin`);
      const actual: number = searchInputWidthOf(1920, 55);
      logInfo(`searchInputWidthOf(windowWidthPx=1920, de...: actual=${actual}`);
      expect(actual).assertClose(-29.090909090909093, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0155 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0156
     * @tc.name      SearchComponent_SearchInputWidthOf_0156
     * @tc.desc      searchInputWidthOf(windowWidthPx=1920, density=60) returns -32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0156 begin`);
      const actual: number = searchInputWidthOf(1920, 60);
      logInfo(`searchInputWidthOf(windowWidthPx=1920, de...: actual=${actual}`);
      expect(actual).assertEqual(-32);
      logInfo(`${BUNDLE}SearchInputWidthOf_0156 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0157
     * @tc.name      SearchComponent_SearchInputWidthOf_0157
     * @tc.desc      searchInputWidthOf(windowWidthPx=1920, density=65) returns -34.46153846153846
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0157 begin`);
      const actual: number = searchInputWidthOf(1920, 65);
      logInfo(`searchInputWidthOf(windowWidthPx=1920, de...: actual=${actual}`);
      expect(actual).assertClose(-34.46153846153846, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0157 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0158
     * @tc.name      SearchComponent_SearchInputWidthOf_0158
     * @tc.desc      searchInputWidthOf(windowWidthPx=1920, density=70) returns -36.57142857142857
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0158 begin`);
      const actual: number = searchInputWidthOf(1920, 70);
      logInfo(`searchInputWidthOf(windowWidthPx=1920, de...: actual=${actual}`);
      expect(actual).assertClose(-36.57142857142857, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0158 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0159
     * @tc.name      SearchComponent_SearchInputWidthOf_0159
     * @tc.desc      searchInputWidthOf(windowWidthPx=1920, density=75) returns -38.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0159 begin`);
      const actual: number = searchInputWidthOf(1920, 75);
      logInfo(`searchInputWidthOf(windowWidthPx=1920, de...: actual=${actual}`);
      expect(actual).assertClose(-38.4, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0159 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0160
     * @tc.name      SearchComponent_SearchInputWidthOf_0160
     * @tc.desc      searchInputWidthOf(windowWidthPx=1920, density=85) returns -41.41176470588235
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0160 begin`);
      const actual: number = searchInputWidthOf(1920, 85);
      logInfo(`searchInputWidthOf(windowWidthPx=1920, de...: actual=${actual}`);
      expect(actual).assertClose(-41.41176470588235, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0160 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0161
     * @tc.name      SearchComponent_SearchInputWidthOf_0161
     * @tc.desc      searchInputWidthOf(windowWidthPx=1920, density=90) returns -42.66666666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0161 begin`);
      const actual: number = searchInputWidthOf(1920, 90);
      logInfo(`searchInputWidthOf(windowWidthPx=1920, de...: actual=${actual}`);
      expect(actual).assertClose(-42.66666666666667, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0161 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0162
     * @tc.name      SearchComponent_SearchInputWidthOf_0162
     * @tc.desc      searchInputWidthOf(windowWidthPx=1920, density=95) returns -43.78947368421053
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0162 begin`);
      const actual: number = searchInputWidthOf(1920, 95);
      logInfo(`searchInputWidthOf(windowWidthPx=1920, de...: actual=${actual}`);
      expect(actual).assertClose(-43.78947368421053, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0162 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0163
     * @tc.name      SearchComponent_SearchInputWidthOf_0163
     * @tc.desc      searchInputWidthOf(windowWidthPx=1920, density=105) returns -45.714285714285715
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0163 begin`);
      const actual: number = searchInputWidthOf(1920, 105);
      logInfo(`searchInputWidthOf(windowWidthPx=1920, de...: actual=${actual}`);
      expect(actual).assertClose(-45.714285714285715, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0163 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0164
     * @tc.name      SearchComponent_SearchInputWidthOf_0164
     * @tc.desc      searchInputWidthOf(windowWidthPx=1920, density=110) returns -46.54545454545455
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0164 begin`);
      const actual: number = searchInputWidthOf(1920, 110);
      logInfo(`searchInputWidthOf(windowWidthPx=1920, de...: actual=${actual}`);
      expect(actual).assertClose(-46.54545454545455, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0164 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0165
     * @tc.name      SearchComponent_SearchInputWidthOf_0165
     * @tc.desc      searchInputWidthOf(windowWidthPx=1920, density=115) returns -47.30434782608695
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0165 begin`);
      const actual: number = searchInputWidthOf(1920, 115);
      logInfo(`searchInputWidthOf(windowWidthPx=1920, de...: actual=${actual}`);
      expect(actual).assertClose(-47.30434782608695, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0165 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0166
     * @tc.name      SearchComponent_SearchInputWidthOf_0166
     * @tc.desc      searchInputWidthOf(windowWidthPx=1920, density=187) returns -53.73262032085562
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0166 begin`);
      const actual: number = searchInputWidthOf(1920, 187);
      logInfo(`searchInputWidthOf(windowWidthPx=1920, de...: actual=${actual}`);
      expect(actual).assertClose(-53.73262032085562, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0166 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0167
     * @tc.name      SearchComponent_SearchInputWidthOf_0167
     * @tc.desc      searchInputWidthOf(windowWidthPx=2, density=3) returns -63.333333333333336
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0167 begin`);
      const actual: number = searchInputWidthOf(2, 3);
      logInfo(`searchInputWidthOf(windowWidthPx=2, densi...: actual=${actual}`);
      expect(actual).assertClose(-63.333333333333336, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0167 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0168
     * @tc.name      SearchComponent_SearchInputWidthOf_0168
     * @tc.desc      searchInputWidthOf(windowWidthPx=2, density=5) returns -63.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0168 begin`);
      const actual: number = searchInputWidthOf(2, 5);
      logInfo(`searchInputWidthOf(windowWidthPx=2, densi...: actual=${actual}`);
      expect(actual).assertClose(-63.6, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0168 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0169
     * @tc.name      SearchComponent_SearchInputWidthOf_0169
     * @tc.desc      searchInputWidthOf(windowWidthPx=2, density=15) returns -63.86666666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0169 begin`);
      const actual: number = searchInputWidthOf(2, 15);
      logInfo(`searchInputWidthOf(windowWidthPx=2, densi...: actual=${actual}`);
      expect(actual).assertClose(-63.86666666666667, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0169 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0170
     * @tc.name      SearchComponent_SearchInputWidthOf_0170
     * @tc.desc      searchInputWidthOf(windowWidthPx=2, density=25) returns -63.92
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0170 begin`);
      const actual: number = searchInputWidthOf(2, 25);
      logInfo(`searchInputWidthOf(windowWidthPx=2, densi...: actual=${actual}`);
      expect(actual).assertClose(-63.92, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0170 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0171
     * @tc.name      SearchComponent_SearchInputWidthOf_0171
     * @tc.desc      searchInputWidthOf(windowWidthPx=2, density=35) returns -63.94285714285714
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0171 begin`);
      const actual: number = searchInputWidthOf(2, 35);
      logInfo(`searchInputWidthOf(windowWidthPx=2, densi...: actual=${actual}`);
      expect(actual).assertClose(-63.94285714285714, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0171 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0172
     * @tc.name      SearchComponent_SearchInputWidthOf_0172
     * @tc.desc      searchInputWidthOf(windowWidthPx=2, density=45) returns -63.955555555555556
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0172 begin`);
      const actual: number = searchInputWidthOf(2, 45);
      logInfo(`searchInputWidthOf(windowWidthPx=2, densi...: actual=${actual}`);
      expect(actual).assertClose(-63.955555555555556, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0172 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0173
     * @tc.name      SearchComponent_SearchInputWidthOf_0173
     * @tc.desc      searchInputWidthOf(windowWidthPx=2, density=55) returns -63.96363636363636
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0173 begin`);
      const actual: number = searchInputWidthOf(2, 55);
      logInfo(`searchInputWidthOf(windowWidthPx=2, densi...: actual=${actual}`);
      expect(actual).assertClose(-63.96363636363636, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0173 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0174
     * @tc.name      SearchComponent_SearchInputWidthOf_0174
     * @tc.desc      searchInputWidthOf(windowWidthPx=2, density=65) returns -63.96923076923077
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0174 begin`);
      const actual: number = searchInputWidthOf(2, 65);
      logInfo(`searchInputWidthOf(windowWidthPx=2, densi...: actual=${actual}`);
      expect(actual).assertClose(-63.96923076923077, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0174 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0175
     * @tc.name      SearchComponent_SearchInputWidthOf_0175
     * @tc.desc      searchInputWidthOf(windowWidthPx=2, density=75) returns -63.973333333333336
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0175 begin`);
      const actual: number = searchInputWidthOf(2, 75);
      logInfo(`searchInputWidthOf(windowWidthPx=2, densi...: actual=${actual}`);
      expect(actual).assertClose(-63.973333333333336, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0175 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0176
     * @tc.name      SearchComponent_SearchInputWidthOf_0176
     * @tc.desc      searchInputWidthOf(windowWidthPx=2, density=85) returns -63.976470588235294
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0176 begin`);
      const actual: number = searchInputWidthOf(2, 85);
      logInfo(`searchInputWidthOf(windowWidthPx=2, densi...: actual=${actual}`);
      expect(actual).assertClose(-63.976470588235294, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0176 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0177
     * @tc.name      SearchComponent_SearchInputWidthOf_0177
     * @tc.desc      searchInputWidthOf(windowWidthPx=2, density=95) returns -63.97894736842105
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0177 begin`);
      const actual: number = searchInputWidthOf(2, 95);
      logInfo(`searchInputWidthOf(windowWidthPx=2, densi...: actual=${actual}`);
      expect(actual).assertClose(-63.97894736842105, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0177 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0178
     * @tc.name      SearchComponent_SearchInputWidthOf_0178
     * @tc.desc      searchInputWidthOf(windowWidthPx=2, density=105) returns -63.98095238095238
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0178 begin`);
      const actual: number = searchInputWidthOf(2, 105);
      logInfo(`searchInputWidthOf(windowWidthPx=2, densi...: actual=${actual}`);
      expect(actual).assertClose(-63.98095238095238, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0178 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0179
     * @tc.name      SearchComponent_SearchInputWidthOf_0179
     * @tc.desc      searchInputWidthOf(windowWidthPx=2, density=115) returns -63.982608695652175
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0179 begin`);
      const actual: number = searchInputWidthOf(2, 115);
      logInfo(`searchInputWidthOf(windowWidthPx=2, densi...: actual=${actual}`);
      expect(actual).assertClose(-63.982608695652175, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0179 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0180
     * @tc.name      SearchComponent_SearchInputWidthOf_0180
     * @tc.desc      searchInputWidthOf(windowWidthPx=2, density=187) returns -63.98930481283423
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0180 begin`);
      const actual: number = searchInputWidthOf(2, 187);
      logInfo(`searchInputWidthOf(windowWidthPx=2, densi...: actual=${actual}`);
      expect(actual).assertClose(-63.98930481283423, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0180 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0181
     * @tc.name      SearchComponent_SearchInputWidthOf_0181
     * @tc.desc      searchInputWidthOf(windowWidthPx=3, density=1) returns -61
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_SearchInputWidthOf_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0181 begin`);
      const actual: number = searchInputWidthOf(3, 1);
      logInfo(`searchInputWidthOf(windowWidthPx=3, densi...: actual=${actual}`);
      expect(actual).assertEqual(-61);
      logInfo(`${BUNDLE}SearchInputWidthOf_0181 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0182
     * @tc.name      SearchComponent_SearchInputWidthOf_0182
     * @tc.desc      searchInputWidthOf(windowWidthPx=3, density=2) returns -62.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0182 begin`);
      const actual: number = searchInputWidthOf(3, 2);
      logInfo(`searchInputWidthOf(windowWidthPx=3, densi...: actual=${actual}`);
      expect(actual).assertClose(-62.5, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0182 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0183
     * @tc.name      SearchComponent_SearchInputWidthOf_0183
     * @tc.desc      searchInputWidthOf(windowWidthPx=3, density=10) returns -63.7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0183 begin`);
      const actual: number = searchInputWidthOf(3, 10);
      logInfo(`searchInputWidthOf(windowWidthPx=3, densi...: actual=${actual}`);
      expect(actual).assertClose(-63.7, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0183 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0184
     * @tc.name      SearchComponent_SearchInputWidthOf_0184
     * @tc.desc      searchInputWidthOf(windowWidthPx=3, density=100) returns -63.97
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0184 begin`);
      const actual: number = searchInputWidthOf(3, 100);
      logInfo(`searchInputWidthOf(windowWidthPx=3, densi...: actual=${actual}`);
      expect(actual).assertClose(-63.97, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0184 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0185
     * @tc.name      SearchComponent_SearchInputWidthOf_0185
     * @tc.desc      searchInputWidthOf(windowWidthPx=3, density=5) returns -63.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0185 begin`);
      const actual: number = searchInputWidthOf(3, 5);
      logInfo(`searchInputWidthOf(windowWidthPx=3, densi...: actual=${actual}`);
      expect(actual).assertClose(-63.4, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0185 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0186
     * @tc.name      SearchComponent_SearchInputWidthOf_0186
     * @tc.desc      searchInputWidthOf(windowWidthPx=3, density=20) returns -63.85
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0186 begin`);
      const actual: number = searchInputWidthOf(3, 20);
      logInfo(`searchInputWidthOf(windowWidthPx=3, densi...: actual=${actual}`);
      expect(actual).assertClose(-63.85, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0186 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0187
     * @tc.name      SearchComponent_SearchInputWidthOf_0187
     * @tc.desc      searchInputWidthOf(windowWidthPx=3, density=25) returns -63.88
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0187 begin`);
      const actual: number = searchInputWidthOf(3, 25);
      logInfo(`searchInputWidthOf(windowWidthPx=3, densi...: actual=${actual}`);
      expect(actual).assertClose(-63.88, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0187 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0188
     * @tc.name      SearchComponent_SearchInputWidthOf_0188
     * @tc.desc      searchInputWidthOf(windowWidthPx=3, density=35) returns -63.91428571428571
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0188 begin`);
      const actual: number = searchInputWidthOf(3, 35);
      logInfo(`searchInputWidthOf(windowWidthPx=3, densi...: actual=${actual}`);
      expect(actual).assertClose(-63.91428571428571, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0188 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0189
     * @tc.name      SearchComponent_SearchInputWidthOf_0189
     * @tc.desc      searchInputWidthOf(windowWidthPx=3, density=40) returns -63.925
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0189 begin`);
      const actual: number = searchInputWidthOf(3, 40);
      logInfo(`searchInputWidthOf(windowWidthPx=3, densi...: actual=${actual}`);
      expect(actual).assertClose(-63.925, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0189 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0190
     * @tc.name      SearchComponent_SearchInputWidthOf_0190
     * @tc.desc      searchInputWidthOf(windowWidthPx=3, density=50) returns -63.94
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0190 begin`);
      const actual: number = searchInputWidthOf(3, 50);
      logInfo(`searchInputWidthOf(windowWidthPx=3, densi...: actual=${actual}`);
      expect(actual).assertClose(-63.94, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0190 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0191
     * @tc.name      SearchComponent_SearchInputWidthOf_0191
     * @tc.desc      searchInputWidthOf(windowWidthPx=3, density=55) returns -63.945454545454545
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0191 begin`);
      const actual: number = searchInputWidthOf(3, 55);
      logInfo(`searchInputWidthOf(windowWidthPx=3, densi...: actual=${actual}`);
      expect(actual).assertClose(-63.945454545454545, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0191 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0192
     * @tc.name      SearchComponent_SearchInputWidthOf_0192
     * @tc.desc      searchInputWidthOf(windowWidthPx=3, density=65) returns -63.95384615384615
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0192 begin`);
      const actual: number = searchInputWidthOf(3, 65);
      logInfo(`searchInputWidthOf(windowWidthPx=3, densi...: actual=${actual}`);
      expect(actual).assertClose(-63.95384615384615, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0192 end`);
    });
  });
}
