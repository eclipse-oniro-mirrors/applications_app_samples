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
export default function searchInputWidthOf3Test(): void {
  describe('SearchInputWidthOf3Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0193
     * @tc.name      SearchComponent_SearchInputWidthOf_0193
     * @tc.desc      searchInputWidthOf(windowWidthPx=3, density=70) returns -63.957142857142856
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0193 begin`);
      const actual: number = searchInputWidthOf(3, 70);
      logInfo(`searchInputWidthOf(windowWidthPx=3, densi...: actual=${actual}`);
      expect(actual).assertClose(-63.957142857142856, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0193 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0194
     * @tc.name      SearchComponent_SearchInputWidthOf_0194
     * @tc.desc      searchInputWidthOf(windowWidthPx=3, density=80) returns -63.9625
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0194 begin`);
      const actual: number = searchInputWidthOf(3, 80);
      logInfo(`searchInputWidthOf(windowWidthPx=3, densi...: actual=${actual}`);
      expect(actual).assertClose(-63.9625, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0194 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0195
     * @tc.name      SearchComponent_SearchInputWidthOf_0195
     * @tc.desc      searchInputWidthOf(windowWidthPx=3, density=85) returns -63.96470588235294
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0195 begin`);
      const actual: number = searchInputWidthOf(3, 85);
      logInfo(`searchInputWidthOf(windowWidthPx=3, densi...: actual=${actual}`);
      expect(actual).assertClose(-63.96470588235294, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0195 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0196
     * @tc.name      SearchComponent_SearchInputWidthOf_0196
     * @tc.desc      searchInputWidthOf(windowWidthPx=3, density=95) returns -63.96842105263158
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0196 begin`);
      const actual: number = searchInputWidthOf(3, 95);
      logInfo(`searchInputWidthOf(windowWidthPx=3, densi...: actual=${actual}`);
      expect(actual).assertClose(-63.96842105263158, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0196 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0197
     * @tc.name      SearchComponent_SearchInputWidthOf_0197
     * @tc.desc      searchInputWidthOf(windowWidthPx=3, density=110) returns -63.972727272727276
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0197 begin`);
      const actual: number = searchInputWidthOf(3, 110);
      logInfo(`searchInputWidthOf(windowWidthPx=3, densi...: actual=${actual}`);
      expect(actual).assertClose(-63.972727272727276, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0197 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0198
     * @tc.name      SearchComponent_SearchInputWidthOf_0198
     * @tc.desc      searchInputWidthOf(windowWidthPx=3, density=115) returns -63.97391304347826
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0198 begin`);
      const actual: number = searchInputWidthOf(3, 115);
      logInfo(`searchInputWidthOf(windowWidthPx=3, densi...: actual=${actual}`);
      expect(actual).assertClose(-63.97391304347826, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0198 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0199
     * @tc.name      SearchComponent_SearchInputWidthOf_0199
     * @tc.desc      searchInputWidthOf(windowWidthPx=3, density=187) returns -63.98395721925134
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0199 begin`);
      const actual: number = searchInputWidthOf(3, 187);
      logInfo(`searchInputWidthOf(windowWidthPx=3, densi...: actual=${actual}`);
      expect(actual).assertClose(-63.98395721925134, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0199 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0200
     * @tc.name      SearchComponent_SearchInputWidthOf_0200
     * @tc.desc      searchInputWidthOf(windowWidthPx=10, density=35) returns -63.714285714285715
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0200 begin`);
      const actual: number = searchInputWidthOf(10, 35);
      logInfo(`searchInputWidthOf(windowWidthPx=10, dens...: actual=${actual}`);
      expect(actual).assertClose(-63.714285714285715, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0200 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0201
     * @tc.name      SearchComponent_SearchInputWidthOf_0201
     * @tc.desc      searchInputWidthOf(windowWidthPx=10, density=40) returns -63.75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0201 begin`);
      const actual: number = searchInputWidthOf(10, 40);
      logInfo(`searchInputWidthOf(windowWidthPx=10, dens...: actual=${actual}`);
      expect(actual).assertClose(-63.75, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0201 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0202
     * @tc.name      SearchComponent_SearchInputWidthOf_0202
     * @tc.desc      searchInputWidthOf(windowWidthPx=10, density=45) returns -63.77777777777778
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0202 begin`);
      const actual: number = searchInputWidthOf(10, 45);
      logInfo(`searchInputWidthOf(windowWidthPx=10, dens...: actual=${actual}`);
      expect(actual).assertClose(-63.77777777777778, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0202 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0203
     * @tc.name      SearchComponent_SearchInputWidthOf_0203
     * @tc.desc      searchInputWidthOf(windowWidthPx=10, density=55) returns -63.81818181818182
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0203 begin`);
      const actual: number = searchInputWidthOf(10, 55);
      logInfo(`searchInputWidthOf(windowWidthPx=10, dens...: actual=${actual}`);
      expect(actual).assertClose(-63.81818181818182, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0203 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0204
     * @tc.name      SearchComponent_SearchInputWidthOf_0204
     * @tc.desc      searchInputWidthOf(windowWidthPx=10, density=60) returns -63.833333333333336
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0204 begin`);
      const actual: number = searchInputWidthOf(10, 60);
      logInfo(`searchInputWidthOf(windowWidthPx=10, dens...: actual=${actual}`);
      expect(actual).assertClose(-63.833333333333336, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0204 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0205
     * @tc.name      SearchComponent_SearchInputWidthOf_0205
     * @tc.desc      searchInputWidthOf(windowWidthPx=10, density=65) returns -63.84615384615385
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0205 begin`);
      const actual: number = searchInputWidthOf(10, 65);
      logInfo(`searchInputWidthOf(windowWidthPx=10, dens...: actual=${actual}`);
      expect(actual).assertClose(-63.84615384615385, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0205 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0206
     * @tc.name      SearchComponent_SearchInputWidthOf_0206
     * @tc.desc      searchInputWidthOf(windowWidthPx=10, density=70) returns -63.857142857142854
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0206 begin`);
      const actual: number = searchInputWidthOf(10, 70);
      logInfo(`searchInputWidthOf(windowWidthPx=10, dens...: actual=${actual}`);
      expect(actual).assertClose(-63.857142857142854, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0206 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0207
     * @tc.name      SearchComponent_SearchInputWidthOf_0207
     * @tc.desc      searchInputWidthOf(windowWidthPx=10, density=80) returns -63.875
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0207 begin`);
      const actual: number = searchInputWidthOf(10, 80);
      logInfo(`searchInputWidthOf(windowWidthPx=10, dens...: actual=${actual}`);
      expect(actual).assertClose(-63.875, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0207 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0208
     * @tc.name      SearchComponent_SearchInputWidthOf_0208
     * @tc.desc      searchInputWidthOf(windowWidthPx=10, density=85) returns -63.88235294117647
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0208 begin`);
      const actual: number = searchInputWidthOf(10, 85);
      logInfo(`searchInputWidthOf(windowWidthPx=10, dens...: actual=${actual}`);
      expect(actual).assertClose(-63.88235294117647, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0208 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0209
     * @tc.name      SearchComponent_SearchInputWidthOf_0209
     * @tc.desc      searchInputWidthOf(windowWidthPx=10, density=90) returns -63.888888888888886
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0209 begin`);
      const actual: number = searchInputWidthOf(10, 90);
      logInfo(`searchInputWidthOf(windowWidthPx=10, dens...: actual=${actual}`);
      expect(actual).assertClose(-63.888888888888886, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0209 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0210
     * @tc.name      SearchComponent_SearchInputWidthOf_0210
     * @tc.desc      searchInputWidthOf(windowWidthPx=10, density=95) returns -63.89473684210526
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0210 begin`);
      const actual: number = searchInputWidthOf(10, 95);
      logInfo(`searchInputWidthOf(windowWidthPx=10, dens...: actual=${actual}`);
      expect(actual).assertClose(-63.89473684210526, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0210 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0211
     * @tc.name      SearchComponent_SearchInputWidthOf_0211
     * @tc.desc      searchInputWidthOf(windowWidthPx=10, density=105) returns -63.904761904761905
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0211 begin`);
      const actual: number = searchInputWidthOf(10, 105);
      logInfo(`searchInputWidthOf(windowWidthPx=10, dens...: actual=${actual}`);
      expect(actual).assertClose(-63.904761904761905, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0211 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0212
     * @tc.name      SearchComponent_SearchInputWidthOf_0212
     * @tc.desc      searchInputWidthOf(windowWidthPx=10, density=110) returns -63.90909090909091
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0212 begin`);
      const actual: number = searchInputWidthOf(10, 110);
      logInfo(`searchInputWidthOf(windowWidthPx=10, dens...: actual=${actual}`);
      expect(actual).assertClose(-63.90909090909091, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0212 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0213
     * @tc.name      SearchComponent_SearchInputWidthOf_0213
     * @tc.desc      searchInputWidthOf(windowWidthPx=10, density=115) returns -63.91304347826087
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0213 begin`);
      const actual: number = searchInputWidthOf(10, 115);
      logInfo(`searchInputWidthOf(windowWidthPx=10, dens...: actual=${actual}`);
      expect(actual).assertClose(-63.91304347826087, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0213 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0214
     * @tc.name      SearchComponent_SearchInputWidthOf_0214
     * @tc.desc      searchInputWidthOf(windowWidthPx=10, density=187) returns -63.94652406417112
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0214 begin`);
      const actual: number = searchInputWidthOf(10, 187);
      logInfo(`searchInputWidthOf(windowWidthPx=10, dens...: actual=${actual}`);
      expect(actual).assertClose(-63.94652406417112, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0214 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0215
     * @tc.name      SearchComponent_SearchInputWidthOf_0215
     * @tc.desc      searchInputWidthOf(windowWidthPx=96, density=100) returns -63.04
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0215 begin`);
      const actual: number = searchInputWidthOf(96, 100);
      logInfo(`searchInputWidthOf(windowWidthPx=96, dens...: actual=${actual}`);
      expect(actual).assertClose(-63.04, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0215 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0216
     * @tc.name      SearchComponent_SearchInputWidthOf_0216
     * @tc.desc      searchInputWidthOf(windowWidthPx=96, density=15) returns -57.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0216 begin`);
      const actual: number = searchInputWidthOf(96, 15);
      logInfo(`searchInputWidthOf(windowWidthPx=96, dens...: actual=${actual}`);
      expect(actual).assertClose(-57.6, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0216 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0217
     * @tc.name      SearchComponent_SearchInputWidthOf_0217
     * @tc.desc      searchInputWidthOf(windowWidthPx=96, density=25) returns -60.16
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0217 begin`);
      const actual: number = searchInputWidthOf(96, 25);
      logInfo(`searchInputWidthOf(windowWidthPx=96, dens...: actual=${actual}`);
      expect(actual).assertClose(-60.16, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0217 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0218
     * @tc.name      SearchComponent_SearchInputWidthOf_0218
     * @tc.desc      searchInputWidthOf(windowWidthPx=96, density=30) returns -60.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0218 begin`);
      const actual: number = searchInputWidthOf(96, 30);
      logInfo(`searchInputWidthOf(windowWidthPx=96, dens...: actual=${actual}`);
      expect(actual).assertClose(-60.8, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0218 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0219
     * @tc.name      SearchComponent_SearchInputWidthOf_0219
     * @tc.desc      searchInputWidthOf(windowWidthPx=96, density=35) returns -61.25714285714286
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0219 begin`);
      const actual: number = searchInputWidthOf(96, 35);
      logInfo(`searchInputWidthOf(windowWidthPx=96, dens...: actual=${actual}`);
      expect(actual).assertClose(-61.25714285714286, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0219 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0220
     * @tc.name      SearchComponent_SearchInputWidthOf_0220
     * @tc.desc      searchInputWidthOf(windowWidthPx=96, density=40) returns -61.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0220 begin`);
      const actual: number = searchInputWidthOf(96, 40);
      logInfo(`searchInputWidthOf(windowWidthPx=96, dens...: actual=${actual}`);
      expect(actual).assertClose(-61.6, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0220 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0221
     * @tc.name      SearchComponent_SearchInputWidthOf_0221
     * @tc.desc      searchInputWidthOf(windowWidthPx=96, density=45) returns -61.86666666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0221 begin`);
      const actual: number = searchInputWidthOf(96, 45);
      logInfo(`searchInputWidthOf(windowWidthPx=96, dens...: actual=${actual}`);
      expect(actual).assertClose(-61.86666666666667, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0221 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0222
     * @tc.name      SearchComponent_SearchInputWidthOf_0222
     * @tc.desc      searchInputWidthOf(windowWidthPx=96, density=50) returns -62.08
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0222 begin`);
      const actual: number = searchInputWidthOf(96, 50);
      logInfo(`searchInputWidthOf(windowWidthPx=96, dens...: actual=${actual}`);
      expect(actual).assertClose(-62.08, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0222 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0223
     * @tc.name      SearchComponent_SearchInputWidthOf_0223
     * @tc.desc      searchInputWidthOf(windowWidthPx=96, density=55) returns -62.25454545454546
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0223 begin`);
      const actual: number = searchInputWidthOf(96, 55);
      logInfo(`searchInputWidthOf(windowWidthPx=96, dens...: actual=${actual}`);
      expect(actual).assertClose(-62.25454545454546, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0223 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0224
     * @tc.name      SearchComponent_SearchInputWidthOf_0224
     * @tc.desc      searchInputWidthOf(windowWidthPx=96, density=60) returns -62.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0224 begin`);
      const actual: number = searchInputWidthOf(96, 60);
      logInfo(`searchInputWidthOf(windowWidthPx=96, dens...: actual=${actual}`);
      expect(actual).assertClose(-62.4, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0224 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0225
     * @tc.name      SearchComponent_SearchInputWidthOf_0225
     * @tc.desc      searchInputWidthOf(windowWidthPx=96, density=65) returns -62.52307692307692
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0225 begin`);
      const actual: number = searchInputWidthOf(96, 65);
      logInfo(`searchInputWidthOf(windowWidthPx=96, dens...: actual=${actual}`);
      expect(actual).assertClose(-62.52307692307692, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0225 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0226
     * @tc.name      SearchComponent_SearchInputWidthOf_0226
     * @tc.desc      searchInputWidthOf(windowWidthPx=96, density=70) returns -62.628571428571426
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0226 begin`);
      const actual: number = searchInputWidthOf(96, 70);
      logInfo(`searchInputWidthOf(windowWidthPx=96, dens...: actual=${actual}`);
      expect(actual).assertClose(-62.628571428571426, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0226 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0227
     * @tc.name      SearchComponent_SearchInputWidthOf_0227
     * @tc.desc      searchInputWidthOf(windowWidthPx=96, density=75) returns -62.72
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0227 begin`);
      const actual: number = searchInputWidthOf(96, 75);
      logInfo(`searchInputWidthOf(windowWidthPx=96, dens...: actual=${actual}`);
      expect(actual).assertClose(-62.72, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0227 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0228
     * @tc.name      SearchComponent_SearchInputWidthOf_0228
     * @tc.desc      searchInputWidthOf(windowWidthPx=96, density=80) returns -62.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0228 begin`);
      const actual: number = searchInputWidthOf(96, 80);
      logInfo(`searchInputWidthOf(windowWidthPx=96, dens...: actual=${actual}`);
      expect(actual).assertClose(-62.8, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0228 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0229
     * @tc.name      SearchComponent_SearchInputWidthOf_0229
     * @tc.desc      searchInputWidthOf(windowWidthPx=96, density=85) returns -62.870588235294115
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0229 begin`);
      const actual: number = searchInputWidthOf(96, 85);
      logInfo(`searchInputWidthOf(windowWidthPx=96, dens...: actual=${actual}`);
      expect(actual).assertClose(-62.870588235294115, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0229 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0230
     * @tc.name      SearchComponent_SearchInputWidthOf_0230
     * @tc.desc      searchInputWidthOf(windowWidthPx=96, density=90) returns -62.93333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0230 begin`);
      const actual: number = searchInputWidthOf(96, 90);
      logInfo(`searchInputWidthOf(windowWidthPx=96, dens...: actual=${actual}`);
      expect(actual).assertClose(-62.93333333333333, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0230 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0231
     * @tc.name      SearchComponent_SearchInputWidthOf_0231
     * @tc.desc      searchInputWidthOf(windowWidthPx=96, density=95) returns -62.98947368421052
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0231 begin`);
      const actual: number = searchInputWidthOf(96, 95);
      logInfo(`searchInputWidthOf(windowWidthPx=96, dens...: actual=${actual}`);
      expect(actual).assertClose(-62.98947368421052, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0231 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0232
     * @tc.name      SearchComponent_SearchInputWidthOf_0232
     * @tc.desc      searchInputWidthOf(windowWidthPx=96, density=105) returns -63.08571428571429
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0232 begin`);
      const actual: number = searchInputWidthOf(96, 105);
      logInfo(`searchInputWidthOf(windowWidthPx=96, dens...: actual=${actual}`);
      expect(actual).assertClose(-63.08571428571429, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0232 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0233
     * @tc.name      SearchComponent_SearchInputWidthOf_0233
     * @tc.desc      searchInputWidthOf(windowWidthPx=96, density=110) returns -63.127272727272725
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0233 begin`);
      const actual: number = searchInputWidthOf(96, 110);
      logInfo(`searchInputWidthOf(windowWidthPx=96, dens...: actual=${actual}`);
      expect(actual).assertClose(-63.127272727272725, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0233 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0234
     * @tc.name      SearchComponent_SearchInputWidthOf_0234
     * @tc.desc      searchInputWidthOf(windowWidthPx=96, density=115) returns -63.165217391304346
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0234 begin`);
      const actual: number = searchInputWidthOf(96, 115);
      logInfo(`searchInputWidthOf(windowWidthPx=96, dens...: actual=${actual}`);
      expect(actual).assertClose(-63.165217391304346, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0234 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0235
     * @tc.name      SearchComponent_SearchInputWidthOf_0235
     * @tc.desc      searchInputWidthOf(windowWidthPx=96, density=187) returns -63.48663101604278
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0235 begin`);
      const actual: number = searchInputWidthOf(96, 187);
      logInfo(`searchInputWidthOf(windowWidthPx=96, dens...: actual=${actual}`);
      expect(actual).assertClose(-63.48663101604278, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0235 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0236
     * @tc.name      SearchComponent_SearchInputWidthOf_0236
     * @tc.desc      searchInputWidthOf(windowWidthPx=192, density=15) returns -51.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0236 begin`);
      const actual: number = searchInputWidthOf(192, 15);
      logInfo(`searchInputWidthOf(windowWidthPx=192, den...: actual=${actual}`);
      expect(actual).assertClose(-51.2, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0236 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0237
     * @tc.name      SearchComponent_SearchInputWidthOf_0237
     * @tc.desc      searchInputWidthOf(windowWidthPx=192, density=25) returns -56.32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0237 begin`);
      const actual: number = searchInputWidthOf(192, 25);
      logInfo(`searchInputWidthOf(windowWidthPx=192, den...: actual=${actual}`);
      expect(actual).assertClose(-56.32, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0237 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0238
     * @tc.name      SearchComponent_SearchInputWidthOf_0238
     * @tc.desc      searchInputWidthOf(windowWidthPx=192, density=35) returns -58.51428571428571
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0238 begin`);
      const actual: number = searchInputWidthOf(192, 35);
      logInfo(`searchInputWidthOf(windowWidthPx=192, den...: actual=${actual}`);
      expect(actual).assertClose(-58.51428571428571, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0238 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0239
     * @tc.name      SearchComponent_SearchInputWidthOf_0239
     * @tc.desc      searchInputWidthOf(windowWidthPx=192, density=45) returns -59.733333333333334
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0239 begin`);
      const actual: number = searchInputWidthOf(192, 45);
      logInfo(`searchInputWidthOf(windowWidthPx=192, den...: actual=${actual}`);
      expect(actual).assertClose(-59.733333333333334, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0239 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0240
     * @tc.name      SearchComponent_SearchInputWidthOf_0240
     * @tc.desc      searchInputWidthOf(windowWidthPx=192, density=55) returns -60.50909090909091
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0240 begin`);
      const actual: number = searchInputWidthOf(192, 55);
      logInfo(`searchInputWidthOf(windowWidthPx=192, den...: actual=${actual}`);
      expect(actual).assertClose(-60.50909090909091, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0240 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0241
     * @tc.name      SearchComponent_SearchInputWidthOf_0241
     * @tc.desc      searchInputWidthOf(windowWidthPx=192, density=65) returns -61.04615384615384
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0241 begin`);
      const actual: number = searchInputWidthOf(192, 65);
      logInfo(`searchInputWidthOf(windowWidthPx=192, den...: actual=${actual}`);
      expect(actual).assertClose(-61.04615384615384, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0241 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0242
     * @tc.name      SearchComponent_SearchInputWidthOf_0242
     * @tc.desc      searchInputWidthOf(windowWidthPx=192, density=75) returns -61.44
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0242 begin`);
      const actual: number = searchInputWidthOf(192, 75);
      logInfo(`searchInputWidthOf(windowWidthPx=192, den...: actual=${actual}`);
      expect(actual).assertClose(-61.44, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0242 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0243
     * @tc.name      SearchComponent_SearchInputWidthOf_0243
     * @tc.desc      searchInputWidthOf(windowWidthPx=192, density=85) returns -61.741176470588236
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0243 begin`);
      const actual: number = searchInputWidthOf(192, 85);
      logInfo(`searchInputWidthOf(windowWidthPx=192, den...: actual=${actual}`);
      expect(actual).assertClose(-61.741176470588236, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0243 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0244
     * @tc.name      SearchComponent_SearchInputWidthOf_0244
     * @tc.desc      searchInputWidthOf(windowWidthPx=192, density=95) returns -61.97894736842105
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0244 begin`);
      const actual: number = searchInputWidthOf(192, 95);
      logInfo(`searchInputWidthOf(windowWidthPx=192, den...: actual=${actual}`);
      expect(actual).assertClose(-61.97894736842105, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0244 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0245
     * @tc.name      SearchComponent_SearchInputWidthOf_0245
     * @tc.desc      searchInputWidthOf(windowWidthPx=192, density=105) returns -62.17142857142857
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0245 begin`);
      const actual: number = searchInputWidthOf(192, 105);
      logInfo(`searchInputWidthOf(windowWidthPx=192, den...: actual=${actual}`);
      expect(actual).assertClose(-62.17142857142857, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0245 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0246
     * @tc.name      SearchComponent_SearchInputWidthOf_0246
     * @tc.desc      searchInputWidthOf(windowWidthPx=192, density=115) returns -62.3304347826087
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0246 begin`);
      const actual: number = searchInputWidthOf(192, 115);
      logInfo(`searchInputWidthOf(windowWidthPx=192, den...: actual=${actual}`);
      expect(actual).assertClose(-62.3304347826087, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0246 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0247
     * @tc.name      SearchComponent_SearchInputWidthOf_0247
     * @tc.desc      searchInputWidthOf(windowWidthPx=192, density=187) returns -62.973262032085564
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0247 begin`);
      const actual: number = searchInputWidthOf(192, 187);
      logInfo(`searchInputWidthOf(windowWidthPx=192, den...: actual=${actual}`);
      expect(actual).assertClose(-62.973262032085564, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0247 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0248
     * @tc.name      SearchComponent_SearchInputWidthOf_0248
     * @tc.desc      searchInputWidthOf(windowWidthPx=288, density=1) returns 224
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_SearchInputWidthOf_0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0248 begin`);
      const actual: number = searchInputWidthOf(288, 1);
      logInfo(`searchInputWidthOf(windowWidthPx=288, den...: actual=${actual}`);
      expect(actual).assertEqual(224);
      logInfo(`${BUNDLE}SearchInputWidthOf_0248 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0249
     * @tc.name      SearchComponent_SearchInputWidthOf_0249
     * @tc.desc      searchInputWidthOf(windowWidthPx=288, density=100) returns -61.12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0249 begin`);
      const actual: number = searchInputWidthOf(288, 100);
      logInfo(`searchInputWidthOf(windowWidthPx=288, den...: actual=${actual}`);
      expect(actual).assertClose(-61.12, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0249 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0250
     * @tc.name      SearchComponent_SearchInputWidthOf_0250
     * @tc.desc      searchInputWidthOf(windowWidthPx=288, density=5) returns -6.399999999999999
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0250 begin`);
      const actual: number = searchInputWidthOf(288, 5);
      logInfo(`searchInputWidthOf(windowWidthPx=288, den...: actual=${actual}`);
      expect(actual).assertClose(-6.399999999999999, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0250 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0251
     * @tc.name      SearchComponent_SearchInputWidthOf_0251
     * @tc.desc      searchInputWidthOf(windowWidthPx=288, density=25) returns -52.480000000000004
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0251 begin`);
      const actual: number = searchInputWidthOf(288, 25);
      logInfo(`searchInputWidthOf(windowWidthPx=288, den...: actual=${actual}`);
      expect(actual).assertClose(-52.480000000000004, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0251 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0252
     * @tc.name      SearchComponent_SearchInputWidthOf_0252
     * @tc.desc      searchInputWidthOf(windowWidthPx=288, density=35) returns -55.77142857142857
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0252 begin`);
      const actual: number = searchInputWidthOf(288, 35);
      logInfo(`searchInputWidthOf(windowWidthPx=288, den...: actual=${actual}`);
      expect(actual).assertClose(-55.77142857142857, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0252 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0253
     * @tc.name      SearchComponent_SearchInputWidthOf_0253
     * @tc.desc      searchInputWidthOf(windowWidthPx=288, density=50) returns -58.24
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0253 begin`);
      const actual: number = searchInputWidthOf(288, 50);
      logInfo(`searchInputWidthOf(windowWidthPx=288, den...: actual=${actual}`);
      expect(actual).assertClose(-58.24, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0253 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0254
     * @tc.name      SearchComponent_SearchInputWidthOf_0254
     * @tc.desc      searchInputWidthOf(windowWidthPx=288, density=55) returns -58.763636363636365
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0254 begin`);
      const actual: number = searchInputWidthOf(288, 55);
      logInfo(`searchInputWidthOf(windowWidthPx=288, den...: actual=${actual}`);
      expect(actual).assertClose(-58.763636363636365, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0254 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0255
     * @tc.name      SearchComponent_SearchInputWidthOf_0255
     * @tc.desc      searchInputWidthOf(windowWidthPx=288, density=65) returns -59.56923076923077
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0255 begin`);
      const actual: number = searchInputWidthOf(288, 65);
      logInfo(`searchInputWidthOf(windowWidthPx=288, den...: actual=${actual}`);
      expect(actual).assertClose(-59.56923076923077, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0255 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0256
     * @tc.name      SearchComponent_SearchInputWidthOf_0256
     * @tc.desc      searchInputWidthOf(windowWidthPx=288, density=70) returns -59.885714285714286
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0256 begin`);
      const actual: number = searchInputWidthOf(288, 70);
      logInfo(`searchInputWidthOf(windowWidthPx=288, den...: actual=${actual}`);
      expect(actual).assertClose(-59.885714285714286, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0256 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0257
     * @tc.name      SearchComponent_SearchInputWidthOf_0257
     * @tc.desc      searchInputWidthOf(windowWidthPx=288, density=85) returns -60.61176470588235
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0257', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0257 begin`);
      const actual: number = searchInputWidthOf(288, 85);
      logInfo(`searchInputWidthOf(windowWidthPx=288, den...: actual=${actual}`);
      expect(actual).assertClose(-60.61176470588235, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0257 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0258
     * @tc.name      SearchComponent_SearchInputWidthOf_0258
     * @tc.desc      searchInputWidthOf(windowWidthPx=288, density=95) returns -60.96842105263158
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0258', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0258 begin`);
      const actual: number = searchInputWidthOf(288, 95);
      logInfo(`searchInputWidthOf(windowWidthPx=288, den...: actual=${actual}`);
      expect(actual).assertClose(-60.96842105263158, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0258 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0259
     * @tc.name      SearchComponent_SearchInputWidthOf_0259
     * @tc.desc      searchInputWidthOf(windowWidthPx=288, density=110) returns -61.38181818181818
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0259', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0259 begin`);
      const actual: number = searchInputWidthOf(288, 110);
      logInfo(`searchInputWidthOf(windowWidthPx=288, den...: actual=${actual}`);
      expect(actual).assertClose(-61.38181818181818, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0259 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0260
     * @tc.name      SearchComponent_SearchInputWidthOf_0260
     * @tc.desc      searchInputWidthOf(windowWidthPx=288, density=115) returns -61.495652173913044
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0260', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0260 begin`);
      const actual: number = searchInputWidthOf(288, 115);
      logInfo(`searchInputWidthOf(windowWidthPx=288, den...: actual=${actual}`);
      expect(actual).assertClose(-61.495652173913044, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0260 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0261
     * @tc.name      SearchComponent_SearchInputWidthOf_0261
     * @tc.desc      searchInputWidthOf(windowWidthPx=288, density=187) returns -62.45989304812834
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0261', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0261 begin`);
      const actual: number = searchInputWidthOf(288, 187);
      logInfo(`searchInputWidthOf(windowWidthPx=288, den...: actual=${actual}`);
      expect(actual).assertClose(-62.45989304812834, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0261 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0262
     * @tc.name      SearchComponent_SearchInputWidthOf_0262
     * @tc.desc      searchInputWidthOf(windowWidthPx=384, density=25) returns -48.64
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0262', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0262 begin`);
      const actual: number = searchInputWidthOf(384, 25);
      logInfo(`searchInputWidthOf(windowWidthPx=384, den...: actual=${actual}`);
      expect(actual).assertClose(-48.64, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0262 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0263
     * @tc.name      SearchComponent_SearchInputWidthOf_0263
     * @tc.desc      searchInputWidthOf(windowWidthPx=384, density=35) returns -53.028571428571425
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0263', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0263 begin`);
      const actual: number = searchInputWidthOf(384, 35);
      logInfo(`searchInputWidthOf(windowWidthPx=384, den...: actual=${actual}`);
      expect(actual).assertClose(-53.028571428571425, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0263 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0264
     * @tc.name      SearchComponent_SearchInputWidthOf_0264
     * @tc.desc      searchInputWidthOf(windowWidthPx=384, density=45) returns -55.46666666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0264', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0264 begin`);
      const actual: number = searchInputWidthOf(384, 45);
      logInfo(`searchInputWidthOf(windowWidthPx=384, den...: actual=${actual}`);
      expect(actual).assertClose(-55.46666666666667, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0264 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0265
     * @tc.name      SearchComponent_SearchInputWidthOf_0265
     * @tc.desc      searchInputWidthOf(windowWidthPx=384, density=55) returns -57.018181818181816
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0265', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0265 begin`);
      const actual: number = searchInputWidthOf(384, 55);
      logInfo(`searchInputWidthOf(windowWidthPx=384, den...: actual=${actual}`);
      expect(actual).assertClose(-57.018181818181816, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0265 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0266
     * @tc.name      SearchComponent_SearchInputWidthOf_0266
     * @tc.desc      searchInputWidthOf(windowWidthPx=384, density=65) returns -58.09230769230769
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0266', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0266 begin`);
      const actual: number = searchInputWidthOf(384, 65);
      logInfo(`searchInputWidthOf(windowWidthPx=384, den...: actual=${actual}`);
      expect(actual).assertClose(-58.09230769230769, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0266 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0267
     * @tc.name      SearchComponent_SearchInputWidthOf_0267
     * @tc.desc      searchInputWidthOf(windowWidthPx=384, density=75) returns -58.88
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0267', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0267 begin`);
      const actual: number = searchInputWidthOf(384, 75);
      logInfo(`searchInputWidthOf(windowWidthPx=384, den...: actual=${actual}`);
      expect(actual).assertClose(-58.88, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0267 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0268
     * @tc.name      SearchComponent_SearchInputWidthOf_0268
     * @tc.desc      searchInputWidthOf(windowWidthPx=384, density=85) returns -59.48235294117647
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0268', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0268 begin`);
      const actual: number = searchInputWidthOf(384, 85);
      logInfo(`searchInputWidthOf(windowWidthPx=384, den...: actual=${actual}`);
      expect(actual).assertClose(-59.48235294117647, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0268 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0269
     * @tc.name      SearchComponent_SearchInputWidthOf_0269
     * @tc.desc      searchInputWidthOf(windowWidthPx=384, density=95) returns -59.95789473684211
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0269', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0269 begin`);
      const actual: number = searchInputWidthOf(384, 95);
      logInfo(`searchInputWidthOf(windowWidthPx=384, den...: actual=${actual}`);
      expect(actual).assertClose(-59.95789473684211, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0269 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0270
     * @tc.name      SearchComponent_SearchInputWidthOf_0270
     * @tc.desc      searchInputWidthOf(windowWidthPx=384, density=105) returns -60.34285714285714
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0270', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0270 begin`);
      const actual: number = searchInputWidthOf(384, 105);
      logInfo(`searchInputWidthOf(windowWidthPx=384, den...: actual=${actual}`);
      expect(actual).assertClose(-60.34285714285714, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0270 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0271
     * @tc.name      SearchComponent_SearchInputWidthOf_0271
     * @tc.desc      searchInputWidthOf(windowWidthPx=384, density=115) returns -60.66086956521739
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0271', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0271 begin`);
      const actual: number = searchInputWidthOf(384, 115);
      logInfo(`searchInputWidthOf(windowWidthPx=384, den...: actual=${actual}`);
      expect(actual).assertClose(-60.66086956521739, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0271 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0272
     * @tc.name      SearchComponent_SearchInputWidthOf_0272
     * @tc.desc      searchInputWidthOf(windowWidthPx=384, density=187) returns -61.94652406417112
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0272', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0272 begin`);
      const actual: number = searchInputWidthOf(384, 187);
      logInfo(`searchInputWidthOf(windowWidthPx=384, den...: actual=${actual}`);
      expect(actual).assertClose(-61.94652406417112, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0272 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0273
     * @tc.name      SearchComponent_SearchInputWidthOf_0273
     * @tc.desc      searchInputWidthOf(windowWidthPx=480, density=1) returns 416
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_SearchInputWidthOf_0273', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0273 begin`);
      const actual: number = searchInputWidthOf(480, 1);
      logInfo(`searchInputWidthOf(windowWidthPx=480, den...: actual=${actual}`);
      expect(actual).assertEqual(416);
      logInfo(`${BUNDLE}SearchInputWidthOf_0273 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0274
     * @tc.name      SearchComponent_SearchInputWidthOf_0274
     * @tc.desc      searchInputWidthOf(windowWidthPx=480, density=3) returns 96
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0274', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0274 begin`);
      const actual: number = searchInputWidthOf(480, 3);
      logInfo(`searchInputWidthOf(windowWidthPx=480, den...: actual=${actual}`);
      expect(actual).assertEqual(96);
      logInfo(`${BUNDLE}SearchInputWidthOf_0274 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0275
     * @tc.name      SearchComponent_SearchInputWidthOf_0275
     * @tc.desc      searchInputWidthOf(windowWidthPx=480, density=35) returns -50.285714285714285
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0275', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0275 begin`);
      const actual: number = searchInputWidthOf(480, 35);
      logInfo(`searchInputWidthOf(windowWidthPx=480, den...: actual=${actual}`);
      expect(actual).assertClose(-50.285714285714285, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0275 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0276
     * @tc.name      SearchComponent_SearchInputWidthOf_0276
     * @tc.desc      searchInputWidthOf(windowWidthPx=480, density=45) returns -53.333333333333336
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0276', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0276 begin`);
      const actual: number = searchInputWidthOf(480, 45);
      logInfo(`searchInputWidthOf(windowWidthPx=480, den...: actual=${actual}`);
      expect(actual).assertClose(-53.333333333333336, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0276 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0277
     * @tc.name      SearchComponent_SearchInputWidthOf_0277
     * @tc.desc      searchInputWidthOf(windowWidthPx=480, density=55) returns -55.27272727272727
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0277', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0277 begin`);
      const actual: number = searchInputWidthOf(480, 55);
      logInfo(`searchInputWidthOf(windowWidthPx=480, den...: actual=${actual}`);
      expect(actual).assertClose(-55.27272727272727, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0277 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0278
     * @tc.name      SearchComponent_SearchInputWidthOf_0278
     * @tc.desc      searchInputWidthOf(windowWidthPx=480, density=65) returns -56.61538461538461
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0278', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0278 begin`);
      const actual: number = searchInputWidthOf(480, 65);
      logInfo(`searchInputWidthOf(windowWidthPx=480, den...: actual=${actual}`);
      expect(actual).assertClose(-56.61538461538461, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0278 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0279
     * @tc.name      SearchComponent_SearchInputWidthOf_0279
     * @tc.desc      searchInputWidthOf(windowWidthPx=480, density=85) returns -58.35294117647059
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0279', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0279 begin`);
      const actual: number = searchInputWidthOf(480, 85);
      logInfo(`searchInputWidthOf(windowWidthPx=480, den...: actual=${actual}`);
      expect(actual).assertClose(-58.35294117647059, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0279 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0280
     * @tc.name      SearchComponent_SearchInputWidthOf_0280
     * @tc.desc      searchInputWidthOf(windowWidthPx=480, density=90) returns -58.666666666666664
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0280', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0280 begin`);
      const actual: number = searchInputWidthOf(480, 90);
      logInfo(`searchInputWidthOf(windowWidthPx=480, den...: actual=${actual}`);
      expect(actual).assertClose(-58.666666666666664, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0280 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0281
     * @tc.name      SearchComponent_SearchInputWidthOf_0281
     * @tc.desc      searchInputWidthOf(windowWidthPx=480, density=95) returns -58.94736842105263
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0281', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0281 begin`);
      const actual: number = searchInputWidthOf(480, 95);
      logInfo(`searchInputWidthOf(windowWidthPx=480, den...: actual=${actual}`);
      expect(actual).assertClose(-58.94736842105263, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0281 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0282
     * @tc.name      SearchComponent_SearchInputWidthOf_0282
     * @tc.desc      searchInputWidthOf(windowWidthPx=480, density=105) returns -59.42857142857143
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0282', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0282 begin`);
      const actual: number = searchInputWidthOf(480, 105);
      logInfo(`searchInputWidthOf(windowWidthPx=480, den...: actual=${actual}`);
      expect(actual).assertClose(-59.42857142857143, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0282 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0283
     * @tc.name      SearchComponent_SearchInputWidthOf_0283
     * @tc.desc      searchInputWidthOf(windowWidthPx=480, density=110) returns -59.63636363636364
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0283', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0283 begin`);
      const actual: number = searchInputWidthOf(480, 110);
      logInfo(`searchInputWidthOf(windowWidthPx=480, den...: actual=${actual}`);
      expect(actual).assertClose(-59.63636363636364, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0283 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0284
     * @tc.name      SearchComponent_SearchInputWidthOf_0284
     * @tc.desc      searchInputWidthOf(windowWidthPx=480, density=115) returns -59.82608695652174
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0284', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0284 begin`);
      const actual: number = searchInputWidthOf(480, 115);
      logInfo(`searchInputWidthOf(windowWidthPx=480, den...: actual=${actual}`);
      expect(actual).assertClose(-59.82608695652174, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0284 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0285
     * @tc.name      SearchComponent_SearchInputWidthOf_0285
     * @tc.desc      searchInputWidthOf(windowWidthPx=480, density=187) returns -61.4331550802139
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0285', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0285 begin`);
      const actual: number = searchInputWidthOf(480, 187);
      logInfo(`searchInputWidthOf(windowWidthPx=480, den...: actual=${actual}`);
      expect(actual).assertClose(-61.4331550802139, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0285 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0286
     * @tc.name      SearchComponent_SearchInputWidthOf_0286
     * @tc.desc      searchInputWidthOf(windowWidthPx=576, density=1) returns 512
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_SearchInputWidthOf_0286', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0286 begin`);
      const actual: number = searchInputWidthOf(576, 1);
      logInfo(`searchInputWidthOf(windowWidthPx=576, den...: actual=${actual}`);
      expect(actual).assertEqual(512);
      logInfo(`${BUNDLE}SearchInputWidthOf_0286 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0287
     * @tc.name      SearchComponent_SearchInputWidthOf_0287
     * @tc.desc      searchInputWidthOf(windowWidthPx=576, density=5) returns 51.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0287', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0287 begin`);
      const actual: number = searchInputWidthOf(576, 5);
      logInfo(`searchInputWidthOf(windowWidthPx=576, den...: actual=${actual}`);
      expect(actual).assertClose(51.2, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0287 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0288
     * @tc.name      SearchComponent_SearchInputWidthOf_0288
     * @tc.desc      searchInputWidthOf(windowWidthPx=576, density=25) returns -40.96
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0288', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0288 begin`);
      const actual: number = searchInputWidthOf(576, 25);
      logInfo(`searchInputWidthOf(windowWidthPx=576, den...: actual=${actual}`);
      expect(actual).assertClose(-40.96, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0288 end`);
    });
  });
}
