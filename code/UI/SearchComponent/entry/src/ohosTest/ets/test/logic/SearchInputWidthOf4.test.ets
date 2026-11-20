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

/** Logic checks for searchInputWidthOf (61 cases). */
export default function searchInputWidthOf4Test(): void {
  describe('SearchInputWidthOf4Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0289
     * @tc.name      SearchComponent_SearchInputWidthOf_0289
     * @tc.desc      searchInputWidthOf(windowWidthPx=576, density=35) returns -47.542857142857144
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0289', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0289 begin`);
      const actual: number = searchInputWidthOf(576, 35);
      logInfo(`searchInputWidthOf(windowWidthPx=576, den...: actual=${actual}`);
      expect(actual).assertClose(-47.542857142857144, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0289 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0290
     * @tc.name      SearchComponent_SearchInputWidthOf_0290
     * @tc.desc      searchInputWidthOf(windowWidthPx=576, density=55) returns -53.52727272727273
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0290', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0290 begin`);
      const actual: number = searchInputWidthOf(576, 55);
      logInfo(`searchInputWidthOf(windowWidthPx=576, den...: actual=${actual}`);
      expect(actual).assertClose(-53.52727272727273, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0290 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0291
     * @tc.name      SearchComponent_SearchInputWidthOf_0291
     * @tc.desc      searchInputWidthOf(windowWidthPx=576, density=65) returns -55.13846153846154
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0291', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0291 begin`);
      const actual: number = searchInputWidthOf(576, 65);
      logInfo(`searchInputWidthOf(windowWidthPx=576, den...: actual=${actual}`);
      expect(actual).assertClose(-55.13846153846154, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0291 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0292
     * @tc.name      SearchComponent_SearchInputWidthOf_0292
     * @tc.desc      searchInputWidthOf(windowWidthPx=576, density=85) returns -57.22352941176471
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0292', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0292 begin`);
      const actual: number = searchInputWidthOf(576, 85);
      logInfo(`searchInputWidthOf(windowWidthPx=576, den...: actual=${actual}`);
      expect(actual).assertClose(-57.22352941176471, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0292 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0293
     * @tc.name      SearchComponent_SearchInputWidthOf_0293
     * @tc.desc      searchInputWidthOf(windowWidthPx=576, density=95) returns -57.93684210526316
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0293', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0293 begin`);
      const actual: number = searchInputWidthOf(576, 95);
      logInfo(`searchInputWidthOf(windowWidthPx=576, den...: actual=${actual}`);
      expect(actual).assertClose(-57.93684210526316, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0293 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0294
     * @tc.name      SearchComponent_SearchInputWidthOf_0294
     * @tc.desc      searchInputWidthOf(windowWidthPx=576, density=115) returns -58.99130434782609
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0294', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0294 begin`);
      const actual: number = searchInputWidthOf(576, 115);
      logInfo(`searchInputWidthOf(windowWidthPx=576, den...: actual=${actual}`);
      expect(actual).assertClose(-58.99130434782609, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0294 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0295
     * @tc.name      SearchComponent_SearchInputWidthOf_0295
     * @tc.desc      searchInputWidthOf(windowWidthPx=576, density=187) returns -60.919786096256686
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0295', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0295 begin`);
      const actual: number = searchInputWidthOf(576, 187);
      logInfo(`searchInputWidthOf(windowWidthPx=576, den...: actual=${actual}`);
      expect(actual).assertClose(-60.919786096256686, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0295 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0296
     * @tc.name      SearchComponent_SearchInputWidthOf_0296
     * @tc.desc      searchInputWidthOf(windowWidthPx=672, density=1) returns 608
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_SearchInputWidthOf_0296', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0296 begin`);
      const actual: number = searchInputWidthOf(672, 1);
      logInfo(`searchInputWidthOf(windowWidthPx=672, den...: actual=${actual}`);
      expect(actual).assertEqual(608);
      logInfo(`${BUNDLE}SearchInputWidthOf_0296 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0297
     * @tc.name      SearchComponent_SearchInputWidthOf_0297
     * @tc.desc      searchInputWidthOf(windowWidthPx=672, density=2) returns 272
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0297', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0297 begin`);
      const actual: number = searchInputWidthOf(672, 2);
      logInfo(`searchInputWidthOf(windowWidthPx=672, den...: actual=${actual}`);
      expect(actual).assertEqual(272);
      logInfo(`${BUNDLE}SearchInputWidthOf_0297 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0298
     * @tc.name      SearchComponent_SearchInputWidthOf_0298
     * @tc.desc      searchInputWidthOf(windowWidthPx=672, density=3) returns 160
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0298', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0298 begin`);
      const actual: number = searchInputWidthOf(672, 3);
      logInfo(`searchInputWidthOf(windowWidthPx=672, den...: actual=${actual}`);
      expect(actual).assertEqual(160);
      logInfo(`${BUNDLE}SearchInputWidthOf_0298 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0299
     * @tc.name      SearchComponent_SearchInputWidthOf_0299
     * @tc.desc      searchInputWidthOf(windowWidthPx=672, density=10) returns 3.200000000000003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0299', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0299 begin`);
      const actual: number = searchInputWidthOf(672, 10);
      logInfo(`searchInputWidthOf(windowWidthPx=672, den...: actual=${actual}`);
      expect(actual).assertClose(3.200000000000003, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0299 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0300
     * @tc.name      SearchComponent_SearchInputWidthOf_0300
     * @tc.desc      searchInputWidthOf(windowWidthPx=672, density=100) returns -57.28
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0300 begin`);
      const actual: number = searchInputWidthOf(672, 100);
      logInfo(`searchInputWidthOf(windowWidthPx=672, den...: actual=${actual}`);
      expect(actual).assertClose(-57.28, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0300 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0301
     * @tc.name      SearchComponent_SearchInputWidthOf_0301
     * @tc.desc      searchInputWidthOf(windowWidthPx=672, density=5) returns 70.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0301', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0301 begin`);
      const actual: number = searchInputWidthOf(672, 5);
      logInfo(`searchInputWidthOf(windowWidthPx=672, den...: actual=${actual}`);
      expect(actual).assertClose(70.4, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0301 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0302
     * @tc.name      SearchComponent_SearchInputWidthOf_0302
     * @tc.desc      searchInputWidthOf(windowWidthPx=672, density=15) returns -19.200000000000003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0302', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0302 begin`);
      const actual: number = searchInputWidthOf(672, 15);
      logInfo(`searchInputWidthOf(windowWidthPx=672, den...: actual=${actual}`);
      expect(actual).assertClose(-19.200000000000003, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0302 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0303
     * @tc.name      SearchComponent_SearchInputWidthOf_0303
     * @tc.desc      searchInputWidthOf(windowWidthPx=672, density=20) returns -30.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0303', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0303 begin`);
      const actual: number = searchInputWidthOf(672, 20);
      logInfo(`searchInputWidthOf(windowWidthPx=672, den...: actual=${actual}`);
      expect(actual).assertClose(-30.4, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0303 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0304
     * @tc.name      SearchComponent_SearchInputWidthOf_0304
     * @tc.desc      searchInputWidthOf(windowWidthPx=672, density=25) returns -37.120000000000005
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0304', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0304 begin`);
      const actual: number = searchInputWidthOf(672, 25);
      logInfo(`searchInputWidthOf(windowWidthPx=672, den...: actual=${actual}`);
      expect(actual).assertClose(-37.120000000000005, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0304 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0305
     * @tc.name      SearchComponent_SearchInputWidthOf_0305
     * @tc.desc      searchInputWidthOf(windowWidthPx=672, density=30) returns -41.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0305', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0305 begin`);
      const actual: number = searchInputWidthOf(672, 30);
      logInfo(`searchInputWidthOf(windowWidthPx=672, den...: actual=${actual}`);
      expect(actual).assertClose(-41.6, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0305 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0306
     * @tc.name      SearchComponent_SearchInputWidthOf_0306
     * @tc.desc      searchInputWidthOf(windowWidthPx=672, density=40) returns -47.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0306', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0306 begin`);
      const actual: number = searchInputWidthOf(672, 40);
      logInfo(`searchInputWidthOf(windowWidthPx=672, den...: actual=${actual}`);
      expect(actual).assertClose(-47.2, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0306 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0307
     * @tc.name      SearchComponent_SearchInputWidthOf_0307
     * @tc.desc      searchInputWidthOf(windowWidthPx=672, density=45) returns -49.06666666666666
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0307', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0307 begin`);
      const actual: number = searchInputWidthOf(672, 45);
      logInfo(`searchInputWidthOf(windowWidthPx=672, den...: actual=${actual}`);
      expect(actual).assertClose(-49.06666666666666, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0307 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0308
     * @tc.name      SearchComponent_SearchInputWidthOf_0308
     * @tc.desc      searchInputWidthOf(windowWidthPx=672, density=50) returns -50.56
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0308', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0308 begin`);
      const actual: number = searchInputWidthOf(672, 50);
      logInfo(`searchInputWidthOf(windowWidthPx=672, den...: actual=${actual}`);
      expect(actual).assertClose(-50.56, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0308 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0309
     * @tc.name      SearchComponent_SearchInputWidthOf_0309
     * @tc.desc      searchInputWidthOf(windowWidthPx=672, density=55) returns -51.78181818181818
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0309', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0309 begin`);
      const actual: number = searchInputWidthOf(672, 55);
      logInfo(`searchInputWidthOf(windowWidthPx=672, den...: actual=${actual}`);
      expect(actual).assertClose(-51.78181818181818, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0309 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0310
     * @tc.name      SearchComponent_SearchInputWidthOf_0310
     * @tc.desc      searchInputWidthOf(windowWidthPx=672, density=60) returns -52.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0310 begin`);
      const actual: number = searchInputWidthOf(672, 60);
      logInfo(`searchInputWidthOf(windowWidthPx=672, den...: actual=${actual}`);
      expect(actual).assertClose(-52.8, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0310 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0311
     * @tc.name      SearchComponent_SearchInputWidthOf_0311
     * @tc.desc      searchInputWidthOf(windowWidthPx=672, density=65) returns -53.66153846153846
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0311', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0311 begin`);
      const actual: number = searchInputWidthOf(672, 65);
      logInfo(`searchInputWidthOf(windowWidthPx=672, den...: actual=${actual}`);
      expect(actual).assertClose(-53.66153846153846, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0311 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0312
     * @tc.name      SearchComponent_SearchInputWidthOf_0312
     * @tc.desc      searchInputWidthOf(windowWidthPx=672, density=75) returns -55.04
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0312', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0312 begin`);
      const actual: number = searchInputWidthOf(672, 75);
      logInfo(`searchInputWidthOf(windowWidthPx=672, den...: actual=${actual}`);
      expect(actual).assertClose(-55.04, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0312 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0313
     * @tc.name      SearchComponent_SearchInputWidthOf_0313
     * @tc.desc      searchInputWidthOf(windowWidthPx=672, density=80) returns -55.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0313', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0313 begin`);
      const actual: number = searchInputWidthOf(672, 80);
      logInfo(`searchInputWidthOf(windowWidthPx=672, den...: actual=${actual}`);
      expect(actual).assertClose(-55.6, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0313 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0314
     * @tc.name      SearchComponent_SearchInputWidthOf_0314
     * @tc.desc      searchInputWidthOf(windowWidthPx=672, density=85) returns -56.09411764705882
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0314', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0314 begin`);
      const actual: number = searchInputWidthOf(672, 85);
      logInfo(`searchInputWidthOf(windowWidthPx=672, den...: actual=${actual}`);
      expect(actual).assertClose(-56.09411764705882, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0314 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0315
     * @tc.name      SearchComponent_SearchInputWidthOf_0315
     * @tc.desc      searchInputWidthOf(windowWidthPx=672, density=90) returns -56.53333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0315', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0315 begin`);
      const actual: number = searchInputWidthOf(672, 90);
      logInfo(`searchInputWidthOf(windowWidthPx=672, den...: actual=${actual}`);
      expect(actual).assertClose(-56.53333333333333, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0315 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0316
     * @tc.name      SearchComponent_SearchInputWidthOf_0316
     * @tc.desc      searchInputWidthOf(windowWidthPx=672, density=95) returns -56.92631578947368
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0316', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0316 begin`);
      const actual: number = searchInputWidthOf(672, 95);
      logInfo(`searchInputWidthOf(windowWidthPx=672, den...: actual=${actual}`);
      expect(actual).assertClose(-56.92631578947368, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0316 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0317
     * @tc.name      SearchComponent_SearchInputWidthOf_0317
     * @tc.desc      searchInputWidthOf(windowWidthPx=672, density=110) returns -57.89090909090909
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0317', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0317 begin`);
      const actual: number = searchInputWidthOf(672, 110);
      logInfo(`searchInputWidthOf(windowWidthPx=672, den...: actual=${actual}`);
      expect(actual).assertClose(-57.89090909090909, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0317 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0318
     * @tc.name      SearchComponent_SearchInputWidthOf_0318
     * @tc.desc      searchInputWidthOf(windowWidthPx=672, density=115) returns -58.15652173913043
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0318', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0318 begin`);
      const actual: number = searchInputWidthOf(672, 115);
      logInfo(`searchInputWidthOf(windowWidthPx=672, den...: actual=${actual}`);
      expect(actual).assertClose(-58.15652173913043, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0318 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0319
     * @tc.name      SearchComponent_SearchInputWidthOf_0319
     * @tc.desc      searchInputWidthOf(windowWidthPx=672, density=187) returns -60.406417112299465
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0319', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0319 begin`);
      const actual: number = searchInputWidthOf(672, 187);
      logInfo(`searchInputWidthOf(windowWidthPx=672, den...: actual=${actual}`);
      expect(actual).assertClose(-60.406417112299465, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0319 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0320
     * @tc.name      SearchComponent_SearchInputWidthOf_0320
     * @tc.desc      searchInputWidthOf(windowWidthPx=768, density=1) returns 704
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_SearchInputWidthOf_0320', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0320 begin`);
      const actual: number = searchInputWidthOf(768, 1);
      logInfo(`searchInputWidthOf(windowWidthPx=768, den...: actual=${actual}`);
      expect(actual).assertEqual(704);
      logInfo(`${BUNDLE}SearchInputWidthOf_0320 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0321
     * @tc.name      SearchComponent_SearchInputWidthOf_0321
     * @tc.desc      searchInputWidthOf(windowWidthPx=768, density=3) returns 192
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0321', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0321 begin`);
      const actual: number = searchInputWidthOf(768, 3);
      logInfo(`searchInputWidthOf(windowWidthPx=768, den...: actual=${actual}`);
      expect(actual).assertEqual(192);
      logInfo(`${BUNDLE}SearchInputWidthOf_0321 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0322
     * @tc.name      SearchComponent_SearchInputWidthOf_0322
     * @tc.desc      searchInputWidthOf(windowWidthPx=768, density=5) returns 89.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0322', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0322 begin`);
      const actual: number = searchInputWidthOf(768, 5);
      logInfo(`searchInputWidthOf(windowWidthPx=768, den...: actual=${actual}`);
      expect(actual).assertClose(89.6, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0322 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0323
     * @tc.name      SearchComponent_SearchInputWidthOf_0323
     * @tc.desc      searchInputWidthOf(windowWidthPx=768, density=15) returns -12.799999999999997
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0323', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0323 begin`);
      const actual: number = searchInputWidthOf(768, 15);
      logInfo(`searchInputWidthOf(windowWidthPx=768, den...: actual=${actual}`);
      expect(actual).assertClose(-12.799999999999997, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0323 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0324
     * @tc.name      SearchComponent_SearchInputWidthOf_0324
     * @tc.desc      searchInputWidthOf(windowWidthPx=768, density=25) returns -33.28
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0324', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0324 begin`);
      const actual: number = searchInputWidthOf(768, 25);
      logInfo(`searchInputWidthOf(windowWidthPx=768, den...: actual=${actual}`);
      expect(actual).assertClose(-33.28, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0324 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0325
     * @tc.name      SearchComponent_SearchInputWidthOf_0325
     * @tc.desc      searchInputWidthOf(windowWidthPx=768, density=35) returns -42.05714285714286
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0325', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0325 begin`);
      const actual: number = searchInputWidthOf(768, 35);
      logInfo(`searchInputWidthOf(windowWidthPx=768, den...: actual=${actual}`);
      expect(actual).assertClose(-42.05714285714286, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0325 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0326
     * @tc.name      SearchComponent_SearchInputWidthOf_0326
     * @tc.desc      searchInputWidthOf(windowWidthPx=768, density=45) returns -46.93333333333334
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0326', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0326 begin`);
      const actual: number = searchInputWidthOf(768, 45);
      logInfo(`searchInputWidthOf(windowWidthPx=768, den...: actual=${actual}`);
      expect(actual).assertClose(-46.93333333333334, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0326 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0327
     * @tc.name      SearchComponent_SearchInputWidthOf_0327
     * @tc.desc      searchInputWidthOf(windowWidthPx=768, density=55) returns -50.03636363636364
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0327', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0327 begin`);
      const actual: number = searchInputWidthOf(768, 55);
      logInfo(`searchInputWidthOf(windowWidthPx=768, den...: actual=${actual}`);
      expect(actual).assertClose(-50.03636363636364, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0327 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0328
     * @tc.name      SearchComponent_SearchInputWidthOf_0328
     * @tc.desc      searchInputWidthOf(windowWidthPx=768, density=65) returns -52.184615384615384
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0328', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0328 begin`);
      const actual: number = searchInputWidthOf(768, 65);
      logInfo(`searchInputWidthOf(windowWidthPx=768, den...: actual=${actual}`);
      expect(actual).assertClose(-52.184615384615384, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0328 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0329
     * @tc.name      SearchComponent_SearchInputWidthOf_0329
     * @tc.desc      searchInputWidthOf(windowWidthPx=768, density=75) returns -53.76
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0329', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0329 begin`);
      const actual: number = searchInputWidthOf(768, 75);
      logInfo(`searchInputWidthOf(windowWidthPx=768, den...: actual=${actual}`);
      expect(actual).assertClose(-53.76, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0329 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0330
     * @tc.name      SearchComponent_SearchInputWidthOf_0330
     * @tc.desc      searchInputWidthOf(windowWidthPx=768, density=85) returns -54.964705882352945
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0330', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0330 begin`);
      const actual: number = searchInputWidthOf(768, 85);
      logInfo(`searchInputWidthOf(windowWidthPx=768, den...: actual=${actual}`);
      expect(actual).assertClose(-54.964705882352945, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0330 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0331
     * @tc.name      SearchComponent_SearchInputWidthOf_0331
     * @tc.desc      searchInputWidthOf(windowWidthPx=768, density=95) returns -55.915789473684214
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0331', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0331 begin`);
      const actual: number = searchInputWidthOf(768, 95);
      logInfo(`searchInputWidthOf(windowWidthPx=768, den...: actual=${actual}`);
      expect(actual).assertClose(-55.915789473684214, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0331 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0332
     * @tc.name      SearchComponent_SearchInputWidthOf_0332
     * @tc.desc      searchInputWidthOf(windowWidthPx=768, density=105) returns -56.68571428571428
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0332', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0332 begin`);
      const actual: number = searchInputWidthOf(768, 105);
      logInfo(`searchInputWidthOf(windowWidthPx=768, den...: actual=${actual}`);
      expect(actual).assertClose(-56.68571428571428, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0332 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0333
     * @tc.name      SearchComponent_SearchInputWidthOf_0333
     * @tc.desc      searchInputWidthOf(windowWidthPx=768, density=115) returns -57.321739130434786
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0333', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0333 begin`);
      const actual: number = searchInputWidthOf(768, 115);
      logInfo(`searchInputWidthOf(windowWidthPx=768, den...: actual=${actual}`);
      expect(actual).assertClose(-57.321739130434786, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0333 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0334
     * @tc.name      SearchComponent_SearchInputWidthOf_0334
     * @tc.desc      searchInputWidthOf(windowWidthPx=768, density=187) returns -59.893048128342244
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0334', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0334 begin`);
      const actual: number = searchInputWidthOf(768, 187);
      logInfo(`searchInputWidthOf(windowWidthPx=768, den...: actual=${actual}`);
      expect(actual).assertClose(-59.893048128342244, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0334 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0335
     * @tc.name      SearchComponent_SearchInputWidthOf_0335
     * @tc.desc      searchInputWidthOf(windowWidthPx=864, density=1) returns 800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_SearchInputWidthOf_0335', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0335 begin`);
      const actual: number = searchInputWidthOf(864, 1);
      logInfo(`searchInputWidthOf(windowWidthPx=864, den...: actual=${actual}`);
      expect(actual).assertEqual(800);
      logInfo(`${BUNDLE}SearchInputWidthOf_0335 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0336
     * @tc.name      SearchComponent_SearchInputWidthOf_0336
     * @tc.desc      searchInputWidthOf(windowWidthPx=864, density=2) returns 368
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0336', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0336 begin`);
      const actual: number = searchInputWidthOf(864, 2);
      logInfo(`searchInputWidthOf(windowWidthPx=864, den...: actual=${actual}`);
      expect(actual).assertEqual(368);
      logInfo(`${BUNDLE}SearchInputWidthOf_0336 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0337
     * @tc.name      SearchComponent_SearchInputWidthOf_0337
     * @tc.desc      searchInputWidthOf(windowWidthPx=864, density=10) returns 22.400000000000006
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0337', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0337 begin`);
      const actual: number = searchInputWidthOf(864, 10);
      logInfo(`searchInputWidthOf(windowWidthPx=864, den...: actual=${actual}`);
      expect(actual).assertClose(22.400000000000006, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0337 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0338
     * @tc.name      SearchComponent_SearchInputWidthOf_0338
     * @tc.desc      searchInputWidthOf(windowWidthPx=864, density=100) returns -55.36
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0338', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0338 begin`);
      const actual: number = searchInputWidthOf(864, 100);
      logInfo(`searchInputWidthOf(windowWidthPx=864, den...: actual=${actual}`);
      expect(actual).assertClose(-55.36, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0338 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0339
     * @tc.name      SearchComponent_SearchInputWidthOf_0339
     * @tc.desc      searchInputWidthOf(windowWidthPx=864, density=5) returns 108.80000000000001
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0339', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0339 begin`);
      const actual: number = searchInputWidthOf(864, 5);
      logInfo(`searchInputWidthOf(windowWidthPx=864, den...: actual=${actual}`);
      expect(actual).assertClose(108.80000000000001, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0339 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0340
     * @tc.name      SearchComponent_SearchInputWidthOf_0340
     * @tc.desc      searchInputWidthOf(windowWidthPx=864, density=25) returns -29.439999999999998
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0340', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0340 begin`);
      const actual: number = searchInputWidthOf(864, 25);
      logInfo(`searchInputWidthOf(windowWidthPx=864, den...: actual=${actual}`);
      expect(actual).assertClose(-29.439999999999998, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0340 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0341
     * @tc.name      SearchComponent_SearchInputWidthOf_0341
     * @tc.desc      searchInputWidthOf(windowWidthPx=864, density=35) returns -39.31428571428572
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0341', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0341 begin`);
      const actual: number = searchInputWidthOf(864, 35);
      logInfo(`searchInputWidthOf(windowWidthPx=864, den...: actual=${actual}`);
      expect(actual).assertClose(-39.31428571428572, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0341 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0342
     * @tc.name      SearchComponent_SearchInputWidthOf_0342
     * @tc.desc      searchInputWidthOf(windowWidthPx=864, density=50) returns -46.72
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0342', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0342 begin`);
      const actual: number = searchInputWidthOf(864, 50);
      logInfo(`searchInputWidthOf(windowWidthPx=864, den...: actual=${actual}`);
      expect(actual).assertClose(-46.72, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0342 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0343
     * @tc.name      SearchComponent_SearchInputWidthOf_0343
     * @tc.desc      searchInputWidthOf(windowWidthPx=864, density=55) returns -48.29090909090909
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0343', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0343 begin`);
      const actual: number = searchInputWidthOf(864, 55);
      logInfo(`searchInputWidthOf(windowWidthPx=864, den...: actual=${actual}`);
      expect(actual).assertClose(-48.29090909090909, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0343 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0344
     * @tc.name      SearchComponent_SearchInputWidthOf_0344
     * @tc.desc      searchInputWidthOf(windowWidthPx=864, density=65) returns -50.707692307692305
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0344', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0344 begin`);
      const actual: number = searchInputWidthOf(864, 65);
      logInfo(`searchInputWidthOf(windowWidthPx=864, den...: actual=${actual}`);
      expect(actual).assertClose(-50.707692307692305, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0344 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0345
     * @tc.name      SearchComponent_SearchInputWidthOf_0345
     * @tc.desc      searchInputWidthOf(windowWidthPx=864, density=70) returns -51.65714285714286
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0345', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0345 begin`);
      const actual: number = searchInputWidthOf(864, 70);
      logInfo(`searchInputWidthOf(windowWidthPx=864, den...: actual=${actual}`);
      expect(actual).assertClose(-51.65714285714286, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0345 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0346
     * @tc.name      SearchComponent_SearchInputWidthOf_0346
     * @tc.desc      searchInputWidthOf(windowWidthPx=864, density=85) returns -53.83529411764706
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0346', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0346 begin`);
      const actual: number = searchInputWidthOf(864, 85);
      logInfo(`searchInputWidthOf(windowWidthPx=864, den...: actual=${actual}`);
      expect(actual).assertClose(-53.83529411764706, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0346 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0347
     * @tc.name      SearchComponent_SearchInputWidthOf_0347
     * @tc.desc      searchInputWidthOf(windowWidthPx=864, density=95) returns -54.90526315789474
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0347', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0347 begin`);
      const actual: number = searchInputWidthOf(864, 95);
      logInfo(`searchInputWidthOf(windowWidthPx=864, den...: actual=${actual}`);
      expect(actual).assertClose(-54.90526315789474, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0347 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0348
     * @tc.name      SearchComponent_SearchInputWidthOf_0348
     * @tc.desc      searchInputWidthOf(windowWidthPx=864, density=110) returns -56.14545454545455
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0348', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0348 begin`);
      const actual: number = searchInputWidthOf(864, 110);
      logInfo(`searchInputWidthOf(windowWidthPx=864, den...: actual=${actual}`);
      expect(actual).assertClose(-56.14545454545455, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0348 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0349
     * @tc.name      SearchComponent_SearchInputWidthOf_0349
     * @tc.desc      searchInputWidthOf(windowWidthPx=864, density=115) returns -56.48695652173913
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0349', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0349 begin`);
      const actual: number = searchInputWidthOf(864, 115);
      logInfo(`searchInputWidthOf(windowWidthPx=864, den...: actual=${actual}`);
      expect(actual).assertClose(-56.48695652173913, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0349 end`);
    });
  });
}
